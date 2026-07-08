pui = require("neverlose/pui")
CPN = require("neverlose/sec-base64")
clipboard = require("neverlose/clipboard")

math.randomseed(math.floor(globals.realtime * 1000) + globals.framecount)
ffi.cdef("    typedef struct {\n        char pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void* m_pOwner;\n        char pad_0038[4];\n    } CAnimationLayer;\n    \n    typedef struct {\n        float x, y, z;\n    } vec3_t;\n")

script = new_class():struct("references")({
	neverlose = {
		dormant_aimbot = pui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
		dt = pui.find("Aimbot", "Ragebot", "Main", "Double Tap", {
			lag_options = "Lag Options"
		}),
		hs = pui.find("Aimbot", "Ragebot", "Main", "Hide Shots", {
			options = "Options"
		}),
		peek_assist = pui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
		aa_enabled = pui.find("Aimbot", "Ragebot", "Main", "Enabled"),
		pitch = pui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
		yaw = pui.find("Aimbot", "Anti Aim", "Angles", "Yaw", {
			base = "Base",
			offset = "Offset",
			hidden = "Hidden"
		}),
		modifier = pui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", {
			offset = "Offset"
		}),
		body = pui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", {
			right_limit = "Right Limit",
			options = "Options",
			left_limit = "Left Limit",
			inverter = "Inverter",
			freestanding = "Freestanding"
		}),
		freestanding = pui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", {
			body_freestanding = "Body Freestanding",
			disable_modifiers = "Disable Yaw Modifiers"
		}),
		avoid_backstab = pui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
		roll = pui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
		fake_duck = pui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
		slowwalk = pui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
		leg_movement = pui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
		scope_overlay = pui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
		fake_latency = pui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
		air_duck = pui.find("Miscellaneous", "Main", "Movement", "Air Duck", {
			mode = "Mode"
		}),
		hit_chance = pui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
		body_aim = pui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
		safe_points = pui.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
		ensure_hitbox_safety = pui.find("Aimbot", "Ragebot", "Safety", "Ensure Hitbox Safety"),
		auto_stop = pui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Options"),
		dt_auto_stop = pui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Double Tap"),
		head_scale = pui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"),
		body_scale = pui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale"),
		log_events = pui.find("Miscellaneous", "Main", "Other", "Log Events"),
		clan_tag = pui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"),
		settings = pui.find("Settings", "Auto Save"),
		weapon_actions = pui.find("Miscellaneous", "Main", "Other", "Weapon Actions")
	}
}):struct("sidebar")({
	text_length = 0,
	lua_name = "Luasense Beta",
	init = function(arg_1_0)
		arg_1_0.text_length = #arg_1_0.lua_name

		local function var_1_0()
			arg_1_0:render()
		end

		events.render(var_1_0)
	end,
	pulse = function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = globals.realtime * (arg_3_2 or 1) % math.pi
		local var_3_1 = math.sin(var_3_0 + (arg_3_1 or 0))

		return math.abs(var_3_1)
	end,
	render = function(arg_4_0)
		if pui.get_alpha() == 0 then
			return
		end

		local var_4_0 = pui.get_style("Active Text")
		local var_4_1 = pui.get_style("Link Active")
		local var_4_2 = ""

		for iter_4_0 = 1, arg_4_0.text_length do
			local var_4_3 = arg_4_0.lua_name:sub(iter_4_0, iter_4_0)
			local var_4_4 = (iter_4_0 - 1) / arg_4_0.text_length
			local var_4_5 = var_4_1:lerp(var_4_0, arg_4_0:pulse(var_4_4 * 1.5, 1))

			var_4_2 = var_4_2 .. string.format("\a%s%s", var_4_5:to_hex(), var_4_3)
		end

		pui.sidebar(var_4_2, "link")
	end
}):struct("notifications")({
	max_cache_size = 50,
	text_cache_size = 0,
	screen_y = 0,
	cfg = {
		max_visible = 6,
		fade_time = 0.3,
		base_y = 350,
		start_y = -80,
		shadow = 41,
		max_width = 840,
		spacing = 16,
		padding = vector(16, 6)
	},
	notifications = {},
	screen = render.screen_size(),
	text_cache = {},
	cached_colors = {
		shadow_hex = "",
		text_hex = "",
		bg_hex = ""
	},
	init = function(arg_5_0)
		arg_5_0.screen_y = arg_5_0.screen.y / 2 + arg_5_0.cfg.base_y

		local function var_5_0()
			if globals.is_in_game then
				arg_5_0:render()
			else
				arg_5_0.notifications = {}
				arg_5_0.text_cache = {}
				arg_5_0.text_cache_size = 0
				arg_5_0.cached_colors.shadow_hex = ""
			end
		end

		local function var_5_1(arg_7_0)
			events.render(var_5_0, arg_7_0:get())
		end

		arg_5_0.ui.elements.notifications:set_callback(var_5_1, true)
	end,
	lerp = function(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
		return arg_8_1 + (arg_8_2 - arg_8_1) * math.min(arg_8_3, 1)
	end,
	get_hex = function(arg_9_0)
		return arg_9_0.ui.elements.notifications_main_accent:get():to_hex()
	end,
	get_text_size = function(arg_10_0, arg_10_1)
		if not arg_10_0.text_cache[arg_10_1] then
			if arg_10_0.text_cache_size >= arg_10_0.max_cache_size then
				arg_10_0.text_cache = {}
				arg_10_0.text_cache_size = 0
			end

			arg_10_0.text_cache[arg_10_1] = render.measure_text(1, nil, arg_10_1)
			arg_10_0.text_cache_size = arg_10_0.text_cache_size + 1
		end

		return arg_10_0.text_cache[arg_10_1]
	end,
	update_color_cache = function(arg_11_0)
		local var_11_0 = arg_11_0.ui.elements.notifications_shadow_accent:get()
		local var_11_1 = arg_11_0.ui.elements.notifications_bg_accent:get()
		local var_11_2 = arg_11_0.ui.elements.notifications_text_accent:get()
		local var_11_3 = var_11_0:to_hex()
		local var_11_4 = var_11_1:to_hex()
		local var_11_5 = var_11_2:to_hex()

		if var_11_3 ~= arg_11_0.cached_colors.shadow_hex or var_11_4 ~= arg_11_0.cached_colors.bg_hex or var_11_5 ~= arg_11_0.cached_colors.text_hex then
			arg_11_0.cached_colors.shadow = var_11_0
			arg_11_0.cached_colors.bg = var_11_1
			arg_11_0.cached_colors.text = var_11_2
			arg_11_0.cached_colors.shadow_hex = var_11_3
			arg_11_0.cached_colors.bg_hex = var_11_4
			arg_11_0.cached_colors.text_hex = var_11_5
		end
	end,
	push_notify = function(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
		if not globals.is_in_game or not arg_12_0.ui.elements.notifications:get() then
			return
		end

		local var_12_0 = globals.curtime
		local var_12_1 = 0

		for iter_12_0 = 1, #arg_12_0.notifications do
			if not arg_12_0.notifications[iter_12_0].removing then
				var_12_1 = var_12_1 + 1
			end
		end

		if var_12_1 >= arg_12_0.ui.elements.notifications_limit:get() then
			for iter_12_1 = 1, #arg_12_0.notifications do
				local var_12_2 = arg_12_0.notifications[iter_12_1]

				if not var_12_2.removing then
					var_12_2.removing = true

					break
				end
			end
		end

		local var_12_3 = arg_12_0:get_text_size(arg_12_1)
		local var_12_4 = var_12_3.y + arg_12_0.cfg.padding.y * 2

		table.insert(arg_12_0.notifications, {
			alpha = 0,
			removing = false,
			offset = 0,
			text = arg_12_1,
			time = var_12_0,
			duration = arg_12_2 or 3,
			accent = arg_12_3 or arg_12_0.ui.elements.notifications_main_accent:get(),
			y = arg_12_0.screen_y + arg_12_0.cfg.start_y,
			height = var_12_4,
			text_width = var_12_3.x,
			width = math.min(var_12_3.x + arg_12_0.cfg.padding.x * 2, arg_12_0.cfg.max_width)
		})
	end,
	render = function(arg_13_0)
		if #arg_13_0.notifications == 0 then
			return
		end

		local var_13_0 = globals.frametime
		local var_13_1 = globals.curtime
		local var_13_2 = arg_13_0.screen.x
		local var_13_3 = arg_13_0.ui.elements.notifications_speed:get() / 10
		local var_13_4 = arg_13_0.ui.elements.notifications_pos_speed:get() / 10
		local var_13_5 = arg_13_0.ui.elements.notifications_rounding:get()

		arg_13_0:update_color_cache()

		local var_13_6 = arg_13_0.screen_y
		local var_13_7 = 0

		for iter_13_0 = #arg_13_0.notifications, 1, -1 do
			local var_13_8 = arg_13_0.notifications[iter_13_0]
			local var_13_9 = var_13_1 - var_13_8.time

			if not var_13_8.removing then
				if var_13_9 > var_13_8.duration - arg_13_0.cfg.fade_time or var_13_7 >= arg_13_0.cfg.max_visible then
					var_13_8.removing = true
				else
					var_13_8.target_y = var_13_6
					var_13_6 = var_13_6 + var_13_8.height + arg_13_0.cfg.spacing
					var_13_7 = var_13_7 + 1
				end
			end

			if var_13_8.removing then
				var_13_8.offset = arg_13_0:lerp(var_13_8.offset, 100, var_13_0 * var_13_3 * 2)
				var_13_8.alpha = arg_13_0:lerp(var_13_8.alpha, 0, var_13_0 * var_13_3 * 3)
			else
				var_13_8.alpha = arg_13_0:lerp(var_13_8.alpha, 1, var_13_0 * var_13_3 * 3)

				if var_13_8.target_y then
					var_13_8.y = arg_13_0:lerp(var_13_8.y, var_13_8.target_y, var_13_0 * var_13_4)
				end
			end

			if var_13_8.alpha < 0.01 and var_13_8.removing then
				table.remove(arg_13_0.notifications, iter_13_0)
			elseif var_13_8.alpha > 0.01 then
				local var_13_10 = math.floor((var_13_2 - var_13_8.width) * 0.5 + 0.5)
				local var_13_11 = math.floor(var_13_8.y + var_13_8.offset + 0.5)
				local var_13_12 = vector(var_13_10, var_13_11)
				local var_13_13 = vector(var_13_8.width, var_13_8.height)
				local var_13_14 = var_13_8.alpha
				local var_13_15 = var_13_14 * 255
				local var_13_16 = arg_13_0.cached_colors.shadow * var_13_14
				local var_13_17 = arg_13_0.cached_colors.bg:alpha_modulate(var_13_15)
				local var_13_18 = arg_13_0.cached_colors.text:alpha_modulate(var_13_15)

				render.shadow(var_13_12, var_13_12 + var_13_13, var_13_16, arg_13_0.cfg.shadow, 0, var_13_5)
				render.rect(var_13_12, var_13_12 + var_13_13, var_13_17, var_13_5)
				render.text(1, var_13_12 + arg_13_0.cfg.padding, var_13_18, nil, var_13_8.text)
			end
		end
	end
}):struct("presets")({
	init = function(arg_14_0)
		arg_14_0.database = db.luasense_2025_recode or {}
		arg_14_0.system_presets = {
			pui.string("\v•  \rBrandon"),
			pui.string("\v•  \rRxdxyxz"),
			pui.string("\v•  \r3")
		}
		arg_14_0.separator = pui.string("\a{Small Text}───────────────────────────────────────")

		if not arg_14_0.database[pui.string("\v•  \rBrandon")] or #arg_14_0.database == 0 then
			arg_14_0.database[pui.string("\v•  \rBrandon")] = "001[E%b#jspPOIQw=D*.Bye:1Acqh5Sa6^QzE^WnzGA15x>g=Qk(Uwev{%E$A=.b{S@^xVx(!w1%fV]:z*b=6u*?JzCwWE-.(XaZx>qH9z!9A}%6GwRC0-rLwb*E^wNxw0wPDWAvr]+{0Q0)o?!vdsC(N<%Dkab@zdds8vf2!qZJampBhC9Z7IJ^OFofx^2yxcU%88P{l1t1JCk(c4&^^:Cap4{mmmGNyoJj{&x>Ia3S+u9*%7#g+yH}KcK]7&32]Eb&v-2FKB-82lv@2B-%6YXOuU<d)wUi<IDbD=^m/?2O%ex<zxk7<.yD(xQ.MWMV0mhp4F5wK1C5I891q7rzy*Nj(.(ExT@C@M&vpS[WA(8a^0S#}Jy.znj6Oa@PXDao?we3d{zR[@n2?Zy5=UmE{vpB3^kYf}sA@Q62v}---v@hfNzEmG]xj2.-Aa9Q220/K6[)}Yw43tNwwQm{f%7MsY.M4A<xA8sIC4CMkBcDjGcLy[wC0P?Vv/Hv*ax8@(BAv6bbM:OtMqzZAwb*jJB7GA^EYE%uCv+h#B6/M1kCRj%x(pTd@0y..wN//ZU{6*$ToffJb&ArD+^sRY/i!nXv}bH?SuTzS%2z[}lpKCOvC+%pzddI%[[A10By/GizYb=[zUE=zU{oV-xjk=l3BG)@A=hgFwN}pEViiZmwDp6V&jid}Ykp$<zu[fJ01$+!fAK{Vwff80mkjMr6TXa=wNPR3x.#^(7Y.EQzF%SHx>v[C9=.Jna(JXIXxVIyuVPY}UM#msm+$SSkv![S1CcV.=ilgxx(<@W4zVQ$GtU5nPEF!6Fcb=%V1iLj^8ir}Scrf2z2E(G-fm5%x(d?Xy?i&q4dMtAP)&ce1skz!gqZr$rx8*Xz^^<*l&)E3XDQ?B3tcOeXEFi?huj)vZ^XExvrBZ91U*6pk[z]hfFC%=XDj<4z}!/F7=T(x5[d}![/zgV2OxHQzGI^AN}lglfM:&xiVY!i%3O?3k@zb3UIGw<B98Xze8UITj94}nN@-mK3/zc3zmoNZvRk-?f/x1PK48QEdO#fWfC1F&:TO%gfdjdlm*?%Sil9ZsgZx9z2uK-ly4VYSZoXcTy?W:2Cxr$$19!:9BovxWmm4w91cbDtwN)[u4VyI90H1}u0H(TXcBiTYSDhGWwNxanwNPbk/=@)bl(9#ZUMCJ>g6g/N{&mIKclLVJ^Jzh2x*livfiR}fm)F9Y=VA-yBp:Ey9E5pUVTDz0n00*(uVQ5.n]O*{G%tA8wHzC7Bv+s?p&Y]-n*L!]Vh{*5<1LCQrP:y*(bd6PpoX!q[U!={?u47coHD9MI/SO%Ds+t41*?H}3B4A*vj83)00L7YWqY<OByO#wmX$irvzcI{aW!sFgAQ0]!!9jcwIBg9riQCD?Eoz)vpK6Ray-k.RuIR9c(37>>1MePQ7}pKtfN5R3dbT@x2BI90F7j&T88uV?/Jjzw[DII(zhY=0Mh0VB*g%nb^Es}[)uMGA+O@>E}-.kBA)>&0w<6AP-RIvUMk.0jGJY?QhK#<&/Zfho+M}^UP7v(aoZt1Sb#:.v@2K^KI^){P(WKEU(F!CnE}*92rVB#ap]-UqsB]a0jh+xVi<g6n8TH{U5>ZZw&B:Gz6:Zvz5uQ%u9QBkSTMfvK]RrUAT6T&0wTZVS0q=vV86jFeMVwaU(ULxdwLi+w[F7LA$Qk<UAf5(9X]R0hp2[rbNz(6wcsoG<gCHF1st>45{l2WhxRn=amBpKamyruPDARA)&R0iGDGr)al9[lamxgK)&R0u)&R0u)&R03amyrt0uZ+L)&R0u)&R0-8{YR{amyruamyru0ZD5Y<SC7QclJ*w4<hx94?{b%1KW-44g:M(ap/O20r<ORap/O9ap/O9ap*Z903z^{4<hx94<hx94<hx94>E&papUhC?YV&3=P/.Qai#4Pai#4Paj0f$ai#4P06!^K=MyEP=MyEP=MyE$=J26kai#4Pai#4Pai#4Paj1Q6ff^=E.VJcF^bb@/19umua0qTFa0qTF9%y0)2P$iia0qTFa0qTFa0qTtarIZD1%s#}arIZFarHOaa0qTA@#-yaa0qTFa0qT9ao9C.ao9C.ao9C.ao9C.03zj.@#.m.@#.m.@#.m.@@sevao9C.ao9C.ao9C.ao9D9@#.mzfcyio]Aq}jap!G7ap/O9ap/O9ap?&*ZOy&L4<hx94<hx94<hx94<hw!u>mI&ap/O9ap/O9ap!C>)&Sb-4<hx94<hx8)&R1Gamyruamyruamyrua8@4$amz]C)&R0u)&R0u)&Q##amyruamyruamyruamye{arQ4])&R0u)&R04ZPO:<k!<GB4<hx94<hw=^?s$m0W4%/ap/O9ap/O9ap/O93lP=!ap!-24<hx94<hw.ap/BWap/O9ap/O9ap/NX4D!&4Bsnm1amyruamxsO)/.6h%bQKkamyruamxgK)&R0u))3n9)&R0u)&Q##amyru8{YR{amyruamyruk)z?+ap*Z9ap/O99V$$sap!R67*(.O4J=/7ap0D1ap/O9ap/O9ap!QH5=%f^1T1r#4<hx94<hx4))50aap/O9ap[HkaiKl#=Jwn8ai#4Pai#4Pai$8r6&u6$3lNOmaj0f$ai#5K=MyEP=P/.$=itxpai%{e=MyEP=L%5f=MyEP=MyFFkHfN0=fltYBsegwPDB+L=MA-v4*pryapO.(ap!/44<h8Uap/O9ap!-24<hw=Q7nvSu^x&9ap!C{4<hx4)&Sb-4<hw=ff^+:aiTc}=Th.P=MyEP=MyEm1K{$iJBd-@K3y@j=MyEkai#4Paj0f$uYMqPai#4PFfi8RUoh7j=MyEoff^=]yH^Yn+(w<%Bo0A]2P%T24<hjwad}A=ac:It0W0<had<TEad<TEad<TEbP&SUASEnOad1Y7PbPJ+S8vhIwPz<60C0qvamye{amyruamyru0kzqK=MyEP=MyEP=MyEP=J7Ypai#4Pai#4Pai#4Paj5<!=MyEP=MyEP+bmTsuUi.?y&*=f03w$a8>Oj!ahn]j1tp>iaf=aLE{TqPu.nB$akZB$u.mFI0xJERawVvpawTaQawTaQ6D*f]o^Q#U3)ntMPfJ[!kO39<ayul#ayul#1tp)806?5W4)QTFkoJfkkoJfQE/HPQau{#kau{#kau{#kau]&>E)wGakoJgu=MzP$)&R0vamyruamyrualT5Y=KjZ[.xovi4<hx94}2[&Pi@ffad<TEad<TEad<TEad<TE03v*PPi@fKPc6WEPbSn4P8Y$9ad<TEkyT=8aaCwZaaBnjE&<dZE&<dZE&<dZE&<duaaCwZaaCwZaaCwZaaCwZ03uXjE&<dZE&<dZE&<dZC@k%]4EdphBsXJaad(vKPi&ao4*pri@/4ga4/)y/4<hx94<hx94<hx94fXHf4*To*uK[m&ap/O9Fe^@14<hx94<hx94<gfd1%rqQaS{d{)&R0u)&R0n@&vj5@&ZPTamyruamyr])&R0u))3m.)GK^4amxgK)&R0u)&fN{)&R0u)&R2$amDvAz/Pu0u&KOQwNPvYy?2F}2RMDpxw1BfuJKoGo(CgRf:9KuH?}0VCxWFiyUo%muW-5SlVN9/v}V1IC{&-j2i/XwclJxs}mV{50*Vb^A[I?#0Ukts1CNx%2pT80BRwh11KvcemJUehpy@@]vp<6[nm=ju]vUC(zVTJLwNPMTz/cW@CvtD:{KobM8(3+UzJ<XBa{h-=w>c(MzS+CswD/msnkJ(ehuw[XB1WJ!EGfuF3"
		end

		if not arg_14_0.database[pui.string("\v•  \rRxdxyxz")] or #arg_14_0.database == 0 then
			arg_14_0.database[pui.string("\v•  \rRxdxyxz")] = "001@)%b#jspQjzDy5-3UBzkVhB6[@VvqG:]zF5$HVU<Y6x>z6?@SdaZAaJP>jH.:1tx1GYLQJ%yc#e=@BAz8muU<rxxlg#00#(o0B]c5!1(G($xM51!yH}+}[n-8KBnH5/0B&{Cy&r$^uUay(zGG@-%jF+8DRwc>yYtIyv@#BdwQTQrFtaee2sI2XmNp3Fr6+kn?^QICax5zJBj{vm0?PKWp<3!*xN:DiwPKL]U)ie^wnc9[vR/Q@?/B{NEZe#OzdiDZBZY8[D0$]zS6*W?wuHb+41Ov{vrcc<w]zO!BF?Jrw)]*#}/G1xCxm>Ky?rTAlU{gLB7]d:Tz&h>B7GD2%7Mv&B-:IdG5s$d^t1X5l#lPaB94X}1d9>ky2r/nvpJ^SPS6gmmGsd5xLz0*u&t3Pl8Wa<wNPx2awtei14JG#w[!@617<[Vl[[^LW0&CQuUaF7A:YndBor6-P%$i6z/Z15X./?xhzE8(^5z9^vp<7TxK$Q.cZJBg6KILPqYk=OUuz0flMJ%LxAzP<0=O5tw>^h!wGSrx-SBSxe=@iW3<ajqzVsA.wImj#B-WD/uKx}Lz*czly^hZeEX}jh6vmpRBe{=p7zv]Wl]CY4{QhL)0(ewTuU4=bCwXt*wgv4!A^!6aRf3oSzf3bo%1)24fHW-^m!^pVei<@yeMuq4AVn}q9GUut7Gh?q18b}Ge@lYL9*3X[BhN*Y2{fg#.)9#*w=3BN9BJ=aAa9!4wO#16.(Uzwvj?/2CxpUDfMXu<eypqT/=ZR25:9Tf0b??gEYW^cwP@1Wz!9A}eKjFxV!][yy&r/o0axWawNxlZpZfj+zdh)Cx>7H8AkF?&sZ.rS3DQb*1q+.W&pz382vvZpoL4*TEyPXjuW3BeyZ%oCB-G+b3AVRp.Wi<MvSb.)UWIY[uUK4Tv@B{cA@(%J.MT7Tvr=Hcu/#XCT]P)UAL/25?^ZOzwNu=HA+$+:D0+SbDs+rE:GtVfvQS+Z7.DBJ.)6nExjk-^JK}%fxKI:JhM4ZuWBLCHA=i4dwc)Zf[m/cjbugvz6CFx{1iZWe4[n&sT7C^YZcY5jwmPm(107@kweFXR8.-$R5<n%]@W6)uwEbIIy*(jsuVYZ?s].#Fkw:$L.R3am))A)?z/e](hSzP-8T7)RbqI(eUoH?]BT7oLu:vOK3Ay$I0TA2Ea9}Hux(ayY7aP}6[!Izuf)&#hN/JM)E*32Y2NH?CjZ!aI178<gQ/hkDzCz32DJ7ic83V89l09QT=A4h/h:z1!+^n?k2%w!Mv&]VdzswsB4A0e]vRk&WrUblN1S6=z.t$i}Bx.0C7C#gpyEU*QXm[BaAbN+fF]:/0kHs6^kH:C:1j/=<aRF6muUmi^0{:rlDT}y6{aOf/i1CGsVTBpQ4!6Y6uVQ3w4=zwNFAZ(Y0mln+E@5?ox(<G?bjBUS!D9czJT9E=RC)Ieze:r5SuTq2mkV$.f/.N]Esq!$Aa%A7xM%gGWfR1*vrcE6AOU:-PU=V?IY:1z@Twvvvrc6<vRF5yx([R2S1wFwqu9EFeMVwaUYMD+AB%lfzf7?:k?UxCo0p<:lluhrz/klG4t4}jKyrzmS+}$Lz!rO-ZYpwnLtb</5iM#[vf8RO10&wpx>Ia3jGFK6w=Ym=U(RfrnmX+3/S$:W3ExIwwPwqdRm3R(0I*gv.(Ks(zYJ^d5%xa:L#rMG0Z=>&x^oM#x>7{/C8/zoR2Wig5u#jQ.v=7p5CG}/BIAqoxrQUjxapNRUMk.0jG)/Ort8dk3V.!LQFCF{w#wLRRuKgg^6J)!^H^w13p/sM/:dTsh6T[ldStZVCzAg5.w.CmaX%mSaX%mSaX%mSaX%mS03LbYpA-HSpA-HSpA-HSpxhLlaX%mSaX%mSaX%mSaX$uDpA-HSpA-HSpA-jflA+[.zY%3xzY%3xzY%3xyt@hozVNl[a-vu7x-Gq{p:6:2wV]F:@@shu2{xnw6cNq^E<1+k((meE9SNt.aPAO:aPAO:aPAO:aOL)raM1s0aM1s0aM1s0aM0ew?YQ/0?YQ/0?YQ/0?YQ!RaM1s0aM0-WaM1s0aM1s0Ffr.(?YQ/0?YQ/0?YQnF{^9jG@#?uqgbyWwM(=?X4<8e9?YA{v-w5RWa0hy9a0hNr1%j{}pymk(nGS{5acf&aacldX0awVipALStJ#%A8J%Xb]J@Qn.ach2ma8-lta8-lta8.c3zY-)tzY-)tzY-)tzY-($a8-lta8-lta8-lta8-ltFfeXKzY-)tzY-)tzYnfHkTaSUJ#%A8J#%A8KlN*p&SlCraaEO+aaEZA3j[qeaaEQ7a8]atE&<dZBONg7E?!npA=l8g0CC!TacdI8acdI8acdI803vmzK3r1OzY-)tzY-)tzVy>$a8-lta8-lta8-lta8.c3zY-)tzY-)tzY-)tzY-[Fa8-lta8-lta8-lta7$*ykjoOOaci2dP1=B]0Wi5[5B{>=Dflt@9Wb?T]Dw.x(iXXTQ/hkDmq:n83N4:aE/[TMaK75(aKsO9PaBkUE&#GGZC3!BaIP5laISgeaIP5l03G3wa0vf#Pcf:GPcf:GPfKJ>aFf^GaFf^GaEirRP8Z1aaFf^GaFf^GaFf^GaFeSRPcf:GPcf:GPcf:GPcfQ720(3cZAyolZAyp2ZAyn%v.Vx!0KigUZHB@!ZU/4>aPHv0?#zQlaPAO:aPHv00n)/0@#?s:%ki&0@#?tcJ@QrWaM1s05n@YGaM1s0aLlX{aM0jdaM1s0aM1s0Go4G9og*v479MEbaX@Wr03Lc8koS/CpA-HSpA-I^E*vh[aX%mJ2spVcQ9jB#zWl]na-wJm3N6Biz^}#PyT>0Wz.-FIg9HnbqI>.bz6qmSaX$AD1oyQ/v?fZsllLd%uM!kG?^WfJaM1s0aM1s0C}{J1aM0ew?:ezcZAyolZAyolZAyn>aIP5laIP5laIP5laIP5l03G30ZAyo5uM^9aZAyolZKNDwaIP5laIP5laIP5b2NA.SLqaiif^bu@?YQ/=)/jG/v^+C%v^^^{v^^^{aPzN%ZHzK3aPHN6aPAO:aPzA:@#?s:@#?s:%6*E2@#?swl9zA*aM1s05n@YGaM1s003Hew?YQ/0?YQ/0?YQ/0?Va!RaM1s0aM1s0aM1s0aM2Bb?YQ/0?YQ/0?YQRVlc/LbT04A+@#?s:@#?s:@#?swaPAO:aPAO:Q{3O$a-wJx03Mn7zY%3xzY%3xzY%3xzVy@0a-wJxa-xXiaX%mSaX@7HzY}[1pA-HSpA-HSpA-HlaX%mSaX%mSaX%mSaX@Wr03LbYpA-HSpA-HSpA-HSpy5ataX%3q3pp{tzY%3xzZV=Ea-v>d1%ETXa-wJm0rBuZa-wJxa-wJxw1K[zu)bE(@#?s:@#?t-0u?vx10EQ^@#?s:@#?s:@#?swlo=QIaM1s05n@YGaM1s003Hew?YQ/0?YQ/0?YQ/0?Va!RaM1s0aM1s0aM1s0aM2Bb?YQ/0?YQ/0?YQUYlc/JN@#?s:@#?s:%6)Y(fjMVJaPAO:aPAO:v>P0zC$we4K0eyKa-v}Xa-y<zv>W:6zY@}}qE$2.ATcU%wfFYhZAHunZAHt$lxrpZa=[D5Pco*IPcoZN2o/YKa%4[}>olC#WpH:fPd.vWa!K2/a!F)7J%3QTaUK#(aUKyRaUJ*sfcI$(fg7Z^K09s5?YQ?yaM1r)S:(!6uVf&TLo9H4{^YvozEH>4w.wyipxB0Zw:K4fKAkEEp[-uv%7lg&v}x1RA@PYVyHp)/N+oXA1fR*7o(Cg=fCT6Q73PKMCxWFiyXcj80:=1flVN9/+vth*U{YV(2i/Xw+o!tk!4L)Q0*Vb^2xFGB0Ukts1CNx%2pVoNzGPx71Kvcem!!7D4O)U7vp<6[nfqzKwtaCL1"
		end

		if not arg_14_0.database[pui.string("\v•  \r3")] or #arg_14_0.database == 0 then
			arg_14_0.database[pui.string("\v•  \r3")] = ""
		end

		utils.execute_after(0.1, function()
			arg_14_0.ui.elements.preset_input:set("")
			arg_14_0:update()
			arg_14_0.ui.elements.save:set_callback(function()
				arg_14_0:save()
			end)
			arg_14_0.ui.elements.load:set_callback(function()
				arg_14_0:load()
			end)
			arg_14_0.ui.elements.delete:set_callback(function()
				arg_14_0:delete()
			end)
			arg_14_0.ui.elements.export:set_callback(function()
				arg_14_0:export()
			end)
			arg_14_0.ui.elements.import:set_callback(function()
				arg_14_0:import()
			end)
			arg_14_0.ui.elements.preset_list:set_callback(function(arg_21_0)
				arg_14_0:disabler()
				cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)

				local var_21_0 = arg_21_0:get()
				local var_21_1 = arg_21_0:list()[var_21_0]

				if var_21_1 and var_21_1 ~= "" and not arg_14_0:is_separator(var_21_1) then
					local var_21_2 = arg_14_0:clean_name(var_21_1)

					arg_14_0.ui.elements.preset_input:set(var_21_2)
				end
			end)
		end)
		events.shutdown(function()
			db.luasense_2025_recode = arg_14_0.database
		end)
	end,
	get_preset_names = function(arg_23_0)
		local var_23_0 = {}

		for iter_23_0 = #arg_23_0.system_presets, 1, -1 do
			table.insert(var_23_0, 1, arg_23_0.system_presets[iter_23_0])
		end

		for iter_23_1, iter_23_2 in pairs(arg_23_0.database) do
			local var_23_1 = false

			for iter_23_3, iter_23_4 in ipairs(arg_23_0.system_presets) do
				if iter_23_4 == iter_23_1 then
					var_23_1 = true

					break
				end
			end

			if not var_23_1 then
				table.insert(var_23_0, iter_23_1)
			end
		end

		return var_23_0
	end,
	utf8_len = function(arg_24_0, arg_24_1)
		local var_24_0, var_24_1 = arg_24_1:gsub("[^\x80-\xC1]", "")

		return var_24_1
	end,
	clean_name = function(arg_25_0, arg_25_1)
		arg_25_1 = arg_25_1:gsub("[%z\x01-\x1F]", "")
		arg_25_1 = arg_25_1:gsub("{.-}", "")
		arg_25_1 = arg_25_1:gsub("[•✦]", "")
		arg_25_1 = arg_25_1:match("^%s*(.-)%s*$") or ""
		arg_25_1 = arg_25_1:gsub("^DEFAULT", "")
		arg_25_1 = arg_25_1:match("^%s*(.-)%s*$") or ""

		return arg_25_1
	end,
	update = function(arg_26_0)
		local var_26_0 = {}

		for iter_26_0, iter_26_1 in ipairs(arg_26_0.system_presets) do
			var_26_0[iter_26_1] = iter_26_1
		end

		for iter_26_2, iter_26_3 in pairs(arg_26_0.database) do
			if not var_26_0[iter_26_2] then
				var_26_0[iter_26_2] = iter_26_2
			end
		end

		local var_26_1 = {}

		for iter_26_4 in pairs(var_26_0) do
			if not arg_26_0:is_system_preset(iter_26_4) then
				table.insert(var_26_1, iter_26_4)
			end
		end

		table.sort(var_26_1)

		local var_26_2 = {}

		for iter_26_5, iter_26_6 in ipairs(arg_26_0.system_presets) do
			table.insert(var_26_2, iter_26_6)
		end

		if #var_26_1 > 0 then
			table.insert(var_26_2, arg_26_0.separator)
		end

		for iter_26_7, iter_26_8 in ipairs(var_26_1) do
			table.insert(var_26_2, iter_26_8)
		end

		arg_26_0.ui.elements.preset_list:update(var_26_2)
	end,
	is_system_preset = function(arg_27_0, arg_27_1)
		for iter_27_0, iter_27_1 in ipairs(arg_27_0.system_presets) do
			if arg_27_1 == iter_27_1 then
				return true
			end
		end

		return false
	end,
	is_separator = function(arg_28_0, arg_28_1)
		return arg_28_1 == arg_28_0.separator
	end,
	save = function(arg_29_0)
		local var_29_0 = arg_29_0.ui.elements.preset_list:get()
		local var_29_1 = arg_29_0.ui.elements.preset_list:list()[var_29_0]
		local var_29_2 = arg_29_0.ui.elements.preset_input:get()

		if not var_29_2 or var_29_2 == "" then
			arg_29_0.notifications:push_notify(("\a%s  \aDEFAULTInvalid preset name"):format(arg_29_0.notifications:get_hex()), 3.5)
			cvar.playvol:call("ui\\weapon_cant_buy", 1)

			return
		end

		if arg_29_0:utf8_len(var_29_2) < 2 or arg_29_0:utf8_len(var_29_2) > 20 then
			arg_29_0.notifications:push_notify(("\a%s  \aDEFAULTPreset name must be between 2 and 20 characters"):format(arg_29_0.notifications:get_hex()), 3.5)
			cvar.playvol:call("ui\\weapon_cant_buy", 1)

			return
		end

		if not (var_29_2 ~= (var_29_1 and arg_29_0:clean_name(var_29_1) or "")) and arg_29_0:is_system_preset(var_29_1) then
			arg_29_0.notifications:push_notify(("\a%s  \aDEFAULTCannot modify system preset"):format(arg_29_0.notifications:get_hex()), 3.5)
			cvar.playvol:call("ui\\weapon_cant_buy", 1)

			return
		end

		local var_29_3 = pui.setup({
			arg_29_0.ui.elements,
			arg_29_0.ui.builder
		}, true)
		local var_29_4 = CPN.encode(msgpack.pack(var_29_3:save()))

		arg_29_0.database[var_29_2] = var_29_4
		db.luasense_2025_recode = arg_29_0.database

		arg_29_0.notifications:push_notify(("\a%s  \aDEFAULTPreset saved successfully"):format(arg_29_0.notifications:get_hex()), 3.5)
		cvar.playvol:call("ui\\beepclear", 1)
		arg_29_0:update()
	end,
	load = function(arg_30_0)
		local var_30_0 = arg_30_0.ui.elements.preset_list:get()
		local var_30_1 = arg_30_0.ui.elements.preset_list:list()[var_30_0]

		if not var_30_1 or not arg_30_0.database[var_30_1] then
			arg_30_0.notifications:push_notify(("\a%s  \aDEFAULTFailed to load"):format(arg_30_0.notifications:get_hex()), 3.5)
			cvar.playvol:call("ui\\weapon_cant_buy", 1)

			return
		end

		local var_30_2 = pui.setup({
			arg_30_0.ui.elements,
			arg_30_0.ui.builder
		}, true)
		local var_30_3 = CPN.decode(arg_30_0.database[var_30_1])
		local var_30_4 = msgpack.unpack(var_30_3)

		var_30_2:load(var_30_4)
		arg_30_0.notifications:push_notify(("\a%s  \aDEFAULTPreset loaded successfully"):format(arg_30_0.notifications:get_hex()), 3.5)
		cvar.playvol:call("ui\\beepclear", 1)
	end,
	delete = function(arg_31_0)
		local var_31_0 = arg_31_0.ui.elements.preset_list:get()
		local var_31_1 = arg_31_0.ui.elements.preset_list:list()[var_31_0]

		if not var_31_1 or var_31_1 == "" then
			arg_31_0.notifications:push_notify(("\a%s  \aDEFAULTInvalid name"):format(arg_31_0.notifications:get_hex()), 3.5)
			cvar.playvol:call("ui\\weapon_cant_buy", 1)

			return
		end

		if not arg_31_0.database[var_31_1] then
			arg_31_0.notifications:push_notify(("\a%s  \aDEFAULTPreset doesnt exist"):format(arg_31_0.notifications:get_hex()), 3.5)
			cvar.playvol:call("ui\\weapon_cant_buy", 1)

			return
		end

		if arg_31_0:is_system_preset(var_31_1) then
			arg_31_0.notifications:push_notify(("\a%s  \aDEFAULTCannot delete system preset"):format(arg_31_0.notifications:get_hex()), 3.5)
			cvar.playvol:call("ui\\weapon_cant_buy", 1)

			return
		end

		arg_31_0.database[var_31_1] = nil
		db.luasense_2025_recode = arg_31_0.database

		arg_31_0.notifications:push_notify(("\a%s  \aDEFAULTPreset has been deleted"):format(arg_31_0.notifications:get_hex()), 3.5)
		cvar.playvol:call("ui\\beepclear", 1)
		arg_31_0:update()
	end,
	export = function(arg_32_0)
		local var_32_0 = arg_32_0.ui.elements.preset_list:get()
		local var_32_1 = arg_32_0.ui.elements.preset_list:list()[var_32_0]

		if not var_32_1 or not arg_32_0.database[var_32_1] then
			arg_32_0.notifications:push_notify(("\a%s  \aDEFAULTPreset doesnt exist"):format(arg_32_0.notifications:get_hex()), 3.5)
			cvar.playvol:call("ui\\weapon_cant_buy", 1)

			return
		end

		clipboard.set(arg_32_0.database[var_32_1])
		arg_32_0.notifications:push_notify(("\a%s  \aDEFAULTPreset has been exported to clipboard"):format(arg_32_0.notifications:get_hex()), 3.5)
		cvar.playvol:call("ui\\beepclear", 1)
	end,
	import = function(arg_33_0)
		if clipboard.get() == nil then
			arg_33_0.notifications:push_notify(("\a%s  \aDEFAULTClipboard is empty"):format(arg_33_0.notifications:get_hex()), 3.5)
			cvar.playvol:call("ui\\weapon_cant_buy", 1)

			return
		end

		local var_33_0 = arg_33_0.ui.elements.preset_list:get()
		local var_33_1 = arg_33_0.ui.elements.preset_list:list()[var_33_0]

		if arg_33_0:is_system_preset(var_33_1) then
			arg_33_0.notifications:push_notify(("\a%s  \aDEFAULTCannot import to system preset"):format(arg_33_0.notifications:get_hex()), 3.5)
			cvar.playvol:call("ui\\weapon_cant_buy", 1)

			return
		end

		arg_33_0.database[var_33_1] = clipboard.get()
		db.luasense_2025_recode = arg_33_0.database

		arg_33_0.notifications:push_notify(("\a%s  \aDEFAULTImported successfully"):format(arg_33_0.notifications:get_hex()), 3.5)
		cvar.playvol:call("ui\\beepclear", 1)
		arg_33_0:update()
	end,
	disabler = function(arg_34_0)
		local var_34_0 = arg_34_0.ui.elements.preset_list:list()[arg_34_0.ui.elements.preset_list:get()]
		local var_34_1 = {}

		for iter_34_0, iter_34_1 in ipairs(arg_34_0.system_presets) do
			var_34_1[iter_34_1] = true
		end

		local var_34_2 = var_34_1[var_34_0]
		local var_34_3 = var_34_0 == arg_34_0.separator
		local var_34_4 = var_34_2 or var_34_3
		local var_34_5 = var_34_3
		local var_34_6 = arg_34_0.ui.elements

		var_34_6.save:disabled(false)
		var_34_6.delete:disabled(var_34_4)
		var_34_6.import:disabled(var_34_4)
		var_34_6.export:disabled(var_34_4)
		var_34_6.load:disabled(var_34_5)
	end
}):struct("ui")({
	groups = {
		general = pui.create("\v", "General", 1),
		presets = pui.create("\v", "Presets", 2),
		other = pui.create("\v", ""),
		options = pui.create("\v", "General", 1),
		builder = pui.create("\v", "Builder", 2),
		defensive_builder = pui.create("\v", "Defensive Builder"),
		import_export = pui.create("\v", "Builder Configurator"),
		other_general = pui.create("\v", "Movement", 1),
		aimbot = pui.create("\v", "Aimbot", 2),
		visuals = pui.create("\v", "Visuals"),
		other_misc = pui.create("\v", "Other")
	},
	e_teams = {
		"\aD9534FFF•  \rTerrorists",
		"\a4A90E2FF•  \rCounter-Terrorists"
	},
	e_states = {
		"\v•  \rStanding",
		"\v•  \rMoving",
		"\v•  \rSlowwalk",
		"\v•  \rCrouching",
		"\v•  \rMove & Crouch",
		"\v•  \rAir",
		"\v•  \rAir & Crouch",
		"\v•  \rManual",
		"\v•  \rFreestanding",
		"\v•  \rSafe Head",
		"\v•  \rWeapon Swap"
	},
	init = function(arg_35_0)
		loc_35_1_0 = arg_35_0.groups.general
		loc_35_2_0 = arg_35_0.groups.presets
		loc_35_3_0 = arg_35_0.groups.other
		loc_35_4_0 = arg_35_0.groups.options
		loc_35_5_0 = arg_35_0.groups.builder
		loc_35_6_0 = arg_35_0.groups.defensive_builder
		loc_35_7_0 = arg_35_0.groups.visuals
		loc_35_8_0 = arg_35_0.groups.import_export
		loc_35_9_0 = arg_35_0.groups.other_general
		loc_35_10_0 = arg_35_0.groups.aimbot
		loc_35_11_0 = arg_35_0.groups.other_misc
		arg_35_0.elements = {
			username = loc_35_1_0:label("\v  \r" .. common.get_username() .. " \aEB6161FF[BETA]"),
			config_name = loc_35_1_0:label("\t\v»  \rConfig name: \a{Small Text}" .. common.get_config_name() .. ""),
			config_author = loc_35_1_0:label("\t\v»  \rConfig author: \a{Small Text}" .. common.get_config_author() .. ""),
			author_username = loc_35_1_0:label("\v  \rcutegirlgamer \a{Small Text}(Brandon)"),
			author_scripts = loc_35_1_0:label("\t\v»  \rScripts:"),
			luasense = loc_35_1_0:button("Luasense", function()
				cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
				panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://market.neverlose.cc/luasense")
			end, true),
			luasense_beta = loc_35_1_0:button("Luasense Beta", function()
				cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
				panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://market.neverlose.cc/byAMx1")
			end, true),
			author_configs = loc_35_1_0:label("\t\v»  \rGrenade helper:"),
			nade_locations = loc_35_1_0:button("Locations", function()
				cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
				panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://market.neverlose.cc/2umdLR")
			end, true),
			preset_list = loc_35_2_0:list("", {}),
			preset_input = loc_35_2_0:input("", "Config"),
			load = loc_35_2_0:button("    \v    ", nil, true, "Load\n\n\a{Small Text}Loads the selected preset."),
			import = loc_35_2_0:button("    \v    ", nil, true, "Import\n\n\a{Small Text}Imports settings from the clipboard and immediately saves them to the selected preset — no need to press the save button afterward."),
			export = loc_35_2_0:button("    \v    ", nil, true, "Export\n\n\a{Small Text}Exports settings from the selected preset to the clipboard."),
			save = loc_35_2_0:button("    \a4CAF50FF    ", nil, true, "Save\n\n\a{Small Text}Saves the selected preset, or creates a new one if none is selected."),
			delete = loc_35_2_0:button("      \aF44336FF      ", nil, true, "Delete\n\n\a{Small Text}Deletes the selected preset permanently with no way to recover it."),
			discord_label = loc_35_3_0:label("Get help and chat with our community"),
			discord_button = loc_35_3_0:button("\a5865F2FF", nil, true),
			hide_shots = loc_35_4_0:combo("\v•  \rHide Shots  \a{Small Text}", arg_35_0.references.neverlose.hs.options:list()),
			disable_extra_states = loc_35_4_0:selectable("\v•  \rDisable States", "\v•  \rManual", "\v•  \rFreestanding", "\v•  \rWeapon Swap"),
			safe_head = loc_35_4_0:selectable("\v•  \rSafe Head  \a{Small Text}", "\v•  \rStanding", "\v•  \rMoving", "\v•  \rCrouching", "\v•  \rMove & Crouch", "\v•  \rAir & Crouch", "\v•  \rAir & Crouch Knife/Zeus", "\v•  \rCrouch & Knife/Zeus", "\v•  \rMove & Crouch & Knife/Zeus", "\v•  \rSlowwalk"),
			tweaks = loc_35_4_0:selectable("\v•  \rTweaks  \a{Small Text}", "\v•  \rWarmup", "\v•  \rNo Enemies"),
			avoid_backstab = loc_35_4_0:switch("\v•  \rAvoid Backstab  \a{Small Text}"),
			animations = loc_35_4_0:label("\v•  \rAnimations  \a{Small Text}"),
			hotkeys = loc_35_4_0:label("\v•  \rHotkeys  \a{Small Text}"),
			teams = loc_35_5_0:combo("\v•  \rTeam  \a{Small Text}", arg_35_0.e_teams),
			states = loc_35_5_0:combo("\v•  \rState  \a{Small Text}", arg_35_0.e_states),
			watermark = loc_35_7_0:switch("\v•  \rWatermark  \a{Small Text}"),
			notifications = loc_35_7_0:switch("\v•  \rNotifications  \a{Small Text}", true),
			side_indicators = loc_35_7_0:switch("\v•  \rSide Indicators  \a{Small Text}"),
			slowed_down_indicator = loc_35_7_0:switch("\v•  \rSlowed Down Indicator  \a{Small Text}"),
			scope_overlay = loc_35_7_0:switch("\v•  \rCustom Scope Overlay  \a{Small Text}"),
			keep_transparency = loc_35_7_0:switch("\v•  \rKeep Model Transparency  \a{Small Text}"),
			aspect_ratio = loc_35_7_0:label("\v•  \rAspect Ratio  \a{Small Text}"),
			viewmodel = loc_35_7_0:label("\v•  \rViewmodel  \a{Small Text}"),
			manual_arrows = loc_35_7_0:switch("\v•  \rManual Arrows  \a{Small Text}"),
			hitmarkers = loc_35_10_0:selectable("\v•  \rHitmarkers  \a{Small Text}", "\v•  \rScreen", "\v•  \rWorld"),
			unlock_fake_latency = loc_35_10_0:switch("\v•  \rUnlock Fake Latency  \a{Small Text}"),
			magic_key = loc_35_10_0:switch("\v•  \rMagic Key  \a{Small Text}"),
			damage_indicator = loc_35_10_0:switch("\v•  \rDamage Override Indicator  \a{Small Text}"),
			avoid_fall_damage = loc_35_9_0:switch("\v•  \rAvoid Fall Damage  \a{Small Text}"),
			fast_ladder = loc_35_9_0:switch("\v•  \rFast Ladder  \a{Small Text}"),
			avoid_collisions = loc_35_9_0:switch("\v•  \rAvoid Collisions  \a{Small Text}"),
			fake_duck = loc_35_10_0:label("\v•  \rFake Duck  \a{Small Text}"),
			log_events = loc_35_11_0:selectable("\v•  \rLog Events  \a{Small Text}", "\v•  \rAimbot Shots", "\v•  \rPurchases"),
			clan_tag_spammer = loc_35_11_0:switch("\v•  \rClan Tag Spammer  \a{Small Text}")
		}
		loc_35_12_0 = arg_35_0.elements

		loc_35_12_0.avoid_fall_damage:tooltip("Uses trace every tick;\n\nMay impact performance on low-end systems.")

		loc_35_13_0 = loc_35_12_0.tweaks:create()
		loc_35_12_0.tweaks_pitch = loc_35_13_0:combo("\v›  \rPitch", "Disabled", "Down", "Up"):depend(loc_35_12_0.tweaks)
		loc_35_12_0.tweaks_mode = loc_35_13_0:combo("\v›  \rYaw", "Spin", "Distortion"):depend(loc_35_12_0.tweaks)
		loc_35_12_0.tweaks_range = loc_35_13_0:slider("\t\a{Small Text}»  Range", 1, 180, 180, nil, "°"):depend(loc_35_12_0.tweaks)
		loc_35_12_0.tweaks_speed = loc_35_13_0:slider("\t\a{Small Text}»  Speed", 1, 10, 1, nil, "t"):depend(loc_35_12_0.tweaks)
		loc_35_14_0 = loc_35_12_0.animations:create()
		loc_35_12_0.animations_interpolating = loc_35_14_0:slider("\v›  \rInterpolating  \a{Small Text}", 0, 14, 0, nil, function(arg_39_0)
			if arg_39_0 == 0 then
				return "Default"
			elseif arg_39_0 == 9 then
				return "Medium"
			elseif arg_39_0 == 14 then
				return "High"
			else
				return arg_39_0 .. "t"
			end
		end)
		loc_35_12_0.animations_leaning = loc_35_14_0:slider("\v›  \rLeaning  \a{Small Text}", 0, 100, 0, 0.01, function(arg_40_0)
			if arg_40_0 == 0 then
				return "Default"
			elseif arg_40_0 == 35 then
				return "Small"
			elseif arg_40_0 == 50 then
				return "Medium"
			elseif arg_40_0 == 75 then
				return "High"
			elseif arg_40_0 == 100 then
				return "Extreme"
			else
				return arg_40_0 .. "%"
			end
		end)
		loc_35_12_0.animations_earthquake = loc_35_14_0:switch("\t\a{Small Text}»  Earthquake"):depend({
			loc_35_12_0.animations_leaning,
			1,
			100
		})
		loc_35_12_0.animations_falling = loc_35_14_0:slider("\v›  \rFalling  \a{Small Text}", 0, 100, 0, 0.01, function(arg_41_0)
			if arg_41_0 == 0 then
				return "Default"
			elseif arg_41_0 == 50 then
				return "Force"
			elseif arg_41_0 == 100 then
				return "Maximum"
			else
				return arg_41_0 .. "%"
			end
		end)
		loc_35_12_0.animations_jitter_legs = loc_35_14_0:switch("\v›  \rJitter Legs  \a{Small Text}")
		loc_35_15_0 = loc_35_12_0.hotkeys:create()
		loc_35_12_0.hotkeys_freestanding = loc_35_15_0:switch("\v›  \rFreestanding")
		loc_35_12_0.hotkeys_disablers = loc_35_15_0:selectable("\t\a{Small Text}»  Disablers", {
			"\v•  \rStanding",
			"\v•  \rMoving",
			"\v•  \rSlowwalk",
			"\v•  \rCrouching",
			"\v•  \rMove & Crouch",
			"\v•  \rAir",
			"\v•  \rAir & Crouch"
		})
		loc_35_12_0.hotkeys_manual_yaw = loc_35_15_0:combo("\v›  \rManuals", "Disabled", "Left", "Right", "Forward")
		loc_35_16_0 = loc_35_12_0.watermark:create()
		loc_35_12_0.watermark_options = loc_35_16_0:label("\v›  \rOptions"):depend(loc_35_12_0.watermark)
		loc_35_12_0.watermark_button = loc_35_16_0:button("  \aF44336FF  Reset Position  ", nil, true):depend(loc_35_12_0.watermark)
		loc_35_12_0.watermark_x = loc_35_16_0:slider("x", 0, render.screen_size().x, render.screen_size().x / 2):visibility(false)
		loc_35_12_0.watermark_y = loc_35_16_0:slider("y", 0, render.screen_size().y, render.screen_size().y - 20):visibility(false)
		loc_35_12_0.watermark_font = loc_35_16_0:combo("\t\a{Small Text}»  Font", "Default", "Pixel", "Console", "Bold"):depend(loc_35_12_0.watermark)
		loc_35_12_0.watermark_style = loc_35_16_0:combo("\t\a{Small Text}»  Style", "Classic", "Luasync", "Star"):depend(loc_35_12_0.watermark)
		loc_35_12_0.watermark_colors = loc_35_16_0:label("\v›  \rColors"):depend(loc_35_12_0.watermark)
		loc_35_12_0.watermark_button2 = loc_35_16_0:button("  \aF44336FF  Reset  ", nil, true):depend(loc_35_12_0.watermark)
		loc_35_12_0.watermark_main_accent = loc_35_16_0:color_picker("\t\a{Small Text}»  Label", color(255, 255, 255, 255)):depend({
			loc_35_12_0.watermark_style,
			"Classic",
			true
		}, loc_35_12_0.watermark)
		loc_35_12_0.watermark_prefix_accent = loc_35_16_0:color_picker("\t\a{Small Text}»  Prefix", color(150, 200, 60, 255)):depend(loc_35_12_0.watermark)
		loc_35_12_0.watermark_postfix_accent = loc_35_16_0:color_picker("\t\a{Small Text}»  Postfix", color(235, 97, 97, 255)):depend(loc_35_12_0.watermark)

		loc_35_12_0.watermark_button:set_callback(function()
			loc_35_12_0.watermark_x:reset()
			loc_35_12_0.watermark_y:reset()
			cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
		end)
		loc_35_12_0.watermark_button2:set_callback(function()
			loc_35_12_0.watermark_main_accent:reset()
			loc_35_12_0.watermark_prefix_accent:reset()
			loc_35_12_0.watermark_postfix_accent:reset()
			cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
		end)

		loc_35_17_0 = loc_35_12_0.notifications:create()
		loc_35_12_0.notifications_options = loc_35_17_0:label("\v›  \rOptions"):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_button = loc_35_17_0:button("  \aF44336FF  Reset  ", nil, true):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_speed = loc_35_17_0:slider("\t\a{Small Text}»  Speed", 1, 100, 60, nil, "%"):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_pos_speed = loc_35_17_0:slider("\t\a{Small Text}»  Position Speed", 1, 100, 40, nil, "%"):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_limit = loc_35_17_0:slider("\t\a{Small Text}»  Limit", 1, 6, 4):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_rounding = loc_35_17_0:slider("\t\a{Small Text}»  Rounding", 0, 20, 14):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_colors = loc_35_17_0:label("\v›  \rColors"):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_button2 = loc_35_17_0:button("  \aF44336FF  Reset  ", nil, true):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_main_accent = loc_35_17_0:color_picker("\t\a{Small Text}»  Accent", color(150, 200, 60, 255)):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_bg_accent = loc_35_17_0:color_picker("\t\a{Small Text}»  Background", color(22, 22, 22, 255)):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_text_accent = loc_35_17_0:color_picker("\t\a{Small Text}»  Text", color(245, 245, 245, 255)):depend(loc_35_12_0.notifications)
		loc_35_12_0.notifications_shadow_accent = loc_35_17_0:color_picker("\t\a{Small Text}»  Shadow", color(150, 200, 60, 255)):depend(loc_35_12_0.notifications)

		loc_35_12_0.notifications_button:set_callback(function()
			loc_35_12_0.notifications_speed:reset()
			loc_35_12_0.notifications_pos_speed:reset()
			loc_35_12_0.notifications_limit:reset()
			loc_35_12_0.notifications_rounding:reset()
			cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
		end)
		loc_35_12_0.notifications_button2:set_callback(function()
			loc_35_12_0.notifications_main_accent:reset()
			loc_35_12_0.notifications_bg_accent:reset()
			loc_35_12_0.notifications_text_accent:reset()
			loc_35_12_0.notifications_shadow_accent:reset()
			cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
		end)

		loc_35_18_0 = loc_35_12_0.aspect_ratio:create()
		loc_35_12_0.aspect_ratio_label = loc_35_18_0:label("\v  \rChoose a preset or set your ratio.")
		loc_35_12_0.aspect_ratio_slider = loc_35_18_0:slider("", 50, 300, 177, 0.01, function(arg_46_0)
			if arg_46_0 == 177 then
				return "16:9"
			elseif arg_46_0 == 161 then
				return "16:10"
			elseif arg_46_0 == 150 then
				return "3:2"
			elseif arg_46_0 == 133 then
				return "4:3"
			elseif arg_46_0 == 125 then
				return "5:4"
			else
				return tostring(arg_46_0 / 100)
			end
		end)
		loc_35_12_0.aspect_ratio_preset_16_10 = loc_35_18_0:button("  16:10  ", nil, true)
		loc_35_12_0.aspect_ratio_preset_16_9 = loc_35_18_0:button("  16:9  ", nil, true)
		loc_35_12_0.aspect_ratio_preset_5_4 = loc_35_18_0:button("  5:4  ", nil, true)
		loc_35_12_0.aspect_ratio_preset_4_3 = loc_35_18_0:button("  4:3  ", nil, true)
		loc_35_12_0.aspect_ratio_preset_3_2 = loc_35_18_0:button("  3:2  ", nil, true)

		loc_35_12_0.aspect_ratio_preset_16_10:set_callback(function(arg_47_0)
			loc_35_12_0.aspect_ratio_slider:set(161)
			cvar.playvol:call("ui\\beepclear", 1)
		end)
		loc_35_12_0.aspect_ratio_preset_16_9:set_callback(function(arg_48_0)
			loc_35_12_0.aspect_ratio_slider:set(177)
			cvar.playvol:call("ui\\beepclear", 1)
		end)
		loc_35_12_0.aspect_ratio_preset_5_4:set_callback(function(arg_49_0)
			loc_35_12_0.aspect_ratio_slider:set(125)
			cvar.playvol:call("ui\\beepclear", 1)
		end)
		loc_35_12_0.aspect_ratio_preset_4_3:set_callback(function(arg_50_0)
			loc_35_12_0.aspect_ratio_slider:set(133)
			cvar.playvol:call("ui\\beepclear", 1)
		end)
		loc_35_12_0.aspect_ratio_preset_3_2:set_callback(function(arg_51_0)
			loc_35_12_0.aspect_ratio_slider:set(150)
			cvar.playvol:call("ui\\beepclear", 1)
		end)
		loc_35_12_0.aspect_ratio_slider:set_callback(function(arg_52_0)
			cvar.r_aspectratio:float(arg_52_0:get() / 100, true)
			cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
		end, true)
		cvar.r_aspectratio:set_callback(function(arg_53_0)
			if math.abs(arg_53_0:float() - loc_35_12_0.aspect_ratio_slider:get() / 100) < 1e-05 then
				return
			end

			arg_53_0:float(loc_35_12_0.aspect_ratio_slider:get() / 100, true)
		end)

		loc_35_19_0 = loc_35_12_0.viewmodel:create()
		loc_35_12_0.viewmodel_options = loc_35_19_0:label("\v›  \rOptions")
		loc_35_12_0.viewmodel_button = loc_35_19_0:button("  \aF44336FF  Reset  ", nil, true)
		loc_35_12_0.viewmodel_fov = loc_35_19_0:slider("\t\a{Small Text}»  Field of View", -100, 100, 68, 1)
		loc_35_12_0.viewmodel_axis_x = loc_35_19_0:slider("\t\a{Small Text}»  X Axis", -150, 150, 0, 0.1)
		loc_35_12_0.viewmodel_axis_y = loc_35_19_0:slider("\t\a{Small Text}»  Y Axis", -150, 150, 0, 0.1)
		loc_35_12_0.viewmodel_axis_z = loc_35_19_0:slider("\t\a{Small Text}»  Z Axis", -150, 150, 0, 0.1)
		loc_35_12_0.viewmodel_hands = loc_35_19_0:combo("\v›  \rType", "\v•  \rRight", "\v•  \rLeft")
		loc_35_12_0.viewmodel_bob = loc_35_19_0:switch("\v›  \rCS:S Bob Animation")
		loc_35_12_0.viewmodel_lock = loc_35_19_0:switch("\v›  \rLock Bob")

		loc_35_12_0.viewmodel_button:set_callback(function()
			loc_35_12_0.viewmodel_fov:reset()
			loc_35_12_0.viewmodel_axis_x:reset()
			loc_35_12_0.viewmodel_axis_y:reset()
			loc_35_12_0.viewmodel_axis_z:reset()
			cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
		end)
		loc_35_12_0.viewmodel_fov:set_callback(function(arg_55_0)
			cvar.viewmodel_fov:float(arg_55_0:get(), true)
		end, true)
		loc_35_12_0.viewmodel_axis_x:set_callback(function(arg_56_0)
			cvar.viewmodel_offset_x:float(arg_56_0:get() / 10, true)
		end, true)
		loc_35_12_0.viewmodel_axis_y:set_callback(function(arg_57_0)
			cvar.viewmodel_offset_y:float(arg_57_0:get() / 10, true)
		end, true)
		loc_35_12_0.viewmodel_axis_z:set_callback(function(arg_58_0)
			cvar.viewmodel_offset_z:float(arg_58_0:get() / 10, true)
		end, true)
		loc_35_12_0.viewmodel_bob:set_callback(function(arg_59_0)
			cvar.cl_use_new_headbob:int(arg_59_0:get() and 0 or 1)
		end, true)
		loc_35_12_0.viewmodel_lock:set_callback(function(arg_60_0)
			cvar.cl_bob_lower_amt:float(arg_60_0:get() and 5 or 21)
			cvar.cl_bobamt_lat:float(arg_60_0:get() and 0.1 or 0.4)
			cvar.cl_bobamt_vert:float(arg_60_0:get() and 0.1 or 0.25)
			cvar.cl_bobcycle:float(arg_60_0:get() and 2 or 0.98)
		end, true)
		loc_35_12_0.viewmodel_hands:set_callback(function(arg_61_0)
			cvar.cl_righthand:int(arg_61_0:get() == pui.string("\v•  \rLeft") and 0 or 1)
		end, true)
		loc_35_12_0.viewmodel_bob:depend({
			loc_35_12_0.viewmodel_lock,
			false
		})
		loc_35_12_0.viewmodel_lock:depend({
			loc_35_12_0.viewmodel_bob,
			false
		})

		loc_35_20_0 = loc_35_12_0.avoid_collisions:create()
		loc_35_12_0.avoid_collisions_distance = loc_35_20_0:slider("\v›  \rDistance", 1, 16, 8):depend(loc_35_12_0.avoid_collisions)
		loc_35_12_0.avoid_collisions_disable_on_crouch = loc_35_20_0:switch("\v›  \rDisable on Crouch"):depend(loc_35_12_0.avoid_collisions)
		loc_35_21_0 = loc_35_12_0.fake_duck:create()
		loc_35_12_0.fake_duck_speed = loc_35_21_0:switch("\v›  \rUnlock Speed")
		loc_35_12_0.fake_duck_freezetime = loc_35_21_0:switch("\v›  \rOn Freeze Time")
		loc_35_22_0 = loc_35_12_0.side_indicators:create()
		loc_35_12_0.side_indicators_indicators = loc_35_22_0:listable("\v\f<gears>  \rChoose side indicators to be shown.", {
			"PING",
			"Double Tap",
			"Hide Shots",
			"Damage",
			"Hitchance",
			"Fake Duck",
			"Body Aim",
			"Safe Points",
			"Dormant Aimbot",
			"Freestanding",
			"Bomb Info"
		}):depend(loc_35_12_0.side_indicators)
		loc_35_12_0.side_indicators_spectator_list = loc_35_22_0:switch("\v›  \rSpectator List"):depend(loc_35_12_0.side_indicators)
		loc_35_12_0.log_events_accent = loc_35_12_0.log_events:color_picker(color(150, 200, 60, 255)):depend(loc_35_12_0.log_events)
		loc_35_23_0 = loc_35_12_0.scope_overlay:create()
		loc_35_12_0.scope_overlay_options = loc_35_23_0:label("\v›  \rOptions"):depend(loc_35_12_0.scope_overlay)
		loc_35_12_0.scope_overlay_size = loc_35_23_0:slider("\t\a{Small Text}»  Size", 10, 300, 200):depend(loc_35_12_0.scope_overlay)
		loc_35_12_0.scope_overlay_gap = loc_35_23_0:slider("\t\a{Small Text}»  Gap", 1, 300, 10):depend(loc_35_12_0.scope_overlay)
		loc_35_12_0.scope_overlay_rotated = loc_35_23_0:switch("\t\a{Small Text}»  Rotated"):depend(loc_35_12_0.scope_overlay)
		loc_35_12_0.scope_overlay_colors = loc_35_23_0:label("\v›  \rColors"):depend(loc_35_12_0.scope_overlay)
		loc_35_12_0.scope_overlay_main_accent = loc_35_23_0:color_picker("\t\a{Small Text}»  Main", color(255, 255, 255, 160)):depend(loc_35_12_0.scope_overlay)
		loc_35_12_0.scope_overlay_edge_accent = loc_35_23_0:color_picker("\t\a{Small Text}»  Edge", color(0, 0, 0, 0)):depend(loc_35_12_0.scope_overlay)
		loc_35_24_0 = loc_35_12_0.hitmarkers:create()
		loc_35_12_0.hitmarkers_screen_label = loc_35_24_0:label("\v›  \rScreen"):depend({
			loc_35_12_0.hitmarkers,
			pui.string("\v•  \rScreen")
		})
		loc_35_12_0.hitmarkers_screen_accent = loc_35_24_0:color_picker("\t\a{Small Text}»  Accent", color()):depend({
			loc_35_12_0.hitmarkers,
			pui.string("\v•  \rScreen")
		})
		loc_35_12_0.hitmarkers_screen_duration = loc_35_24_0:slider("\t\a{Small Text}»  Duration", 1, 20, 1, nil, function(arg_62_0)
			return arg_62_0 * 0.5 .. "s"
		end):depend({
			loc_35_12_0.hitmarkers,
			pui.string("\v•  \rScreen")
		})
		loc_35_12_0.hitmarkers_world_label = loc_35_24_0:label("\v›  \rWorld"):depend({
			loc_35_12_0.hitmarkers,
			pui.string("\v•  \rWorld")
		})
		loc_35_12_0.hitmarkers_world_accent = loc_35_24_0:color_picker("\t\a{Small Text}»  Accent ", {
			Simple = {
				color(255, 0, 0, 155)
			},
			Double = {
				color(0, 255, 255, 255),
				color(0, 255, 0, 255)
			}
		}):depend({
			loc_35_12_0.hitmarkers,
			pui.string("\v•  \rWorld")
		})
		loc_35_12_0.hitmarkers_world_duration = loc_35_24_0:slider("\t\a{Small Text}»  Duration ", 1, 20, 1, nil, function(arg_63_0)
			return arg_63_0 * 0.5 .. "s"
		end):depend({
			loc_35_12_0.hitmarkers,
			pui.string("\v•  \rWorld")
		})
		loc_35_25_0 = loc_35_12_0.slowed_down_indicator:create()
		loc_35_12_0.slowed_down_x = loc_35_25_0:slider("x", 0, render.screen_size().x, render.screen_size().x / 2):visibility(false)
		loc_35_12_0.slowed_down_y = loc_35_25_0:slider("y", 0, render.screen_size().y, render.screen_size().y * 0.25):visibility(false)
		loc_35_12_0.slowed_down_accent = loc_35_12_0.slowed_down_indicator:color_picker(color(150, 200, 60, 255)):depend(loc_35_12_0.slowed_down_indicator)
		loc_35_26_0 = loc_35_12_0.manual_arrows:create()
		loc_35_12_0.manaul_arrows_yaw_accent = loc_35_26_0:color_picker("\v›  \rYaw Accent", color(175, 255, 0, 255)):depend(loc_35_12_0.manual_arrows)
		loc_35_12_0.manaul_arrows_body_accent = loc_35_26_0:color_picker("\v›  \rBody Accent", color(0, 200, 255, 255)):depend(loc_35_12_0.manual_arrows)

		loc_35_12_0.unlock_fake_latency:set_callback(function(arg_64_0)
			cvar.sv_maxunlag:float(arg_64_0:get() and 0.4 or 0.2)
		end, true)
		loc_35_12_0.avoid_backstab:set_callback(function(arg_65_0)
			arg_35_0.references.neverlose.avoid_backstab:set(arg_65_0:get())
		end, true)

		loc_35_12_0.quick_throw = arg_35_0.references.neverlose.settings:create():switch("\v✱  \rQuick Throw")
		arg_35_0.builder = {}
		arg_35_0.builder.force_break_lc = loc_35_6_0:selectable("\v•  \rForce on", arg_35_0.e_states)

		for iter_35_0, iter_35_1 in ipairs(arg_35_0.e_states) do
			arg_35_0.builder[iter_35_0] = {}

			for iter_35_2, iter_35_3 in ipairs(arg_35_0.e_teams) do
				arg_35_0.builder[iter_35_0][iter_35_2] = {}
				loc_35_37_0 = loc_35_12_0.states
				loc_35_38_0 = loc_35_12_0.teams
				arg_35_0.builder[iter_35_0][iter_35_2].yaw_mode = loc_35_5_0:combo("\v  \rYaw", "1-Way", "2-Way"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					loc_35_37_0,
					function(arg_66_0)
						return arg_66_0.value ~= pui.string("\v•  \rManual")
					end
				})
				loc_35_39_4 = arg_35_0.builder[iter_35_0][iter_35_2].yaw_mode:create()
				arg_35_0.builder[iter_35_0][iter_35_2].delay_legacy = loc_35_39_4:switch("Legacy Mode"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				})
				arg_35_0.builder[iter_35_0][iter_35_2].yaw_offset = loc_35_39_4:slider("\v›  \rOffset", -180, 180, 0, nil, "°"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].yaw_mode,
					"1-Way"
				})
				arg_35_0.builder[iter_35_0][iter_35_2].left_offset = loc_35_39_4:slider("\v›  \rLeft Offset", -180, 180, 0, nil, "°"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].yaw_mode,
					"2-Way"
				})
				arg_35_0.builder[iter_35_0][iter_35_2].right_offset = loc_35_39_4:slider("\v›  \rRight Offset", -180, 180, 0, nil, "°"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].yaw_mode,
					"2-Way"
				})
				arg_35_0.builder[iter_35_0][iter_35_2].variability = loc_35_39_4:slider("\t\a{Small Text}»  Variability", 0, 100, 0, nil, "%"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				})
				arg_35_0.builder[iter_35_0][iter_35_2].delay = loc_35_39_4:slider("\v›  \rDelay", 1, 20, 1, nil, function(arg_67_0)
					if arg_67_0 == 1 then
						return "Off"
					else
						return arg_67_0 .. "t"
					end
				end):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].yaw_mode,
					"2-Way"
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].delay_legacy,
					false
				})
				arg_35_0.builder[iter_35_0][iter_35_2].delay_variability = loc_35_39_4:slider("\t\a{Small Text}»  Variability ", 0, 100, 0, nil, "%"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].yaw_mode,
					"2-Way"
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].delay,
					2,
					20
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].delay_legacy,
					false
				})
				arg_35_0.builder[iter_35_0][iter_35_2].delay_sliders = loc_35_39_4:slider("\v✱  \rDelay Ways", 2, 8, 2):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].yaw_mode,
					"2-Way"
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].delay,
					2,
					20
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].delay_legacy,
					true
				})

				for iter_35_4 = 1, 8 do
					loc_35_44_1 = string.format("\t\a{Small Text}»  [%d] \aFFFFFF00(%d:%d)", iter_35_4, iter_35_0, iter_35_2)
					arg_35_0.builder[iter_35_0][iter_35_2]["delay_" .. iter_35_4] = loc_35_39_4:slider(loc_35_44_1, 1, 20, 2, nil, "t"):depend({
						loc_35_37_0,
						iter_35_1
					}, {
						loc_35_38_0,
						iter_35_3
					}, {
						arg_35_0.builder[iter_35_0][iter_35_2].yaw_mode,
						"2-Way"
					}, {
						arg_35_0.builder[iter_35_0][iter_35_2].delay_sliders,
						function()
							return iter_35_4 <= arg_35_0.builder[iter_35_0][iter_35_2].delay_sliders:get()
						end
					}, {
						arg_35_0.builder[iter_35_0][iter_35_2].delay,
						2,
						20
					}, {
						arg_35_0.builder[iter_35_0][iter_35_2].delay_legacy,
						true
					})
				end

				arg_35_0.builder[iter_35_0][iter_35_2].variability:tooltip("Automatically generates optimal patterns.\n\nHigher — more unpredictable.\n\n\a{Small Text}Replaces outdated multi slider config with smart distribution algorithm.")
				arg_35_0.builder[iter_35_0][iter_35_2].delay_variability:tooltip("Automatically generates optimal patterns.\n\nHigher — more unpredictable.\n\n\a{Small Text}Replaces outdated multi slider config with smart distribution algorithm.")

				arg_35_0.builder[iter_35_0][iter_35_2].modifier = loc_35_5_0:combo("\v  \rModifier", "Disabled", "Offset", "Center", "Random", "Spin", "3-Way", "5-Way"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				})
				loc_35_39_3 = arg_35_0.builder[iter_35_0][iter_35_2].modifier:create()
				arg_35_0.builder[iter_35_0][iter_35_2].modifier_offset = loc_35_39_3:slider("\v›  \rOffset", -180, 180, 0, nil, "°"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].modifier,
					"Disabled",
					true
				})
				arg_35_0.builder[iter_35_0][iter_35_2].modifier_variability = loc_35_39_3:slider("\t\a{Small Text}»  Variability", 0, 100, 0, nil, "%"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].modifier,
					"Disabled",
					true
				})

				arg_35_0.builder[iter_35_0][iter_35_2].modifier_variability:tooltip("Automatically generates optimal patterns.\n\nHigher — more unpredictable.\n\n\a{Small Text}Replaces outdated multi slider config with smart distribution algorithm.")

				arg_35_0.builder[iter_35_0][iter_35_2].body = loc_35_5_0:switch("\v  \rBody"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				})
				loc_35_39_2 = arg_35_0.builder[iter_35_0][iter_35_2].body:create()
				arg_35_0.builder[iter_35_0][iter_35_2].body_label = loc_35_39_2:label("\v›  \rBody"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)
				arg_35_0.builder[iter_35_0][iter_35_2].body_delay = loc_35_39_2:slider("\t\a{Small Text}»  Switch Delay", 0, 20, 0, nil, function(arg_69_0)
					if arg_69_0 == 0 then
						return "Off"
					else
						return arg_69_0 .. "t"
					end
				end):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)
				arg_35_0.builder[iter_35_0][iter_35_2].body_variability = loc_35_39_2:slider("\t\a{Small Text}»  Variability", 0, 100, 0, nil, "%"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].body_delay,
					1,
					20
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)

				arg_35_0.builder[iter_35_0][iter_35_2].body_variability:tooltip("Automatically generates optimal patterns.\n\nHigher — more unpredictable.\n\n\a{Small Text}Replaces outdated multi slider config with smart distribution algorithm.")

				arg_35_0.builder[iter_35_0][iter_35_2].body_freestanding = loc_35_39_2:combo("\t\a{Small Text}»  Freestanding", "Off", "Default", "Reversed"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)
				arg_35_0.builder[iter_35_0][iter_35_2].limit_label = loc_35_39_2:label("\v›  \rLimit"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)
				arg_35_0.builder[iter_35_0][iter_35_2].limit_delay = loc_35_39_2:slider("\t\a{Small Text}»  Delay", 0, 20, 0, nil, function(arg_70_0)
					if arg_70_0 == 0 then
						return "Off"
					else
						return arg_70_0 .. "t"
					end
				end):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)
				arg_35_0.builder[iter_35_0][iter_35_2].limit_left = loc_35_39_2:slider("\t\a{Small Text}»  Left", 0, 60, 60, nil, "°"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].limit_delay,
					0
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)
				arg_35_0.builder[iter_35_0][iter_35_2].limit_right = loc_35_39_2:slider("\t\a{Small Text}»  Right", 0, 60, 60, nil, "°"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].limit_delay,
					0
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)
				arg_35_0.builder[iter_35_0][iter_35_2].limit_variability = loc_35_39_2:slider("\t\a{Small Text}»  Variability ", 0, 100, 0, nil, "%"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)

				arg_35_0.builder[iter_35_0][iter_35_2].limit_variability:tooltip("Automatically generates optimal patterns.\n\nHigher — more unpredictable.\n\n\a{Small Text}Replaces outdated multi slider config with smart distribution algorithm.")

				arg_35_0.builder[iter_35_0][iter_35_2].limit_leftright = loc_35_39_2:slider("\t\a{Small Text}»  L&R [1]", 0, 60, 30, nil, "°"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].limit_delay,
					1,
					20
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)
				arg_35_0.builder[iter_35_0][iter_35_2].limit_leftright2 = loc_35_39_2:slider("\t\a{Small Text}»  L&R [2]", 0, 60, 60, nil, "°"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].limit_delay,
					1,
					20
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)
				arg_35_0.builder[iter_35_0][iter_35_2].body_options = loc_35_39_2:selectable("\v›  \rOptions", arg_35_0.references.neverlose.body.options:list()):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, arg_35_0.builder[iter_35_0][iter_35_2].body)
				arg_35_0.builder[iter_35_0][iter_35_2].rotated = loc_35_5_0:combo("\v  \rRotated", {
					"Static",
					"Jitter"
				}):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					loc_35_37_0,
					function(arg_71_0)
						return arg_71_0.value == pui.string("\v•  \rFreestanding")
					end
				})
				loc_35_39_1 = arg_35_0.builder[iter_35_0][iter_35_2].rotated:create()
				arg_35_0.builder[iter_35_0][iter_35_2].send = loc_35_5_0:button("   \v \rSend to the opposite side   ", function()
					local var_72_0 = iter_35_2 == 1 and 2 or 1
					local var_72_1 = pui.setup({
						arg_35_0.ui.builder[iter_35_0][iter_35_2]
					}, true):save()

					pui.setup({
						arg_35_0.ui.builder[iter_35_0][var_72_0]
					}, true):load(var_72_1)
					arg_35_0.notifications:push_notify(("\a%s  \a%sSuccessfully \aDEFAULTsent settings to the \a%sopposite \aDEFAULTteam."):format(arg_35_0.notifications:get_hex(), arg_35_0.notifications:get_hex(), arg_35_0.notifications:get_hex()), 3.5)
					cvar.playvol:call("ui\\beepclear", 1)
				end, true):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}):tooltip("Sends builder and defensive settings to the opposite team.")
				arg_35_0.builder[iter_35_0][iter_35_2].copy = loc_35_5_0:button(" \v ", function()
					local var_73_0 = pui.setup({
						arg_35_0.ui.builder[iter_35_0][iter_35_2]
					}, true)
					local var_73_1 = CPN.encode(msgpack.pack(var_73_0:save()))

					clipboard.set(var_73_1)
					arg_35_0.notifications:push_notify(("\a%s  \aDEFAULTSettings \a%scopied \aDEFAULTto clipboard \a%ssuccessfully\aDEFAULT!"):format(arg_35_0.notifications:get_hex(), arg_35_0.notifications:get_hex(), arg_35_0.notifications:get_hex()), 3.5)
					cvar.playvol:call("ui\\beepclear", 1)
				end, true):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}):tooltip("Copies builder and defensive settings to the clipboard.")
				arg_35_0.builder[iter_35_0][iter_35_2].paste = loc_35_5_0:button(" \v ", function()
					local var_74_0 = pui.setup({
						arg_35_0.ui.builder[iter_35_0][iter_35_2]
					}, true)
					local var_74_1 = CPN.decode(clipboard.get())
					local var_74_2 = msgpack.unpack(var_74_1)

					var_74_0:load(var_74_2)
					arg_35_0.notifications:push_notify(("\a%s  \aDEFAULTSettings \a%spasted \aDEFAULTfrom clipboard \a%ssuccessfully\aDEFAULT!"):format(arg_35_0.notifications:get_hex(), arg_35_0.notifications:get_hex(), arg_35_0.notifications:get_hex()), 3.5)
					cvar.playvol:call("ui\\beepclear", 1)
				end, true):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}):tooltip("Pastes builder and defensive settings from the clipboard.")
				arg_35_0.builder[iter_35_0][iter_35_2].preset_names = {}
				arg_35_0.builder[iter_35_0][iter_35_2].take_from_preset = loc_35_8_0:combo("\v•  \rFrom Preset", arg_35_0.builder[iter_35_0][iter_35_2].preset_names):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				})

				arg_35_0.builder[iter_35_0][iter_35_2].take_from_preset:set_callback(function(arg_75_0)
					table.insert(arg_35_0.builder[iter_35_0][iter_35_2].preset_names, arg_35_0.presets:get_preset_names())
					arg_75_0:update(arg_35_0.presets:get_preset_names())
				end, true)

				arg_35_0.builder[iter_35_0][iter_35_2].take_from_team = loc_35_8_0:combo("\v•  \rFrom Team", arg_35_0.e_teams):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				})
				arg_35_0.builder[iter_35_0][iter_35_2].take_from_state = loc_35_8_0:combo("\v•  \rFrom State", arg_35_0.e_states):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				})
				arg_35_0.builder[iter_35_0][iter_35_2].apply = loc_35_8_0:button("   \v  \rApply   ", function()
					loc_76_0_0 = arg_35_0.builder[iter_35_0][iter_35_2].take_from_preset:get()
					loc_76_1_0 = arg_35_0.builder[iter_35_0][iter_35_2].take_from_team:get()
					loc_76_2_0 = arg_35_0.builder[iter_35_0][iter_35_2].take_from_state:get()

					if not loc_76_0_0 or not arg_35_0.presets.database[loc_76_0_0] then
						arg_35_0.notifications:push_notify(("\a%s  \aDEFAULTPreset not found"):format(arg_35_0.notifications:get_hex()), 3.5)
						cvar.playvol:call("ui\\weapon_cant_buy", 1)

						return
					end

					loc_76_3_0 = arg_35_0.builder[iter_35_0][iter_35_2]
					arg_35_0.builder[iter_35_0][iter_35_2].previous_settings = {
						yaw_mode = loc_76_3_0.yaw_mode:get(),
						yaw_offset = loc_76_3_0.yaw_offset:get(),
						left_offset = loc_76_3_0.left_offset:get(),
						right_offset = loc_76_3_0.right_offset:get(),
						variability = loc_76_3_0.variability:get(),
						delay = loc_76_3_0.delay:get(),
						delay_variability = loc_76_3_0.delay_variability:get(),
						modifier = loc_76_3_0.modifier:get(),
						modifier_offset = loc_76_3_0.modifier_offset:get(),
						modifier_variability = loc_76_3_0.modifier_variability:get(),
						body = loc_76_3_0.body:get(),
						body_delay = loc_76_3_0.body_delay:get(),
						body_variability = loc_76_3_0.body_variability:get(),
						body_freestanding = loc_76_3_0.body_freestanding:get(),
						body_options = loc_76_3_0.body_options:get(),
						limit_delay = loc_76_3_0.limit_delay:get(),
						limit_left = loc_76_3_0.limit_left:get(),
						limit_right = loc_76_3_0.limit_right:get(),
						limit_variability = loc_76_3_0.limit_variability:get(),
						limit_leftright = loc_76_3_0.limit_leftright:get(),
						limit_leftright2 = loc_76_3_0.limit_leftright2:get(),
						tickbase = loc_76_3_0.tickbase:get(),
						ticks = loc_76_3_0.ticks:get(),
						ticks_variability = loc_76_3_0.ticks_variability:get()
					}
					loc_76_4_0 = arg_35_0.presets.database[loc_76_0_0]
					loc_76_5_0 = CPN.decode(loc_76_4_0)
					loc_76_6_0 = msgpack.unpack(loc_76_5_0)
					loc_76_7_0 = 1

					for iter_76_0, iter_76_1 in ipairs(arg_35_0.ui.e_teams) do
						if iter_76_1 == loc_76_1_0 then
							loc_76_7_0 = iter_76_0

							break
						end
					end

					loc_76_8_0 = 1

					for iter_76_2, iter_76_3 in ipairs(arg_35_0.ui.e_states) do
						if iter_76_3 == loc_76_2_0 then
							loc_76_8_0 = iter_76_2

							break
						end
					end

					if not loc_76_6_0 or not loc_76_6_0[2] then
						arg_35_0.notifications:push_notify(("\a%s  \aDEFAULTPreset data is corrupted"):format(arg_35_0.notifications:get_hex()), 3.5)
						cvar.playvol:call("ui\\weapon_cant_buy", 1)

						return
					end

					loc_76_9_0 = nil

					if loc_76_6_0[2][loc_76_8_0] and loc_76_6_0[2][loc_76_8_0][loc_76_7_0] then
						loc_76_9_0 = loc_76_6_0[2][loc_76_8_0][loc_76_7_0]
					elseif loc_76_6_0[2][loc_76_7_0] and loc_76_6_0[2][loc_76_7_0][loc_76_8_0] then
						loc_76_9_0 = loc_76_6_0[2][loc_76_7_0][loc_76_8_0]
					else
						arg_35_0.notifications:push_notify(("\a%s  \aDEFAULTNo data found"):format(arg_35_0.notifications:get_hex()), 3.5)
						cvar.playvol:call("ui\\weapon_cant_buy", 1)

						return
					end

					loc_76_10_0 = {
						"yaw_mode",
						"yaw_offset",
						"left_offset",
						"right_offset",
						"variability",
						"delay",
						"delay_variability",
						"modifier",
						"modifier_offset",
						"modifier_variability",
						"body",
						"body_delay",
						"body_variability",
						"body_freestanding",
						"body_options",
						"limit_delay",
						"limit_left",
						"limit_right",
						"limit_variability",
						"limit_leftright",
						"limit_leftright2",
						"tickbase",
						"ticks",
						"ticks_variability"
					}

					for iter_76_4, iter_76_5 in ipairs(loc_76_10_0) do
						if loc_76_9_0[iter_76_5] ~= nil and loc_76_3_0[iter_76_5] and type(loc_76_3_0[iter_76_5].set) == "function" then
							loc_76_3_0[iter_76_5]:set(loc_76_9_0[iter_76_5])
						end
					end

					arg_35_0.notifications:push_notify(("\a%s  \aDEFAULTSettings applied! \a%s(Undo available)"):format(arg_35_0.notifications:get_hex(), arg_35_0.notifications:get_hex()), 5)
					cvar.playvol:call("ui\\beepclear", 1)
				end, true):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				})
				arg_35_0.builder[iter_35_0][iter_35_2].undo = loc_35_8_0:button("   \aF44336FF  \rUndo   ", function()
					if not arg_35_0.builder[iter_35_0][iter_35_2].previous_settings then
						arg_35_0.notifications:push_notify(("\a%s  \aDEFAULTNothing to undo"):format(arg_35_0.notifications:get_hex()), 2)
						cvar.playvol:call("ui\\weapon_cant_buy", 1)

						return
					end

					local var_77_0 = arg_35_0.builder[iter_35_0][iter_35_2]
					local var_77_1 = arg_35_0.builder[iter_35_0][iter_35_2].previous_settings

					for iter_77_0, iter_77_1 in pairs(var_77_1) do
						if var_77_0[iter_77_0] and type(var_77_0[iter_77_0].set) == "function" then
							var_77_0[iter_77_0]:set(iter_77_1)
						end
					end

					arg_35_0.builder[iter_35_0][iter_35_2].previous_settings = nil

					arg_35_0.notifications:push_notify(("\a%s  \aDEFAULTSettings \a%sreverted \aDEFAULTsuccessfully!"):format(arg_35_0.notifications:get_hex(), arg_35_0.notifications:get_hex()), 3)
					cvar.playvol:call("ui\\beepclear", 1)
				end, true):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				})
				arg_35_0.builder[iter_35_0][iter_35_2].update = loc_35_8_0:button("   \v  \rRefresh   ", function()
					arg_35_0.builder[iter_35_0][iter_35_2].take_from_preset:update(arg_35_0.presets:get_preset_names())
					cvar.playvol:call("ui\\beepclear", 1)
				end, true):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				})
				arg_35_0.builder[iter_35_0][iter_35_2].tickbase = loc_35_6_0:switch("\v•  \rCustom ticks"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder.force_break_lc,
					iter_35_1
				})
				loc_35_39_0 = arg_35_0.builder[iter_35_0][iter_35_2].tickbase:create()
				arg_35_0.builder[iter_35_0][iter_35_2].ticks_legacy = loc_35_39_0:switch("Legacy Mode"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder.force_break_lc,
					iter_35_1
				}, arg_35_0.builder[iter_35_0][iter_35_2].tickbase)
				arg_35_0.builder[iter_35_0][iter_35_2].ticks = loc_35_39_0:slider("\v›  \rChoke", 3, 22, math.random(15, 16), nil, "t"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder.force_break_lc,
					iter_35_1
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].tickbase,
					true
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].ticks_legacy,
					false
				})
				arg_35_0.builder[iter_35_0][iter_35_2].ticks_variability = loc_35_39_0:slider("\t\a{Small Text}»  Variability", 0, 100, 0, nil, "%"):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder.force_break_lc,
					iter_35_1
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].tickbase,
					true
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].ticks_legacy,
					false
				})

				arg_35_0.builder[iter_35_0][iter_35_2].ticks_variability:tooltip("Automatically generates optimal patterns.\n\nHigher — more unpredictable.\n\n\a{Small Text}Replaces outdated multi slider config with smart distribution algorithm.")

				arg_35_0.builder[iter_35_0][iter_35_2].tickbase_sliders = loc_35_39_0:slider("\v✱  \rChoke Ways", 1, 8, 2):depend({
					loc_35_37_0,
					iter_35_1
				}, {
					loc_35_38_0,
					iter_35_3
				}, {
					arg_35_0.builder.force_break_lc,
					iter_35_1
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].tickbase,
					true
				}, {
					arg_35_0.builder[iter_35_0][iter_35_2].ticks_legacy,
					true
				})

				for iter_35_5 = 1, 8 do
					loc_35_44_0 = string.format("\t\a{Small Text}»  [%d] \aFFFFFF00(%d:%d)", iter_35_5, iter_35_0, iter_35_2)
					loc_35_45_0 = arg_35_0.builder[iter_35_0][iter_35_2].tickbase:create():slider(loc_35_44_0, 2, 22, math.random(15, 16), nil, "t"):depend({
						loc_35_37_0,
						iter_35_1
					}, {
						loc_35_38_0,
						iter_35_3
					}, {
						arg_35_0.builder[iter_35_0][iter_35_2].tickbase,
						true
					}, {
						arg_35_0.builder[iter_35_0][iter_35_2].tickbase_sliders,
						function()
							return iter_35_5 <= arg_35_0.builder[iter_35_0][iter_35_2].tickbase_sliders:get()
						end
					}, {
						arg_35_0.builder[iter_35_0][iter_35_2].ticks_legacy,
						true
					})
					arg_35_0.builder[iter_35_0][iter_35_2]["tickbase_" .. iter_35_5] = loc_35_45_0
				end
			end
		end

		arg_35_0.builder.disable_on = loc_35_6_0:selectable("\v•  \rDisable on", "\v•  \rGrenade", "\v•  \rPeek Assist")
	end
}):struct("states")({
	air_duck = 7,
	post_fs = 12,
	swap = 11,
	safe = 10,
	freestand = 9,
	manual = 8,
	air = 6,
	move_duck = 5,
	duck = 4,
	stand = 1,
	is_in_air = false,
	slowwalk = 3,
	move = 2,
	cache = {
		tick = 0,
		team = 1,
		state = 1
	},
	init = function(arg_80_0)
		events.createmove(function(arg_81_0)
			local var_81_0 = entity.get_local_player()

			if var_81_0 then
				arg_80_0.is_in_air = arg_81_0.in_jump or bit.band(var_81_0.m_fFlags, 1) == 0
			end
		end)
	end,
	get_sequence_activity = function(arg_82_0)
		local var_82_0 = entity.get_local_player():get_anim_overlay(1)
		local var_82_1 = var_82_0.activity
		local var_82_2 = var_82_0.sequence
		local var_82_3 = var_82_0.weight

		return var_82_1, var_82_3
	end,
	height = function(arg_83_0)
		local var_83_0 = entity.get_local_player()
		local var_83_1 = entity.get_threat(false)

		if not var_83_1 then
			return false
		end

		local var_83_2 = var_83_1:get_origin()

		return var_83_0:get_origin().z - 35 > var_83_2.z + 0
	end,
	get_state = function(arg_84_0, arg_84_1)
		local var_84_0, var_84_1 = arg_84_0:get_sequence_activity()
		local var_84_2 = arg_84_0.ui.elements

		if not var_84_2.disable_extra_states:get(1) and var_84_2.hotkeys_manual_yaw:get() ~= "Disabled" then
			return arg_84_0.manual
		end

		if not var_84_2.disable_extra_states:get(2) and var_84_2.hotkeys_freestanding:get() and arg_84_0.references.neverlose.freestanding:get() then
			if rage.antiaim:get_target(true) ~= nil then
				return arg_84_0.post_fs
			else
				return arg_84_0.freestand
			end
		end

		if not var_84_2.disable_extra_states:get(3) and arg_84_0.is_in_air and var_84_0 == 972 and var_84_1 > 0.1 then
			return arg_84_0.swap
		end

		local var_84_3 = arg_84_1.m_fFlags
		local var_84_4 = bit.band(var_84_3, 4) == 4
		local var_84_5 = arg_84_1.m_vecVelocity:length()
		local var_84_6

		if arg_84_0.is_in_air then
			var_84_6 = var_84_4 and arg_84_0.air_duck or arg_84_0.air
		elseif var_84_5 > 3 then
			if var_84_4 then
				var_84_6 = arg_84_0.move_duck
			else
				var_84_6 = arg_84_0.references.neverlose.slowwalk:get() and arg_84_0.slowwalk or arg_84_0.move
			end
		else
			var_84_6 = var_84_4 and arg_84_0.duck or arg_84_0.stand
		end

		local var_84_7 = var_84_2.safe_head

		if not var_84_7:get(1) and not var_84_7:get(2) and not var_84_7:get(3) and not var_84_7:get(4) and not var_84_7:get(5) and not var_84_7:get(6) and not var_84_7:get(7) and not var_84_7:get(8) then
			return var_84_6
		end

		local var_84_8 = false
		local var_84_9 = arg_84_1:get_player_weapon()

		if var_84_9 then
			local var_84_10 = var_84_9:get_classname()

			var_84_8 = var_84_10 == "CKnife" or var_84_10 == "CWeaponTaser"
		end

		if var_84_7:get(1) and var_84_6 == arg_84_0.stand and arg_84_0:height() or var_84_7:get(2) and var_84_6 == arg_84_0.move and arg_84_0:height() or var_84_7:get(3) and var_84_6 == arg_84_0.duck and arg_84_0:height() or var_84_7:get(4) and var_84_6 == arg_84_0.move_duck and arg_84_0:height() or var_84_7:get(9) and var_84_6 == arg_84_0.slowwalk and arg_84_0:height() then
			return arg_84_0.safe
		end

		if var_84_6 == arg_84_0.air_duck then
			if var_84_7:get(5) then
				return arg_84_0.safe
			end

			if var_84_7:get(6) and var_84_8 then
				return arg_84_0.safe
			end
		end

		if var_84_7:get(7) and var_84_6 == arg_84_0.duck and var_84_8 then
			return arg_84_0.safe
		end

		if var_84_7:get(8) and var_84_6 == arg_84_0.move_duck and var_84_8 then
			return arg_84_0.safe
		end

		return var_84_6
	end,
	default = function(arg_85_0, arg_85_1)
		local var_85_0 = globals.tickcount

		if arg_85_0.cache.tick == var_85_0 then
			return arg_85_0.cache.state, arg_85_0.cache.team
		end

		local var_85_1 = arg_85_1.m_iTeamNum == 2 and 1 or 2
		local var_85_2 = arg_85_0:get_state(arg_85_1) or arg_85_0.stand

		arg_85_0.cache.tick = var_85_0
		arg_85_0.cache.state = var_85_2
		arg_85_0.cache.team = var_85_1

		return var_85_2, var_85_1
	end,
	disablers = function(arg_86_0, arg_86_1)
		local var_86_0 = arg_86_1.m_vecVelocity:length()
		local var_86_1 = bit.band(arg_86_1.m_fFlags, 4) == 4
		local var_86_2 = arg_86_0.stand

		if arg_86_0.is_in_air then
			var_86_2 = var_86_1 and arg_86_0.air_duck or arg_86_0.air
		elseif var_86_0 > 3 then
			var_86_2 = var_86_1 and arg_86_0.move_duck or arg_86_0.references.neverlose.slowwalk:get() and arg_86_0.slowwalk or arg_86_0.move
		else
			var_86_2 = var_86_1 and arg_86_0.duck or arg_86_0.stand
		end

		return var_86_2
	end
}):struct("antiaim")({
	state_cache_idx = 0,
	max_angle_variation = 15,
	flippers = {
		yaw = {
			last_flip = 0,
			state = false,
			packets = 0
		},
		body = {
			last_flip = 0,
			state = false,
			packets = 0
		},
		limit = {
			last_flip = 0,
			state = false,
			packets = 0
		}
	},
	discrete_delays = {
		1,
		3,
		5,
		7,
		10,
		15,
		20
	},
	fs_map = {
		Default = "Peek Fake",
		Reversed = "Peek Real",
		Off = "Off"
	},
	init = function(arg_87_0)
		events.createmove(function(arg_88_0)
			arg_87_0:override(arg_88_0)
		end)
	end,
	find_closest = function(arg_89_0, arg_89_1)
		local var_89_0 = 1
		local var_89_1 = math.huge
		local var_89_2 = arg_89_0.discrete_delays

		for iter_89_0 = 1, #var_89_2 do
			local var_89_3 = math.abs(arg_89_1 - var_89_2[iter_89_0])

			if var_89_3 < var_89_1 then
				var_89_0, var_89_1 = iter_89_0, var_89_3
			end
		end

		return var_89_0
	end,
	get_random_delay = function(arg_90_0, arg_90_1, arg_90_2)
		if arg_90_1 <= 1 or arg_90_2 <= 0 then
			return arg_90_1
		end

		local var_90_0 = arg_90_0:find_closest(arg_90_1)
		local var_90_1 = #arg_90_0.discrete_delays
		local var_90_2 = math.floor(var_90_1 * arg_90_2 / 200 + 0.5)
		local var_90_3 = math.max(1, var_90_0 - var_90_2)
		local var_90_4 = math.min(var_90_1, var_90_0 + var_90_2)

		return arg_90_0.discrete_delays[math.random(var_90_3, var_90_4)]
	end,
	update_flipper = function(arg_91_0, arg_91_1, arg_91_2, arg_91_3)
		local var_91_0 = arg_91_0.flippers[arg_91_1]

		if globals.choked_commands == 0 then
			var_91_0.packets = var_91_0.packets + 1

			local var_91_1

			if (rage.exploit:get() < 1 and 1 or arg_91_3 and arg_91_0:get_random_delay(arg_91_2, arg_91_3) or arg_91_2) <= var_91_0.packets - var_91_0.last_flip then
				var_91_0.state = not var_91_0.state
				var_91_0.last_flip = var_91_0.packets
			end
		end

		return var_91_0.state
	end,
	update_yaw_flipper = function(arg_92_0, arg_92_1)
		local var_92_0 = arg_92_0.flippers.yaw

		if globals.choked_commands == 0 then
			var_92_0.packets = var_92_0.packets + 1

			local var_92_1

			if rage.exploit:get() < 1 then
				var_92_1 = 1
			elseif arg_92_1.delay_legacy:get() then
				var_92_1 = arg_92_1["delay_" .. math.random(arg_92_1.delay_sliders:get())]:get()
			else
				var_92_1 = arg_92_0:get_random_delay(arg_92_1.delay:get(), arg_92_1.delay_variability:get())
			end

			if var_92_1 <= var_92_0.packets - var_92_0.last_flip then
				var_92_0.state = not var_92_0.state
				var_92_0.last_flip = var_92_0.packets
			end
		end

		return var_92_0.state
	end,
	add_variation = function(arg_93_0, arg_93_1, arg_93_2, arg_93_3, arg_93_4)
		if arg_93_2 <= 0 then
			return arg_93_1
		end

		local var_93_0 = arg_93_1 + (math.random() * 2 - 1) * arg_93_0.max_angle_variation * (arg_93_2 / 100)

		if arg_93_3 and arg_93_4 then
			var_93_0 = math.min(math.max(var_93_0, arg_93_3), arg_93_4)
		end

		return var_93_0
	end,
	override = function(arg_94_0, arg_94_1)
		loc_94_2_0 = entity.get_local_player()

		if not loc_94_2_0 or not loc_94_2_0:is_alive() then
			return
		end

		loc_94_3_0 = arg_94_0.references.neverlose

		if not loc_94_3_0.aa_enabled:get() then
			return
		end

		loc_94_3_0.pitch:override("Down")
		loc_94_3_0.yaw:override("Backward")
		loc_94_3_0.yaw.base:override("At Target")
		loc_94_3_0.yaw.hidden:override(false)
		loc_94_3_0.roll:override(false)
		loc_94_3_0.freestanding.disable_modifiers:override(true)
		loc_94_3_0.freestanding.body_freestanding:override(false)

		loc_94_4_0, loc_94_5_0 = arg_94_0.states:default(loc_94_2_0)

		if loc_94_4_0 == 12 then
			loc_94_3_0.yaw.offset:override(0)
			loc_94_3_0.modifier:override("Disabled")
			loc_94_3_0.modifier.offset:override(0)
			loc_94_3_0.body:override(true)
			loc_94_3_0.body.left_limit:override(60)
			loc_94_3_0.body.right_limit:override(60)

			if arg_94_0.ui.builder[9][loc_94_5_0].rotated:get() == "Jitter" then
				loc_94_3_0.body.options:override("Jitter")
			else
				loc_94_3_0.body.options:override("")
			end

			loc_94_3_0.body.freestanding:override("Off")

			return
		end

		if loc_94_4_0 ~= arg_94_0.state_cache_idx then
			arg_94_0.state_cache = arg_94_0.ui.builder[loc_94_4_0][loc_94_5_0]
			arg_94_0.state_cache_idx = loc_94_4_0
		end

		loc_94_6_0 = arg_94_0.state_cache
		loc_94_7_0 = nil

		if loc_94_6_0.yaw_mode:get() == "1-Way" then
			loc_94_7_0 = arg_94_0:add_variation(loc_94_6_0.yaw_offset:get(), loc_94_6_0.variability:get(), -180, 180)
		else
			loc_94_8_1 = arg_94_0:update_yaw_flipper(loc_94_6_0)

			rage.antiaim:inverter(loc_94_8_1)

			loc_94_9_1 = loc_94_8_1 and loc_94_6_0.left_offset:get() or loc_94_6_0.right_offset:get()
			loc_94_7_0 = arg_94_0:add_variation(loc_94_9_1, loc_94_6_0.variability:get(), -180, 180)
		end

		loc_94_8_0 = loc_94_6_0.modifier:get()
		loc_94_9_0 = loc_94_8_0 ~= "Disabled" and arg_94_0:add_variation(loc_94_6_0.modifier_offset:get(), loc_94_6_0.modifier_variability:get(), -180, 180) or 0
		loc_94_10_0 = false
		loc_94_11_0 = 0
		loc_94_12_0 = 0

		if loc_94_6_0.body:get() then
			loc_94_13_1 = loc_94_6_0.body_delay:get()
			loc_94_10_0 = loc_94_13_1 == 0 and true or arg_94_0:update_flipper("body", loc_94_13_1, loc_94_6_0.body_variability:get())

			if loc_94_6_0.limit_delay:get() == 0 then
				loc_94_11_0 = arg_94_0:add_variation(loc_94_6_0.limit_left:get(), loc_94_6_0.limit_variability:get(), 0, 60)
				loc_94_12_0 = arg_94_0:add_variation(loc_94_6_0.limit_right:get(), loc_94_6_0.limit_variability:get(), 0, 60)
			else
				loc_94_14_0 = arg_94_0:update_flipper("limit", loc_94_6_0.limit_delay:get(), loc_94_6_0.limit_variability:get())
				loc_94_11_0 = loc_94_14_0 and loc_94_6_0.limit_leftright:get() or loc_94_6_0.limit_leftright2:get()
				loc_94_12_0 = loc_94_14_0 and loc_94_6_0.limit_leftright:get() or loc_94_6_0.limit_leftright2:get()
			end
		end

		if arg_94_0.ui.elements.hotkeys_freestanding:get() and not arg_94_0.ui.elements.hotkeys_disablers:get(arg_94_0.states:disablers(loc_94_2_0)) then
			loc_94_3_0.freestanding:set(true)
		else
			loc_94_3_0.freestanding:set(false)
		end

		if arg_94_0.ui.elements.hotkeys_manual_yaw:get() ~= "Disabled" then
			loc_94_13_0 = {
				Right = 90,
				Left = -90,
				Forward = 180
			}

			if loc_94_13_0[arg_94_0.ui.elements.hotkeys_manual_yaw:get()] then
				loc_94_7_0 = loc_94_13_0[arg_94_0.ui.elements.hotkeys_manual_yaw:get()]

				loc_94_3_0.yaw.base:override("Local View")
				loc_94_3_0.freestanding:override(false)
			end
		end

		loc_94_3_0.yaw.offset:override(loc_94_7_0)
		loc_94_3_0.modifier:override(loc_94_8_0)
		loc_94_3_0.modifier.offset:override(loc_94_9_0)
		loc_94_3_0.body:override(loc_94_10_0)
		loc_94_3_0.body.left_limit:override(loc_94_11_0)
		loc_94_3_0.body.right_limit:override(loc_94_12_0)
		loc_94_3_0.body.options:override(loc_94_6_0.body_options:get())
		loc_94_3_0.body.freestanding:override(arg_94_0.fs_map[loc_94_6_0.body_freestanding:get()])
	end
}):struct("defensive")({
	state_cache_idx = 0,
	team_cache_idx = 0,
	discrete_ticks = {
		2,
		4,
		6,
		8,
		10,
		12,
		14,
		16,
		18,
		20,
		22
	},
	init = function(arg_95_0)
		events.createmove(function(arg_96_0)
			arg_95_0:override(arg_96_0)
		end)
	end,
	find_closest_tick = function(arg_97_0, arg_97_1)
		local var_97_0 = 1
		local var_97_1 = math.huge
		local var_97_2 = arg_97_0.discrete_ticks

		for iter_97_0 = 1, #var_97_2 do
			local var_97_3 = math.abs(arg_97_1 - var_97_2[iter_97_0])

			if var_97_3 < var_97_1 then
				var_97_0, var_97_1 = iter_97_0, var_97_3
			end
		end

		return var_97_0
	end,
	get_random_tick = function(arg_98_0, arg_98_1, arg_98_2)
		if arg_98_1 <= 2 or arg_98_2 <= 0 then
			return arg_98_1
		end

		local var_98_0 = arg_98_0:find_closest_tick(arg_98_1)
		local var_98_1 = #arg_98_0.discrete_ticks
		local var_98_2 = math.floor(var_98_1 * arg_98_2 / 200 + 0.5)
		local var_98_3 = math.max(1, var_98_0 - var_98_2)
		local var_98_4 = math.min(var_98_1, var_98_0 + var_98_2)

		return arg_98_0.discrete_ticks[math.random(var_98_3, var_98_4)]
	end,
	get_sequence_activity = function(arg_99_0)
		local var_99_0 = entity.get_local_player():get_anim_overlay(1)
		local var_99_1 = var_99_0.activity
		local var_99_2 = var_99_0.sequence
		local var_99_3 = var_99_0.weight

		return var_99_1, var_99_3
	end,
	override = function(arg_100_0, arg_100_1)
		local var_100_0 = entity.get_local_player()

		if not var_100_0 or not var_100_0:is_alive() then
			arg_100_0.state_cache = nil
			arg_100_0.state_cache_idx = 0
			arg_100_0.team_cache_idx = 0

			return
		end

		local var_100_1 = var_100_0:get_player_weapon()

		if var_100_1 == nil then
			return
		end

		local var_100_2, var_100_3 = arg_100_0.states:default(var_100_0)

		if var_100_2 == 12 then
			return
		end

		if var_100_2 ~= arg_100_0.state_cache_idx or var_100_3 ~= arg_100_0.team_cache_idx then
			arg_100_0.state_cache = arg_100_0.ui.builder[var_100_2][var_100_3]
			arg_100_0.state_cache_idx = var_100_2
			arg_100_0.team_cache_idx = var_100_3
		end

		local var_100_4 = arg_100_0.state_cache
		local var_100_5 = var_100_1:get_classname()
		local var_100_6 = var_100_5:find("Grenade") or var_100_5:find("Flashbang") or var_100_5:find("Decoy") or var_100_5:find("Molotov") or var_100_5:find("Incendiary") or var_100_5:find("Smoke")

		if arg_100_0.ui.builder.disable_on:get(1) and var_100_6 or arg_100_0.ui.builder.disable_on:get(2) and arg_100_0.references.neverlose.peek_assist:get() and (arg_100_0.state_cache_idx == 2 or arg_100_0.state_cache_idx == 8 or arg_100_0.state_cache_idx == 9) then
			arg_100_1.force_defensive = false

			arg_100_0.references.neverlose.dt.lag_options:override("On Peek")

			return
		end

		arg_100_0.references.neverlose.hs.options:override(arg_100_0.ui.elements.hide_shots:get())

		if arg_100_0.ui.builder.force_break_lc:get(arg_100_0.state_cache_idx) then
			if var_100_4.tickbase:get() then
				arg_100_0.references.neverlose.dt.lag_options:override("On Peek")

				local var_100_7

				if var_100_4.ticks_legacy:get() then
					local var_100_8 = var_100_4.tickbase_sliders:get()

					var_100_7 = var_100_4["tickbase_" .. math.random(var_100_8)]:get()
				else
					var_100_7 = arg_100_0:get_random_tick(var_100_4.ticks:get(), var_100_4.ticks_variability:get())
				end

				arg_100_1.force_defensive = arg_100_1.command_number % var_100_7 == 0
			else
				arg_100_0.references.neverlose.dt.lag_options:override("Always On")

				arg_100_1.force_defensive = false
			end
		else
			arg_100_0.references.neverlose.dt.lag_options:override("On Peek")

			arg_100_1.force_defensive = false
		end
	end
}):struct("tweaks")({
	tweak_warmup = pui.string("\v•  \rWarmup"),
	tweak_no_enemies = pui.string("\v•  \rNo Enemies"),
	pitch_map = {
		Up = "Fake Up",
		Down = "Down",
		Disabled = "Disabled"
	},
	init = function(arg_101_0)
		local function var_101_0(arg_102_0)
			arg_101_0:override(arg_102_0)
		end

		local function var_101_1(arg_103_0)
			if #arg_103_0:get() > 0 then
				events.createmove:set(var_101_0)
			else
				events.createmove:unset(var_101_0)
			end
		end

		arg_101_0.ui.elements.tweaks:set_callback(var_101_1, true)
	end,
	get_aimbot_targets = function(arg_104_0)
		local var_104_0 = {}
		local var_104_1 = entity.get_player_resource()

		for iter_104_0 = 1, globals.max_players do
			local var_104_2 = entity.get(iter_104_0)

			if var_104_2 and var_104_1.m_bConnected[iter_104_0] and var_104_2:is_enemy() and var_104_2:is_alive() then
				table.insert(var_104_0, var_104_2)
			end
		end

		return var_104_0
	end,
	calculate_offset = function(arg_105_0, arg_105_1, arg_105_2, arg_105_3)
		if arg_105_1 == "Spin" then
			return -math.fmod(globals.curtime * (arg_105_2 * 360), arg_105_3 * 2) + arg_105_3
		else
			return math.sin(globals.curtime * arg_105_2) * arg_105_3
		end
	end,
	override = function(arg_106_0, arg_106_1)
		local var_106_0 = entity.get_local_player()

		if not var_106_0 or not var_106_0:is_alive() then
			return
		end

		local var_106_1 = arg_106_0.ui.elements.tweaks:get()

		if #var_106_1 == 0 then
			return
		end

		local var_106_2 = false
		local var_106_3 = false

		for iter_106_0, iter_106_1 in ipairs(var_106_1) do
			if iter_106_1 == arg_106_0.tweak_warmup then
				var_106_2 = true
			elseif iter_106_1 == arg_106_0.tweak_no_enemies then
				var_106_3 = true
			end
		end

		local var_106_4 = false

		if var_106_2 then
			local var_106_5 = entity.get_game_rules()

			var_106_4 = var_106_5 and var_106_5.m_bWarmupPeriod
		end

		if not var_106_4 and var_106_3 then
			var_106_4 = #arg_106_0:get_aimbot_targets() == 0
		end

		if var_106_4 then
			local var_106_6 = arg_106_0.references.neverlose

			var_106_6.dt.lag_options:override("On Peek")
			var_106_6.hs.options:override("Favor Fire Rate")

			arg_106_1.force_defensive = false

			local var_106_7 = arg_106_0.pitch_map[arg_106_0.ui.elements.tweaks_pitch:get()] or "Disabled"

			var_106_6.pitch:override(var_106_7)

			local var_106_8 = arg_106_0.ui.elements.tweaks_mode:get()
			local var_106_9 = arg_106_0.ui.elements.tweaks_speed:get()
			local var_106_10 = arg_106_0.ui.elements.tweaks_range:get()
			local var_106_11 = arg_106_0:calculate_offset(var_106_8, var_106_9, var_106_10)

			var_106_6.yaw.offset:override(var_106_11)
			var_106_6.modifier:override("Disabled")
			var_106_6.body:override(false)
			var_106_6.freestanding:override(false)
		end
	end
}):struct("csa")({
	earthquake_value = 0,
	earthquake_counter = 0,
	smoothed_pose_p = {},
	smoothed_layers = {},
	init = function(arg_107_0)
		for iter_107_0 = 0, 12 do
			arg_107_0.smoothed_pose_p[iter_107_0] = 0
			arg_107_0.smoothed_layers[iter_107_0] = 0
		end

		events.post_update_clientside_animation(function()
			arg_107_0:update()
		end)
	end,
	get_anim_layers = function(arg_109_0, arg_109_1)
		local var_109_0 = arg_109_1[0]

		if var_109_0 ~= arg_109_0.last_player_ptr then
			arg_109_0.last_player_ptr = var_109_0
			arg_109_0.anim_layers_ptr = ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", var_109_0) + 10640)[0]
		end

		return arg_109_0.anim_layers_ptr
	end,
	update = function(arg_110_0)
		local var_110_0 = entity.get_local_player()

		if not var_110_0 or not var_110_0:is_alive() then
			arg_110_0.last_player_ptr = nil
			arg_110_0.anim_layers_ptr = nil

			for iter_110_0 = 0, 12 do
				arg_110_0.smoothed_pose_p[iter_110_0] = 0
				arg_110_0.smoothed_layers[iter_110_0] = 0
			end

			return
		end

		local var_110_1 = arg_110_0.ui.elements
		local var_110_2 = arg_110_0.references.neverlose
		local var_110_3 = arg_110_0:get_anim_layers(var_110_0)

		if not var_110_3 then
			return
		end

		local var_110_4 = var_110_1.animations_interpolating:get()

		if var_110_4 > 0 then
			local var_110_5 = globals.tickinterval * var_110_4
			local var_110_6 = 1 - var_110_5
			local var_110_7 = var_110_0.m_flPoseParameter

			for iter_110_1 = 0, 12 do
				local var_110_8 = var_110_7[iter_110_1]
				local var_110_9 = var_110_5 * (arg_110_0.smoothed_pose_p[iter_110_1] or 0) + var_110_6 * var_110_8

				arg_110_0.smoothed_pose_p[iter_110_1] = var_110_9
				var_110_7[iter_110_1] = var_110_9
			end

			for iter_110_2 = 0, 12 do
				local var_110_10 = var_110_3[iter_110_2]

				if var_110_10 then
					local var_110_11 = var_110_10.m_flWeight
					local var_110_12 = var_110_5 * (arg_110_0.smoothed_layers[iter_110_2] or 0) + var_110_6 * var_110_11

					arg_110_0.smoothed_layers[iter_110_2] = var_110_12
					var_110_10.m_flWeight = var_110_12
				end
			end
		end

		local var_110_13 = var_110_1.animations_leaning:get()

		if var_110_13 ~= 0 then
			local var_110_14 = var_110_3[12]

			if var_110_14 then
				if var_110_1.animations_earthquake:get() then
					arg_110_0.earthquake_counter = arg_110_0.earthquake_counter + 1

					if arg_110_0.earthquake_counter % 4 == 0 then
						arg_110_0.earthquake_value = math.random()
					end

					var_110_14.m_flWeight = arg_110_0.earthquake_value
				else
					var_110_14.m_flWeight = var_110_13 * 0.01
				end
			end
		end

		var_110_0.m_flPoseParameter[6] = var_110_1.animations_falling:get() * 0.01

		if var_110_1.animations_jitter_legs:get() then
			var_110_2.leg_movement:override("Sliding")

			if bit.band(globals.tickcount, 3) > 1 then
				var_110_0.m_flPoseParameter[0] = 1
				var_110_0.m_flPoseParameter[1] = 1
			end
		else
			var_110_2.leg_movement:override()
		end
	end
}):struct("avoid_fall_damage")({
	last_state = false,
	no_fall_damage = false,
	init = function(arg_111_0)
		local function var_111_0(arg_112_0)
			arg_111_0:update(arg_112_0)
		end

		local function var_111_1(arg_113_0)
			events.createmove(var_111_0, arg_113_0:get())
		end

		arg_111_0.ui.elements.avoid_fall_damage:set_callback(var_111_1, true)
	end,
	trace = function(arg_114_0, arg_114_1, arg_114_2)
		return utils.trace_line(arg_114_1:get_origin(), arg_114_1:get_origin() + vector(0, 0, -arg_114_2), arg_114_1).fraction < 1
	end,
	update = function(arg_115_0, arg_115_1)
		local var_115_0 = entity.get_local_player()

		if not var_115_0 or not var_115_0:is_alive() then
			return
		end

		local var_115_1 = var_115_0.m_vecVelocity.z

		if var_115_1 > -580 then
			return
		end

		local var_115_2 = var_115_1 < -580 and not arg_115_0:trace(var_115_0, 15)

		if var_115_2 ~= arg_115_0.last_state then
			arg_115_0.no_fall_damage = var_115_2
			arg_115_0.last_state = var_115_2
		end

		if var_115_1 < -580 then
			arg_115_1.in_duck = arg_115_0.no_fall_damage and 1 or 0
		end
	end
}):struct("fast_ladder")({
	init = function(arg_116_0)
		local function var_116_0(arg_117_0)
			arg_116_0:update(arg_117_0)
		end

		local function var_116_1(arg_118_0)
			events.createmove(var_116_0, arg_118_0:get())
		end

		arg_116_0.ui.elements.fast_ladder:set_callback(var_116_1, true)
	end,
	update = function(arg_119_0, arg_119_1)
		local var_119_0 = entity.get_local_player()

		if not var_119_0 or not var_119_0:is_alive() or var_119_0.m_MoveType ~= 9 then
			return
		end

		arg_119_1.view_angles.y = math.floor(arg_119_1.view_angles.y + 0.5)
		arg_119_1.view_angles.z = 0

		local var_119_1 = arg_119_1.forwardmove
		local var_119_2 = arg_119_1.sidemove

		if var_119_1 ~= 0 then
			arg_119_1.view_angles.x = 89

			local var_119_3 = var_119_1 > 0 and {
				90,
				150,
				30
			} or {
				90,
				30,
				150
			}
			local var_119_4 = var_119_1 > 0 and {
				1,
				0,
				0,
				1
			} or {
				0,
				1,
				1,
				0
			}

			arg_119_1.in_moveright = var_119_4[1]
			arg_119_1.in_moveleft = var_119_4[2]
			arg_119_1.in_forward = var_119_4[3]
			arg_119_1.in_back = var_119_4[4]
			arg_119_1.view_angles.y = arg_119_1.view_angles.y + var_119_3[var_119_2 == 0 and 1 or var_119_2 < 0 and 2 or 3]
		end
	end
}):struct("avoid_collisions")({
	movetype_walk = 2,
	max_angle_diff = 90,
	extrapolate_distance = 45,
	grate_contents = 536870912,
	trace_mask = 33636363,
	hull_scale = 0.85,
	min_velocity = 150,
	rad2deg = 180 / math.pi,
	vec3_t = ffi.typeof("struct { float x, y, z; }"),
	native_getCollideable = utils.get_vfunc(3, "void*(__thiscall*)(void* ecx)"),
	native_getMins = utils.get_vfunc(1, "$*(__thiscall*)(void* ecx)", ffi.typeof("struct { float x, y, z; }")),
	native_getMaxs = utils.get_vfunc(2, "$*(__thiscall*)(void* ecx)", ffi.typeof("struct { float x, y, z; }")),
	init = function(arg_120_0)
		local function var_120_0(arg_121_0)
			arg_120_0:handle(arg_121_0)
		end

		local function var_120_1(arg_122_0)
			events.createmove(var_120_0, arg_122_0:get())
		end

		arg_120_0.ui.elements.avoid_collisions:set_callback(var_120_1, true)
	end,
	get_collideable_bounds = function(arg_123_0, arg_123_1)
		local var_123_0 = arg_123_1[0]
		local var_123_1 = arg_123_0.native_getCollideable(var_123_0)

		if not var_123_1 then
			return vector(-16, -16, 0) * arg_123_0.hull_scale, vector(16, 16, 72) * arg_123_0.hull_scale
		end

		local var_123_2 = arg_123_0.native_getMins(var_123_1)
		local var_123_3 = arg_123_0.native_getMaxs(var_123_1)
		local var_123_4 = vector(var_123_2.x, var_123_2.y, var_123_2.z) * arg_123_0.hull_scale
		local var_123_5 = vector(var_123_3.x, var_123_3.y, var_123_3.z) * arg_123_0.hull_scale

		return var_123_4, var_123_5
	end,
	normalize_yaw = function(arg_124_0, arg_124_1)
		while arg_124_1 > 180 do
			arg_124_1 = arg_124_1 - 360
		end

		while arg_124_1 < -180 do
			arg_124_1 = arg_124_1 + 360
		end

		return arg_124_1
	end,
	calculate_avoidance_angle = function(arg_125_0, arg_125_1)
		local var_125_0

		if arg_125_1.y < arg_125_1.x then
			var_125_0 = math.atan2(arg_125_1.y, arg_125_1.x) * arg_125_0.rad2deg + 180
		else
			var_125_0 = math.atan2(arg_125_1.y, arg_125_1.x) * arg_125_0.rad2deg - 180
		end

		return var_125_0
	end,
	change_yaw = function(arg_126_0, arg_126_1, arg_126_2, arg_126_3)
		if math.abs(arg_126_3.plane.normal.z) > 0.1 or arg_126_3.plane.normal:length() < 0.1 then
			return
		end

		local var_126_0 = arg_126_0:calculate_avoidance_angle(arg_126_3.plane.normal)
		local var_126_1 = arg_126_0:normalize_yaw(arg_126_2 - var_126_0)

		if math.abs(var_126_1) > arg_126_0.max_angle_diff then
			return
		end

		if arg_126_1.sidemove < -10 and var_126_1 < 0 then
			var_126_1 = 1
		elseif arg_126_1.sidemove > 10 and var_126_1 > 0 then
			var_126_1 = -1
		end

		local var_126_2 = var_126_0 + (var_126_1 > 0 and 90 or -90)
		local var_126_3 = arg_126_0:normalize_yaw(90 - var_126_2)

		arg_126_1.move_yaw = arg_126_0:normalize_yaw(90 - var_126_3)
		arg_126_1.in_speed = 0
		arg_126_1.in_moveleft = 0
		arg_126_1.in_moveright = 0
		arg_126_1.forwardmove = 450
		arg_126_1.sidemove = 0
	end,
	should_avoid = function(arg_127_0, arg_127_1, arg_127_2)
		if not arg_127_1 or not arg_127_1:is_alive() then
			return false
		end

		if arg_127_1.m_MoveType ~= arg_127_0.movetype_walk then
			return false
		end

		if bit.band(arg_127_1.m_fFlags, 1) == 1 then
			return false
		end

		if arg_127_2.forwardmove < 0 then
			return false
		end

		if arg_127_1.m_vecVelocity:length2d() < arg_127_0.min_velocity then
			return false
		end

		if arg_127_0.ui.elements.avoid_collisions_disable_on_crouch:get() and bit.band(arg_127_1.m_fFlags, 4) == 4 then
			return false
		end

		return true
	end,
	handle = function(arg_128_0, arg_128_1)
		local var_128_0 = entity.get_local_player()

		if not arg_128_0:should_avoid(var_128_0, arg_128_1) then
			return
		end

		local var_128_1, var_128_2 = arg_128_0:get_collideable_bounds(var_128_0)
		local var_128_3 = render.camera_angles()

		var_128_3.x = 0

		local var_128_4 = var_128_0:get_origin()
		local var_128_5 = var_128_0.m_vecVelocity:length2d()
		local var_128_6 = vector():angles(var_128_3.x, var_128_3.y)
		local var_128_7 = arg_128_0.ui.elements.avoid_collisions_distance:get()
		local var_128_8 = var_128_4 + var_128_6 * (var_128_5 * (globals.tickinterval * var_128_7))
		local var_128_9 = utils.trace_hull(var_128_4, var_128_8, var_128_1, var_128_2, entity.get_players(false, false), arg_128_0.trace_mask, 0)

		if not var_128_9.entity then
			return
		end

		if var_128_9.entity:get_classname() == "CDynamicProp" then
			return
		end

		if bit.band(var_128_9.contents, arg_128_0.grate_contents) ~= 0 then
			return
		end

		arg_128_0:change_yaw(arg_128_1, var_128_3.y, var_128_9)
	end
}):struct("watermark")({
	screen = render.screen_size(),
	fonts = {
		Console = 3,
		Pixel = 2,
		Bold = 4,
		Default = 1
	},
	presets = {
		Classic = {
			prefix = "L U A",
			text = " S E N S E",
			postfix = " [BETA]",
			gradient = true
		},
		Luasync = {
			prefix = "",
			text = "luasync",
			postfix = ".max",
			gradient = false
		},
		Star = {
			prefix = "",
			text = " LUASENSE",
			postfix = "",
			gradient = false
		}
	},
	config = {
		snap_visual_range = 60,
		snap_threshold = 25,
		animation = {
			pulse_speed = 2,
			drag_speed = 6,
			snap_speed = 10,
			hover_speed = 8
		},
		gradient = {
			max_brightness = 1,
			speed = 2,
			min_brightness = 0.3,
			wave_count = 1,
			enabled = false
		},
		positions = {
			top_left = vector(0.03, 0.02),
			top_right = vector(0.97, 0.02),
			center_left = vector(0.03, 0.5),
			center_right = vector(0.97, 0.5),
			bottom_center = vector(0.5, 0.98)
		},
		colors = {
			snap_point = color(255, 255, 255, 60),
			snap_point_active = color(255, 255, 255, 150),
			snap_line = color(255, 255, 255, 100),
			hover_bg = color(255, 255, 255, 20),
			drag_bg = color(255, 255, 255, 35)
		}
	},
	state = {
		gradient_time = 0,
		hover = false,
		dragging = false,
		drag_offset = vector(0, 0),
		text_size = vector(0, 0),
		animations = {
			drag_alpha = 0,
			hover_alpha = 0,
			pulse_time = 0,
			background_alpha = 0,
			snap_indicators = {}
		},
		cache = {
			snap_positions = {}
		}
	},
	init = function(arg_129_0)
		arg_129_0.state.position = vector(arg_129_0.screen.x * arg_129_0.config.positions.bottom_center.x, arg_129_0.screen.y * arg_129_0.config.positions.bottom_center.y)

		arg_129_0:precalculate_snap_positions()

		local function var_129_0()
			arg_129_0:render()
		end

		local function var_129_1()
			if pui.get_alpha() > 0 and arg_129_0.state.hover or arg_129_0.state.dragging then
				return false
			else
				return
			end
		end

		local function var_129_2(arg_132_0)
			events.mouse_input(var_129_1, arg_132_0:get())
			events.render(var_129_0, arg_132_0:get())
		end

		arg_129_0.ui.elements.watermark:set_callback(var_129_2, true)
	end,
	precalculate_snap_positions = function(arg_133_0)
		for iter_133_0, iter_133_1 in pairs(arg_133_0.config.positions) do
			arg_133_0.state.cache.snap_positions[iter_133_0] = vector(arg_133_0.screen.x * iter_133_1.x, arg_133_0.screen.y * iter_133_1.y)
		end
	end,
	lerp = function(arg_134_0, arg_134_1, arg_134_2, arg_134_3)
		return arg_134_1 + (arg_134_2 - arg_134_1) * math.min(globals.frametime * arg_134_3, 1)
	end,
	calculate_gradient_color = function(arg_135_0, arg_135_1, arg_135_2)
		local var_135_0 = globals.realtime * arg_135_0.config.gradient.speed
		local var_135_1 = arg_135_1 / arg_135_2 * arg_135_0.config.gradient.wave_count * math.pi
		local var_135_2 = math.sin(var_135_0 + var_135_1)
		local var_135_3 = arg_135_0.config.gradient.min_brightness + (arg_135_0.config.gradient.max_brightness - arg_135_0.config.gradient.min_brightness) * ((var_135_2 + 1) / 2)
		local var_135_4 = math.floor(var_135_3 * 255)

		return color(var_135_4, var_135_4, var_135_4)
	end,
	split_utf8 = function(arg_136_0, arg_136_1)
		local var_136_0 = {}
		local var_136_1 = 1

		while var_136_1 <= #arg_136_1 do
			local var_136_2 = string.byte(arg_136_1, var_136_1)
			local var_136_3 = 1

			if var_136_2 >= 240 then
				var_136_3 = 4
			elseif var_136_2 >= 224 then
				var_136_3 = 3
			elseif var_136_2 >= 192 then
				var_136_3 = 2
			end

			table.insert(var_136_0, arg_136_1:sub(var_136_1, var_136_1 + var_136_3 - 1))

			var_136_1 = var_136_1 + var_136_3
		end

		return var_136_0
	end,
	get_snap_position = function(arg_137_0, arg_137_1)
		local var_137_0
		local var_137_1
		local var_137_2 = arg_137_0.config.snap_threshold

		for iter_137_0, iter_137_1 in pairs(arg_137_0.state.cache.snap_positions) do
			local var_137_3 = arg_137_1:dist(iter_137_1)

			if var_137_3 < var_137_2 then
				var_137_2 = var_137_3
				var_137_0 = iter_137_1
				var_137_1 = iter_137_0
			end
		end

		return var_137_0, var_137_1
	end,
	render_snap_indicators = function(arg_138_0)
		arg_138_0.state.animations.pulse_time = arg_138_0.state.animations.pulse_time + globals.frametime

		for iter_138_0, iter_138_1 in pairs(arg_138_0.state.cache.snap_positions) do
			loc_138_6_0 = arg_138_0.state.position:dist(iter_138_1)
			loc_138_7_0 = loc_138_6_0 < arg_138_0.config.snap_visual_range

			if not arg_138_0.state.animations.snap_indicators[iter_138_0] then
				arg_138_0.state.animations.snap_indicators[iter_138_0] = {
					line_alpha = 0,
					alpha = 0,
					scale = 0
				}
			end

			loc_138_8_0 = arg_138_0.state.animations.snap_indicators[iter_138_0]
			loc_138_9_0 = 0

			if arg_138_0.state.dragging and loc_138_7_0 then
				loc_138_9_0 = math.max(0, 1 - loc_138_6_0 / arg_138_0.config.snap_visual_range)
			end

			loc_138_8_0.alpha = arg_138_0:lerp(loc_138_8_0.alpha, loc_138_9_0, arg_138_0.config.animation.snap_speed)

			if loc_138_8_0.alpha > 0.01 then
				loc_138_10_0 = 1

				if loc_138_6_0 < arg_138_0.config.snap_threshold then
					loc_138_10_0 = 1 + math.sin(arg_138_0.state.animations.pulse_time * arg_138_0.config.animation.pulse_speed) * 0.2
					loc_138_8_0.line_alpha = arg_138_0:lerp(loc_138_8_0.line_alpha, 1, arg_138_0.config.animation.snap_speed)
				else
					loc_138_8_0.line_alpha = arg_138_0:lerp(loc_138_8_0.line_alpha, 0, arg_138_0.config.animation.snap_speed)
				end

				loc_138_11_0 = loc_138_6_0 < arg_138_0.config.snap_threshold and 1.5 or 1
				loc_138_8_0.scale = arg_138_0:lerp(loc_138_8_0.scale, loc_138_11_0, arg_138_0.config.animation.snap_speed)
				loc_138_12_0 = math.floor(loc_138_8_0.alpha * 100)
				loc_138_13_0 = color(255, 255, 255, loc_138_12_0)
				loc_138_14_0 = 3 * loc_138_8_0.scale * loc_138_10_0

				if loc_138_6_0 < arg_138_0.config.snap_threshold then
					loc_138_15_2 = math.floor(loc_138_8_0.alpha * 30)
					loc_138_16_2 = color(255, 255, 255, loc_138_15_2)

					render.circle(iter_138_1, loc_138_16_2, loc_138_14_0 * 3, 0, 1)
				end

				render.circle(iter_138_1, loc_138_13_0, loc_138_14_0, 0, 1)
				render.circle_outline(iter_138_1, loc_138_13_0, loc_138_14_0, 0, 1, 1)

				if loc_138_8_0.line_alpha > 0.01 then
					loc_138_15_1 = math.floor(loc_138_8_0.line_alpha * loc_138_8_0.alpha * 80)
					loc_138_16_1 = color(255, 255, 255, loc_138_15_1)
					loc_138_17_1 = 10

					for iter_138_2 = 0, loc_138_17_1 - 1, 2 do
						loc_138_22_0 = iter_138_2 / loc_138_17_1
						loc_138_23_0 = math.min((iter_138_2 + 1) / loc_138_17_1, 1)
						loc_138_24_0 = arg_138_0.state.position:lerp(iter_138_1, loc_138_22_0)
						loc_138_25_0 = arg_138_0.state.position:lerp(iter_138_1, loc_138_23_0)

						render.line(loc_138_24_0, loc_138_25_0, loc_138_16_1)
					end
				end

				if loc_138_6_0 < arg_138_0.config.snap_threshold * 2 and loc_138_8_0.alpha > 0.5 then
					loc_138_15_0 = math.floor(loc_138_8_0.alpha * 150)
					loc_138_16_0 = color(255, 255, 255, loc_138_15_0)
					loc_138_17_0 = iter_138_1 + vector(0, -15)
					loc_138_18_0 = iter_138_0:gsub("_", " "):gsub("^%l", string.upper):upper()

					render.text(2, loc_138_17_0, loc_138_16_0, "c", loc_138_18_0)
				end
			end
		end
	end,
	handle_input = function(arg_139_0)
		if pui.get_alpha() == 0 then
			return
		end

		local var_139_0 = pui.get_mouse_position()
		local var_139_1 = common.is_button_down(1)
		local var_139_2 = vector(arg_139_0.state.text_size.x / 2, arg_139_0.state.text_size.y / 2)
		local var_139_3 = 6
		local var_139_4 = var_139_0.x >= arg_139_0.state.position.x - var_139_2.x - var_139_3 and var_139_0.x <= arg_139_0.state.position.x + var_139_2.x + var_139_3 and var_139_0.y >= arg_139_0.state.position.y - var_139_2.y - var_139_3 and var_139_0.y <= arg_139_0.state.position.y + var_139_2.y + var_139_3

		arg_139_0.state.hover = var_139_4

		if var_139_1 and var_139_4 and not arg_139_0.state.dragging then
			arg_139_0.state.dragging = true
			arg_139_0.state.drag_offset = var_139_0 - arg_139_0.state.position
		end

		if arg_139_0.state.dragging then
			if var_139_1 then
				local var_139_5 = var_139_0 - arg_139_0.state.drag_offset
				local var_139_6 = arg_139_0:get_snap_position(var_139_5)

				if var_139_6 then
					var_139_5 = var_139_6
				end

				var_139_5.x = math.max(var_139_2.x, math.min(arg_139_0.screen.x - var_139_2.x, var_139_5.x))
				var_139_5.y = math.max(var_139_2.y, math.min(arg_139_0.screen.y - var_139_2.y, var_139_5.y))
				arg_139_0.state.position = var_139_5

				if arg_139_0.ui.elements.watermark_x then
					arg_139_0.ui.elements.watermark_x:set(var_139_5.x)
				end

				if arg_139_0.ui.elements.watermark_y then
					arg_139_0.ui.elements.watermark_y:set(var_139_5.y)
				end
			else
				arg_139_0.state.dragging = false
			end
		end
	end,
	get_text_parts = function(arg_140_0)
		local var_140_0 = arg_140_0.ui.elements.watermark_style:get() or "Classic"

		if arg_140_0.state.cache.last_preset == var_140_0 and arg_140_0.state.cache.text_parts then
			return unpack(arg_140_0.state.cache.text_parts)
		end

		local var_140_1 = arg_140_0.presets[var_140_0] or arg_140_0.presets.Classic

		arg_140_0.config.gradient.enabled = var_140_1.gradient or false
		arg_140_0.state.cache.last_preset = var_140_0
		arg_140_0.state.cache.text_parts = {
			var_140_1.prefix,
			var_140_1.text,
			var_140_1.postfix
		}

		return var_140_1.prefix, var_140_1.text, var_140_1.postfix
	end,
	render = function(arg_141_0)
		if not globals.is_in_game then
			return
		end

		loc_141_1_0, loc_141_2_0, loc_141_3_0 = arg_141_0:get_text_parts()
		loc_141_4_0 = arg_141_0.fonts[arg_141_0.ui.elements.watermark_font:get()]
		loc_141_5_0 = "c"

		if arg_141_0.ui.elements.watermark_x and arg_141_0.ui.elements.watermark_y then
			arg_141_0.state.position = vector(arg_141_0.ui.elements.watermark_x:get(), arg_141_0.ui.elements.watermark_y:get())
		end

		loc_141_6_0 = arg_141_0.ui.elements.watermark_main_accent:get() or color(255, 255, 255)
		loc_141_7_0 = arg_141_0.ui.elements.watermark_prefix_accent:get() or color(150, 150, 150)
		loc_141_8_0 = arg_141_0.ui.elements.watermark_postfix_accent:get() or color(150, 150, 150)
		loc_141_9_0 = loc_141_1_0 .. loc_141_2_0 .. loc_141_3_0
		arg_141_0.state.text_size = render.measure_text(loc_141_4_0, loc_141_5_0, loc_141_9_0)

		arg_141_0:handle_input()

		loc_141_10_0 = 0

		if arg_141_0.state.hover and pui.get_alpha() > 0 then
			loc_141_10_0 = 0.3
		end

		if arg_141_0.state.dragging then
			loc_141_10_0 = 0.5
		end

		arg_141_0.state.animations.background_alpha = arg_141_0:lerp(arg_141_0.state.animations.background_alpha, loc_141_10_0, arg_141_0.config.animation.hover_speed)

		if arg_141_0.state.animations.background_alpha > 0.01 then
			loc_141_11_2 = math.floor(arg_141_0.state.animations.background_alpha * 40)
			loc_141_12_1 = color(255, 255, 255, loc_141_11_2)
			loc_141_13_1 = 8
			loc_141_14_1 = math.floor(arg_141_0.state.animations.background_alpha * 20)
			loc_141_15_1 = color(0, 0, 0, loc_141_14_1)

			render.shadow(arg_141_0.state.position - vector(arg_141_0.state.text_size.x / 2 + loc_141_13_1, arg_141_0.state.text_size.y / 2 + loc_141_13_1), arg_141_0.state.position + vector(arg_141_0.state.text_size.x / 2 + loc_141_13_1, arg_141_0.state.text_size.y / 2 + loc_141_13_1), loc_141_15_1, 20, 2, 4)
			render.rect(arg_141_0.state.position - vector(arg_141_0.state.text_size.x / 2 + loc_141_13_1, arg_141_0.state.text_size.y / 2 + loc_141_13_1), arg_141_0.state.position + vector(arg_141_0.state.text_size.x / 2 + loc_141_13_1, arg_141_0.state.text_size.y / 2 + loc_141_13_1), loc_141_12_1, 4)

			loc_141_16_0 = math.floor(arg_141_0.state.animations.background_alpha * 60)
			loc_141_17_0 = color(255, 255, 255, loc_141_16_0)

			render.rect_outline(arg_141_0.state.position - vector(arg_141_0.state.text_size.x / 2 + loc_141_13_1, arg_141_0.state.text_size.y / 2 + loc_141_13_1), arg_141_0.state.position + vector(arg_141_0.state.text_size.x / 2 + loc_141_13_1, arg_141_0.state.text_size.y / 2 + loc_141_13_1), loc_141_17_0, 1, 4)
		end

		arg_141_0:render_snap_indicators()

		if arg_141_0.config.gradient.enabled then
			loc_141_11_1 = string.format("\a%s%s", loc_141_7_0:to_hex(), loc_141_1_0)
			loc_141_12_0 = string.format("\a%s%s", loc_141_8_0:to_hex(), loc_141_3_0)
			loc_141_13_0 = arg_141_0:split_utf8(loc_141_2_0)
			loc_141_14_0 = {}

			for iter_141_0, iter_141_1 in ipairs(loc_141_13_0) do
				loc_141_20_0 = arg_141_0:calculate_gradient_color(iter_141_0, #loc_141_13_0)

				table.insert(loc_141_14_0, string.format("\a%s%s", loc_141_20_0:to_hex(), iter_141_1))
			end

			loc_141_15_0 = loc_141_11_1 .. table.concat(loc_141_14_0) .. loc_141_12_0

			render.text(loc_141_4_0, arg_141_0.state.position, color(), loc_141_5_0, loc_141_15_0)
		else
			loc_141_11_0 = string.format("\a%s%s\a%s%s\a%s%s", loc_141_7_0:to_hex(), loc_141_1_0, loc_141_6_0:to_hex(), loc_141_2_0, loc_141_8_0:to_hex(), loc_141_3_0)

			render.text(loc_141_4_0, arg_141_0.state.position, color(), loc_141_5_0, loc_141_11_0)
		end

		arg_141_0.state.gradient_time = arg_141_0.state.gradient_time + globals.frametime
	end
}):struct("magic_key")({
	init = function(arg_142_0)
		local function var_142_0(arg_143_0)
			arg_142_0.references.neverlose.hit_chance:override(arg_143_0:get() and 10 or nil)
			arg_142_0.references.neverlose.body_aim:override(arg_143_0:get() and "Default" or nil)
			arg_142_0.references.neverlose.safe_points:override(arg_143_0:get() and "Default" or nil)
			arg_142_0.references.neverlose.ensure_hitbox_safety:override(arg_143_0:get() and "" or nil)
			arg_142_0.references.neverlose.auto_stop:override(arg_143_0:get() and "" or nil)
			arg_142_0.references.neverlose.dt_auto_stop:override(arg_143_0:get() and "" or nil)
			arg_142_0.references.neverlose.head_scale:override(arg_143_0:get() and 100 or nil)
			arg_142_0.references.neverlose.body_scale:override(arg_143_0:get() and 100 or nil)
		end

		arg_142_0.ui.elements.magic_key:set_callback(var_142_0, true)
	end
}):struct("fake_duck_speed")({
	speed_scale = 150,
	min_velocity = 10,
	init = function(arg_144_0)
		local function var_144_0(arg_145_0)
			arg_144_0:override(arg_145_0)
		end

		local function var_144_1(arg_146_0)
			events.createmove_run(var_144_0, arg_146_0:get())
		end

		arg_144_0.ui.elements.fake_duck_speed:set_callback(var_144_1, true)
	end,
	override = function(arg_147_0, arg_147_1)
		local var_147_0 = entity.get_local_player()

		if not var_147_0 or not var_147_0:is_alive() then
			return
		end

		if not arg_147_0.references.neverlose.fake_duck:get() then
			return
		end

		local var_147_1 = var_147_0.m_vecVelocity

		if math.abs(var_147_1.x) > arg_147_0.min_velocity or math.abs(var_147_1.y) > arg_147_0.min_velocity then
			local var_147_2 = vector(arg_147_1.forwardmove, arg_147_1.sidemove)

			if var_147_2:length() > 0 then
				var_147_2:normalize()

				arg_147_1.forwardmove = var_147_2.x * arg_147_0.speed_scale
				arg_147_1.sidemove = var_147_2.y * arg_147_0.speed_scale
			end
		end
	end
}):struct("fake_duck_freezetime")({
	duck_start = 0,
	duck_cycle = 14,
	is_ducking = false,
	tick_counter = 0,
	duck_height = 64,
	duck_end = 7,
	send_packet_tick = 6,
	init = function(arg_148_0)
		local function var_148_0(arg_149_0)
			arg_148_0:override(arg_149_0)
		end

		local function var_148_1(arg_150_0)
			arg_148_0:override_view(arg_150_0)
		end

		local function var_148_2(arg_151_0)
			local var_151_0 = arg_151_0:get()

			events.createmove(var_148_0, var_151_0)
			events.override_view(var_148_1, var_151_0)

			if not var_151_0 then
				arg_148_0.tick_counter = 0
				arg_148_0.is_ducking = false

				arg_148_0.references.neverlose.dt:override()
				arg_148_0.references.neverlose.hs:override()
			end
		end

		arg_148_0.ui.elements.fake_duck_freezetime:set_callback(var_148_2, true)
	end,
	override = function(arg_152_0, arg_152_1)
		local var_152_0 = entity.get_local_player()

		if not var_152_0 or not var_152_0:is_alive() then
			return
		end

		local var_152_1 = entity.get_game_rules()

		if not var_152_1 then
			return
		end

		if var_152_1.m_bFreezePeriod and arg_152_0.references.neverlose.fake_duck:get() then
			arg_152_0.references.neverlose.dt:override(false)
			arg_152_0.references.neverlose.hs:override(false)

			local var_152_2 = arg_152_0.tick_counter % arg_152_0.duck_cycle

			if var_152_2 == arg_152_0.duck_start then
				arg_152_0.is_ducking = true
				arg_152_1.send_packet = false
			elseif var_152_2 == arg_152_0.send_packet_tick then
				arg_152_1.send_packet = true
			elseif var_152_2 == arg_152_0.duck_end then
				arg_152_0.is_ducking = false
				arg_152_1.send_packet = false
			else
				arg_152_1.send_packet = false
			end

			arg_152_1.in_duck = arg_152_0.is_ducking
			arg_152_0.tick_counter = arg_152_0.tick_counter + 1
		elseif arg_152_0.tick_counter > 0 then
			arg_152_0.references.neverlose.dt:override()
			arg_152_0.references.neverlose.hs:override()

			arg_152_0.tick_counter = 0
			arg_152_0.is_ducking = false
		end
	end,
	override_view = function(arg_153_0, arg_153_1)
		local var_153_0 = entity.get_local_player()

		if not var_153_0 or not var_153_0:is_alive() then
			return
		end

		local var_153_1 = entity.get_game_rules()

		if not var_153_1 then
			return
		end

		if var_153_1.m_bFreezePeriod and arg_153_0.references.neverlose.fake_duck:get() then
			arg_153_1.camera.z = var_153_0:get_origin().z + arg_153_0.duck_height
		end
	end
}):struct("side_indicators")({
	indicator_offset = 2,
	indicator_height = 44,
	bomb_icon = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(30, 30)),
	screen_size = render.screen_size(),
	bomb_state = {
		plant_time = 0,
		fill = 0,
		planting_site = "",
		planting = false
	},
	init = function(arg_154_0)
		arg_154_0.font = render.load_font("Calibri", vector(25, 23.5, 0), "bda")

		local function var_154_0(arg_155_0)
			arg_154_0:on_bomb_plant(arg_155_0)
		end

		local function var_154_1()
			arg_154_0:reset_bomb()
		end

		local function var_154_2()
			arg_154_0:render()

			if arg_154_0.ui.elements.side_indicators_spectator_list:get() then
				arg_154_0:render_spectators()
			end
		end

		local function var_154_3(arg_158_0)
			events.bomb_beginplant(var_154_0, arg_158_0:get())
			events.bomb_planted(var_154_1, arg_158_0:get())
			events.bomb_defused(var_154_1, arg_158_0:get())
			events.bomb_abortplant(var_154_1, arg_158_0:get())
			events.round_prestart(var_154_1, arg_158_0:get())
			events.render(var_154_2, arg_158_0:get())
		end

		arg_154_0.ui.elements.side_indicators:set_callback(var_154_3, true)
	end,
	get_bind_state = function(arg_159_0, arg_159_1)
		local var_159_0 = pui.get_binds()

		for iter_159_0 = 1, #var_159_0 do
			if var_159_0[iter_159_0].name == arg_159_1 and var_159_0[iter_159_0].active then
				return true, var_159_0[iter_159_0].value
			end
		end

		return false, 0
	end,
	get_indicators = function(arg_160_0)
		loc_160_1_0 = entity.get_local_player()

		if not loc_160_1_0 or not loc_160_1_0:is_alive() then
			return {}
		end

		loc_160_2_0 = arg_160_0.references.neverlose
		loc_160_3_0 = {}

		if arg_160_0.ui.elements.side_indicators_indicators:get("PING") then
			loc_160_4_1 = loc_160_1_0:get_resource().m_iPing

			if loc_160_2_0.fake_latency:get() > 0 then
				loc_160_5_0 = color(255, 0, 50, 255)
				loc_160_6_0 = color(150, 200, 60, 255)
				loc_160_7_0 = math.min(loc_160_4_1 / arg_160_0.references.neverlose.fake_latency:get(), 1)
				loc_160_8_0 = loc_160_5_0:lerp(loc_160_6_0, loc_160_7_0)

				table.insert(loc_160_3_0, {
					active = true,
					text = "PING",
					color = loc_160_8_0
				})
			end
		end

		if arg_160_0.ui.elements.side_indicators_indicators:get("Double Tap") and loc_160_2_0.dt:get() and not loc_160_2_0.hs:get() then
			loc_160_4_0 = rage.exploit:get() == 1

			table.insert(loc_160_3_0, {
				active = true,
				text = "DT",
				color = loc_160_4_0 and color(200, 207, 200, 255) or color(255, 0, 50, 255)
			})
		end

		if arg_160_0.ui.elements.side_indicators_indicators:get("Hide Shots") and loc_160_2_0.hs:get() then
			table.insert(loc_160_3_0, {
				active = true,
				text = "OSAA",
				color = color(200, 207, 200, 255)
			})
		end

		if arg_160_0.ui.elements.side_indicators_indicators:get("Dormant Aimbot") and loc_160_2_0.dormant_aimbot:get() then
			table.insert(loc_160_3_0, {
				active = true,
				text = "DA",
				color = color(200, 207, 200, 255)
			})
		end

		if arg_160_0.ui.elements.side_indicators_indicators:get("Fake Duck") and loc_160_2_0.fake_duck:get() then
			table.insert(loc_160_3_0, {
				active = true,
				text = "DUCK",
				color = color(200, 207, 200, 255)
			})
		end

		if arg_160_0.ui.elements.side_indicators_indicators:get("Body Aim") and loc_160_2_0.body_aim:get() == "Force" then
			table.insert(loc_160_3_0, {
				active = true,
				text = "BODY",
				color = color(200, 207, 200, 255)
			})
		end

		if arg_160_0.ui.elements.side_indicators_indicators:get("Safe Points") and loc_160_2_0.safe_points:get() == "Force" then
			table.insert(loc_160_3_0, {
				active = true,
				text = "SAFE",
				color = color(200, 207, 200, 255)
			})
		end

		if arg_160_0.ui.elements.side_indicators_indicators:get("Freestanding") and loc_160_2_0.freestanding:get() then
			table.insert(loc_160_3_0, {
				active = true,
				text = "FS",
				color = color(200, 207, 200, 255)
			})
		end

		if arg_160_0.ui.elements.side_indicators_indicators:get("Hitchance") and arg_160_0:get_bind_state("Hit Chance") then
			table.insert(loc_160_3_0, {
				active = true,
				text = "H1TCHANCE",
				color = color(255, 255, 255)
			})
		end

		if arg_160_0.ui.elements.side_indicators_indicators:get("Damage") and arg_160_0:get_bind_state("Min. Damage") then
			table.insert(loc_160_3_0, {
				active = true,
				text = "MD",
				color = color(200, 207, 200, 255)
			})
		end

		arg_160_0:add_bomb_indicators(loc_160_3_0)

		return loc_160_3_0
	end,
	add_bomb_indicators = function(arg_161_0, arg_161_1)
		if not arg_161_0.ui.elements.side_indicators_indicators:get("Bomb Info") then
			return
		end

		local var_161_0 = entity.get_local_player()

		if not var_161_0 or not var_161_0:is_alive() then
			return
		end

		local var_161_1 = entity.get_entities("CPlantedC4", true)[1]

		if var_161_1 then
			local var_161_2 = var_161_1.m_flC4Blow - globals.curtime
			local var_161_3 = var_161_1.m_bBombDefused

			if var_161_2 > 0 and not var_161_3 then
				local var_161_4 = var_161_1.m_nBombSite == 0 and "A" or "B"

				table.insert(arg_161_1, {
					active = true,
					text = string.format("%s - %.1fs", var_161_4, var_161_2),
					color = color(200, 207, 200, 255),
					icon = arg_161_0.bomb_icon
				})

				local var_161_5 = arg_161_0:calculate_bomb_damage(var_161_1, var_161_0)

				if var_161_5 >= var_161_0.m_iHealth then
					table.insert(arg_161_1, {
						active = true,
						text = "FATAL",
						color = color(255, 0, 50, 255)
					})
				elseif var_161_5 > 0.5 then
					table.insert(arg_161_1, {
						active = true,
						text = string.format("-%d HP", math.ceil(var_161_5)),
						color = color(210, 216, 112)
					})
				end
			end
		end

		if arg_161_0.bomb_state.planting then
			arg_161_0.bomb_state.fill = math.min(3.125, 3.125 - (3.125 + arg_161_0.bomb_state.plant_time - globals.curtime))

			table.insert(arg_161_1, {
				active = true,
				text = arg_161_0.bomb_state.planting_site,
				color = color(210, 216, 112),
				progress = arg_161_0.bomb_state.fill / 3.125,
				icon = arg_161_0.bomb_icon
			})
		end
	end,
	calculate_bomb_damage = function(arg_162_0, arg_162_1, arg_162_2)
		local var_162_0 = arg_162_1.m_vecOrigin:dist(arg_162_2.m_vecOrigin)
		local var_162_1 = 450.7 * math.exp(-((var_162_0 - 75.68) / 789.2)^2)
		local var_162_2 = arg_162_2.m_ArmorValue

		if var_162_2 > 0 then
			local var_162_3 = var_162_1 * 0.5
			local var_162_4 = (var_162_1 - var_162_3) * 0.5

			if var_162_2 < var_162_4 then
				local var_162_5 = var_162_2 * 2

				var_162_3 = var_162_1 - var_162_4
			end

			var_162_1 = var_162_3
		end

		return var_162_1
	end,
	render_indicator = function(arg_163_0, arg_163_1, arg_163_2, arg_163_3, arg_163_4, arg_163_5)
		local var_163_0 = arg_163_0.screen_size.x / 100 + 2
		local var_163_1 = arg_163_0.screen_size.y / 1.47 + arg_163_2
		local var_163_2 = render.measure_text(arg_163_0.font, "bad", arg_163_1)
		local var_163_3 = var_163_2.x + (arg_163_5 and arg_163_5.width + 8 or 0)

		render.gradient(vector(var_163_0 - 17, var_163_1), vector(var_163_0 + var_163_3 / 2, var_163_1 + var_163_2.y + 8), color(0, 0, 0, 0), color(0, 0, 0, 55), color(0, 0, 0, 0), color(0, 0, 0, 55))
		render.gradient(vector(var_163_0 + var_163_3 / 2, var_163_1), vector(var_163_0 + var_163_3 + 17, var_163_1 + var_163_2.y + 8), color(0, 0, 0, 55), color(0, 0, 0, 0), color(0, 0, 0, 55), color(0, 0, 0, 0))

		local var_163_4 = var_163_0

		if arg_163_5 then
			render.texture(arg_163_5, vector(var_163_0 + 1, var_163_1 + 3), color(0, 0, 0, 200))
			render.texture(arg_163_5, vector(var_163_0, var_163_1 + 2), arg_163_3)

			var_163_4 = var_163_0 + arg_163_5.width + 8
		end

		render.text(arg_163_0.font, vector(var_163_4, var_163_1 + 5), arg_163_3, "bad", arg_163_1)

		if arg_163_4 then
			local var_163_5 = var_163_0 + var_163_3 + 18
			local var_163_6 = var_163_1 + var_163_2.y / 2 + 2

			render.circle_outline(vector(var_163_5, var_163_6), color(0, 0, 0), 10.5, 90, 1, 4)
			render.circle_outline(vector(var_163_5, var_163_6), arg_163_3, 10, 90, arg_163_4, 3)
		end
	end,
	render = function(arg_164_0)
		if not arg_164_0.ui.elements.side_indicators:get() then
			return
		end

		local var_164_0 = arg_164_0:get_indicators()
		local var_164_1 = 1

		for iter_164_0 = 1, #var_164_0 do
			local var_164_2 = var_164_0[iter_164_0]

			if var_164_2.active then
				arg_164_0:render_indicator(var_164_2.text, var_164_1, var_164_2.color, var_164_2.progress, var_164_2.icon)

				var_164_1 = var_164_1 - arg_164_0.indicator_height
			end
		end
	end,
	render_spectators = function(arg_165_0)
		local var_165_0 = entity.get_local_player()

		if not var_165_0 then
			return
		end

		local var_165_1 = var_165_0.m_hObserverTarget or var_165_0
		local var_165_2 = {}
		local var_165_3 = entity.get_players(false, false)

		for iter_165_0 = 1, #var_165_3 do
			local var_165_4 = var_165_3[iter_165_0]

			if var_165_4.m_hObserverTarget == var_165_1 then
				table.insert(var_165_2, var_165_4:get_name())
			end
		end

		local var_165_5 = 5

		for iter_165_1 = 1, #var_165_2 do
			local var_165_6 = var_165_2[iter_165_1]
			local var_165_7 = render.measure_text(1, nil, var_165_6)

			render.text(1, vector(arg_165_0.screen_size.x - var_165_7.x - 2, var_165_5), color(255, 255, 255), nil, var_165_6)

			var_165_5 = var_165_5 + 17
		end
	end,
	on_bomb_plant = function(arg_166_0, arg_166_1)
		local var_166_0 = entity.get_player_resource()

		if not var_166_0 then
			return
		end

		arg_166_0.bomb_state.plant_time = globals.curtime
		arg_166_0.bomb_state.planting = true

		local var_166_1 = entity.get(arg_166_1.userid, true)

		if var_166_1 then
			local var_166_2 = var_166_1:get_origin()
			local var_166_3 = var_166_2:dist(var_166_0.m_bombsiteCenterA)
			local var_166_4 = var_166_2:dist(var_166_0.m_bombsiteCenterB)

			arg_166_0.bomb_state.planting_site = var_166_3 < var_166_4 and "A" or "B"
		end
	end,
	reset_bomb = function(arg_167_0)
		arg_167_0.bomb_state.planting = false
		arg_167_0.bomb_state.fill = 0
		arg_167_0.bomb_state.plant_time = 0
		arg_167_0.bomb_state.planting_site = ""
	end
}):struct("damage_indicator")({
	font = 1,
	screen = render.screen_size(),
	center = vector(0, 0),
	accent = color(),
	init = function(arg_168_0)
		arg_168_0.center = vector(arg_168_0.screen.x / 2 + 4, arg_168_0.screen.y / 2 - 15)

		local function var_168_0()
			arg_168_0:render()
		end

		local function var_168_1(arg_170_0)
			events.render(var_168_0, arg_170_0:get())
		end

		arg_168_0.ui.elements.damage_indicator:set_callback(var_168_1, true)
	end,
	render = function(arg_171_0)
		local var_171_0 = entity.get_local_player()

		if not var_171_0 or not var_171_0:is_alive() then
			return
		end

		local var_171_1 = pui.get_binds()

		for iter_171_0 = 1, #var_171_1 do
			local var_171_2 = var_171_1[iter_171_0]

			if var_171_2.name == "Min. Damage" and var_171_2.active then
				render.text(arg_171_0.font, arg_171_0.center, arg_171_0.accent, "", tostring(var_171_2.value))

				return
			end
		end
	end
}):struct("scope_overlay")({
	screen = render.screen_size(),
	center = vector(0, 0),
	init = function(arg_172_0)
		arg_172_0.center = vector(math.floor(arg_172_0.screen.x / 2 + 0.5), math.floor(arg_172_0.screen.y / 2 + 0.5))

		local function var_172_0()
			arg_172_0:render()
		end

		local function var_172_1(arg_174_0)
			arg_172_0.references.neverlose.scope_overlay:override(arg_174_0:get() and "Remove All" or nil)
			events.render(var_172_0, arg_174_0:get())
		end

		arg_172_0.ui.elements.scope_overlay:set_callback(var_172_1, true)
	end,
	render = function(arg_175_0)
		arg_175_0.rotated = arg_175_0.ui.elements.scope_overlay_rotated:get()
		arg_175_0.size = arg_175_0.ui.elements.scope_overlay_size:get()
		arg_175_0.gap = arg_175_0.ui.elements.scope_overlay_gap:get()
		arg_175_0.color = {
			main = arg_175_0.ui.elements.scope_overlay_main_accent:get(),
			edge = arg_175_0.ui.elements.scope_overlay_edge_accent:get()
		}

		local var_175_0 = entity.get_local_player()

		if not var_175_0 or not var_175_0:is_alive() or not var_175_0.m_bIsScoped then
			return
		end

		local var_175_1 = 1

		if arg_175_0.rotated then
			render.push_rotation(45, arg_175_0.screen / 2 + 1)
		end

		render.gradient(vector(arg_175_0.center.x, arg_175_0.center.y - arg_175_0.gap - arg_175_0.size), vector(arg_175_0.center.x + var_175_1, arg_175_0.center.y - arg_175_0.gap), arg_175_0.color.edge, arg_175_0.color.edge, arg_175_0.color.main, arg_175_0.color.main)
		render.gradient(vector(arg_175_0.center.x, arg_175_0.center.y + arg_175_0.gap + 1), vector(arg_175_0.center.x + var_175_1, arg_175_0.center.y + arg_175_0.gap + arg_175_0.size), arg_175_0.color.main, arg_175_0.color.main, arg_175_0.color.edge, arg_175_0.color.edge)
		render.gradient(vector(arg_175_0.center.x - arg_175_0.gap - arg_175_0.size, arg_175_0.center.y), vector(arg_175_0.center.x - arg_175_0.gap, arg_175_0.center.y + var_175_1), arg_175_0.color.edge, arg_175_0.color.main, arg_175_0.color.edge, arg_175_0.color.main)
		render.gradient(vector(arg_175_0.center.x + arg_175_0.gap + 1, arg_175_0.center.y), vector(arg_175_0.center.x + arg_175_0.gap + arg_175_0.size, arg_175_0.center.y + var_175_1), arg_175_0.color.main, arg_175_0.color.edge, arg_175_0.color.main, arg_175_0.color.edge)

		if arg_175_0.rotated then
			render.pop_rotation()
		end
	end
}):struct("log_events")({
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
	nbk_map = {
		hegrenade = "Naded",
		knife = "Knifed",
		inferno = "Burned"
	},
	init = function(arg_176_0)
		arg_176_0.references.neverlose.log_events:override("")

		local function var_176_0(arg_177_0)
			arg_176_0:aim_ack(arg_177_0)
		end

		local function var_176_1(arg_178_0)
			arg_176_0:player_hurt(arg_178_0)
		end

		local function var_176_2(arg_179_0)
			arg_176_0:item_purchase(arg_179_0)
		end

		local function var_176_3(arg_180_0)
			events.aim_ack(var_176_0, arg_180_0:get(1))
			events.player_hurt(var_176_1, arg_180_0:get(1))
			events.item_purchase(var_176_2, arg_180_0:get(2))
		end

		arg_176_0.ui.elements.log_events:set_callback(var_176_3, true)
	end,
	branded_printing = function(arg_181_0, arg_181_1)
		local var_181_0 = arg_181_0.ui.elements.log_events_accent:get()
		local var_181_1 = string.format("[%s] %s", "\a" .. var_181_0:to_hex() .. "Lua\aDEFAULTSense", arg_181_1)

		print_raw(var_181_1)
		print_dev(var_181_1)
	end,
	aim_ack = function(arg_182_0, arg_182_1)
		local var_182_0 = arg_182_1.target

		if var_182_0 == nil then
			return
		end

		local var_182_1 = arg_182_1.state
		local var_182_2 = var_182_0:get_name()
		local var_182_3 = var_182_0.m_iHealth
		local var_182_4 = arg_182_1.spread
		local var_182_5 = arg_182_1.backtrack
		local var_182_6 = arg_182_1.hitchance
		local var_182_7 = arg_182_1.damage
		local var_182_8 = arg_182_1.wanted_damage
		local var_182_9 = arg_182_0.hitgroups[arg_182_1.hitgroup]
		local var_182_10 = arg_182_0.hitgroups[arg_182_1.wanted_hitgroup]
		local var_182_11 = arg_182_0.ui.elements.log_events_accent:get():to_hex()

		if var_182_1 == nil then
			local var_182_12 = string.format("\a%sRegistered \aDEFAULTshot at %s\aDEFAULT's %s for \a%s%d(%d) \aDEFAULTdamage (hp: \a%s%d\aDEFAULT) (aimed: \a%s%s\aDEFAULT) (bt: \a%s%s\aDEFAULT) (spread: \a%s%.1f°\aDEFAULT)", var_182_11, var_182_2, var_182_9, var_182_11, var_182_7, var_182_8, var_182_11, var_182_3, var_182_11, var_182_10, var_182_11, var_182_5, var_182_11, var_182_4)

			arg_182_0:branded_printing(var_182_12)
			arg_182_0.notifications:push_notify(string.format("\a%s  \aDEFAULTHit \a%s%s\aDEFAULT's \a%s%s \aDEFAULTfor \a%s%d \aDEFAULTdamage (bt: \a%s%d\aDEFAULT)", var_182_11, var_182_11, var_182_2, var_182_11, var_182_9, var_182_11, var_182_7, var_182_11, var_182_5), 3.5)

			return
		end

		text = string.format("\a%sMissed \aDEFAULTshot at %s\aDEFAULT's %s due to \a%s%s \aDEFAULT(hc: \a%s%d%%\aDEFAULT) (damage: \a%s%d\aDEFAULT) (bt: \a%s%s\aDEFAULT)", var_182_11, var_182_2, var_182_10, var_182_11, var_182_1, var_182_11, var_182_6, var_182_11, var_182_8, var_182_11, var_182_5)

		if var_182_4 ~= nil then
			text = string.format("%s (spread: \a%s%.1f°\aDEFAULT)", text, var_182_11, var_182_4)
		end

		arg_182_0:branded_printing(text)
		arg_182_0.notifications:push_notify(string.format("\a%s  \aDEFAULTMissed \a%s%s\aDEFAULT's \a%s%s \aDEFAULTdue to \a%s%s \aDEFAULT(bt: \a%s%s\aDEFAULT)", var_182_11, var_182_11, var_182_2, var_182_11, var_182_10, var_182_11, var_182_1, var_182_11, var_182_5), 3.5)
	end,
	player_hurt = function(arg_183_0, arg_183_1)
		local var_183_0 = entity.get_local_player()
		local var_183_1 = entity.get(arg_183_1.userid, true)
		local var_183_2 = entity.get(arg_183_1.attacker, true)

		if var_183_0 == nil or var_183_1 == nil or var_183_2 == nil then
			return
		end

		if var_183_1 == var_183_0 or var_183_2 ~= var_183_0 then
			return
		end

		local var_183_3 = arg_183_0.nbk_map[arg_183_1.weapon]

		if var_183_3 == nil then
			return
		end

		local var_183_4 = var_183_1:get_name()
		local var_183_5 = arg_183_0.ui.elements.log_events_accent:get():to_hex()
		local var_183_6 = string.format("%s \a%s%s \aDEFAULTfor \a%s%d \aDEFAULTdamage (%d health remaining)", var_183_3, var_183_5, var_183_4, var_183_5, arg_183_1.dmg_health, arg_183_1.health)

		arg_183_0:branded_printing(var_183_6)
	end,
	item_purchase = function(arg_184_0, arg_184_1)
		local var_184_0 = entity.get(arg_184_1.userid, true)

		if var_184_0 == nil or not var_184_0:is_enemy() then
			return
		end

		local var_184_1 = arg_184_1.weapon

		if var_184_1 == "weapon_unknown" then
			return
		end

		local var_184_2 = var_184_0:get_name()
		local var_184_3 = arg_184_0.ui.elements.log_events_accent:get():to_hex()
		local var_184_4 = string.format("\a%s%s \aDEFAULTbought \a%s%s\aDEFAULT", var_184_3, var_184_2, var_184_3, var_184_1)

		arg_184_0:branded_printing(var_184_4)
	end
}):struct("clan_tag_spammer")({
	delay = 15,
	step = 1,
	list = {
		"lu ",
		"lua ",
		"luas ",
		"luase ",
		"luasen ",
		"luasens ",
		"luasense ",
		"luasense ",
		"luasense ",
		"luasense ",
		"luasense ",
		"luasense ",
		"luasense ",
		"luasense ",
		"luasense ",
		"luasense ",
		"luasense ",
		"luasense ",
		"luasense ",
		"asense ",
		"sense ",
		"ense ",
		"nse ",
		"se ",
		"e ",
		""
	},
	init = function(arg_185_0)
		local function var_185_0()
			arg_185_0:animation()
		end

		local function var_185_1(arg_187_0)
			if arg_187_0:get() then
				arg_185_0.references.neverlose.clan_tag:override(false)
				events.net_update_end(var_185_0, true)
			else
				arg_185_0.references.neverlose.clan_tag:override()
				common.set_clan_tag("")
				events.net_update_end(var_185_0, false)
			end
		end

		arg_185_0.ui.elements.clan_tag_spammer:set_callback(var_185_1, true)
	end,
	animation = function(arg_188_0)
		local var_188_0 = math.floor(globals.tickcount / arg_188_0.delay) % #arg_188_0.list + 1

		if var_188_0 == arg_188_0.step then
			return
		end

		arg_188_0.step = var_188_0

		common.set_clan_tag(arg_188_0.list[var_188_0])
	end
}):struct("hitmarkers")({
	center_y = 0,
	center_x = 0,
	world_fade_time = 0.25,
	screen_duration = 1,
	screen_fade_time = 0.25,
	screen_wait_time = 0.25,
	screen_active = false,
	hit_markers = {},
	screen_vectors = {},
	screen_offsets = {
		{
			5,
			5,
			10,
			10
		},
		{
			-5,
			5,
			-10,
			10
		},
		{
			-5,
			-5,
			-10,
			-10
		},
		{
			5,
			-5,
			10,
			-10
		}
	},
	init = function(arg_189_0)
		local var_189_0 = render.screen_size()

		arg_189_0.center_x = var_189_0.x * 0.5
		arg_189_0.center_y = var_189_0.y * 0.5

		for iter_189_0 = 1, 4 do
			arg_189_0.screen_vectors[iter_189_0] = {
				v1 = vector(0, 0),
				v2 = vector(0, 0)
			}
		end

		local function var_189_1()
			if not arg_189_0.screen_active or not globals.is_in_game then
				return
			end

			local var_190_0 = globals.frametime

			arg_189_0.screen_wait_time = arg_189_0.screen_wait_time - var_190_0

			if arg_189_0.screen_wait_time <= 0 then
				arg_189_0.screen_duration = arg_189_0.screen_duration - var_190_0 / arg_189_0.screen_fade_time

				if arg_189_0.screen_duration <= 0 then
					arg_189_0.screen_active = false

					return
				end
			end

			local var_190_1 = arg_189_0.ui.elements.hitmarkers_screen_accent:get() * arg_189_0.screen_duration
			local var_190_2 = arg_189_0.center_x
			local var_190_3 = arg_189_0.center_y

			for iter_190_0 = 1, 4 do
				local var_190_4 = arg_189_0.screen_offsets[iter_190_0]
				local var_190_5 = arg_189_0.screen_vectors[iter_190_0]

				var_190_5.v1.x = var_190_2 + var_190_4[1]
				var_190_5.v1.y = var_190_3 + var_190_4[2]
				var_190_5.v2.x = var_190_2 + var_190_4[3]
				var_190_5.v2.y = var_190_3 + var_190_4[4]

				render.line(var_190_5.v1, var_190_5.v2, var_190_1)
			end
		end

		local function var_189_2()
			local var_191_0 = arg_189_0.hit_markers
			local var_191_1 = #var_191_0

			if var_191_1 == 0 then
				return
			end

			local var_191_2 = globals.frametime
			local var_191_3 = var_191_2 / arg_189_0.world_fade_time
			local var_191_4 = var_191_1

			while var_191_4 > 0 do
				local var_191_5 = var_191_0[var_191_4]

				if var_191_5.wait_time > 0 then
					var_191_5.wait_time = var_191_5.wait_time - var_191_2
				else
					var_191_5.fade_time = var_191_5.fade_time - var_191_3
				end

				if var_191_5.fade_time <= 0 then
					var_191_0[var_191_4] = var_191_0[var_191_1]
					var_191_0[var_191_1] = nil
					var_191_1 = var_191_1 - 1
				elseif var_191_5.position and not var_191_5.reason then
					local var_191_6 = render.world_to_screen(var_191_5.position)

					if var_191_6 then
						local var_191_7, var_191_8 = arg_189_0.ui.elements.hitmarkers_world_accent:get()
						local var_191_9
						local var_191_10

						if var_191_7 == "Double" then
							var_191_9 = var_191_8[1]
							var_191_10 = var_191_8[2]
						else
							var_191_9 = arg_189_0.ui.elements.hitmarkers_world_accent:get("Simple")[1]
							var_191_10 = var_191_9
						end

						local var_191_11 = var_191_5.fade_time * 255
						local var_191_12 = var_191_6.x
						local var_191_13 = var_191_6.y

						render.rect(vector(var_191_12 - 1, var_191_13 - 5), vector(var_191_12 + 1, var_191_13 + 5), color(var_191_10.r, var_191_10.g, var_191_10.b, var_191_11), 0, true)
						render.rect(vector(var_191_12 - 5, var_191_13 - 1), vector(var_191_12 + 5, var_191_13 + 1), color(var_191_9.r, var_191_9.g, var_191_9.b, var_191_11), 0, true)
					end
				end

				var_191_4 = var_191_4 - 1
			end
		end

		local function var_189_3()
			for iter_192_0 in pairs(arg_189_0.hit_markers) do
				arg_189_0.hit_markers[iter_192_0] = nil
			end

			arg_189_0.screen_active = false
		end

		local function var_189_4(arg_193_0)
			if entity.get_local_player() == entity.get(arg_193_0.userid, true) then
				arg_189_0.screen_active = false
			end
		end

		local function var_189_5(arg_194_0)
			arg_189_0.hit_markers[#arg_189_0.hit_markers + 1] = {
				fade_time = 1,
				position = arg_194_0.aim,
				wait_time = arg_189_0.ui.elements.hitmarkers_world_duration:get() * 0.5,
				reason = arg_194_0.state
			}
		end

		local function var_189_6(arg_195_0)
			if entity.get_local_player() == entity.get(arg_195_0.attacker, true) then
				arg_189_0.screen_active = true
				arg_189_0.screen_duration = 1
				arg_189_0.screen_wait_time = arg_189_0.ui.elements.hitmarkers_screen_duration:get() * 0.5
			end
		end

		local function var_189_7(arg_196_0)
			local var_196_0 = arg_196_0:get(1)
			local var_196_1 = arg_196_0:get(2)
			local var_196_2 = var_196_0 or var_196_1

			events.render(var_189_1, var_196_0)
			events.render(var_189_2, var_196_1)
			events.round_start(var_189_3, var_196_2)
			events.player_spawned(var_189_4, var_196_0)
			events.aim_ack(var_189_5, var_196_1)
			events.player_hurt(var_189_6, var_196_0)
		end

		arg_189_0.ui.elements.hitmarkers:set_callback(var_189_7, true)
	end
}):struct("keep_model_transparency")({
	transparency = 255,
	fade_speed = 10,
	init = function(arg_197_0)
		local function var_197_0(arg_198_0)
			return arg_197_0:override(arg_198_0)
		end

		local function var_197_1(arg_199_0)
			events.localplayer_transparency(var_197_0, arg_199_0:get())
		end

		arg_197_0.ui.elements.keep_transparency:set_callback(var_197_1, true)
	end,
	override = function(arg_200_0, arg_200_1)
		local var_200_0 = entity.get_local_player()

		if not var_200_0 or not var_200_0:is_alive() then
			return arg_200_1
		end

		local var_200_1 = var_200_0:get_player_weapon()

		if not var_200_1 then
			return arg_200_1
		end

		local var_200_2 = var_200_1:get_classname()

		if var_200_2:match("[Gg]renade") or var_200_2:match("[Ff]lashbang") then
			return arg_200_1
		end

		local var_200_3 = (var_200_0.m_bIsScoped or var_200_0.m_bResumeZoom) and 59 or 255

		if arg_200_0.transparency ~= var_200_3 then
			local var_200_4 = var_200_3 - arg_200_0.transparency

			if var_200_4 > 0 then
				arg_200_0.transparency = arg_200_0.transparency + math.min(var_200_4, arg_200_0.fade_speed)
			else
				arg_200_0.transparency = arg_200_0.transparency + math.max(var_200_4, -arg_200_0.fade_speed)
			end
		end

		return arg_200_0.transparency
	end
}):struct("slowed_down_indicator")({
	screen = render.screen_size(),
	config = {
		bar_width = 150,
		animation = {
			fade_speed = 10,
			drag_speed = 6,
			hover_speed = 8
		}
	},
	state = {
		hover = false,
		dragging = false,
		drag_offset = vector(0, 0),
		animations = {
			hover_alpha = 0,
			death_fade = 1,
			velocity_modifier = 1,
			base_alpha = 0,
			background_alpha = 0
		}
	},
	init = function(arg_201_0)
		arg_201_0.state.position = vector(arg_201_0.screen.x * 0.5 - arg_201_0.config.bar_width * 0.5, arg_201_0.screen.y * 0.35)

		local function var_201_0()
			arg_201_0:render()
		end

		local function var_201_1()
			if pui.get_alpha() > 0 and arg_201_0.state.hover or arg_201_0.state.dragging then
				return false
			else
				return
			end
		end

		local function var_201_2(arg_204_0)
			events.mouse_input(var_201_1, arg_204_0:get())
			events.render(var_201_0, arg_204_0:get())
		end

		arg_201_0.ui.elements.slowed_down_indicator:set_callback(var_201_2, true)
	end,
	lerp = function(arg_205_0, arg_205_1, arg_205_2, arg_205_3)
		return arg_205_1 + (arg_205_2 - arg_205_1) * math.min(globals.frametime * arg_205_3, 1)
	end,
	handle_input = function(arg_206_0)
		if pui.get_alpha() == 0 then
			return
		end

		local var_206_0 = pui.get_mouse_position()
		local var_206_1 = common.is_button_down(1)
		local var_206_2 = arg_206_0.config.bar_width
		local var_206_3 = 23
		local var_206_4 = 6
		local var_206_5 = var_206_0.x >= arg_206_0.state.position.x - var_206_4 and var_206_0.x <= arg_206_0.state.position.x + var_206_2 + var_206_4 and var_206_0.y >= arg_206_0.state.position.y - var_206_4 and var_206_0.y <= arg_206_0.state.position.y + var_206_3 + var_206_4

		arg_206_0.state.hover = var_206_5

		if var_206_1 and var_206_5 and not arg_206_0.state.dragging then
			arg_206_0.state.dragging = true
			arg_206_0.state.drag_offset = var_206_0 - arg_206_0.state.position
		end

		if arg_206_0.state.dragging then
			if var_206_1 then
				local var_206_6 = var_206_0 - arg_206_0.state.drag_offset

				var_206_6.x = math.max(0, math.min(arg_206_0.screen.x - var_206_2, var_206_6.x))
				var_206_6.y = math.max(0, math.min(arg_206_0.screen.y - var_206_3, var_206_6.y))
				arg_206_0.state.position = var_206_6

				if arg_206_0.ui.elements.slowed_down_x then
					arg_206_0.ui.elements.slowed_down_x:set(var_206_6.x)
				end

				if arg_206_0.ui.elements.slowed_down_y then
					arg_206_0.ui.elements.slowed_down_y:set(var_206_6.y)
				end
			else
				arg_206_0.state.dragging = false
			end
		end
	end,
	render = function(arg_207_0)
		loc_207_1_0 = entity.get_local_player()

		if not loc_207_1_0 and pui.get_alpha() == 0 then
			return
		end

		loc_207_2_0 = pui.get_alpha()
		loc_207_3_0 = loc_207_1_0 and loc_207_1_0:is_alive() or loc_207_2_0 == 1
		loc_207_4_0 = loc_207_2_0 == 1 and 0.5 or loc_207_1_0 and loc_207_1_0.m_flVelocityModifier or 1
		loc_207_5_0 = loc_207_3_0 and 1 or 0
		arg_207_0.state.animations.death_fade = arg_207_0:lerp(arg_207_0.state.animations.death_fade, loc_207_5_0, arg_207_0.config.animation.fade_speed)
		loc_207_6_0 = (arg_207_0.state.dragging or loc_207_4_0 < 1) and 255 or 0
		arg_207_0.state.animations.base_alpha = arg_207_0:lerp(arg_207_0.state.animations.base_alpha, loc_207_6_0 * arg_207_0.state.animations.death_fade, arg_207_0.config.animation.fade_speed)

		if arg_207_0.state.animations.base_alpha < 1 then
			return
		end

		arg_207_0.state.animations.velocity_modifier = arg_207_0:lerp(arg_207_0.state.animations.velocity_modifier, loc_207_4_0, 8)

		if arg_207_0.ui.elements.slowed_down_x and arg_207_0.ui.elements.slowed_down_y then
			arg_207_0.state.position = vector(arg_207_0.ui.elements.slowed_down_x:get(), arg_207_0.ui.elements.slowed_down_y:get())
		end

		loc_207_7_0 = (arg_207_0.ui.elements.slowed_down_accent:get() or color(147, 190, 255)):alpha_modulate(arg_207_0.state.animations.base_alpha)
		loc_207_8_0 = color(255, 255, 255):alpha_modulate(arg_207_0.state.animations.base_alpha)
		loc_207_9_0 = color(0, 0, 0):alpha_modulate(math.min(200, arg_207_0.state.animations.base_alpha))
		loc_207_10_0 = "Max velocity reduced by"
		loc_207_11_0 = math.floor((1 - arg_207_0.state.animations.velocity_modifier) * 100)
		loc_207_12_0 = string.format("%s %d%%", loc_207_10_0, loc_207_11_0)
		loc_207_13_0 = vector(arg_207_0.config.bar_width, 6)

		arg_207_0:handle_input()

		loc_207_14_0 = 0

		if arg_207_0.state.hover and loc_207_2_0 > 0 then
			loc_207_14_0 = 0.3
		end

		if arg_207_0.state.dragging then
			loc_207_14_0 = 0.5
		end

		arg_207_0.state.animations.background_alpha = arg_207_0:lerp(arg_207_0.state.animations.background_alpha, loc_207_14_0, arg_207_0.config.animation.hover_speed)

		if arg_207_0.state.animations.background_alpha > 0.01 then
			loc_207_15_1 = math.floor(arg_207_0.state.animations.background_alpha * 40)
			loc_207_16_1 = color(255, 255, 255, loc_207_15_1)
			loc_207_17_1 = 8
			loc_207_18_0 = 15 + loc_207_13_0.y + 2
			loc_207_19_0 = math.floor(arg_207_0.state.animations.background_alpha * 20)
			loc_207_20_0 = color(0, 0, 0, loc_207_19_0)

			render.shadow(arg_207_0.state.position - vector(loc_207_17_1, loc_207_17_1), arg_207_0.state.position + vector(arg_207_0.config.bar_width + loc_207_17_1, loc_207_18_0 + loc_207_17_1), loc_207_20_0, 20, 2, 4)
			render.rect(arg_207_0.state.position - vector(loc_207_17_1, loc_207_17_1), arg_207_0.state.position + vector(arg_207_0.config.bar_width + loc_207_17_1, loc_207_18_0 + loc_207_17_1), loc_207_16_1, 4)

			loc_207_21_0 = math.floor(arg_207_0.state.animations.background_alpha * 60)
			loc_207_22_0 = color(255, 255, 255, loc_207_21_0)

			render.rect_outline(arg_207_0.state.position - vector(loc_207_17_1, loc_207_17_1), arg_207_0.state.position + vector(arg_207_0.config.bar_width + loc_207_17_1, loc_207_18_0 + loc_207_17_1), loc_207_22_0, 1, 4)
		end

		render.text(1, arg_207_0.state.position, loc_207_8_0, nil, loc_207_12_0)

		loc_207_15_0 = arg_207_0.state.position + vector(0, 15)
		loc_207_16_0 = loc_207_15_0 + loc_207_13_0

		render.rect(loc_207_15_0 - 1, loc_207_16_0 + 1, loc_207_9_0, 2)
		render.shadow(loc_207_15_0 - 1, loc_207_16_0 + 1, loc_207_7_0, 25, 0, 3)

		loc_207_17_0 = 1 - arg_207_0.state.animations.velocity_modifier

		render.rect(loc_207_15_0 + 1, loc_207_15_0 + vector(loc_207_13_0.x * loc_207_17_0, loc_207_13_0.y) - 1, loc_207_7_0, 2)
	end
}):struct("manual_arrows")({
	screen = render.screen_size(),
	center = vector(0, 0),
	default_accent = color(35, 35, 35, 150),
	init = function(arg_208_0)
		arg_208_0.center_x = arg_208_0.screen.x / 2
		arg_208_0.center_y = arg_208_0.screen.y / 2 - 2

		local function var_208_0()
			arg_208_0:render()
		end

		local function var_208_1(arg_210_0)
			events.render(var_208_0, arg_210_0:get())
		end

		arg_208_0.ui.elements.manual_arrows:set_callback(var_208_1, true)
	end,
	render = function(arg_211_0)
		local var_211_0 = entity.get_local_player()

		if not var_211_0 or not var_211_0:is_alive() then
			return
		end

		local var_211_1 = arg_211_0.references.neverlose.yaw.offset:get_override()
		local var_211_2 = rage.antiaim:inverter()
		local var_211_3 = arg_211_0.ui.elements.manaul_arrows_yaw_accent:get()
		local var_211_4 = arg_211_0.ui.elements.manaul_arrows_body_accent:get()

		render.poly(var_211_1 == -90 and var_211_3 or arg_211_0.default_accent, vector(arg_211_0.center_x - 55, arg_211_0.center_y + 2), vector(arg_211_0.center_x - 42, arg_211_0.center_y - 7), vector(arg_211_0.center_x - 42, arg_211_0.center_y + 11))
		render.poly(var_211_1 == 90 and var_211_3 or arg_211_0.default_accent, vector(arg_211_0.center_x + 55, arg_211_0.center_y + 2), vector(arg_211_0.center_x + 42, arg_211_0.center_y - 7), vector(arg_211_0.center_x + 42, arg_211_0.center_y + 11))
		render.rect(vector(arg_211_0.center_x - 40, arg_211_0.center_y - 7), vector(arg_211_0.center_x - 38, arg_211_0.center_y + 11), var_211_2 and var_211_4 or arg_211_0.default_accent)
		render.rect(vector(arg_211_0.center_x + 38, arg_211_0.center_y - 7), vector(arg_211_0.center_x + 40, arg_211_0.center_y + 11), not var_211_2 and var_211_4 or arg_211_0.default_accent)
	end
}):struct("quick_throw")({
	enabled = false,
	sv_infinite_ammo = cvar.sv_infinite_ammo,
	init = function(arg_212_0)
		events.grenade_thrown(function(arg_213_0)
			arg_212_0:on_grenade_thrown(arg_213_0)
		end)
		events.weapon_fire(function(arg_214_0)
			arg_212_0:on_weapon_fire(arg_214_0)
		end)
		arg_212_0.ui.elements.quick_throw:set_callback(function()
			arg_212_0:toggle(arg_212_0.ui.elements.quick_throw:get())
		end, true)
	end,
	toggle = function(arg_216_0, arg_216_1)
		arg_216_0.enabled = arg_216_1

		arg_216_0:update_weapon_actions()
	end,
	update_weapon_actions = function(arg_217_0)
		if not arg_217_0.enabled then
			arg_217_0.references.neverlose.weapon_actions:override()

			return
		end

		local var_217_0 = arg_217_0.references.neverlose.weapon_actions:get_override() or arg_217_0.references.neverlose.weapon_actions:get()

		for iter_217_0 = #var_217_0, 1, -1 do
			if var_217_0[iter_217_0] == "Quick Switch" then
				table.remove(var_217_0, iter_217_0)
			end
		end

		arg_217_0.references.neverlose.weapon_actions:override(var_217_0)
	end,
	on_grenade_thrown = function(arg_218_0, arg_218_1)
		if not arg_218_0.enabled then
			return
		end

		if entity.get_local_player() ~= entity.get(arg_218_1.userid, true) then
			return
		end

		utils.execute_after(globals.tickinterval, utils.console_exec, "slot3; slot2; slot1")
	end,
	on_weapon_fire = function(arg_219_0, arg_219_1)
		if not arg_219_0.enabled then
			return
		end

		if arg_219_1.weapon ~= "weapon_taser" then
			return
		end

		if arg_219_0.sv_infinite_ammo:int() == 1 then
			return
		end

		if entity.get_local_player() ~= entity.get(arg_219_1.userid, true) then
			return
		end

		utils.console_exec("slot3; slot2; slot1")
	end
}):struct("shutdown")({
	dump = function(arg_220_0)
		events.shutdown(function()
			cvar.r_aspectratio:float(0, true)
			cvar.viewmodel_fov:float(58, true)
			cvar.viewmodel_offset_x:float(0, true)
			cvar.viewmodel_offset_y:float(0, true)
			cvar.viewmodel_offset_z:float(0, true)
			cvar.cl_use_new_headbob:int(1)
			cvar.cl_bob_lower_amt:float(21)
			cvar.cl_bobamt_lat:float(0.4)
			cvar.cl_bobamt_vert:float(0.25)
			cvar.cl_bobcycle:float(0.98)
			cvar.sv_maxunlag:float(0.2)
			arg_220_0.references.neverlose.scope_overlay:override()
			arg_220_0.references.neverlose.log_events:override()
			arg_220_0.references.neverlose.clan_tag:override()
			arg_220_0.references.neverlose.weapon_actions:override()
			common.set_clan_tag("")
		end)
	end
})

script.sidebar:init()
script.presets:init()
script.ui:init()
script.notifications:init()
script.states:init()
script.antiaim:init()
script.defensive:init()
script.tweaks:init()
script.csa:init()
script.avoid_fall_damage:init()
script.fast_ladder:init()
script.avoid_collisions:init()
script.watermark:init()
script.magic_key:init()
script.fake_duck_speed:init()
script.fake_duck_freezetime:init()
script.side_indicators:init()
script.damage_indicator:init()
script.scope_overlay:init()
script.log_events:init()
script.clan_tag_spammer:init()
script.hitmarkers:init()
script.keep_model_transparency:init()
script.slowed_down_indicator:init()
script.manual_arrows:init()
script.quick_throw:init()
script.shutdown:dump()
