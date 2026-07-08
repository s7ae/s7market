slot_0_0_0 = require("neverlose/pui")
slot_0_1_0 = require("ffi")
slot_0_2_0 = require("neverlose/sec-base64")
slot_0_3_0 = nil

pcall(function()
	slot_0_3_0 = require("neverlose/anti_aim")
end)

slot_0_4_0 = nil

pcall(function()
	slot_0_4_0 = require("neverlose/hashing")
end)

slot_0_5_0 = "amnesia.plus/v1/peers:"

function slot_0_6_0(arg_3_0)
	if arg_3_0 == nil then
		return ""
	end

	local var_3_0 = type(arg_3_0)
	local var_3_1

	if var_3_0 == "number" then
		var_3_1 = string.format("%.0f", arg_3_0)
	else
		var_3_1 = tostring(arg_3_0)
	end

	return (var_3_1:gsub("%D", ""))
end

function slot_0_7_0()
	local var_4_0

	pcall(function()
		if panorama and panorama.MyPersonaAPI and panorama.MyPersonaAPI.GetXuid then
			var_4_0 = panorama.MyPersonaAPI.GetXuid()
		end
	end)

	var_4_0 = slot_0_6_0(var_4_0)

	if var_4_0 ~= "" and var_4_0 ~= "0" then
		return var_4_0
	end

	pcall(function()
		local var_6_0 = entity.get_local_player()

		if var_6_0 and ram.ap_entity_steamid64 then
			var_4_0 = ram.ap_entity_steamid64(var_6_0)
		end
	end)

	if var_4_0 == "" or var_4_0 == "0" then
		return nil
	end

	return var_4_0
end

function slot_0_8_0(arg_7_0)
	if not slot_0_4_0 or type(slot_0_4_0.sha256) ~= "function" then
		return nil
	end

	arg_7_0 = slot_0_6_0(arg_7_0)

	if arg_7_0 == "" or arg_7_0 == "0" then
		return nil
	end

	return slot_0_4_0.sha256(slot_0_5_0 .. arg_7_0)
end

function slot_0_9_0()
	local var_8_0 = entity.get_local_player()

	if not var_8_0 then
		return nil
	end

	local var_8_1, var_8_2 = pcall(function()
		local var_9_0 = var_8_0:get_player_info()

		if var_9_0 and var_9_0.userid ~= nil then
			return tonumber(var_9_0.userid)
		end

		return nil
	end)

	if var_8_1 then
		return var_8_2
	end

	return nil
end

function slot_0_10_0()
	return slot_0_8_0(slot_0_7_0())
end

slot_0_11_0 = "amnesia.plus/v1/server:"

function slot_0_12_0(arg_11_0)
	if type(arg_11_0) ~= "string" then
		return false
	end

	local var_11_0 = arg_11_0:gsub("^%s+", ""):gsub("%s+$", "")

	if var_11_0 == "" then
		return false
	end

	local var_11_1 = var_11_0:lower()

	if var_11_1 == "client" or var_11_1 == "server" or var_11_1 == "local" or var_11_1 == "loopback" then
		return false
	end

	return true
end

function slot_0_13_0()
	local var_12_0

	pcall(function()
		if panorama and panorama.GameStateAPI and type(panorama.GameStateAPI.GetServerName) == "function" then
			local var_13_0 = tostring(panorama.GameStateAPI.GetServerName() or "")

			if slot_0_12_0(var_13_0) then
				var_12_0 = var_13_0:gsub("^%s+", ""):gsub("%s+$", "")
			end
		end
	end)

	return var_12_0
end

function slot_0_14_0()
	local var_14_0

	pcall(function()
		local var_15_0 = utils.net_channel()

		if not var_15_0 or var_15_0.is_loopback then
			return
		end

		local var_15_1 = var_15_0:get_server_info()

		if not var_15_1 then
			return
		end

		local var_15_2 = var_15_1.address ~= nil and tostring(var_15_1.address):gsub("%s+", "") or nil

		if var_15_2 == "" or var_15_2 == "loopback" then
			var_15_2 = nil
		end

		local var_15_3 = slot_0_13_0()

		if not var_15_3 and var_15_1.name ~= nil then
			local var_15_4 = tostring(var_15_1.name):gsub("^%s+", ""):gsub("%s+$", "")

			if slot_0_12_0(var_15_4) then
				var_15_3 = var_15_4
			end
		end

		if var_15_2 or var_15_3 then
			var_14_0 = {
				address = var_15_2,
				name = var_15_3
			}
		end
	end)

	return var_14_0
end

function slot_0_15_0()
	local var_16_0 = slot_0_14_0()

	return var_16_0 and var_16_0.address or nil
end

function slot_0_16_0()
	if not slot_0_4_0 or type(slot_0_4_0.sha256) ~= "function" then
		return nil
	end

	local var_17_0 = slot_0_15_0()

	if not var_17_0 then
		return nil
	end

	return slot_0_4_0.sha256(slot_0_11_0 .. var_17_0)
end

slot_0_17_0 = {
	version = "2.0.5",
	name = "amnesia.plus"
}
slot_0_18_0 = tostring(common.get_username() or "unknown")
slot_0_19_0 = {
	live = {
		icon = "\x01\f<signal-stream>",
		title = "Live"
	},
	alpha = {
		icon = "\x01\f<flask>",
		title = "Alpha"
	},
	debug = {
		icon = "\x01\f<bug>",
		title = "Debug"
	},
	developer = {
		icon = "\x01\f<laptop-code>",
		title = "Developer"
	}
}
slot_0_20_0 = {
	"live",
	"alpha",
	"debug",
	"developer"
}
slot_0_21_0 = {
	debug = 3,
	developer = 4,
	alpha = 2,
	live = 1
}
slot_0_22_0 = "Akkov"

function slot_0_23_0(arg_18_0)
	return string.lower(tostring(arg_18_0 or "")) == string.lower(slot_0_22_0)
end

slot_0_24_0 = nil
slot_0_25_0 = nil
slot_0_26_0 = "ap_alpha_dlc_pending"
slot_0_27_0 = "ap_alpha_dlc_ack"
slot_0_28_0 = "ap_alpha_claimed_at"

function slot_0_29_0()
	local var_19_0 = db[slot_0_26_0]

	if var_19_0 == true then
		return true
	end

	return tonumber(var_19_0) ~= nil
end

function slot_0_30_0()
	local var_20_0 = db[slot_0_27_0]

	if var_20_0 == true then
		return true
	end

	return tonumber(var_20_0)
end

function slot_0_31_0(arg_21_0)
	local var_21_0 = slot_0_30_0()

	if var_21_0 == true then
		return false
	end

	arg_21_0 = tonumber(arg_21_0) or 0

	if arg_21_0 <= 0 then
		return false
	end

	local var_21_1

	var_21_1 = tonumber(var_21_0) or 0

	return var_21_1 < arg_21_0
end

function slot_0_32_0(arg_22_0)
	arg_22_0 = tonumber(arg_22_0) or 0

	local var_22_0 = tonumber(ram and ram.api_alpha_dlc_claimed_at) or 0
	local var_22_1 = tonumber(db[slot_0_28_0]) or 0
	local var_22_2 = math.max(arg_22_0, var_22_0, var_22_1)

	if var_22_2 > 0 then
		db[slot_0_28_0] = var_22_2
	end

	return var_22_2
end

function slot_0_33_0(arg_23_0)
	if slot_0_29_0() then
		return true
	end

	local var_23_0 = slot_0_30_0()

	if var_23_0 == true or type(var_23_0) == "number" and var_23_0 > 0 then
		return true
	end

	arg_23_0 = tonumber(arg_23_0) or tonumber(ram and ram.api_alpha_dlc_claimed_at) or 0

	if arg_23_0 > 0 then
		return true
	end

	return (tonumber(db[slot_0_28_0]) or 0) > 0
end

function slot_0_34_0()
	db[slot_0_26_0] = nil
end

function slot_0_35_0()
	local var_25_0 = db[slot_0_26_0]

	if var_25_0 == true then
		return math.floor(globals.realtime or 0)
	end

	return tonumber(var_25_0)
end

function slot_0_36_0(arg_26_0)
	arg_26_0 = tonumber(arg_26_0) or 0

	local var_26_0 = tonumber(ram and ram.api_alpha_dlc_claimed_at) or 0
	local var_26_1 = slot_0_30_0()
	local var_26_2 = math.max(arg_26_0, var_26_0)

	if type(var_26_1) == "number" then
		var_26_2 = math.max(var_26_2, var_26_1)
	end

	if var_26_2 > 0 then
		db[slot_0_27_0] = var_26_2
	else
		db[slot_0_27_0] = true
	end

	slot_0_32_0(math.max(arg_26_0, var_26_0))
	slot_0_34_0()
end

function slot_0_37_0(arg_27_0)
	if slot_0_29_0() then
		local var_27_0 = slot_0_35_0()

		if var_27_0 and slot_0_31_0(var_27_0) then
			return true
		end

		return false
	end

	arg_27_0 = tonumber(arg_27_0) or 0

	return slot_0_31_0(arg_27_0)
end

function slot_0_38_0(arg_28_0)
	arg_28_0 = tostring(arg_28_0 or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")

	if arg_28_0 == "" then
		return "live"
	end

	if arg_28_0 == "developer" then
		return "developer"
	end

	if arg_28_0 ~= "live" and arg_28_0 ~= "alpha" and arg_28_0 ~= "debug" then
		return "live"
	end

	return arg_28_0
end

function slot_0_39_0(arg_29_0)
	return slot_0_21_0[slot_0_38_0(arg_29_0)] or slot_0_21_0.live
end

function slot_0_40_0(arg_30_0, arg_30_1)
	arg_30_0 = tostring(arg_30_0 or ""):lower()

	if arg_30_0 == "developer" then
		return slot_0_23_0(arg_30_1)
	end

	return arg_30_0 == "live" or arg_30_0 == "alpha" or arg_30_0 == "debug"
end

function slot_0_41_0(arg_31_0)
	if slot_0_23_0(arg_31_0) then
		return "developer"
	end

	return "live"
end

function slot_0_42_0(arg_32_0, arg_32_1)
	arg_32_1 = tostring(arg_32_1 or slot_0_18_0 or "")
	arg_32_0 = tostring(arg_32_0 or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")

	if slot_0_40_0(arg_32_0, arg_32_1) then
		return arg_32_0
	end

	return slot_0_41_0(arg_32_1)
end

function slot_0_43_0(arg_33_0, arg_33_1)
	arg_33_0 = tostring(arg_33_0 or ""):lower():gsub("^%s+", ""):gsub("%s+$", "")

	if arg_33_0 == "" then
		arg_33_0 = "live"
	end

	arg_33_0 = slot_0_42_0(arg_33_0, slot_0_18_0)

	if slot_0_39_0(arg_33_0) >= slot_0_39_0("alpha") then
		return arg_33_0
	end

	if slot_0_33_0(arg_33_1) and not slot_0_23_0(slot_0_18_0) then
		return "alpha"
	end

	return arg_33_0
end

function slot_0_44_0(arg_34_0)
	arg_34_0 = tostring(arg_34_0 or slot_0_18_0 or "")

	if arg_34_0 == slot_0_18_0 then
		local var_34_0 = slot_0_42_0(slot_0_24_0, arg_34_0)
		local var_34_1 = slot_0_41_0(arg_34_0)

		if slot_0_39_0(var_34_1) > slot_0_39_0(var_34_0) then
			return var_34_1
		end

		return var_34_0
	end

	return "live"
end

function slot_0_45_0(arg_35_0)
	local var_35_0 = slot_0_39_0(slot_0_44_0(arg_35_0))
	local var_35_1 = {}

	for iter_35_0 = 1, #slot_0_20_0 do
		local var_35_2 = slot_0_20_0[iter_35_0]

		if slot_0_40_0(var_35_2, arg_35_0) and var_35_0 >= slot_0_39_0(var_35_2) then
			var_35_1[#var_35_1 + 1] = var_35_2
		end
	end

	return var_35_1
end

function slot_0_46_0()
	return slot_0_38_0(slot_0_25_0)
end

function slot_0_47_0()
	return slot_0_38_0(slot_0_24_0)
end

function slot_0_48_0(arg_38_0)
	return slot_0_39_0(slot_0_46_0()) >= slot_0_39_0(arg_38_0)
end

function slot_0_49_0(arg_39_0)
	arg_39_0 = slot_0_38_0(arg_39_0)

	return slot_0_39_0(slot_0_47_0()) >= slot_0_39_0(arg_39_0)
end

function slot_0_50_0(arg_40_0)
	return slot_0_46_0() == slot_0_38_0(arg_40_0)
end

function slot_0_51_0(arg_41_0)
	return slot_0_49_0(arg_41_0) and slot_0_48_0(arg_41_0)
end

slot_0_52_0 = {}

function slot_0_53_0(arg_42_0)
	arg_42_0 = slot_0_38_0(arg_42_0)

	local var_42_0 = slot_0_19_0[arg_42_0] or slot_0_19_0.live

	return string.format("Available only in %s build.", tostring(var_42_0.title or arg_42_0))
end

function slot_0_54_0(arg_43_0, arg_43_1)
	local var_43_0 = slot_0_53_0(arg_43_0)

	arg_43_1 = tostring(arg_43_1 or "")

	if arg_43_1 ~= "" then
		return arg_43_1 .. "\n\n" .. var_43_0
	end

	return var_43_0
end

function slot_0_55_0(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0 and arg_44_0.el

	if not var_44_0 then
		return
	end

	if type(var_44_0.visibility) == "function" then
		pcall(function()
			var_44_0:visibility(true)
		end)
	end

	if type(var_44_0.disabled) == "function" then
		pcall(function()
			var_44_0:disabled(not arg_44_1)
		end)
	end

	if type(var_44_0.tooltip) == "function" then
		pcall(function()
			if arg_44_1 then
				var_44_0:tooltip(arg_44_0.hint or "")
			else
				var_44_0:tooltip(slot_0_54_0(arg_44_0.min, arg_44_0.hint))
			end
		end)
	end

	if not arg_44_1 and type(var_44_0.set) == "function" then
		pcall(function()
			var_44_0:set(false)
		end)
	end
end

function slot_0_56_0(arg_49_0, ...)
	arg_49_0 = slot_0_38_0(arg_49_0)

	local var_49_0 = select("#", ...)
	local var_49_1

	if var_49_0 > 0 and type(select(var_49_0, ...)) == "string" then
		var_49_1 = select(var_49_0, ...)
		var_49_0 = var_49_0 - 1
	end

	for iter_49_0 = 1, var_49_0 do
		local var_49_2 = select(iter_49_0, ...)
		local var_49_3 = var_49_2
		local var_49_4 = var_49_1

		if type(var_49_2) == "table" and var_49_2.el then
			var_49_3 = var_49_2.el
			var_49_4 = var_49_2.hint or var_49_1
		end

		if var_49_3 then
			slot_0_52_0[#slot_0_52_0 + 1] = {
				min = arg_49_0,
				el = var_49_3,
				hint = var_49_4
			}
		end
	end
end

function slot_0_57_0()
	local var_50_0 = slot_0_45_0(slot_0_18_0)

	if #var_50_0 == 0 then
		slot_0_25_0 = "live"

		return
	end

	local var_50_1 = slot_0_46_0()

	for iter_50_0 = 1, #var_50_0 do
		if var_50_0[iter_50_0] == var_50_1 then
			return
		end
	end

	local var_50_2 = slot_0_47_0()

	for iter_50_1 = 1, #var_50_0 do
		if var_50_0[iter_50_1] == var_50_2 then
			slot_0_25_0 = var_50_2

			return
		end
	end

	slot_0_25_0 = var_50_0[1]
end

function slot_0_58_0()
	pcall(function()
		if menu and menu.home and menu.home.user_build_button and type(menu.home.user_build_button.name) == "function" then
			menu.home.user_build_button:name(build_ui_text(slot_0_25_0, "build"))
		end
	end)

	if home_links_sync_script_buttons then
		home_links_sync_script_buttons()
	end
end

slot_0_59_1 = nil
slot_0_60_1 = nil

function slot_0_61_0(arg_53_0)
	if slot_0_23_0(slot_0_18_0) then
		return false
	end

	if not slot_0_37_0(arg_53_0) then
		return false
	end

	if slot_0_39_0(slot_0_47_0()) < slot_0_39_0("alpha") then
		slot_0_24_0 = "alpha"
	end

	if slot_0_39_0(slot_0_47_0()) >= slot_0_39_0("alpha") then
		slot_0_25_0 = "alpha"

		slot_0_58_0()

		if apply_build_feature_access then
			apply_build_feature_access()
		end

		if apply_overlay_hud_access then
			apply_overlay_hud_access()
		end

		return true
	end

	return false
end

slot_0_62_0 = nil

function slot_0_63_0()
	local var_54_0 = slot_0_45_0(slot_0_18_0)

	if #var_54_0 == 0 then
		return
	end

	local var_54_1 = 1

	for iter_54_0 = 1, #var_54_0 do
		if var_54_0[iter_54_0] == slot_0_25_0 then
			var_54_1 = iter_54_0

			break
		end
	end

	slot_0_25_0 = var_54_0[var_54_1 % #var_54_0 + 1]

	slot_0_58_0()

	if apply_overlay_hud_access then
		apply_overlay_hud_access()
	end

	if slot_0_62_0 then
		slot_0_62_0()
	end
end

slot_0_24_0 = slot_0_41_0(slot_0_18_0)

if slot_0_23_0(slot_0_18_0) then
	slot_0_24_0 = "developer"
elseif slot_0_33_0(nil) then
	slot_0_24_0 = "alpha"
end

slot_0_64_0 = slot_0_24_0
slot_0_25_0 = slot_0_64_0

slot_0_61_0(nil)

function slot_0_65_0()
	return true
end

slot_0_66_0 = "CHANGE_ME_TO_MATCH_SECRETS_PHP"
slot_0_67_0 = "AmnesiaPlus_AtlasGate_n31x198x55_A7vHx9mQnL4rK2w_Stellar2026"
slot_0_68_0 = {
	get = function()
		return ""
	end,
	set = function()
		return
	end
}

if not pcall(function()
	local var_58_0 = slot_0_1_0.typeof("char[?]")
	local var_58_1 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)")
	local var_58_2 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)")
	local var_58_3 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)")

	function slot_0_68_0.get()
		local var_59_0 = var_58_1()

		if not var_59_0 or var_59_0 == 0 then
			return ""
		end

		local var_59_1 = var_58_0(var_59_0)

		var_58_3(0, var_59_1, var_59_0)

		return slot_0_1_0.string(var_59_1, var_59_0 - 1)
	end

	function slot_0_68_0.set(arg_60_0)
		arg_60_0 = tostring(arg_60_0 or "")

		var_58_2(arg_60_0, #arg_60_0)
	end
end) then
	function slot_0_68_0.get()
		return ""
	end

	function slot_0_68_0.set()
		return
	end
end

slot_0_69_0 = nil

function slot_0_70_0(arg_63_0)
	return slot_0_19_0[arg_63_0] or slot_0_19_0.live
end

function slot_0_71_0(arg_64_0, arg_64_1)
	local var_64_0 = slot_0_70_0(arg_64_0)

	return string.format(" \a{Link Active}%s\r\t\a{Link Active}%s \n\a{Link Active}%s", var_64_0.icon, var_64_0.title, arg_64_1)
end

function slot_0_72_0(arg_65_0, arg_65_1)
	local var_65_0 = slot_0_70_0(arg_65_0)
	local var_65_1 = arg_65_1 and "\a{Small Text}" or "\a{Link Active}"

	return string.format(" %s%s\r\t%s%s", var_65_1, var_65_0.icon, var_65_1, var_65_0.title)
end

function slot_0_73_0()
	return string.format(" \a{Link Active}%s \n\a{Link Active}%s", slot_0_17_0.name, "script")
end

slot_0_74_0 = {
	config = "https://ru.neverlose.cc/market/item?id=dAswLN",
	telegram = "https://t.me/riskybenefit",
	alpha = "https://market.neverlose.cc/dNLtRo",
	style = "https://neverlose.cc/getitem?c=1eXUkOE6o6lQhqeA-98B8gR5hZ9",
	youtube = "https://www.youtube.com/@phobiabeta",
	discord = "https://discord.gg/antihit",
	live = "https://ru.neverlose.cc/market/item?id=uc4ZBL"
}
slot_0_75_0 = "https://discord.gg/antihit"
slot_0_76_0 = "https://nl.amnesia.plus"

function slot_0_77_0(arg_67_0)
	arg_67_0 = tostring(arg_67_0 or "")

	if arg_67_0 == "" then
		return
	end

	pcall(function()
		panorama.SteamOverlayAPI.OpenExternalBrowserURL(arg_67_0)
	end)
end

;(function()
	AA_CONDITIONS = {
		"Global",
		"Standing",
		"Moving",
		"Walking",
		"Air",
		"Air~C",
		"Crouching",
		"Fake-Lag"
	}
	AA_CONDITIONS_NON_GLOBAL = {
		"Standing",
		"Moving",
		"Walking",
		"Air",
		"Air~C",
		"Crouching",
		"Fake-Lag"
	}
	AA_CONDITIONS_DEF = {
		"Standing",
		"Moving",
		"Walking",
		"Air",
		"Air~C",
		"Crouching"
	}

	function slot_69_0_0(arg_70_0, arg_70_1, arg_70_2)
		return {
			arg_70_0,
			function()
				local var_71_0 = arg_70_0:get()

				if type(var_71_0) == "number" then
					local var_71_1 = math.floor(var_71_0)

					if var_71_1 >= 0 and var_71_1 < #arg_70_2 then
						return var_71_1 + 1 == arg_70_1
					end

					return var_71_1 == arg_70_1
				end

				return arg_70_2[arg_70_1] ~= nil and var_71_0 == arg_70_2[arg_70_1]
			end
		}
	end

	slot_69_1_0 = {
		{
			color = "exploit",
			id = "Double Tap",
			key = "DT",
			icon = "bolt",
			hud = "DT"
		},
		{
			key = "HS",
			hud = "HS",
			icon = "eye-slash",
			id = "Hide Shots"
		},
		{
			key = "AP",
			hud = "AI",
			icon = "sparkles",
			id = "AI Peek"
		},
		{
			key = "FD",
			hud = "FD",
			icon = "chevrons-down",
			id = "Fake Duck"
		},
		{
			key = "BA",
			hud = "BODY",
			icon = "bullseye",
			id = "Body Aim"
		},
		{
			key = "DMG",
			hud = "0",
			icon = "gun",
			id = "Damage"
		},
		{
			key = "FS",
			hud = "FS",
			icon = "arrows-turn-to-dots",
			id = "Freestanding"
		}
	}

	function slot_69_2_0(arg_72_0)
		return ("\x01\f<%s>\r\t%s"):format(arg_72_0.icon, arg_72_0.id)
	end

	for iter_69_0 = 1, #slot_69_1_0 do
		slot_69_1_0[iter_69_0].ui = slot_69_2_0(slot_69_1_0[iter_69_0])
	end

	slot_69_3_0 = {
		{
			icon = "bolt",
			id = "Double Tap"
		},
		{
			icon = "eye-slash",
			id = "Hide Shots"
		},
		{
			icon = "sparkles",
			id = "AI Peek"
		},
		{
			icon = "gun",
			id = "Damage"
		},
		{
			icon = "crosshairs",
			id = "Hitchance"
		},
		{
			icon = "chevrons-down",
			id = "Fake Duck"
		},
		{
			icon = "bullseye",
			id = "Body Aim"
		},
		{
			icon = "shield-check",
			id = "Safe Points"
		},
		{
			icon = "moon",
			id = "Dormant Aimbot"
		},
		{
			icon = "arrows-turn-to-dots",
			id = "Freestanding"
		},
		{
			icon = "satellite-dish",
			id = "PING"
		},
		{
			icon = "bomb",
			id = "Bomb Info"
		}
	}

	function slot_69_4_0(arg_73_0)
		return ("\x01\f<%s>\r\t%s"):format(arg_73_0.icon, arg_73_0.id)
	end

	for iter_69_1 = 1, #slot_69_3_0 do
		slot_69_3_0[iter_69_1].ui = slot_69_4_0(slot_69_3_0[iter_69_1])
	end

	function slot_69_5_0()
		local var_74_0 = {}

		for iter_74_0 = 1, #slot_69_1_0 do
			var_74_0[iter_74_0] = slot_69_1_0[iter_74_0].ui
		end

		return var_74_0
	end

	function slot_69_6_0()
		local var_75_0 = {}

		for iter_75_0 = 1, #slot_69_3_0 do
			var_75_0[iter_75_0] = slot_69_3_0[iter_75_0].ui
		end

		return var_75_0
	end

	function slot_69_7_0()
		local var_76_0 = {}

		for iter_76_0 = 1, #slot_69_3_0 do
			var_76_0[iter_76_0] = slot_69_3_0[iter_76_0].id
		end

		return var_76_0
	end

	slot_69_8_0 = {}

	for iter_69_2 = 1, #slot_69_3_0 do
		if slot_69_3_0[iter_69_2].id ~= "Bomb Info" then
			slot_69_8_0[#slot_69_8_0 + 1] = slot_69_3_0[iter_69_2]
		end
	end

	function slot_69_9_0()
		local var_77_0 = {}

		for iter_77_0 = 1, #slot_69_8_0 do
			var_77_0[iter_77_0] = slot_69_8_0[iter_77_0].ui
		end

		return var_77_0
	end

	function slot_69_10_0()
		local var_78_0 = {}

		for iter_78_0 = 1, #slot_69_8_0 do
			var_78_0[iter_78_0] = slot_69_8_0[iter_78_0].id
		end

		return var_78_0
	end

	function slot_69_11_0(arg_79_0)
		arg_79_0 = tostring(arg_79_0 or "")
		arg_79_0 = arg_79_0:gsub("\a%x%x%x%x%x%x%x%x", "")
		arg_79_0 = arg_79_0:gsub("\x01.", "")
		arg_79_0 = arg_79_0:gsub("\f<[^>]+>", "")
		arg_79_0 = arg_79_0:gsub("\r\t", "")
		arg_79_0 = arg_79_0:gsub("^%s+", ""):gsub("%s+$", "")

		return arg_79_0
	end

	function slot_69_12_0(arg_80_0, arg_80_1)
		if type(arg_80_0) ~= "table" then
			return false
		end

		for iter_80_0 = 1, #arg_80_0 do
			local var_80_0 = arg_80_0[iter_80_0]

			if type(var_80_0) == "string" and slot_69_11_0(var_80_0) == arg_80_1 then
				return true
			end
		end

		for iter_80_1, iter_80_2 in pairs(arg_80_0) do
			if type(iter_80_2) == "string" and slot_69_11_0(iter_80_2) == arg_80_1 then
				return true
			end
		end

		return false
	end

	function slot_69_13_0(arg_81_0, arg_81_1, arg_81_2)
		arg_81_2 = arg_81_2 or slot_69_1_0

		if not arg_81_0 then
			return false
		end

		arg_81_1 = slot_69_11_0(tostring(arg_81_1 or ""))

		if arg_81_1 == "" then
			return false
		end

		if type(arg_81_0.value) == "table" and slot_69_12_0(arg_81_0.value, arg_81_1) then
			return true
		end

		if type(arg_81_0.get) == "function" then
			local var_81_0, var_81_1 = pcall(function()
				return arg_81_0:get()
			end)

			if var_81_0 and slot_69_12_0(var_81_1, arg_81_1) then
				return true
			end

			local var_81_2
			local var_81_3

			for iter_81_0 = 1, #arg_81_2 do
				if arg_81_2[iter_81_0].id == arg_81_1 then
					var_81_2 = arg_81_2[iter_81_0].ui
					var_81_3 = iter_81_0

					break
				end
			end

			if var_81_2 then
				local var_81_4, var_81_5 = pcall(function()
					return arg_81_0:get(var_81_2)
				end)
				local var_81_6 = var_81_5

				if var_81_4 and var_81_6 == true then
					return true
				end
			end

			local var_81_7, var_81_8 = pcall(function()
				return arg_81_0:get(arg_81_1)
			end)
			local var_81_9 = var_81_8

			if var_81_7 and var_81_9 == true then
				return true
			end

			if var_81_3 then
				local var_81_10, var_81_11 = pcall(function()
					return arg_81_0:get(var_81_3)
				end)
				local var_81_12 = var_81_11

				if var_81_10 and var_81_12 == true then
					return true
				end
			end
		end

		return false
	end

	function slot_69_14_0()
		local var_86_0 = {}

		for iter_86_0 = 1, #slot_69_1_0 do
			var_86_0[iter_86_0] = slot_69_1_0[iter_86_0].id
		end

		return var_86_0
	end

	function slot_69_15_0()
		return {
			get = function()
				return nil
			end,
			set = function()
				return
			end,
			override = function()
				return
			end
		}
	end

	function slot_69_16_0(...)
		local var_91_0, var_91_1 = pcall(ui.find, ...)

		if var_91_0 and var_91_1 then
			return var_91_1
		end

		return slot_69_15_0()
	end

	function slot_69_17_0(...)
		local var_92_0, var_92_1 = pcall(slot_0_0_0.find, ...)

		if var_92_0 and var_92_1 then
			return var_92_1
		end

		return slot_69_15_0()
	end

	refs = {
		pitch = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Pitch"),
		yaw = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Yaw"),
		base = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
		offset = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
		yaw_mod = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
		yaw_mod_degree = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
		freestanding = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Freestanding"),
		body_freestanding = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
		desync_freestand = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
		yaw_mod_free = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
		body_yaw = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
		inverter = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
		left_limit = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
		right_limit = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
		options = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
		fake_options = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
		hidden = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
		avoid_backstab = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
		extended = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
		extended_p = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
		extended_r = slot_69_16_0("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"),
		dt = slot_69_16_0("Aimbot", "Ragebot", "Main", "Double Tap"),
		hs = slot_69_16_0("Aimbot", "Ragebot", "Main", "Hide Shots"),
		peek_assist = slot_69_16_0("Aimbot", "Ragebot", "Main", "Peek Assist"),
		lag_options = slot_69_16_0("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
		dtlim = slot_69_16_0("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"),
		sw = slot_69_16_0("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
		fd = slot_69_16_0("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
		air_strafe = slot_69_16_0("Miscellaneous", "Main", "Movement", "Air Strafe"),
		strafe_assist = slot_69_16_0("Miscellaneous", "Main", "Movement", "Strafe Assist"),
		hit_chance = slot_69_16_0("Aimbot", "Ragebot", "Selection", "Hit Chance"),
		autostop_ssg_opts = slot_69_16_0("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"),
		body_aim = slot_69_16_0("Aimbot", "Ragebot", "Safety", "Body Aim"),
		safe_points = slot_69_16_0("Aimbot", "Ragebot", "Safety", "Safe Points"),
		min_damage = slot_69_16_0("Aimbot", "Ragebot", "Selection", "Min. Damage"),
		dormant = slot_69_16_0("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
		bhop = slot_69_16_0("Miscellaneous", "Main", "Movement", "Bunny Hop"),
		leg_movement = slot_69_16_0("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
		fakeping = slot_69_16_0("Miscellaneous", "Main", "Other", "Fake Latency"),
		scope_overlay = slot_69_16_0("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
		scope_force_vm = slot_69_17_0("Visuals", "World", "Main", "Override Zoom", "Force Viewmodel"),
		world_hitmarker = slot_69_16_0("Visuals", "World", "Other", "Hit Marker")
	}
	_G.aa_state_slot_dep = slot_69_0_0
	_G.bind_listed_check = slot_69_13_0
	_G.chi_bind_listable_items = slot_69_5_0
	_G.chi_bind_ids = slot_69_14_0
	_G.CHI_BIND_DEFS = slot_69_1_0
	_G.gs_bind_listable_items = slot_69_6_0
	_G.gs_bind_ids = slot_69_7_0
	_G.GS_BIND_DEFS = slot_69_3_0
	_G.kb_bind_listable_items = slot_69_9_0
	_G.kb_bind_ids = slot_69_10_0
	_G.KB_BIND_DEFS = slot_69_8_0

	function _G.wm_element_on(arg_93_0, arg_93_1)
		if not arg_93_0 then
			return true
		end

		return slot_69_13_0(arg_93_0, arg_93_1, WM_ELEMENT_DEFS)
	end
end)()

slot_0_78_0 = {
	runtime_sanitize_at = 0,
	pui_ready = false,
	chi_mouse_block = false,
	in_score = false,
	ui_kill_flash = 0,
	wm_kill_flash = 0,
	ov_wm_mouse_block = false,
	def_was_snapping = false,
	ov_spectators_mouse_block = false,
	ov_metrics_mouse_block = false,
	ov_store_loaded = false,
	aa_skitter_sign = 0,
	presence_last_fetch = 0,
	presence_inflight = false,
	aa_mod_sent = 0,
	ov_mouse_hooked = false,
	cloud_delete_arm_token = 0,
	cloud_delete_armed = false,
	cfg_delete_deadline = 0,
	cfg_delete_arm_token = 0,
	cfg_delete_armed = false,
	stats_reset_deadline = 0,
	stats_reset_arm_token = 0,
	stats_reset_armed = false,
	stats_push_debounce = 0,
	stats_playtime_started = false,
	stats_bootstrap_token = 0,
	stats_bootstrap_pending = false,
	stats_bootstrapped = false,
	ov_drag_capture = false,
	ov_drag_active = false,
	cloud_avatar_fetch_at = 0,
	ov_damage_ind_mouse_block = false,
	ov_keybinds_mouse_block = false,
	ov_slowdown_mouse_block = false,
	ov_elog_mouse_block = false,
	cloud_fetch_pending = false,
	cloud_delete_deadline = 0,
	api_presence_touch_at = 0,
	client_config_inflight = false,
	api_ping_manual_ok_at = 0,
	api_ping_pending = false,
	api_ping_at = 0,
	api_ping_recheck_at = 0,
	jitter = false,
	yaw_add = 0,
	jit_yaw = 0,
	prev_simulation_time = 0,
	in_bombzone = false,
	api_alpha_dlc_claimed_at = 0,
	anti_bruteforce = {
		tickcounts = {},
		realtime = {}
	},
	anti_brute = {
		desync_cut = 0,
		yaw_shift = 0,
		until_time = 0,
		active = false,
		last_hit_tick = -1,
		last_trigger_tick = -1
	},
	cloud_presets = {},
	cloud_presets_raw = {},
	cloud_ui = {},
	stats = {
		deaths = 0,
		kills = 0,
		time_minutes = 0,
		loads = 0,
		evaded = 0,
		miss = 0,
		hits = 0
	},
	ov_drag = {},
	screen_logs = {},
	presence_peer_roster = {},
	presence_sid_roster = {},
	ap_userid_steamid64 = {},
	ap_entity_sid_cache = {},
	badge_icons = {
		debug = "https://amnesia.plus/logotype.png",
		alpha = "https://amnesia.plus/logotype.png",
		live = "https://amnesia.plus/logotype.png"
	},
	aa_sway = {
		sway_yaw_back = false,
		sway_back = false,
		inverted = false,
		tick3 = 0
	},
	aa_switch = {
		hold = 0,
		switch = false,
		phase = 0
	},
	aa_amnesia_body = {
		hold = false,
		state_idx = -1,
		side = false,
		tick = 0,
		ll = 58,
		nade_seen = 0,
		rl = 58
	},
	aa_mod_switch = {
		hold = 0,
		switch = false,
		phase = 0
	},
	aa_auto = {
		last_switch = false,
		state_idx = -1
	},
	exploit = {
		prev_kind = "off",
		active_kind = "off",
		tickbase_shift = 0,
		charge = 0,
		lc_left = 0,
		tickbase_apex = 0
	},
	def_snap = {
		ticks = 0,
		apex_lc = 0,
		snapping = false,
		active = false
	},
	defensive_runtime = {},
	hitlogs = {
		hit = 1,
		miss = 1
	},
	hc_manip_miss = {},
	aa_state_slot_dep = aa_state_slot_dep,
	ap_steamid_to_64 = function(arg_94_0)
		local var_94_0 = 7.656119796026573e+16
		local var_94_1 = slot_0_6_0(arg_94_0)

		if var_94_1 == "" or var_94_1 == "0" then
			return nil
		end

		if #var_94_1 == 17 then
			return var_94_1
		end

		local var_94_2 = tonumber(var_94_1)

		if not var_94_2 or var_94_2 <= 0 then
			return nil
		end

		if var_94_0 <= var_94_2 then
			return string.format("%.0f", var_94_2)
		end

		local var_94_3 = var_94_2 % 2
		local var_94_4 = math.floor(var_94_2 / 2)

		return string.format("%.0f", var_94_0 + var_94_4 * 2 + var_94_3)
	end
}

function slot_0_79_0(arg_95_0)
	if arg_95_0 == nil then
		return nil
	end

	local var_95_0 = panorama and panorama.GameStateAPI

	if var_95_0 and type(var_95_0.IsXuidValid) == "function" and not var_95_0.IsXuidValid(arg_95_0) then
		return nil
	end

	return slot_0_78_0.ap_steamid_to_64(arg_95_0)
end

function slot_0_78_0.ap_entity_steamid64(arg_96_0)
	if not arg_96_0 then
		return nil
	end

	local var_96_0

	pcall(function()
		if type(arg_96_0.get_index) == "function" then
			var_96_0 = arg_96_0:get_index()
		end
	end)

	if var_96_0 ~= nil then
		local var_96_1 = slot_0_78_0.ap_entity_sid_cache[var_96_0]

		if var_96_1 and var_96_1 ~= "" then
			return var_96_1
		end
	end

	local var_96_2

	pcall(function()
		if type(arg_96_0.get_xuid) == "function" then
			var_96_2 = slot_0_78_0.ap_steamid_to_64(arg_96_0:get_xuid())
		end
	end)

	if var_96_2 then
		if var_96_0 ~= nil then
			slot_0_78_0.ap_entity_sid_cache[var_96_0] = var_96_2
		end

		return var_96_2
	end

	local var_96_3

	pcall(function()
		local var_99_0 = arg_96_0:get_player_info()

		if type(var_99_0) ~= "table" then
			return
		end

		if var_99_0.steamid64 ~= nil then
			var_96_2 = slot_0_78_0.ap_steamid_to_64(var_99_0.steamid64)
		end

		if not var_96_2 and var_99_0.steamid ~= nil then
			var_96_2 = slot_0_78_0.ap_steamid_to_64(var_99_0.steamid)
		end

		if var_99_0.userid ~= nil then
			var_96_3 = tonumber(var_99_0.userid)
		end
	end)

	if var_96_2 then
		if var_96_0 ~= nil then
			slot_0_78_0.ap_entity_sid_cache[var_96_0] = var_96_2
		end

		if var_96_3 then
			slot_0_78_0.ap_userid_steamid64[var_96_3] = var_96_2
		end

		return var_96_2
	end

	if var_96_3 then
		var_96_2 = slot_0_78_0.ap_userid_steamid64[var_96_3]

		if var_96_2 then
			if var_96_0 ~= nil then
				slot_0_78_0.ap_entity_sid_cache[var_96_0] = var_96_2
			end

			return var_96_2
		end
	end

	pcall(function()
		local var_100_0 = panorama and panorama.GameStateAPI

		if not var_100_0 then
			return
		end

		if var_96_0 ~= nil and type(var_100_0.GetPlayerXuidStringFromEntIndex) == "function" then
			var_96_2 = slot_0_79_0(var_100_0.GetPlayerXuidStringFromEntIndex(var_96_0))
		end

		if not var_96_2 and var_96_3 and type(var_100_0.GetPlayerXuidFromUserID) == "function" then
			var_96_2 = slot_0_79_0(var_100_0.GetPlayerXuidFromUserID(var_96_3))
		end
	end)

	if var_96_2 then
		if var_96_0 ~= nil then
			slot_0_78_0.ap_entity_sid_cache[var_96_0] = var_96_2
		end

		if var_96_3 then
			slot_0_78_0.ap_userid_steamid64[var_96_3] = var_96_2
		end
	end

	return var_96_2
end

slot_0_80_0 = nil
slot_0_81_0 = nil
slot_0_82_0 = nil
slot_0_83_0 = nil
slot_0_84_0 = nil
slot_0_85_0 = nil
slot_0_86_0 = nil
slot_0_87_0 = nil
slot_0_88_0 = nil
slot_0_89_0 = nil
slot_0_90_0 = (function()
	local var_101_0 = {
		base = "https://api.amnesia.plus",
		secret = slot_0_67_0
	}
	local var_101_1 = {
		init = function(arg_102_0)
			if not arg_102_0 then
				return
			end

			if arg_102_0.base then
				var_101_0.base = tostring(arg_102_0.base or ""):gsub("%s+$", ""):gsub("/+$", "")
			end

			if arg_102_0.secret then
				var_101_0.secret = tostring(arg_102_0.secret)
			end

			if arg_102_0.user then
				var_101_0.user = tostring(arg_102_0.user)
			end
		end,
		is_configured = function()
			local var_103_0 = var_101_0.secret

			return type(var_103_0) == "string" and var_103_0 ~= "" and var_103_0 ~= slot_0_66_0
		end,
		norm_path = function(arg_104_0)
			arg_104_0 = tostring(arg_104_0 or "/")

			if arg_104_0:sub(1, 1) ~= "/" then
				arg_104_0 = "/" .. arg_104_0
			end

			return arg_104_0
		end
	}

	local function var_101_2(arg_105_0)
		local var_105_0 = {
			["X-Amnesia-Secret"] = var_101_0.secret,
			["User-Agent"] = "amnesia.plus/" .. tostring(slot_0_17_0.version) .. " (NL)"
		}
		local var_105_1 = var_101_0.user

		if type(var_105_1) ~= "string" or var_105_1 == "" then
			var_105_1 = tostring(slot_0_18_0 or "")
		end

		if var_105_1 ~= "" then
			var_105_0["X-Amnesia-User"] = var_105_1
		end

		if type(arg_105_0) == "table" then
			for iter_105_0, iter_105_1 in pairs(arg_105_0) do
				var_105_0[iter_105_0] = iter_105_1
			end
		end

		return var_105_0
	end

	function var_101_1.get(arg_106_0, arg_106_1)
		if not var_101_1.is_configured() then
			if arg_106_1 then
				arg_106_1(false, nil, "not_configured")
			end

			return
		end

		local var_106_0 = var_101_0.base .. var_101_1.norm_path(arg_106_0)

		pcall(function()
			network.get(var_106_0, var_101_2(), function(arg_108_0)
				if not arg_106_1 then
					return
				end

				if arg_108_0 == nil or arg_108_0 == "" then
					arg_106_1(false, nil, "empty")

					return
				end

				local var_108_0, var_108_1 = pcall(json.parse, arg_108_0)

				arg_106_1(var_108_0, var_108_1, arg_108_0)
			end)
		end)
	end

	function var_101_1.post(arg_109_0, arg_109_1, arg_109_2)
		if not var_101_1.is_configured() then
			if arg_109_2 then
				arg_109_2(false, nil, "not_configured")
			end

			return
		end

		local var_109_0 = var_101_0.base .. var_101_1.norm_path(arg_109_0)
		local var_109_1 = var_101_2({
			["content-type"] = "application/json"
		})

		pcall(function()
			network.post(var_109_0, arg_109_1 or {}, var_109_1, function(arg_111_0)
				if not arg_109_2 then
					return
				end

				if arg_111_0 == nil or arg_111_0 == "" then
					arg_109_2(false, nil, "empty")

					return
				end

				local var_111_0, var_111_1 = pcall(json.parse, arg_111_0)

				arg_109_2(var_111_0, var_111_1, arg_111_0)
			end)
		end)
	end

	function var_101_1.ping(arg_112_0)
		var_101_1.get("/v1/health", function(arg_113_0, arg_113_1, arg_113_2)
			if not arg_112_0 then
				return
			end

			if arg_113_0 and type(arg_113_1) == "table" and arg_113_1.ok == true then
				arg_112_0(true, arg_113_1)
			else
				arg_112_0(false, arg_113_1)
			end
		end)
	end

	function var_101_1.fetch_client_config(arg_114_0)
		if not var_101_1.is_configured() then
			return
		end

		if slot_0_78_0.client_config_inflight and arg_114_0 ~= true then
			return
		end

		slot_0_78_0.client_config_inflight = true

		var_101_1.get("/v1/client_config", function(arg_115_0, arg_115_1, arg_115_2)
			slot_0_78_0.client_config_inflight = false

			if not arg_115_0 or type(arg_115_1) ~= "table" or arg_115_1.ok ~= true then
				return
			end

			if slot_0_80_0 then
				slot_0_80_0(arg_115_1)
			end
		end)
	end

	function var_101_1.touch_presence(arg_116_0)
		arg_116_0 = tonumber(arg_116_0) or 0

		if not var_101_1.is_configured() then
			return
		end

		local var_116_0 = var_101_0.user

		if type(var_116_0) ~= "string" or var_116_0 == "" then
			var_116_0 = tostring(slot_0_18_0 or "")
		end

		if var_116_0 == "" then
			return
		end

		local var_116_1 = globals.realtime or 0

		if arg_116_0 > 0 and arg_116_0 > var_116_1 - (slot_0_78_0.api_presence_touch_at or 0) then
			return
		end

		slot_0_78_0.api_presence_touch_at = var_116_1

		local var_116_2 = {
			user = var_116_0,
			version = tostring(slot_0_17_0.version),
			build = tostring(slot_0_25_0)
		}
		local var_116_3 = slot_0_10_0()

		if var_116_3 then
			var_116_2.peer_tag = var_116_3
		end

		local var_116_4 = slot_0_7_0()

		if var_116_4 then
			var_116_2.steamid64 = var_116_4
		end

		local var_116_5 = slot_0_16_0()

		if var_116_5 then
			var_116_2.server_key = var_116_5
		end

		local var_116_6 = slot_0_14_0()

		if var_116_6 then
			if var_116_6.address then
				var_116_2.server_address = var_116_6.address
			end

			if var_116_6.name then
				var_116_2.server_name = var_116_6.name
			end
		end

		var_101_1.post("/v1/presence", var_116_2, function()
			return
		end)
	end

	return var_101_1
end)()
slot_0_91_0 = nil
slot_0_92_0 = setmetatable({}, {
	__mode = "k"
})

function slot_0_93_0(arg_118_0)
	return (tostring(arg_118_0 or ""):gsub("^\a%{Link Active%}", ""):gsub("^\a%{Small Text%}", ""):gsub("^\a[%x]+", ""):gsub("\x01\a%{Link Active%}", "\x01"):gsub("\x01\a%{Small Text%}", "\x01"))
end

function slot_0_94_0(arg_119_0, arg_119_1)
	arg_119_0 = slot_0_93_0(arg_119_0)

	local var_119_0 = arg_119_1 and "\a{Link Active}" or "\a{Small Text}"

	if arg_119_0:find("\f<", 1, true) and arg_119_0:sub(1, 1) ~= "\x01" then
		arg_119_0 = "\x01" .. arg_119_0
	end

	if arg_119_0:sub(1, 1) == "\x01" then
		return "\x01" .. var_119_0 .. arg_119_0:sub(2)
	end

	return var_119_0 .. arg_119_0
end

function slot_0_95_0(arg_120_0)
	return slot_0_94_0(arg_120_0, true)
end

HC_WEAPON_GROUPS = {
	{
		key = "Pistols",
		icon = "gun"
	},
	{
		key = "Auto Snipers",
		icon = "person-rifle"
	},
	{
		key = "AWP",
		icon = "crosshairs"
	},
	{
		key = "SSG-08",
		icon = "bullseye"
	},
	{
		key = "Desert Eagle",
		icon = "gun"
	},
	{
		key = "Revolver",
		icon = "circle-dot"
	}
}
HC_TRIGGER_OPTS = {
	"Higher elevation",
	"Lower elevation",
	"Lethal",
	"After misses",
	"Low enemy HP"
}
AP_PEEK_WEAPON_DEFS = {
	{
		icon = "bullseye",
		id = "SSG 08"
	},
	{
		icon = "crosshairs",
		id = "AWP"
	},
	{
		icon = "gun",
		id = "Pistol"
	},
	{
		icon = "gun",
		id = "Desert Eagle"
	}
}
AP_PEEK_OPT_DEFS = {
	{
		icon = "person",
		id = "Ignore Limbs"
	},
	{
		icon = "shield-halved",
		id = "Low Safety"
	}
}
WM_ELEMENT_DEFS = {
	{
		icon = "bolt",
		id = "Logo"
	},
	{
		icon = "user",
		id = "Avatar"
	},
	{
		icon = "signature",
		id = "Nickname"
	},
	{
		icon = "code-branch",
		id = "Build"
	},
	{
		icon = "clock",
		id = "Time"
	},
	{
		icon = "wifi",
		id = "Ping"
	}
}

function slot_0_96_0(arg_121_0, arg_121_1)
	return slot_0_95_0(("\x01\f<%s>\r\t%s"):format(arg_121_0, arg_121_1))
end

function slot_0_97_0(arg_122_0)
	return slot_0_96_0(arg_122_0.icon, arg_122_0.id)
end

for iter_0_0 = 1, #AP_PEEK_WEAPON_DEFS do
	AP_PEEK_WEAPON_DEFS[iter_0_0].ui = slot_0_97_0(AP_PEEK_WEAPON_DEFS[iter_0_0])
end

for iter_0_1 = 1, #AP_PEEK_OPT_DEFS do
	AP_PEEK_OPT_DEFS[iter_0_1].ui = slot_0_97_0(AP_PEEK_OPT_DEFS[iter_0_1])
end

for iter_0_2 = 1, #WM_ELEMENT_DEFS do
	WM_ELEMENT_DEFS[iter_0_2].ui = slot_0_97_0(WM_ELEMENT_DEFS[iter_0_2])
end

function slot_0_98_0()
	local var_123_0 = {}

	for iter_123_0 = 1, #WM_ELEMENT_DEFS do
		var_123_0[iter_123_0] = WM_ELEMENT_DEFS[iter_123_0].ui
	end

	return var_123_0
end

function slot_0_99_0()
	local var_124_0 = {}

	for iter_124_0 = 1, #WM_ELEMENT_DEFS do
		var_124_0[iter_124_0] = WM_ELEMENT_DEFS[iter_124_0].id
	end

	return var_124_0
end

ARROW_EXTRA_DEFS = {
	{
		icon = "arrow-up",
		id = "Forward"
	}
}

for iter_0_3 = 1, #ARROW_EXTRA_DEFS do
	ARROW_EXTRA_DEFS[iter_0_3].ui = slot_0_97_0(ARROW_EXTRA_DEFS[iter_0_3])
end

function slot_0_100_0()
	local var_125_0 = {}

	for iter_125_0 = 1, #ARROW_EXTRA_DEFS do
		var_125_0[iter_125_0] = ARROW_EXTRA_DEFS[iter_125_0].ui
	end

	return var_125_0
end

function slot_0_101_0()
	local var_126_0 = {}

	for iter_126_0 = 1, #ARROW_EXTRA_DEFS do
		var_126_0[iter_126_0] = ARROW_EXTRA_DEFS[iter_126_0].id
	end

	return var_126_0
end

function _G.arrow_extra_on(arg_127_0, arg_127_1)
	if not arg_127_0 then
		return false
	end

	return bind_listed_check(arg_127_0, arg_127_1, ARROW_EXTRA_DEFS)
end

function slot_0_102_0()
	local var_128_0 = {}

	for iter_128_0 = 1, #AP_PEEK_WEAPON_DEFS do
		var_128_0[iter_128_0] = AP_PEEK_WEAPON_DEFS[iter_128_0].ui
	end

	return var_128_0
end

function slot_0_103_0()
	local var_129_0 = {}

	for iter_129_0 = 1, #AP_PEEK_OPT_DEFS do
		var_129_0[iter_129_0] = AP_PEEK_OPT_DEFS[iter_129_0].ui
	end

	return var_129_0
end

function slot_0_104_0()
	local var_130_0 = {}

	for iter_130_0 = 1, #AP_PEEK_WEAPON_DEFS do
		var_130_0[iter_130_0] = AP_PEEK_WEAPON_DEFS[iter_130_0].id
	end

	return var_130_0
end

function slot_0_105_0()
	local var_131_0 = {}

	for iter_131_0 = 1, #AP_PEEK_OPT_DEFS do
		var_131_0[iter_131_0] = AP_PEEK_OPT_DEFS[iter_131_0].id
	end

	return var_131_0
end

function slot_0_106_0()
	local var_132_0 = {}

	for iter_132_0 = 1, #HC_WEAPON_GROUPS do
		local var_132_1 = HC_WEAPON_GROUPS[iter_132_0]

		var_132_0[iter_132_0] = slot_0_96_0(var_132_1.icon, var_132_1.key)
	end

	return var_132_0
end

function slot_0_107_0()
	local var_133_0 = {}

	for iter_133_0 = 1, #HC_WEAPON_GROUPS do
		var_133_0[iter_133_0] = HC_WEAPON_GROUPS[iter_133_0].key
	end

	return var_133_0
end

function slot_0_108_0(arg_134_0, arg_134_1)
	local var_134_0 = {}
	local var_134_1 = {}
	local var_134_2 = #arg_134_1

	for iter_134_0 = 1, var_134_2 do
		var_134_0[iter_134_0] = slot_0_94_0(arg_134_1[iter_134_0][1], true)
		var_134_1[iter_134_0] = tostring(iter_134_0)
	end

	var_134_1[#var_134_1 + 1] = "R"

	local var_134_3 = arg_134_0:list("\next", var_134_0, nil, false)
	local var_134_4 = arg_134_0:list("\nint", var_134_1, nil, false)

	var_134_4:visibility(false)

	for iter_134_1 = 1, var_134_2 do
		local var_134_5 = arg_134_1[iter_134_1][2] or {}

		for iter_134_2 = 1, #var_134_5 do
			local var_134_6 = var_134_5[iter_134_2]

			if var_134_6 and type(var_134_6.depend) == "function" then
				var_134_6:depend({
					var_134_4,
					iter_134_1
				})
			end
		end
	end

	var_134_3:set_callback(function()
		var_134_4:set(var_134_3.value)
	end)
	utils.execute_after(0, function()
		var_134_3:set(1)
		var_134_4:set(1)
	end)

	return var_134_3, var_134_4
end

slot_0_109_0 = {
	home = {
		info = slot_0_0_0.create("\x01\f<house-blank>", "\ninfo", 1),
		profile = slot_0_0_0.create("\x01\f<house-blank>", "\nprofile", 1),
		settings = slot_0_0_0.create("\x01\f<house-blank>", "\nsettings", 1),
		logo = slot_0_0_0.create("\x01\f<house-blank>", "\nlogo", 1),
		selector = slot_0_0_0.create("\x01\f<house-blank>", "\nselector", 1),
		info1 = slot_0_0_0.create("\x01\f<house-blank>", "\ninfo1", 1),
		links = slot_0_0_0.create("\x01\f<house-blank>", "\nlinks", 2),
		profile_stats = slot_0_0_0.create("\x01\f<house-blank>", "\nprofile_stats", 2),
		discord = slot_0_0_0.create("\x01\f<house-blank>", "\ndiscord", 2),
		configsnew = slot_0_0_0.create("\x01\f<house-blank>", "\nconfigsnew", 2),
		configs = slot_0_0_0.create("\x01\f<house-blank>", "\nconfigs", 2),
		cloud = slot_0_0_0.create("\x01\f<house-blank>", "\ncloud", 2)
	},
	vars = {
		selector = slot_0_0_0.create("\x01\f<bolt>", "\nvars_selector", 1),
		visuals = slot_0_0_0.create("\x01\f<bolt>", "\nvars_visuals", 2),
		visuals2 = slot_0_0_0.create("\x01\f<bolt>", "\nvars_visuals2", 2),
		style = slot_0_0_0.create("\x01\f<bolt>", "\nvars_style", 1),
		overlay = slot_0_0_0.create("\x01\f<bolt>", "\nvars_overlay", 1),
		ragebot = slot_0_0_0.create("\x01\f<bolt>", "\nvars_ragebot", 2),
		ragebot1 = slot_0_0_0.create("\x01\f<bolt>", "\nvars_ragebot1", 1),
		misc = slot_0_0_0.create("\x01\f<bolt>", "\nvars_misc", 2),
		misc1 = slot_0_0_0.create("\x01\f<bolt>", "\nvars_misc1", 1),
		misc3 = slot_0_0_0.create("\x01\f<bolt>", "\nvars_misc3", 1),
		misc4 = slot_0_0_0.create("\x01\f<bolt>", "\nvars_misc4", 2)
	},
	antiaim = {
		selector = slot_0_0_0.create("\x01\f<person-running>", "\naa_selector", 1),
		general = slot_0_0_0.create("\x01\f<person-running>", "\naa_general", 2),
		builder = slot_0_0_0.create("\x01\f<person-running>", "\naa_builder", 1),
		settings = slot_0_0_0.create("\x01\f<person-running>", "\naa_settings", 1),
		defensive = slot_0_0_0.create("\x01\f<person-running>", "\naa_defensive", 1),
		defensive1 = slot_0_0_0.create("\x01\f<person-running>", "\naa_defensive1", 1),
		build_slot = {},
		build_slot_main = {},
		build_slot_yaw = {},
		build_slot_mod = {},
		build_slot_body = {},
		build_slot_misc = {},
		def_slot_main = {},
		def_slot_pitch = {},
		def_slot_yaw = {}
	}
}

for iter_0_4 = 1, #AA_CONDITIONS do
	slot_0_109_0.antiaim.build_slot_main[iter_0_4] = slot_0_0_0.create("\x01\f<person-running>", "\nab_m" .. tostring(iter_0_4), 1)
	slot_0_109_0.antiaim.build_slot_yaw[iter_0_4] = slot_0_0_0.create("\x01\f<person-running>", "\nab_y" .. tostring(iter_0_4), 2)
	slot_0_109_0.antiaim.build_slot_mod[iter_0_4] = slot_0_0_0.create("\x01\f<person-running>", "\nab_mod" .. tostring(iter_0_4), 2)
	slot_0_109_0.antiaim.build_slot_body[iter_0_4] = slot_0_0_0.create("\x01\f<person-running>", "\nab_by" .. tostring(iter_0_4), 2)
	slot_0_109_0.antiaim.build_slot_misc[iter_0_4] = slot_0_0_0.create("\x01\f<person-running>", "\nab_misc" .. tostring(iter_0_4), 2)
	slot_0_109_0.antiaim.build_slot[iter_0_4] = slot_0_109_0.antiaim.build_slot_yaw[iter_0_4]
end

for iter_0_5 = 1, #AA_CONDITIONS_DEF do
	slot_0_109_0.antiaim.def_slot_main[iter_0_5] = slot_0_0_0.create("\x01\f<person-running>", "\nad_m" .. tostring(iter_0_5), 1)
	slot_0_109_0.antiaim.def_slot_pitch[iter_0_5] = slot_0_0_0.create("\x01\f<person-running>", "\nad_p" .. tostring(iter_0_5), 2)
	slot_0_109_0.antiaim.def_slot_yaw[iter_0_5] = slot_0_0_0.create("\x01\f<person-running>", "\nad_y" .. tostring(iter_0_5), 2)
end

files.create_folder("amnesia.plus")
pcall(files.create_folder, "csgo/sound/amnesia")

slot_0_110_0 = "amnesia.plus/configs.plus"
slot_0_111_0 = "amnesia.plus/overlay.store"
slot_0_112_0 = "Recommended"

function slot_0_113_0(arg_137_0)
	if type(arg_137_0) ~= "table" then
		return false
	end

	local var_137_0 = false

	arg_137_0.configs = arg_137_0.configs or {}

	if arg_137_0.configs.Default ~= nil then
		if arg_137_0.configs[slot_0_112_0] == nil then
			arg_137_0.configs[slot_0_112_0] = arg_137_0.configs.Default
		end

		arg_137_0.configs.Default = nil
		var_137_0 = true
	end

	if arg_137_0.loaded == "Default" then
		arg_137_0.loaded = slot_0_112_0
		var_137_0 = true
	end

	if arg_137_0.configs[slot_0_112_0] == nil then
		arg_137_0.configs[slot_0_112_0] = {}
		var_137_0 = true
	end

	return var_137_0
end

function slot_0_114_0()
	local var_138_0 = files.read(slot_0_110_0)

	if not var_138_0 or var_138_0 == "" then
		return {
			loaded = slot_0_112_0,
			configs = {
				[slot_0_112_0] = {}
			}
		}
	end

	local var_138_1, var_138_2 = pcall(json.parse, var_138_0)

	if not var_138_1 or type(var_138_2) ~= "table" then
		return {
			loaded = slot_0_112_0,
			configs = {
				[slot_0_112_0] = {}
			}
		}
	end

	slot_0_113_0(var_138_2)

	var_138_2.loaded = var_138_2.loaded or slot_0_112_0
	var_138_2.configs = var_138_2.configs or {}
	var_138_2.configs[slot_0_112_0] = var_138_2.configs[slot_0_112_0] or {}
	var_138_2.autoload_mode = nil
	var_138_2.autoload_cloud_id = nil
	var_138_2._autoload_mode_repaired = nil

	return var_138_2
end

function slot_0_115_0(arg_139_0)
	local var_139_0, var_139_1 = pcall(json.stringify, arg_139_0)

	if var_139_0 and var_139_1 then
		files.write(slot_0_110_0, var_139_1)

		return true
	end

	return false
end

slot_0_116_0 = "amnesiaplus"
slot_0_117_0 = "BUMNWKCJQDYRLESIAFGOPXTVHZgtsjecpxylnbiuahzqforkvmdw8135269047+/="

function slot_0_118_0()
	local var_140_0, var_140_1 = pcall(function()
		return common.get_date("%Y-%m-%d %H:%M")
	end)

	if var_140_0 and var_140_1 and var_140_1 ~= "" then
		return tostring(var_140_1)
	end

	return "?"
end

function slot_0_119_0()
	local var_142_0, var_142_1 = pcall(function()
		return common.get_date("%Y%m%d_%H%M%S")
	end)

	if var_142_0 and var_142_1 and var_142_1 ~= "" then
		return "Imported_" .. var_142_1
	end

	return "Imported_" .. tostring(math.floor((globals.realtime or 0) * 1000) % 100000000)
end

function slot_0_120_0(arg_144_0, arg_144_1, arg_144_2, arg_144_3)
	local var_144_0 = {
		__ap_cfg = true,
		data = arg_144_0 or {},
		author = tostring(arg_144_1 or slot_0_18_0),
		modified = arg_144_2 and arg_144_2 ~= "" and tostring(arg_144_2) or slot_0_118_0()
	}

	if type(arg_144_3) == "table" then
		var_144_0.overlay = arg_144_3
	end

	return var_144_0
end

function slot_0_121_0(arg_145_0)
	if type(arg_145_0) == "table" and arg_145_0.__ap_cfg == true and type(arg_145_0.data) == "table" then
		return arg_145_0.data, arg_145_0.author, arg_145_0.modified
	end

	if type(arg_145_0) == "table" then
		return arg_145_0, nil, nil
	end

	return {}, nil, nil
end

function slot_0_122_0(arg_146_0)
	if type(arg_146_0) == "table" and arg_146_0.__ap_cfg == true and type(arg_146_0.overlay) == "table" then
		return arg_146_0.overlay
	end

	return nil
end

function slot_0_123_0()
	if not slot_0_78_0.ov_store_loaded then
		slot_0_89_0.store_read()

		slot_0_78_0.ov_store_loaded = true
	end

	local var_147_0 = slot_0_89_0.store and slot_0_89_0.store.slots and slot_0_89_0.store.slots.wm

	if type(var_147_0) ~= "table" then
		return nil
	end

	return {
		wm = {
			x = tonumber(var_147_0.x) or 0,
			y = tonumber(var_147_0.y) or 24,
			align = math.max(0, math.min(2, math.floor(tonumber(var_147_0.align) or 2)))
		}
	}
end

function slot_0_124_0(arg_148_0)
	if type(arg_148_0) ~= "table" or type(arg_148_0.wm) ~= "table" then
		return
	end

	slot_0_89_0.store_read()

	slot_0_78_0.ov_store_loaded = true

	local var_148_0 = slot_0_89_0.store_slot("wm")
	local var_148_1 = arg_148_0.wm

	var_148_0.x = tonumber(var_148_1.x) or var_148_0.x
	var_148_0.y = tonumber(var_148_1.y) or var_148_0.y
	var_148_0.align = math.max(0, math.min(2, math.floor(tonumber(var_148_1.align) or 2)))
	var_148_0.cxf = nil
	var_148_0._user_pos = true
	var_148_0._init = true
	var_148_0._wm_topright_v3 = true

	slot_0_89_0.store_write()
end

function slot_0_125_0()
	local var_149_0 = tostring(config_db.loaded or "")

	if var_149_0 == "" or var_149_0 == slot_0_112_0 then
		return
	end

	local var_149_1 = config_db.configs[var_149_0]

	if type(var_149_1) ~= "table" or var_149_1.__ap_cfg ~= true then
		return
	end

	local var_149_2 = slot_0_123_0()

	if not var_149_2 then
		return
	end

	var_149_1.overlay = var_149_2

	slot_0_115_0(config_db)
end

function slot_0_126_0(arg_150_0, arg_150_1, arg_150_2)
	local var_150_0, var_150_1 = pcall(msgpack.pack, arg_150_2 or {})

	if not var_150_0 or type(var_150_1) ~= "string" then
		return nil
	end

	return string.format("(%s)[%s]{%s}", tostring(arg_150_0 or "unnamed"), tostring(arg_150_1 or "unknown"), var_150_1)
end

function slot_0_127_0(arg_151_0, arg_151_1, arg_151_2)
	local var_151_0 = slot_0_126_0(arg_151_0, arg_151_1, arg_151_2)

	if not var_151_0 then
		return nil
	end

	local var_151_1 = slot_0_2_0.encode(var_151_0, slot_0_117_0)
	local var_151_2 = string.gsub(var_151_1, "[%=+%/]", {
		["/"] = "z143Z",
		["+"] = "z113Z",
		["="] = "_"
	})

	return string.format("%s::NL::%s", slot_0_116_0, var_151_2)
end

function slot_0_128_0(arg_152_0)
	arg_152_0 = tostring(arg_152_0 or ""):match("^%s*(.-)%s*$") or ""

	local var_152_0, var_152_1, var_152_2, var_152_3 = string.match(arg_152_0, "^(%a+)::(%a+)::([%w%+%/]+)(_*)$")

	if var_152_0 ~= slot_0_116_0 or var_152_1 ~= "NL" or not var_152_2 or var_152_2 == "" then
		return false, "not an amnesia.plus preset", nil, nil, nil
	end

	local var_152_4

	var_152_4 = var_152_3 and string.rep("=", #var_152_3) or ""

	local var_152_5 = string.gsub(var_152_2, "z%d%d%dZ", {
		z143Z = "/",
		z113Z = "+"
	})
	local var_152_6, var_152_7 = pcall(function()
		return slot_0_2_0.decode(var_152_5 .. var_152_4, slot_0_117_0)
	end)

	if not var_152_6 or type(var_152_7) ~= "string" or var_152_7 == "" then
		return false, "decode failed", nil, nil, nil
	end

	local var_152_8, var_152_9, var_152_10 = string.match(var_152_7, "^%((.*)%)%[(.*)%]%{(.+)%}$")

	if not var_152_10 then
		return false, "corrupt preset", nil, nil, nil
	end

	local var_152_11, var_152_12 = pcall(msgpack.unpack, var_152_10)

	if not var_152_11 or type(var_152_12) ~= "table" then
		return false, "unpack failed", nil, nil, nil
	end

	return true, nil, var_152_8, var_152_9, var_152_12
end

slot_0_129_0 = "amnesia.plus"
slot_0_130_0 = "-"
slot_0_131_0 = 2
slot_0_132_0 = "amnesiaplus::NL::YW6bj3XwjMbtAToqt5Zje2SngC7oZHioH3ZuV36bj17wjCK8ZsYqs5FxjJEct5FaZVRMzCEiZ17fgVE8B9xlZijctiKoZgMksJDbs3XrH3Xct36fgT6bpgZdt5E8ZVQUqCEiZ17xjVFktC7xZY6NtC71ZMBasCbrtiXnYghltC71ZK7uHVFbv97wjCK8s17wZVD3ZVDct3kNziEft5XnV3mhs5AUh3KrjCbxgT5eBUMhZuDbZVE8HT6nvz1wjCK8gTEcj3KdtVXvvzjbtiKytCXnv9hz113ZZuDbZVE8HT6npqUwHTZbjJbcZCbwHTDfZVDwvzhwjCK8gTEceTK5vzFlt36nhnjft3DxtYbwHTZbV3xbHTOMzCmbZ3b8V3KxvzoiHVE8V3mxZCFbsfSrHuXhtCFbsb7wjCK8ZVSHygjbtiKytCXnvzxyt3F6V5bxj9ZOjCK8gTSleTK5zWDxH3o5HVDnzV6yt3F6V5bxj29uHi7neX7is9bAZTXqQWZxg3Tmgib8jCXdV5DxtiFktT6bs5LCzVE5HVbcHiKlg4YztCXijK7fgT1hjM3fs5jhjCEaV5FhH3owUYodgTjajK7fgT1hjM3fs5jhjCEaV3FbtCK6hW6ktiTqZVx8siKctCbogVABzCbrjiXdjCXdvzmiHTobV37vjCbktuSOhnhhjJFbsqUGHT6nt31heiPpgib8jCXdaV9oHVZkgTFct5ZbsimxsLShtTK2V3mhtTb8SzbogT6ctCbogVAfzuE5HVbcs5UbZTAUhu6vgVFlgQCbsCb8H3pBhJ66HVeCqJbxj17xZCFctCXijIdoeTK5V3KnZK7dgTjajBTheTK5V3FbtCK6U9h6HVjct3Zis3X8BYZoZVFat3GnP5brH9b6HVjcs5UbZTAdh5bxj17ot3GhAVX8t31xjCblhVUhjCEahWFkj39acubxj17ot3GSqCZhsuE8V3FbZ5DbZAMhHTFnV5DhZ3x8z113Zz1wZTEktiFcZCXusiXbBYbdHT6nt31heiPVqJFagVDnV3FbZ5DbZAMhtT7nV3FbtCK6zPZfjTE8jTK8Zg1it5XdjCxcZCXusiXbBYZkZiZwZVABqCZhZuFaV3FbZ5DbZAMktT7nV3FbtCK6V5FhH3owUYF5HVbwB9jxZCFceTK5v9owj3XbsK7wjCXvsvGaHTFnV3mbZuO4ygjbtiKytCXnvzxyt3F6V5bxj9xWgVExHimbZYE6HVeaFCbwHTDfZTGhciDkZJbceTK5lzjyt3F6V3Zwa87iZqKzgVF8ZVDcsiKrZC7otiXwsvMhs5jxeX7yHTEqvzhfZTZ8V3mhtTb8Szmwj3b8H3xcjCblg5LWz5DhZ3x8V3mhtTb8Szmwj3b8H3xcZCXfHVinOi7rZgobeJFdHX7fgT1hjBMagT63ZVD8ZVRMqCZxg3Xct5U8gT7rs6Cxcz1xji7hZK7kjiXdtCKvvzboHVxctCbogVA9zT1htb7fgT1hjMdzs5jxeX7wsCXbZBCicuUhjCEapgXvgVFlgBMncubxj2gfeTK5V3KnZK7fZTZ8BY16HVjcHTFnV5DhZ3x8BYb6HVjcZCXfHVnUzubxj17kZiZwZVABhi1bjCxkZYLmSNMheTK5V5EvZTXnLzj6HVjctT7nzWFhs3KytCXnhVUhjCEazWFhs3KytCXnzJ66HVjctT7nlzmigVDwjK7nZTjdZTPBzTKnZK7dgTjajBMos3Xlt36nV3FbZ5DbZAMhsiKrZC7ogVhbBYm8gCbdZK7nZTjdZTPBzT1kZK7nZTmxegFSt36bqTZkjVD8gK7nZTjdZTPBhi7iZuEbjBMfZibijCxcZCXusiXbBY7ot3FcZCXfHVbcjCblg5LWhJjxeVLNh3KnZK76HVcMz5E5ZTXvV5E8ZVUwUYxxZCFctCXijBMDh3XrHTDfZTOMzCDkZJbceTK5zWFhs3KytCXna5bxj9xWgVExHimbZYbz113ZHi7neX76HVeSh3DkZJbcZuSlO3ZifThhjJFbsb7dHT6nt31rZVEwBYbwj3K6V3DxH3kMzimbZuFctCbogVA9qJE5gVFlgK78gTEqsvGqsibugJFctCbogVA9qJE5gVFlgK7nZTmxegFSt36bz3X2jJDxV3mhtTb8BYxhtuZbsuFbsfYfZiKqZX7ksJFht36wngKz113ZqTK3t3bnV373ZVDfHVNMzT1xeK7fgT1hjNzhtTbrV3mhtTb8RYhwj3K6V5EvZTXnBgZz113ZsCb8H3yUhVUhjCEaBYFz113ZeTK5xzm6HVjcHTFnV3mbZuABqVbxj17xZCFcsibugJABzVbxj17nZTmxeACzeTK5V37iZuEbjBMitTX8gC7nawW2LYb6HVjcs5UbZTAdh5bxj17ot3GaFCbwHTDfZTGbsCb8H3yaFCbwHTDfZTGacubxj17ot3GSqCZhsuE8V3FbZ5DbZAMhHTFnV5DhZ3x8BY1wZTEktiFcZCXusiXbBYbdHT6nt31heiPBqJFagVDnV3FbZ5DbZAMhtT7nV3FbtCK6hW6ktiToZi71suFaV3FbZ5DbZAMit3Zis3X8BYmigTZ8gK7nZTjdZTPBq31kZK7nZTmxeX78gTEqsvGnj3K6svSuHTFnV5bxj4Yqs5jbZVUcs5FbsJLWzCKnZK7fZTZ8BQiuZT6xHimbZLYaHi7neX76HVeaFCbwHTDfZTGleTK5zWFhs3KytCXnzV6yt3F6V5bxj29uHi7neX7is9EIZigmgib8jCXdV5DxtiFktT6bs5LBzVE5HVbcHiKlg4YztCXijK7fgT1hjNzfs5jhjCEaV5FhH3owUYodgTjajK7fgT1hjNzfs5jhjCEaV3FbtCK6hW6ktiTqZVx8siKctCbogVABzCbrjiXdjCXdvzmiHTobV37vjCbktuSFaV9oHVZkgTFct5ZbsimxsLYhtTK2V3mhtTb8SzbogT6ctCbogVAfzuE5HVbcs5UbZTAUhu6vgVFlgQCbsCb8H3pBhJ66HVeCqJbxj17xZCFctCXijBMoeTK5V3KnZK7dgTjajBMheTK5V3FbtCK6Bgh6HVjct3Zis3X8BYZoZVFat3GlLOpvzVbxj17wsCXbZNYueTK5V31kZYxWgVExHimbZYXvgVFlgYxWgVExHimbZYxz113ZeTK5V31kZQ9fZibds5FcZCXusiXbBYbxZCFcsibugJABqVEbH37rZK7nZTjdZTPBzVDxtiFktTb9ZAMfjCxhsiFcZCXusiXbBYbot3FcZCXfHVinOi7rZg1it5XdjCxcZCXusiXbBYZkZiZwZVABqCZhZuFaV3FbZ5DbZAMktT7nV3FbtCK6V5FhH3owUYF5HVbwB9jxZCFceTK5vzowj3XbsK7wjCXvsvGaHTFnV3mbZuABygjbtiKytCXnvzxyt3F6V5bxj9xWgVExHimbZYE6HVeaFCbwHTDfZTGhciDkZJbceTK5lzjyt3F6V3Zwa87iZqKzgVF8ZVDcsiKrZC7otiXwsvMhs5jxeX7yHTEqvzhfZTZ8V3mhtTb8Szmwj3b8H3xcjCblg5LWz5DhZ3x8V3mhtTb8Szmwj3b8H3xcZCXfHVinOi7rZgobeJFdHX7fgT1hjBMagT63ZVD8ZVRMqCZxg3Xct5U8gT7rs6Cxcz1xji7hZK7kjiXdtCKvvzboHVxctCbogVA9zT1htb7fgT1hjMdzs5jxeX7wsCXbZBCicuUhjCEapgXvgVFlgBMncubxj2gfeTK5V3KnZK7fZTZ8BY16HVjcHTFnV5DhZ3x8BYb6HVjcZCXfHVnUzubxj17kZiZwZVABhi1bjCxkZYLmSNMheTK5V5EvZTXnLzj6HVjctT7nzWFhs3KytCXnhVUhjCEazWFhs3KytCXnzJ66HVjctT7nlzmigVDwjK7nZTjdZTPBzTKnZK7dgTjajBMos3Xlt36nV3FbZ5DbZAMhsiKrZC7ogVhbBYm8gCbdZK7nZTjdZTPBzT1kZK7nZTmxegFSt36bqTZkjVD8gK7nZTjdZTPBhi7iZuEbjBMfZibijCxcZCXusiXbBY7ot3FcZCXfHVbcjCblg5LWhJjxeVLNh3KnZK76HVcMz5E5ZTXvV5E8ZVUwUYxxZCFctCXijBMDh3XrHTDfZTOMzCDkZJbceTK5zWFhs3KytCXna5bxj9xWgVExHimbZYbz113ZHi7neX76HVeSh3DkZJbcZuSlO3ZifThhjJFbsb7dHT6nt31rZVEwBYbwj3K6V3DxH3kMzimbZuFctCbogVA9qJE5gVFlgK78gTEqsvGqsibugJFctCbogVA9qJE5gVFlgK7nZTmxegFSt36bz3X2jJDxV3mhtTb8BYxhtuZbsuFbsfYfZiKqZX7ksJFht36wngKz113ZqTK3t3bnV373ZVDfHVNMzT1xeK7fgT1hjNzhtTbrV3mhtTb8RYhwj3K6V5EvZTXnBgZz113ZsCb8H3yUhVUhjCEaBYFz113ZeTK5xzm6HVjcHTFnV3mbZuABqVbxj17xZCFcsibugJABzVbxj17nZTmxeACzeTK5V37iZuEbjBMitTX8gC7nawW2LYb6HVjcs5UbZTAdh5bxj17ot3GaFCbwHTDfZTGbsCb8H3yaFCbwHTDfZTGacubxj17ot3GSqCZhsuE8V3FbZ5DbZAMhHTFnV5DhZ3x8BY1wZTEktiFcZCXusiXbBYbdHT6nt31heiPBqJFagVDnV3FbZ5DbZAMhtT7nV3FbtCK6hW6ktiToZi71suFaV3FbZ5DbZAMit3Zis3X8BYmigTZ8gK7nZTjdZTPBq31kZK7nZTmxeX78gTEqsvGnj3K6svSuHTFnV5bxj4Yqs5jbZVUcs5FbsJLWzCKnZK7fZTZ8BQiuZT6xHimbZLYaHi7neX76HVeaFCbwHTDfZTGleTK5zWFhs3KytCXnzV6yt3F6V5bxj29uHi7neX7is9EIZigmgib8jCXdV5DxtiFktT6bs5LBzVE5HVbcHiKlg4YztCXijK7fgT1hjNzfs5jhjCEaV5FhH3owUYodgTjajK7fgT1hjNzfs5jhjCEaV3FbtCK6hW6ktiTqZVx8siKctCbogVABzCbrjiXdjCXdvzmiHTobV37vjCbktuSFaV9oHVZkgTFct5ZbsimxsLYhtTK2V3mhtTb8SzbogT6ctCbogVAfzuE5HVbcs5UbZTAUhu6vgVFlgQCbsCb8H3pBhJ66HVeCqJbxj17xZCFctCXijBMoeTK5V3KnZK7dgTjajBMheTK5V3FbtCK6Bgh6HVjct3Zis3X8BYZoZVFat3GlLOpvzVbxj17wsCXbZNYueTK5V31kZYxWgVExHimbZYXvgVFlgYxWgVExHimbZYxz113ZeTK5V31kZQ9fZibds5FcZCXusiXbBYbxZCFcsibugJABqVEbH37rZK7nZTjdZTPBzVDxtiFktTb9ZAMfjCxhsiFcZCXusiXbBYbot3FcZCXfHVinOi7rZg1it5XdjCxcZCXusiXbBYZkZiZwZVABqCZhZuFaV3FbZ5DbZAMktT7nV3FbtCK6V5FhH3owUYF5HVbwB9jxZCFceTK5vzowj3XbsK7wjCXvsvGaHTFnV3mbZuABygjbtiKytCXnv9xyt3F6V5bxj9ZYgVF8ZVYleTK5zWDxH3o5HVDnzV6yt3F6V5bxj29uHi7neX7is9EIZigmgib8jCXdV5DxtiFktT6bs5LRzVE5HVbcHiKlg4YztCXijK7fgT1hjNzfs5jhjCEaV5FhH3owUYodgTjajK7fgT1hjNzfs5jhjCEaV3FbtCK6hW6ktiTqZVx8siKctCbogVABzCbrjiXdjCXdvzmiHTobV37vjCbktuSFaV9oHVZkgTFct5ZbsimxsLYhtTK2V3mhtTb8SzbogT6ctCbogVAfzuE5HVbcs5UbZTAUhu6vgVFlgQCbsCb8H3pBhJ66HVeCqJbxj17xZCFctCXijBMoeTK5V3KnZK7dgTjajBMheTK5V3FbtCK6Bgh6HVjct3Zis3X8BYZoZVFat3GlLOpvzVbxj17wsCXbZNYueTK5V31kZYbUjVFktTK8gTSbsCb8H3ynFC75tzxz113ZeTK5V31kZQ9fZibds5FcZCXusiXbBYbxZCFcsibugJABqVEbH37rZK7nZTjdZTPBzVDxtiFktTb9ZAMfjCxhsiFcZCXusiXbBYbot3FcZCXfHVinOi7rZg1it5XdjCxcZCXusiXbBYZkZiZwZVAOqCZhZuFaV3FbZ5DbZAMktT7nV3FbtCK6V5FhH3owUYF5HVbwB9jxZCFceTK5vzowj3XbsK7wjCXvsvGaHTFnV3mbZuABfCFbZiXrs3b3ZX7wjCK8ZVSTx9Fz113ZeTK5xYXwsCXbZBCiHT6utCPdTzXnZTmxeAMbHT6utCVLoYjbtiKytCXnvzFot3FbhW6ktiTleTK5a87iZzxnjVDxjCbktp3bsCb8H3ylO3Zihu6vgVFlgQSiHT6utCPdTgXwsCXbZUGbHT6utCVAh2encubxj2Gbs5UbZTAUhiKrZ3mbLbzbZCXfHVnBhTKrZ3mbwRGuZT6xHimbZLYntT7nZgjWZTZxjTm8a5bxj9EIZigaZJXdHVFht32EhVUhjCEaa87iZzZz113ZsCb8H3yNhiKrZ3mbLbibs5UbZTAPhTKrZ3mb8YeJhJ66HVeWhVEvZTXnBgZxtijfZODghTFbtCK6BYXxtijfZsd8h3XrHTDfZTOMhC1kZCTuFCXiHVXfjYE6HVelO3ZizCF1siK8gT7rNgXvgVFlgYEIZigicuUhjCEap9ZxtijfZODZhVEvZTXnKYXxtijfZjMux9Fz113ZeTK5xYXwsCXbZMgiHT6utCPdwAKahTFbtCK6BgXxtijfZAMuZT6xHimbZLSntT7nZgZNjVE8t33leTK5z1EvgT2pGib8jCXdzCF1siK8gT7rNgXvgVFlgY1GHT6nt38pP5FxjCblhu6vgVFlgQSiHT6utCPdTgXwsCXbZMYbHT6utCVAh2encubxj2Gbs5UbZTAVhiKrZ3mbLf8UgYXnZTmxeAYbHT6utCPBh3XrHTDfZTONhC1kZCTiA5XwjC7oa5bxj9oOsCbrQWhhjJFbszxnjVDxjCbktp3bsCb8H3yiGib8jCXdhu6vgVFlgQSiHT6utCPdRgXwsCXbZUGbHT6utCVA82encubxj2Gbs5UbZTAUhiKrZ3mbLbzbZCXfHVnBhTKrZ3mbwRGuZT6xHimbZLSntT7nZgZNjVE8t33leTK5qXDxtiFktGUYgVF8ZVYaZJXdHVFht32EhVUhjCEahnhhjJFbszZz113ZsCb8H3yNhiKrZ3mbLbibs5UbZTAPhTKrZ3mb8YefZCXiV3ZksiEbV3mlvzhz113Zs3KiZX7aZTKnpzj5ZTKvt36wB9hlt36ngVFht36wn9EUgVYbATbdcnSxczXnH37rZYXUgVDz113ZA9ooHT61HTmcHiKwZgjWZTZxjTm8qiK3t3bnV3DxH3owjCKyv9mnZTZcHTmft5jcgJIMhJZxsuSEqV6kjb75HVFbsi1xsirJzi73V5joV5XwZVRMz373V5joV3D1gTmnvzbkjb75tX73ZVRMz373V5joV5E8sibvvzhkjb75tX78gT1ba87iZzokjb75tX7wjJbfZgjNtCKws3blzi73V5joV5UhticMfJFdHVEajCKfg17btiKytCVNhCmkZ5INhiKwsCXljLSqtC7yHubcHiKnZ3VNziEagX7btiKytCVNhV6ft3jwp9Xot3Fbs6GiATboHi78zXU1siEaHVEbs9mKjiKnZTApP3xkjJSxczmft3jcH371tuFbsuIMhi71jJU1jDSuA37rs37fZgZOH5DbZT9xczxkjb7vHT6btLYrH3mxtuFxZ17btiKytCVNh56xs5UbH5GUhVDxjCbkHgmkjb75HVFbsi1xsikMfV68siKwgJFxtCocZT6xHimbpzXlt36ns6SuO32pG3bftYxItyUWZTK8gYKz113ZhC1kZCTuPuXws3bxtzoz113ZH3xhV3XrHTDfZHSrH3xhV3ZfHVEaV3ohtCwNzTEagX7ygT6ns6HUBpLWUgKz113Zz3EagX7ngVEvtCK6ngKz113ZcA__"

function slot_0_133_0(arg_154_0, arg_154_1, arg_154_2)
	if type(arg_154_0) ~= "table" then
		return false
	end

	arg_154_2 = arg_154_2 or 0

	if arg_154_2 > 6 then
		return true
	end

	arg_154_1 = arg_154_1 or {}

	if arg_154_1[arg_154_0] then
		return false
	end

	arg_154_1[arg_154_0] = true

	local var_154_0 = 0

	for iter_154_0 in pairs(arg_154_0) do
		var_154_0 = var_154_0 + 1

		if var_154_0 > 4096 then
			return true
		end
	end

	for iter_154_1, iter_154_2 in pairs(arg_154_0) do
		if type(iter_154_2) == "table" and slot_0_133_0(iter_154_2, arg_154_1, arg_154_2 + 1) then
			return true
		end
	end

	return false
end

function slot_0_134_0(arg_155_0)
	if type(arg_155_0) ~= "table" or type(arg_155_0.configs) ~= "table" then
		return false
	end

	local var_155_0 = false

	for iter_155_0, iter_155_1 in pairs(arg_155_0.configs) do
		local var_155_1, var_155_2, var_155_3 = slot_0_121_0(iter_155_1)

		if slot_0_133_0(var_155_1) then
			arg_155_0.configs[iter_155_0] = slot_0_120_0({}, var_155_2 or "legacy", var_155_3 or "legacy", slot_0_122_0(iter_155_1))
			var_155_0 = true
		end
	end

	return var_155_0
end

function slot_0_135_0(arg_156_0)
	if not slot_0_132_0 or slot_0_132_0 == "" then
		return false
	end

	if (tonumber(arg_156_0.default_config_revision) or 0) >= slot_0_131_0 then
		return false
	end

	local var_156_0, var_156_1, var_156_2, var_156_3, var_156_4 = slot_0_128_0(slot_0_132_0)

	if not var_156_0 or type(var_156_4) ~= "table" or slot_0_133_0(var_156_4) then
		return false
	end

	arg_156_0.configs = arg_156_0.configs or {}
	arg_156_0.configs[slot_0_112_0] = slot_0_120_0(var_156_4, slot_0_129_0, slot_0_130_0)
	arg_156_0.default_config_revision = slot_0_131_0

	return true
end

slot_0_137_0 = (function()
	return {
		loaded = slot_0_112_0,
		configs = {
			[slot_0_112_0] = {}
		}
	}
end)()
slot_0_138_2, slot_0_139_1 = pcall(slot_0_114_0)

if slot_0_138_2 and type(slot_0_139_1) == "table" then
	slot_0_137_0 = slot_0_139_1
end

slot_0_138_1 = false

if slot_0_137_0.autoload_mode ~= nil or slot_0_137_0.autoload_cloud_id ~= nil or slot_0_137_0._autoload_mode_repaired then
	slot_0_137_0.autoload_mode = nil
	slot_0_137_0.autoload_cloud_id = nil
	slot_0_137_0._autoload_mode_repaired = nil
	slot_0_138_1 = true
end

if slot_0_113_0(slot_0_137_0) then
	slot_0_138_1 = true
end

if slot_0_134_0(slot_0_137_0) then
	slot_0_138_1 = true
end

if slot_0_135_0(slot_0_137_0) then
	slot_0_138_1 = true
end

if slot_0_137_0.configs and type(slot_0_137_0.configs) == "table" then
	for iter_0_6, iter_0_7 in pairs(slot_0_137_0.configs) do
		if type(iter_0_7) == "table" and iter_0_7.__ap_cfg ~= true then
			slot_0_144_1 = iter_0_7

			if slot_0_133_0(slot_0_144_1) then
				slot_0_137_0.configs[iter_0_6] = slot_0_120_0({}, "legacy", "legacy")
			else
				slot_0_137_0.configs[iter_0_6] = slot_0_120_0(slot_0_144_1, "legacy", "legacy")
			end

			slot_0_138_1 = true
		end
	end
end

if slot_0_138_1 then
	pcall(slot_0_115_0, slot_0_137_0)
end

slot_0_138_0 = 265
slot_0_139_0 = 150
slot_0_140_0 = {
	"https://amnesia.plus/nl-banner.png",
	"https://s.fotora.ru/d217846b9686e4c2.jpeg"
}
slot_0_141_0 = nil
slot_0_142_0 = nil

function slot_0_143_0()
	local var_158_0 = 1

	if render and type(render.get_scale) == "function" then
		var_158_0 = render.get_scale(2) or 1
	end

	return vector(math.floor(slot_0_138_0 * var_158_0 + 0.5), math.floor(slot_0_139_0 * var_158_0 + 0.5))
end

function slot_0_144_0()
	local var_159_0 = slot_0_143_0()
	local var_159_1 = vector(math.floor(var_159_0.x * 2 + 0.5), math.floor(var_159_0.y * 2 + 0.5))

	for iter_159_0, iter_159_1 in ipairs(slot_0_140_0) do
		local var_159_2, var_159_3 = pcall(network.get, iter_159_1)

		if var_159_2 and type(var_159_3) == "string" and #var_159_3 > 0 then
			local var_159_4, var_159_5 = pcall(render.load_image, var_159_3, var_159_1)

			if not var_159_4 or not var_159_5 then
				var_159_4, var_159_5 = pcall(render.load_image, var_159_3)
			end

			if var_159_4 and var_159_5 then
				return var_159_5, var_159_0
			end
		end
	end

	return nil, nil
end

pcall(function()
	local var_160_0, var_160_1 = slot_0_144_0()

	if var_160_0 then
		slot_0_141_0 = var_160_0
		slot_0_142_0 = var_160_1
	end
end)

slot_0_145_0 = 4

function slot_0_146_0(arg_161_0)
	local var_161_0 = arg_161_0 or "manual"
	local var_161_1 = globals.realtime or 0

	if slot_0_78_0.api_ping_pending then
		return false
	end

	if var_161_0 == "manual" and var_161_1 < (slot_0_78_0.api_ping_manual_ok_at or 0) then
		return false
	end

	slot_0_78_0.api_ping_pending = true

	slot_0_91_0()
	slot_0_90_0.ping(function(arg_162_0, arg_162_1)
		slot_0_78_0.api_ping_pending = false

		local var_162_0 = slot_0_78_0.api_ping_ok

		slot_0_78_0.api_ping_ok = arg_162_0
		slot_0_78_0.api_ping_at = globals.realtime or 0

		if var_161_0 == "manual" then
			slot_0_78_0.api_ping_manual_ok_at = (globals.realtime or 0) + slot_0_145_0
		end

		if arg_162_0 then
			slot_0_90_0.touch_presence(0)
			slot_0_90_0.fetch_client_config()

			if slot_0_81_0 then
				slot_0_81_0()
			end

			if slot_0_87_0 then
				slot_0_87_0(true)
			end

			if slot_0_88_0 then
				slot_0_88_0()
			end
		end

		if slot_0_90_0.is_configured() and type(slot_0_78_0.api_server_status_elog) == "function" then
			if arg_162_0 and var_162_0 ~= true then
				slot_0_78_0.api_server_status_elog(true)
			elseif not arg_162_0 and var_162_0 == true then
				slot_0_78_0.api_server_status_elog(false)
			end
		end

		slot_0_78_0.api_ping_ok_prev = arg_162_0

		slot_0_91_0()
	end)

	return true
end

slot_0_147_0 = slot_0_109_0.home.info:label("\x01\a{Small Text}\f<circle-info>\r \tOpens in browser")

function slot_0_148_0(arg_163_0, arg_163_1)
	local var_163_0 = slot_0_147_0

	if not var_163_0 or type(var_163_0.name) ~= "function" then
		return
	end

	local var_163_1 = arg_163_1 and "\aD35050FF" or "\a{Small Text}"

	var_163_0:name("\x01" .. var_163_1 .. "\f<circle-info>\r \t" .. tostring(arg_163_0 or "—"))
end

function slot_0_149_0(arg_164_0)
	if not slot_0_90_0.is_configured() then
		slot_0_148_0("server offline", true)

		return
	end

	local var_164_0 = slot_0_7_0()

	if not var_164_0 then
		slot_0_148_0("steam id unavailable", true)

		return
	end

	if arg_164_0 and type(arg_164_0.disabled) == "function" then
		arg_164_0:disabled(true)
	end

	slot_0_148_0("opening…", false)
	slot_0_90_0.post("/v1/nl/panel-token", {
		user = slot_0_18_0,
		steamid64 = var_164_0
	}, function(arg_165_0, arg_165_1, arg_165_2)
		if arg_164_0 and type(arg_164_0.disabled) == "function" then
			arg_164_0:disabled(false)
		end

		if not arg_165_0 or type(arg_165_1) ~= "table" or arg_165_1.ok ~= true then
			local var_165_0 = type(arg_165_1) == "table" and tostring(arg_165_1.error or "") or ""

			slot_0_148_0(var_165_0 ~= "" and var_165_0 or "request failed", true)

			return
		end

		local var_165_1 = tostring(arg_165_1.panel_url or "")

		if var_165_1 == "" then
			local var_165_2 = tostring(arg_165_1.token or "")

			if var_165_2 ~= "" then
				var_165_1 = slot_0_76_0 .. "/?token=" .. var_165_2
			end
		end

		if var_165_1 == "" then
			slot_0_148_0("no panel url", true)

			return
		end

		slot_0_148_0("opened in browser", false)
		slot_0_77_0(var_165_1)
	end)
end

slot_0_150_0 = slot_0_109_0.home.discord:label("\x01\a{Small Text}\f<circle-info>\r \tUse /auth code in Discord")

function slot_0_151_0(arg_166_0)
	local var_166_0 = slot_0_150_0

	if not slot_0_90_0.is_configured() then
		if var_166_0 and type(var_166_0.name) == "function" then
			var_166_0:name("\x01\aD35050FF\f<key>\r \tServer not configured")
		end

		return
	end

	local var_166_1 = slot_0_7_0()

	if not var_166_1 then
		if var_166_0 and type(var_166_0.name) == "function" then
			var_166_0:name("\x01\aD35050FF\f<key>\r \tSteam ID unavailable")
		end

		return
	end

	if arg_166_0 and type(arg_166_0.disabled) == "function" then
		arg_166_0:disabled(true)
	end

	slot_0_90_0.post("/v1/discord/link-code", {
		user = slot_0_18_0,
		steamid64 = var_166_1
	}, function(arg_167_0, arg_167_1, arg_167_2)
		if arg_166_0 and type(arg_166_0.disabled) == "function" then
			arg_166_0:disabled(false)
		end

		if not var_166_0 or type(var_166_0.name) ~= "function" then
			return
		end

		if not arg_167_0 or type(arg_167_1) ~= "table" or arg_167_1.ok == false then
			local var_167_0 = type(arg_167_1) == "table" and tostring(arg_167_1.error or arg_167_1.msg or "") or ""

			if var_167_0 ~= "" then
				var_166_0:name("\x01\aD35050FF\f<key>\r \t" .. var_167_0)
			else
				var_166_0:name("\x01\aD35050FF\f<key>\r \tSomething went wrong")
			end

			return
		end

		if arg_167_1.is_connected == true or arg_167_1.linked == true then
			local var_167_1 = tostring(arg_167_1.discord_username or "")

			if var_167_1 ~= "" then
				var_166_0:name("\x01\aD35050FF\f<key>\r \tAlready linked: " .. var_167_1)
			else
				var_166_0:name("\x01\aD35050FF\f<key>\r \tDiscord already linked")
			end

			return
		end

		local var_167_2 = tostring(arg_167_1.code or "")

		if var_167_2 == "" then
			var_166_0:name("\x01\aD35050FF\f<key>\r \t" .. tostring(arg_167_1.error or "No code returned"))

			return
		end

		slot_0_68_0.set(var_167_2)
		var_166_0:name("\x01\aB6DE47FF\f<key>\r \tCopied — use /auth in Discord")
	end)
end

slot_0_152_0 = {
	home = {
		script_label = slot_0_109_0.home.info:label(" \x01\a{Small Text}\f<sparkles>\r \tRelease"),
		welcome = slot_0_109_0.home.info:button(slot_0_73_0(), nil, true),
		user_label = slot_0_109_0.home.info:label(" \x01\a{Small Text}\f<user>\r \tUser"),
		user_name_button = slot_0_109_0.home.info:button(string.format(" %s \nuser", slot_0_18_0), nil, true),
		user_build_button = slot_0_109_0.home.info:button(slot_0_71_0(slot_0_25_0, "build"), function()
			slot_0_63_0()
		end, true),
		server_label = slot_0_109_0.home.info:label(" \x01\a{Small Text}\f<server>\r \tServer"),
		server_status = slot_0_109_0.home.info:button(" \x01\a{Small Text}\f<spinner>\r \t—\n\a{Small Text}status", function()
			if not slot_0_90_0.is_configured() then
				slot_0_91_0()

				return
			end

			slot_0_146_0("manual")
		end, true),
		version_label = slot_0_109_0.home.info:label(" \x01\a{Small Text}\f<code-branch>\r \tVersion"),
		version_button = slot_0_109_0.home.info:button(string.format(" %s \nversion", slot_0_17_0.version), nil, true),
		presence_online = slot_0_109_0.home.info:label("\x01\a{Small Text}\f<users>\r \tOnline\n\a{Small Text}—", nil, function(arg_170_0)
			return {
				roster = arg_170_0:list("\npresence_gear_roster", {
					" \x01\a{Small Text}—"
				})
			}
		end),
		dashboard_label = slot_0_109_0.home.profile:label(" \x01\a{Small Text}\f<globe>\r \tDashboard"),
		dashboard_profile = slot_0_109_0.home.profile:button(" \x01\a{Link Active}\f<user>\r\tMy Profile", function(arg_171_0)
			slot_0_149_0(arg_171_0)
		end, true),
		dashboard_status = slot_0_147_0,
		settings_label = slot_0_109_0.home.settings:label(" \x01\a{Link Active}\f<gear>\r \tSettings", nil, function(arg_172_0)
			return {
				hide_banner = arg_172_0:switch("\x01\f<image>\r\tHide menu banner", false)
			}
		end),
		links_scripts_l = slot_0_109_0.home.links:label(" \x01\a{Small Text}\f<code-branch>\r \tScripts"),
		links_live = slot_0_109_0.home.links:button(slot_0_72_0("live", false), function()
			slot_0_77_0(slot_0_74_0.live)
		end, true),
		links_alpha = slot_0_109_0.home.links:button(slot_0_72_0("alpha", false), function()
			slot_0_77_0(slot_0_74_0.alpha)
		end, true),
		links_socials_l = slot_0_109_0.home.links:label(" \x01\a{Small Text}\f<share-nodes>\r \tSocials"),
		links_discord = slot_0_109_0.home.links:button(" \x01\a5865F2FF\f<discord>\r ", function()
			slot_0_77_0(slot_0_74_0.discord)
		end, true),
		links_youtube = slot_0_109_0.home.links:button(" \x01\aFF0000FF\f<youtube>\r ", function()
			slot_0_77_0(slot_0_74_0.youtube)
		end, true),
		links_other_l = slot_0_109_0.home.links:label(" \x01\a{Small Text}\f<boxes-stacked>\r \tOther"),
		links_config = slot_0_109_0.home.links:button(" \f<bag-shopping>  Config ", function()
			slot_0_77_0(slot_0_74_0.config)
		end, true),
		links_style = slot_0_109_0.home.links:button(" \f<pen-swirl>  Style ", function()
			slot_0_77_0(slot_0_74_0.style)
		end, true),
		links_support_l = slot_0_109_0.home.links:label(" \x01\a{Small Text}\f<headset>\r \tSupport"),
		links_telegram = slot_0_109_0.home.links:button(" \x01\a26A5E4FF\f<telegram>\r ", function()
			slot_0_77_0(slot_0_74_0.telegram)
		end, true),
		discord_status = slot_0_150_0,
		discord_heading = slot_0_109_0.home.discord:label("\x01\a{Small Text}\f<discord>\r \tDiscord", nil, function(arg_180_0)
			return {
				discord_join = arg_180_0:button(" \x01\f<link>\r\tJoin", function()
					slot_0_77_0(slot_0_75_0)
				end, true),
				discord_code = arg_180_0:button(" \x01\a{Link Active}\f<key>\r\tGet code", function(arg_182_0)
					slot_0_151_0(arg_182_0)
				end, true)
			}
		end),
		stats_playtime_label = slot_0_109_0.home.profile_stats:label(" \x01\a{Small Text}\f<clock>\r \tPlaytime"),
		stats_playtime_btn = slot_0_109_0.home.profile_stats:button(" 00:00 \nplaytime", nil, true),
		stats_kills_label = slot_0_109_0.home.profile_stats:label(" \x01\a{Small Text}\f<bolt>\r \tKills"),
		stats_kills_btn = slot_0_109_0.home.profile_stats:button(" 0 \nkills", nil, true),
		stats_evaded_label = slot_0_109_0.home.profile_stats:label(" \x01\a{Small Text}\f<arrows-turn-to-dots>\r \tEvaded"),
		stats_evaded_btn = slot_0_109_0.home.profile_stats:button(" 0 \nevaded", nil, true),
		stats_other = slot_0_109_0.home.profile_stats:label("\a{Small Text}\f<ellipsis>\r \tOther", function(arg_183_0)
			return {
				stats_loads_lbl = arg_183_0:label("\a{Small Text}\f<hashtag>\r\tLoads\t0"),
				stats_deaths_lbl = arg_183_0:label("\a{Small Text}\f<skull>\r \tDeaths\t0"),
				stats_hits_lbl = arg_183_0:label("\a{Small Text}\f<circle-check>\r \tHits\t0"),
				stats_misses_lbl = arg_183_0:label("\a{Small Text}\f<xmark>\r \tMisses\t0"),
				stats_sync_btn = arg_183_0:button("\a{Small Text}\f<arrows-rotate>\r \tSync", nil, true, "Cloud sync"),
				stats_reset_btn = arg_183_0:button("\aD35050FF\f<trash>\r \tReset", nil, true, "Cloud statistics")
			}
		end),
		cfg_meta = slot_0_109_0.home.configs:label(" \x01\a{Small Text}\f<user>\r \t—   \x01\a{Small Text}\f<clock>\r \t—"),
		cfg_list = slot_0_109_0.home.configs:list("\nconfigs", {
			slot_0_112_0
		}),
		cfg_load = slot_0_109_0.home.configs:button("\t\t\f<arrow-down>\t\t", nil, false, "Load"),
		cfg_load_aa = slot_0_109_0.home.configs:button("  \f<shield>  ", nil, false, "Load AA only"),
		cfg_save = slot_0_109_0.home.configs:button("   \f<floppy-disk>   ", nil, true, "Save"),
		cfg_export = slot_0_109_0.home.configs:button("   \f<arrow-up-from-bracket>   ", nil, true, "Export"),
		cfg_delete = slot_0_109_0.home.configs:button(" \f<trash> ", nil, true, "Delete"),
		cfg_new_state = slot_0_109_0.home.configsnew:switch("\nconfignewstate"),
		cfg_new = slot_0_109_0.home.configsnew:button("\t\t\t\t\f<plus-large>  New\t\t\t\t", nil, true),
		cfg_import = slot_0_109_0.home.configsnew:button("   \f<arrow-down-to-bracket>  Import\t", nil, true),
		cfg_create = slot_0_109_0.home.configsnew:button("\t\t\t\t\f<plus-large>  New\t\t\t\t", nil, false),
		cfg_cancel = slot_0_109_0.home.configsnew:button("\t\f<xmark>  Cancel\t", nil, true),
		cfg_name = slot_0_109_0.home.configsnew:input("\nname", ""),
		cloud_info_author_label = slot_0_109_0.home.info1:label(" \x01\a{Small Text}\f<user>\r \tAuthor"),
		cloud_info_author_btn = slot_0_109_0.home.info1:button(" —\nauthor", nil, true),
		cloud_info_modified_label = slot_0_109_0.home.info1:label(" \x01\a{Small Text}\f<clock>\r \tModified"),
		cloud_info_modified_btn = slot_0_109_0.home.info1:button(" —\nmodified", nil, true),
		cloud_info_build_label = slot_0_109_0.home.info1:label(" \x01\a{Small Text}\f<brackets-curly>\r \tBuild"),
		cloud_info_build_btn = slot_0_109_0.home.info1:button(" —\nbuild", nil, true),
		cloud_info_relevance_label = slot_0_109_0.home.info1:label(" \x01\a{Small Text}\f<code-branch>\r \tRelevance"),
		cloud_info_relevance_btn = slot_0_109_0.home.info1:button(" —\nrelevance", nil, true),
		cloud_info_loads_label = slot_0_109_0.home.info1:label(" \x01\a{Small Text}\f<play>\r \tLoads"),
		cloud_info_loads_btn = slot_0_109_0.home.info1:button(" —\nloads", nil, true),
		cloud_info_likes_label = slot_0_109_0.home.info1:label(" \x01\a{Small Text}\f<heart>\r \tLikes"),
		cloud_info_likes_btn = slot_0_109_0.home.info1:button(" —\nlikes", nil, true),
		cloud_gate = slot_0_109_0.home.cloud:switch("\ncloud_gate_nl", false),
		stats_server_ok = slot_0_109_0.home.cloud:switch("\nstats_server_ok_nl", false),
		cloud_header = slot_0_109_0.home.cloud:label(" \x01\a{Small Text}\f<cloud>\r \tCloud"),
		cloud_refresh = slot_0_109_0.home.cloud:button("\t\f<arrows-rotate>\t", nil, false, "Refresh cloud list"),
		cloud_list = slot_0_109_0.home.cloud:list("\ncloud_presets", {
			" \x01\a{Small Text}…"
		}),
		cloud_load = slot_0_109_0.home.cloud:button("\t\t\f<arrow-down>\t\t", nil, false, "Load from cloud"),
		cloud_load_aa = slot_0_109_0.home.cloud:button("  \f<shield>  ", nil, false, "Load cloud AA only"),
		cloud_upload = slot_0_109_0.home.cloud:button("   \f<cloud-arrow-up>   ", nil, true, "Upload selected local preset"),
		cloud_save = slot_0_109_0.home.cloud:button("   \f<floppy-disk>   ", nil, true, "Save current config to selected cloud preset"),
		cloud_like = slot_0_109_0.home.cloud:button("  \f<heart>  ", nil, true, "Like cloud preset"),
		cloud_delete = slot_0_109_0.home.cloud:button(" \f<trash> ", nil, true, "Delete from cloud")
	},
	vars = {
		chi_enable = slot_0_109_0.vars.visuals:switch("\x01\f<crosshairs>\r\tCrosshair Indicators", false, "", function(arg_184_0)
			return {
				chi_style = arg_184_0:list("\nchi_style", {
					slot_0_94_0("\x01\f<text>\r\tDefault", true),
					slot_0_94_0("\x01\f<sparkles>\r\tClassic", true)
				}),
				chi_display = arg_184_0:selectable("\x01\f<eye>\r\tDisplay", {
					"Version",
					"Condition"
				}, 0, ""),
				chi_binds = arg_184_0:listable("\x01\f<keyboard>\r\tBinds", chi_bind_listable_items()),
				chi_flash_kill = arg_184_0:switch("\x01\f<bolt>\r\tFlash On Kill", true)
			}
		end),
		ping_spike_unlock = slot_0_109_0.vars.ragebot:switch("\x01\f<satellite-dish>\r\tUnlock Ping Spike", false, "", function(arg_185_0)
			return {
				ovr = arg_185_0:slider("\x01\f<gauge-simple-high>\r\tPing", 0, 200, 200, 1, "ms")
			}
		end),
		tick_lead = slot_0_109_0.vars.ragebot1:switch("\x01\f<sparkles>\r\tPrediction System", false, "Client timing tweak for earlier hitchance on moving targets. Tune amount to your ping and FPS.", function(arg_186_0)
			return {
				tier = arg_186_0:combo("\x01\f<gauge-simple-high>\r\tAmount", {
					"Light",
					"Normal",
					"Heavy",
					"Full"
				}, 1)
			}
		end),
		hc_manip = slot_0_109_0.vars.ragebot1:switch("\x01\f<crosshairs>\r\tHitchance Manipulations", false, "Applies contextual hitchance overrides per weapon group.", function(arg_187_0)
			return {
				weapon = arg_187_0:list("\x01\f<gun>\r\tWeapon group", slot_0_106_0())
			}
		end),
		air_stop = slot_0_109_0.vars.ragebot:switch("\x01\f<person-falling>\r\tAir Auto Stop", false, "Injects In Air into ragebot auto stop while jump-scouting with SSG-08 or R8.", function(arg_188_0)
			return {
				duck = arg_188_0:switch("\x01\f<angle>\r\tDuck in air", false, "Crouch mid-air when slow or close to tighten the shot."),
				trigger = arg_188_0:selectable("\x01\f<filter>\r\tStop conditions", {
					"Near target",
					"Walking"
				}, 0, "")
			}
		end),
		auto_teleport = slot_0_109_0.vars.ragebot1:switch("\x01\f<person-from-portal>\r\tAuto Teleport", false, "Defensive teleport while airborne with double tap when a threat is visible.", function(arg_189_0)
			return {
				wpns = arg_189_0:selectable("\x01\f<gun>\r\tAllowed weapons", {
					"Automatics",
					"Pistols",
					"Heavy pistols",
					"Melee"
				}, 0, "Non-automatic weapons are allowed by default.")
			}
		end),
		auto_hide_shots = slot_0_109_0.vars.ragebot1:switch("\x01\f<shuffle>\r\tAuto Hide Shots", false, "Temporarily swaps double tap for hide shots when exploit is ready.", function(arg_190_0)
			return {
				allow_rifles = arg_190_0:switch("\x01\f<check>\r\tAllow rifles and pistols", true),
				allow_deagle = arg_190_0:switch("\x01\f<check>\r\tAllow Desert Eagle", true)
			}
		end),
		hc_manip_profiles = {},
		adaptive_peek = slot_0_109_0.vars.ragebot:switch("\x01\f<sparkles>\r\tAI Peek", false, "Bind the switch. Needs Double Tap and Peek Assist active.", function(arg_191_0)
			return {
				weapons = arg_191_0:listable("\nap_peek_weapons", slot_0_102_0()),
				opts = arg_191_0:listable("\nap_peek_opts", slot_0_103_0()),
				hitboxes = arg_191_0:selectable("\x01\f<child-reaching>\r\tHitboxes", {
					"Head",
					"Chest",
					"Stomach",
					"Legs",
					"Feet",
					"Arms"
				}, 0, "Hitboxes the peek scanner is allowed to aim at. Empty uses the ragebot selection."),
				min_dmg = arg_191_0:slider("\x01\f<heart-crack>\r\tMin DMG", 0, 130, 0, 1, function(arg_192_0)
					return arg_192_0 == 0 and "Ragebot" or tostring(arg_192_0)
				end),
				peek_chance = arg_191_0:slider("\x01\f<crosshairs>\r\tHit Chance", 25, 100, 45, 1, function(arg_193_0)
					return tostring(arg_193_0) .. "%"
				end),
				max_enemies = arg_191_0:slider("\x01\f<users>\r\tMaximum enemies threshold", 1, 5, 5, 1, function(arg_194_0)
					return arg_194_0 >= 5 and "Any" or tostring(arg_194_0)
				end),
				max_distance = arg_191_0:slider("\x01\f<ruler-horizontal>\r\tMaximum distance", 0, 4000, 0, 1, function(arg_195_0)
					return arg_195_0 == 0 and "Off" or tostring(arg_195_0) .. "u"
				end),
				delay = arg_191_0:slider("\x01\f<timer>\r\tDelay", 0, 30, 9, 1, function(arg_196_0)
					return string.format("%.2fs", arg_196_0 * 0.01)
				end),
				simulation = arg_191_0:slider("\x01\f<clock>\r\tSimulation", 25, 35, 30, 1, function(arg_197_0)
					return string.format("%.2fs", arg_197_0 * 0.01)
				end),
				visualization = arg_191_0:color_picker("\x01\f<eye>\r\tVisualization", color(165, 125, 255, 255))
			}
		end),
		dormant_aim = slot_0_109_0.vars.ragebot:switch("\x01\f<moon>\r\tDormant Aimbot", false, "Fires at dormant enemies using last-known position memory.", function(arg_198_0)
			return {
				memory = arg_198_0:slider("\x01\f<wave-pulse>\r\tMin. accuracy", 25, 90, 65, 1, function(arg_199_0)
					return tostring(arg_199_0) .. "%"
				end)
			}
		end),
		vm_adjust = slot_0_109_0.vars.visuals:switch("\x01\f<hand>\r\tViewmodel", false, "", function(arg_200_0)
			return {
				vm_reset = arg_200_0:button("\x01\f<arrow-rotate-left>\r\tReset", nil, true),
				vm_fov = arg_200_0:slider("\x01\f<expand>\r\tFOV", 40, 120, 68, 1, function(arg_201_0)
					return "FOV: " .. tostring(arg_201_0)
				end),
				vm_x = arg_200_0:slider("\x01\f<arrows-left-right>\r\tOffset X", -100, 100, 0, 0.1, function(arg_202_0)
					return string.format("X: %.1f", arg_202_0 * 0.1)
				end),
				vm_y = arg_200_0:slider("\x01\f<arrows-up-down>\r\tOffset Y", -100, 100, 0, 0.1, function(arg_203_0)
					return string.format("Y: %.1f", arg_203_0 * 0.1)
				end),
				vm_z = arg_200_0:slider("\x01\f<up-down-left-right>\r\tOffset Z", -100, 100, 0, 0.1, function(arg_204_0)
					return string.format("Z: %.1f", arg_204_0 * 0.1)
				end)
			}
		end),
		crosshair_scope = slot_0_109_0.vars.visuals:switch("\x01\f<crosshairs-simple>\r\tCustom Scope", false, "", function(arg_205_0)
			return {
				scope_color = arg_205_0:color_picker("\x01\f<fill>\r\tColor", color(255, 255, 255, 255)),
				scope_size = arg_205_0:slider("\x01\f<maximize>\r\tLength", 20, 400, 40, 1, "px"),
				scope_gap = arg_205_0:slider("\x01\f<grip-lines>\r\tGap", 0, 60, 10, 1, "px"),
				scope_t_style = arg_205_0:switch("\x01\f<font>\r\tT-style crosshair", false),
				scope_force_vm = arg_205_0:switch("\x01\f<hand>\r\tForce Viewmodel", true)
			}
		end),
		hitmarker = slot_0_109_0.vars.visuals:switch("\x01\f<bullseye>\r\tHitmarker", false, "", function(arg_206_0)
			return {
				placement = arg_206_0:list("\nhm_placement", {
					slot_0_94_0("\x01\f<crosshairs>\r\tCrosshair", true),
					slot_0_94_0("\x01\f<globe>\r\tWorld", true)
				}),
				crosshair_style = arg_206_0:list("\nhm_cross_style", {
					slot_0_94_0("\x01\f<circle>\r\tGamesense", true),
					slot_0_94_0("\x01\f<sparkles>\r\tAmnesia", true)
				}),
				world_style = arg_206_0:list("\nhm_world_style", {
					slot_0_94_0("\x01\f<circle>\r\tGamesense", true),
					slot_0_94_0("\x01\f<sparkles>\r\tAmnesia", true)
				})
			}
		end),
		aspect = slot_0_109_0.vars.visuals:switch("\x01\f<display>\r\tAspect Ratio", false, "", function(arg_207_0)
			local var_207_0 = {
				[125] = "5:4",
				[160] = "16:10",
				[150] = "3:2",
				[133] = "4:3",
				[178] = "16:9"
			}

			return {
				ratio = arg_207_0:slider("\x01\f<expand>\r\tValue", 80, 240, 150, 1, function(arg_208_0)
					arg_208_0 = math.floor(tonumber(arg_208_0) or 0)

					return var_207_0[arg_208_0] or string.format("%.2f", arg_208_0 * 0.01)
				end),
				r_5_4 = arg_207_0:button("\x01\f<table-cells>\r\t5:4", nil, true),
				r_4_3 = arg_207_0:button("\x01\f<table-cells-large>\r\t4:3", nil, true),
				r_3_2 = arg_207_0:button("\x01\f<grip-lines-vertical>\r\t3:2", nil, true),
				r_16_10 = arg_207_0:button("\x01\f<rectangle>\r\t16:10", nil, true),
				r_16_9 = arg_207_0:button("\x01\f<tv>\r\t16:9", nil, true)
			}
		end),
		weather_manip = slot_0_109_0.vars.visuals2:switch("\x01\f<cloud-rain>\r\tWeather Manipulations", false, "", function(arg_209_0)
			return {
				style = arg_209_0:list("\nweather_style", {
					"\x01\f<cloud-rain>\r\tRain",
					"\x01\f<snowflake>\r\tSnow"
				}),
				radius = arg_209_0:slider("\x01\f<circle>\r\tRadius", 100, 750, 550, 1, function(arg_210_0)
					return tostring(arg_210_0) .. " ft"
				end),
				width = arg_209_0:slider("\x01\f<bars>\r\tWidth", 10, 55, 35, 1, function(arg_211_0)
					return tostring(arg_211_0) .. "%"
				end),
				alpha = arg_209_0:slider("\x01\f<droplet>\r\tOpacity", 10, 65, 45, 1, function(arg_212_0)
					return tostring(arg_212_0) .. "%"
				end),
				sound = arg_209_0:switch("\x01\f<volume-high>\r\tAmbient sound", false),
				volume = arg_209_0:slider("\x01\f<slider>\r\tVolume", 0, 100, 80, 1, function(arg_213_0)
					return tostring(arg_213_0) .. "%"
				end)
			}
		end),
		logs = slot_0_109_0.vars.misc:switch("\x01\f<rectangle-terminal>\r\tEventlogger", false, "", function(arg_214_0)
			return {
				modes = arg_214_0:selectable("\x01\f<list-check>\r\tModes", {
					"Aimbot",
					"Purchases",
					"Evaded Shots",
					"Harmed",
					"Anti-bruteforce",
					"Configs"
				}, 0, ""),
				output = arg_214_0:selectable("\x01\f<arrow-up-right-dots>\r\tOutput", {
					"Console",
					"Screen"
				}, 0, ""),
				log_counters = arg_214_0:switch("\x01\f<list-ol>\r\tShot counter", true, "Show hit/miss index in aimbot logs, e.g. [1]")
			}
		end),
		trashtalk_enable = slot_0_109_0.vars.misc:switch("\x01\f<comments>\r\tTrashtalk", false, function(arg_215_0)
			return {
				mode = arg_215_0:list("\ntrashtalk_mode", {
					slot_0_94_0("\x01\f<comments>\r\tDefault", true),
					slot_0_94_0("\x01\f<bolt>\r\t1", true),
					slot_0_94_0("\x01\f<sliders>\r\tRussian", true)
				}),
				conds = arg_215_0:selectable("\x01\f<filter>\r\tConditions", {
					"On Kill",
					"On Death"
				}, 0, ""),
				no_warmup = arg_215_0:switch("\x01\f<snowflake>\r\tDisable on warmup", true, "Stay silent during the warmup period."),
				revenge = arg_215_0:switch("\x01\f<skull-crossbones>\r\tRevenge", false, "Multi-message reply when you kill the player who killed you last.")
			}
		end),
		clantag_enable = slot_0_109_0.vars.misc:switch("\x01\f<tags>\r\tClantag Spammer", false),
		fast_ladder = slot_0_109_0.vars.misc4:switch("\x01\f<arrow-up-wide-short>\r\tFast Ladder", false),
		no_fall_damage = slot_0_109_0.vars.misc4:switch("\x01\f<person-falling>\r\tNo Fall Damage", false, "Duck before hard landings; not 100% reliable."),
		anim_breaker = slot_0_109_0.vars.misc3:switch("\x01\f<fan>\r\tAnimation Breaker", false, "", function(arg_216_0)
			return {
				ground_legs = arg_216_0:combo("\x01\f<person-walking>\r\tLegs on ground", {
					"Disabled",
					"Static",
					"Moonwalk"
				}),
				air_legs = arg_216_0:combo("\x01\f<person-walking>\r\tLegs in air", {
					"Disabled",
					"Static",
					"Moonwalk"
				}),
				land_pitch_zero = arg_216_0:switch("\x01\f<angle>\r\tPitch 0 on land", false)
			}
		end),
		lobby_badge = slot_0_109_0.vars.misc:switch("\x01\f<users>\r\tShared Features", false),
		mute_manipulations = slot_0_109_0.vars.misc3:switch("\x01\f<microphone>\r\tMute Manipulations", false, "Mute or unmute other players via voice interface.", function(arg_217_0)
			return {
				mode = arg_217_0:list("\nmute_manip_mode", {
					slot_0_94_0("\x01\f<microphone>\r\tUnmute", true),
					slot_0_94_0("\x01\f<microphone-slash>\r\tMute", true)
				})
			}
		end),
		avoid_collisions = slot_0_109_0.vars.misc4:switch("\x01\f<person-walking-arrow-loop-left>\r\tAvoid Collisions", false, "Steer away from walls while jumping to keep speed."),
		unlock_fd_speed = slot_0_109_0.vars.misc4:switch("\x01\f<rabbit>\r\tUnlock Fake Duck Speed", false, "Allows faster movement while fake ducking."),
		console_color = slot_0_109_0.vars.misc3:switch("\x01\f<terminal>\r\tConsole Color", false, "Recolor developer console panels while the game is focused.", function(arg_218_0)
			return {
				color = arg_218_0:color_picker("\x01\f<fill>\r\tColor", color(56, 56, 56, 154))
			}
		end),
		flash_game_icon = slot_0_109_0.vars.misc3:switch("\x01\f<lightbulb-on>\r\tFlash Game Icon", false, "Flash the CS:GO window on round start when unfocused."),
		auto_r8 = slot_0_109_0.vars.misc:switch("\x01\f<gun>\r\tAuto !r8", false, "Automatically types !r8 in chat on pistol rounds (first round of each half). For servers with the !r8 give command.", function(arg_219_0)
			return {
				mode = arg_219_0:list("\nauto_r8_mode", {
					slot_0_94_0("\x01\f<dice-one>\r\tFirst round only", true),
					slot_0_94_0("\x01\f<arrows-split-up-and-left>\r\tFirst & half round", true)
				})
			}
		end),
		grenades = slot_0_109_0.vars.misc1:label("\x01\f<bomb>\r\tGrenades", nil, function(arg_220_0)
			return {
				super_toss = arg_220_0:switch("\x01\f<arrow-down-left-and-arrow-up-right-to-center>\r\tSuper Toss", false, "Compensates grenade trajectory while moving."),
				grenade_release = arg_220_0:switch("\x01\f<hand-sparkles>\r\tGrenade Release", false, "Auto-release grenades at lethal damage."),
				gr_on_pin_pulled = arg_220_0:switch("\x01\f<circle-notch>\r\tOn pin pulled", false),
				gr_release_damage = arg_220_0:slider("\x01\f<wine-bottle>\r\tMin. damage", 1, 60, 20, 1, "hp"),
				gr_allowed_grenades = arg_220_0:selectable("\x01\f<list-check>\r\tTypes", {
					"Molotov",
					"High Explosive"
				}, 0, ""),
				drop_grenades = arg_220_0:switch("\x01\f<bomb>\r\tDrop Grenades", false, "Hold bind to drop all grenades.")
			}
		end),
		warmup_setup = slot_0_109_0.vars.misc1:label("\x01\f<fire-flame-curved>\r\tWarmup", nil, function(arg_221_0)
			return {
				section = arg_221_0:list("\nws_section", {
					slot_0_94_0("\x01\f<sliders>\r\tSettings", true),
					slot_0_94_0("\x01\f<robot>\r\tBots", true),
					slot_0_94_0("\x01\f<map>\r\tMaps", true)
				}),
				infinite_ammo = arg_221_0:switch("\x01\f<infinity>\r\tInfinite ammo", true),
				grenade_traj = arg_221_0:switch("\x01\f<bomb>\r\tGrenade trajectory", true),
				kick_bots = arg_221_0:switch("\x01\f<robot>\r\tKick bots", true),
				buy_anywhere = arg_221_0:switch("\x01\f<cart-shopping>\r\tBuy anywhere", true),
				auto_on_map = arg_221_0:switch("\x01\f<rotate>\r\tAuto setup on map change", false),
				apply = arg_221_0:button("\x01\f<bolt>\r\tApply setup", nil, false, "Runs practice cvars on the current map."),
				showpos = arg_221_0:button("\x01\f<location-crosshairs>\r\tToggle cl_showpos", nil, false, "Show or hide coordinates in the top-left corner."),
				bot_place = arg_221_0:hotkey("\x01\f<robot>\r\tBot place"),
				de_overpass = arg_221_0:button("\x01\f<map-location-dot>\r\tOverpass", nil, true),
				de_mirage = arg_221_0:button("\x01\f<map-location-dot>\r\tMirage", nil, true),
				de_vertigo = arg_221_0:button("\x01\f<map-location-dot>\r\tVertigo", nil, true),
				de_inferno = arg_221_0:button("\x01\f<map-location-dot>\r\tInferno", nil, true),
				de_dust2 = arg_221_0:button("\x01\f<map-location-dot>\r\tDust II", nil, true),
				de_cbble = arg_221_0:button("\x01\f<map-location-dot>\r\tCobblestone", nil, true),
				de_bank = arg_221_0:button("\x01\f<map-location-dot>\r\tBank", nil, true),
				de_shortdust = arg_221_0:button("\x01\f<map-location-dot>\r\tShortdust", nil, true),
				de_shortnuke = arg_221_0:button("\x01\f<map-location-dot>\r\tShortnuke", nil, true),
				cs_office = arg_221_0:button("\x01\f<map-location-dot>\r\tOffice", nil, true),
				cs_assault = arg_221_0:button("\x01\f<map-location-dot>\r\tAssault", nil, true)
			}
		end),
		ov_panel = slot_0_109_0.vars.overlay:switch("\x01\f<layer-group>\r\tScreen HUD", true, "Watermark and on-screen widgets."),
		ov_watermark = slot_0_109_0.vars.overlay:switch("\x01\f<bookmark>\r\tWatermark", true, "", function(arg_222_0)
			local var_222_0 = arg_222_0:listable("\x01\f<list-check>\r\tElements", slot_0_98_0())

			pcall(function()
				if type(var_222_0.set) == "function" then
					var_222_0:set(slot_0_98_0())
				end
			end)

			return {
				wm_elements = var_222_0,
				wm_time = arg_222_0:combo("\x01\f<clock>\r\tTime", {
					"24-hour",
					"12-hour"
				}, 0),
				wm_avatar = arg_222_0:combo("\x01\f<user>\r\tAvatar", {
					"Steam",
					"Neverlose",
					"Cloud"
				}, 0),
				wm_name_src = arg_222_0:combo("\x01\f<signature>\r\tName", {
					"Steam",
					"Neverlose",
					"Custom"
				}, 2),
				wm_name_custom = arg_222_0:input("\nwm_name", "amnesia.plus", "Supports \\f<icon> and \\v\\r color tags")
			}
		end),
		ov_slowdown = slot_0_109_0.vars.overlay:switch("\x01\f<snowflake>\r\tSlowdown", true, "Shows velocity modifier when slowed (bhop penalty)."),
		ov_keybinds = slot_0_109_0.vars.overlay:switch("\x01\f<keyboard-brightness>\r\tActive Binds", true, "Shows currently held menu and rage hotkeys.", function(arg_224_0)
			return {
				binds = arg_224_0:listable("\x01\f<keyboard>\r\tBinds", kb_bind_listable_items()),
				feature_icons = arg_224_0:switch("\x01\f<icons>\r\tFeature Icons", false, "Show an icon before each active bind row."),
				revert = arg_224_0:switch("\x01\f<arrow-right-arrow-left>\r\tRevert", false, "Put bind state on the left and the feature name on the right.")
			}
		end),
		ov_gs_inds = slot_0_109_0.vars.overlay:switch("\x01\f<badge-dollar>\r\tGS Indicators", false, "Gamesense-style active bind and bomb status stack.", function(arg_225_0)
			return {
				binds = arg_225_0:listable("\x01\f<keyboard>\r\tBinds", gs_bind_listable_items())
			}
		end),
		ov_damage_ind = slot_0_109_0.vars.overlay:switch("\x01\f<hundred-points>\r\tDamage Indicator", false, "Shows minimum damage on screen.", function(arg_226_0)
			return {
				anim = arg_226_0:switch("\x01\f<wave-sine>\r\tAnimated", false),
				show_state = arg_226_0:switch("\x01\f<circle-dashed>\r\tShow state", false, "Will make text darker if damage is not overridden.")
			}
		end),
		ov_metrics = slot_0_109_0.vars.overlay:switch("\x01\f<chart-network>\r\tMetrics", false, "Network performance overlay."),
		ov_spectators = slot_0_109_0.vars.overlay:switch("\x01\f<camera-cctv>\r\tSpectators", false, "Shows players currently spectating you."),
		ov_arrows = slot_0_109_0.vars.overlay:switch("\x01\f<location-arrow>\r\tManual Arrows", false, "Left/right arrows around the crosshair that appear only while a manual anti-aim side is active.", function(arg_227_0)
			return {
				arrows_color = arg_227_0:color_picker("\x01\f<fill>\r\tActive color", color(165, 125, 255, 255)),
				arrows_gap = arg_227_0:slider("\x01\f<arrows-left-right-to-line>\r\tGap", 8, 80, 26, 1, "px"),
				arrows_size = arg_227_0:slider("\x01\f<maximize>\r\tSize", 6, 24, 11, 1, "px"),
				extra_dirs = arg_227_0:listable("\x01\f<list-check>\r\tExtra arrows", slot_0_100_0())
			}
		end)
	},
	antiaim = {
		enabled = slot_0_109_0.antiaim.general:switch("\x01\f<shield-check>\r\tEnable anti-aim", false),
		build_state = slot_0_109_0.antiaim.builder:combo("\x01\f<location-pin>\r\tState", AA_CONDITIONS, 0, function(arg_228_0)
			return {
				export_state = arg_228_0:button(" \x01\a{Small Text}\f<copy>\r\tCopy", nil, true),
				import_state = arg_228_0:button(" \x01\a{Small Text}\f<paste>\r\tPaste", nil, true),
				reset_state = arg_228_0:button(" \x01\a{Small Text}\f<rotate-right>\r\tReset", nil, true),
				log = arg_228_0:label("")
			}
		end),
		def_state = slot_0_109_0.antiaim.defensive:combo("\x01\f<location-pin>\r\tState", AA_CONDITIONS_DEF, 0),
		def_settings = slot_0_109_0.antiaim.defensive1:label("\x01\f<pen-swirl>\r\tSettings", nil, function(arg_229_0)
			return {
				allow_hs = arg_229_0:switch("\x01\f<check>\r\tAllow with Hide Shots", true),
				clear_mod = arg_229_0:switch("\x01\f<broom>\r\tClear modifier", true, "Strip yaw modifier while defensive snap is active."),
				land_pitch = arg_229_0:switch("\x01\f<person-falling>\r\tLanding pitch", false, "Flatten pitch on landing ticks during defensive snap.")
			}
		end),
		settings = slot_0_109_0.antiaim.settings:label("\x01\f<pen-swirl>\r\tSettings", nil, function(arg_230_0)
			return {
				profile = arg_230_0:list("\naa_settings_profile", {
					slot_0_94_0("\x01\f<check>\r\tDefault", true),
					slot_0_94_0("\x01\f<trophy>\r\tUnmatched", true)
				}, nil, false)
			}
		end),
		manual_yaw = slot_0_109_0.antiaim.general:combo("\x01\f<up-down-left-right>\r\tManual Yaw", {
			"Off",
			"Left",
			"Right",
			"Forward"
		}, function(arg_231_0)
			return {
				static_yaw = arg_231_0:switch("\x01\f<arrow-up>\r\tStatic", true)
			}
		end),
		avoid_backstab = slot_0_109_0.antiaim.general:switch("\x01\f<shield>\r\tAvoid Backstab", false),
		safe_head = slot_0_109_0.antiaim.general:switch("\x01\f<head-side-mask>\r\tSafe Head", false, "", function(arg_232_0)
			return {
				conditions = arg_232_0:selectable("\x01\f<filter>\r\tConditions", {
					"Air",
					"Air~C",
					"Stand",
					"Crouch"
				}, 0, ""),
				height_gap = arg_232_0:slider("\x01\f<line-height>\r\tHeight Gap", 0, 100, 35, 1, function(arg_233_0)
					return arg_233_0 == 0 and "Off" or arg_233_0 .. "u"
				end),
				weapons = arg_232_0:list("\x01\f<shield-halved>\r\tWeapon", {
					"\x01\f<knife-kitchen>\r\tKnife \x01\f<bolt>\r\t+ Taser",
					"\x01\f<knife-kitchen>\r\tKnife",
					"\x01\f<bolt>\r\tTaser",
					"\x01\f<gun>\r\tAll weapons"
				}),
				desync_limit = arg_232_0:slider("\x01\f<people-arrows>\r\tDesync Limit", 0, 60, 8, 1, function(arg_234_0)
					return arg_234_0 .. "°"
				end)
			}
		end),
		static_warmup = slot_0_109_0.antiaim.general:switch("\x01\f<street-view>\r\tHide on warm-up", false),
		anti_brute = slot_0_109_0.antiaim.general:switch("\x01\f<shirt-running>\r\tAnti-bruteforce", false, "", function(arg_235_0)
			return {
				method = arg_235_0:combo("\x01\f<shuffle>\r\tMethod", "Decrease", "Randomize", "Increase"),
				duration = arg_235_0:slider("\x01\f<timer>\r\tDuration", 0, 10, 3, 1, function(arg_236_0)
					return arg_236_0 == 0 and "Until reset" or arg_236_0 .. "s"
				end)
			}
		end),
		freestand = slot_0_109_0.antiaim.general:switch("\x01\f<arrows-turn-to-dots>\r\tFreestanding", false, "", function(arg_237_0)
			return {
				static_yaw = arg_237_0:switch("\x01\f<compass>\r\tStatic Yaw", false),
				safety_disablers = arg_237_0:switch("\x01\f<shield>\r\tSafety Disablers", false)
			}
		end),
		legit_aa = slot_0_109_0.antiaim.general:switch(" \x01\f<hand>\r \tLegit AA", false),
		builder_states = {},
		defensive_states = {}
	}
}
MANUAL_YAW_MODES = {
	"Off",
	"Left",
	"Right",
	"Forward"
}

function slot_0_153_0()
	local var_238_0 = slot_0_152_0.antiaim and slot_0_152_0.antiaim.manual_yaw

	if not var_238_0 or type(var_238_0.get) ~= "function" then
		return "Off"
	end

	local var_238_1, var_238_2 = pcall(function()
		return var_238_0:get()
	end)

	if not var_238_1 or var_238_2 == nil then
		return "Off"
	end

	if type(var_238_2) == "number" then
		local var_238_3 = math.floor(var_238_2)

		if var_238_3 >= 0 and var_238_3 < #MANUAL_YAW_MODES then
			return MANUAL_YAW_MODES[var_238_3 + 1]
		end

		if var_238_3 >= 1 and var_238_3 <= #MANUAL_YAW_MODES then
			return MANUAL_YAW_MODES[var_238_3]
		end

		return "Off"
	end

	local var_238_4 = tostring(var_238_2)

	for iter_238_0 = 2, #MANUAL_YAW_MODES do
		if var_238_4:find(MANUAL_YAW_MODES[iter_238_0], 1, true) then
			return MANUAL_YAW_MODES[iter_238_0]
		end
	end

	if var_238_4:find("Default", 1, true) or var_238_4:find("Backward", 1, true) then
		return "Off"
	end

	if var_238_4:find("Off", 1, true) then
		return "Off"
	end

	return "Off"
end

function slot_0_154_0()
	return slot_0_153_0() ~= "Off"
end

slot_0_155_2 = slot_0_152_0.vars.hc_manip
slot_0_156_2 = slot_0_152_0.vars.hc_manip_profiles

if slot_0_155_2 and slot_0_156_2 and type(slot_0_155_2.create) == "function" then
	slot_0_157_2 = slot_0_155_2:create()

	for iter_0_8 = 1, #HC_WEAPON_GROUPS do
		slot_0_162_2 = HC_WEAPON_GROUPS[iter_0_8]
		slot_0_156_2[slot_0_162_2.key] = {
			enabled = slot_0_157_2:switch(("\x01\f<%s>\r\tEnable"):format(slot_0_162_2.icon), false),
			when = slot_0_157_2:combo("\x01\f<filter>\r\tTrigger", HC_TRIGGER_OPTS, 0),
			chance = slot_0_157_2:slider("\x01\f<crosshairs>\r\tHit Chance", 1, 100, 55, 1, function(arg_241_0)
				return tostring(arg_241_0) .. "%"
			end),
			miss_need = slot_0_157_2:slider("\x01\f<hashtag>\r\tMiss count", 1, 10, 2),
			hp_below = slot_0_157_2:slider("\x01\f<heart-crack>\r\tHP below", 1, 100, 80)
		}
	end
end

function slot_0_62_0()
	for iter_242_0 = 1, #slot_0_52_0 do
		local var_242_0 = slot_0_52_0[iter_242_0]

		slot_0_55_0(var_242_0, slot_0_51_0(var_242_0.min))
	end
end

slot_0_78_0.build = {
	active = slot_0_46_0,
	assigned = slot_0_47_0,
	is = slot_0_50_0,
	at_least = slot_0_48_0,
	has_access = slot_0_49_0,
	feature = slot_0_51_0,
	register = slot_0_56_0,
	lock_message = slot_0_53_0,
	refresh = slot_0_62_0
}

slot_0_62_0()

function slot_0_80_0(arg_243_0)
	if type(arg_243_0) ~= "table" then
		return
	end

	local function var_243_0(arg_244_0)
		arg_244_0 = tostring(arg_244_0 or "")
		arg_244_0 = arg_244_0:gsub("^%s+", ""):gsub("%s+$", "")

		return arg_244_0
	end

	local function var_243_1(arg_245_0)
		local var_245_0 = var_243_0(arg_243_0[arg_245_0])

		if var_245_0 ~= "" and var_245_0:match("^https?://") then
			return var_245_0
		end

		return nil
	end

	local var_243_2 = var_243_0(arg_243_0.script_version)

	if var_243_2 ~= "" then
		slot_0_78_0.api_script_version = var_243_2
	else
		slot_0_78_0.api_script_version = nil
	end

	local var_243_3 = slot_0_78_0.api_script_version or slot_0_17_0.version

	pcall(function()
		if slot_0_152_0.home.version_button and type(slot_0_152_0.home.version_button.name) == "function" then
			slot_0_152_0.home.version_button:name(string.format(" %s \nversion", var_243_3))
		end
	end)

	local var_243_4 = var_243_1("link_live")

	if var_243_4 then
		slot_0_74_0.live = var_243_4
	end

	local var_243_5 = var_243_1("link_alpha")

	if var_243_5 then
		slot_0_74_0.alpha = var_243_5
	end

	local var_243_6 = var_243_1("link_config")

	if var_243_6 then
		slot_0_74_0.config = var_243_6
	end

	local var_243_7 = var_243_1("link_style")

	if var_243_7 then
		slot_0_74_0.style = var_243_7
	end

	local var_243_8 = var_243_1("chi_logo_l")

	if var_243_8 then
		slot_0_78_0.chi_logo_urls = slot_0_78_0.chi_logo_urls or {}
		slot_0_78_0.chi_logo_urls.logo_l = var_243_8
	end

	local var_243_9 = var_243_1("chi_logo_r")

	if var_243_9 then
		slot_0_78_0.chi_logo_urls = slot_0_78_0.chi_logo_urls or {}
		slot_0_78_0.chi_logo_urls.logo_r = var_243_9
	end

	local var_243_10 = var_243_1("telegram")

	if var_243_10 then
		slot_0_74_0.telegram = var_243_10
	end

	local var_243_11 = var_243_1("youtube")

	if var_243_11 then
		slot_0_74_0.youtube = var_243_11
	end

	local var_243_12 = var_243_1("discord")

	if var_243_12 then
		slot_0_75_0 = var_243_12
		slot_0_74_0.discord = var_243_12
	end

	local function var_243_13(arg_247_0)
		return var_243_1(arg_247_0)
	end

	local var_243_14 = var_243_13("badge_live")

	if var_243_14 then
		slot_0_78_0.badge_icons.live = var_243_14
	end

	local var_243_15 = var_243_13("badge_alpha")

	if var_243_15 then
		slot_0_78_0.badge_icons.alpha = var_243_15
	end

	local var_243_16 = var_243_13("badge_debug")

	if var_243_16 then
		slot_0_78_0.badge_icons.debug = var_243_16
	end

	local var_243_17 = arg_243_0.assigned_channel

	if type(var_243_17) == "string" then
		local var_243_18 = tonumber(arg_243_0.alpha_dlc_claimed_at) or 0

		if var_243_18 > 0 then
			slot_0_32_0(var_243_18)
		end

		slot_0_24_0 = slot_0_43_0(var_243_17, var_243_18)

		local var_243_19 = slot_0_41_0(slot_0_18_0)

		if slot_0_39_0(var_243_19) > slot_0_39_0(slot_0_24_0) then
			slot_0_24_0 = var_243_19
		end

		slot_0_64_0 = slot_0_24_0

		local var_243_20 = slot_0_38_0(slot_0_25_0)

		if not slot_0_40_0(var_243_20, slot_0_18_0) then
			slot_0_25_0 = slot_0_24_0
		end

		slot_0_61_0(var_243_18)
		slot_0_57_0()
		slot_0_58_0()

		if apply_overlay_hud_access then
			apply_overlay_hud_access()
		end

		if slot_0_62_0 then
			slot_0_62_0()
		end
	end

	slot_0_78_0.api_alpha_dlc_claimed_at = tonumber(arg_243_0.alpha_dlc_claimed_at) or 0

	if type(slot_0_78_0.try_schedule_startup_greets) == "function" then
		pcall(slot_0_78_0.try_schedule_startup_greets, slot_0_78_0.api_alpha_dlc_claimed_at)
	end

	local var_243_21 = tostring(arg_243_0.cloud_avatar_b64 or "")
	local var_243_22 = tostring(arg_243_0.cloud_avatar_mime or "image/png")

	if var_243_21 == "" then
		slot_0_78_0.cloud_avatar_b64 = nil
		slot_0_78_0.cloud_avatar_mime = nil
		slot_0_78_0.cloud_avatar_stamp = nil
		slot_0_78_0.cloud_avatar_loaded_stamp = nil
	else
		local var_243_23 = tostring(#var_243_21) .. ":" .. var_243_22

		if slot_0_78_0.cloud_avatar_stamp ~= var_243_23 then
			slot_0_78_0.cloud_avatar_b64 = var_243_21
			slot_0_78_0.cloud_avatar_mime = var_243_22
			slot_0_78_0.cloud_avatar_stamp = var_243_23
			slot_0_78_0.cloud_avatar_loaded_stamp = nil
		end
	end
end

slot_0_78_0.cloud_filter_options = {
	slot_0_94_0("\x01\f<list>\r\tNone", true),
	slot_0_94_0("\x01\f<user>\r\tMy", true),
	slot_0_94_0("\x01\f<heart>\r\tLiked", true)
}
slot_0_78_0.cloud_sort_options = {
	slot_0_94_0("\x01\f<clock>\r\tLast update", true),
	slot_0_94_0("\x01\f<timer>\r\tOldest update", true),
	slot_0_94_0("\x01\f<heart>\r\tMost liked", true),
	slot_0_94_0("\x01\f<play>\r\tMost loaded", true),
	slot_0_94_0("\x01\f<font>\r\tName A–Z", true),
	slot_0_94_0("\x01\f<font>\r\tName Z–A", true),
	slot_0_94_0("\x01\f<users>\r\tAuthor A–Z", true)
}

function slot_0_155_1(arg_248_0)
	if type(slot_0_0_0.string) == "function" then
		return slot_0_0_0.string(arg_248_0)
	end

	return arg_248_0
end

slot_0_78_0.cloud_list_loading_label = slot_0_155_1(" \x01\a{Small Text}\f<spinner>\r  Loading…")
slot_0_78_0.cloud_list_empty_label = slot_0_155_1(" \x01\a{Small Text}No cloud configs found")
slot_0_156_1 = slot_0_78_0.cloud_ui

function slot_0_157_1(arg_249_0, arg_249_1)
	return string.lower(tostring(arg_249_0 or "")) == string.lower(tostring(arg_249_1 or ""))
end

function slot_0_158_1(arg_250_0, arg_250_1)
	if not arg_250_0 or type(arg_250_0.get) ~= "function" then
		return 0
	end

	local var_250_0
	local var_250_1, var_250_2 = pcall(function()
		return arg_250_0:get()
	end)

	if not var_250_1 then
		return 0
	end

	local var_250_3 = var_250_2
	local var_250_4 = arg_250_1

	if type(arg_250_0.list) == "function" then
		local var_250_5, var_250_6 = pcall(function()
			return arg_250_0:list()
		end)

		if var_250_5 and type(var_250_6) == "table" and #var_250_6 > 0 then
			var_250_4 = var_250_6
		end
	end

	for iter_250_0 = 1, #var_250_4 do
		if var_250_3 == var_250_4[iter_250_0] then
			return iter_250_0 - 1
		end

		if slot_0_93_0(var_250_3) == slot_0_93_0(var_250_4[iter_250_0]) then
			return iter_250_0 - 1
		end
	end

	if type(var_250_3) == "number" then
		local var_250_7 = math.floor(var_250_3)

		if var_250_7 >= 0 and var_250_7 < #var_250_4 then
			return var_250_7
		end

		if var_250_7 >= 1 and var_250_7 <= #var_250_4 then
			return var_250_7 - 1
		end
	end

	return 0
end

function slot_0_159_3()
	return slot_0_158_1(slot_0_152_0.home.cloud_filter, slot_0_78_0.cloud_filter_options)
end

function slot_0_160_3()
	return slot_0_158_1(slot_0_152_0.home.cloud_sort, slot_0_78_0.cloud_sort_options)
end

function slot_0_161_2(arg_255_0, arg_255_1)
	if arg_255_1 == 0 then
		local var_255_0 = {}

		for iter_255_0 = 1, #arg_255_0 do
			var_255_0[iter_255_0] = arg_255_0[iter_255_0]
		end

		return var_255_0
	end

	local var_255_1 = {}

	for iter_255_1 = 1, #arg_255_0 do
		local var_255_2 = arg_255_0[iter_255_1]

		if arg_255_1 == 1 and slot_0_157_1(var_255_2.author, slot_0_18_0) then
			var_255_1[#var_255_1 + 1] = var_255_2
		elseif arg_255_1 == 2 and var_255_2.liked == true then
			var_255_1[#var_255_1 + 1] = var_255_2
		end
	end

	return var_255_1
end

function slot_0_162_1(arg_256_0, arg_256_1)
	local var_256_0 = {}

	for iter_256_0 = 1, #arg_256_0 do
		var_256_0[iter_256_0] = arg_256_0[iter_256_0]
	end

	if #var_256_0 <= 1 then
		return var_256_0
	end

	local function var_256_1(arg_257_0)
		return tostring(arg_257_0.modified or "")
	end

	local function var_256_2(arg_258_0)
		return string.lower(tostring(arg_258_0.name or ""))
	end

	local function var_256_3(arg_259_0)
		return string.lower(tostring(arg_259_0.author or ""))
	end

	local function var_256_4(arg_260_0)
		return tonumber(arg_260_0.likes) or 0
	end

	local function var_256_5(arg_261_0)
		return tonumber(arg_261_0.loads) or 0
	end

	if arg_256_1 == 0 then
		table.sort(var_256_0, function(arg_262_0, arg_262_1)
			local var_262_0 = var_256_1(arg_262_0)
			local var_262_1 = var_256_1(arg_262_1)

			if var_262_0 ~= var_262_1 then
				return var_262_1 < var_262_0
			end

			return var_256_2(arg_262_0) < var_256_2(arg_262_1)
		end)
	elseif arg_256_1 == 1 then
		table.sort(var_256_0, function(arg_263_0, arg_263_1)
			local var_263_0 = var_256_1(arg_263_0)
			local var_263_1 = var_256_1(arg_263_1)

			if var_263_0 ~= var_263_1 then
				return var_263_0 < var_263_1
			end

			return var_256_2(arg_263_0) < var_256_2(arg_263_1)
		end)
	elseif arg_256_1 == 2 then
		table.sort(var_256_0, function(arg_264_0, arg_264_1)
			local var_264_0 = var_256_4(arg_264_0)
			local var_264_1 = var_256_4(arg_264_1)

			if var_264_0 ~= var_264_1 then
				return var_264_1 < var_264_0
			end

			local var_264_2 = var_256_1(arg_264_0)
			local var_264_3 = var_256_1(arg_264_1)

			if var_264_2 ~= var_264_3 then
				return var_264_3 < var_264_2
			end

			return var_256_2(arg_264_0) < var_256_2(arg_264_1)
		end)
	elseif arg_256_1 == 3 then
		table.sort(var_256_0, function(arg_265_0, arg_265_1)
			local var_265_0 = var_256_5(arg_265_0)
			local var_265_1 = var_256_5(arg_265_1)

			if var_265_0 ~= var_265_1 then
				return var_265_1 < var_265_0
			end

			local var_265_2 = var_256_1(arg_265_0)
			local var_265_3 = var_256_1(arg_265_1)

			if var_265_2 ~= var_265_3 then
				return var_265_3 < var_265_2
			end

			return var_256_2(arg_265_0) < var_256_2(arg_265_1)
		end)
	elseif arg_256_1 == 4 then
		table.sort(var_256_0, function(arg_266_0, arg_266_1)
			local var_266_0 = var_256_2(arg_266_0)
			local var_266_1 = var_256_2(arg_266_1)

			if var_266_0 ~= var_266_1 then
				return var_266_0 < var_266_1
			end

			return var_256_3(arg_266_0) < var_256_3(arg_266_1)
		end)
	elseif arg_256_1 == 5 then
		table.sort(var_256_0, function(arg_267_0, arg_267_1)
			local var_267_0 = var_256_2(arg_267_0)
			local var_267_1 = var_256_2(arg_267_1)

			if var_267_0 ~= var_267_1 then
				return var_267_1 < var_267_0
			end

			return var_256_3(arg_267_0) < var_256_3(arg_267_1)
		end)
	elseif arg_256_1 == 6 then
		table.sort(var_256_0, function(arg_268_0, arg_268_1)
			local var_268_0 = var_256_3(arg_268_0)
			local var_268_1 = var_256_3(arg_268_1)

			if var_268_0 ~= var_268_1 then
				return var_268_0 < var_268_1
			end

			return var_256_2(arg_268_0) < var_256_2(arg_268_1)
		end)
	end

	return var_256_0
end

function slot_0_163_1(arg_269_0, arg_269_1, arg_269_2)
	if not arg_269_0 or type(arg_269_0.name) ~= "function" then
		return
	end

	pcall(function()
		arg_269_0:name(string.format(" %s \n%s", tostring(arg_269_2 or "—"), arg_269_1))
	end)
end

function slot_0_156_1.update_info_panel()
	local var_271_0 = slot_0_156_1.selected_preset()

	if not var_271_0 then
		slot_0_163_1(slot_0_152_0.home.cloud_info_author_btn, "author", "—")
		slot_0_163_1(slot_0_152_0.home.cloud_info_modified_btn, "modified", "—")
		slot_0_163_1(slot_0_152_0.home.cloud_info_build_btn, "build", "—")
		slot_0_163_1(slot_0_152_0.home.cloud_info_relevance_btn, "relevance", "—")
		slot_0_163_1(slot_0_152_0.home.cloud_info_loads_btn, "loads", "—")
		slot_0_163_1(slot_0_152_0.home.cloud_info_likes_btn, "likes", "—")

		return
	end

	slot_0_163_1(slot_0_152_0.home.cloud_info_author_btn, "author", tostring(var_271_0.author or "?"))
	slot_0_163_1(slot_0_152_0.home.cloud_info_modified_btn, "modified", tostring(var_271_0.modified or "—"))

	local var_271_1 = tostring(var_271_0.build_name or "")
	local var_271_2 = tostring(var_271_0.build_version or "")
	local var_271_3 = "—"

	if var_271_1 ~= "" and var_271_2 ~= "" then
		var_271_3 = var_271_1 .. " · " .. var_271_2
	elseif var_271_2 ~= "" then
		var_271_3 = var_271_2
	elseif var_271_1 ~= "" then
		var_271_3 = var_271_1
	end

	slot_0_163_1(slot_0_152_0.home.cloud_info_build_btn, "build", var_271_3)

	local var_271_4 = tostring(slot_0_78_0.api_script_version or slot_0_17_0.version or "")
	local var_271_5 = "—"

	if var_271_2 ~= "" then
		var_271_5 = var_271_2 == var_271_4 and "\x01\a{Link Active}Updated" or "\x01\aD35050FFOutdated"
	end

	slot_0_163_1(slot_0_152_0.home.cloud_info_relevance_btn, "relevance", var_271_5)
	slot_0_163_1(slot_0_152_0.home.cloud_info_loads_btn, "loads", tostring(tonumber(var_271_0.loads) or 0))
	slot_0_163_1(slot_0_152_0.home.cloud_info_likes_btn, "likes", tostring(tonumber(var_271_0.likes) or 0))
end

function slot_0_156_1.sync_actions()
	local var_272_0 = slot_0_156_1.selected_preset()
	local var_272_1 = var_272_0 ~= nil
	local var_272_2 = var_272_1 and slot_0_157_1(var_272_0.author, slot_0_18_0)

	pcall(function()
		if slot_0_152_0.home.cloud_load and type(slot_0_152_0.home.cloud_load.disabled) == "function" then
			slot_0_152_0.home.cloud_load:disabled(not var_272_1)
		end

		if slot_0_152_0.home.cloud_load_aa and type(slot_0_152_0.home.cloud_load_aa.disabled) == "function" then
			slot_0_152_0.home.cloud_load_aa:disabled(not var_272_1)
		end

		if slot_0_152_0.home.cloud_save and type(slot_0_152_0.home.cloud_save.disabled) == "function" then
			slot_0_152_0.home.cloud_save:disabled(not var_272_2)
		end

		if slot_0_152_0.home.cloud_delete and type(slot_0_152_0.home.cloud_delete.disabled) == "function" then
			slot_0_152_0.home.cloud_delete:disabled(not var_272_2)
		end

		if slot_0_152_0.home.cloud_like and type(slot_0_152_0.home.cloud_like.disabled) == "function" then
			slot_0_152_0.home.cloud_like:disabled(not var_272_1)
		end

		if slot_0_152_0.home.cloud_like and type(slot_0_152_0.home.cloud_like.name) == "function" then
			slot_0_152_0.home.cloud_like:name(var_272_1 and var_272_0.liked and " ❤️ " or "  \f<heart>  ")
		end
	end)
	slot_0_156_1.update_info_panel()
end

function slot_0_156_1.selected_preset()
	local var_274_0 = slot_0_78_0.cloud_presets or {}

	if #var_274_0 == 0 then
		return nil
	end

	local var_274_1 = 1

	if slot_0_152_0.home.cloud_list and type(slot_0_152_0.home.cloud_list.get) == "function" then
		local var_274_2, var_274_3 = pcall(function()
			return slot_0_152_0.home.cloud_list:get()
		end)

		if var_274_2 and type(var_274_3) == "number" and var_274_0[var_274_3] then
			var_274_1 = var_274_3
		end
	end

	return var_274_0[var_274_1]
end

function slot_0_156_1.apply_view()
	local var_276_0 = slot_0_156_1.selected_preset()
	local var_276_1 = var_276_0 and var_276_0.id or nil
	local var_276_2 = slot_0_161_2(slot_0_78_0.cloud_presets_raw or {}, slot_0_159_3())

	slot_0_78_0.cloud_presets = slot_0_162_1(var_276_2, slot_0_160_3())

	slot_0_156_1.update_list(var_276_1)
end

function slot_0_156_1.update_list(arg_277_0)
	local var_277_0 = slot_0_152_0.home.cloud_list

	if not var_277_0 or type(var_277_0.update) ~= "function" then
		return
	end

	local var_277_1 = slot_0_78_0.cloud_presets or {}
	local var_277_2 = {}

	if slot_0_78_0.cloud_fetch_pending then
		var_277_2 = {
			slot_0_78_0.cloud_list_loading_label
		}
	else
		for iter_277_0 = 1, #var_277_1 do
			local var_277_3 = var_277_1[iter_277_0]
			local var_277_4 = tostring(var_277_3.name or "?")
			local var_277_5 = tostring(var_277_3.author or "?")
			local var_277_6 = tostring(var_277_3.modified or "—")
			local var_277_7 = tonumber(var_277_3.loads) or 0
			local var_277_8 = tonumber(var_277_3.likes) or 0

			var_277_2[iter_277_0] = string.format(" %s  \x01\a{Small Text}·\r  %s  \x01\a{Small Text}·\r  %s  \x01\a{Small Text}·\r  %d loads  \x01\a{Small Text}·\r  %d likes", var_277_5, var_277_4, var_277_6, var_277_7, var_277_8)
		end

		if #var_277_2 == 0 then
			var_277_2 = {
				slot_0_78_0.cloud_list_empty_label
			}
		end
	end

	local var_277_9 = arg_277_0 ~= nil and tostring(arg_277_0 or "") or ""

	pcall(function()
		var_277_0:update(var_277_2)
	end)

	if type(var_277_0.set) == "function" and not slot_0_78_0.cloud_fetch_pending then
		local var_277_10 = 1

		if var_277_9 ~= "" then
			for iter_277_1 = 1, #var_277_1 do
				if tostring(var_277_1[iter_277_1].id or "") == var_277_9 then
					var_277_10 = iter_277_1

					break
				end
			end
		end

		pcall(function()
			var_277_0:set(var_277_10)
		end)
	end

	slot_0_156_1.sync_actions()
end

function slot_0_156_1.track_load(arg_280_0)
	arg_280_0 = tostring(arg_280_0 or "")

	if arg_280_0 == "" then
		return
	end

	slot_0_90_0.post("/v1/cloud/load", {
		id = arg_280_0
	}, function(arg_281_0, arg_281_1, arg_281_2)
		if not arg_281_0 or type(arg_281_1) ~= "table" or arg_281_1.ok ~= true then
			return
		end

		local var_281_0 = tonumber(arg_281_1.loads)

		if not var_281_0 then
			return
		end

		local function var_281_1(arg_282_0)
			if type(arg_282_0) ~= "table" then
				return
			end

			for iter_282_0 = 1, #arg_282_0 do
				if tostring(arg_282_0[iter_282_0].id or "") == arg_280_0 then
					arg_282_0[iter_282_0].loads = var_281_0
				end
			end
		end

		var_281_1(slot_0_78_0.cloud_presets_raw)
		var_281_1(slot_0_78_0.cloud_presets)
		slot_0_156_1.update_info_panel()
	end)
end

function slot_0_156_1.fetch_list()
	if slot_0_78_0.api_ping_ok ~= true or not slot_0_90_0.is_configured() then
		return
	end

	slot_0_78_0.cloud_fetch_pending = true

	slot_0_156_1.update_list()
	slot_0_90_0.post("/v1/cloud/list", {}, function(arg_284_0, arg_284_1, arg_284_2)
		slot_0_78_0.cloud_fetch_pending = false

		if arg_284_0 and type(arg_284_1) == "table" and arg_284_1.ok == true and type(arg_284_1.presets) == "table" then
			slot_0_78_0.cloud_presets_raw = arg_284_1.presets
		else
			slot_0_78_0.cloud_presets_raw = {}
		end

		slot_0_156_1.apply_view()
	end)
end

function slot_0_156_1.refresh_gate()
	local var_285_0 = slot_0_152_0.home.cloud_gate

	if not var_285_0 or type(var_285_0.set) ~= "function" then
		return
	end

	local var_285_1 = slot_0_78_0.api_ping_ok == true and slot_0_90_0.is_configured()

	pcall(function()
		var_285_0:set(var_285_1)
	end)

	if var_285_1 then
		if not slot_0_78_0.cloud_was_ok then
			slot_0_78_0.cloud_was_ok = true

			slot_0_156_1.fetch_list()
		end
	else
		slot_0_78_0.cloud_was_ok = false
		slot_0_78_0.cloud_fetch_pending = false
		slot_0_78_0.cloud_presets_raw = {}
		slot_0_78_0.cloud_presets = {}

		slot_0_156_1.update_list()
	end
end

if slot_0_141_0 then
	slot_0_152_0.home.home_banner = slot_0_109_0.home.logo:texture(slot_0_141_0, slot_0_142_0 or vector(slot_0_138_0, slot_0_139_0))
end

function slot_0_59_0()
	local var_287_0 = slot_0_38_0(slot_0_47_0())
	local var_287_1 = slot_0_152_0.home and slot_0_152_0.home.links_live
	local var_287_2 = slot_0_152_0.home and slot_0_152_0.home.links_alpha

	if var_287_1 then
		local var_287_3 = var_287_0 == "live"

		if type(var_287_1.name) == "function" then
			var_287_1:name(slot_0_72_0("live", var_287_3))
		end

		if type(var_287_1.disabled) == "function" then
			var_287_1:disabled(var_287_3)
		end
	end

	if var_287_2 then
		local var_287_4 = var_287_0 == "alpha"

		if type(var_287_2.name) == "function" then
			var_287_2:name(slot_0_72_0("alpha", var_287_4))
		end

		if type(var_287_2.disabled) == "function" then
			var_287_2:disabled(var_287_4)
		end
	end
end

function slot_0_60_0()
	local var_288_0 = slot_0_152_0.home and slot_0_152_0.home.home_banner
	local var_288_1 = slot_0_152_0.home and slot_0_152_0.home.settings_label and slot_0_152_0.home.settings_label.hide_banner

	if not var_288_0 or type(var_288_0.visibility) ~= "function" then
		return
	end

	local var_288_2 = var_288_1 and type(var_288_1.get) == "function" and var_288_1:get() == true

	pcall(function()
		var_288_0:visibility(not var_288_2)
	end)
end

if slot_0_152_0.home.settings_label and slot_0_152_0.home.settings_label.hide_banner then
	slot_0_152_0.home.settings_label.hide_banner:set_callback(function()
		slot_0_60_0()
	end)
end

slot_0_59_0()
slot_0_60_0()

function slot_0_91_0()
	local var_291_0 = slot_0_152_0.home.server_status

	if not var_291_0 or type(var_291_0.name) ~= "function" then
		local var_291_1 = slot_0_152_0.home.stats_server_ok

		if var_291_1 and type(var_291_1.set) == "function" then
			local var_291_2 = slot_0_90_0.is_configured() and slot_0_78_0.api_ping_ok == true

			pcall(function()
				var_291_1:set(var_291_2)
			end)

			if var_291_2 and slot_0_82_0 then
				pcall(slot_0_82_0)
			end
		end

		slot_0_78_0.cloud_ui.refresh_gate()

		return
	end

	if slot_0_78_0.api_ping_pending then
		var_291_0:name(" \x01\a{Small Text}\f<spinner>\r \t—\n\a{Small Text}status")
	elseif not slot_0_90_0.is_configured() then
		var_291_0:name(" \x01\f<xmark>\r \aD35050FFFail\n\a{Small Text}status")
	elseif slot_0_78_0.api_ping_ok == nil then
		var_291_0:name(" \x01\a{Small Text}\f<spinner>\r \t—\n\a{Small Text}status")
	elseif slot_0_78_0.api_ping_ok == true then
		var_291_0:name(" \x01\f<check>\r \aB6DE47FFConnected\n\a{Small Text}status")
	else
		var_291_0:name(" \x01\f<xmark>\r \aD35050FFFail\n\a{Small Text}status")
	end

	local var_291_3 = slot_0_152_0.home.stats_server_ok

	if var_291_3 and type(var_291_3.set) == "function" then
		local var_291_4 = slot_0_90_0.is_configured() and slot_0_78_0.api_ping_ok == true

		pcall(function()
			var_291_3:set(var_291_4)
		end)

		if var_291_4 and slot_0_82_0 then
			pcall(slot_0_82_0)
		end
	end

	slot_0_78_0.cloud_ui.refresh_gate()

	if slot_0_87_0 then
		slot_0_87_0(false)
	end
end

slot_0_155_0 = 48
slot_0_156_0 = 20

function slot_0_157_0(arg_294_0)
	local var_294_0 = tostring(arg_294_0 or ""):lower():gsub("%s+", "")

	if #var_294_0 == 64 and var_294_0:match("^[%da-f]+$") then
		return var_294_0
	end

	return nil
end

function slot_0_158_0(arg_295_0, arg_295_1, arg_295_2, arg_295_3)
	local var_295_0 = slot_0_152_0.home.presence_online and slot_0_152_0.home.presence_online.roster
	local var_295_1 = tonumber(arg_295_1)
	local var_295_2 = {}
	local var_295_3 = {}
	local var_295_4 = {}
	local var_295_5 = arg_295_2 == "server"

	if type(arg_295_0) == "table" then
		for iter_295_0 = 1, #arg_295_0 do
			local var_295_6 = arg_295_0[iter_295_0]

			if type(var_295_6) == "table" then
				local var_295_7 = tostring(var_295_6.name or "?")
				local var_295_8 = tostring(var_295_6.build or "")

				if var_295_8 == "" then
					var_295_8 = "—"
				end

				var_295_2[#var_295_2 + 1] = string.format(" %s  \x01\a{Small Text}·\r  %s", var_295_7, var_295_8)

				local var_295_9 = tostring(var_295_6.build or "live"):lower()
				local var_295_10 = slot_0_157_0(var_295_6.peer_tag)

				if var_295_10 then
					var_295_3[var_295_10] = var_295_9
				end

				local var_295_11 = slot_0_6_0(var_295_6.steamid64)

				if #var_295_11 == 17 then
					var_295_4[var_295_11] = var_295_9
				end
			end
		end
	end

	slot_0_78_0.presence_peer_roster = var_295_3
	slot_0_78_0.presence_sid_roster = var_295_4

	if slot_0_78_0.lobby_badge_resync then
		pcall(slot_0_78_0.lobby_badge_resync)
	end

	if var_295_1 == nil or var_295_1 < 0 then
		var_295_1 = #var_295_2
	end

	if #var_295_2 == 0 then
		var_295_2[1] = var_295_5 and " \x01\a{Small Text}nobody on this server" or " \x01\a{Small Text}nobody online"
	end

	pcall(function()
		if var_295_0 and type(var_295_0.update) == "function" then
			var_295_0:update(var_295_2)
		end
	end)
	pcall(function()
		if var_295_0 and type(var_295_0.set) == "function" then
			var_295_0:set(1)
		end
	end)

	local var_295_12

	if var_295_5 then
		local var_295_13 = tonumber(arg_295_3)

		var_295_12 = var_295_1 == 1 and "\a{Small Text}1 on this server" or string.format("\a{Small Text}%d on this server", var_295_1)

		if var_295_13 and var_295_1 < var_295_13 then
			var_295_12 = var_295_12 .. string.format("\a{Small Text} · %d on other servers", var_295_13 - var_295_1)
		end
	else
		var_295_12 = var_295_1 == 0 and "\a{Small Text}0 online" or var_295_1 == 1 and "\a{Small Text}1 user online" or string.format("\a{Small Text}%d users online", var_295_1)
	end

	pcall(function()
		if slot_0_152_0.home.presence_online and type(slot_0_152_0.home.presence_online.name) == "function" then
			slot_0_152_0.home.presence_online:name("\x01\a{Small Text}\f<users>\r \tOnline\n" .. var_295_12)
		end
	end)
end

function slot_0_87_0(arg_299_0)
	local var_299_0 = slot_0_152_0.home.presence_online and slot_0_152_0.home.presence_online.roster

	if not var_299_0 or type(var_299_0.update) ~= "function" then
		return
	end

	if not slot_0_90_0.is_configured() or slot_0_78_0.api_ping_ok ~= true then
		pcall(function()
			var_299_0:update({
				" \x01\a{Small Text}connect (status) to load"
			})
		end)
		pcall(function()
			if slot_0_152_0.home.presence_online and type(slot_0_152_0.home.presence_online.name) == "function" then
				slot_0_152_0.home.presence_online:name("\x01\a{Small Text}\f<users>\r \tOnline\n\a{Small Text}—")
			end
		end)

		return
	end

	local var_299_1 = globals.realtime or 0
	local var_299_2 = slot_0_155_0

	pcall(function()
		if slot_0_152_0.vars.lobby_badge and slot_0_152_0.vars.lobby_badge:get() == true then
			var_299_2 = slot_0_156_0
		end
	end)

	if not arg_299_0 and var_299_2 > var_299_1 - (slot_0_78_0.presence_last_fetch or 0) then
		return
	end

	if slot_0_78_0.presence_inflight then
		return
	end

	slot_0_78_0.presence_inflight = true
	slot_0_78_0.presence_last_fetch = var_299_1

	local var_299_3 = "/v1/presence"
	local var_299_4 = slot_0_16_0()

	if var_299_4 then
		var_299_3 = var_299_3 .. "?server=" .. var_299_4
	end

	slot_0_90_0.get(var_299_3, function(arg_303_0, arg_303_1, arg_303_2)
		slot_0_78_0.presence_inflight = false

		if arg_303_0 and type(arg_303_1) == "table" and arg_303_1.ok == true and type(arg_303_1.users) == "table" then
			slot_0_158_0(arg_303_1.users, arg_303_1.count, arg_303_1.scope, arg_303_1.total)
		else
			pcall(function()
				local var_304_0 = slot_0_152_0.home.presence_online and slot_0_152_0.home.presence_online.roster

				if var_304_0 and type(var_304_0.update) == "function" then
					var_304_0:update({
						" \x01\a{Small Text}roster unavailable"
					})
				end
			end)
		end
	end)
end

function slot_0_88_0()
	local var_305_0 = slot_0_150_0

	if not var_305_0 or type(var_305_0.name) ~= "function" then
		return
	end

	if not slot_0_90_0.is_configured() then
		var_305_0:name("\x01\a{Small Text}\f<circle-info>\r \tConnect server first")

		return
	end

	slot_0_90_0.get("/v1/discord/status", function(arg_306_0, arg_306_1, arg_306_2)
		if not arg_306_0 or type(arg_306_1) ~= "table" or arg_306_1.ok ~= true then
			return
		end

		if arg_306_1.linked == true then
			local var_306_0 = tostring(arg_306_1.discord_username or "")

			if var_306_0 ~= "" then
				var_305_0:name("\x01\aB6DE47FF\f<circle-check>\r \tLinked: " .. var_306_0)
			else
				var_305_0:name("\x01\aB6DE47FF\f<circle-check>\r \tDiscord linked")
			end
		else
			var_305_0:name("\x01\a{Small Text}\f<circle-info>\r \tUse /auth code in Discord")
		end
	end)
end

slot_0_152_0.home.cfg_new_state:visibility(false)
slot_0_152_0.vars.aspect.r_5_4:set_callback(function()
	slot_0_152_0.vars.aspect.ratio:set(125)
end)
slot_0_152_0.vars.aspect.r_4_3:set_callback(function()
	slot_0_152_0.vars.aspect.ratio:set(133)
end)
slot_0_152_0.vars.aspect.r_3_2:set_callback(function()
	slot_0_152_0.vars.aspect.ratio:set(150)
end)
slot_0_152_0.vars.aspect.r_16_10:set_callback(function()
	slot_0_152_0.vars.aspect.ratio:set(160)
end)
slot_0_152_0.vars.aspect.r_16_9:set_callback(function()
	slot_0_152_0.vars.aspect.ratio:set(178)
end)
slot_0_152_0.vars.aspect.ratio:set_callback(function(arg_312_0)
	local var_312_0 = tonumber(arg_312_0.value) or 150

	if var_312_0 > 0 and var_312_0 < 10 then
		var_312_0 = math.floor(var_312_0 * 100 + 0.5)
	else
		var_312_0 = math.floor(var_312_0 + 0.5)
	end

	local var_312_1 = math.max(80, math.min(240, var_312_0))

	if var_312_1 ~= arg_312_0.value then
		arg_312_0:set(var_312_1)
	end

	if slot_0_78_0.ap_render_wake_cvars then
		pcall(slot_0_78_0.ap_render_wake_cvars)
	end
end, true)
slot_0_152_0.home.cloud_gate:visibility(false)
slot_0_152_0.home.stats_server_ok:visibility(false)
;(function()
	local var_313_0 = setmetatable({}, {
		__mode = "k"
	})
	local var_313_1 = setmetatable({}, {
		__mode = "k"
	})
	local var_313_2 = {}
	local var_313_3 = 4
	local var_313_4 = 48
	local var_313_5 = {}

	local function var_313_6()
		local var_314_0
		local var_314_1

		pcall(function()
			var_314_0 = ui.get_style("Small Text")
			var_314_1 = ui.get_style("Link Active")
		end)

		if var_314_0 then
			var_313_5.inactive = var_314_0
		end

		if var_314_1 then
			var_313_5.active = var_314_1
		end

		return var_313_5.inactive or var_314_0, var_313_5.active or var_314_1
	end

	local function var_313_7(arg_316_0)
		local var_316_0, var_316_1 = var_313_6()

		if not var_316_1 or type(var_316_1.to_hex) ~= "function" then
			return false
		end

		local var_316_2 = var_316_1:to_hex()

		if not arg_316_0 and var_316_2 == var_313_5.last_active_hex then
			return false
		end

		var_313_5.last_active_hex = var_316_2

		for iter_316_0, iter_316_1 in pairs(var_313_0) do
			if iter_316_1 then
				iter_316_1.applied_name = nil
			end
		end

		menu_refresh_accents()

		return true
	end

	local function var_313_8(arg_317_0, arg_317_1)
		arg_317_0 = slot_0_93_0(arg_317_0)
		arg_317_1 = math.max(0, math.min(1, tonumber(arg_317_1) or 0))

		local var_317_0, var_317_1 = var_313_6()
		local var_317_2

		if var_317_0 and var_317_1 and type(var_317_0.lerp) == "function" then
			local var_317_3, var_317_4 = pcall(function()
				return var_317_0:lerp(var_317_1, arg_317_1)
			end)

			if var_317_3 and var_317_4 and type(var_317_4.to_hex) == "function" then
				var_317_2 = "\a" .. var_317_4:to_hex()
			end
		end

		if not var_317_2 then
			return slot_0_94_0(arg_317_0, arg_317_1 >= 0.5)
		end

		if arg_317_0:find("\f<", 1, true) and arg_317_0:sub(1, 1) ~= "\x01" then
			arg_317_0 = "\x01" .. arg_317_0
		end

		if arg_317_0:sub(1, 1) == "\x01" then
			return "\x01" .. var_317_2 .. arg_317_0:sub(2)
		end

		return var_317_2 .. arg_317_0
	end

	local function var_313_9(arg_319_0)
		arg_319_0 = math.max(0, math.min(1, tonumber(arg_319_0) or 0))

		local var_319_0 = var_313_4

		if var_319_0 <= 1 then
			return arg_319_0
		end

		return math.floor(arg_319_0 * var_319_0 + 0.5) / var_319_0
	end

	local function var_313_10(arg_320_0, arg_320_1, arg_320_2)
		if not arg_320_0 or not arg_320_1 or type(arg_320_0.name) ~= "function" then
			return
		end

		local var_320_0 = var_313_8(arg_320_1.base, arg_320_2)

		if arg_320_1.applied_name == var_320_0 then
			return
		end

		arg_320_1.applied_name = var_320_0

		pcall(function()
			arg_320_0:name(var_320_0)
		end)
	end

	local function var_313_11(arg_322_0)
		arg_322_0 = math.max(0, math.min(1, tonumber(arg_322_0) or 0))

		return 1 - (1 - arg_322_0)^3
	end

	local function var_313_12(arg_323_0)
		local var_323_0 = slot_0_92_0[arg_323_0]

		if var_323_0 and var_323_0 ~= "" then
			return slot_0_93_0(var_323_0)
		end

		if not arg_323_0 or type(arg_323_0.name) ~= "function" then
			return ""
		end

		local var_323_1, var_323_2 = pcall(function()
			return arg_323_0:name()
		end)

		return var_323_1 and slot_0_93_0(var_323_2) or ""
	end

	local function var_313_13(arg_325_0)
		for iter_325_0 = 1, #var_313_2 do
			if var_313_2[iter_325_0] == arg_325_0 then
				return
			end
		end

		var_313_2[#var_313_2 + 1] = arg_325_0
	end

	local function var_313_14(arg_326_0, arg_326_1)
		if not arg_326_0 or type(arg_326_0.name) ~= "function" then
			return
		end

		local var_326_0 = var_313_12(arg_326_0)

		if var_326_0 == "" then
			return
		end

		local var_326_1 = arg_326_1 == true and 1 or 0
		local var_326_2 = var_313_0[arg_326_0]

		if not var_326_2 then
			var_326_2 = {
				base = var_326_0,
				progress = var_326_1,
				target = var_326_1
			}
			var_313_0[arg_326_0] = var_326_2

			var_313_10(arg_326_0, var_326_2, var_313_11(var_326_1))

			return
		end

		var_326_2.base = var_326_0

		if var_326_2.target ~= var_326_1 then
			var_326_2.target = var_326_1
			var_326_2.applied_name = nil

			var_313_13(arg_326_0)
		end
	end

	local function var_313_15()
		local var_327_0 = 0

		pcall(function()
			var_327_0 = ui.get_alpha() or 0
		end)

		if var_327_0 > 0.001 then
			var_313_7(false)
		end

		if var_327_0 <= 0.001 and #var_313_2 == 0 then
			return
		end

		local var_327_1 = globals.frametime or 0.016
		local var_327_2 = var_313_3

		for iter_327_0 = #var_313_2, 1, -1 do
			local var_327_3 = var_313_2[iter_327_0]
			local var_327_4 = var_327_3 and var_313_0[var_327_3]

			if not var_327_4 or type(var_327_3.name) ~= "function" then
				table.remove(var_313_2, iter_327_0)
			else
				if var_327_4.progress < var_327_4.target then
					var_327_4.progress = math.min(var_327_4.target, var_327_4.progress + var_327_1 * var_327_2)
				elseif var_327_4.progress > var_327_4.target then
					var_327_4.progress = math.max(var_327_4.target, var_327_4.progress - var_327_1 * var_327_2)
				end

				local var_327_5 = var_313_11(var_327_4.progress)

				if math.abs(var_327_4.progress - var_327_4.target) < 0.001 then
					var_327_4.progress = var_327_4.target
					var_327_5 = var_313_11(var_327_4.progress)

					var_313_10(var_327_3, var_327_4, var_327_5)
					table.remove(var_313_2, iter_327_0)
				else
					var_313_10(var_327_3, var_327_4, var_313_9(var_327_5))
				end
			end
		end
	end

	local function var_313_16(arg_329_0, arg_329_1)
		var_313_14(arg_329_0, arg_329_1 == true)
	end

	local function var_313_17(arg_330_0, arg_330_1)
		if not arg_330_0 or type(arg_330_0.name) ~= "function" then
			return
		end

		if arg_330_1 and arg_330_1 ~= "" then
			slot_0_92_0[arg_330_0] = arg_330_1
		end

		local var_330_0 = slot_0_92_0[arg_330_0] or arg_330_1

		if not var_330_0 or var_330_0 == "" then
			local var_330_1, var_330_2 = pcall(function()
				return arg_330_0:name()
			end)

			var_330_0 = var_330_1 and var_330_2 or ""
		end

		if var_330_0 == "" then
			return
		end

		if var_313_1[arg_330_0] then
			local var_330_3 = var_313_0[arg_330_0]

			if var_330_3 then
				var_313_10(arg_330_0, var_330_3, var_313_11(var_330_3.progress))
			elseif type(arg_330_0.get) == "function" then
				local var_330_4 = false

				pcall(function()
					var_330_4 = arg_330_0:get() == true
				end)
				var_313_14(arg_330_0, var_330_4)
			end

			return
		end

		arg_330_0:name(slot_0_94_0(var_330_0, true))
	end

	local function var_313_18()
		for iter_333_0, iter_333_1 in pairs(slot_0_92_0) do
			if var_313_1[iter_333_0] then
				local var_333_0 = var_313_0[iter_333_0]

				if var_333_0 then
					pcall(function()
						var_313_10(iter_333_0, var_333_0, var_313_11(var_333_0.progress))
					end)
				elseif type(iter_333_0.get) == "function" then
					local var_333_1 = false

					pcall(function()
						var_333_1 = iter_333_0:get() == true
					end)
					var_313_14(iter_333_0, var_333_1)
				end
			else
				var_313_17(iter_333_0, iter_333_1)
			end
		end
	end

	local function var_313_19(arg_336_0)
		if not arg_336_0 or slot_0_92_0[arg_336_0] then
			return
		end

		local var_336_0, var_336_1 = pcall(function()
			return arg_336_0:name()
		end)

		if var_336_0 and var_336_1 and var_336_1 ~= "" then
			slot_0_92_0[arg_336_0] = slot_0_93_0(var_336_1)
		end
	end

	local function var_313_20(arg_338_0)
		if not arg_338_0 or type(arg_338_0.set_callback) ~= "function" or type(arg_338_0.get) ~= "function" then
			return
		end

		var_313_19(arg_338_0)

		var_313_1[arg_338_0] = true

		arg_338_0:set_callback(function()
			var_313_16(arg_338_0, arg_338_0:get() == true)

			if slot_0_152_0.vars and arg_338_0 == slot_0_152_0.vars.aspect and slot_0_78_0.ap_render_wake_cvars then
				pcall(slot_0_78_0.ap_render_wake_cvars)
			end
		end)
	end

	local function var_313_21(arg_340_0, arg_340_1)
		if not arg_340_0 or type(arg_340_0.get) ~= "function" then
			return false
		end

		if arg_340_1 and #arg_340_1 > 0 then
			for iter_340_0 = 1, #arg_340_1 do
				local var_340_0, var_340_1 = pcall(function()
					return arg_340_0:get(arg_340_1[iter_340_0])
				end)

				if var_340_0 and var_340_1 == true then
					return true
				end
			end

			return false
		end

		local var_340_2, var_340_3 = pcall(function()
			return arg_340_0:get()
		end)

		if not var_340_2 then
			return false
		end

		if type(var_340_3) == "table" then
			for iter_340_1 = 1, #var_340_3 do
				if var_340_3[iter_340_1] then
					return true
				end
			end

			for iter_340_2, iter_340_3 in pairs(var_340_3) do
				if iter_340_3 == true then
					return true
				end
			end

			return false
		end

		if type(var_340_3) == "boolean" then
			return var_340_3
		end

		if type(var_340_3) == "number" then
			return var_340_3 > 0
		end

		if type(var_340_3) == "string" then
			return var_340_3 ~= ""
		end

		return false
	end

	local function var_313_22(arg_343_0, arg_343_1)
		if not arg_343_0 or type(arg_343_0.set_callback) ~= "function" then
			return
		end

		var_313_19(arg_343_0)

		var_313_1[arg_343_0] = true

		arg_343_0:set_callback(function()
			var_313_16(arg_343_0, var_313_21(arg_343_0, arg_343_1))
		end)
	end

	local function var_313_23(arg_345_0, arg_345_1)
		if not arg_345_0 or not arg_345_1 then
			return false
		end

		for iter_345_0 = 1, #arg_345_1 do
			if bind_listed_check(arg_345_0, arg_345_1[iter_345_0]) then
				return true
			end
		end

		return false
	end

	local function var_313_24(arg_346_0, arg_346_1)
		if not arg_346_0 or type(arg_346_0.set_callback) ~= "function" then
			return
		end

		var_313_19(arg_346_0)

		var_313_1[arg_346_0] = true

		arg_346_0:set_callback(function()
			var_313_16(arg_346_0, var_313_23(arg_346_0, arg_346_1))
		end)
	end

	_G.update_switch_name_color = var_313_16
	_G.setup_menu_gear_accent = var_313_17
	_G.menu_refresh_accents = var_313_18
	_G.setup_dynamic_switch_color = var_313_20
	_G.setup_dynamic_selectable_color = var_313_22
	_G.setup_dynamic_listable_color = var_313_24
	slot_0_78_0.menu_accent_anim_tick = var_313_15
end)()

slot_0_152_0.home.main_selector, slot_0_152_0.home.main_selector_int = slot_0_108_0(slot_0_109_0.home.selector, {
	{
		"\x01\f<user>\r\tProfile",
		{
			slot_0_109_0.home.links,
			slot_0_109_0.home.profile_stats,
			slot_0_109_0.home.discord
		}
	},
	{
		"\x01\f<boxes-stacked>\r\tLoadouts",
		{
			slot_0_109_0.home.configs,
			slot_0_109_0.home.configsnew,
			slot_0_109_0.home.cloud,
			slot_0_109_0.home.info1
		}
	}
})
slot_0_152_0.home.cloud_filter = slot_0_109_0.home.selector:combo("\x01\f<bars-filter>\r\tCloud filter", slot_0_78_0.cloud_filter_options, 0)
slot_0_152_0.home.cloud_sort = slot_0_109_0.home.selector:combo("\x01\f<bars-sort>\r\tCloud sort", slot_0_78_0.cloud_sort_options, 0)
slot_0_159_2 = {
	slot_0_152_0.home.main_selector_int,
	2
}
slot_0_160_2 = {
	slot_0_152_0.home.cloud_gate,
	true
}

slot_0_152_0.home.cloud_filter:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_sort:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_author_label:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_author_btn:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_modified_label:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_modified_btn:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_build_label:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_build_btn:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_relevance_label:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_relevance_btn:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_loads_label:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_loads_btn:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_likes_label:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_info_likes_btn:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_header:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_refresh:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_list:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_load:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_load_aa:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_upload:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_save:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_like:depend(slot_0_159_2, slot_0_160_2)
slot_0_152_0.home.cloud_delete:depend(slot_0_159_2, slot_0_160_2)

slot_0_159_1 = {
	slot_0_152_0.home.main_selector_int,
	1
}
slot_0_160_1 = {
	slot_0_152_0.home.cloud_gate,
	true
}
slot_0_161_1 = {
	slot_0_152_0.home.stats_server_ok,
	true
}

slot_0_152_0.home.stats_playtime_label:depend(slot_0_159_1, slot_0_160_1, slot_0_161_1)
slot_0_152_0.home.stats_playtime_btn:depend(slot_0_159_1, slot_0_160_1, slot_0_161_1)
slot_0_152_0.home.stats_kills_label:depend(slot_0_159_1, slot_0_160_1, slot_0_161_1)
slot_0_152_0.home.stats_kills_btn:depend(slot_0_159_1, slot_0_160_1, slot_0_161_1)
slot_0_152_0.home.stats_evaded_label:depend(slot_0_159_1, slot_0_160_1, slot_0_161_1)
slot_0_152_0.home.stats_evaded_btn:depend(slot_0_159_1, slot_0_160_1, slot_0_161_1)
slot_0_152_0.home.stats_other:depend(slot_0_159_1, slot_0_160_1, slot_0_161_1)
slot_0_152_0.home.discord_status:depend(slot_0_159_1)
slot_0_152_0.home.discord_heading:depend(slot_0_159_1)
pcall(function()
	if slot_0_109_0.home.cloud and type(slot_0_109_0.home.cloud.depend) == "function" then
		slot_0_109_0.home.cloud:depend({
			slot_0_152_0.home.main_selector_int,
			2
		}, {
			slot_0_152_0.home.cloud_gate,
			true
		})
	end
end)

slot_0_152_0.vars.main_selector, slot_0_152_0.vars.main_selector_int = slot_0_108_0(slot_0_109_0.vars.selector, {
	{
		"\x01\f<crosshairs>\r\tRagebot",
		{
			slot_0_109_0.vars.ragebot
		}
	},
	{
		"\x01\f<eye>\r\tVisualization",
		{
			slot_0_109_0.vars.visuals,
			slot_0_109_0.vars.visuals2,
			slot_0_109_0.vars.overlay
		}
	},
	{
		"\x01\f<sliders>\r\tMiscellaneous",
		{
			slot_0_109_0.vars.misc
		}
	}
})
slot_0_152_0.vars.hud_style = slot_0_109_0.vars.style:label("\x01\f<pen-swirl>\r\tStyle", nil, function(arg_349_0)
	return {
		dpi_scale = arg_349_0:switch("\x01\f<up-right-and-down-left-from-center>\r\tDPI Scale", false),
		style_target = arg_349_0:list("\nstyle_target", {
			slot_0_94_0("\x01\f<layer-group>\r\tHud Screen", true),
			slot_0_94_0("\x01\f<border-bottom>\r\tBottom Watermark", true),
			slot_0_94_0("\x01\f<crosshairs>\r\tCrosshair Indicators", true)
		}),
		widget_style = arg_349_0:list("\n", {
			slot_0_94_0("\x01\f<grip-lines>\r\tLined", true),
			slot_0_94_0("\x01\f<circle-half-stroke>\r\tMinimalistic", true)
		}, nil, false),
		blur = arg_349_0:switch("\x01\f<droplet>\r\tBlur", true, "Background blur behind HUD widgets. Turn off for better FPS on weak GPUs."),
		minimal_outline = arg_349_0:switch("\x01\f<square-dashed>\r\tWidget outline", true),
		stripe_mode = arg_349_0:combo("\x01\f<palette>\r\tHUD stripe", {
			"Default",
			"Accent",
			"Custom"
		}, 0),
		stripe_custom = arg_349_0:color_picker("\x01\f<fill>\r\tStripe color", color(255, 255, 255, 255)),
		bw_unified = arg_349_0:switch("\x01\f<link>\r\tUnified color", false, "One color for text and glow"),
		bw_color = arg_349_0:color_picker("\x01\f<fill>\r\tColor", color(255, 255, 255, 255)),
		bw_text = arg_349_0:color_picker("\x01\f<font>\r\tText color", color(255, 255, 255, 255)),
		bw_glow = arg_349_0:color_picker("\x01\f<sparkles>\r\tGlow color", color(255, 255, 255, 255)),
		chi_unified = arg_349_0:switch("\x01\f<link>\r\tUnified color", false, "One color for text and glow"),
		chi_color = arg_349_0:color_picker("\x01\f<fill>\r\tColor", color(255, 255, 255, 255)),
		chi_text = arg_349_0:color_picker("\x01\f<font>\r\tText color", color(255, 255, 255, 255)),
		chi_glow = arg_349_0:color_picker("\x01\f<sparkles>\r\tGlow color", color(255, 255, 255, 255))
	}
end)
slot_0_159_0 = {
	slot_0_152_0.vars.main_selector_int,
	1
}
slot_0_160_0 = {
	slot_0_152_0.vars.main_selector_int,
	2
}
slot_0_161_0 = {
	slot_0_152_0.vars.main_selector_int,
	3
}
slot_0_162_0 = {
	slot_0_152_0.vars.aspect,
	true
}
slot_0_163_0 = {
	slot_0_152_0.vars.weather_manip,
	true
}
slot_0_164_0 = {
	slot_0_152_0.vars.hitmarker,
	true
}
slot_0_165_0 = {
	slot_0_152_0.vars.hitmarker.placement,
	1
}
slot_0_166_0 = {
	slot_0_152_0.vars.hitmarker.placement,
	2
}

slot_0_152_0.vars.ping_spike_unlock:depend(slot_0_159_0)
slot_0_152_0.vars.ping_spike_unlock.ovr:depend(slot_0_159_0, {
	slot_0_152_0.vars.ping_spike_unlock,
	true
})
slot_0_152_0.vars.tick_lead:depend(slot_0_159_0)
slot_0_152_0.vars.tick_lead.tier:depend(slot_0_159_0, {
	slot_0_152_0.vars.tick_lead,
	true
})

slot_0_167_0 = {
	slot_0_152_0.vars.hc_manip,
	true
}
slot_0_168_0 = {
	slot_0_152_0.vars.adaptive_peek,
	true
}

slot_0_152_0.vars.hc_manip:depend(slot_0_159_0)
slot_0_152_0.vars.hc_manip.weapon:depend(slot_0_159_0, slot_0_167_0)
slot_0_152_0.vars.adaptive_peek:depend(slot_0_159_0)
slot_0_152_0.vars.adaptive_peek.weapons:depend(slot_0_159_0, slot_0_168_0)
slot_0_152_0.vars.adaptive_peek.opts:depend(slot_0_159_0, slot_0_168_0)
slot_0_152_0.vars.adaptive_peek.hitboxes:depend(slot_0_159_0, slot_0_168_0)
slot_0_152_0.vars.adaptive_peek.min_dmg:depend(slot_0_159_0, slot_0_168_0)
slot_0_152_0.vars.adaptive_peek.peek_chance:depend(slot_0_159_0, slot_0_168_0)
slot_0_152_0.vars.adaptive_peek.max_enemies:depend(slot_0_159_0, slot_0_168_0)
slot_0_152_0.vars.adaptive_peek.max_distance:depend(slot_0_159_0, slot_0_168_0)
slot_0_152_0.vars.adaptive_peek.delay:depend(slot_0_159_0, slot_0_168_0)
slot_0_152_0.vars.adaptive_peek.simulation:depend(slot_0_159_0, slot_0_168_0)
slot_0_152_0.vars.adaptive_peek.visualization:depend(slot_0_159_0, slot_0_168_0)

slot_0_169_0 = {
	slot_0_152_0.vars.dormant_aim,
	true
}

slot_0_152_0.vars.dormant_aim:depend(slot_0_159_0)
slot_0_152_0.vars.dormant_aim.memory:depend(slot_0_159_0, slot_0_169_0)

slot_0_170_0 = {
	slot_0_152_0.vars.air_stop,
	true
}

slot_0_152_0.vars.air_stop:depend(slot_0_159_0)
slot_0_152_0.vars.air_stop.duck:depend(slot_0_159_0, slot_0_170_0)
slot_0_152_0.vars.air_stop.trigger:depend(slot_0_159_0, slot_0_170_0)

slot_0_171_0 = {
	slot_0_152_0.vars.auto_teleport,
	true
}

slot_0_152_0.vars.auto_teleport:depend(slot_0_159_0)
slot_0_152_0.vars.auto_teleport.wpns:depend(slot_0_159_0, slot_0_171_0)

slot_0_172_0 = {
	slot_0_152_0.vars.auto_hide_shots,
	true
}

slot_0_152_0.vars.auto_hide_shots:depend(slot_0_159_0)
slot_0_152_0.vars.auto_hide_shots.allow_rifles:depend(slot_0_159_0, slot_0_172_0)
slot_0_152_0.vars.auto_hide_shots.allow_deagle:depend(slot_0_159_0, slot_0_172_0)

slot_0_173_1 = slot_0_152_0.vars.hc_manip
slot_0_174_1 = slot_0_152_0.vars.hc_manip_profiles
slot_0_175_1 = slot_0_106_0()

for iter_0_9 = 1, #HC_WEAPON_GROUPS do
	slot_0_180_1 = HC_WEAPON_GROUPS[iter_0_9].key
	slot_0_181_1 = slot_0_174_1 and slot_0_174_1[slot_0_180_1]

	if slot_0_181_1 then
		slot_0_182_1 = slot_0_78_0.aa_state_slot_dep(slot_0_173_1.weapon, iter_0_9, slot_0_175_1)

		slot_0_181_1.enabled:depend(slot_0_159_0, slot_0_167_0, slot_0_182_1)
		slot_0_181_1.when:depend(slot_0_159_0, slot_0_167_0, slot_0_182_1, {
			slot_0_181_1.enabled,
			true
		})
		slot_0_181_1.chance:depend(slot_0_159_0, slot_0_167_0, slot_0_182_1, {
			slot_0_181_1.enabled,
			true
		})
		slot_0_181_1.miss_need:depend(slot_0_159_0, slot_0_167_0, slot_0_182_1, {
			slot_0_181_1.enabled,
			true
		}, {
			slot_0_181_1.when,
			function()
				local var_350_0, var_350_1 = pcall(function()
					return slot_0_181_1.when:get()
				end)

				if not var_350_0 or var_350_1 == nil then
					return false
				end

				if type(var_350_1) == "number" then
					return math.floor(var_350_1) == 3
				end

				return tostring(var_350_1) == "After misses"
			end
		})
		slot_0_181_1.hp_below:depend(slot_0_159_0, slot_0_167_0, slot_0_182_1, {
			slot_0_181_1.enabled,
			true
		}, {
			slot_0_181_1.when,
			function()
				local var_352_0, var_352_1 = pcall(function()
					return slot_0_181_1.when:get()
				end)

				if not var_352_0 or var_352_1 == nil then
					return false
				end

				if type(var_352_1) == "number" then
					return math.floor(var_352_1) == 4
				end

				return tostring(var_352_1) == "Low enemy HP"
			end
		})
	end
end

slot_0_173_0 = {
	slot_0_152_0.vars.vm_adjust,
	true
}
slot_0_174_0 = {
	slot_0_152_0.vars.crosshair_scope,
	true
}

slot_0_152_0.vars.vm_adjust:depend(slot_0_160_0)
slot_0_152_0.vars.vm_adjust.vm_reset:depend(slot_0_160_0, slot_0_173_0)
slot_0_152_0.vars.vm_adjust.vm_fov:depend(slot_0_160_0, slot_0_173_0)
slot_0_152_0.vars.vm_adjust.vm_x:depend(slot_0_160_0, slot_0_173_0)
slot_0_152_0.vars.vm_adjust.vm_y:depend(slot_0_160_0, slot_0_173_0)
slot_0_152_0.vars.vm_adjust.vm_z:depend(slot_0_160_0, slot_0_173_0)
slot_0_152_0.vars.crosshair_scope:depend(slot_0_160_0)
slot_0_152_0.vars.crosshair_scope.scope_color:depend(slot_0_160_0, slot_0_174_0)
slot_0_152_0.vars.crosshair_scope.scope_size:depend(slot_0_160_0, slot_0_174_0)
slot_0_152_0.vars.crosshair_scope.scope_gap:depend(slot_0_160_0, slot_0_174_0)
slot_0_152_0.vars.crosshair_scope.scope_t_style:depend(slot_0_160_0, slot_0_174_0)
slot_0_152_0.vars.crosshair_scope.scope_force_vm:depend(slot_0_160_0, slot_0_174_0)
slot_0_152_0.vars.hitmarker:depend(slot_0_160_0)
slot_0_152_0.vars.hitmarker.placement:depend(slot_0_160_0, slot_0_164_0)
slot_0_152_0.vars.hitmarker.crosshair_style:depend(slot_0_160_0, slot_0_164_0, slot_0_165_0)
slot_0_152_0.vars.hitmarker.world_style:depend(slot_0_160_0, slot_0_164_0, slot_0_166_0)
slot_0_152_0.vars.aspect.ratio:depend(slot_0_160_0, slot_0_162_0)
slot_0_152_0.vars.aspect.r_5_4:depend(slot_0_160_0, slot_0_162_0)
slot_0_152_0.vars.aspect.r_4_3:depend(slot_0_160_0, slot_0_162_0)
slot_0_152_0.vars.aspect.r_3_2:depend(slot_0_160_0, slot_0_162_0)
slot_0_152_0.vars.aspect.r_16_10:depend(slot_0_160_0, slot_0_162_0)
slot_0_152_0.vars.aspect.r_16_9:depend(slot_0_160_0, slot_0_162_0)
slot_0_152_0.vars.weather_manip:depend(slot_0_160_0)
slot_0_152_0.vars.weather_manip.style:depend(slot_0_160_0, slot_0_163_0)
slot_0_152_0.vars.weather_manip.radius:depend(slot_0_160_0, slot_0_163_0)
slot_0_152_0.vars.weather_manip.width:depend(slot_0_160_0, slot_0_163_0)
slot_0_152_0.vars.weather_manip.alpha:depend(slot_0_160_0, slot_0_163_0)
slot_0_152_0.vars.weather_manip.sound:depend(slot_0_160_0, slot_0_163_0)
slot_0_152_0.vars.weather_manip.volume:depend(slot_0_160_0, slot_0_163_0, {
	slot_0_152_0.vars.weather_manip.sound,
	true
})
slot_0_152_0.vars.logs.modes:depend({
	slot_0_152_0.vars.logs,
	true
}, slot_0_161_0)
slot_0_152_0.vars.logs.output:depend({
	slot_0_152_0.vars.logs,
	true
}, slot_0_161_0)
slot_0_152_0.vars.logs.log_counters:depend({
	slot_0_152_0.vars.logs,
	true
}, slot_0_161_0)
slot_0_152_0.vars.trashtalk_enable:depend(slot_0_161_0)
slot_0_152_0.vars.trashtalk_enable.mode:depend(slot_0_161_0, {
	slot_0_152_0.vars.trashtalk_enable,
	true
})
slot_0_152_0.vars.trashtalk_enable.conds:depend(slot_0_161_0, {
	slot_0_152_0.vars.trashtalk_enable,
	true
})
slot_0_152_0.vars.trashtalk_enable.no_warmup:depend(slot_0_161_0, {
	slot_0_152_0.vars.trashtalk_enable,
	true
})
slot_0_152_0.vars.trashtalk_enable.revenge:depend(slot_0_161_0, {
	slot_0_152_0.vars.trashtalk_enable,
	true
}, {
	slot_0_152_0.vars.trashtalk_enable.mode,
	function()
		local var_354_0 = slot_0_152_0.vars.trashtalk_enable.mode

		if not var_354_0 or type(var_354_0.get) ~= "function" then
			return false
		end

		local var_354_1, var_354_2 = pcall(function()
			return var_354_0:get()
		end)

		if not var_354_1 or var_354_2 == nil then
			return false
		end

		if var_354_2 == "Default" or var_354_2 == "Russian" then
			return true
		end

		if type(var_354_2) == "number" then
			return var_354_2 == 1 or var_354_2 == 3
		end

		return false
	end
})
slot_0_152_0.vars.clantag_enable:depend(slot_0_161_0)
slot_0_152_0.vars.fast_ladder:depend(slot_0_161_0)
slot_0_152_0.vars.no_fall_damage:depend(slot_0_161_0)
slot_0_152_0.vars.anim_breaker:depend(slot_0_161_0)
slot_0_152_0.vars.anim_breaker.ground_legs:depend(slot_0_161_0, {
	slot_0_152_0.vars.anim_breaker,
	true
})
slot_0_152_0.vars.anim_breaker.air_legs:depend(slot_0_161_0, {
	slot_0_152_0.vars.anim_breaker,
	true
})
slot_0_152_0.vars.anim_breaker.land_pitch_zero:depend(slot_0_161_0, {
	slot_0_152_0.vars.anim_breaker,
	true
})
slot_0_152_0.vars.lobby_badge:depend(slot_0_161_0)
slot_0_152_0.vars.mute_manipulations:depend(slot_0_161_0)
slot_0_152_0.vars.mute_manipulations.mode:depend(slot_0_161_0, {
	slot_0_152_0.vars.mute_manipulations,
	true
})
slot_0_152_0.vars.avoid_collisions:depend(slot_0_161_0)
slot_0_152_0.vars.unlock_fd_speed:depend(slot_0_161_0)
slot_0_152_0.vars.console_color:depend(slot_0_161_0)
slot_0_152_0.vars.console_color.color:depend(slot_0_161_0, {
	slot_0_152_0.vars.console_color,
	true
})
slot_0_152_0.vars.flash_game_icon:depend(slot_0_161_0)
slot_0_152_0.vars.auto_r8:depend(slot_0_161_0)
slot_0_152_0.vars.auto_r8.mode:depend(slot_0_161_0, {
	slot_0_152_0.vars.auto_r8,
	true
})

slot_0_175_0 = {
	slot_0_152_0.vars.warmup_setup.section,
	1
}
slot_0_176_0 = {
	slot_0_152_0.vars.warmup_setup.section,
	2
}
slot_0_177_0 = {
	slot_0_152_0.vars.warmup_setup.section,
	3
}

slot_0_152_0.vars.warmup_setup:depend(slot_0_161_0)
slot_0_152_0.vars.warmup_setup.section:depend(slot_0_161_0)
slot_0_152_0.vars.warmup_setup.infinite_ammo:depend(slot_0_161_0, slot_0_175_0)
slot_0_152_0.vars.warmup_setup.grenade_traj:depend(slot_0_161_0, slot_0_175_0)
slot_0_152_0.vars.warmup_setup.kick_bots:depend(slot_0_161_0, slot_0_175_0)
slot_0_152_0.vars.warmup_setup.buy_anywhere:depend(slot_0_161_0, slot_0_175_0)
slot_0_152_0.vars.warmup_setup.auto_on_map:depend(slot_0_161_0, slot_0_175_0)
slot_0_152_0.vars.warmup_setup.apply:depend(slot_0_161_0, slot_0_175_0)
slot_0_152_0.vars.warmup_setup.showpos:depend(slot_0_161_0, slot_0_175_0)
slot_0_152_0.vars.warmup_setup.bot_place:depend(slot_0_161_0, slot_0_176_0)
slot_0_152_0.vars.warmup_setup.de_overpass:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.warmup_setup.de_mirage:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.warmup_setup.de_vertigo:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.warmup_setup.de_inferno:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.warmup_setup.de_dust2:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.warmup_setup.de_cbble:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.warmup_setup.de_bank:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.warmup_setup.de_shortdust:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.warmup_setup.de_shortnuke:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.warmup_setup.cs_office:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.warmup_setup.cs_assault:depend(slot_0_161_0, slot_0_177_0)
slot_0_152_0.vars.grenades:depend(slot_0_161_0)

slot_0_178_0 = {
	slot_0_152_0.vars.grenades.grenade_release,
	true
}

slot_0_152_0.vars.grenades.super_toss:depend(slot_0_161_0)
slot_0_152_0.vars.grenades.grenade_release:depend(slot_0_161_0)
slot_0_152_0.vars.grenades.gr_on_pin_pulled:depend(slot_0_161_0, slot_0_178_0)
slot_0_152_0.vars.grenades.gr_release_damage:depend(slot_0_161_0, slot_0_178_0)
slot_0_152_0.vars.grenades.gr_allowed_grenades:depend(slot_0_161_0, slot_0_178_0)
slot_0_152_0.vars.grenades.drop_grenades:depend(slot_0_161_0)

slot_0_179_0 = slot_0_160_0

slot_0_152_0.vars.ov_panel:depend(slot_0_179_0)

slot_0_180_0 = {
	slot_0_152_0.vars.ov_watermark,
	true
}

function slot_0_181_0(arg_356_0)
	return {
		slot_0_152_0.vars.ov_watermark.wm_elements,
		function()
			return _G.wm_element_on(slot_0_152_0.vars.ov_watermark.wm_elements, arg_356_0)
		end
	}
end

slot_0_152_0.vars.ov_watermark:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
})
slot_0_152_0.vars.ov_watermark.wm_elements:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, slot_0_180_0)
slot_0_152_0.vars.ov_watermark.wm_time:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, slot_0_180_0, slot_0_181_0("Time"))
slot_0_152_0.vars.ov_watermark.wm_avatar:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, slot_0_180_0, slot_0_181_0("Avatar"))
slot_0_152_0.vars.ov_watermark.wm_name_src:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, slot_0_180_0, slot_0_181_0("Nickname"))
slot_0_152_0.vars.ov_watermark.wm_name_custom:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, slot_0_180_0, slot_0_181_0("Nickname"), {
	slot_0_152_0.vars.ov_watermark.wm_name_src,
	"Custom"
})
slot_0_152_0.vars.ov_slowdown:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
})
slot_0_152_0.vars.ov_keybinds:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
})

slot_0_182_0 = {
	slot_0_152_0.vars.ov_keybinds,
	true
}

slot_0_152_0.vars.ov_keybinds.binds:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, slot_0_182_0)
slot_0_152_0.vars.ov_keybinds.feature_icons:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, slot_0_182_0)
slot_0_152_0.vars.ov_keybinds.revert:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, slot_0_182_0)
slot_0_152_0.vars.ov_gs_inds:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
})
slot_0_152_0.vars.ov_gs_inds.binds:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, {
	slot_0_152_0.vars.ov_gs_inds,
	true
})
slot_0_152_0.vars.ov_damage_ind:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
})

slot_0_183_0 = {
	slot_0_152_0.vars.ov_damage_ind,
	true
}

slot_0_152_0.vars.ov_damage_ind.anim:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, slot_0_183_0)
slot_0_152_0.vars.ov_damage_ind.show_state:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
}, slot_0_183_0)
slot_0_152_0.vars.ov_metrics:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
})
slot_0_152_0.vars.ov_spectators:depend(slot_0_179_0, {
	slot_0_152_0.vars.ov_panel,
	true
})

slot_0_184_0 = {
	slot_0_152_0.vars.ov_arrows,
	true
}

slot_0_152_0.vars.ov_arrows:depend(slot_0_179_0)
slot_0_152_0.vars.ov_arrows.arrows_color:depend(slot_0_179_0, slot_0_184_0)
slot_0_152_0.vars.ov_arrows.arrows_gap:depend(slot_0_179_0, slot_0_184_0)
slot_0_152_0.vars.ov_arrows.arrows_size:depend(slot_0_179_0, slot_0_184_0)
slot_0_152_0.vars.ov_arrows.extra_dirs:depend(slot_0_179_0, slot_0_184_0)

slot_0_185_0 = {
	slot_0_152_0.vars.hud_style.style_target,
	1
}
slot_0_186_0 = {
	slot_0_152_0.vars.hud_style.style_target,
	2
}
slot_0_187_0 = {
	slot_0_152_0.vars.hud_style.style_target,
	3
}
slot_0_188_0 = {
	slot_0_152_0.vars.hud_style.bw_unified,
	true
}
slot_0_189_0 = {
	slot_0_152_0.vars.hud_style.bw_unified,
	false
}
slot_0_190_0 = {
	slot_0_152_0.vars.hud_style.chi_unified,
	true
}
slot_0_191_0 = {
	slot_0_152_0.vars.hud_style.chi_unified,
	false
}

function slot_0_192_0()
	local var_358_0 = slot_0_152_0.vars.hud_style and slot_0_152_0.vars.hud_style.widget_style

	if not var_358_0 or type(var_358_0.get) ~= "function" then
		return false
	end

	local var_358_1, var_358_2 = pcall(function()
		return var_358_0:get()
	end)

	if var_358_1 and type(var_358_2) == "number" then
		return var_358_2 == 2
	end

	if var_358_1 and type(var_358_2) == "string" and var_358_2:find("Minimal", 1, true) then
		return true
	end

	local var_358_3, var_358_4 = pcall(function()
		return var_358_0:get(2)
	end)

	return var_358_3 and (var_358_4 == true or var_358_4 == 1)
end

slot_0_193_0 = {
	slot_0_152_0.vars.hud_style.widget_style,
	slot_0_192_0
}

slot_0_152_0.vars.hud_style.widget_style:depend(slot_0_185_0)
slot_0_152_0.vars.hud_style.dpi_scale:depend(slot_0_160_0)
slot_0_152_0.vars.hud_style.minimal_outline:depend(slot_0_185_0, slot_0_193_0)
slot_0_152_0.vars.hud_style.blur:depend(slot_0_185_0)
slot_0_152_0.vars.hud_style.stripe_mode:depend(slot_0_185_0)
slot_0_152_0.vars.hud_style.stripe_custom:depend(slot_0_185_0, {
	slot_0_152_0.vars.hud_style.stripe_mode,
	"Custom"
})
slot_0_152_0.vars.hud_style.bw_unified:depend(slot_0_186_0)
slot_0_152_0.vars.hud_style.bw_color:depend(slot_0_186_0, slot_0_188_0)
slot_0_152_0.vars.hud_style.bw_text:depend(slot_0_186_0, slot_0_189_0)
slot_0_152_0.vars.hud_style.bw_glow:depend(slot_0_186_0, slot_0_189_0)
slot_0_152_0.vars.hud_style.chi_unified:depend(slot_0_187_0)
slot_0_152_0.vars.hud_style.chi_color:depend(slot_0_187_0, slot_0_190_0)
slot_0_152_0.vars.hud_style.chi_text:depend(slot_0_187_0, slot_0_191_0)
slot_0_152_0.vars.hud_style.chi_glow:depend(slot_0_187_0, slot_0_191_0)
slot_0_152_0.vars.hud_style:depend(slot_0_160_0)
slot_0_152_0.vars.chi_enable:depend(slot_0_160_0)

slot_0_194_0 = {
	slot_0_152_0.vars.chi_enable.chi_style,
	function()
		local var_361_0 = slot_0_152_0.vars.chi_enable.chi_style

		if not var_361_0 or type(var_361_0.get) ~= "function" then
			return true
		end

		local var_361_1, var_361_2 = pcall(function()
			return var_361_0:get()
		end)

		if not var_361_1 or var_361_2 == nil then
			return true
		end

		if type(var_361_2) == "number" then
			return var_361_2 ~= 2
		end

		if type(var_361_2) == "string" then
			return not var_361_2:find("Classic", 1, true)
		end

		return true
	end
}

slot_0_152_0.vars.chi_enable.chi_style:depend(slot_0_160_0, {
	slot_0_152_0.vars.chi_enable,
	true
})
slot_0_152_0.vars.chi_enable.chi_display:depend(slot_0_160_0, {
	slot_0_152_0.vars.chi_enable,
	true
}, slot_0_194_0)
slot_0_152_0.vars.chi_enable.chi_binds:depend(slot_0_160_0, {
	slot_0_152_0.vars.chi_enable,
	true
})
slot_0_152_0.vars.chi_enable.chi_flash_kill:depend(slot_0_160_0, {
	slot_0_152_0.vars.chi_enable,
	true
}, slot_0_194_0)

function apply_overlay_hud_access()
	local var_363_0 = slot_0_65_0()

	local function var_363_1(arg_364_0)
		if not arg_364_0 then
			return
		end

		if type(arg_364_0.visibility) == "function" then
			pcall(function()
				arg_364_0:visibility(var_363_0)
			end)
		end

		if type(arg_364_0.disabled) == "function" then
			pcall(function()
				arg_364_0:disabled(not var_363_0)
			end)
		end

		if not var_363_0 and type(arg_364_0.set) == "function" then
			pcall(function()
				arg_364_0:set(false)
			end)
		end
	end

	var_363_1(slot_0_152_0.vars.ov_panel)
	var_363_1(slot_0_152_0.vars.ov_watermark)
	var_363_1(slot_0_152_0.vars.ov_slowdown)
	var_363_1(slot_0_152_0.vars.ov_keybinds)
	var_363_1(slot_0_152_0.vars.ov_gs_inds)
	var_363_1(slot_0_152_0.vars.ov_damage_ind)

	local var_363_2 = slot_0_152_0.vars.ov_damage_ind

	if var_363_2 then
		var_363_1(var_363_2.anim)
		var_363_1(var_363_2.show_state)
	end

	var_363_1(slot_0_152_0.vars.ov_metrics)
	var_363_1(slot_0_152_0.vars.ov_spectators)

	local var_363_3 = slot_0_152_0.vars.ov_gs_inds

	if var_363_3 and var_363_3.binds then
		var_363_1(var_363_3.binds)
	end

	local var_363_4 = slot_0_152_0.vars.ov_keybinds

	if var_363_4 and var_363_4.binds then
		var_363_1(var_363_4.binds)
	end

	if var_363_4 and var_363_4.feature_icons then
		var_363_1(var_363_4.feature_icons)
	end

	if var_363_4 and var_363_4.revert then
		var_363_1(var_363_4.revert)
	end

	local var_363_5 = slot_0_152_0.vars.ov_watermark

	if var_363_5 then
		var_363_1(var_363_5.wm_elements)
		var_363_1(var_363_5.wm_time)
		var_363_1(var_363_5.wm_avatar)
		var_363_1(var_363_5.wm_name_src)
		var_363_1(var_363_5.wm_name_custom)
	end
end

apply_overlay_hud_access()
;(function()
	local var_368_0 = "   amnesia   "
	local var_368_1 = color(164, 255, 207, 255)
	local var_368_2 = "\aFFFFFF50"
	local var_368_3 = "\aFFFFFFFF"
	local var_368_4 = "\a" .. color(128, 128, 128, 255):to_hex()

	local function var_368_5(arg_369_0)
		arg_369_0 = tonumber(arg_369_0) or 1

		local var_369_0 = math.floor(255 * arg_369_0)
		local var_369_1, var_369_2 = pcall(ui.get_style, "Link Active")

		if var_369_1 and var_369_2 and type(var_369_2.r) == "number" then
			return color(var_369_2.r, var_369_2.g, var_369_2.b, var_369_0)
		end

		return color(var_368_1.r, var_368_1.g, var_368_1.b, var_369_0)
	end

	local function var_368_6()
		local var_370_0 = var_368_5(1)

		if var_370_0 and type(var_370_0.to_hex) == "function" then
			return var_370_0:to_hex()
		end

		return var_368_1:to_hex()
	end

	local function var_368_7(arg_371_0)
		local var_371_0 = var_368_5(arg_371_0)

		return string.format("\a%02X%02X%02X%02X", var_371_0.r, var_371_0.g, var_371_0.b, var_371_0.a or 255)
	end

	local function var_368_8(...)
		local var_372_0 = var_368_2
		local var_372_1 = 1

		while var_372_1 <= select("#", ...) do
			local var_372_2 = select(var_372_1, ...)
			local var_372_3 = select(var_372_1 + 1, ...)

			if var_372_2 == "h" then
				var_372_0 = var_372_0 .. var_368_3 .. tostring(var_372_3) .. var_368_2
			else
				var_372_0 = var_372_0 .. tostring(var_372_3)
			end

			var_372_1 = var_372_1 + 2
		end

		return var_372_0
	end

	local function var_368_9(arg_373_0)
		local var_373_0 = var_368_6()

		return (tostring(arg_373_0 or ""):gsub(var_368_2, var_368_4):gsub(var_368_3, "\a" .. var_373_0):gsub("\a[Ff][Ff][Ff][Ff][Ff][Ff][Ff][Ff]", var_368_4))
	end

	local function var_368_10(arg_374_0)
		local var_374_0 = var_368_6()

		return string.format("\a%s%s%s", var_374_0, var_368_0, var_368_9(arg_374_0))
	end

	local var_368_11 = {
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
		"body"
	}
	local var_368_12 = {
		death = "death",
		["player death"] = "player death",
		["unregistered shot"] = "unregistered shot",
		["lagcomp failure"] = "?",
		["prediction error"] = "prediction error",
		["jitter correction"] = "?",
		occlusion = "spread",
		correction = "?",
		misprediction = "?",
		spread = "spread"
	}

	local function var_368_13(arg_375_0)
		arg_375_0 = math.max(0, math.floor(tonumber(arg_375_0) or 0))

		local var_375_0 = math.floor(arg_375_0 / 60) % 24
		local var_375_1 = arg_375_0 % 60
		local var_375_2 = math.floor(arg_375_0 / 1440) % 7
		local var_375_3 = math.floor(arg_375_0 / 10080)

		if var_375_3 > 0 then
			return string.format("%d:%02d:%02d:%02d", var_375_3, var_375_2, var_375_0, var_375_1)
		elseif var_375_2 > 0 then
			return string.format("%d:%02d:%02d", var_375_2, var_375_0, var_375_1)
		else
			return string.format("%02d:%02d", var_375_0, var_375_1)
		end
	end

	local function var_368_14(arg_376_0, arg_376_1, arg_376_2, arg_376_3)
		return string.format("\a{Small Text}\f<%s>\r%s\t%s\t%s", arg_376_0, arg_376_1 or "", arg_376_2, tostring(arg_376_3 or 0))
	end

	local function var_368_15(arg_377_0, arg_377_1, arg_377_2, arg_377_3, arg_377_4)
		if not arg_377_0 or type(arg_377_0.name) ~= "function" then
			return
		end

		pcall(function()
			arg_377_0:name(var_368_14(arg_377_1, arg_377_2, arg_377_3, arg_377_4))
		end)
	end

	function slot_0_82_0()
		local var_379_0 = slot_0_78_0.stats

		if type(var_379_0) ~= "table" then
			return
		end

		local var_379_1 = var_368_13(var_379_0.time_minutes or 0)

		pcall(function()
			local var_380_0 = slot_0_152_0.home.stats_other

			if not var_380_0 then
				return
			end

			var_368_15(var_380_0.stats_loads_lbl, "hashtag", "", "Loads", var_379_0.loads)
			var_368_15(var_380_0.stats_deaths_lbl, "skull", " ", "Deaths", var_379_0.deaths)
			var_368_15(var_380_0.stats_hits_lbl, "circle-check", " ", "Hits", var_379_0.hits)
			var_368_15(var_380_0.stats_misses_lbl, "xmark", " ", "Misses", var_379_0.miss)
		end)
		pcall(function()
			if slot_0_152_0.home.stats_playtime_btn and type(slot_0_152_0.home.stats_playtime_btn.name) == "function" then
				slot_0_152_0.home.stats_playtime_btn:name(string.format(" %s \nplaytime", var_379_1))
			end
		end)
		pcall(function()
			if slot_0_152_0.home.stats_kills_btn and type(slot_0_152_0.home.stats_kills_btn.name) == "function" then
				slot_0_152_0.home.stats_kills_btn:name(string.format(" %s \nkills", tostring(var_379_0.kills or 0)))
			end
		end)
		pcall(function()
			if slot_0_152_0.home.stats_evaded_btn and type(slot_0_152_0.home.stats_evaded_btn.name) == "function" then
				slot_0_152_0.home.stats_evaded_btn:name(string.format(" %s \nevaded", tostring(var_379_0.evaded or 0)))
			end
		end)
	end

	function slot_0_84_0(arg_384_0)
		if not slot_0_90_0.is_configured() or slot_0_78_0.api_ping_ok ~= true then
			if arg_384_0 then
				arg_384_0(false)
			end

			return
		end

		local var_384_0 = {
			loads = tonumber(slot_0_78_0.stats.loads) or 0,
			time_minutes = tonumber(slot_0_78_0.stats.time_minutes) or 0,
			kills = tonumber(slot_0_78_0.stats.kills) or 0,
			deaths = tonumber(slot_0_78_0.stats.deaths) or 0,
			hits = tonumber(slot_0_78_0.stats.hits) or 0,
			miss = tonumber(slot_0_78_0.stats.miss) or 0,
			evaded = tonumber(slot_0_78_0.stats.evaded) or 0
		}

		slot_0_90_0.post("/v1/stats/push", {
			stats = var_384_0
		}, function(arg_385_0, arg_385_1, arg_385_2)
			if arg_384_0 then
				arg_384_0(arg_385_0 == true)
			end
		end)
	end

	function slot_0_85_0()
		slot_0_78_0.stats_push_debounce = (slot_0_78_0.stats_push_debounce or 0) + 1

		local var_386_0 = slot_0_78_0.stats_push_debounce

		utils.execute_after(4, function()
			if var_386_0 ~= slot_0_78_0.stats_push_debounce then
				return
			end

			slot_0_84_0()
		end)
	end

	function slot_0_83_0(arg_388_0)
		if not slot_0_90_0.is_configured() or slot_0_78_0.api_ping_ok ~= true then
			if arg_388_0 then
				arg_388_0(false)
			end

			return
		end

		slot_0_90_0.post("/v1/stats/pull", {}, function(arg_389_0, arg_389_1, arg_389_2)
			if arg_389_0 and type(arg_389_1) == "table" and arg_389_1.ok == true and type(arg_389_1.stats) == "table" then
				local var_389_0 = arg_389_1.stats

				slot_0_78_0.stats.loads = math.max(0, tonumber(var_389_0.loads) or 0)
				slot_0_78_0.stats.time_minutes = math.max(0, tonumber(var_389_0.time_minutes) or 0)
				slot_0_78_0.stats.kills = math.max(0, tonumber(var_389_0.kills) or 0)
				slot_0_78_0.stats.deaths = math.max(0, tonumber(var_389_0.deaths) or 0)
				slot_0_78_0.stats.hits = math.max(0, tonumber(var_389_0.hits) or 0)
				slot_0_78_0.stats.miss = math.max(0, tonumber(var_389_0.miss) or 0)
				slot_0_78_0.stats.evaded = math.max(0, tonumber(var_389_0.evaded) or 0)

				slot_0_82_0()

				if arg_388_0 then
					arg_388_0(true)
				end
			elseif arg_388_0 then
				arg_388_0(false)
			end
		end)
	end

	local function var_368_16()
		if not slot_0_90_0.is_configured() or slot_0_78_0.api_ping_ok ~= true then
			utils.execute_after(60, var_368_16)

			return
		end

		slot_0_78_0.stats.time_minutes = (tonumber(slot_0_78_0.stats.time_minutes) or 0) + 1

		slot_0_82_0()
		slot_0_85_0()
		utils.execute_after(60, var_368_16)
	end

	function slot_0_86_0()
		if slot_0_78_0.stats_playtime_started then
			return
		end

		slot_0_78_0.stats_playtime_started = true

		utils.execute_after(60, var_368_16)
	end

	local function var_368_17(arg_392_0)
		if slot_0_78_0.stats_bootstrapped then
			return
		end

		slot_0_78_0.stats_bootstrap_pending = false
		slot_0_78_0.stats_bootstrapped = true
		slot_0_78_0.stats.loads = (tonumber(slot_0_78_0.stats.loads) or 0) + 1

		slot_0_82_0()
		slot_0_84_0(function()
			slot_0_86_0()
		end)

		if not arg_392_0 then
			slot_0_85_0()
		end
	end

	function slot_0_81_0()
		if slot_0_78_0.stats_bootstrapped or slot_0_78_0.stats_bootstrap_pending then
			return
		end

		if not slot_0_90_0.is_configured() or slot_0_78_0.api_ping_ok ~= true then
			return
		end

		slot_0_78_0.stats_bootstrap_pending = true
		slot_0_78_0.stats_bootstrap_token = (slot_0_78_0.stats_bootstrap_token or 0) + 1

		local var_394_0 = slot_0_78_0.stats_bootstrap_token

		utils.execute_after(12, function()
			if var_394_0 ~= slot_0_78_0.stats_bootstrap_token or slot_0_78_0.stats_bootstrapped or not slot_0_78_0.stats_bootstrap_pending then
				return
			end

			var_368_17(false)
		end)
		slot_0_83_0(function(arg_396_0)
			if var_394_0 ~= slot_0_78_0.stats_bootstrap_token or slot_0_78_0.stats_bootstrapped then
				return
			end

			var_368_17(arg_396_0 == true)
		end)
	end

	local function var_368_18(arg_397_0)
		if not slot_0_90_0.is_configured() or slot_0_78_0.api_ping_ok ~= true then
			return
		end

		if not entity.get_local_player() then
			return
		end

		if not entity.get(arg_397_0.target) then
			return
		end

		if var_368_12[arg_397_0.state] == nil then
			slot_0_78_0.stats.hits = (tonumber(slot_0_78_0.stats.hits) or 0) + 1
		else
			slot_0_78_0.stats.miss = (tonumber(slot_0_78_0.stats.miss) or 0) + 1
		end

		slot_0_82_0()
		slot_0_85_0()
	end

	local function var_368_19(arg_398_0)
		if not slot_0_90_0.is_configured() or slot_0_78_0.api_ping_ok ~= true then
			return
		end

		if type(arg_398_0) ~= "table" then
			return
		end

		local var_398_0 = entity.get_local_player()

		if not var_398_0 then
			return
		end

		local var_398_1 = entity.get(arg_398_0.userid, true)
		local var_398_2 = entity.get(arg_398_0.attacker, true)

		if not var_398_1 and not var_398_2 then
			return
		end

		if var_398_1 == var_398_0 then
			slot_0_78_0.stats.deaths = (tonumber(slot_0_78_0.stats.deaths) or 0) + 1
		elseif var_398_2 == var_398_0 and var_398_1 and var_398_1 ~= var_398_0 then
			local var_398_3 = true
			local var_398_4, var_398_5 = pcall(function()
				return var_398_1:is_enemy()
			end)

			if var_398_4 then
				var_398_3 = var_398_5 == true
			end

			if var_398_3 then
				slot_0_78_0.stats.kills = (tonumber(slot_0_78_0.stats.kills) or 0) + 1
			end
		end

		slot_0_82_0()
		slot_0_85_0()
	end

	slot_0_82_0()

	local var_368_20 = {
		"Aimbot",
		"Purchases",
		"Evaded Shots",
		"Harmed",
		"Anti-bruteforce",
		"Configs"
	}

	local function var_368_21(arg_400_0, arg_400_1)
		if not arg_400_0 or arg_400_1 < 1 or arg_400_1 > #var_368_20 then
			return false
		end

		local var_400_0 = var_368_20[arg_400_1]

		local function var_400_1(arg_401_0)
			return arg_401_0 == true or arg_401_0 == 1
		end

		local function var_400_2(arg_402_0)
			arg_402_0 = tostring(arg_402_0 or "")
			arg_402_0 = arg_402_0:gsub("\a%x%x%x%x%x%x%x%x", "")
			arg_402_0 = arg_402_0:gsub("\x01.", "")
			arg_402_0 = arg_402_0:gsub("\f<[^>]+>", "")
			arg_402_0 = arg_402_0:gsub("\r\t", "")

			return arg_402_0:gsub("^%s+", ""):gsub("%s+$", "")
		end

		local function var_400_3(arg_403_0)
			if type(arg_403_0) ~= "table" then
				return false
			end

			if var_400_1(arg_403_0[arg_400_1]) or var_400_1(arg_403_0[var_400_0]) then
				return true
			end

			for iter_403_0 = 1, #arg_403_0 do
				local var_403_0 = arg_403_0[iter_403_0]

				if var_403_0 == var_400_0 or var_403_0 == arg_400_1 or var_400_2(var_403_0) == var_400_0 then
					return true
				end
			end

			for iter_403_1, iter_403_2 in pairs(arg_403_0) do
				if iter_403_2 == var_400_0 or iter_403_2 == arg_400_1 or var_400_2(iter_403_2) == var_400_0 then
					return true
				end
			end

			return false
		end

		local var_400_4, var_400_5 = pcall(function()
			return arg_400_0:get(arg_400_1)
		end)

		if var_400_4 and var_400_1(var_400_5) then
			return true
		end

		local var_400_6, var_400_7 = pcall(function()
			return arg_400_0:get(var_400_0)
		end)
		local var_400_8 = var_400_7

		if var_400_6 and var_400_1(var_400_8) then
			return true
		end

		local var_400_9, var_400_10 = pcall(function()
			return arg_400_0:get()
		end)
		local var_400_11 = var_400_10

		if var_400_9 then
			if type(var_400_11) == "number" then
				return bit.band(var_400_11, bit.lshift(1, arg_400_1 - 1)) ~= 0
			end

			if var_400_3(var_400_11) then
				return true
			end
		end

		if var_400_3(arg_400_0.value) then
			return true
		end

		return false
	end

	local function var_368_22(arg_407_0)
		local var_407_0 = slot_0_152_0.vars.logs and slot_0_152_0.vars.logs.modes

		if not var_407_0 then
			return false
		end

		local var_407_1

		for iter_407_0 = 1, #var_368_20 do
			if var_368_20[iter_407_0] == arg_407_0 then
				var_407_1 = iter_407_0

				break
			end
		end

		if not var_407_1 then
			return false
		end

		local var_407_2 = false

		for iter_407_1 = 1, #var_368_20 do
			if var_368_21(var_407_0, iter_407_1) then
				var_407_2 = true

				break
			end
		end

		if not var_407_2 then
			return true
		end

		return var_368_21(var_407_0, var_407_1)
	end

	local function var_368_23()
		if var_368_22("Anti-bruteforce") then
			return true
		end

		local var_408_0 = slot_0_152_0.vars.logs and slot_0_152_0.vars.logs.modes

		if not var_408_0 then
			return true
		end

		local var_408_1, var_408_2 = pcall(function()
			return var_408_0:get("Anti-bruteforce")
		end)

		if not var_408_1 or var_408_2 == nil then
			return slot_0_152_0.vars.logs:get() == true
		end

		return false
	end

	local function var_368_24(arg_410_0)
		local var_410_0 = slot_0_152_0.vars.logs and slot_0_152_0.vars.logs.output

		if not var_410_0 then
			return arg_410_0 == "Screen"
		end

		local var_410_1, var_410_2 = pcall(function()
			return var_410_0:get(arg_410_0)
		end)

		if not var_410_1 then
			return arg_410_0 == "Screen"
		end

		local var_410_3 = false
		local var_410_4, var_410_5 = pcall(function()
			return var_410_0:get("Console")
		end)
		local var_410_6, var_410_7 = pcall(function()
			return var_410_0:get("Screen")
		end)

		if var_410_4 and var_410_5 or var_410_6 and var_410_7 then
			var_410_3 = true
		end

		if not var_410_3 then
			return true
		end

		return var_410_2 == true
	end

	local function var_368_25()
		local var_414_0 = slot_0_152_0.vars.logs

		if not var_414_0 or not var_414_0.log_counters then
			return true
		end

		local var_414_1, var_414_2 = pcall(function()
			return var_414_0.log_counters:get()
		end)

		return var_414_1 and var_414_2 == true
	end

	local function var_368_26(arg_416_0)
		if not var_368_25() then
			return ""
		end

		return string.format("[%s] ", tostring(arg_416_0))
	end

	local var_368_27 = 4
	local var_368_28 = 0.4
	local var_368_29 = 8

	local function var_368_30()
		if not slot_0_65_0() then
			return false
		end

		if not slot_0_152_0.vars or not slot_0_152_0.vars.logs then
			return false
		end

		if slot_0_152_0.vars.logs:get() ~= true then
			return false
		end

		return var_368_24("Screen")
	end

	local function var_368_31(arg_418_0)
		local var_418_0 = tostring(arg_418_0 or "")

		if chi and type(chi.strip_markup) == "function" then
			return chi.strip_markup(var_418_0)
		end

		return var_418_0:gsub("\\a%x%x%x%x%x%x%x%x", ""):gsub("\a%x%x%x%x%x%x%x%x", "")
	end

	local function var_368_32(arg_419_0)
		local var_419_0 = tostring(arg_419_0 or "")

		if var_419_0:find(var_368_2, 1, true) or var_419_0:find(var_368_3, 1, true) then
			return var_419_0
		end

		return var_368_31(var_419_0):gsub("^%[%d+%]%s*", ""):gsub("^%s*amnesia%.plus%s*", ""):gsub("^%s*amnesia%s*", ""):gsub("^%s+", "")
	end

	slot_0_78_0.screen_log_body = var_368_32

	local function var_368_33(arg_420_0, arg_420_1, arg_420_2)
		local var_420_0 = tostring(arg_420_0 or "")

		if var_420_0 == "" then
			return
		end

		if not var_420_0:find(var_368_2, 1, true) and not var_420_0:find(var_368_3, 1, true) then
			var_420_0 = var_368_32(var_420_0)

			if var_420_0 == "" then
				return
			end
		end

		local var_420_1 = arg_420_1

		if var_420_1 ~= "hit" and var_420_1 ~= "skull" and var_420_1 ~= "harmed" and var_420_1 ~= "evaded" and var_420_1 ~= "miss" and var_420_1 ~= "greet" and var_420_1 ~= "antibrute" and var_420_1 ~= "server" and (type(var_420_1) ~= "string" or var_420_1:sub(1, 4) ~= "cfg_") then
			var_420_1 = nil
		end

		slot_0_78_0.screen_logs = slot_0_78_0.screen_logs or {}

		table.insert(slot_0_78_0.screen_logs, 1, {
			text = var_420_0,
			time = globals.realtime or 0,
			icon = var_420_1,
			force = arg_420_2 == true
		})

		while #slot_0_78_0.screen_logs > var_368_29 do
			table.remove(slot_0_78_0.screen_logs)
		end
	end

	local function var_368_34(arg_421_0, arg_421_1)
		if not var_368_30() then
			return
		end

		var_368_33(arg_421_0, arg_421_1, false)
	end

	local function var_368_35(arg_422_0, arg_422_1)
		if not slot_0_65_0() then
			return
		end

		var_368_33(arg_422_0, arg_422_1, true)
	end

	local function var_368_36()
		local var_423_0 = slot_0_78_0.screen_logs or {}

		for iter_423_0 = 1, #var_423_0 do
			if var_423_0[iter_423_0] and var_423_0[iter_423_0].force == true then
				return true
			end
		end

		return false
	end

	function slot_0_78_0.api_server_status_elog(arg_424_0)
		local var_424_0

		if arg_424_0 then
			var_424_0 = var_368_8("m", "Successfully connected to ", "h", "server")
		else
			var_424_0 = var_368_8("m", "Disconnected from ", "h", "server")
		end

		var_368_35(var_424_0, "server")
	end

	local function var_368_37(arg_425_0, arg_425_1, arg_425_2)
		if var_368_24("Console") then
			print_raw(arg_425_0)
		end

		if var_368_24("Screen") then
			var_368_34(arg_425_1, arg_425_2)
		end
	end

	local function var_368_38(arg_426_0)
		local var_426_0 = tostring(arg_426_0 or ""):lower()

		if var_426_0:find("cloud", 1, true) then
			return "cfg_cloud"
		end

		if var_426_0:find("deleted", 1, true) or var_426_0:find("delete", 1, true) then
			return "cfg_delete"
		end

		if var_426_0:find("import", 1, true) then
			return "cfg_import"
		end

		if var_426_0:find("export", 1, true) then
			return "cfg_export"
		end

		if var_426_0:find("loaded", 1, true) then
			return "cfg_load"
		end

		if var_426_0:find("sync", 1, true) or var_426_0:find("statistic", 1, true) or var_426_0:find("reset", 1, true) then
			return "cfg_sync"
		end

		if var_426_0:find("failed", 1, true) or var_426_0:find("invalid", 1, true) or var_426_0:find("not found", 1, true) or var_426_0:find("required", 1, true) or var_426_0:find("reserved", 1, true) or var_426_0:find("forbidden", 1, true) or var_426_0:find("empty", 1, true) or var_426_0:find("configured", 1, true) or var_426_0:find("connect first", 1, true) then
			return "cfg_warn"
		end

		return "cfg_save"
	end

	local var_368_39 = {
		{
			"^cloud saved:%s*(.+)$",
			"Saved cloud config "
		},
		{
			"^cloud deleted:%s*(.+)$",
			"Deleted cloud config "
		},
		{
			"^loaded from cloud:%s*(.+)$",
			"Loaded cloud config "
		},
		{
			"^loaded cloud AA:%s*(.+)$",
			"Loaded cloud AA "
		},
		{
			"^loaded AA:%s*(.+)$",
			"Loaded AA "
		},
		{
			"^exported %(encrypted%):%s*(.+)$",
			"Exported config "
		},
		{
			"^imported %(legacy json%):%s*(.+)$",
			"Imported config "
		},
		{
			"^imported preset:%s*(.+)$",
			"Imported config "
		},
		{
			"^saved:%s*(.+)$",
			"Saved config "
		},
		{
			"^created:%s*(.+)$",
			"Created config "
		},
		{
			"^loaded:%s*(.+)$",
			"Loaded config "
		},
		{
			"^deleted:%s*(.+)$",
			"Deleted config "
		}
	}
	local var_368_40 = {
		["cloud data invalid"] = "Cloud data invalid",
		["already exists"] = "Config already exists",
		["cloud get failed"] = "Cloud get failed",
		["cloud deleted"] = "Deleted cloud config",
		["select local preset"] = "Select local preset",
		["nothing selected"] = "Nothing selected",
		["select cloud preset"] = "Select cloud preset",
		["cloud saved"] = "Saved cloud config",
		["invalid import data"] = "Invalid import data",
		["cloud load failed"] = "Cloud load failed",
		["import failed"] = "Import failed",
		["cloud load AA failed"] = "Cloud load AA failed",
		["empty clipboard"] = "Empty clipboard",
		["cloud delete forbidden"] = "Cloud delete forbidden",
		["export failed"] = "Export failed",
		["cloud delete failed"] = "Cloud delete failed",
		["cant delete recommended"] = "Can't delete recommended",
		["cloud save failed"] = "Cloud save failed",
		["save snapshot failed"] = "Save snapshot failed",
		["api not configured"] = "API not configured",
		["load failed"] = "Load failed",
		["connect first (status)"] = "Connect first",
		["save failed"] = "Save failed",
		["statistics synced"] = "Statistics synced",
		["reserved name"] = "Reserved name",
		["statistics sync failed"] = "Statistics sync failed",
		["name required"] = "Name required",
		["statistics reset failed"] = "Statistics reset failed",
		["config not found"] = "Config not found",
		["load AA failed"] = "Load AA failed"
	}

	local function var_368_41(arg_427_0)
		arg_427_0 = tostring(arg_427_0 or "")

		for iter_427_0 = 1, #var_368_39 do
			local var_427_0 = var_368_39[iter_427_0]
			local var_427_1 = arg_427_0:match(var_427_0[1])

			if var_427_1 then
				return var_368_8("m", var_427_0[2], "h", var_427_1)
			end
		end

		local var_427_2 = var_368_40[arg_427_0]

		if var_427_2 then
			return var_368_8("h", var_427_2)
		end

		return var_368_8("h", arg_427_0)
	end

	local function var_368_42(arg_428_0)
		if not slot_0_152_0.vars or not slot_0_152_0.vars.logs or slot_0_152_0.vars.logs:get() ~= true then
			return
		end

		if not var_368_22("Configs") then
			return
		end

		local var_428_0 = tostring(arg_428_0 or "")

		if var_428_0 == "" then
			return
		end

		local var_428_1 = var_368_41(var_428_0)

		var_368_37(var_368_10(var_428_1), var_428_1, var_368_38(var_428_0))
	end

	local function var_368_43(arg_429_0)
		if not slot_0_152_0.vars or not slot_0_152_0.vars.logs or slot_0_152_0.vars.logs:get() ~= true then
			return
		end

		if not var_368_23() then
			return
		end

		local var_429_0 = "enemy"

		var_429_0 = arg_429_0 and type(arg_429_0.get_name) == "function" and arg_429_0:get_name() or var_429_0

		local var_429_1 = var_368_8("m", "Changed anti-aim due to ", "h", var_429_0, "m", "'s bullet")

		var_368_37(var_368_10(var_429_1), var_429_1, "antibrute")
	end

	local function var_368_44()
		if not slot_0_152_0.vars or not slot_0_152_0.vars.logs or slot_0_152_0.vars.logs:get() ~= true then
			return
		end

		if not var_368_23() then
			return
		end

		local var_430_0 = var_368_8("m", "Anti-aim ", "h", "resetted")

		var_368_37(var_368_10(var_430_0), var_430_0, "antibrute")
	end

	local function var_368_45()
		local var_431_0 = rawget(_G, "os")

		if var_431_0 and var_431_0.date then
			local var_431_1, var_431_2 = pcall(var_431_0.date, "*t")

			if var_431_1 and type(var_431_2) == "table" and type(var_431_2.hour) == "number" then
				return var_431_2.hour >= 20 or var_431_2.hour < 6
			end
		end

		return false
	end

	local var_368_46 = 2.35
	local var_368_47 = 3.5
	local var_368_48 = "https://amnesia.plus/welcome.wav"
	local var_368_49 = "csgo/sound/amnesia"
	local var_368_50 = "csgo/sound/amnesia/welcome.wav"
	local var_368_51 = "amnesia/welcome.wav"
	local var_368_52 = true
	local var_368_53 = 0
	local var_368_54 = 0
	local var_368_55 = false
	local var_368_56 = 24
	local var_368_57 = 0.45
	local var_368_58 = (function()
		local var_432_0, var_432_1 = pcall(function()
			return utils.get_vfunc("engine.dll", "IEngineSoundClient003", 12, "int(__thiscall*)(void*, const char*, float, int, int, float)")
		end)

		if not var_432_0 or not var_432_1 then
			return function()
				return
			end
		end

		return function(arg_435_0, arg_435_1)
			pcall(var_432_1, arg_435_0, (tonumber(arg_435_1) or 100) / 100, 100, 0, 0)
		end
	end)()

	local function var_368_59(arg_436_0)
		if type(arg_436_0) == "string" then
			return arg_436_0
		end

		if type(arg_436_0) == "table" then
			if type(arg_436_0.body) == "string" then
				return arg_436_0.body
			end

			if type(arg_436_0.data) == "string" then
				return arg_436_0.data
			end
		end

		return nil
	end

	local function var_368_60(arg_437_0)
		return type(arg_437_0) == "string" and #arg_437_0 >= 44 and arg_437_0:sub(1, 4) == "RIFF"
	end

	local function var_368_61(arg_438_0)
		local var_438_0 = var_368_59(arg_438_0)

		if not var_368_60(var_438_0) then
			return false
		end

		pcall(files.create_folder, var_368_49)

		return pcall(files.write, var_368_50, var_438_0, true) == true
	end

	local function var_368_62()
		if var_368_55 then
			return
		end

		if type(network) ~= "table" or type(network.get) ~= "function" then
			return
		end

		var_368_55 = true

		pcall(function()
			network.get(var_368_48, nil, function(arg_441_0)
				var_368_55 = false

				pcall(var_368_61, arg_441_0)
			end)
		end)
	end

	local function var_368_63()
		local var_442_0, var_442_1 = pcall(files.read, var_368_50, true)

		return var_442_0 and var_368_60(var_442_1)
	end

	local function var_368_64()
		var_368_58(var_368_51, 100)
	end

	local function var_368_65()
		if var_368_52 then
			return
		end

		local var_444_0 = globals.realtime or 0

		if var_368_54 <= 0 then
			var_368_54 = var_444_0 + 0.35

			var_368_62()
			pcall(function()
				local var_445_0 = network.get(var_368_48)

				pcall(var_368_61, var_445_0)
			end)

			return
		end

		if var_444_0 < var_368_54 then
			return
		end

		if not var_368_63() then
			var_368_53 = var_368_53 + 1
			var_368_54 = var_444_0 + var_368_57

			if var_368_53 >= var_368_56 then
				var_368_52 = true
			else
				var_368_62()
			end

			return
		end

		pcall(var_368_64)

		var_368_52 = true
	end

	local function var_368_66()
		var_368_52 = false
		var_368_53 = 0
		var_368_54 = 0

		var_368_65()
	end

	local var_368_67 = "https://amnesia.plus/start.gif"
	local var_368_68 = 195
	local var_368_69 = 0.7
	local var_368_70 = 4
	local var_368_71 = 1.4
	local var_368_72 = var_368_69 + var_368_70 + var_368_71
	local var_368_73 = 8
	local var_368_74 = 0
	local var_368_75 = globals.realtime or 0
	local var_368_76
	local var_368_77 = false

	local function var_368_78(arg_447_0)
		if type(arg_447_0) == "string" then
			return arg_447_0
		end

		if type(arg_447_0) == "table" and type(arg_447_0.body) == "string" then
			return arg_447_0.body
		end

		return nil
	end

	local function var_368_79(arg_448_0)
		local var_448_0 = var_368_78(arg_448_0)

		if type(var_448_0) ~= "string" or #var_448_0 < 64 then
			return nil
		end

		local var_448_1, var_448_2 = pcall(render.load_image, var_448_0)

		if var_448_1 and var_448_2 then
			return var_448_2
		end

		return nil
	end

	local function var_368_80()
		var_368_74 = 0
		var_368_75 = globals.realtime or 0
	end

	local function var_368_81()
		if var_368_76 or var_368_77 then
			return
		end

		if type(network) ~= "table" or type(network.get) ~= "function" then
			return
		end

		local var_450_0 = var_368_79(network.get(var_368_67))

		if var_450_0 then
			var_368_76 = var_450_0

			var_368_80()
		end
	end

	local function var_368_82()
		if var_368_76 or var_368_77 then
			return
		end

		if type(network) ~= "table" or type(network.get) ~= "function" then
			return
		end

		var_368_77 = true

		network.get(var_368_67, nil, function(arg_452_0)
			var_368_77 = false

			if var_368_76 then
				return
			end

			local var_452_0 = var_368_79(arg_452_0)

			if var_452_0 then
				var_368_76 = var_452_0

				var_368_80()
			end
		end)
	end

	pcall(var_368_81)

	local function var_368_83(arg_453_0)
		arg_453_0 = math.max(0, math.min(1, tonumber(arg_453_0) or 0))

		return arg_453_0 * arg_453_0 * (3 - 2 * arg_453_0)
	end

	local function var_368_84()
		local var_454_0 = globals.realtime or 0

		if var_368_74 <= 0 then
			if var_368_76 then
				var_368_74 = var_454_0
			elseif var_454_0 - var_368_75 >= var_368_73 then
				var_368_74 = var_454_0
			else
				return 0
			end
		end

		local var_454_1 = var_454_0 - var_368_74

		if var_454_1 <= 0 or var_454_1 >= var_368_72 then
			return 0
		end

		if var_454_1 < var_368_69 then
			return var_368_83(var_454_1 / var_368_69)
		end

		if var_454_1 < var_368_69 + var_368_70 then
			return 1
		end

		local var_454_2 = var_454_1 - var_368_69 - var_368_70

		return var_368_83(1 - var_454_2 / var_368_71)
	end

	function slot_0_78_0.startup_splash_wants()
		if var_368_84() > 0.001 then
			return true
		end

		if not var_368_76 and var_368_74 <= 0 then
			return true
		end

		return false
	end

	local function var_368_85()
		if not var_368_76 then
			pcall(var_368_81)
			var_368_82()
		end

		local var_456_0 = var_368_84()

		if var_456_0 <= 0.001 then
			return
		end

		local var_456_1 = slot_0_89_0.screen_size_cached()

		if not var_456_1 then
			return
		end

		local var_456_2 = math.floor(var_368_68 * var_456_0)

		render.rect(vector(0, 0), var_456_1, color(0, 0, 0, var_456_2))

		if var_368_76 then
			local var_456_3 = math.min(var_456_1.x, var_456_1.y) * 0.36
			local var_456_4 = vector(var_456_1.x * 0.5 - var_456_3 * 0.5, var_456_1.y * 0.5 - var_456_3 * 0.5)
			local var_456_5 = math.floor(255 * var_456_0)

			pcall(function()
				render.texture(var_368_76, var_456_4, vector(var_456_3, var_456_3), color(255, 255, 255, var_456_5), "f")
			end)
		end
	end

	local var_368_86 = slot_0_26_0
	local var_368_87 = slot_0_27_0
	local var_368_88 = false
	local var_368_89 = false

	local function var_368_90(arg_458_0)
		arg_458_0 = slot_0_38_0(arg_458_0 or "alpha")

		local var_458_0 = slot_0_70_0(arg_458_0)
		local var_458_1 = tostring(var_458_0.title or arg_458_0)
		local var_458_2 = var_368_8("h", "Alpha ", "h", "access ", "h", "activated", "h", " (", "h", var_458_1, "h", " build)")
		local var_458_3 = var_368_10(var_458_2)

		print_raw(var_458_3)
		var_368_34(var_458_2, "cfg_save")
	end

	local function var_368_91()
		utils.execute_after(var_368_46, function()
			pcall(function()
				local var_461_0 = var_368_45() and "good Night, " or "Good day, "
				local var_461_1 = tostring(slot_0_18_0 or "user")
				local var_461_2 = var_368_8("m", var_461_0, "h", var_461_1)
				local var_461_3 = var_368_10(var_461_2)

				print_raw(var_461_3)
				var_368_34(var_461_2, "greet")
			end)
		end)
	end

	local function var_368_92(arg_462_0)
		if var_368_88 then
			return
		end

		var_368_88 = true

		local var_462_0 = 0
		local var_462_1 = slot_0_35_0()

		if var_462_1 and slot_0_31_0(var_462_1) then
			var_462_0 = var_462_1
		else
			arg_462_0 = tonumber(arg_462_0) or 0

			if arg_462_0 > 0 and slot_0_31_0(arg_462_0) then
				var_462_0 = arg_462_0
			end
		end

		if var_462_0 > 0 then
			pcall(function()
				slot_0_61_0(var_462_0)
				var_368_90(slot_0_46_0())
				slot_0_36_0(math.max(var_462_0, tonumber(slot_0_78_0.api_alpha_dlc_claimed_at) or 0))
			end)
		end

		var_368_91()
		pcall(var_368_66)
	end

	local function var_368_93()
		if var_368_89 then
			return
		end

		var_368_89 = true

		local var_464_0 = slot_0_35_0()

		if var_464_0 and not slot_0_31_0(var_464_0) then
			slot_0_34_0()
		end

		if var_464_0 and slot_0_31_0(var_464_0) then
			var_368_92(var_464_0)

			return
		end

		if not slot_0_90_0.is_configured() then
			var_368_92(nil)

			return
		end

		utils.execute_after(var_368_47, function()
			if not var_368_88 then
				var_368_92(slot_0_78_0.api_alpha_dlc_claimed_at)
			end
		end)
	end

	slot_0_78_0.try_schedule_startup_greets = var_368_92
	slot_0_78_0.play_welcome_sound = var_368_66
	slot_0_78_0.welcome_sound_tick = var_368_65
	slot_0_78_0.startup_splash_render = var_368_85

	var_368_93()

	local var_368_94 = -1
	local var_368_95 = -1
	local var_368_96 = 80
	local var_368_97 = 0.5

	local function var_368_98(arg_466_0)
		slot_0_78_0.death_log = {
			victim = entity.get(arg_466_0.userid, true),
			attacker = entity.get(arg_466_0.attacker, true),
			at = globals.realtime
		}
	end

	local function var_368_99(arg_467_0)
		if not arg_467_0 or arg_467_0:is_alive() then
			return false
		end

		local var_467_0 = slot_0_78_0.death_log

		if not var_467_0 or not var_467_0.victim or not var_467_0.attacker then
			return false
		end

		if globals.realtime - (var_467_0.at or 0) > 0.35 then
			return false
		end

		if var_467_0.victim ~= arg_467_0 then
			return false
		end

		local var_467_1 = entity.get_local_player()

		return var_467_1 ~= nil and var_467_0.attacker == var_467_1
	end

	local function var_368_100(arg_468_0)
		local var_468_0 = entity.get_local_player()

		if not var_468_0 then
			return
		end

		if entity.get(arg_468_0.userid, true) == var_468_0 then
			var_368_94 = globals.tickcount

			if slot_0_78_0.anti_brute then
				slot_0_78_0.anti_brute.last_hit_tick = globals.tickcount

				if slot_0_78_0.anti_brute.last_trigger_tick == globals.tickcount and slot_0_78_0.brute_reset then
					pcall(slot_0_78_0.brute_reset, "hit")
				end
			end
		end
	end

	local function var_368_101(arg_469_0, arg_469_1, arg_469_2, arg_469_3)
		if arg_469_0 == var_368_94 then
			return
		end

		if arg_469_3 ~= nil and (tonumber(arg_469_3) or 0) == 0 then
			return
		end

		slot_0_78_0.stats.evaded = (tonumber(slot_0_78_0.stats.evaded) or 0) + 1

		slot_0_82_0()
		slot_0_85_0()

		if slot_0_152_0.vars.logs:get() and var_368_22("Evaded Shots") then
			local var_469_0 = tostring(arg_469_1 or "enemy")
			local var_469_1 = var_368_8("m", "Evaded ", "h", var_469_0, "m", "'s shot (~", "h", math.floor(arg_469_2 or 0), "m", "u)")
			local var_469_2 = var_368_10(var_469_1)

			var_368_37(var_469_2, var_469_1, "evaded")
		end
	end

	local function var_368_102(arg_470_0)
		local var_470_0 = entity.get_local_player()

		if not var_470_0 or var_470_0.m_iHealth <= 0 then
			return
		end

		if globals.tickcount == var_368_95 then
			return
		end

		local var_470_1 = entity.get(arg_470_0.userid, true)

		if not var_470_1 or not var_470_1:is_enemy() then
			return
		end

		if var_470_1.is_dormant and var_470_1:is_dormant() then
			return
		end

		local var_470_2 = var_470_1:get_eye_position()

		if not var_470_2 then
			return
		end

		local var_470_3 = vector(arg_470_0.x or 0, arg_470_0.y or 0, arg_470_0.z or 0)
		local var_470_4
		local var_470_5
		local var_470_6 = entity.get_players(false, false)

		for iter_470_0 = 1, #var_470_6 do
			local var_470_7 = var_470_6[iter_470_0]

			if var_470_7 and not var_470_7:is_enemy() then
				local var_470_8 = var_470_7:get_origin() + vector(0, 0, 36)
				local var_470_9, var_470_10 = pcall(function()
					return var_470_8:closest_ray_point(var_470_2, var_470_3)
				end)

				if var_470_9 and var_470_10 then
					local var_470_11 = var_470_8:dist(var_470_10)

					if var_470_7 == var_470_0 then
						var_470_4 = var_470_11
					else
						var_470_5 = var_470_5 and math.min(var_470_5, var_470_11) or var_470_11
					end
				end
			end
		end

		if not var_470_4 or var_470_4 >= var_368_96 then
			return
		end

		if var_470_5 and var_470_5 < var_470_4 then
			return
		end

		local var_470_12 = globals.tickcount

		var_368_95 = var_470_12

		local var_470_13 = var_470_1:get_name() or "enemy"
		local var_470_14

		pcall(function()
			local var_472_0 = var_470_1:get_resource()

			if var_472_0 then
				var_470_14 = var_472_0.m_iPing
			end
		end)
		utils.execute_after(var_368_97, function()
			pcall(var_368_101, var_470_12, var_470_13, var_470_4, var_470_14)
		end)
	end

	local function var_368_103(arg_474_0)
		if not slot_0_152_0.vars.logs:get() or not var_368_22("Aimbot") then
			return
		end

		slot_474_1_0 = entity.get(arg_474_0.target)

		if not slot_474_1_0 then
			return
		end

		slot_474_2_0 = var_368_11[arg_474_0.hitgroup]
		slot_474_3_0 = var_368_11[arg_474_0.wanted_hitgroup]
		slot_474_4_0 = math.max(0, tonumber(arg_474_0.damage) or 0)
		slot_474_5_0 = math.max(0, tonumber(arg_474_0.wanted_damage) or 0)
		slot_474_6_0 = arg_474_0.hitchance or 0
		slot_474_7_0 = var_368_12[arg_474_0.state]
		slot_474_8_0 = arg_474_0.backtrack or 0
		slot_474_9_0 = math.max(0, slot_474_1_0.m_iHealth or 0)
		slot_474_10_0 = math.floor(slot_474_4_0)

		if slot_474_10_0 <= 0 then
			slot_474_10_0 = math.floor(slot_474_5_0)
		end

		slot_474_11_0 = var_368_99(slot_474_1_0)

		if not slot_474_11_0 then
			slot_474_12_1, slot_474_13_1 = pcall(function()
				return slot_474_1_0:is_alive()
			end)

			if slot_474_12_1 and slot_474_13_1 == false then
				slot_474_11_0 = true
			elseif slot_474_9_0 <= 0 and slot_474_10_0 > 0 then
				slot_474_11_0 = true
			end
		end

		slot_474_12_0 = math.floor(tonumber(slot_474_8_0) or 0)
		slot_474_13_0 = math.floor(tonumber(slot_474_6_0) or 0)

		if slot_474_7_0 == nil then
			slot_474_14_1 = slot_474_1_0:get_name()
			slot_474_15_1 = tostring(slot_474_2_0 or "body")

			if slot_474_11_0 then
				slot_474_16_3 = var_368_8("m", var_368_26(slot_0_78_0.hitlogs.hit) .. "Destroyed ", "h", slot_474_14_1)
				slot_474_17_3 = var_368_10(slot_474_16_3)

				var_368_37(slot_474_17_3, slot_474_16_3, "skull")
			elseif slot_474_10_0 <= 0 then
				slot_474_16_2 = var_368_8("m", var_368_26(slot_0_78_0.hitlogs.hit) .. "Hit ", "h", slot_474_14_1, "m", "'s ", "h", slot_474_15_1, "m", slot_474_12_0 > 0 and "  ~  Δ: " or "", "h", slot_474_12_0 > 0 and slot_474_12_0 or "", "m", slot_474_12_0 > 0 and "t" or "")
				slot_474_17_2 = var_368_10(slot_474_16_2)

				var_368_37(slot_474_17_2, slot_474_16_2, "hit")
			else
				slot_474_16_1 = var_368_8("m", var_368_26(slot_0_78_0.hitlogs.hit) .. "Hit ", "h", slot_474_14_1, "m", "'s ", "h", slot_474_15_1, "m", " for ", "h", slot_474_10_0, "m", " hp", "m", slot_474_12_0 > 0 and "  ~  Δ: " or "", "h", slot_474_12_0 > 0 and slot_474_12_0 or "", "m", slot_474_12_0 > 0 and "t" or "")
				slot_474_17_1 = var_368_10(slot_474_16_1)

				var_368_37(slot_474_17_1, slot_474_16_1, "hit")
			end

			slot_0_78_0.hitlogs.hit = slot_0_78_0.hitlogs.hit + 1
		else
			slot_474_14_0 = slot_474_1_0:get_name()
			slot_474_15_0 = tostring(slot_474_3_0 or "body")
			slot_474_16_0 = var_368_8("m", var_368_26(slot_0_78_0.hitlogs.miss) .. "Missed ", "h", slot_474_14_0, "m", "'s ", "h", slot_474_15_0, "m", " due to ", "h", tostring(slot_474_7_0), "m", "  ~  dmg: ", "h", math.floor(tonumber(slot_474_5_0) or 0), "m", ", hc: ", "h", slot_474_13_0, "m", "%", "m", slot_474_12_0 > 0 and ", Δ: " or "", "h", slot_474_12_0 > 0 and slot_474_12_0 or "", "m", slot_474_12_0 > 0 and "t" or "")
			slot_474_17_0 = var_368_10(slot_474_16_0)

			var_368_37(slot_474_17_0, slot_474_16_0, "miss")

			slot_0_78_0.hitlogs.miss = slot_0_78_0.hitlogs.miss + 1
		end
	end

	local function var_368_104(arg_476_0)
		if not slot_0_152_0.vars.logs:get() then
			return
		end

		local var_476_0 = entity.get_local_player()

		if not var_476_0 then
			return
		end

		local var_476_1 = entity.get(arg_476_0.attacker, true)

		if entity.get(arg_476_0.userid, true) == var_476_0 and var_476_1 and var_368_22("Harmed") then
			local var_476_2 = var_368_11[arg_476_0.hitgroup] or "generic"
			local var_476_3 = var_368_8("m", "Harmed by ", "h", var_476_1:get_name(), "m", " in the ", "h", var_476_2, "m", " for ", "h", arg_476_0.dmg_health or 0, "m", " damage (", "h", arg_476_0.health or 0, "m", " health remaining)")
			local var_476_4 = var_368_10(var_476_3)

			var_368_37(var_476_4, var_476_3, "harmed")
		end
	end

	local function var_368_105(arg_477_0)
		if not slot_0_152_0.vars.logs:get() or not var_368_22("Purchases") then
			return
		end

		local var_477_0 = entity.get(arg_477_0.userid, true)
		local var_477_1 = arg_477_0.weapon

		if not var_477_0 or not var_477_0:is_enemy() or var_477_1 == "weapon_unknown" then
			return
		end

		local var_477_2 = var_368_8("h", var_477_0:get_name(), "m", " bought ", "h", var_477_1)

		if var_368_24("Console") then
			print_raw(var_368_10(var_477_2))
		end
	end

	pcall(function()
		if events.aim_ack then
			events.aim_ack:set(function(arg_479_0)
				local var_479_0, var_479_1 = pcall(var_368_103, arg_479_0)

				if not var_479_0 then
					print_raw("\aD35050FF[amnesia.plus]\aFFFFFFFF error(aim_ack): " .. tostring(var_479_1))
				end

				pcall(function()
					if slot_0_78_0.hc_manip_on_aim_ack then
						slot_0_78_0.hc_manip_on_aim_ack(arg_479_0)
					end
				end)
				pcall(function()
					if slot_0_78_0.dormant_aim_on_ack then
						slot_0_78_0.dormant_aim_on_ack(arg_479_0)
					end
				end)

				local var_479_2, var_479_3 = pcall(var_368_18, arg_479_0)

				if not var_479_2 then
					print_raw("\aD35050FF[amnesia.plus]\aFFFFFFFF error(stats aim_ack): " .. tostring(var_479_3))
				end
			end)
		end

		events.player_hurt:set(function(arg_482_0)
			local var_482_0, var_482_1 = pcall(var_368_100, arg_482_0)

			if not var_482_0 then
				print_raw("\aD35050FF[amnesia.plus]\aFFFFFFFF error(evade hurt): " .. tostring(var_482_1))
			end

			local var_482_2, var_482_3 = pcall(var_368_104, arg_482_0)

			if not var_482_2 then
				print_raw("\aD35050FF[amnesia.plus]\aFFFFFFFF error(player_hurt): " .. tostring(var_482_3))
			end

			pcall(function()
				if slot_0_78_0.dormant_aim_on_hurt then
					slot_0_78_0.dormant_aim_on_hurt(arg_482_0)
				end
			end)
		end)
		events.item_purchase:set(function(arg_484_0)
			local var_484_0, var_484_1 = pcall(var_368_105, arg_484_0)

			if not var_484_0 then
				print_raw("\aD35050FF[amnesia.plus]\aFFFFFFFF error(item_purchase): " .. tostring(var_484_1))
			end
		end)
	end)

	slot_0_78_0.log_prefix = var_368_0
	slot_0_78_0.log_accent_hex = var_368_6()
	slot_0_78_0.elog_accent_hex = var_368_6
	slot_0_78_0.elog_accent_markup = var_368_7
	slot_0_78_0.aa_brute_log = var_368_43
	slot_0_78_0.aa_brute_reset_log = var_368_44
	slot_0_78_0.cfg_log_notify = var_368_42
	slot_0_78_0.logs_mode_enabled = var_368_22
	slot_0_78_0.ELOG_TTL_SEC = var_368_27
	slot_0_78_0.ELOG_FADE_SEC = var_368_28
	slot_0_78_0.ELOG_MAX_ROWS = var_368_29
	_G.elog_screen_fmt = var_368_8
	_G.ELOG_SCREEN_MUTED = var_368_2
	_G.ELOG_SCREEN_HI = var_368_3
	_G.screen_log_hud_enabled = var_368_30
	_G.screen_log_has_forced = var_368_36
	_G.evade_try_bullet = var_368_102
	slot_0_78_0.track_death_log = var_368_98
	slot_0_78_0.personal_stats_on_player_death = var_368_19
end)()
;(function()
	slot_485_0_0 = {
		slot_0_109_0.antiaim.builder
	}

	for iter_485_0 = 1, #AA_CONDITIONS do
		slot_485_0_0[#slot_485_0_0 + 1] = slot_0_109_0.antiaim.build_slot_main[iter_485_0]
		slot_485_0_0[#slot_485_0_0 + 1] = slot_0_109_0.antiaim.build_slot_yaw[iter_485_0]
		slot_485_0_0[#slot_485_0_0 + 1] = slot_0_109_0.antiaim.build_slot_mod[iter_485_0]
		slot_485_0_0[#slot_485_0_0 + 1] = slot_0_109_0.antiaim.build_slot_body[iter_485_0]
		slot_485_0_0[#slot_485_0_0 + 1] = slot_0_109_0.antiaim.build_slot_misc[iter_485_0]
	end

	slot_485_1_0 = {
		slot_0_109_0.antiaim.defensive,
		slot_0_109_0.antiaim.defensive1
	}

	for iter_485_1 = 1, #AA_CONDITIONS_DEF do
		slot_485_1_0[#slot_485_1_0 + 1] = slot_0_109_0.antiaim.def_slot_main[iter_485_1]
		slot_485_1_0[#slot_485_1_0 + 1] = slot_0_109_0.antiaim.def_slot_pitch[iter_485_1]
		slot_485_1_0[#slot_485_1_0 + 1] = slot_0_109_0.antiaim.def_slot_yaw[iter_485_1]
	end

	slot_0_152_0.antiaim.main_selector, slot_0_152_0.antiaim.main_selector_int = slot_0_108_0(slot_0_109_0.antiaim.selector, {
		{
			"\x01\f<compass>\r\tGeneral",
			{
				slot_0_109_0.antiaim.general
			}
		},
		{
			"\x01\f<cubes>\r\tBuilder",
			slot_485_0_0
		},
		{
			"\x01\f<shield-halved>\r\tDefensive",
			slot_485_1_0
		}
	})

	function slot_485_2_0()
		local var_486_0 = slot_0_152_0.antiaim.settings and slot_0_152_0.antiaim.settings.profile

		if not var_486_0 or type(var_486_0.get) ~= "function" then
			return false
		end

		local var_486_1, var_486_2 = pcall(function()
			return var_486_0:get()
		end)

		if not var_486_1 or var_486_2 == nil then
			return false
		end

		if type(var_486_2) == "number" then
			return var_486_2 == 2
		end

		return tostring(var_486_2):lower():find("unmatched", 1, true) ~= nil
	end

	function slot_485_3_0()
		return slot_485_2_0() ~= true
	end

	function slot_485_4_0()
		local var_489_0 = slot_0_152_0.antiaim.main_selector
		local var_489_1 = slot_0_152_0.antiaim.main_selector_int

		if not var_489_0 or not var_489_1 then
			return
		end

		if slot_485_2_0() then
			local var_489_2 = 1

			pcall(function()
				var_489_2 = tonumber(var_489_1:get()) or 1
			end)

			if var_489_2 == 3 then
				pcall(function()
					var_489_0:set(1)
					var_489_1:set(1)
				end)
			end

			if slot_0_78_0.def then
				if type(slot_0_78_0.def.disarm) == "function" then
					slot_0_78_0.def.disarm()
				end

				if type(slot_0_78_0.def.snap_reset) == "function" then
					slot_0_78_0.def.snap_reset()
				end
			end
		end
	end

	slot_0_152_0.antiaim.main_selector:set_callback(function()
		local var_492_0 = slot_0_152_0.antiaim.main_selector
		local var_492_1 = slot_0_152_0.antiaim.main_selector_int

		if not var_492_0 or not var_492_1 then
			return
		end

		local var_492_2 = tonumber(var_492_0:get()) or 1

		if slot_485_2_0() and var_492_2 == 3 then
			pcall(function()
				var_492_0:set(1)
				var_492_1:set(1)
			end)

			return
		end

		pcall(function()
			var_492_1:set(var_492_2)
		end)
	end)
	slot_0_152_0.antiaim.settings.profile:set_callback(slot_485_4_0)
	utils.execute_after(0, slot_485_4_0)

	slot_485_5_0 = {
		slot_0_152_0.antiaim.settings.profile,
		slot_485_3_0
	}

	for iter_485_2 = 1, #AA_CONDITIONS do
		slot_485_10_1 = slot_0_109_0.antiaim.build_slot_main[iter_485_2]
		slot_485_11_1 = slot_0_109_0.antiaim.build_slot_yaw[iter_485_2]
		slot_485_12_1 = slot_0_109_0.antiaim.build_slot_mod[iter_485_2]
		slot_485_13_1 = slot_0_109_0.antiaim.build_slot_body[iter_485_2]
		slot_485_14_0 = slot_0_109_0.antiaim.build_slot_misc[iter_485_2]
		slot_485_15_0 = {
			enabled = slot_485_10_1:switch("\x01\f<brackets-curly>\r\tOverride " .. string.lower(AA_CONDITIONS[iter_485_2]), false),
			offset = slot_485_11_1:slider("\x01\f<arrow-right-arrow-left>\r\tOffset", -180, 180, 0, nil, "°"),
			yaw = slot_485_11_1:combo("\x01\f<caret-down>\r\tYaw", {
				"Disabled",
				"Backward",
				"Static"
			}, 0, function(arg_495_0)
				return {
					method = arg_495_0:combo("\x01\f<diagram-project>\r\tMethod", "180", "Flick", "Sway", "Sync"),
					yaw_delay = arg_495_0:slider("\x01\f<timer>\r\tDelay", 1, 64, 1, nil, "t"),
					yaw_speed = arg_495_0:slider("\x01\f<gauge-simple-high>\r\tSpeed", 1, 100, 50, nil, "%")
				}
			end),
			yaw_add_left = slot_485_11_1:slider("\x01\f<arrow-left>\r\tAdd Left", -180, 180, 0, nil, "°"),
			yaw_add_right = slot_485_11_1:slider("\x01\f<arrow-right>\r\tAdd Right", -180, 180, 0, nil, "°")
		}
		slot_485_15_0.yaw.yaw_add_left = slot_485_15_0.yaw_add_left
		slot_485_15_0.yaw.yaw_add_right = slot_485_15_0.yaw_add_right
		slot_485_15_0.yaw_mod = slot_485_12_1:combo("\x01\f<arrows-rotate>\r\tModifier", {
			"Disabled",
			"Amnesic",
			"Center",
			"Offset",
			"Random",
			"Spin",
			"Jitter",
			"Ways",
			"Rotate",
			"Skitter"
		}, 0, function(arg_496_0)
			return {
				add_yaw = arg_496_0:switch("\x01\f<arrow-right-arrow-left>\r\tAdd Yaw", false),
				mod_ignore_delay = arg_496_0:switch("\x01\f<arrows-rotate>\r\tModifier ignore delay", false),
				add_left = arg_496_0:slider("\x01\f<arrow-left>\r\tAdd Left", -60, 60, 0, 1, "°"),
				add_right = arg_496_0:slider("\x01\f<arrow-right>\r\tAdd Right", -60, 60, 0, 1, "°"),
				randomize = arg_496_0:slider("\x01\f<chart-scatter>\r\tRandomize", 0, 100, 0, 1, "%"),
				mod_delay = arg_496_0:combo("\x01\f<timer>\r\tModifier Delay", {
					"None",
					"Static",
					"Fluctuate",
					"Random"
				}, 0),
				mod_delay_ticks = arg_496_0:slider("\x01\f<arrow-right-to-arc>\r\tDelay Ticks", 1, 16, 4, 1, "t"),
				auto_min = arg_496_0:slider("\x01\f<arrow-left>\r\tAuto Min", -180, 180, -64, 1, "°"),
				auto_max = arg_496_0:slider("\x01\f<arrow-right>\r\tAuto Max", -180, 180, 33, 1, "°"),
				auto_alt_chance = arg_496_0:slider("\x01\f<percent>\r\tAlt Range Chance", 0, 100, 20, 1, "%"),
				auto_alt_min = arg_496_0:slider("\x01\f<arrow-left>\r\tAlt Min", -180, 180, -33, 1, "°"),
				auto_alt_max = arg_496_0:slider("\x01\f<arrow-right>\r\tAlt Max", -180, 180, 12, 1, "°"),
				sweep_steps = arg_496_0:slider("\x01\f<wave-square>\r\tSteps", 3, 8, 4, 1)
			}
		end)
		slot_485_15_0.mod_offset = slot_485_12_1:slider("\x01\f<grip-lines>\r\tOffset", -180, 180, 0)
		slot_485_15_0.yaw_mod.offset = slot_485_15_0.mod_offset
		slot_485_15_0.body_yaw = slot_485_13_1:combo("\x01\f<angle>\r\tDesync", {
			"Disabled",
			"Static",
			"Jitter",
			"Sway",
			"Amnesia"
		}, 0, function(arg_497_0)
			return {
				inverter = arg_497_0:switch("\x01\f<repeat>\r\tInverter", false),
				avoid_overlap = arg_497_0:switch("\x01\f<layer-group>\r\tAvoid Overlap", false),
				fake_options = arg_497_0:selectable("\x01\f<clipboard-list-check>\r\tOptions", {
					"Jitter",
					"Randomize jitter"
				}, 0, ""),
				body_fs = arg_497_0:combo("\x01\f<arrows-turn-to-dots>\r\tBody Freestanding", {
					"Off",
					"Peek Fake",
					"Peek Real"
				}, 0),
				left_limit = arg_497_0:slider("\x01\f<caret-left>\r\tLeft limit", 0, 60, 58),
				right_limit = arg_497_0:slider("\x01\f<caret-right>\r\tRight limit", 0, 60, 58),
				extra_limit = arg_497_0:slider("\x01\f<retweet>\r\tExtra limit", 0, 10, 0, 0.5, "x"),
				min_limit = arg_497_0:slider("\x01\f<minus>\r\tMin limit", -60, 60, 44),
				max_limit = arg_497_0:slider("\x01\f<plus>\r\tMax limit", -60, 60, 58),
				sway_speed = arg_497_0:slider("\x01\f<integral>\r\tSpeed", 1, 100, 1, nil, "%"),
				sway_back = arg_497_0:switch("\x01\f<repeat>\r\tSway Back", false),
				jitter_randomness = arg_497_0:slider("\x01\f<superscript>\r\tRandomness", 0, 16, 0, 1)
			}
		end)
		slot_485_15_0.switch_delay = slot_485_14_0:combo("\x01\f<timer>\r\tDelay", {
			"None",
			"Static",
			"Fluctuate",
			"Random"
		}, 0)
		slot_485_15_0.switch_ticks = slot_485_14_0:slider("\x01\f<arrow-right-to-arc>\r\tAmount", 1, 16, 4, 1, "t")
		slot_0_152_0.antiaim.builder_states[iter_485_2] = slot_485_15_0
	end

	for iter_485_3 = 1, #AA_CONDITIONS_DEF do
		slot_485_10_0 = slot_0_109_0.antiaim.def_slot_main[iter_485_3]
		slot_485_11_0 = slot_0_109_0.antiaim.def_slot_pitch[iter_485_3]
		slot_485_12_0 = slot_0_109_0.antiaim.def_slot_yaw[iter_485_3]
		slot_485_13_0 = {
			enabled = slot_485_10_0:switch("\x01\f<brackets-curly>\r\tOverride " .. string.lower(AA_CONDITIONS_DEF[iter_485_3]), false),
			mode = slot_485_10_0:combo("\x01\f<shield>\r\tDefensive type", "None", "Default", "Custom"),
			force_lc = slot_485_10_0:switch("\x01\f<arrow-up-left-from-circle>\r\tForce LC", false),
			duration = slot_485_10_0:slider("\x01\f<timer>\r\tDuration", 1, 13, 13, 1, "t"),
			pitch = slot_485_11_0:combo("\x01\f<caret-up>\r\tPitch", {
				"Off",
				"Static",
				"Jitter",
				"Random",
				"Random Static",
				"Spin",
				"Spin Full",
				"Camera",
				"At target"
			}, 0),
			pitch_angle = slot_485_11_0:slider("\x01\f<sliders>\r\tAngle", -89, 89, -89),
			pitch_angle2 = slot_485_11_0:slider("\x01\f<sliders>\r\tAngle 2", -89, 89, 89),
			pitch_speed = slot_485_11_0:slider("\x01\f<gauge-simple-high>\r\tSpeed", -50, 50, 20, 0.1, "")
		}
		slot_485_13_0.pitch.angle = slot_485_13_0.pitch_angle
		slot_485_13_0.pitch.angle2 = slot_485_13_0.pitch_angle2
		slot_485_13_0.pitch.speed = slot_485_13_0.pitch_speed
		slot_485_13_0.yaw = slot_485_12_0:combo("\x01\f<caret-down>\r\tYaw", {
			"Off",
			"Static",
			"Jitter",
			"Switch",
			"Random",
			"Random Jitter",
			"Random Static",
			"Spin",
			"Spin Full",
			"Spin Jitter",
			"Sway",
			"Ways",
			"Peek",
			"90w",
			"180v",
			"Opposite"
		}, 0)
		slot_485_13_0.yaw_angle = slot_485_12_0:slider("\x01\f<arrows-left-right>\r\tAngle", 0, 360, 180, 1, "°")
		slot_485_13_0.yaw_angle2 = slot_485_12_0:slider("\x01\f<arrows-left-right>\r\tAngle 2", 0, 360, 90, 1, "°")
		slot_485_13_0.yaw_delay = slot_485_12_0:slider("\x01\f<timer>\r\tDelay", 0, 14, 0, 1, "t")
		slot_485_13_0.yaw_speed = slot_485_12_0:slider("\x01\f<gauge-simple-high>\r\tSpeed", -50, 50, 20, 0.1, "")
		slot_485_13_0.yaw_ways = slot_485_12_0:slider("\x01\f<layer-group>\r\tWays", 2, 8, 4, 1)
		slot_485_13_0.yaw.angle = slot_485_13_0.yaw_angle
		slot_485_13_0.yaw.angle2 = slot_485_13_0.yaw_angle2
		slot_485_13_0.yaw.delay = slot_485_13_0.yaw_delay
		slot_485_13_0.yaw.speed = slot_485_13_0.yaw_speed
		slot_485_13_0.yaw.ways = slot_485_13_0.yaw_ways
		slot_0_152_0.antiaim.defensive_states[iter_485_3] = slot_485_13_0
	end
end)()
;(function()
	slot_498_0_0 = {
		"Disabled",
		"Amnesic",
		"Center",
		"Offset",
		"Random",
		"Spin",
		"Jitter",
		"Ways",
		"Rotate",
		"Skitter"
	}

	function slot_498_1_0(arg_499_0)
		if not arg_499_0 or type(arg_499_0.get) ~= "function" then
			return false
		end

		local var_499_0, var_499_1 = pcall(function()
			return arg_499_0:get()
		end)

		return var_499_0 and (var_499_1 == true or var_499_1 == 1)
	end

	function slot_498_2_0(arg_501_0, arg_501_1)
		arg_501_1 = arg_501_1 or "None"

		if not arg_501_0 or type(arg_501_0.get) ~= "function" then
			return false
		end

		local var_501_0, var_501_1 = pcall(function()
			return arg_501_0:get()
		end)

		if not var_501_0 or var_501_1 == nil then
			return false
		end

		if type(var_501_1) == "number" then
			return var_501_1 ~= 0
		end

		return tostring(var_501_1) ~= tostring(arg_501_1)
	end

	slot_498_3_0 = {
		"Disabled",
		"Static",
		"Jitter",
		"Sway",
		"Amnesia"
	}

	function slot_498_4_0(arg_503_0)
		if not arg_503_0 or type(arg_503_0.get) ~= "function" then
			return "Disabled"
		end

		local var_503_0, var_503_1 = pcall(function()
			return arg_503_0:get()
		end)

		if not var_503_0 or var_503_1 == nil then
			return "Disabled"
		end

		if type(var_503_1) == "number" then
			local var_503_2 = math.floor(var_503_1)

			if var_503_2 >= 0 and var_503_2 < #slot_498_0_0 then
				return slot_498_0_0[var_503_2 + 1]
			end

			if var_503_2 >= 1 and var_503_2 <= #slot_498_0_0 then
				return slot_498_0_0[var_503_2]
			end

			return "Disabled"
		end

		local var_503_3 = tostring(var_503_1)

		if var_503_3 == "Automatic" then
			return "Amnesic"
		end

		return var_503_3
	end

	function slot_498_5_0(arg_505_0, ...)
		local var_505_0 = slot_498_4_0(arg_505_0)

		for iter_505_0 = 1, select("#", ...) do
			if var_505_0 == select(iter_505_0, ...) then
				return true
			end
		end

		return false
	end

	function slot_498_6_0(arg_506_0)
		return slot_498_4_0(arg_506_0) ~= "Disabled"
	end

	function slot_498_7_0(arg_507_0)
		if not arg_507_0 or type(arg_507_0.get) ~= "function" then
			return "Disabled"
		end

		local var_507_0, var_507_1 = pcall(function()
			return arg_507_0:get()
		end)

		if not var_507_0 or var_507_1 == nil then
			return "Disabled"
		end

		if type(var_507_1) == "number" then
			return slot_498_3_0[var_507_1 + 1] or slot_498_3_0[var_507_1] or "Disabled"
		end

		return tostring(var_507_1)
	end

	function slot_498_8_0(arg_509_0, ...)
		local var_509_0 = slot_498_7_0(arg_509_0)

		for iter_509_0 = 1, select("#", ...) do
			if var_509_0 == select(iter_509_0, ...) then
				return true
			end
		end

		return false
	end

	function slot_498_9_0(arg_510_0)
		return slot_498_2_0(arg_510_0, "Disabled")
	end

	function slot_498_10_0(arg_511_0)
		local var_511_0 = arg_511_0.body_yaw

		if not var_511_0 then
			return
		end

		local function var_511_1()
			local var_512_0 = slot_498_8_0(var_511_0, "Jitter")

			if var_511_0.jitter_randomness and type(var_511_0.jitter_randomness.visibility) == "function" then
				var_511_0.jitter_randomness:visibility(var_512_0)
			end
		end

		local function var_511_2()
			local var_513_0 = slot_498_8_0(var_511_0, "Static")

			if var_511_0.extra_limit and type(var_511_0.extra_limit.visibility) == "function" then
				var_511_0.extra_limit:visibility(var_513_0)
			end

			if var_511_0.inverter and type(var_511_0.inverter.visibility) == "function" then
				var_511_0.inverter:visibility(var_513_0)
			end
		end

		local function var_511_3()
			local var_514_0 = slot_498_8_0(var_511_0, "Static", "Jitter")

			if var_511_0.left_limit and type(var_511_0.left_limit.visibility) == "function" then
				var_511_0.left_limit:visibility(var_514_0)
			end

			if var_511_0.right_limit and type(var_511_0.right_limit.visibility) == "function" then
				var_511_0.right_limit:visibility(var_514_0)
			end
		end

		local function var_511_4()
			local var_515_0 = slot_498_8_0(var_511_0, "Amnesia")

			local function var_515_1(arg_516_0, arg_516_1)
				if arg_516_0 and type(arg_516_0.visibility) == "function" then
					arg_516_0:visibility(arg_516_1 and not var_515_0)
				end
			end

			if var_515_0 then
				for iter_515_0, iter_515_1 in ipairs({
					"avoid_overlap",
					"fake_options",
					"body_fs",
					"left_limit",
					"right_limit",
					"extra_limit",
					"min_limit",
					"max_limit",
					"sway_speed",
					"sway_back",
					"jitter_randomness",
					"inverter"
				}) do
					var_515_1(var_511_0[iter_515_1], false)
				end

				return
			end

			var_511_1()
			var_511_2()
			var_511_3()
		end

		if type(var_511_0.set_callback) == "function" then
			var_511_0:set_callback(var_511_4)
		end

		var_511_4()
	end

	function slot_498_11_0(arg_517_0)
		local var_517_0 = arg_517_0.yaw_mod

		if not var_517_0 or not var_517_0.add_yaw then
			return
		end

		local function var_517_1()
			local var_518_0 = slot_498_6_0(var_517_0) and not slot_498_5_0(var_517_0, "Amnesic") and slot_498_1_0(var_517_0.add_yaw)

			if var_517_0.add_left and type(var_517_0.add_left.visibility) == "function" then
				var_517_0.add_left:visibility(var_518_0)
			end

			if var_517_0.add_right and type(var_517_0.add_right.visibility) == "function" then
				var_517_0.add_right:visibility(var_518_0)
			end
		end

		local function var_517_2()
			local var_519_0 = slot_498_6_0(var_517_0) and slot_498_2_0(var_517_0.mod_delay, "None")

			if var_517_0.mod_delay_ticks and type(var_517_0.mod_delay_ticks.visibility) == "function" then
				var_517_0.mod_delay_ticks:visibility(var_519_0)
			end

			if var_517_0.mod_ignore_delay and type(var_517_0.mod_ignore_delay.visibility) == "function" then
				var_517_0.mod_ignore_delay:visibility(var_519_0)
			end
		end

		local function var_517_3()
			local var_520_0 = slot_498_5_0(var_517_0, "Amnesic")

			for iter_520_0, iter_520_1 in ipairs({
				var_517_0.auto_min,
				var_517_0.auto_max,
				var_517_0.auto_alt_chance,
				var_517_0.auto_alt_min,
				var_517_0.auto_alt_max
			}) do
				if iter_520_1 and type(iter_520_1.visibility) == "function" then
					iter_520_1:visibility(var_520_0)
				end
			end
		end

		local function var_517_4()
			var_517_1()
			var_517_2()
			var_517_3()
		end

		if type(var_517_0.add_yaw.set_callback) == "function" then
			var_517_0.add_yaw:set_callback(var_517_1)
		end

		if var_517_0.mod_delay and type(var_517_0.mod_delay.set_callback) == "function" then
			var_517_0.mod_delay:set_callback(var_517_2)
		end

		if type(var_517_0.set_callback) == "function" then
			var_517_0:set_callback(var_517_4)
		end

		var_517_4()
	end

	for iter_498_0 = 1, #AA_CONDITIONS do
		slot_498_16_1 = slot_0_152_0.antiaim.builder_states[iter_498_0]
		slot_498_17_1 = slot_0_78_0.aa_state_slot_dep(slot_0_152_0.antiaim.build_state, iter_498_0, AA_CONDITIONS)
		slot_498_18_1 = {
			slot_498_16_1.enabled,
			function()
				return iter_498_0 == 1 or slot_498_16_1.enabled:get()
			end
		}

		if iter_498_0 == 1 then
			slot_498_16_1.enabled:visibility(false)
		else
			slot_498_16_1.enabled:depend({
				slot_0_152_0.antiaim.enabled,
				true
			}, {
				slot_0_152_0.antiaim.main_selector_int,
				2
			}, slot_498_17_1)
		end

		slot_498_16_1.yaw:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1)
		slot_498_16_1.offset:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw,
			function()
				return slot_498_9_0(slot_498_16_1.yaw)
			end
		})
		slot_498_16_1.yaw_mod:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1)
		slot_498_16_1.mod_offset:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw_mod,
			function()
				return slot_498_5_0(slot_498_16_1.yaw_mod, "Center", "Offset", "Random", "Spin", "Jitter", "Rotate", "Skitter")
			end
		})
		slot_498_16_1.yaw_mod.sweep_steps:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw_mod,
			function()
				return slot_498_5_0(slot_498_16_1.yaw_mod, "Ways")
			end
		})

		slot_498_19_0 = {
			slot_0_152_0.antiaim.enabled,
			true
		}
		slot_498_20_0 = {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}
		slot_498_21_0 = slot_498_17_1
		slot_498_22_0 = slot_498_18_1
		slot_498_23_0 = {
			slot_498_16_1.yaw_mod,
			function()
				return slot_498_5_0(slot_498_16_1.yaw_mod, "Amnesic")
			end
		}

		slot_498_16_1.yaw_mod.auto_min:depend(slot_498_19_0)
		slot_498_16_1.yaw_mod.auto_max:depend(slot_498_19_0)
		slot_498_16_1.yaw_mod.auto_alt_chance:depend(slot_498_19_0)
		slot_498_16_1.yaw_mod.auto_alt_min:depend(slot_498_19_0)
		slot_498_16_1.yaw_mod.auto_alt_max:depend(slot_498_19_0)
		slot_498_16_1.yaw_mod.add_yaw:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw_mod,
			function()
				return slot_498_6_0(slot_498_16_1.yaw_mod) and not slot_498_5_0(slot_498_16_1.yaw_mod, "Amnesic")
			end
		})
		slot_498_16_1.yaw_mod.add_left:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw_mod,
			function()
				return slot_498_6_0(slot_498_16_1.yaw_mod) and not slot_498_5_0(slot_498_16_1.yaw_mod, "Amnesic")
			end
		}, {
			slot_498_16_1.yaw_mod.add_yaw,
			true
		})
		slot_498_16_1.yaw_mod.add_right:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw_mod,
			function()
				return slot_498_6_0(slot_498_16_1.yaw_mod) and not slot_498_5_0(slot_498_16_1.yaw_mod, "Amnesic")
			end
		}, {
			slot_498_16_1.yaw_mod.add_yaw,
			true
		})
		slot_498_16_1.yaw_mod.randomize:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw_mod,
			function()
				return slot_498_6_0(slot_498_16_1.yaw_mod)
			end
		})
		slot_498_16_1.yaw_mod.mod_delay:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw_mod,
			function()
				return slot_498_6_0(slot_498_16_1.yaw_mod)
			end
		})
		slot_498_16_1.yaw_mod.mod_delay_ticks:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw_mod,
			function()
				return slot_498_6_0(slot_498_16_1.yaw_mod)
			end
		}, {
			slot_498_16_1.yaw_mod.mod_delay,
			function()
				return slot_498_2_0(slot_498_16_1.yaw_mod.mod_delay, "None")
			end
		})
		slot_498_16_1.yaw_mod.mod_ignore_delay:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw_mod,
			function()
				return slot_498_6_0(slot_498_16_1.yaw_mod)
			end
		}, {
			slot_498_16_1.yaw_mod.mod_delay,
			function()
				return slot_498_2_0(slot_498_16_1.yaw_mod.mod_delay, "None")
			end
		})
		slot_498_16_1.body_yaw:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1)
		slot_498_16_1.body_yaw.avoid_overlap:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			function()
				return not slot_498_8_0(slot_498_16_1.body_yaw, "Disabled", "Amnesia")
			end
		})
		slot_498_16_1.body_yaw.fake_options:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			function()
				return slot_498_8_0(slot_498_16_1.body_yaw, "Static", "Sway")
			end
		})
		slot_498_16_1.body_yaw.body_fs:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			function()
				return not slot_498_8_0(slot_498_16_1.body_yaw, "Disabled", "Amnesia")
			end
		})
		slot_498_16_1.switch_delay:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1)
		slot_498_16_1.switch_ticks:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.switch_delay,
			function()
				return slot_498_2_0(slot_498_16_1.switch_delay, "None")
			end
		})
		slot_498_16_1.body_yaw.left_limit:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			function()
				return slot_498_8_0(slot_498_16_1.body_yaw, "Static", "Jitter")
			end
		})
		slot_498_16_1.body_yaw.right_limit:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			function()
				return slot_498_8_0(slot_498_16_1.body_yaw, "Static", "Jitter")
			end
		})
		slot_498_16_1.body_yaw.extra_limit:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			"Static"
		})
		slot_498_16_1.body_yaw.min_limit:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			"Sway"
		})
		slot_498_16_1.body_yaw.max_limit:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			"Sway"
		})
		slot_498_16_1.body_yaw.sway_speed:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			"Sway"
		})
		slot_498_16_1.body_yaw.sway_back:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			"Sway"
		})
		slot_498_16_1.body_yaw.jitter_randomness:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			function()
				return slot_498_8_0(slot_498_16_1.body_yaw, "Jitter")
			end
		})
		slot_498_16_1.yaw.method:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw,
			function()
				return slot_498_9_0(slot_498_16_1.yaw)
			end
		})
		slot_498_16_1.yaw.yaw_add_left:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw,
			function()
				return slot_498_9_0(slot_498_16_1.yaw)
			end
		})
		slot_498_16_1.yaw.yaw_add_right:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw,
			function()
				return slot_498_9_0(slot_498_16_1.yaw)
			end
		})
		slot_498_16_1.yaw.yaw_delay:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw.method,
			function()
				local var_546_0 = slot_498_16_1.yaw.method:get()

				return var_546_0 == "Flick" or var_546_0 == "Sync"
			end
		})
		slot_498_16_1.yaw.yaw_speed:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.yaw.method,
			"Sway"
		})
		slot_498_16_1.body_yaw.inverter:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			2
		}, slot_498_17_1, slot_498_18_1, {
			slot_498_16_1.body_yaw,
			"Static"
		})
		slot_498_11_0(slot_498_16_1)
		slot_498_10_0(slot_498_16_1)
	end

	for iter_498_1 = 1, #AA_CONDITIONS_DEF do
		slot_498_16_0 = slot_0_152_0.antiaim.defensive_states[iter_498_1]
		slot_498_17_0 = slot_0_78_0.aa_state_slot_dep(slot_0_152_0.antiaim.def_state, iter_498_1, AA_CONDITIONS_DEF)
		slot_498_18_0 = {
			slot_498_16_0.enabled,
			function()
				return slot_498_16_0.enabled:get()
			end
		}

		slot_498_16_0.enabled:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0)
		slot_498_16_0.mode:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0)
		slot_498_16_0.force_lc:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0)
		slot_498_16_0.duration:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			function()
				return slot_498_16_0.mode:get() ~= "None"
			end
		})
		slot_498_16_0.pitch:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			"Custom"
		})
		slot_498_16_0.pitch.angle:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			"Custom"
		}, {
			slot_498_16_0.pitch,
			function()
				local var_549_0 = slot_498_16_0.pitch:get()

				return var_549_0 ~= "Off" and var_549_0 ~= "Camera" and var_549_0 ~= "At target"
			end
		})
		slot_498_16_0.pitch.angle2:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			"Custom"
		}, {
			slot_498_16_0.pitch,
			function()
				local var_550_0 = slot_498_16_0.pitch:get()

				return var_550_0 == "Jitter" or var_550_0 == "Random" or var_550_0 == "Random Static" or var_550_0 == "Spin" or var_550_0 == "Spin Full"
			end
		})
		slot_498_16_0.pitch.speed:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			"Custom"
		}, {
			slot_498_16_0.pitch,
			function()
				local var_551_0 = slot_498_16_0.pitch:get()

				return var_551_0 == "Spin" or var_551_0 == "Spin Full"
			end
		})
		slot_498_16_0.yaw:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			"Custom"
		})
		slot_498_16_0.yaw.angle:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			"Custom"
		}, {
			slot_498_16_0.yaw,
			function()
				local var_552_0 = slot_498_16_0.yaw:get()

				return var_552_0 ~= "Off" and var_552_0 ~= "Random"
			end
		})
		slot_498_16_0.yaw.angle2:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			"Custom"
		}, {
			slot_498_16_0.yaw,
			function()
				local var_553_0 = slot_498_16_0.yaw:get()

				return var_553_0 == "Jitter" or var_553_0 == "Switch" or var_553_0 == "Random Jitter" or var_553_0 == "Random Static" or var_553_0 == "Spin Jitter" or var_553_0 == "Sway"
			end
		})
		slot_498_16_0.yaw.delay:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			"Custom"
		}, {
			slot_498_16_0.yaw,
			function()
				local var_554_0 = slot_498_16_0.yaw:get()

				return var_554_0 == "Jitter" or var_554_0 == "Switch" or var_554_0 == "Spin Jitter"
			end
		})
		slot_498_16_0.yaw.speed:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			"Custom"
		}, {
			slot_498_16_0.yaw,
			function()
				local var_555_0 = slot_498_16_0.yaw:get()

				return var_555_0 == "Spin" or var_555_0 == "Spin Full" or var_555_0 == "Spin Jitter" or var_555_0 == "Sway" or var_555_0 == "90w" or var_555_0 == "180v"
			end
		})
		slot_498_16_0.yaw.ways:depend({
			slot_0_152_0.antiaim.enabled,
			true
		}, {
			slot_0_152_0.antiaim.main_selector_int,
			3
		}, v_aa_def_allowed, slot_498_17_0, slot_498_18_0, {
			slot_498_16_0.mode,
			"Custom"
		}, {
			slot_498_16_0.yaw,
			"Ways"
		})
	end

	slot_0_78_0.aa_settings_unmatched = aa_settings_unmatched
	slot_0_78_0.aa_defensive_allowed = aa_defensive_allowed
	slot_0_78_0.aa_selector_sync = aa_selector_sync
end)()
;(function()
	function slot_556_0_0()
		local var_557_0 = slot_0_152_0.antiaim.safe_head.conditions
		local var_557_1, var_557_2 = pcall(function()
			return var_557_0:get("Air")
		end)
		local var_557_3, var_557_4 = pcall(function()
			return var_557_0:get("Air~C")
		end)

		return var_557_1 and (var_557_2 == true or var_557_2 == 1) or var_557_3 and (var_557_4 == true or var_557_4 == 1)
	end

	slot_556_1_0 = {
		slot_0_152_0.antiaim.settings.profile,
		function()
			if slot_0_78_0.aa_defensive_allowed then
				return slot_0_78_0.aa_defensive_allowed() ~= false
			end

			return true
		end
	}

	slot_0_152_0.antiaim.build_state:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		2
	})

	slot_556_2_1 = 1

	function slot_556_3_3(arg_561_0)
		if not arg_561_0 or type(arg_561_0.get) ~= "function" then
			return 1
		end

		local var_561_0, var_561_1 = pcall(function()
			return arg_561_0:get()
		end)

		if not var_561_0 or var_561_1 == nil then
			return 1
		end

		if type(var_561_1) == "number" then
			local var_561_2 = math.floor(var_561_1)

			if var_561_2 >= 0 and var_561_2 < #AA_CONDITIONS then
				return var_561_2 + 1
			end

			if var_561_2 >= 1 and var_561_2 <= #AA_CONDITIONS then
				return var_561_2
			end

			return 1
		end

		for iter_561_0 = 1, #AA_CONDITIONS do
			if var_561_1 == AA_CONDITIONS[iter_561_0] then
				return iter_561_0
			end
		end

		return 1
	end

	function slot_556_4_2()
		return slot_556_3_3(slot_0_152_0.antiaim.build_state)
	end

	function slot_556_5_1(arg_564_0, arg_564_1)
		local var_564_0 = slot_0_152_0.antiaim.build_state
		local var_564_1 = var_564_0 and var_564_0.log

		if not var_564_1 or type(var_564_1.name) ~= "function" then
			return
		end

		local var_564_2 = arg_564_1 and "\a{Link Active}" or "\aD35050FF"

		pcall(function()
			var_564_1:name("\x01" .. var_564_2 .. tostring(arg_564_0 or "—"))

			if type(var_564_1.visibility) == "function" then
				var_564_1:visibility(true)
			end
		end)
		utils.execute_after(2, function()
			pcall(function()
				if var_564_1 and type(var_564_1.visibility) == "function" then
					var_564_1:visibility(false)
				end
			end)
		end)
	end

	function slot_556_6_3(arg_568_0)
		if arg_568_0 == nil then
			return false
		end

		local var_568_0 = type(arg_568_0)

		if var_568_0 ~= "table" and var_568_0 ~= "userdata" then
			return false
		end

		return type(arg_568_0.get) == "function" and type(arg_568_0.set) == "function"
	end

	function slot_556_7_4(arg_569_0, arg_569_1, arg_569_2)
		if type(arg_569_0) ~= "table" or type(arg_569_2) ~= "function" then
			return
		end

		for iter_569_0, iter_569_1 in pairs(arg_569_0) do
			if type(iter_569_0) == "string" then
				local var_569_0 = arg_569_1 == "" and iter_569_0 or arg_569_1 .. "." .. iter_569_0

				if slot_556_6_3(iter_569_1) then
					arg_569_2(var_569_0, iter_569_1)
				end

				if type(iter_569_1) == "table" then
					slot_556_7_4(iter_569_1, var_569_0, arg_569_2)
				end
			end
		end
	end

	slot_556_8_2 = {
		["body_yaw.switch_ticks"] = "switch_ticks",
		["body_yaw.switch_delay"] = "switch_delay"
	}

	function slot_556_9_1(arg_570_0, arg_570_1)
		if not slot_556_6_3(arg_570_0) or arg_570_1 == nil then
			return false
		end

		local var_570_0 = pcall(function()
			arg_570_0:set(arg_570_1)
		end)

		if var_570_0 then
			return true
		end

		if type(arg_570_1) == "number" then
			var_570_0 = pcall(function()
				arg_570_0:set(arg_570_1 ~= 0)
			end)
		end

		return var_570_0
	end

	function slot_556_10_1()
		local var_573_0 = slot_556_4_2()
		local var_573_1 = slot_0_152_0.antiaim.builder_states[var_573_0]

		if not var_573_1 then
			slot_556_5_1("state not found", false)

			return
		end

		local var_573_2 = {}

		slot_556_7_4(var_573_1, "", function(arg_574_0, arg_574_1)
			local var_574_0, var_574_1 = pcall(function()
				return arg_574_1:get()
			end)

			if var_574_0 then
				var_573_2[arg_574_0] = var_574_1
			end
		end)

		local var_573_3 = {
			v = slot_556_2_1,
			state = AA_CONDITIONS[var_573_0],
			values = var_573_2
		}
		local var_573_4, var_573_5 = pcall(json.stringify, var_573_3)

		if not var_573_4 or type(var_573_5) ~= "string" or var_573_5 == "" then
			slot_556_5_1("copy failed", false)

			return
		end

		local var_573_6, var_573_7 = pcall(slot_0_2_0.encode, var_573_5)

		if not var_573_6 or type(var_573_7) ~= "string" or var_573_7 == "" then
			slot_556_5_1("copy failed", false)

			return
		end

		slot_0_68_0.set(string.format("amnesia.plus[Builder:%s]>%s<", AA_CONDITIONS[var_573_0], var_573_7))
		slot_556_5_1(string.format("[%s] copied", AA_CONDITIONS[var_573_0]), true)
	end

	function slot_556_11_1()
		local var_576_0 = slot_556_4_2()
		local var_576_1 = slot_0_152_0.antiaim.builder_states[var_576_0]

		if not var_576_1 then
			slot_556_5_1("state not found", false)

			return
		end

		local var_576_2, var_576_3 = (slot_0_68_0.get() or ""):match("^amnesia%.plus%[Builder:([^%]]+)%]>(.+)<$")

		if not var_576_3 or var_576_3 == "" then
			slot_556_5_1("invalid clipboard", false)

			return
		end

		local var_576_4, var_576_5 = pcall(slot_0_2_0.decode, var_576_3)

		if not var_576_4 or type(var_576_5) ~= "string" or var_576_5 == "" then
			slot_556_5_1("invalid builder data", false)

			return
		end

		local var_576_6, var_576_7 = pcall(json.parse, var_576_5)

		if not var_576_6 or type(var_576_7) ~= "table" or type(var_576_7.values) ~= "table" then
			slot_556_5_1("invalid builder data", false)

			return
		end

		if tonumber(var_576_7.v) ~= slot_556_2_1 then
			slot_556_5_1("unsupported version", false)

			return
		end

		local var_576_8 = 0
		local var_576_9 = var_576_7.values

		if var_576_1.enabled and var_576_9.enabled ~= nil and slot_556_9_1(var_576_1.enabled, var_576_9.enabled) then
			var_576_8 = var_576_8 + 1
		end

		slot_556_7_4(var_576_1, "", function(arg_577_0, arg_577_1)
			if arg_577_0 == "enabled" then
				return
			end

			local var_577_0 = var_576_9[arg_577_0]

			if var_577_0 ~= nil and slot_556_9_1(arg_577_1, var_577_0) then
				var_576_8 = var_576_8 + 1
			end
		end)

		for iter_576_0, iter_576_1 in pairs(slot_556_8_2) do
			local var_576_10 = var_576_9[iter_576_0]

			if var_576_10 ~= nil and var_576_1[iter_576_1] and var_576_9[iter_576_1] == nil and slot_556_9_1(var_576_1[iter_576_1], var_576_10) then
				var_576_8 = var_576_8 + 1
			end
		end

		local var_576_11 = var_576_2 or tostring(var_576_7.state or "?")
		local var_576_12 = AA_CONDITIONS[var_576_0]

		slot_556_5_1(string.format("%s → %s (%d fields)", var_576_11, var_576_12, var_576_8), var_576_8 > 0)
	end

	function slot_556_12_1()
		local var_578_0 = slot_556_4_2()
		local var_578_1 = slot_0_152_0.antiaim.builder_states[var_578_0]

		if not var_578_1 then
			slot_556_5_1("state not found", false)

			return
		end

		slot_556_7_4(var_578_1, "", function(arg_579_0, arg_579_1)
			if type(arg_579_1.reset) == "function" then
				pcall(function()
					arg_579_1:reset()
				end)
			end
		end)
		slot_556_5_1(string.format("[%s] reset", AA_CONDITIONS[var_578_0]), true)
	end

	pcall(function()
		if slot_0_152_0.antiaim.build_state and slot_0_152_0.antiaim.build_state.log and type(slot_0_152_0.antiaim.build_state.log.visibility) == "function" then
			slot_0_152_0.antiaim.build_state.log:visibility(false)
		end
	end)
	pcall(function()
		if slot_0_152_0.antiaim.build_state and slot_0_152_0.antiaim.build_state.export_state and type(slot_0_152_0.antiaim.build_state.export_state.set_callback) == "function" then
			slot_0_152_0.antiaim.build_state.export_state:set_callback(slot_556_10_1)
		end
	end)
	pcall(function()
		if slot_0_152_0.antiaim.build_state and slot_0_152_0.antiaim.build_state.import_state and type(slot_0_152_0.antiaim.build_state.import_state.set_callback) == "function" then
			slot_0_152_0.antiaim.build_state.import_state:set_callback(slot_556_11_1)
		end
	end)
	pcall(function()
		if slot_0_152_0.antiaim.build_state and slot_0_152_0.antiaim.build_state.reset_state and type(slot_0_152_0.antiaim.build_state.reset_state.set_callback) == "function" then
			slot_0_152_0.antiaim.build_state.reset_state:set_callback(slot_556_12_1)
		end
	end)
	slot_0_152_0.antiaim.def_state:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		3
	}, slot_556_1_0)
	slot_0_152_0.antiaim.main_selector:depend({
		slot_0_152_0.antiaim.enabled,
		true
	})
	slot_0_152_0.antiaim.settings:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	})
	slot_0_152_0.antiaim.settings.profile:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	})
	pcall(function()
		slot_0_152_0.antiaim.enabled:set_callback(function(arg_586_0)
			local var_586_0 = false

			pcall(function()
				var_586_0 = arg_586_0:get() == true
			end)

			if not var_586_0 and slot_0_152_0.antiaim.main_selector and slot_0_152_0.antiaim.main_selector_int then
				pcall(function()
					slot_0_152_0.antiaim.main_selector:set(1)
					slot_0_152_0.antiaim.main_selector_int:set(1)
				end)
			end
		end, true)
	end)

	slot_556_2_0 = {
		slot_0_152_0.antiaim.enabled,
		true
	}
	slot_556_3_2 = {
		slot_0_152_0.antiaim.main_selector_int,
		3
	}
	slot_556_4_1 = slot_556_1_0

	slot_0_152_0.antiaim.def_settings:depend(slot_556_2_0)
	slot_0_152_0.antiaim.def_settings.allow_hs:depend(slot_556_2_0)
	slot_0_152_0.antiaim.def_settings.clear_mod:depend(slot_556_2_0)
	slot_0_152_0.antiaim.def_settings.land_pitch:depend(slot_556_2_0)
	slot_0_152_0.antiaim.manual_yaw:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	})
	slot_0_152_0.antiaim.manual_yaw.static_yaw:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	}, {
		slot_0_152_0.antiaim.manual_yaw,
		function()
			return slot_0_153_0() ~= "Off"
		end
	})
	slot_0_152_0.antiaim.avoid_backstab:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	})
	slot_0_152_0.antiaim.safe_head:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	})
	slot_0_152_0.antiaim.safe_head.conditions:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	}, {
		slot_0_152_0.antiaim.safe_head,
		true
	})
	slot_0_152_0.antiaim.safe_head.height_gap:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	}, {
		slot_0_152_0.antiaim.safe_head,
		true
	})
	slot_0_152_0.antiaim.safe_head.desync_limit:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	}, {
		slot_0_152_0.antiaim.safe_head,
		true
	})
	slot_0_152_0.antiaim.safe_head.weapons:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	}, {
		slot_0_152_0.antiaim.safe_head,
		true
	}, {
		slot_0_152_0.antiaim.safe_head.conditions,
		slot_556_0_0
	})
	slot_0_152_0.antiaim.static_warmup:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	})
	slot_0_152_0.antiaim.anti_brute:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	})
	slot_0_152_0.antiaim.anti_brute.method:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	}, {
		slot_0_152_0.antiaim.anti_brute,
		true
	})
	slot_0_152_0.antiaim.anti_brute.duration:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	}, {
		slot_0_152_0.antiaim.anti_brute,
		true
	})
	slot_0_152_0.antiaim.freestand:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	})
	slot_0_152_0.antiaim.freestand.static_yaw:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	}, {
		slot_0_152_0.antiaim.freestand,
		true
	})
	slot_0_152_0.antiaim.freestand.safety_disablers:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	}, {
		slot_0_152_0.antiaim.freestand,
		true
	})
	slot_0_152_0.antiaim.legit_aa:depend({
		slot_0_152_0.antiaim.enabled,
		true
	}, {
		slot_0_152_0.antiaim.main_selector_int,
		1
	})
	setup_dynamic_switch_color(slot_0_152_0.vars.vm_adjust)
	setup_menu_gear_accent(slot_0_152_0.vars.vm_adjust.vm_fov, "\x01\f<expand>\r\tFOV")
	setup_menu_gear_accent(slot_0_152_0.vars.vm_adjust.vm_x, "\x01\f<arrows-left-right>\r\tOffset X")
	setup_menu_gear_accent(slot_0_152_0.vars.vm_adjust.vm_y, "\x01\f<arrows-up-down>\r\tOffset Y")
	setup_menu_gear_accent(slot_0_152_0.vars.vm_adjust.vm_z, "\x01\f<up-down-left-right>\r\tOffset Z")
	setup_dynamic_switch_color(slot_0_152_0.vars.crosshair_scope)
	setup_menu_gear_accent(slot_0_152_0.vars.crosshair_scope.scope_color, "\x01\f<fill>\r\tColor")
	setup_menu_gear_accent(slot_0_152_0.vars.crosshair_scope.scope_size, "\x01\f<maximize>\r\tLength")
	setup_menu_gear_accent(slot_0_152_0.vars.crosshair_scope.scope_gap, "\x01\f<grip-lines>\r\tGap")
	setup_dynamic_switch_color(slot_0_152_0.vars.crosshair_scope.scope_t_style)
	setup_dynamic_switch_color(slot_0_152_0.vars.crosshair_scope.scope_force_vm)
	setup_dynamic_switch_color(slot_0_152_0.vars.hitmarker)
	setup_dynamic_switch_color(slot_0_152_0.vars.aspect)
	setup_dynamic_switch_color(slot_0_152_0.vars.weather_manip)
	setup_dynamic_switch_color(slot_0_152_0.vars.weather_manip.sound)
	setup_menu_gear_accent(slot_0_152_0.vars.weather_manip.radius, "\x01\f<circle>\r\tRadius")
	setup_menu_gear_accent(slot_0_152_0.vars.weather_manip.width, "\x01\f<bars>\r\tWidth")
	setup_menu_gear_accent(slot_0_152_0.vars.weather_manip.alpha, "\x01\f<droplet>\r\tOpacity")
	setup_menu_gear_accent(slot_0_152_0.vars.weather_manip.volume, "\x01\f<slider>\r\tVolume")
	setup_dynamic_switch_color(slot_0_152_0.vars.logs)
	setup_dynamic_switch_color(slot_0_152_0.vars.trashtalk_enable)
	setup_dynamic_switch_color(slot_0_152_0.vars.trashtalk_enable.no_warmup)
	setup_dynamic_switch_color(slot_0_152_0.vars.trashtalk_enable.revenge)
	setup_dynamic_switch_color(slot_0_152_0.vars.clantag_enable)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_panel)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_watermark)
	setup_dynamic_listable_color(slot_0_152_0.vars.ov_watermark.wm_elements, slot_0_99_0())
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_slowdown)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_keybinds)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_keybinds.feature_icons)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_keybinds.revert)
	setup_menu_gear_accent(slot_0_152_0.vars.ov_keybinds.feature_icons, "\x01\f<icons>\r\tFeature Icons")
	setup_menu_gear_accent(slot_0_152_0.vars.ov_keybinds.revert, "\x01\f<arrow-right-arrow-left>\r\tRevert")
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_gs_inds)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_damage_ind)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_damage_ind.anim)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_damage_ind.show_state)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_metrics)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_spectators)
	setup_dynamic_switch_color(slot_0_152_0.vars.ov_arrows)
	setup_menu_gear_accent(slot_0_152_0.vars.ov_arrows, "\x01\f<location-arrow>\r\tManual Arrows")
	setup_menu_gear_accent(slot_0_152_0.vars.ov_arrows.arrows_color, "\x01\f<fill>\r\tActive color")
	setup_menu_gear_accent(slot_0_152_0.vars.ov_arrows.arrows_gap, "\x01\f<arrows-left-right-to-line>\r\tGap")
	setup_menu_gear_accent(slot_0_152_0.vars.ov_arrows.arrows_size, "\x01\f<maximize>\r\tSize")
	setup_dynamic_listable_color(slot_0_152_0.vars.ov_arrows.extra_dirs, slot_0_101_0())
	setup_dynamic_listable_color(slot_0_152_0.vars.ov_gs_inds.binds, _G.gs_bind_ids())
	setup_dynamic_listable_color(slot_0_152_0.vars.ov_keybinds.binds, _G.kb_bind_ids())
	setup_menu_gear_accent(slot_0_152_0.vars.hud_style, "\x01\f<pen-swirl>\r\tStyle")
	setup_dynamic_switch_color(slot_0_152_0.vars.hud_style.dpi_scale)
	setup_menu_gear_accent(slot_0_152_0.vars.hud_style.style_target, "\n")
	setup_menu_gear_accent(slot_0_152_0.vars.hud_style.stripe_mode, "\x01\f<palette>\r\tHUD stripe")
	setup_dynamic_switch_color(slot_0_152_0.vars.hud_style.blur)
	setup_dynamic_switch_color(slot_0_152_0.vars.hud_style.minimal_outline)
	setup_menu_gear_accent(slot_0_152_0.vars.hud_style.stripe_custom, "\x01\f<fill>\r\tStripe color")
	setup_dynamic_switch_color(slot_0_152_0.vars.hud_style.bw_unified)
	setup_menu_gear_accent(slot_0_152_0.vars.hud_style.bw_color, "\x01\f<fill>\r\tColor")
	setup_menu_gear_accent(slot_0_152_0.vars.hud_style.bw_text, "\x01\f<font>\r\tText color")
	setup_menu_gear_accent(slot_0_152_0.vars.hud_style.bw_glow, "\x01\f<sparkles>\r\tGlow color")
	setup_dynamic_switch_color(slot_0_152_0.vars.hud_style.chi_unified)
	setup_menu_gear_accent(slot_0_152_0.vars.hud_style.chi_color, "\x01\f<fill>\r\tColor")
	setup_menu_gear_accent(slot_0_152_0.vars.hud_style.chi_text, "\x01\f<font>\r\tText color")
	setup_menu_gear_accent(slot_0_152_0.vars.hud_style.chi_glow, "\x01\f<sparkles>\r\tGlow color")
	setup_dynamic_switch_color(slot_0_152_0.vars.chi_enable)
	setup_dynamic_switch_color(slot_0_152_0.vars.chi_enable.chi_flash_kill)
	setup_dynamic_selectable_color(slot_0_152_0.vars.chi_enable.chi_display, {
		"Version",
		"Condition"
	})
	setup_dynamic_listable_color(slot_0_152_0.vars.chi_enable.chi_binds, chi_bind_ids())
	setup_dynamic_switch_color(slot_0_152_0.antiaim.enabled)
	setup_dynamic_switch_color(slot_0_152_0.antiaim.static_warmup)
	setup_dynamic_switch_color(slot_0_152_0.antiaim.anti_brute)
	setup_dynamic_switch_color(slot_0_152_0.antiaim.freestand)
	setup_dynamic_switch_color(slot_0_152_0.antiaim.freestand.static_yaw)
	setup_dynamic_switch_color(slot_0_152_0.antiaim.freestand.safety_disablers)
	setup_dynamic_switch_color(slot_0_152_0.antiaim.legit_aa)
	setup_dynamic_selectable_color(slot_0_152_0.vars.logs.modes, {
		"Aimbot",
		"Purchases",
		"Evaded Shots",
		"Harmed",
		"Anti-bruteforce",
		"Configs"
	})
	setup_dynamic_selectable_color(slot_0_152_0.vars.logs.output, {
		"Console",
		"Screen"
	})
	setup_dynamic_switch_color(slot_0_152_0.vars.logs.log_counters)
	setup_menu_gear_accent(slot_0_152_0.vars.logs.log_counters, "\x01\f<list-ol>\r\tShot Counter")
	setup_dynamic_switch_color(slot_0_152_0.vars.ping_spike_unlock)
	setup_menu_gear_accent(slot_0_152_0.vars.ping_spike_unlock, "\x01\f<satellite-dish>\r\tUnlock Ping Spike")
	setup_menu_gear_accent(slot_0_152_0.vars.ping_spike_unlock.ovr, "\x01\f<gauge-simple-high>\r\tPing")
	setup_dynamic_switch_color(slot_0_152_0.vars.tick_lead)
	setup_menu_gear_accent(slot_0_152_0.vars.tick_lead, "\x01\f<sparkles>\r\tPrediction System")
	setup_menu_gear_accent(slot_0_152_0.vars.tick_lead.tier, "\x01\f<gauge-simple-high>\r\tAmount")
	setup_dynamic_switch_color(slot_0_152_0.vars.hc_manip)
	setup_menu_gear_accent(slot_0_152_0.vars.hc_manip, "\x01\f<crosshairs>\r\tHitchance Manipulations")
	setup_menu_gear_accent(slot_0_152_0.vars.hc_manip.weapon, "\x01\f<gun>\r\tWeapon group")
	setup_dynamic_switch_color(slot_0_152_0.vars.air_stop)
	setup_dynamic_switch_color(slot_0_152_0.vars.air_stop.duck)
	setup_menu_gear_accent(slot_0_152_0.vars.air_stop, "\x01\f<person-falling>\r\tAir Auto Stop")
	setup_dynamic_selectable_color(slot_0_152_0.vars.air_stop.trigger, {
		"Near target",
		"Walking"
	})
	setup_dynamic_switch_color(slot_0_152_0.vars.auto_teleport)
	setup_dynamic_selectable_color(slot_0_152_0.vars.auto_teleport.wpns, {
		"Automatics",
		"Pistols",
		"Heavy pistols",
		"Melee"
	})
	setup_menu_gear_accent(slot_0_152_0.vars.auto_teleport, "\x01\f<person-from-portal>\r\tAuto Teleport")
	setup_dynamic_switch_color(slot_0_152_0.vars.auto_hide_shots)
	setup_dynamic_switch_color(slot_0_152_0.vars.auto_hide_shots.allow_rifles)
	setup_dynamic_switch_color(slot_0_152_0.vars.auto_hide_shots.allow_deagle)
	setup_menu_gear_accent(slot_0_152_0.vars.auto_hide_shots, "\x01\f<shuffle>\r\tAuto Hide Shots")
	setup_dynamic_switch_color(slot_0_152_0.vars.adaptive_peek)
	setup_menu_gear_accent(slot_0_152_0.vars.adaptive_peek, "\x01\f<sparkles>\r\tAI Peek")
	setup_dynamic_listable_color(slot_0_152_0.vars.adaptive_peek.weapons, slot_0_104_0())
	setup_dynamic_listable_color(slot_0_152_0.vars.adaptive_peek.opts, slot_0_105_0())
	setup_menu_gear_accent(slot_0_152_0.vars.adaptive_peek.hitboxes, "\x01\f<child-reaching>\r\tHitboxes")
	setup_menu_gear_accent(slot_0_152_0.vars.adaptive_peek.min_dmg, "\x01\f<heart-crack>\r\tMin DMG")
	setup_menu_gear_accent(slot_0_152_0.vars.adaptive_peek.peek_chance, "\x01\f<crosshairs>\r\tHit Chance")
	setup_menu_gear_accent(slot_0_152_0.vars.adaptive_peek.max_enemies, "\x01\f<users>\r\tMaximum enemies threshold")
	setup_menu_gear_accent(slot_0_152_0.vars.adaptive_peek.max_distance, "\x01\f<ruler-horizontal>\r\tMaximum distance")
	setup_menu_gear_accent(slot_0_152_0.vars.adaptive_peek.delay, "\x01\f<timer>\r\tDelay")
	setup_menu_gear_accent(slot_0_152_0.vars.adaptive_peek.simulation, "\x01\f<clock>\r\tSimulation")
	setup_menu_gear_accent(slot_0_152_0.vars.adaptive_peek.visualization, "\x01\f<eye>\r\tVisualization")
	setup_dynamic_switch_color(slot_0_152_0.vars.dormant_aim)
	setup_menu_gear_accent(slot_0_152_0.vars.dormant_aim, "\x01\f<moon>\r\tDormant Aimbot")
	setup_menu_gear_accent(slot_0_152_0.vars.dormant_aim.memory, "\x01\f<wave-pulse>\r\tMin. accuracy")

	slot_556_3_1 = slot_0_152_0.vars.hc_manip_profiles

	for iter_556_0 = 1, #HC_WEAPON_GROUPS do
		slot_556_8_1 = slot_556_3_1 and slot_556_3_1[HC_WEAPON_GROUPS[iter_556_0].key]

		if slot_556_8_1 then
			setup_dynamic_switch_color(slot_556_8_1.enabled)
			setup_menu_gear_accent(slot_556_8_1.when, "\x01\f<filter>\r\tTrigger")
			setup_menu_gear_accent(slot_556_8_1.chance, "\x01\f<crosshairs>\r\tHit Chance")
			setup_menu_gear_accent(slot_556_8_1.miss_need, "\x01\f<hashtag>\r\tMiss count")
			setup_menu_gear_accent(slot_556_8_1.hp_below, "\x01\f<heart-crack>\r\tHP below")
		end
	end

	setup_dynamic_selectable_color(slot_0_152_0.vars.trashtalk_enable.conds, {
		"On Kill",
		"On Death"
	})
	setup_dynamic_switch_color(slot_0_152_0.vars.fast_ladder)
	setup_dynamic_switch_color(slot_0_152_0.vars.no_fall_damage)
	setup_dynamic_switch_color(slot_0_152_0.vars.anim_breaker)
	setup_dynamic_switch_color(slot_0_152_0.vars.anim_breaker.land_pitch_zero)
	setup_menu_gear_accent(slot_0_152_0.vars.anim_breaker, "\x01\f<fan>\r\tAnimation Breaker")
	setup_menu_gear_accent(slot_0_152_0.vars.anim_breaker.ground_legs, "\x01\f<person-walking>\r\tLegs on ground")
	setup_menu_gear_accent(slot_0_152_0.vars.anim_breaker.air_legs, "\x01\f<person-walking>\r\tLegs in air")
	setup_menu_gear_accent(slot_0_152_0.vars.anim_breaker.land_pitch_zero, "\x01\f<angle>\r\tPitch 0 on land")
	setup_dynamic_switch_color(slot_0_152_0.antiaim.avoid_backstab)
	setup_dynamic_switch_color(slot_0_152_0.antiaim.safe_head)
	setup_dynamic_selectable_color(slot_0_152_0.antiaim.safe_head.conditions, {
		"Air",
		"Air~C",
		"Stand",
		"Crouch"
	})

	for iter_556_1 = 1, #AA_CONDITIONS do
		slot_556_7_2 = slot_0_152_0.antiaim.builder_states[iter_556_1]

		setup_dynamic_switch_color(slot_556_7_2.enabled)
		setup_menu_gear_accent(slot_556_7_2.yaw, "\x01\f<caret-down>\r\tYaw")
		setup_menu_gear_accent(slot_556_7_2.yaw_mod, "\x01\f<arrows-rotate>\r\tModifier")

		if slot_556_7_2.yaw then
			setup_menu_gear_accent(slot_556_7_2.yaw.method, "\x01\f<diagram-project>\r\tMethod")
			setup_menu_gear_accent(slot_556_7_2.yaw.yaw_delay, "\x01\f<timer>\r\tDelay")
			setup_menu_gear_accent(slot_556_7_2.yaw.yaw_speed, "\x01\f<gauge-simple-high>\r\tSpeed")
		end

		if slot_556_7_2.offset then
			setup_menu_gear_accent(slot_556_7_2.offset, "\x01\f<arrow-right-arrow-left>\r\tOffset")
		end

		if slot_556_7_2.yaw_add_left then
			setup_menu_gear_accent(slot_556_7_2.yaw_add_left, "\x01\f<arrow-left>\r\tAdd Left")
		end

		if slot_556_7_2.yaw_add_right then
			setup_menu_gear_accent(slot_556_7_2.yaw_add_right, "\x01\f<arrow-right>\r\tAdd Right")
		end

		if slot_556_7_2.yaw_mod then
			setup_dynamic_switch_color(slot_556_7_2.yaw_mod.add_yaw)
			setup_dynamic_switch_color(slot_556_7_2.yaw_mod.mod_ignore_delay)
			setup_menu_gear_accent(slot_556_7_2.mod_offset, "\x01\f<grip-lines>\r\tOffset")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.sweep_steps, "\x01\f<wave-square>\r\tSteps")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.add_left, "\x01\f<arrow-left>\r\tAdd Left")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.add_right, "\x01\f<arrow-right>\r\tAdd Right")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.randomize, "\x01\f<chart-scatter>\r\tRandomize")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.mod_delay, "\x01\f<timer>\r\tModifier Delay")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.mod_delay_ticks, "\x01\f<arrow-right-to-arc>\r\tDelay Ticks")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.auto_min, "\x01\f<arrow-left>\r\tAuto Min")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.auto_max, "\x01\f<arrow-right>\r\tAuto Max")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.auto_alt_chance, "\x01\f<percent>\r\tAlt Range Chance")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.auto_alt_min, "\x01\f<arrow-left>\r\tAlt Min")
			setup_menu_gear_accent(slot_556_7_2.yaw_mod.auto_alt_max, "\x01\f<arrow-right>\r\tAlt Max")
		end

		setup_menu_gear_accent(slot_556_7_2.switch_delay, "\x01\f<timer>\r\tDelay")
		setup_menu_gear_accent(slot_556_7_2.switch_ticks, "\x01\f<arrow-right-to-arc>\r\tAmount")

		if slot_556_7_2.body_yaw then
			setup_menu_gear_accent(slot_556_7_2.body_yaw, "\x01\f<angle>\r\tDesync")

			if slot_556_7_2.body_yaw.inverter then
				setup_dynamic_switch_color(slot_556_7_2.body_yaw.inverter)
			end

			setup_dynamic_switch_color(slot_556_7_2.body_yaw.sway_back)
			setup_dynamic_switch_color(slot_556_7_2.body_yaw.avoid_overlap)
			setup_dynamic_selectable_color(slot_556_7_2.body_yaw.fake_options, {
				"Jitter",
				"Randomize jitter"
			})
			setup_menu_gear_accent(slot_556_7_2.body_yaw.body_fs, "\x01\f<arrows-turn-to-dots>\r\tBody Freestanding")
			setup_menu_gear_accent(slot_556_7_2.body_yaw.left_limit, "\x01\f<caret-left>\r\tLeft limit")
			setup_menu_gear_accent(slot_556_7_2.body_yaw.right_limit, "\x01\f<caret-right>\r\tRight limit")
			setup_menu_gear_accent(slot_556_7_2.body_yaw.extra_limit, "\x01\f<retweet>\r\tExtra limit")
			setup_menu_gear_accent(slot_556_7_2.body_yaw.min_limit, "\x01\f<minus>\r\tMin limit")
			setup_menu_gear_accent(slot_556_7_2.body_yaw.max_limit, "\x01\f<plus>\r\tMax limit")
			setup_menu_gear_accent(slot_556_7_2.body_yaw.sway_speed, "\x01\f<integral>\r\tSpeed")
			setup_menu_gear_accent(slot_556_7_2.body_yaw.jitter_randomness, "\x01\f<superscript>\r\tRandomness")

			if slot_556_7_2.body_yaw.add_yaw then
				setup_dynamic_switch_color(slot_556_7_2.body_yaw.add_yaw)
			end
		end
	end

	for iter_556_2 = 1, #AA_CONDITIONS_DEF do
		slot_556_7_1 = slot_0_152_0.antiaim.defensive_states[iter_556_2]

		setup_dynamic_switch_color(slot_556_7_1.enabled)
		setup_menu_gear_accent(slot_556_7_1.mode, "\x01\f<shield>\r\tDefensive type")
		setup_dynamic_switch_color(slot_556_7_1.force_lc)
		setup_menu_gear_accent(slot_556_7_1.duration, "\x01\f<timer>\r\tDuration")
		setup_menu_gear_accent(slot_556_7_1.pitch, "\x01\f<caret-up>\r\tPitch")
		setup_menu_gear_accent(slot_556_7_1.yaw, "\x01\f<caret-down>\r\tYaw")

		if slot_556_7_1.pitch_angle then
			setup_menu_gear_accent(slot_556_7_1.pitch_angle, "\x01\f<sliders>\r\tAngle")
		end

		if slot_556_7_1.pitch_angle2 then
			setup_menu_gear_accent(slot_556_7_1.pitch_angle2, "\x01\f<sliders>\r\tAngle 2")
		end

		if slot_556_7_1.pitch_speed then
			setup_menu_gear_accent(slot_556_7_1.pitch_speed, "\x01\f<gauge-simple-high>\r\tSpeed")
		end

		if slot_556_7_1.yaw_angle then
			setup_menu_gear_accent(slot_556_7_1.yaw_angle, "\x01\f<arrows-left-right>\r\tAngle")
		end

		if slot_556_7_1.yaw_angle2 then
			setup_menu_gear_accent(slot_556_7_1.yaw_angle2, "\x01\f<arrows-left-right>\r\tAngle 2")
		end

		if slot_556_7_1.yaw_delay then
			setup_menu_gear_accent(slot_556_7_1.yaw_delay, "\x01\f<timer>\r\tDelay")
		end

		if slot_556_7_1.yaw_speed then
			setup_menu_gear_accent(slot_556_7_1.yaw_speed, "\x01\f<gauge-simple-high>\r\tSpeed")
		end

		if slot_556_7_1.yaw_ways then
			setup_menu_gear_accent(slot_556_7_1.yaw_ways, "\x01\f<layer-group>\r\tWays")
		end
	end

	setup_dynamic_switch_color(slot_0_152_0.antiaim.def_settings.allow_hs)
	setup_dynamic_switch_color(slot_0_152_0.antiaim.def_settings.clear_mod)
	setup_dynamic_switch_color(slot_0_152_0.antiaim.def_settings.land_pitch)
	setup_menu_gear_accent(slot_0_152_0.antiaim.enabled, "\x01\f<shield-check>\r\tEnable anti-aim")
	setup_menu_gear_accent(slot_0_152_0.antiaim.settings, "\x01\f<pen-swirl>\r\tSettings")
	setup_menu_gear_accent(slot_0_152_0.antiaim.settings.profile, "\naa_settings_profile")
	setup_menu_gear_accent(slot_0_152_0.antiaim.def_settings, "\x01\f<pen-swirl>\r\tSettings")
	setup_menu_gear_accent(slot_0_152_0.antiaim.build_state, "\x01\f<location-pin>\r\tState")
	setup_menu_gear_accent(slot_0_152_0.antiaim.build_state.export_state, "\x01\a{Small Text}\f<copy>\r\tCopy")
	setup_menu_gear_accent(slot_0_152_0.antiaim.build_state.import_state, "\x01\a{Small Text}\f<paste>\r\tPaste")
	setup_menu_gear_accent(slot_0_152_0.antiaim.build_state.reset_state, "\x01\a{Small Text}\f<rotate-right>\r\tReset")
	setup_menu_gear_accent(slot_0_152_0.antiaim.def_state, "\x01\f<location-pin>\r\tState")
	setup_menu_gear_accent(slot_0_152_0.antiaim.manual_yaw, "\x01\f<up-down-left-right>\r\tManual Yaw")
	setup_dynamic_switch_color(slot_0_152_0.antiaim.manual_yaw.static_yaw)
	setup_menu_gear_accent(slot_0_152_0.antiaim.manual_yaw.static_yaw, "\x01\f<arrow-up>\r\tStatic")
	setup_menu_gear_accent(slot_0_152_0.vars.fast_ladder, "\x01\f<arrow-up-wide-short>\r\tFast Ladder")
	setup_menu_gear_accent(slot_0_152_0.vars.no_fall_damage, "\x01\f<person-falling>\r\tNo Fall Damage")
	setup_dynamic_switch_color(slot_0_152_0.vars.mute_manipulations)
	setup_dynamic_switch_color(slot_0_152_0.vars.avoid_collisions)
	setup_dynamic_switch_color(slot_0_152_0.vars.unlock_fd_speed)
	setup_dynamic_switch_color(slot_0_152_0.vars.console_color)
	setup_menu_gear_accent(slot_0_152_0.vars.console_color.color, "\x01\f<fill>\r\tColor")
	setup_dynamic_switch_color(slot_0_152_0.vars.flash_game_icon)
	setup_dynamic_switch_color(slot_0_152_0.vars.auto_r8)
	setup_menu_gear_accent(slot_0_152_0.vars.warmup_setup, "\x01\f<fire-flame-curved>\r\tWarmup")
	setup_dynamic_switch_color(slot_0_152_0.vars.warmup_setup.infinite_ammo)
	setup_dynamic_switch_color(slot_0_152_0.vars.warmup_setup.grenade_traj)
	setup_dynamic_switch_color(slot_0_152_0.vars.warmup_setup.kick_bots)
	setup_dynamic_switch_color(slot_0_152_0.vars.warmup_setup.buy_anywhere)
	setup_dynamic_switch_color(slot_0_152_0.vars.warmup_setup.auto_on_map)
	setup_menu_gear_accent(slot_0_152_0.vars.grenades, "\x01\f<bomb>\r\tGrenades")
	setup_dynamic_switch_color(slot_0_152_0.vars.grenades.super_toss)
	setup_dynamic_switch_color(slot_0_152_0.vars.grenades.grenade_release)
	setup_dynamic_switch_color(slot_0_152_0.vars.grenades.gr_on_pin_pulled)
	setup_menu_gear_accent(slot_0_152_0.vars.grenades.gr_release_damage, "\x01\f<wine-bottle>\r\tMin. damage")
	setup_dynamic_selectable_color(slot_0_152_0.vars.grenades.gr_allowed_grenades, {
		"Molotov",
		"High Explosive"
	})
	setup_dynamic_switch_color(slot_0_152_0.vars.grenades.drop_grenades)
	setup_menu_gear_accent(slot_0_152_0.antiaim.avoid_backstab, "\x01\f<shield>\r\tAvoid Backstab")
	setup_menu_gear_accent(slot_0_152_0.antiaim.safe_head, "\x01\f<head-side-mask>\r\tSafe Head")
	setup_menu_gear_accent(slot_0_152_0.antiaim.safe_head.height_gap, "\x01\f<line-height>\r\tHeight Gap")
	setup_menu_gear_accent(slot_0_152_0.antiaim.safe_head.desync_limit, "\x01\f<people-arrows>\r\tDesync Limit")
	setup_menu_gear_accent(slot_0_152_0.antiaim.static_warmup, "\x01\f<street-view>\r\tHide on warm-up")
	setup_menu_gear_accent(slot_0_152_0.antiaim.anti_brute, "\x01\f<shirt-running>\r\tAnti-bruteforce")
	setup_menu_gear_accent(slot_0_152_0.antiaim.anti_brute.method, "\x01\f<shuffle>\r\tMethod")
	setup_menu_gear_accent(slot_0_152_0.antiaim.anti_brute.duration, "\x01\f<timer>\r\tDuration")
	setup_menu_gear_accent(slot_0_152_0.antiaim.freestand, "\x01\f<arrows-turn-to-dots>\r\tFreestanding")
	setup_menu_gear_accent(slot_0_152_0.antiaim.legit_aa, " \x01\f<hand>\r \tLegit AA")
	setup_menu_gear_accent(slot_0_152_0.home.main_selector)
	setup_menu_gear_accent(slot_0_152_0.vars.main_selector)
	setup_menu_gear_accent(slot_0_152_0.antiaim.main_selector)
	pcall(function()
		if events.style_change then
			events.style_change:set(function()
				pcall(function()
					accent_theme_resync(true)
				end)
			end)
		end
	end)

	function slot_556_3_0(arg_593_0)
		if not arg_593_0 or arg_593_0 == "" then
			return
		end

		if slot_0_78_0.cfg_log_notify then
			pcall(slot_0_78_0.cfg_log_notify, arg_593_0)
		end
	end

	slot_556_4_0 = 0

	function slot_556_5_0(arg_594_0, arg_594_1)
		slot_556_4_0 = slot_556_4_0 + 1

		local var_594_0 = slot_556_4_0

		slot_556_3_0(arg_594_0)
		utils.execute_after(tonumber(arg_594_1) or 2, function()
			if slot_556_4_0 == var_594_0 then
				slot_556_3_0("")
			end
		end)
	end

	slot_0_152_0.home.stats_other.stats_sync_btn:set_callback(function()
		if not slot_0_90_0.is_configured() then
			slot_556_5_0("api not configured", 2)

			return
		end

		if slot_0_78_0.api_ping_ok ~= true then
			slot_556_5_0("connect first (status)", 2)

			return
		end

		slot_0_83_0(function(arg_597_0)
			slot_556_5_0(arg_597_0 and "statistics synced" or "statistics sync failed", 2)
		end)
	end)

	slot_556_6_0 = " \x01\aD35050FF\f<trash>\r \tReset"
	slot_556_7_0 = " \x01\aD35050FF\f<triangle-exclamation>\r \tConfirm"

	function slot_556_8_0()
		slot_0_78_0.stats_reset_arm_token = (slot_0_78_0.stats_reset_arm_token or 0) + 1

		local var_598_0 = slot_0_78_0.stats_reset_arm_token

		utils.execute_after(8, function()
			if var_598_0 ~= slot_0_78_0.stats_reset_arm_token then
				return
			end

			if not slot_0_78_0.stats_reset_armed then
				return
			end

			slot_0_78_0.stats_reset_armed = false
			slot_0_78_0.stats_reset_deadline = 0

			pcall(function()
				if slot_0_152_0.home.stats_other.stats_reset_btn and type(slot_0_152_0.home.stats_other.stats_reset_btn.name) == "function" then
					slot_0_152_0.home.stats_other.stats_reset_btn:name(slot_556_6_0)
				end
			end)
		end)
	end

	slot_0_152_0.home.stats_other.stats_reset_btn:set_callback(function()
		if not slot_0_90_0.is_configured() or slot_0_78_0.api_ping_ok ~= true then
			slot_556_5_0("connect first (status)", 2)

			return
		end

		local var_601_0 = globals.realtime or 0
		local var_601_1 = tonumber(slot_0_78_0.stats_reset_deadline) or 0

		if not slot_0_78_0.stats_reset_armed then
			slot_0_78_0.stats_reset_armed = true
			slot_0_78_0.stats_reset_deadline = var_601_0 + 8

			pcall(function()
				if slot_0_152_0.home.stats_other.stats_reset_btn and type(slot_0_152_0.home.stats_other.stats_reset_btn.name) == "function" then
					slot_0_152_0.home.stats_other.stats_reset_btn:name(slot_556_7_0)
				end
			end)
			slot_556_8_0()

			return
		end

		if var_601_1 < var_601_0 then
			slot_0_78_0.stats_reset_armed = true
			slot_0_78_0.stats_reset_deadline = var_601_0 + 8
			slot_0_78_0.stats_reset_arm_token = (slot_0_78_0.stats_reset_arm_token or 0) + 1

			pcall(function()
				if slot_0_152_0.home.stats_other.stats_reset_btn and type(slot_0_152_0.home.stats_other.stats_reset_btn.name) == "function" then
					slot_0_152_0.home.stats_other.stats_reset_btn:name(slot_556_7_0)
				end
			end)
			slot_556_8_0()

			return
		end

		slot_0_78_0.stats_reset_armed = false
		slot_0_78_0.stats_reset_deadline = 0
		slot_0_78_0.stats_reset_arm_token = (slot_0_78_0.stats_reset_arm_token or 0) + 1

		pcall(function()
			if slot_0_152_0.home.stats_other.stats_reset_btn and type(slot_0_152_0.home.stats_other.stats_reset_btn.name) == "function" then
				slot_0_152_0.home.stats_other.stats_reset_btn:name(slot_556_6_0)
			end
		end)

		slot_0_78_0.stats.loads = 0
		slot_0_78_0.stats.time_minutes = 0
		slot_0_78_0.stats.kills = 0
		slot_0_78_0.stats.deaths = 0
		slot_0_78_0.stats.hits = 0
		slot_0_78_0.stats.miss = 0
		slot_0_78_0.stats.evaded = 0

		slot_0_82_0()
		slot_0_84_0(function(arg_605_0)
			if not arg_605_0 then
				slot_556_5_0("statistics reset failed", 2)
			end
		end)
	end)

	function slot_556_9_0()
		if slot_0_152_0.home.cfg_new_state and type(slot_0_152_0.home.cfg_new_state.set) == "function" then
			slot_0_152_0.home.cfg_new_state:set(false)
		end

		if slot_0_152_0.home.cfg_name and type(slot_0_152_0.home.cfg_name.set) == "function" then
			slot_0_152_0.home.cfg_name:set("")
		end
	end

	function slot_556_10_0()
		local var_607_0 = {
			{
				slot_0_152_0.home.main_selector,
				slot_0_152_0.home.main_selector_int
			},
			{
				slot_0_152_0.vars.main_selector,
				slot_0_152_0.vars.main_selector_int
			},
			{
				slot_0_152_0.antiaim.main_selector,
				slot_0_152_0.antiaim.main_selector_int
			}
		}

		for iter_607_0 = 1, #var_607_0 do
			local var_607_1 = var_607_0[iter_607_0][1]
			local var_607_2 = var_607_0[iter_607_0][2]

			if var_607_1 and var_607_2 and type(var_607_1.get) == "function" and type(var_607_2.set) == "function" then
				pcall(function()
					local var_608_0 = var_607_1:get()

					if var_608_0 ~= nil then
						var_607_2:set(var_608_0)
					end
				end)
			end
		end
	end

	function slot_556_11_0()
		local var_609_0 = {
			slot_0_112_0
		}

		for iter_609_0, iter_609_1 in pairs(slot_0_137_0.configs) do
			if iter_609_0 ~= slot_0_112_0 then
				var_609_0[#var_609_0 + 1] = iter_609_0
			end
		end

		table.sort(var_609_0, function(arg_610_0, arg_610_1)
			return arg_610_0:lower() < arg_610_1:lower()
		end)

		return var_609_0
	end

	slot_556_12_0 = "\a{Link Active}•\aDEFAULT  "

	function slot_556_13_0(arg_611_0)
		local var_611_0 = tostring(slot_0_137_0.loaded or slot_0_112_0)
		local var_611_1 = {}

		for iter_611_0 = 1, #arg_611_0 do
			local var_611_2 = arg_611_0[iter_611_0]

			if tostring(var_611_2) == var_611_0 then
				var_611_1[iter_611_0] = slot_556_12_0 .. var_611_2
			else
				var_611_1[iter_611_0] = var_611_2
			end
		end

		return var_611_1
	end

	function slot_556_14_0()
		local var_612_0 = slot_556_11_0()
		local var_612_1 = slot_0_152_0.home.cfg_list:get()

		if type(var_612_1) == "number" and var_612_0[var_612_1] then
			return var_612_0[var_612_1]
		end

		if type(var_612_1) == "string" and var_612_1 ~= "" then
			local var_612_2 = var_612_1:gsub("^" .. slot_556_12_0, "")

			return var_612_2 ~= "" and var_612_2 or slot_0_112_0
		end

		return slot_0_112_0
	end

	function slot_556_15_0(arg_613_0)
		if not slot_0_152_0.home.cfg_meta or type(slot_0_152_0.home.cfg_meta.name) ~= "function" then
			return
		end

		local var_613_0 = arg_613_0

		if var_613_0 == nil or var_613_0 == "" then
			var_613_0 = slot_556_14_0()
		end

		local var_613_1, var_613_2, var_613_3 = slot_0_121_0(slot_0_137_0.configs[var_613_0])
		local var_613_4 = var_613_2 and tostring(var_613_2) ~= "" and tostring(var_613_2) or "—"
		local var_613_5 = var_613_3 and tostring(var_613_3) ~= "" and tostring(var_613_3) or "—"

		pcall(function()
			slot_0_152_0.home.cfg_meta:name(string.format(" \x01\a{Small Text}\f<user>\r \t%s   \x01\a{Small Text}\f<clock>\r \t%s", var_613_4, var_613_5))
		end)
	end

	function slot_556_16_0(arg_615_0)
		local var_615_0 = slot_556_11_0()
		local var_615_1 = slot_556_13_0(var_615_0)

		if type(slot_0_152_0.home.cfg_list.update) == "function" then
			slot_0_152_0.home.cfg_list:update(var_615_1)
		end

		local var_615_2 = arg_615_0 or slot_0_137_0.loaded or slot_0_112_0
		local var_615_3 = 1

		for iter_615_0 = 1, #var_615_0 do
			if var_615_0[iter_615_0] == var_615_2 then
				var_615_3 = iter_615_0

				break
			end
		end

		if type(slot_0_152_0.home.cfg_list.set) == "function" then
			slot_0_152_0.home.cfg_list:set(var_615_3)
		end

		slot_556_15_0(var_615_2)
	end

	pcall(function()
		if slot_0_152_0.home.cfg_list and type(slot_0_152_0.home.cfg_list.set_callback) == "function" then
			slot_0_152_0.home.cfg_list:set_callback(function()
				slot_556_15_0()

				if slot_0_78_0.cfg_delete_disarm then
					slot_0_78_0.cfg_delete_disarm()
				end
			end)
		end
	end)

	function slot_556_17_0(arg_618_0)
		if not arg_618_0 then
			return 0
		end

		local var_618_0 = arg_618_0.m_vecVelocity

		return var_618_0 and var_618_0:length() or 0
	end

	slot_556_18_0 = {
		bootstrapped = false,
		value = 0,
		applied = false
	}

	function slot_556_19_0(arg_619_0, arg_619_1, arg_619_2)
		arg_619_0 = tonumber(arg_619_0) or 0
		arg_619_1 = tonumber(arg_619_1) or 0
		arg_619_2 = tonumber(arg_619_2) or 12

		local var_619_0 = globals.frametime or 0.016
		local var_619_1 = arg_619_0 + (arg_619_1 - arg_619_0) * math.min(1, var_619_0 * arg_619_2)

		if math.abs(arg_619_1 - var_619_1) < 0.001 then
			return arg_619_1
		end

		return var_619_1
	end

	function slot_556_20_0()
		if not slot_0_78_0.pui_ready then
			return false
		end

		local var_620_0 = slot_0_152_0.vars and slot_0_152_0.vars.aspect

		if not var_620_0 or type(var_620_0.get) ~= "function" then
			return false
		end

		local var_620_1, var_620_2 = pcall(function()
			return var_620_0:get() == true
		end)

		if not var_620_1 then
			return false
		end

		local var_620_3 = var_620_2 == true
		local var_620_4 = 0
		local var_620_5, var_620_6 = pcall(function()
			return math.floor(tonumber(slot_0_152_0.vars.aspect.ratio:get()) or 0) * 0.01
		end)

		if var_620_5 then
			var_620_4 = var_620_6 or 0
		end

		if not slot_556_18_0.bootstrapped then
			slot_556_18_0.bootstrapped = true

			if var_620_3 then
				slot_556_18_0.value = var_620_4
				slot_556_18_0.applied = true
				slot_556_18_0.last_enabled = true
				slot_556_18_0.last_ratio = var_620_4

				pcall(function()
					cvar.r_aspectratio:float(var_620_4)
				end)

				return false
			else
				slot_556_18_0.value = 0
				slot_556_18_0.applied = false
				slot_556_18_0.last_enabled = false
				slot_556_18_0.last_ratio = nil

				local var_620_7 = 0

				pcall(function()
					var_620_7 = cvar.r_aspectratio:float() or 0
				end)

				if math.abs(var_620_7) > 0.001 then
					pcall(function()
						cvar.r_aspectratio:float(0)
					end)
				end

				return false
			end
		end

		if not var_620_3 and slot_556_18_0.applied ~= true then
			return false
		end

		local var_620_8 = var_620_3 and var_620_4 or 0

		slot_556_18_0.value = slot_556_19_0(slot_556_18_0.value, var_620_8, 12)

		pcall(function()
			cvar.r_aspectratio:float(slot_556_18_0.value)
		end)

		if var_620_3 then
			slot_556_18_0.applied = true
			slot_556_18_0.last_enabled = true
			slot_556_18_0.last_ratio = var_620_4
		elseif (slot_556_18_0.applied or slot_556_18_0.last_enabled == true) and math.abs(slot_556_18_0.value) < 0.001 then
			slot_556_18_0.applied = false
			slot_556_18_0.last_enabled = false
			slot_556_18_0.last_ratio = nil
			slot_556_18_0.value = 0
		end

		return math.abs((tonumber(slot_556_18_0.value) or 0) - var_620_8) >= 0.001
	end

	function slot_556_21_0()
		slot_556_18_0.bootstrapped = false
		slot_556_18_0.applied = false
		slot_556_18_0.last_enabled = nil
		slot_556_18_0.last_ratio = nil
		slot_556_18_0.value = 0

		slot_556_20_0()

		if slot_0_78_0.ap_render_wake_cvars then
			pcall(slot_0_78_0.ap_render_wake_cvars)
		end
	end

	slot_556_22_0 = {
		{
			suffix = "fov",
			id = "fov"
		},
		{
			suffix = "offset_x",
			id = "x"
		},
		{
			suffix = "offset_y",
			id = "y"
		},
		{
			suffix = "offset_z",
			id = "z"
		}
	}
	slot_556_23_0 = {
		worker = false,
		was_active = false,
		stock_ready = false,
		stock = {},
		init = {},
		value = {}
	}

	function slot_556_24_0(arg_628_0, arg_628_1, arg_628_2)
		arg_628_0 = tonumber(arg_628_0) or 0
		arg_628_1 = tonumber(arg_628_1) or 0
		arg_628_2 = tonumber(arg_628_2) or 14

		local var_628_0 = globals.frametime or 0.016
		local var_628_1 = arg_628_0 + (arg_628_1 - arg_628_0) * math.min(1, var_628_0 * arg_628_2)

		if math.abs(arg_628_1 - var_628_1) < 0.002 then
			return arg_628_1
		end

		return var_628_1
	end

	function slot_556_25_0(arg_629_0)
		local var_629_0, var_629_1 = pcall(function()
			return cvar["viewmodel_" .. arg_629_0]:float()
		end)

		if var_629_0 and type(var_629_1) == "number" then
			return var_629_1
		end

		return nil
	end

	function slot_556_26_0(arg_631_0, arg_631_1)
		if type(arg_631_1) ~= "number" or arg_631_1 ~= arg_631_1 then
			return
		end

		pcall(function()
			local var_632_0 = cvar["viewmodel_" .. arg_631_0]

			if var_632_0 and type(var_632_0.float) == "function" then
				var_632_0:float(arg_631_1, true)
			end
		end)
	end

	function slot_556_27_0()
		for iter_633_0 = 1, #slot_556_22_0 do
			local var_633_0 = slot_556_22_0[iter_633_0].id
			local var_633_1 = slot_556_25_0(slot_556_22_0[iter_633_0].suffix)

			if var_633_1 ~= nil then
				slot_556_23_0.init[var_633_0] = var_633_1
				slot_556_23_0.value[var_633_0] = var_633_1
			end
		end
	end

	function slot_556_28_0()
		if slot_556_23_0.stock_ready then
			return
		end

		for iter_634_0 = 1, #slot_556_22_0 do
			local var_634_0 = slot_556_22_0[iter_634_0].id
			local var_634_1 = slot_556_25_0(slot_556_22_0[iter_634_0].suffix)

			if var_634_1 ~= nil then
				slot_556_23_0.stock[var_634_0] = var_634_1
				slot_556_23_0.init[var_634_0] = var_634_1
				slot_556_23_0.value[var_634_0] = var_634_1
			end
		end

		slot_556_23_0.stock_ready = true
	end

	function slot_556_29_0()
		local var_635_0 = slot_0_152_0.vars and slot_0_152_0.vars.vm_adjust

		if not var_635_0 or var_635_0:get() == true then
			return
		end

		for iter_635_0 = 1, #slot_556_22_0 do
			local var_635_1 = slot_556_22_0[iter_635_0].id
			local var_635_2 = slot_556_25_0(slot_556_22_0[iter_635_0].suffix)

			if var_635_2 ~= nil then
				slot_556_23_0.init[var_635_1] = var_635_2
			end
		end
	end

	function slot_556_30_0()
		local var_636_0 = slot_0_152_0.vars and slot_0_152_0.vars.vm_adjust

		if not var_636_0 then
			return
		end

		pcall(function()
			if var_636_0.vm_fov then
				var_636_0.vm_fov:set(math.floor((slot_556_23_0.init.fov or 68) + 0.5))
			end
		end)
		pcall(function()
			if var_636_0.vm_x then
				var_636_0.vm_x:set(math.floor((slot_556_23_0.init.x or 0) / 0.1 + 0.5))
			end
		end)
		pcall(function()
			if var_636_0.vm_y then
				var_636_0.vm_y:set(math.floor((slot_556_23_0.init.y or 0) / 0.1 + 0.5))
			end
		end)
		pcall(function()
			if var_636_0.vm_z then
				var_636_0.vm_z:set(math.floor((slot_556_23_0.init.z or 0) / 0.1 + 0.5))
			end
		end)
	end

	function slot_556_31_0()
		local var_641_0 = slot_0_152_0.vars and slot_0_152_0.vars.vm_adjust

		if var_641_0 and var_641_0:get() ~= true then
			slot_556_27_0()

			for iter_641_0 = 1, #slot_556_22_0 do
				local var_641_1 = slot_556_22_0[iter_641_0].id
				local var_641_2 = slot_556_23_0.init[var_641_1]

				if var_641_2 ~= nil then
					slot_556_23_0.stock[var_641_1] = var_641_2
				end
			end
		else
			slot_556_28_0()
		end

		for iter_641_1 = 1, #slot_556_22_0 do
			local var_641_3 = slot_556_22_0[iter_641_1].id
			local var_641_4 = slot_556_23_0.stock[var_641_3]

			if var_641_4 ~= nil then
				slot_556_23_0.init[var_641_3] = var_641_4
			end
		end

		slot_556_30_0()

		slot_556_23_0.worker = true
		slot_556_23_0.was_active = var_641_0 and var_641_0:get() == true

		for iter_641_2 = 1, #slot_556_22_0 do
			local var_641_5 = slot_556_22_0[iter_641_2]
			local var_641_6 = var_641_5.id
			local var_641_7 = slot_556_23_0.init[var_641_6]

			if var_641_7 ~= nil then
				slot_556_23_0.value[var_641_6] = var_641_7

				slot_556_26_0(var_641_5.suffix, var_641_7)
			end
		end
	end

	function slot_556_32_0()
		for iter_642_0 = 1, #slot_556_22_0 do
			local var_642_0 = slot_556_22_0[iter_642_0]
			local var_642_1 = slot_556_23_0.init[var_642_0.id]

			if var_642_1 ~= nil then
				slot_556_26_0(var_642_0.suffix, var_642_1)
			end
		end

		slot_556_23_0.was_active = false
		slot_556_23_0.worker = false
	end

	function slot_556_33_0(arg_643_0)
		local var_643_0 = slot_0_152_0.vars and slot_0_152_0.vars.vm_adjust

		if not var_643_0 then
			return nil
		end

		if arg_643_0 == "fov" then
			return var_643_0.vm_fov and var_643_0.vm_fov:get() or slot_556_23_0.init.fov or 68
		end

		if arg_643_0 == "x" then
			return (var_643_0.vm_x and var_643_0.vm_x:get() or 0) * 0.1
		end

		if arg_643_0 == "y" then
			return (var_643_0.vm_y and var_643_0.vm_y:get() or 0) * 0.1
		end

		if arg_643_0 == "z" then
			return (var_643_0.vm_z and var_643_0.vm_z:get() or 0) * 0.1
		end

		return nil
	end

	function slot_556_34_0()
		if not globals.is_connected then
			return false
		end

		slot_556_28_0()

		local var_644_0 = slot_0_152_0.vars and slot_0_152_0.vars.vm_adjust

		if not var_644_0 then
			return false
		end

		local var_644_1 = var_644_0:get() == true

		if not var_644_1 and not slot_556_23_0.was_active then
			slot_556_29_0()

			return false
		end

		if not slot_556_23_0.worker then
			slot_556_23_0.worker = true

			slot_556_27_0()
		end

		if var_644_1 then
			slot_556_23_0.was_active = true

			local var_644_2 = true

			for iter_644_0 = 1, #slot_556_22_0 do
				local var_644_3 = slot_556_22_0[iter_644_0]
				local var_644_4 = var_644_3.id
				local var_644_5 = slot_556_33_0(var_644_4)

				if var_644_5 == nil then
					var_644_5 = slot_556_23_0.init[var_644_4] or 0
				end

				local var_644_6 = slot_556_23_0.value[var_644_4]

				if var_644_6 == nil then
					var_644_6 = slot_556_23_0.init[var_644_4] or var_644_5
				end

				local var_644_7 = slot_556_24_0(var_644_6, var_644_5, 14)

				slot_556_23_0.value[var_644_4] = var_644_7

				slot_556_26_0(var_644_3.suffix, var_644_7)

				if math.abs(var_644_7 - var_644_5) > 0.002 then
					var_644_2 = false
				end
			end

			return not var_644_2
		end

		local var_644_8 = true

		for iter_644_1 = 1, #slot_556_22_0 do
			local var_644_9 = slot_556_22_0[iter_644_1]
			local var_644_10 = var_644_9.id
			local var_644_11 = slot_556_23_0.init[var_644_10]

			if var_644_11 == nil then
				var_644_11 = slot_556_25_0(var_644_9.suffix) or 0
				slot_556_23_0.init[var_644_10] = var_644_11
			end

			local var_644_12 = slot_556_23_0.value[var_644_10]

			if var_644_12 == nil then
				var_644_12 = var_644_11
			end

			local var_644_13 = slot_556_24_0(var_644_12, var_644_11, 14)

			slot_556_23_0.value[var_644_10] = var_644_13

			slot_556_26_0(var_644_9.suffix, var_644_13)

			if math.abs(var_644_13 - var_644_11) > 0.002 then
				var_644_8 = false
			end
		end

		if var_644_8 then
			slot_556_32_0()
			slot_556_29_0()

			return false
		end

		return true
	end

	function slot_556_35_0()
		local var_645_0 = slot_0_152_0.vars and slot_0_152_0.vars.vm_adjust

		if not var_645_0 then
			return
		end

		if var_645_0:get() ~= true and not slot_556_23_0.was_active then
			return
		end

		if not slot_556_23_0.worker then
			slot_556_23_0.worker = true

			slot_556_27_0()
		end
	end

	function slot_556_36_0(arg_646_0)
		slot_556_35_0()
	end

	slot_556_37_0 = 0

	function slot_556_38_0(arg_647_0)
		local var_647_0 = globals.frametime * 8

		if var_647_0 > 1 then
			var_647_0 = 1
		end

		slot_556_37_0 = slot_556_37_0 + (arg_647_0 - slot_556_37_0) * var_647_0

		return slot_556_37_0
	end

	function slot_556_39_0(arg_648_0)
		local var_648_0 = refs.scope_overlay

		if not var_648_0 or type(var_648_0.override) ~= "function" then
			return
		end

		pcall(function()
			if arg_648_0 then
				var_648_0:override("Remove All")
			else
				var_648_0:override()
			end
		end)
	end

	function slot_556_40_0()
		local var_650_0 = slot_0_152_0.vars and slot_0_152_0.vars.crosshair_scope

		if not var_650_0 or type(var_650_0.get) ~= "function" then
			return
		end

		local var_650_1, var_650_2 = pcall(function()
			return var_650_0:get() == true
		end)

		slot_556_39_0(var_650_1 and var_650_2)
	end

	function slot_556_41_0(arg_652_0)
		local var_652_0 = refs.scope_force_vm

		if not var_652_0 or type(var_652_0.override) ~= "function" then
			return
		end

		pcall(function()
			if arg_652_0 then
				var_652_0:override(true)
			else
				var_652_0:override()
			end
		end)
	end

	function slot_556_42_0()
		local var_654_0 = slot_0_152_0.vars and slot_0_152_0.vars.crosshair_scope

		if not var_654_0 or type(var_654_0.get) ~= "function" then
			slot_556_41_0(false)

			return
		end

		local var_654_1, var_654_2 = pcall(function()
			return var_654_0:get() == true
		end)

		if not var_654_1 or var_654_2 ~= true then
			slot_556_41_0(false)

			return
		end

		local var_654_3, var_654_4 = pcall(function()
			return var_654_0.scope_force_vm and var_654_0.scope_force_vm:get() == true
		end)

		slot_556_41_0(var_654_3 and var_654_4 == true)
	end

	function slot_556_43_0(arg_657_0, arg_657_1)
		arg_657_1 = math.floor(255 * (arg_657_1 or 1))

		if type(arg_657_0) ~= "userdata" or type(arg_657_0.alpha_modulate) ~= "function" then
			return color(255, 255, 255, arg_657_1)
		end

		local var_657_0, var_657_1 = pcall(function()
			return arg_657_0:alpha_modulate(arg_657_1)
		end)

		return var_657_0 and var_657_1 or color(255, 255, 255, arg_657_1)
	end

	function slot_556_44_0(arg_659_0)
		local var_659_0 = arg_659_0 or color(255, 255, 255, 255)

		if type(var_659_0) == "table" and var_659_0[1] then
			var_659_0 = var_659_0[1]
		end

		return var_659_0, slot_556_43_0(var_659_0, 0)
	end

	function slot_556_45_0()
		local var_660_0 = slot_0_152_0.vars and slot_0_152_0.vars.crosshair_scope
		local var_660_1 = 0

		if var_660_0 and type(var_660_0.get) == "function" and var_660_0:get() == true and globals.is_in_game then
			local var_660_2 = entity.get_local_player()

			if var_660_2 and var_660_2:is_alive() and var_660_2.m_bIsScoped == true then
				var_660_1 = 1
			end
		end

		slot_556_37_0 = slot_556_38_0(var_660_1)
		slot_0_78_0.scope_blend_cur = slot_556_37_0

		return slot_556_37_0
	end

	function slot_556_46_0()
		pcall(function()
			local var_662_0 = slot_0_152_0.vars and slot_0_152_0.vars.crosshair_scope

			if not var_662_0 or var_662_0:get() ~= true then
				return
			end

			if not globals.is_in_game then
				return
			end

			local var_662_1 = entity.get_local_player()

			if not var_662_1 or not var_662_1:is_alive() then
				return
			end

			local var_662_2 = tonumber(slot_0_78_0.scope_blend_cur) or 0

			if var_662_2 < 0.01 then
				return
			end

			local var_662_3 = slot_0_89_0.screen_size_cached()

			if not var_662_3 or not var_662_3.x or not var_662_3.y then
				return
			end

			local var_662_4 = var_662_0.scope_gap and var_662_0.scope_gap:get() or 10
			local var_662_5 = (var_662_4 + (var_662_0.scope_size and var_662_0.scope_size:get() or 40)) * var_662_2
			local var_662_6 = var_662_4 * var_662_2
			local var_662_7 = var_662_3.x * 0.5
			local var_662_8 = var_662_3.y * 0.5
			local var_662_9 = var_662_0.scope_color and var_662_0.scope_color:get() or color(255, 255, 255, 255)
			local var_662_10, var_662_11 = slot_556_44_0(var_662_9)
			local var_662_12 = slot_556_43_0(var_662_10, var_662_2)
			local var_662_13 = slot_556_43_0(var_662_11, 0)

			render.gradient(vector(var_662_7 + var_662_6, var_662_8), vector(var_662_7 + var_662_5 + 1, var_662_8 + 1), var_662_12, var_662_13, var_662_12, var_662_13)
			render.gradient(vector(var_662_7 - var_662_6 + 1, var_662_8), vector(var_662_7 - var_662_5, var_662_8 + 1), var_662_12, var_662_13, var_662_12, var_662_13)
			render.gradient(vector(var_662_7, var_662_8 + var_662_6), vector(var_662_7 + 1, var_662_8 + var_662_5 + 1), var_662_12, var_662_12, var_662_13, var_662_13)

			if not var_662_0.scope_t_style or var_662_0.scope_t_style:get() ~= true then
				render.gradient(vector(var_662_7, var_662_8 - var_662_6 + 1), vector(var_662_7 + 1, var_662_8 - var_662_5), var_662_12, var_662_12, var_662_13, var_662_13)
			end
		end)
	end

	function slot_556_47_0()
		slot_556_40_0()
		slot_556_42_0()
	end

	pcall(function()
		local var_664_0 = slot_0_152_0.vars.crosshair_scope

		if var_664_0 and type(var_664_0.set_callback) == "function" then
			var_664_0:set_callback(slot_556_47_0, true)
		end

		if var_664_0 and var_664_0.scope_force_vm and type(var_664_0.scope_force_vm.set_callback) == "function" then
			var_664_0.scope_force_vm:set_callback(slot_556_47_0)
		end
	end)
	pcall(function()
		local var_665_0 = slot_0_152_0.vars.vm_adjust

		if not var_665_0 then
			return
		end

		local function var_665_1()
			slot_556_36_0(true)

			if slot_0_78_0.ap_render_wake_cvars then
				pcall(slot_0_78_0.ap_render_wake_cvars)
			end
		end

		if type(var_665_0.set_callback) == "function" then
			var_665_0:set_callback(var_665_1, true)
		end

		if var_665_0.vm_reset and type(var_665_0.vm_reset.set_callback) == "function" then
			var_665_0.vm_reset:set_callback(function()
				slot_556_31_0()
			end)
		end

		for iter_665_0, iter_665_1 in ipairs({
			"vm_fov",
			"vm_x",
			"vm_y",
			"vm_z"
		}) do
			local var_665_2 = var_665_0[iter_665_1]

			if var_665_2 and type(var_665_2.set_callback) == "function" then
				var_665_2:set_callback(var_665_1)
			end
		end
	end)

	slot_556_48_0 = nil
	slot_556_49_0 = nil

	function slot_556_50_0()
		local var_668_0 = slot_0_152_0.vars and slot_0_152_0.vars.trashtalk_enable and slot_0_152_0.vars.trashtalk_enable.mode

		if not var_668_0 or type(var_668_0.get) ~= "function" then
			return "Default"
		end

		local var_668_1, var_668_2 = pcall(function()
			return var_668_0:get()
		end)

		if var_668_1 then
			if type(var_668_2) == "string" then
				if var_668_2 == "1" or var_668_2 == "Russian" or var_668_2 == "Default" then
					return var_668_2
				end
			elseif type(var_668_2) == "number" then
				if var_668_2 == 2 then
					return "1"
				elseif var_668_2 == 3 then
					return "Russian"
				end

				return "Default"
			end
		end

		local var_668_3, var_668_4 = pcall(function()
			return var_668_0:get("1")
		end)

		if var_668_3 and (var_668_4 == true or var_668_4 == 1) then
			return "1"
		end

		local var_668_5, var_668_6 = pcall(function()
			return var_668_0:get("Russian")
		end)

		if var_668_5 and (var_668_6 == true or var_668_6 == 1) then
			return "Russian"
		end

		return "Default"
	end

	function slot_556_51_0()
		if slot_556_50_0() == "1" then
			return true
		end

		local var_672_0 = slot_0_152_0.vars and slot_0_152_0.vars.trashtalk_enable and slot_0_152_0.vars.trashtalk_enable.revenge

		if not var_672_0 or type(var_672_0.get) ~= "function" then
			return false
		end

		local var_672_1, var_672_2 = pcall(function()
			return var_672_0:get()
		end)

		return var_672_1 and var_672_2 == true
	end

	slot_556_52_0 = {
		{
			"ᴀᴍɴᴇsɪᴀ.ᴘʟᴜs - ᴏꜰꜰɪᴄɪᴀʟ ᴡᴇʙsɪᴛᴇ",
			"ᴇɴᴛᴇʀ ɪᴛ ᴀɴᴅ ʙᴜʏ ᴛʜᴇ ʙᴇsᴛ ʟᴜᴀ"
		},
		{
			"ᅔ>.< член в заднице у пендосов ＡＭＮＥＳＩＡ.ＰＬＵＳᅕஃ",
			"ᅕ ＡＭＮＥＳＩＡ.ＰＬＵＳ ᅕ"
		},
		{
			"𝐬𝐤𝐞𝐞𝐭 𝐝𝐨𝐧𝐭 𝐧𝐞𝐞𝐝 𝐮𝐩𝐝𝐚𝐭𝐞",
			"𝐰𝐢𝐭𝐡 𝐚𝐦𝐧𝐞𝐬𝐢𝐚"
		},
		{
			"𝖌𝖆𝖒𝖊𝖘𝖊𝖓𝖘𝖎𝖈𝖆𝖑",
			"𝖋𝖙. 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖕𝖑𝖚𝖘"
		},
		{
			"𝖉𝖊𝖑𝖊𝖙𝖊 𝖚𝖗 𝖋𝖚𝖈𝖐𝖎𝖓𝖌 𝖕𝖆𝖘𝖙𝖊",
			"𝖆𝖓𝖉 𝖇𝖚𝖞 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖕𝖑𝖚𝖘 𝖋𝖔𝖗 𝖌𝖆𝖒𝖊𝖘𝖊𝖓𝖘𝖊"
		},
		{
			"!!!! 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖕𝖑𝖚𝖘 !!!!",
			"????? 𝖆𝖒𝖓𝖊𝖘𝖎𝖆 𝖍𝖊𝖑𝖎𝖈𝖔𝖕𝖙𝖊𝖗 𝖘𝖞𝖘𝖙𝖊𝖒 ?????"
		},
		{
			"?? 𝖆𝖒𝖓𝖊𝖘𝖎𝖆 ~ 𝖕𝖚𝖎 ??",
			"999% 𝖒𝖔𝖛𝖊 𝖑𝖊𝖆𝖓"
		},
		{
			"𝘥𝘪𝘴𝘤𝘰𝘳𝘥.𝘨𝘨/𝘢𝘯𝘵𝘪𝘩𝘪𝘵",
			"500 𝘳𝘶𝘣𝘤𝘩𝘪𝘬𝘰𝘷 𝘻𝘢 𝘴𝘤𝘳𝘪𝘱𝘵"
		},
		{
			"𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖕𝖑𝖚𝖘",
			"𝖔𝖜𝖓𝖘 𝖒𝖊 𝖆𝖓𝖉 𝖆𝖑𝖑"
		},
		{
			"𝖍𝖊𝖆𝖉𝖘𝖍𝖔𝖙 𝖒𝖆𝖈𝖍𝖎𝖓𝖊 𝖜𝖎𝖙𝖍 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖕𝖑𝖚𝖘",
			"𝖎 𝖉𝖗𝖎𝖓𝖐 𝖇𝖑𝖔𝖔𝖉 𝖋𝖔𝖗 𝖇𝖗𝖊𝖆𝖐𝖋𝖆𝖘𝖙"
		},
		{
			"𝖆𝖒𝖓𝖊𝖘𝖎𝖆 500$ 𝖆𝖓𝖙𝖎-𝖍𝖎𝖙 𝖘𝖞𝖘𝖙𝖊𝖒",
			"𝖌𝖊𝖙 𝖋𝖚𝖈𝖐𝖊𝖉 𝖇𝖔𝖙 - 𝖕𝖗𝖊𝖒𝖎𝖚𝖒 𝖊𝖝𝖕𝖊𝖗𝖎𝖊𝖓𝖈𝖊"
		},
		{
			"𝙞 𝙛𝙚𝙚𝙡 𝙡𝙞𝙠𝙚 𝙖 𝙨𝙪𝙥𝙚𝙧𝙝𝙚𝙧𝙤 𝙬𝙞𝙩𝙝 𝙖𝙢𝙣𝙚𝙨𝙞𝙖",
			"𝙞 𝙥𝙞𝙨𝙨𝙚𝙙 𝙤𝙣 𝙪𝙧 𝙜𝙧𝙖𝙫𝙚 𝙙𝙤𝙜"
		},
		{
			"𝖘𝖑𝖊𝖊𝖕 𝖙𝖎𝖌𝖍𝖙 𝖋𝖔𝖌𝖌𝖔𝖙",
			"𝖇𝖚𝖙 𝖚 𝖈𝖆𝖓 𝖘𝖚𝖈𝖐 𝖒𝖊 𝖆𝖌𝖆𝖎𝖓",
			""
		},
		{
			"𝖘𝖙𝖔𝖕 𝖑𝖔𝖘𝖎𝖓𝖌 𝖜𝖎𝖙𝖍 𝖌𝖆𝖒𝖊𝖘𝖊𝖓𝖘𝖊",
			"𝖏𝖚𝖘𝖙 𝖚𝖘𝖊 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖕𝖑𝖚𝖘"
		},
		{
			"♕ ʀᴜssɪᴀɴ ᴘᴏʟɪᴄᴇ ♕",
			"♕ M͜͡V͜͡D͜͡ x͜͡ O͜͡V͜͡D͜͡ ♕"
		},
		{
			"▄︻デ ᴀᴍɴᴇsɪᴀ.ᴘʟᴜs ══━一",
			"ᴘʀᴇᴍɪᴜᴍ ʟᴜᴀ ғᴏʀ ɢᴀᴍᴇsᴇɴsᴇ"
		},
		{
			"ᴘᴏᴡᴇʀᴇᴅ ʙʏ ᴀᴍɴᴇsɪᴀ.ᴘʟᴜs",
			"ʙᴇsᴛ ᴀɴᴛɪ-ᴀɪᴍ sʏsᴛᴇᴍ"
		},
		{
			"ａｍｎｅｓｉａ.ｐｌｕｓ - ｂｅｓｔ ｌｕａ",
			"ｇｅｔ ｉｔ ｎｏｗ"
		},
		{
			"☆꧁✬ ᴀᴍɴᴇsɪᴀ.ᴘʟᴜs ✬꧂☆",
			"☆꧁✬ ᴜɴsᴛᴏᴘᴘᴀʙʟᴇ ✬꧂☆"
		},
		{
			"ɢᴇᴛ ʏᴏᴜʀ ᴀᴍɴᴇsɪᴀ.ᴘʟᴜs ɴᴏᴡ",
			"ᴅᴏɴ'ᴛ ʙᴇ ᴀ ʙᴏᴛ"
		},
		{
			"ａｍｎｅｓｉａ ｍａｋｅｓ ｍｅ ｓｔｒｏｎｇ",
			"ｙｏｕ ａｒｅ ｗｅａｋ"
		},
		{
			"ᴛʜɪs ɪs ᴀᴍɴᴇsɪᴀ ᴘᴏᴡᴇʀ",
			"ʏᴏᴜ ᴄᴀɴ'ᴛ ᴄᴏᴍᴘᴇᴛᴇ"
		},
		{
			"ʏᴏᴜ ɴᴇᴇᴅ ᴀᴍɴᴇsɪᴀ.ᴘʟᴜs",
			"ᴛᴏ ᴘʟᴀʏ ʟɪᴋᴇ ᴍᴇ"
		},
		{
			"ᴍᴀʀᴋᴇᴛ.ɴᴇᴠᴇʀʟᴏsᴇ.ᴄᴄ/ᴜᴄ4ᴢʙʟ",
			"ᴏꜰꜰɪᴄɪᴀʟ ʟɪɴᴋ"
		}
	}
	slot_556_53_0 = {
		{
			"sᴘᴏɴsᴏʀᴇᴅ ꜰᴛ. ᴀᴍɴᴇsɪᴀ.ᴘʟᴜs",
			"ᴍᴀʀᴋᴇᴛ.ɴᴇᴠᴇʀʟᴏsᴇ.ᴄᴄ/ᴜᴄ4ᴢʙʟ"
		},
		{
			"ｕｒ ｓｏ ｌｕｃｋｙ",
			"ʏᴏᴜᴛᴜʙᴇ.ᴄᴏᴍ/@ᴘʜᴏʙɪᴀʙᴇᴛᴀ"
		},
		{
			"k͜͡o͜͡m͜͡p͜͡ k͜͡a͜͡r͜͡t͜͡o͜͡s͜͡h͜͡k͜͡a͜͡ :͜͡(͜͡",
			""
		},
		{
			"𝐜𝐮𝐬𝐭𝐨𝐦 𝐫𝐞𝐳𝐢𝐤 𝐧𝐞 𝐛𝐮𝐬𝐭𝐢𝐭",
			"♕ 𝑨𝑳𝑳 𝑺𝑻𝑨𝑭𝑭 𝑾𝑰𝑻𝑯 𝑮𝑨𝑴𝑬𝑺𝑬𝑵𝑺𝑬.𝑷𝑼𝑩 ♕"
		},
		{
			"𝖘𝖙𝖔𝖕 𝖍𝖚𝖓𝖙𝖎𝖓𝖌 𝖒𝖊",
			"𝓜𝓐𝓡𝓛𝓑𝓞𝓡𝓞 "
		},
		{
			"𝖉𝖎𝖘𝖈𝖍𝖆𝖗𝖌𝖎𝖓𝖌 𝖜𝖎𝖙𝖍 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖘𝖇𝖘",
			""
		},
		{
			"𝖎 𝖜𝖆𝖘 𝖏𝖚𝖘𝖙 𝖑𝖎𝖌𝖍𝖙𝖎𝖓𝖌 𝖆 𝖈𝖎𝖌𝖆𝖗𝖊𝖙𝖙𝖊",
			""
		},
		{
			"𝖉𝖔𝖌 𝖘𝖚𝖐𝖆",
			"☆꧁✬ ᴀᴍɴᴇsɪᴀ.ᴘʟᴜs ✬꧂☆"
		},
		{
			"𝖘𝖐𝖊𝖊𝖙 𝖒𝖆𝖐𝖊𝖘 𝖒𝖊 𝖘𝖆𝖉",
			""
		}
	}
	slot_556_54_0 = {
		{
			"слишком легко",
			"для амнезии конечно же"
		},
		{
			"$$$ 1 TAP UFF YA $$$ ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩"
		},
		{
			"я ķ¤нɥåλ ϯβ¤£ü ɱåɱķ£ β Ƥ¤ϯ"
		},
		{
			"ваше сало хуй сосало",
			"поросенок пидор был"
		},
		{
			"матуха как?",
			"пиздец я злой.."
		},
		{
			"без amnesia.plus тяжело?"
		},
		{
			"ᅔ>.< член в заднице у пендосов ＡＭＮＥＳＩＡ.ＰＬＵＳᅕஃ",
			"ᅕＡＭＮＥＳＩＡ.ＰＬＵＳᅕ"
		},
		{
			"амнезия > ты",
			"глотнул коки яки"
		},
		{
			"купил бы amnesia.plus",
			"жил бы дольше"
		},
		{
			"ஃ♕ АМНЕЗИЯ.ПЛЮС ♕ஃ",
			"пиздил твою мать с росгвардейцами"
		},
		{
			"амнезийке минетик сделал",
			"премиум луаха конечно да"
		},
		{
			"спать",
			"узкий бля"
		},
		{
			"втопи ебальник свой",
			"безшейный хуесос"
		},
		{
			"выйди на улицу",
			"толстыи)"
		},
		{
			"я зашёл размяться",
			"ты зашёл пострадать"
		},
		{
			"у тебя аашки из хуйни какой-то",
			"у меня из amnesia.plus"
		},
		{
			"omagad",
			"vot eto vantap"
		},
		{
			"че там",
			"ротовыебанный"
		},
		{
			"с таким аимом",
			"тебе бы в кафе посуду мыть"
		},
		{
			"𝘩𝘵𝘵𝘱𝘴://𝘨𝘢𝘮𝘦𝘴𝘦𝘯𝘴𝘦.𝘱𝘶𝘣/𝘧𝘰𝘳𝘶𝘮𝘴/𝘷𝘪𝘦𝘸𝘵𝘰𝘱𝘪𝘤.𝘱𝘩𝘱?𝘪𝘥=279",
			"𝘵𝘳𝘺 𝘵𝘰 𝘤𝘩𝘦𝘤𝘬 𝘪𝘵"
		},
		{
			"я твою мать пиздил",
			"битой с гвоздями)"
		},
		{
			"inst @drainyaw",
			"сабнитесь пжшки"
		},
		{
			"анус рвал",
			"все специалисты с amnesia.plus"
		},
		{
			"АХАХАХАХАХ",
			"ЛЯМ ЗА КВАРТАЛ НА АМНЕЗИИ"
		},
		{
			"твой отец ебал меня",
			"своим ротиком)"
		},
		{
			"♕ neverlose.cc ♕",
			"♕ amnesia.plus ♕"
		},
		{
			"ещё один герой паблика",
			"без отца и без аима"
		},
		{
			"коннект кидай шлюха",
			"1х1 пойдем"
		}
	}
	slot_556_55_0 = {
		{
			"♕ neverlose.cc ♕ amnesia.plus ♕",
			""
		},
		{
			"бля ну в этом раунде амнезия не смогла мне помочь",
			"у тебя какой юид в никсваре?"
		},
		{
			"норм ты трекаешь шлюха",
			"нл заебал подворить лцху мою"
		},
		{
			"очколиз ебаный",
			"сорри за трештолк братан"
		},
		{
			"окей, дам тебе один хайлайт",
			""
		},
		{
			"𝐀𝐌𝐍𝐄𝐒𝐈𝐀.𝐏𝐋𝐔𝐒",
			"𝔸𝕄ℕ𝔼𝕊𝕀𝔸 𝕊𝕋𝔸𝔽𝔽 𝕄𝔼𝕄𝔹𝔼ℝ  "
		},
		{
			"сын пидора ебаный",
			"ой"
		},
		{
			"ладно, расслабил амнезию на секунду",
			""
		},
		{
			"ez",
			""
		},
		{
			"𝐝𝐢𝐬𝐜𝐨𝐫𝐝.𝐠𝐠/𝐚𝐧𝐭𝐢𝐡𝐢𝐭",
			"𝙙𝙞𝙨𝙘𝙤𝙧𝙙.𝙜𝙜/𝙖𝙣𝙩𝙞𝙝𝙞𝙩"
		},
		{
			"я твой резик проверил",
			"амнезийка спасет в некст раунде"
		},
		{
			"ты меня заебал хуесос",
			"кидай дс пидорас 1х1 пойдем"
		}
	}
	slot_556_56_0 = {
		{
			"sᴜʙsᴄʀɪʙᴇ ",
			"𝐝𝐢𝐬𝐜𝐨𝐫𝐝.𝐠𝐠/𝐚𝐧𝐭𝐢𝐡𝐢𝐭"
		}
	}
	slot_556_57_0 = {
		{
			"закончилась мана",
			"ублюдок сука"
		},
		{
			"ну только меня и можешь убивать",
			"колдун ебучий"
		},
		{
			"сдох",
			"бичара ебаный"
		}
	}

	function slot_0_78_0.say_exec(arg_674_0)
		arg_674_0 = tostring(arg_674_0 or ""):gsub("\"", "")

		if arg_674_0 == "" then
			return
		end

		pcall(function()
			utils.console_exec("say \"" .. arg_674_0 .. "\"")
		end)
	end

	slot_556_58_0 = slot_0_78_0.say_exec

	function slot_556_59_0(arg_676_0)
		slot_556_58_0(tostring(arg_676_0 or ""))
	end

	function slot_556_60_0(arg_677_0)
		if type(arg_677_0) ~= "table" then
			slot_556_59_0(arg_677_0)

			return
		end

		local var_677_0 = 1.5
		local var_677_1 = 0

		for iter_677_0 = 1, #arg_677_0 do
			local var_677_2 = tostring(arg_677_0[iter_677_0] or ""):gsub("^%s+", ""):gsub("%s+$", ""):gsub("\"", "")

			if var_677_2 ~= "" then
				var_677_1 = var_677_1 + 1

				local var_677_3 = var_677_0 * var_677_1

				utils.execute_after(var_677_3, function()
					if not globals.is_connected then
						return
					end

					slot_0_78_0.say_exec(var_677_2)
				end)
			end
		end
	end

	function slot_556_61_0(arg_679_0)
		if not arg_679_0 then
			return false
		end

		local var_679_0, var_679_1 = pcall(function()
			return type(arg_679_0.is_player) == "function" and arg_679_0:is_player() == true
		end)

		return var_679_0 and var_679_1 == true
	end

	function slot_556_62_0(arg_681_0)
		if not slot_556_61_0(arg_681_0) then
			return false
		end

		local var_681_0, var_681_1 = pcall(function()
			return arg_681_0:is_enemy()
		end)

		return var_681_0 and var_681_1 == true
	end

	function slot_556_63_0(arg_683_0)
		if type(arg_683_0) ~= "table" then
			return
		end

		local var_683_0 = entity.get_local_player()
		local var_683_1, var_683_2 = pcall(function()
			return slot_0_152_0.vars.trashtalk_enable:get()
		end)

		if not var_683_0 or not var_683_1 or not var_683_2 then
			return
		end

		local var_683_3, var_683_4 = pcall(function()
			return slot_0_152_0.vars.trashtalk_enable.no_warmup:get()
		end)

		if var_683_3 and var_683_4 then
			local var_683_5 = entity.get_game_rules()

			if var_683_5 and var_683_5.m_bWarmupPeriod == true then
				return
			end
		end

		local var_683_6 = slot_556_50_0()

		if slot_556_48_0 and not slot_556_51_0() then
			slot_556_48_0 = nil
		end

		if slot_556_48_0 and slot_556_51_0() and tonumber(slot_556_48_0) == tonumber(arg_683_0.userid) then
			slot_556_48_0 = nil

			if var_683_6 == "1" then
				local var_683_7 = {
					"❶",
					"1",
					"1.",
					"e1",
					"𝟙",
					"₁",
					"∙∙·▫▫ᵒᴼᵒ▫ₒₒ▫ᵒᴼ①ᴼᵒ▫ₒₒ▫ᵒᴼᵒ▫▫·∙∙"
				}

				slot_556_59_0(var_683_7[math.random(1, #var_683_7)])
			elseif var_683_6 == "Russian" then
				local var_683_8 = slot_556_57_0[math.random(1, #slot_556_57_0)] or {}

				slot_556_60_0(var_683_8)
			else
				local var_683_9 = slot_556_56_0[math.random(1, #slot_556_56_0)] or {}

				slot_556_60_0(var_683_9)
			end

			return
		end

		local var_683_10 = string.format("%s|%s|%s", tostring(arg_683_0.userid), tostring(arg_683_0.attacker), tostring(globals.tickcount))

		if slot_556_49_0 == var_683_10 then
			return
		end

		slot_556_49_0 = var_683_10

		local var_683_11 = entity.get(arg_683_0.userid, true)
		local var_683_12 = entity.get(arg_683_0.attacker, true)

		if not var_683_11 or not slot_556_61_0(var_683_11) then
			return
		end

		local var_683_13, var_683_14 = pcall(function()
			return var_683_11 == var_683_0
		end)
		local var_683_15, var_683_16 = pcall(function()
			return var_683_12 == var_683_0
		end)

		if not var_683_13 or not var_683_15 then
			return
		end

		local var_683_17, var_683_18 = pcall(function()
			return slot_0_152_0.vars.trashtalk_enable.conds:get("On Kill")
		end)
		local var_683_19, var_683_20 = pcall(function()
			return slot_0_152_0.vars.trashtalk_enable.conds:get("On Death")
		end)

		if var_683_16 and not var_683_14 and slot_556_62_0(var_683_11) and var_683_17 and var_683_18 then
			if var_683_6 == "1" then
				local var_683_21 = {
					"❶",
					"1",
					"1.",
					"e1",
					"𝟙",
					"₁",
					"∙∙·▫▫ᵒᴼᵒ▫ₒₒ▫ᵒᴼ①ᴼᵒ▫ₒₒ▫ᵒᴼᵒ▫▫·∙∙"
				}

				slot_556_59_0(var_683_21[math.random(1, #var_683_21)])
			elseif var_683_6 == "Russian" then
				local var_683_22 = slot_556_54_0[math.random(1, #slot_556_54_0)] or {}

				slot_556_60_0(var_683_22)
			else
				local var_683_23 = slot_556_52_0[math.random(1, #slot_556_52_0)] or {}

				slot_556_60_0(var_683_23)
			end
		elseif var_683_14 and not var_683_16 and slot_556_62_0(var_683_12) and var_683_19 and var_683_20 then
			if slot_556_51_0() then
				local var_683_24 = arg_683_0.attacker

				if var_683_24 and tonumber(var_683_24) and tonumber(var_683_24) > 0 then
					slot_556_48_0 = var_683_24
				end

				if var_683_6 == "1" then
					return
				end
			end

			if var_683_6 == "Russian" then
				local var_683_25 = slot_556_55_0[math.random(1, #slot_556_55_0)] or {}

				slot_556_60_0(var_683_25)
			else
				local var_683_26 = slot_556_53_0[math.random(1, #slot_556_53_0)] or {}

				slot_556_60_0(var_683_26)
			end
		end
	end

	events.player_death:set(function(arg_690_0)
		pcall(function(arg_691_0)
			if slot_0_78_0.track_death_log then
				slot_0_78_0.track_death_log(arg_691_0)
			end
		end, arg_690_0)
		pcall(function(arg_692_0)
			if slot_0_78_0.personal_stats_on_player_death then
				slot_0_78_0.personal_stats_on_player_death(arg_692_0)
			end
		end, arg_690_0)
		pcall(function()
			if slot_0_78_0.hc_manip_on_kill then
				slot_0_78_0.hc_manip_on_kill(arg_690_0)
			end
		end)
		pcall(function(arg_694_0)
			if slot_0_89_0 and slot_0_89_0.on_local_enemy_kill then
				slot_0_89_0.on_local_enemy_kill(arg_694_0)
			end
		end, arg_690_0)
		pcall(function()
			if slot_0_78_0.lobby_badge_resync then
				slot_0_78_0.lobby_badge_resync()
			end
		end)
		pcall(slot_556_63_0, arg_690_0)
	end)

	function slot_556_64_0(arg_696_0)
		if not globals.is_connected then
			return nil
		end

		local var_696_0 = globals.tickinterval
		local var_696_1 = utils.net_channel()
		local var_696_2 = var_696_1 and var_696_1.avg_latency and var_696_1.avg_latency[0] or 0
		local var_696_3 = (globals.tickcount + math.floor(var_696_2 / var_696_0 + 0.5)) / math.floor(0.3 / var_696_0 + 0.5)

		return arg_696_0[math.floor(var_696_3 % #arg_696_0) + 1]
	end

	slot_556_65_0 = ""
	slot_556_66_0 = {
		"|",
		"a|",
		"am|",
		"amn|",
		"amne|",
		"amnes|",
		"amnesi|",
		"amnesia|",
		"amnesia",
		"amnesia|",
		"amnesia",
		"amnesia|",
		"amnesi|",
		"amnes|",
		"amne|",
		"amn|",
		"am|",
		"a|",
		"|",
		" "
	}

	function slot_556_67_0(arg_697_0)
		pcall(common.set_clan_tag, arg_697_0 or "")
	end

	function slot_556_68_0()
		if not globals.is_connected then
			return
		end

		if not slot_0_152_0.vars.clantag_enable:get() then
			if slot_556_65_0 ~= "" then
				slot_556_67_0("\x00")

				slot_556_65_0 = ""
			end

			return
		end

		local var_698_0 = slot_556_64_0(slot_556_66_0)

		if var_698_0 and var_698_0 ~= slot_556_65_0 then
			slot_556_67_0(var_698_0)

			slot_556_65_0 = var_698_0
		end
	end

	function slot_556_69_0(arg_699_0)
		arg_699_0 = tostring(arg_699_0 or "live"):lower()

		if arg_699_0 == "alpha" then
			return ""
		elseif arg_699_0 == "debug" then
			return ""
		end

		return ""
	end

	function slot_556_70_0()
		local var_700_0 = globals.realtime
		local var_700_1 = tostring(slot_0_25_0 or "live"):lower()

		if slot_0_78_0.sidebar_typing and slot_0_78_0.sidebar_typing.last_build_channel ~= var_700_1 then
			local var_700_2 = slot_556_69_0(var_700_1)

			slot_0_78_0.sidebar_typing.last_build_channel = var_700_1
			slot_0_78_0.sidebar_typing.text_plain = "amnesia.plus • " .. var_700_2
			slot_0_78_0.sidebar_typing.text_marked = "amnesia.plus • \a{Link Active}" .. var_700_2
			slot_0_78_0.sidebar_typing.shown = ""
			slot_0_78_0.sidebar_typing.idx = 1
			slot_0_78_0.sidebar_typing.next_at = var_700_0
			slot_0_78_0.sidebar_typing.done = false
		end

		if not slot_0_78_0.sidebar_typing.done and var_700_0 >= slot_0_78_0.sidebar_typing.next_at then
			slot_0_78_0.sidebar_typing.shown = slot_0_78_0.sidebar_typing.text_plain:sub(1, slot_0_78_0.sidebar_typing.idx)

			if slot_0_78_0.sidebar_typing.idx >= #slot_0_78_0.sidebar_typing.text_plain then
				slot_0_78_0.sidebar_typing.done = true
				slot_0_78_0.sidebar_typing.shown = slot_0_78_0.sidebar_typing.text_plain
			else
				slot_0_78_0.sidebar_typing.idx = slot_0_78_0.sidebar_typing.idx + 1
				slot_0_78_0.sidebar_typing.next_at = var_700_0 + 0.14
			end
		end

		if slot_0_78_0.sidebar_typing.done then
			ui.sidebar(slot_0_78_0.sidebar_typing.text_marked, "capsules")
		else
			local var_700_3 = math.floor(var_700_0 * 2) % 2 == 0 and "|" or ""

			ui.sidebar(slot_0_78_0.sidebar_typing.shown .. var_700_3, "capsules")
		end
	end

	slot_0_78_0.refresh_config_list = slot_556_16_0
	slot_0_78_0.get_velocity = slot_556_17_0
	slot_0_78_0.set_cfg_status_temporary = slot_556_5_0
	slot_0_78_0.selected_config_name = slot_556_14_0
	slot_0_78_0.sanitize_config_ui = slot_556_9_0
	slot_0_78_0.cfg_sync_linked_selectors = slot_556_10_0
	slot_0_78_0.apply_viewmodel = slot_556_36_0
	slot_0_78_0.vm_viewmodel_tick = slot_556_34_0
	slot_0_78_0.vm_restore_stock = slot_556_32_0
	slot_0_78_0.scope_overlay_sync = slot_556_40_0
	slot_0_78_0.scope_force_vm_sync = slot_556_42_0
	slot_0_78_0.apply_aspect_ratio = slot_556_20_0
	slot_0_78_0.aspect_cfg_reload = slot_556_21_0
	slot_0_78_0.draw_custom_scope = slot_556_46_0
	slot_0_78_0.clantag = slot_556_68_0
	slot_0_78_0.sidebar_tick = slot_556_70_0
end)()
;(function()
	function slot_701_0_0(arg_702_0)
		if not arg_702_0 then
			return false
		end

		return bit.band(arg_702_0.m_fFlags or 0, 1) == 0
	end

	function slot_701_1_0(arg_703_0)
		if not arg_703_0 then
			return false
		end

		return (arg_703_0.m_flDuckAmount or 0) > 0.7
	end

	function slot_701_2_0(arg_704_0)
		if not arg_704_0 then
			return false
		end

		return bit.band(arg_704_0.m_fFlags or 0, 4) == 4
	end

	function slot_701_3_0(arg_705_0)
		return math.floor(0.5 + arg_705_0 / globals.tickinterval)
	end

	function slot_701_4_0()
		local var_706_0 = entity.get_local_player()

		if not var_706_0 then
			return 0
		end

		local var_706_1 = slot_701_3_0(var_706_0.m_flSimulationTime)
		local var_706_2 = var_706_1 - (slot_0_78_0.prev_simulation_time or 0)

		slot_0_78_0.prev_simulation_time = var_706_1

		return var_706_2
	end

	function slot_701_5_0()
		if refs.fd:get() == true or refs.dt:get() == true or refs.hs:get() == true then
			return false
		end

		local var_707_0 = slot_0_152_0.antiaim.builder_states[8]

		return var_707_0 and var_707_0.enabled:get() or false
	end

	function slot_701_6_0()
		local var_708_0 = 1
		local var_708_1 = ""
		local var_708_2 = entity.get_local_player()

		if var_708_2 and var_708_2.m_iHealth > 0 then
			local var_708_3 = refs.fd:get() == true
			local var_708_4 = refs.sw:get() == true
			local var_708_5

			var_708_5 = refs.dt:get() == true

			local var_708_6

			var_708_6 = refs.hs:get() == true

			local var_708_7 = slot_701_1_0(var_708_2)
			local var_708_8 = slot_0_78_0.get_velocity(var_708_2) < 3 and not var_708_4 and not slot_701_0_0(var_708_2) and not var_708_7 and not var_708_3
			local var_708_9 = slot_0_78_0.get_velocity(var_708_2) >= 3 and not var_708_4 and not slot_701_0_0(var_708_2) and not var_708_7 and not var_708_3
			local var_708_10 = slot_701_0_0(var_708_2) and not var_708_4 and not var_708_7
			local var_708_11 = slot_701_0_0(var_708_2) and var_708_7 and not var_708_4
			local var_708_12 = (var_708_7 or var_708_3) and not var_708_4 and not var_708_10 and not var_708_11
			local var_708_13 = slot_701_5_0()
			local var_708_14 = {
				var_708_8,
				var_708_9,
				var_708_4,
				var_708_10,
				var_708_11,
				var_708_12,
				var_708_13
			}

			for iter_708_0 = 1, #var_708_14 do
				if var_708_14[iter_708_0] then
					var_708_0 = iter_708_0 + 1
					var_708_1 = AA_CONDITIONS_NON_GLOBAL[iter_708_0]
				end
			end
		end

		return {
			var_708_0,
			var_708_1
		}
	end

	function slot_701_7_0()
		local var_709_0 = slot_0_153_0()

		if var_709_0 == "Left" then
			refs.base:override("Local View")

			return -90
		elseif var_709_0 == "Right" then
			refs.base:override("Local View")

			return 90
		elseif var_709_0 == "Forward" then
			refs.base:override("Local View")

			return 180
		end

		refs.base:override("At Target")

		return 0
	end

	function slot_701_8_0()
		local var_710_0 = entity.get_local_player()

		if not var_710_0 then
			return false
		end

		return slot_701_0_0(var_710_0) and slot_0_152_0.antiaim.freestand.safety_disablers:get() == true
	end

	function slot_701_9_0()
		local var_711_0 = entity.get_game_rules()

		if not var_711_0 then
			return false
		end

		return slot_0_152_0.antiaim.static_warmup:get() and var_711_0.m_bWarmupPeriod == true
	end

	function slot_701_10_0()
		if slot_0_154_0() then
			refs.freestanding:override(false)
			refs.yaw_mod_free:override(false)

			return
		end

		if slot_701_8_0() == false then
			refs.freestanding:override(slot_0_152_0.antiaim.freestand:get())
			refs.yaw_mod_free:override(slot_0_152_0.antiaim.freestand.static_yaw:get() == true)
		else
			refs.freestanding:override(false)
			refs.yaw_mod_free:override(false)
		end
	end

	function slot_701_11_0(arg_713_0)
		if not arg_713_0 or not slot_0_154_0() then
			return false
		end

		local var_713_0 = false

		pcall(function()
			var_713_0 = slot_0_152_0.antiaim.manual_yaw.static_yaw:get() == true
		end)

		if not var_713_0 then
			return false
		end

		local var_713_1 = false

		pcall(function()
			var_713_1 = arg_713_0.m_flPoseParameter and arg_713_0.m_flPoseParameter[11] and arg_713_0.m_flPoseParameter[11] * 120 - 60 > 0
		end)
		refs.pitch:override("Disabled")
		refs.yaw:override("Static")
		refs.yaw_mod:override("Disabled")
		refs.yaw_mod_degree:override(0)
		refs.offset:override(slot_701_7_0())
		refs.body_yaw:override(true)
		refs.inverter:override(var_713_1 == true)
		refs.left_limit:override(60)
		refs.right_limit:override(60)
		refs.fake_options:override("")
		refs.body_freestanding:override()
		refs.desync_freestand:override()
		refs.hidden:override(false)
		refs.extended:override(false)
		refs.extended_p:override(0)

		slot_0_78_0.jit_yaw = 0
		slot_0_78_0.yaw_add = 0

		return true
	end

	slot_0_78_0.legit_aa = {
		armed = false,
		hold = false
	}

	function slot_701_12_0(arg_716_0)
		if not arg_716_0 then
			return false
		end

		local var_716_0, var_716_1 = pcall(function()
			return common.is_button_down(69)
		end)

		if var_716_0 and var_716_1 == true then
			return true
		end

		return arg_716_0.in_use == true
	end

	function slot_701_13_0(arg_718_0)
		if not arg_718_0 then
			return true
		end

		local var_718_0, var_718_1 = pcall(function()
			return arg_718_0.m_bIsDefusing
		end)

		if var_718_0 and var_718_1 then
			return true
		end

		local var_718_2, var_718_3 = pcall(function()
			return arg_718_0.m_bIsGrabbingHostage
		end)
		local var_718_4 = var_718_3

		if var_718_2 and var_718_4 then
			return true
		end

		return false
	end

	function slot_701_14_0(arg_721_0, arg_721_1)
		if not arg_721_0 or not arg_721_1 then
			return true
		end

		if arg_721_0.m_iTeamNum ~= 3 then
			return true
		end

		if (arg_721_1.view_angles and arg_721_1.view_angles.x or 0) <= 15 then
			return true
		end

		local var_721_0 = arg_721_0:get_origin()

		if not var_721_0 then
			return true
		end

		local var_721_1, var_721_2 = pcall(entity.get_entities, 129)

		if var_721_1 and type(var_721_2) == "table" then
			for iter_721_0 = 1, #var_721_2 do
				local var_721_3 = var_721_2[iter_721_0]

				if var_721_3 and type(var_721_3.get_origin) == "function" then
					local var_721_4, var_721_5 = pcall(var_721_3.get_origin, var_721_3)

					if var_721_4 and var_721_5 and var_721_0:dist(var_721_5) < 61 then
						return false
					end
				end
			end
		end

		return true
	end

	function slot_701_15_0()
		refs.hidden:override(false)
		refs.pitch:override("Disabled")
		refs.yaw:override("Backward")
		refs.base:override("Local View")
		refs.yaw_mod_degree:override(0)
		refs.yaw_mod:override("Disabled")
		refs.offset:override(180)
		refs.left_limit:override(0)
		refs.right_limit:override(0)
		refs.fake_options:override("")
		refs.body_freestanding:override(true)
		refs.desync_freestand:override("Peek Real")
		refs.body_yaw:override(true)

		slot_0_78_0.jit_yaw = 0
		slot_0_78_0.yaw_add = 0
	end

	function slot_701_16_0(arg_723_0, arg_723_1)
		if not slot_0_152_0.antiaim.legit_aa or slot_0_152_0.antiaim.legit_aa:get() ~= true then
			slot_0_78_0.legit_aa.armed = false
			slot_0_78_0.legit_aa.hold = false

			return false
		end

		if slot_701_13_0(arg_723_1) then
			return false
		end

		if slot_701_12_0(arg_723_0) then
			if not slot_0_78_0.legit_aa.armed then
				slot_0_78_0.legit_aa.armed = true
				slot_0_78_0.legit_aa.hold = true

				return false
			end

			if slot_0_78_0.legit_aa.hold then
				if slot_701_14_0(arg_723_1, arg_723_0) then
					arg_723_0.in_use = false

					slot_701_15_0()

					slot_0_78_0.legit_aa.hold = false

					return true
				end

				return false
			end

			slot_701_15_0()

			return true
		end

		if slot_0_78_0.legit_aa.armed then
			slot_0_78_0.legit_aa.armed = false
			slot_0_78_0.legit_aa.hold = false
		end

		return false
	end

	function slot_701_17_0(arg_724_0)
		local var_724_0 = render.camera_angles()
		local var_724_1 = render.camera_position()
		local var_724_2 = vector():angles(var_724_0)
		local var_724_3 = entity.get_entities()
		local var_724_4 = math.huge
		local var_724_5 = math.huge
		local var_724_6 = entity.get_local_player()

		if not var_724_6 then
			return false
		end

		for iter_724_0 = 1, #var_724_3 do
			local var_724_7 = var_724_3[iter_724_0]

			if var_724_7 then
				local var_724_8 = false

				if var_724_7.get_classname and var_724_7:get_classname() == "CPropDoorRotating" then
					var_724_8 = true
				elseif var_724_7.is_weapon and var_724_7:is_weapon() and var_724_7.get_weapon_owner and var_724_7:get_weapon_owner() ~= var_724_6 and var_724_7.is_visible and var_724_7:is_visible() then
					var_724_8 = true
				end

				if var_724_8 then
					local var_724_9

					if var_724_7.get_classname and var_724_7:get_classname() == "CPropDoorRotating" then
						local var_724_10 = var_724_7:get_origin()

						var_724_9 = vector(var_724_10.x, var_724_10.y, var_724_10.z + 50)
					else
						var_724_9 = var_724_7:get_origin()
					end

					local var_724_11 = var_724_6:get_origin()
					local var_724_12 = var_724_9:dist_to_ray(var_724_1, var_724_2)

					if var_724_12 < var_724_4 then
						var_724_5 = var_724_11:dist(var_724_9)
						var_724_4 = var_724_12
					end
				end
			end
		end

		if (slot_0_78_0.in_bombzone or var_724_4 > 45 or var_724_5 > 105) and var_724_6.m_iTeamNum == 2 then
			arg_724_0.in_use = false

			return true
		end

		return false
	end

	slot_701_18_0 = 31

	function slot_701_19_0(arg_725_0)
		local var_725_0 = {
			59,
			42,
			500,
			503,
			505,
			506,
			507,
			508,
			509,
			512,
			514,
			515,
			516,
			517,
			518,
			519,
			520,
			521,
			522,
			523
		}

		for iter_725_0 = 1, #var_725_0 do
			if var_725_0[iter_725_0] == arg_725_0 then
				return true
			end
		end

		return false
	end

	function slot_701_20_0()
		local var_726_0 = slot_0_152_0.antiaim.safe_head.weapons
		local var_726_1, var_726_2 = pcall(function()
			return var_726_0:get()
		end)

		if not var_726_1 or var_726_2 == nil then
			return 1
		end

		if type(var_726_2) == "number" and var_726_2 >= 1 and var_726_2 <= 4 then
			return var_726_2
		end

		return 1
	end

	function slot_701_21_0(arg_728_0)
		if arg_728_0 == nil then
			return false
		end

		local var_728_0 = slot_701_20_0()

		if var_728_0 == 4 then
			return true
		end

		if var_728_0 == 1 then
			return arg_728_0 == slot_701_18_0 or slot_701_19_0(arg_728_0)
		end

		if var_728_0 == 2 then
			return slot_701_19_0(arg_728_0)
		end

		return arg_728_0 == slot_701_18_0
	end

	function slot_701_22_0()
		local var_729_0 = slot_0_152_0.antiaim.safe_head

		if not var_729_0 or not var_729_0.height_gap then
			return 0
		end

		local var_729_1, var_729_2 = pcall(function()
			return var_729_0.height_gap:get()
		end)

		if var_729_1 and type(var_729_2) == "number" then
			return var_729_2
		end

		return 0
	end

	function slot_701_23_0(arg_731_0, arg_731_1)
		arg_731_1 = arg_731_1 or slot_701_22_0()

		if arg_731_1 <= 0 then
			return true
		end

		local var_731_0 = entity.get_threat(false)

		if not var_731_0 or not var_731_0:is_alive() then
			return false
		end

		local var_731_1 = arg_731_0:get_origin()
		local var_731_2 = var_731_0:get_origin()

		if not var_731_1 or not var_731_2 or var_731_1.z == nil or var_731_2.z == nil then
			return false
		end

		return var_731_1.z - arg_731_1 > var_731_2.z
	end

	function slot_701_24_0(arg_732_0)
		if not slot_0_152_0.antiaim.safe_head:get() then
			return false
		end

		local var_732_0 = entity.get_local_player()

		if not var_732_0 or not var_732_0:is_alive() then
			return false
		end

		local var_732_1 = entity.get_threat(false)

		if not var_732_1 or not var_732_1:is_alive() then
			return false
		end

		local var_732_2 = slot_701_22_0()

		if not slot_701_23_0(var_732_0, var_732_2) then
			return false
		end

		local var_732_3 = slot_0_152_0.antiaim.safe_head.conditions
		local var_732_4 = slot_701_0_0(var_732_0)
		local var_732_5 = var_732_4 and slot_701_2_0(var_732_0)
		local var_732_6 = not var_732_4
		local var_732_7 = slot_701_1_0(var_732_0)
		local var_732_8 = slot_0_78_0.get_velocity and slot_0_78_0.get_velocity(var_732_0) or 0

		if var_732_3:get("Air~C") and var_732_5 and slot_701_21_0(arg_732_0) then
			return true
		end

		if var_732_3:get("Air") and var_732_4 and not var_732_5 and slot_701_21_0(arg_732_0) then
			return true
		end

		if var_732_3:get("Stand") and var_732_6 and not var_732_7 and var_732_8 < 3 then
			return true
		end

		if var_732_3:get("Crouch") and var_732_6 and var_732_7 then
			return true
		end

		return false
	end

	function slot_701_25_0(arg_733_0)
		local var_733_0 = slot_0_152_0.antiaim.builder_states[arg_733_0]

		if not var_733_0 then
			return 0
		end

		if var_733_0.yaw.method:get() == "Sync" then
			return var_733_0.yaw.yaw_add_right:get()
		end

		return var_733_0.yaw.yaw_add_right:get()
	end

	function slot_701_26_0(arg_734_0, arg_734_1)
		if not arg_734_0 then
			return arg_734_1
		end

		local var_734_0, var_734_1 = pcall(function()
			return arg_734_0:get()
		end)

		if not var_734_0 or var_734_1 == nil then
			return arg_734_1
		end

		return var_734_1
	end

	function slot_701_27_0(arg_736_0)
		if not arg_736_0 or not arg_736_0.yaw or not arg_736_0.yaw.method or type(arg_736_0.yaw.method.get) ~= "function" then
			return "180"
		end

		local var_736_0 = slot_701_26_0(arg_736_0.yaw.method, "180")

		if var_736_0 == "180 L&R" then
			return "180"
		end

		return var_736_0
	end

	function slot_701_28_0(arg_737_0)
		local var_737_0 = slot_0_78_0.anti_brute.active == true

		slot_0_78_0.anti_brute.active = false
		slot_0_78_0.anti_brute.until_time = 0
		slot_0_78_0.anti_brute.yaw_shift = 0
		slot_0_78_0.anti_brute.desync_cut = 0
		slot_0_78_0.anti_brute.last_trigger_tick = -1

		if arg_737_0 == "timeout" and var_737_0 then
			pcall(function()
				if slot_0_78_0.aa_brute_reset_log then
					slot_0_78_0.aa_brute_reset_log()
				end
			end)
		end
	end

	function slot_701_29_0()
		local var_739_0 = slot_0_152_0.antiaim.anti_brute

		if not var_739_0 or not var_739_0:get() then
			return false
		end

		if not slot_0_78_0.anti_brute.active then
			return false
		end

		if (globals.realtime or 0) >= (slot_0_78_0.anti_brute.until_time or 0) then
			slot_701_28_0("timeout")

			return false
		end

		return true
	end

	function slot_701_30_0(arg_740_0, arg_740_1)
		local var_740_0 = slot_0_152_0.antiaim.anti_brute

		if not var_740_0 or not var_740_0:get() then
			return
		end

		local var_740_1 = globals.tickcount or 0

		if slot_0_78_0.anti_brute.last_trigger_tick == var_740_1 then
			return
		end

		local var_740_2 = entity.get_local_player()

		if not var_740_2 or var_740_2.m_iHealth <= 0 then
			return
		end

		if slot_0_78_0.anti_brute.last_hit_tick == var_740_1 then
			return
		end

		slot_0_78_0.anti_brute.last_trigger_tick = var_740_1

		local var_740_3 = slot_701_6_0()[1]
		local var_740_4 = slot_0_152_0.antiaim.builder_states[var_740_3] and slot_0_152_0.antiaim.builder_states[var_740_3].enabled:get() and slot_0_152_0.antiaim.builder_states[var_740_3] or slot_0_152_0.antiaim.builder_states[1]

		if not var_740_4 then
			return
		end

		local var_740_5 = slot_701_26_0(var_740_0.method, "Decrease")
		local var_740_6 = slot_701_26_0(var_740_0.duration, 3)
		local var_740_7 = globals.realtime or 0
		local var_740_8 = slot_701_27_0(var_740_4)
		local var_740_9 = slot_701_26_0(var_740_4.offset, slot_701_26_0(var_740_4.yaw.yaw_add_left, 0))
		local var_740_10 = slot_701_26_0(var_740_4.body_yaw.left_limit, 58)
		local var_740_11 = slot_701_26_0(var_740_4.body_yaw.right_limit, 58)
		local var_740_12 = math.max(math.abs(var_740_10), math.abs(var_740_11))

		slot_0_78_0.anti_brute.active = true
		slot_0_78_0.anti_brute.until_time = var_740_6 > 0 and var_740_7 + var_740_6 or math.huge

		if var_740_5 == "Randomize" then
			local var_740_13 = math.max(math.abs(var_740_9), 1)

			slot_0_78_0.anti_brute.yaw_shift = math.random(-var_740_13, var_740_13) / 3
			slot_0_78_0.anti_brute.desync_cut = math.random(0, 1) == 1 and var_740_10 / 4 or var_740_11 / 4
		elseif var_740_5 == "Increase" then
			slot_0_78_0.anti_brute.yaw_shift = var_740_9 / 2
			slot_0_78_0.anti_brute.desync_cut = var_740_12 / 2
		else
			slot_0_78_0.anti_brute.yaw_shift = var_740_9 / 3
			slot_0_78_0.anti_brute.desync_cut = var_740_12 / 4
		end

		pcall(function()
			if slot_0_78_0.aa_brute_log then
				slot_0_78_0.aa_brute_log(arg_740_0)
			end
		end)
	end

	function slot_701_31_0()
		if not slot_701_29_0() then
			return 0
		end

		return slot_0_78_0.anti_brute.yaw_shift or 0
	end

	function slot_701_32_0()
		if not slot_701_29_0() then
			return 0
		end

		return slot_0_78_0.anti_brute.desync_cut or 0
	end

	function slot_701_33_0(arg_744_0)
		while arg_744_0 > 180 do
			arg_744_0 = arg_744_0 - 360
		end

		while arg_744_0 < -180 do
			arg_744_0 = arg_744_0 + 360
		end

		return arg_744_0
	end

	slot_0_78_0.misc = slot_0_78_0.misc or {
		grenade_pred_dmg = 0,
		drop_grenades_prev = false,
		super_toss_active = false,
		voice_mute_map = {}
	}
	slot_701_34_0 = {
		"vgui_white",
		"vgui/hud/800corner1",
		"vgui/hud/800corner2",
		"vgui/hud/800corner3",
		"vgui/hud/800corner4"
	}
	slot_701_35_0 = {
		CMolotovGrenade = "Molotov",
		CIncendiaryGrenade = "Molotov",
		CHEGrenade = "High Explosive"
	}
	slot_701_36_0 = {
		CMolotovGrenade = "weapon_molotov",
		CIncendiaryGrenade = "weapon_incgrenade",
		CHEGrenade = "weapon_hegrenade"
	}

	function slot_701_37_0()
		if slot_0_78_0.misc.voice_mute_fn then
			return slot_0_78_0.misc.voice_mute_fn
		end

		local var_745_0, var_745_1 = pcall(function()
			return {
				mute = utils.get_vfunc("client.dll", "GameClientExports001", 2, "void(__thiscall*)(void*, int idx)"),
				unmute = utils.get_vfunc("client.dll", "GameClientExports001", 3, "void(__thiscall*)(void*, int idx)"),
				is_muted = utils.get_vfunc("client.dll", "GameClientExports001", 1, "bool(__thiscall*)(void*, int idx)")
			}
		end)

		if var_745_0 then
			slot_0_78_0.misc.voice_mute_fn = var_745_1
		end

		return slot_0_78_0.misc.voice_mute_fn
	end

	function slot_701_38_0(arg_747_0, arg_747_1)
		return arg_747_0 and arg_747_0 ~= arg_747_1 and type(arg_747_0.is_player) == "function" and arg_747_0:is_player() == true
	end

	function slot_701_39_0()
		local var_748_0 = slot_0_152_0.vars and slot_0_152_0.vars.mute_manipulations

		if not var_748_0 or var_748_0:get() ~= true or not var_748_0.mode then
			return
		end

		local var_748_1 = slot_701_37_0()

		if not var_748_1 then
			return
		end

		local var_748_2 = entity.get_local_player()

		if not var_748_2 then
			return
		end

		local var_748_3 = var_748_0.mode:get()

		for iter_748_0, iter_748_1 in ipairs(entity.get_players(false, true) or {}) do
			if slot_701_38_0(iter_748_1, var_748_2) then
				local var_748_4 = iter_748_1:get_index()
				local var_748_5 = ("%s::%s"):format(iter_748_1:get_name() or "?", var_748_4)

				if var_748_3 == 1 and var_748_1.is_muted(var_748_4) == true and slot_0_78_0.misc.voice_mute_map[var_748_5] ~= "unmuted" then
					pcall(var_748_1.unmute, var_748_4)

					slot_0_78_0.misc.voice_mute_map[var_748_5] = "unmuted"
				elseif var_748_3 == 2 and var_748_1.is_muted(var_748_4) == false and slot_0_78_0.misc.voice_mute_map[var_748_5] ~= "muted" then
					pcall(var_748_1.mute, var_748_4)

					slot_0_78_0.misc.voice_mute_map[var_748_5] = "muted"
				end
			end
		end
	end

	function slot_701_40_0()
		slot_0_78_0.misc.voice_mute_map = {}

		local var_749_0 = slot_701_37_0()

		if not var_749_0 then
			return
		end

		for iter_749_0, iter_749_1 in ipairs(entity.get_players(false, true) or {}) do
			if iter_749_1 and type(iter_749_1.get_index) == "function" then
				pcall(var_749_0.unmute, iter_749_1:get_index())
			end
		end
	end

	function slot_701_41_0()
		if slot_0_78_0.misc.console_mats then
			return slot_0_78_0.misc.console_mats
		end

		local var_750_0 = {}

		for iter_750_0 = 1, #slot_701_34_0 do
			local var_750_1 = slot_701_34_0[iter_750_0]
			local var_750_2 = materials.get(var_750_1)

			if var_750_2 == nil then
				local var_750_3 = materials.get_materials(var_750_1)

				var_750_2 = var_750_3 and var_750_3[1] or nil
			end

			if var_750_2 and var_750_2.is_valid and var_750_2:is_valid() then
				var_750_0[#var_750_0 + 1] = var_750_2
			end
		end

		slot_0_78_0.misc.console_mats = var_750_0

		return var_750_0
	end

	function slot_701_42_0(arg_751_0)
		local var_751_0 = slot_701_41_0()

		if #var_751_0 == 0 then
			return
		end

		if slot_0_78_0.misc.console_last == arg_751_0 then
			return
		end

		for iter_751_0 = 1, #var_751_0 do
			local var_751_1 = var_751_0[iter_751_0]

			pcall(function()
				var_751_1:alpha_modulate((arg_751_0.a or 255) / 255)
				var_751_1:color_modulate(color(arg_751_0.r, arg_751_0.g, arg_751_0.b))
			end)
		end

		slot_0_78_0.misc.console_last = arg_751_0
	end

	function slot_701_43_0()
		slot_701_42_0(color())
	end

	function slot_701_44_0()
		local var_754_0 = slot_0_152_0.vars and slot_0_152_0.vars.console_color

		if not var_754_0 or var_754_0:get() ~= true or not var_754_0.color then
			slot_701_43_0()

			return
		end

		local var_754_1, var_754_2 = pcall(function()
			return utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)")()
		end)

		if not var_754_1 or var_754_2 ~= true then
			slot_701_43_0()

			return
		end

		local var_754_3, var_754_4 = pcall(function()
			return var_754_0.color:get()
		end)

		slot_701_42_0(var_754_3 and var_754_4 or color(56, 56, 56, 154))
	end

	function slot_701_45_0()
		if slot_0_78_0.misc.flash_game_ready then
			return
		end

		pcall(function()
			slot_0_1_0.cdef("            int GetForegroundWindow();\n            bool FlashWindow(int hwnd, bool invert);\n            int FindWindowA(const char* class, const char* name);\n        ")

			local var_758_0 = slot_0_1_0.load("user32")
			local var_758_1 = var_758_0.FindWindowA("Valve001", "Counter-Strike: Global Offensive - Direct3D 9")

			if var_758_1 ~= nil and var_758_1 ~= 0 then
				slot_0_78_0.misc.flash_user32 = var_758_0
				slot_0_78_0.misc.flash_hwnd = var_758_1
				slot_0_78_0.misc.flash_game_ready = true
			end
		end)
	end

	function slot_701_46_0()
		local var_759_0 = slot_0_152_0.vars and slot_0_152_0.vars.flash_game_icon

		if not var_759_0 or var_759_0:get() ~= true then
			return
		end

		slot_701_45_0()

		local var_759_1 = slot_0_78_0.misc.flash_user32
		local var_759_2 = slot_0_78_0.misc.flash_hwnd

		if not var_759_1 or not var_759_2 then
			return
		end

		pcall(function()
			if var_759_1.GetForegroundWindow() ~= var_759_2 then
				var_759_1.FlashWindow(var_759_2, true)
			end
		end)
	end

	function slot_701_47_0()
		local var_761_0 = slot_0_152_0.vars and slot_0_152_0.vars.auto_r8

		if not var_761_0 or var_761_0:get() ~= true then
			return
		end

		if not globals.is_connected then
			return
		end

		local var_761_1 = entity.get_game_rules()

		if not var_761_1 or var_761_1.m_bWarmupPeriod == true then
			return
		end

		local var_761_2 = tonumber(var_761_1.m_totalRoundsPlayed)

		if not var_761_2 then
			return
		end

		local var_761_3 = 30

		pcall(function()
			if cvar.mp_maxrounds then
				local var_762_0 = cvar.mp_maxrounds:int()

				if var_762_0 and var_762_0 > 0 then
					var_761_3 = var_762_0
				end
			end
		end)

		local var_761_4 = math.floor(var_761_3 / 2)
		local var_761_5 = false

		pcall(function()
			var_761_5 = var_761_0.mode and var_761_0.mode:get() == 2
		end)

		if not (var_761_2 == 0 or var_761_5 and var_761_2 == var_761_4) then
			return
		end

		if slot_0_78_0.misc.auto_r8_last_round == var_761_2 and slot_0_78_0.misc.auto_r8_last_max == var_761_3 then
			return
		end

		slot_0_78_0.misc.auto_r8_last_round = var_761_2
		slot_0_78_0.misc.auto_r8_last_max = var_761_3

		utils.execute_after(0.6, function()
			if not globals.is_connected then
				return
			end

			if not entity.get_local_player() then
				return
			end

			slot_0_78_0.say_exec("!r8")
		end)
	end

	function slot_701_48_0(arg_765_0)
		local var_765_0 = math.rad(arg_765_0 or 0)

		return vector(math.cos(var_765_0), math.sin(var_765_0), 0)
	end

	function slot_701_49_0(arg_766_0, arg_766_1, arg_766_2)
		return math.max(arg_766_1, math.min(arg_766_2, arg_766_0))
	end

	function slot_701_50_0(arg_767_0, arg_767_1, arg_767_2, arg_767_3)
		if not arg_767_0 then
			return arg_767_0
		end

		arg_767_1 = arg_767_1 or vector()

		local var_767_0 = vector():angles(arg_767_0.x - 10 + math.abs(arg_767_0.x) / 9, arg_767_0.y)
		local var_767_1 = slot_701_49_0(arg_767_2 * 0.9, 15, 750) * (slot_701_49_0(arg_767_3 or 0, 0, 1) * 0.7 + 0.3)
		local var_767_2 = var_767_0

		for iter_767_0 = 1, 8 do
			var_767_2 = (var_767_0 * (var_767_2 * var_767_1 + arg_767_1 * 1.25):length() - arg_767_1 * 1.25) / var_767_1

			var_767_2:normalize()
		end

		local var_767_3 = var_767_2:angles()

		if var_767_3.x > -10 then
			var_767_3.x = 0.9 * var_767_3.x + 9
		else
			var_767_3.x = 1.125 * var_767_3.x + 11.25
		end

		return var_767_3
	end

	function slot_701_51_0(arg_768_0)
		local var_768_0 = arg_768_0:get_player_weapon()

		if not var_768_0 then
			return nil, nil, nil
		end

		local var_768_1 = var_768_0:get_weapon_info()

		if not var_768_1 or not var_768_1.throw_velocity or not var_768_0.m_flThrowStrength then
			return nil, nil, nil
		end

		return var_768_0, var_768_1, chi.exploit_charge()
	end

	function slot_701_52_0(arg_769_0, arg_769_1)
		if not arg_769_0 or arg_769_0.jitter_move ~= true then
			if slot_0_78_0.misc.super_toss_active then
				slot_0_78_0.misc.super_toss_active = false

				refs.air_strafe:override()
				refs.strafe_assist:override()
			end

			return
		end

		local var_769_0, var_769_1, var_769_2 = slot_701_51_0(arg_769_1)

		if not var_769_0 or not var_769_1 then
			if slot_0_78_0.misc.super_toss_active then
				slot_0_78_0.misc.super_toss_active = false

				refs.air_strafe:override()
				refs.strafe_assist:override()
			end

			return
		end

		if var_769_1.weapon_type ~= 9 or var_769_0.m_fThrowTime <= 0 or var_769_0.m_fThrowTime - 0.1 * var_769_2 > globals.curtime then
			if slot_0_78_0.misc.super_toss_active then
				slot_0_78_0.misc.super_toss_active = false

				refs.air_strafe:override()
				refs.strafe_assist:override()
			end

			return
		end

		slot_0_78_0.misc.super_toss_active = true

		refs.air_strafe:override(false)
		refs.strafe_assist:override(false)

		local var_769_3 = arg_769_1:simulate_movement()

		if var_769_3 then
			var_769_3:think()

			arg_769_0.view_angles = slot_701_50_0(arg_769_0.view_angles, var_769_3.velocity, var_769_1.throw_velocity, var_769_0.m_flThrowStrength)
		end
	end

	function slot_701_53_0(arg_770_0, arg_770_1)
		if not arg_770_0 or not arg_770_0.angles then
			return
		end

		local var_770_0 = entity.get_local_player()

		if not var_770_0 then
			return
		end

		local var_770_1, var_770_2 = slot_701_51_0(var_770_0)

		if not var_770_1 or not var_770_2 then
			return
		end

		arg_770_0.angles = slot_701_50_0(arg_770_0.angles, arg_770_1, var_770_2.throw_velocity, var_770_1.m_flThrowStrength)
	end

	slot_0_78_0.misc_super_toss_view = slot_701_53_0

	function slot_701_54_0(arg_771_0, arg_771_1)
		local var_771_0 = slot_701_35_0[arg_771_0]

		if not var_771_0 or not arg_771_1 or not arg_771_1.gr_allowed_grenades then
			return false
		end

		local var_771_1, var_771_2 = pcall(function()
			return arg_771_1.gr_allowed_grenades:get(var_771_0)
		end)

		return var_771_1 and var_771_2 == true
	end

	function slot_701_55_0(arg_773_0, arg_773_1)
		local var_773_0 = slot_0_152_0.vars and slot_0_152_0.vars.grenades

		if not var_773_0 or not var_773_0.grenade_release or var_773_0.grenade_release:get() ~= true then
			slot_0_78_0.misc.grenade_pred_dmg = 0

			return
		end

		local var_773_1 = arg_773_1:get_player_weapon()

		if not var_773_1 then
			return
		end

		local var_773_2 = var_773_1:get_classname()

		if not slot_701_54_0(var_773_2, var_773_0) then
			return
		end

		local var_773_3 = 20

		pcall(function()
			var_773_3 = var_773_0.gr_release_damage:get()
		end)

		if var_773_3 > (slot_0_78_0.misc.grenade_pred_dmg or 0) then
			return
		end

		if var_773_0.gr_on_pin_pulled and var_773_0.gr_on_pin_pulled:get() == true then
			if arg_773_0.in_attack and var_773_1.m_bPinPulled then
				arg_773_0.in_attack = false
			end
		else
			if arg_773_0.in_attack and var_773_1.m_bPinPulled then
				arg_773_0.in_attack = false
			end

			if not var_773_1.m_bPinPulled then
				arg_773_0.in_attack = true
			end
		end
	end

	function slot_701_56_0(arg_775_0, arg_775_1)
		local var_775_0 = slot_0_152_0.vars and slot_0_152_0.vars.grenades
		local var_775_1 = var_775_0 and var_775_0.drop_grenades

		if not var_775_1 then
			slot_0_78_0.misc.drop_grenades_prev = false

			return
		end

		local var_775_2 = var_775_1:get() == true

		if var_775_2 then
			arg_775_0.in_use = true

			if not slot_0_78_0.misc.drop_grenades_prev then
				local var_775_3 = 0
				local var_775_4

				pcall(function()
					var_775_4 = arg_775_1:get_player_weapon(true)
				end)

				if type(var_775_4) ~= "table" then
					var_775_4 = {}
				end

				for iter_775_0, iter_775_1 in ipairs(var_775_4) do
					if iter_775_1 and type(iter_775_1.get_classname) == "function" then
						local var_775_5 = slot_701_36_0[iter_775_1:get_classname()]

						if var_775_5 then
							var_775_3 = var_775_3 + 1

							local var_775_6 = var_775_5

							utils.execute_after(0.02 * var_775_3, function()
								utils.console_exec("use " .. var_775_6 .. "; drop")
							end)
						end
					end
				end
			end
		end

		slot_0_78_0.misc.drop_grenades_prev = var_775_2
	end

	slot_701_57_0 = 33636363
	slot_701_58_0 = 536870912

	function slot_701_59_0(arg_778_0, arg_778_1)
		local var_778_0 = slot_701_48_0(arg_778_0 or 0)

		arg_778_1 = arg_778_1 or 64

		return vector(var_778_0.x * arg_778_1, var_778_0.y * arg_778_1, 0)
	end

	function slot_701_60_0(arg_779_0, arg_779_1)
		local var_779_0 = slot_0_152_0.vars and slot_0_152_0.vars.avoid_collisions

		if not var_779_0 or var_779_0:get() ~= true then
			return
		end

		if not arg_779_0.in_jump or arg_779_0.in_moveright or arg_779_0.in_moveleft or arg_779_0.in_back then
			return
		end

		local var_779_1 = arg_779_1:get_origin()

		if not var_779_1 then
			return
		end

		local var_779_2 = arg_779_0.move_yaw

		if var_779_2 == nil and arg_779_0.view_angles then
			var_779_2 = arg_779_0.view_angles.y
		end

		if var_779_2 == nil then
			local var_779_3 = render.camera_angles()

			var_779_2 = var_779_3 and var_779_3.y or 0
		end

		local var_779_4 = vector(var_779_1.x, var_779_1.y, var_779_1.z + 16)
		local var_779_5 = var_779_4 + slot_701_59_0(var_779_2, 128)
		local var_779_6 = utils.trace_line(var_779_4, var_779_5, arg_779_1, nil, slot_701_57_0)

		if var_779_6 then
			local var_779_7 = var_779_6.contents or 0

			if bit and bit.band(var_779_7, slot_701_58_0) ~= 0 then
				return
			end

			local var_779_8 = var_779_6.entity

			if var_779_8 and type(var_779_8.get_classname) == "function" then
				local var_779_9, var_779_10 = pcall(var_779_8.get_classname, var_779_8)

				if var_779_9 and var_779_10 == "CDynamicProp" then
					return
				end
			end
		end

		local var_779_11 = math.huge
		local var_779_12 = math.huge

		for iter_779_0 = -80, 80, 10 do
			local var_779_13 = var_779_4 + slot_701_59_0(var_779_2 + iter_779_0, 64)
			local var_779_14 = utils.trace_line(var_779_4, var_779_13, arg_779_1, nil, slot_701_57_0)

			if var_779_14 and var_779_14.end_pos then
				local var_779_15 = var_779_4:dist(var_779_14.end_pos)

				if var_779_15 < var_779_12 then
					local var_779_16 = var_779_14.entity

					if not (var_779_16 and type(var_779_16.is_player) == "function" and var_779_16:is_player()) then
						var_779_12 = var_779_15
						var_779_11 = iter_779_0
					end
				end
			end
		end

		local var_779_17 = 35

		if var_779_17 <= var_779_12 or var_779_11 == math.huge then
			return
		end

		local var_779_18 = arg_779_1.m_vecVelocity
		local var_779_19 = var_779_18 and var_779_18:length() or 0
		local var_779_20 = math.rad(var_779_11 + 90)
		local var_779_21 = var_779_17 > math.abs(var_779_11) and (var_779_17 - var_779_12) / 15 or 1

		arg_779_0.forwardmove = math.abs(var_779_19 * math.cos(var_779_20))
		arg_779_0.sidemove = var_779_19 * math.sin(var_779_20) * var_779_21 * (var_779_11 >= 0 and 1 or -1)
	end

	function slot_701_61_0(arg_780_0)
		local var_780_0 = slot_0_152_0.vars and slot_0_152_0.vars.unlock_fd_speed

		if not var_780_0 or var_780_0:get() ~= true or not refs.fd or refs.fd:get() ~= true then
			return
		end

		local var_780_1 = arg_780_0.forwardmove
		local var_780_2 = arg_780_0.sidemove
		local var_780_3 = 5

		if var_780_3 < math.abs(var_780_1) or var_780_3 < math.abs(var_780_2) then
			local var_780_4 = 450 / math.sqrt(var_780_1 * var_780_1 + var_780_2 * var_780_2)

			arg_780_0.forwardmove = var_780_1 * var_780_4
			arg_780_0.sidemove = var_780_2 * var_780_4
		end
	end

	function slot_701_62_0(arg_781_0)
		local var_781_0 = entity.get_local_player()

		if not var_781_0 or var_781_0.m_iHealth <= 0 then
			return
		end

		slot_701_60_0(arg_781_0, var_781_0)
		slot_701_61_0(arg_781_0)

		local var_781_1 = slot_0_152_0.vars and slot_0_152_0.vars.grenades

		if var_781_1 and var_781_1.super_toss and var_781_1.super_toss:get() == true then
			slot_701_52_0(arg_781_0, var_781_0)
		elseif slot_0_78_0.misc.super_toss_active then
			slot_0_78_0.misc.super_toss_active = false

			refs.air_strafe:override()
			refs.strafe_assist:override()
		end

		slot_701_55_0(arg_781_0, var_781_0)
		slot_701_56_0(arg_781_0, var_781_0)
	end

	slot_0_78_0.misc_features_createmove = slot_701_62_0
	slot_0_78_0.misc_voice_tick = slot_701_39_0
	slot_0_78_0.misc_voice_restore_all = slot_701_40_0
	slot_0_78_0.misc_console_render = slot_701_44_0
	slot_0_78_0.misc_console_reset_tint = slot_701_43_0
	slot_0_78_0.misc_flash_game_round = slot_701_46_0
	slot_0_78_0.misc_auto_r8_round = slot_701_47_0
	slot_701_63_0 = {
		[64] = true,
		[40] = true
	}

	function slot_701_64_0(arg_782_0, arg_782_1)
		if not arg_782_0 then
			return false
		end

		local var_782_0, var_782_1 = pcall(function()
			return arg_782_0:get(arg_782_1)
		end)

		if var_782_0 and var_782_1 == true then
			return true
		end

		local var_782_2, var_782_3 = pcall(function()
			return arg_782_0:get()
		end)
		local var_782_4 = var_782_3

		if var_782_2 and type(var_782_4) == "table" then
			for iter_782_0 = 1, #var_782_4 do
				if var_782_4[iter_782_0] == arg_782_1 then
					return true
				end
			end
		end

		return false
	end

	function slot_701_65_0(arg_785_0)
		local var_785_0 = arg_785_0.m_vecVelocity

		if not var_785_0 then
			return 0
		end

		local var_785_1 = var_785_0.x or 0
		local var_785_2 = var_785_0.y or 0
		local var_785_3 = var_785_0.z or 0

		return math.sqrt(var_785_1 * var_785_1 + var_785_2 * var_785_2 + var_785_3 * var_785_3)
	end

	function slot_701_66_0(arg_786_0)
		local var_786_0 = arg_786_0.m_fFlags

		return var_786_0 ~= nil and bit.band(var_786_0, 1) == 1
	end

	function slot_701_67_0(arg_787_0)
		local var_787_0 = entity.get_threat()

		if not var_787_0 then
			return 9999
		end

		local var_787_1 = arg_787_0:get_origin()
		local var_787_2 = var_787_0:get_origin()

		if not var_787_1 or not var_787_2 then
			return 9999
		end

		if type(var_787_1.dist) == "function" then
			return var_787_1:dist(var_787_2)
		end

		local var_787_3 = (var_787_1.x or 0) - (var_787_2.x or 0)
		local var_787_4 = (var_787_1.y or 0) - (var_787_2.y or 0)
		local var_787_5 = (var_787_1.z or 0) - (var_787_2.z or 0)

		return math.sqrt(var_787_3 * var_787_3 + var_787_4 * var_787_4 + var_787_5 * var_787_5)
	end

	function slot_701_68_0(arg_788_0)
		local var_788_0 = {}

		if type(arg_788_0) == "table" then
			for iter_788_0 = 1, #arg_788_0 do
				var_788_0[iter_788_0] = arg_788_0[iter_788_0]
			end

			if #var_788_0 == 0 then
				for iter_788_1, iter_788_2 in pairs(arg_788_0) do
					if type(iter_788_2) == "string" then
						var_788_0[#var_788_0 + 1] = iter_788_2
					end
				end
			end
		elseif type(arg_788_0) == "string" and arg_788_0 ~= "" then
			var_788_0[1] = arg_788_0
		end

		return var_788_0
	end

	function slot_701_69_0(arg_789_0)
		for iter_789_0 = 1, #arg_789_0 do
			if arg_789_0[iter_789_0] == "In Air" then
				return arg_789_0
			end
		end

		local var_789_0 = {}

		for iter_789_1 = 1, #arg_789_0 do
			var_789_0[iter_789_1] = arg_789_0[iter_789_1]
		end

		var_789_0[#var_789_0 + 1] = "In Air"

		return var_789_0
	end

	function slot_701_70_0()
		if slot_0_78_0.misc.astop_ovr ~= true then
			return
		end

		pcall(function()
			refs.autostop_ssg_opts:override()
		end)
		pcall(function()
			refs.air_strafe:override()
		end)
		pcall(function()
			refs.strafe_assist:override()
		end)

		slot_0_78_0.misc.astop_ovr = false
	end

	function slot_701_71_0(arg_794_0)
		if slot_0_78_0.misc.super_toss_active then
			return
		end

		local var_794_0 = slot_0_152_0.vars and slot_0_152_0.vars.air_stop

		if not var_794_0 or var_794_0:get() ~= true then
			slot_701_70_0()

			return
		end

		local var_794_1 = entity.get_local_player()

		if not var_794_1 or var_794_1.m_iHealth <= 0 then
			slot_701_70_0()

			return
		end

		local var_794_2 = var_794_1:get_player_weapon()
		local var_794_3 = var_794_2 and var_794_2:get_weapon_index() or nil

		if not var_794_3 or slot_701_63_0[var_794_3] ~= true then
			slot_701_70_0()

			return
		end

		local var_794_4 = arg_794_0.in_jump == true or not slot_701_66_0(var_794_1)
		local var_794_5 = slot_701_65_0(var_794_1)
		local var_794_6 = slot_701_67_0(var_794_1)
		local var_794_7 = slot_701_64_0(var_794_0.trigger, "Near target") and var_794_4 and (var_794_5 < 120 or var_794_6 < 150)
		local var_794_8 = slot_701_64_0(var_794_0.trigger, "Walking") and var_794_4 and arg_794_0.in_speed == true

		if var_794_7 or var_794_8 then
			local var_794_9 = {}

			pcall(function()
				var_794_9 = slot_701_68_0(refs.autostop_ssg_opts:get())
			end)
			pcall(function()
				refs.autostop_ssg_opts:override(slot_701_69_0(var_794_9))
			end)

			if var_794_5 < 20 then
				refs.air_strafe:override(false)
				refs.strafe_assist:override(false)
			else
				refs.air_strafe:override()
				refs.strafe_assist:override()
			end

			slot_0_78_0.misc.astop_ovr = true
		else
			slot_701_70_0()
		end

		local var_794_10 = false

		pcall(function()
			var_794_10 = var_794_0.duck:get() == true
		end)

		if var_794_10 and var_794_4 and var_794_1.m_MoveType ~= 9 and (var_794_5 < 70 or var_794_6 < 300) then
			arg_794_0.in_duck = true
		end
	end

	slot_0_78_0.astop_tick = slot_701_71_0
	slot_0_78_0.astop_release = slot_701_70_0

	pcall(function()
		if slot_0_152_0.vars.air_stop and type(slot_0_152_0.vars.air_stop.set_callback) == "function" then
			slot_0_152_0.vars.air_stop:set_callback(function(arg_799_0)
				if arg_799_0 and arg_799_0:get() ~= true and slot_0_78_0.astop_release then
					slot_0_78_0.astop_release()
				end
			end)
		end
	end)
	;(function()
		local var_800_0 = bit.lshift(1, 0)
		local var_800_1 = 0
		local var_800_2 = 1
		local var_800_3 = 9

		local function var_800_4(arg_801_0)
			return slot_0_152_0.vars and slot_0_152_0.vars[arg_801_0]
		end

		local function var_800_5(arg_802_0)
			local var_802_0 = var_800_4(arg_802_0)

			if not var_802_0 or type(var_802_0.get) ~= "function" then
				return false
			end

			local var_802_1, var_802_2 = pcall(function()
				return var_802_0:get() == true
			end)

			return var_802_1 and var_802_2 == true
		end

		local function var_800_6(arg_804_0, arg_804_1)
			if not arg_804_0 or not arg_804_1 then
				return false
			end

			local var_804_0 = _G.bind_listed_check

			if type(var_804_0) == "function" then
				return var_804_0(arg_804_0, arg_804_1, {
					{
						id = arg_804_1
					}
				})
			end

			local var_804_1, var_804_2 = pcall(function()
				return arg_804_0:get(arg_804_1)
			end)

			return var_804_1 and var_804_2 == true
		end

		local function var_800_7(arg_806_0, arg_806_1)
			if arg_806_1 and arg_806_1.in_jump == true then
				return true
			end

			local var_806_0 = tonumber(arg_806_0.m_fFlags) or 0

			return bit.band(var_806_0, var_800_0) ~= 1
		end

		local function var_800_8(arg_807_0)
			local var_807_0 = arg_807_0.m_vecVelocity

			if not var_807_0 then
				return 0
			end

			return math.sqrt((var_807_0.x or 0) * (var_807_0.x or 0) + (var_807_0.y or 0) * (var_807_0.y or 0))
		end

		local function var_800_9()
			if not rage or not rage.exploit or type(rage.exploit.get) ~= "function" then
				return 0
			end

			local var_808_0, var_808_1 = pcall(function()
				return rage.exploit:get()
			end)

			return var_808_0 and (tonumber(var_808_1) or 0) or 0
		end

		local function var_800_10()
			return refs.dt and refs.dt:get() == true
		end

		local function var_800_11()
			return refs.peek_assist and refs.peek_assist:get() == true
		end

		local function var_800_12(arg_812_0, arg_812_1)
			local var_812_0 = arg_812_0:get_player_weapon()

			if not var_812_0 then
				return false
			end

			local var_812_1 = var_812_0:get_weapon_index()
			local var_812_2 = var_812_0:get_weapon_info()

			if not var_812_2 then
				return false
			end

			local var_812_3 = tonumber(var_812_2.weapon_type) or -1
			local var_812_4 = var_812_2.full_auto == true
			local var_812_5 = var_812_1 == 1 or var_812_1 == 64
			local var_812_6 = arg_812_1 and arg_812_1.wpns and var_800_6(arg_812_1.wpns, "Automatics")
			local var_812_7 = arg_812_1 and arg_812_1.wpns and var_800_6(arg_812_1.wpns, "Pistols")
			local var_812_8 = arg_812_1 and arg_812_1.wpns and var_800_6(arg_812_1.wpns, "Heavy pistols")
			local var_812_9 = arg_812_1 and arg_812_1.wpns and var_800_6(arg_812_1.wpns, "Melee")

			if var_812_3 == var_800_3 then
				return false
			end

			if var_812_3 == var_800_1 and not var_812_9 then
				return false
			end

			if var_812_5 and not var_812_8 then
				return false
			end

			if var_812_3 == var_800_2 and not var_812_5 and not var_812_7 then
				return false
			end

			if var_812_4 and var_812_3 ~= var_800_2 and not var_812_6 then
				return false
			end

			return true
		end

		local function var_800_13(arg_813_0)
			local var_813_0 = var_800_4("auto_teleport")

			if not var_800_5("auto_teleport") then
				return
			end

			local var_813_1 = entity.get_local_player()

			if not var_813_1 or not var_813_1:is_alive() then
				return
			end

			if not var_800_10() or not var_800_7(var_813_1, arg_813_0) then
				return
			end

			if var_800_9() < 0.5 then
				return
			end

			if not var_800_12(var_813_1, var_813_0) then
				return
			end

			if not entity.get_threat(true) then
				return
			end

			pcall(function()
				rage.exploit:force_teleport()
			end)
		end

		local function var_800_14()
			if not slot_0_78_0.rage_auto_hs_active then
				return
			end

			pcall(function()
				refs.dt:override()
				refs.hs:override()
			end)

			slot_0_78_0.rage_auto_hs_active = false
		end

		local function var_800_15(arg_817_0, arg_817_1)
			local var_817_0 = arg_817_0:get_player_weapon()

			if not var_817_0 then
				return true
			end

			local var_817_1 = var_817_0:get_weapon_index()
			local var_817_2 = var_817_0:get_weapon_info()

			if not var_817_2 then
				return true
			end

			local var_817_3 = tonumber(var_817_2.weapon_type) or -1
			local var_817_4 = var_817_2.full_auto == true

			if var_817_2.is_revolver or var_817_3 == var_800_3 or var_817_3 == var_800_1 then
				return true
			end

			local var_817_5 = var_817_4 or var_817_3 == var_800_2 or var_817_1 == 1
			local var_817_6 = arg_817_1 and arg_817_1.allow_rifles and arg_817_1.allow_rifles:get() == true
			local var_817_7 = arg_817_1 and arg_817_1.allow_deagle and arg_817_1.allow_deagle:get() == true

			if var_817_6 and var_817_1 ~= 1 and (var_817_3 == var_800_2 or var_817_3 == 2 or var_817_3 == 3 or var_817_4) then
				var_817_5 = false
			end

			if var_817_7 and var_817_1 == 1 then
				var_817_5 = false
			end

			return var_817_5 == true
		end

		local function var_800_16(arg_818_0, arg_818_1)
			local var_818_0 = refs.sw and refs.sw:get() == true
			local var_818_1 = var_800_8(arg_818_0)

			if (var_818_0 or var_818_1 < 2) and not var_800_11() then
				return true
			end

			if (tonumber(arg_818_0.m_flDuckAmount) or 0) > 0.5 then
				return true
			end

			if var_800_7(arg_818_0, arg_818_1) then
				return true
			end

			return false
		end

		local function var_800_17(arg_819_0)
			local var_819_0 = var_800_4("auto_hide_shots")

			if not var_800_5("auto_hide_shots") then
				var_800_14()

				return
			end

			local var_819_1 = entity.get_local_player()

			if not var_819_1 or not var_819_1:is_alive() then
				var_800_14()

				return
			end

			if not var_800_10() or var_800_9() < 0.999 or var_800_16(var_819_1, arg_819_0) or var_800_15(var_819_1, var_819_0) then
				var_800_14()

				return
			end

			pcall(function()
				refs.dt:override(false)
				refs.hs:override(true)
			end)

			slot_0_78_0.rage_auto_hs_active = true
		end

		slot_0_78_0.rage_auto_hs_active = false
		slot_0_78_0.auto_teleport_tick = var_800_13
		slot_0_78_0.auto_hide_shots_tick = var_800_17
		slot_0_78_0.auto_hide_release = var_800_14

		pcall(function()
			if slot_0_152_0.vars.auto_hide_shots and type(slot_0_152_0.vars.auto_hide_shots.set_callback) == "function" then
				slot_0_152_0.vars.auto_hide_shots:set_callback(function(arg_822_0)
					if arg_822_0 and arg_822_0:get() ~= true and slot_0_78_0.auto_hide_release then
						slot_0_78_0.auto_hide_release()
					end
				end)
			end
		end)
	end)()

	function slot_701_72_0()
		if slot_0_78_0.astop_release then
			slot_0_78_0.astop_release()
		end

		if slot_0_78_0.auto_hide_release then
			slot_0_78_0.auto_hide_release()
		end
	end

	slot_0_78_0.move_extras_reset = slot_701_72_0

	function slot_701_73_0(arg_824_0)
		local var_824_0 = entity.get_local_player()

		if not var_824_0 or var_824_0.m_iHealth <= 0 then
			slot_701_72_0()

			return
		end

		if slot_0_78_0.misc_features_createmove then
			slot_0_78_0.misc_features_createmove(arg_824_0)
		end

		local var_824_1 = slot_0_152_0.vars.fast_ladder

		if var_824_1 and var_824_1:get() == true and var_824_0.m_MoveType == 9 and arg_824_0.forwardmove ~= 0 then
			local var_824_2 = render.camera_angles().x
			local var_824_3 = arg_824_0.forwardmove < 0 or var_824_2 > 45

			arg_824_0.in_forward = var_824_3
			arg_824_0.in_back = not var_824_3
			arg_824_0.in_moveleft = var_824_3
			arg_824_0.in_moveright = not var_824_3
			arg_824_0.view_angles.x = 89

			local var_824_4 = arg_824_0.move_yaw or arg_824_0.view_angles.y

			arg_824_0.view_angles.y = slot_701_33_0(var_824_4 + 90)
		end

		local var_824_5 = slot_0_152_0.vars.no_fall_damage

		if var_824_5 and var_824_5:get() == true then
			local var_824_6 = var_824_0.m_vecVelocity

			if var_824_6 and var_824_6.z < -10 then
				local var_824_7 = var_824_0:get_origin()

				if var_824_7 then
					local var_824_8 = utils.trace_line(var_824_7, var_824_7 + vector(0, 0, -512), var_824_0, nil, 1)

					if var_824_8 and var_824_8.end_pos then
						local var_824_9 = var_824_7.z - var_824_8.end_pos.z

						if var_824_9 >= 12 and var_824_9 <= 70 and var_824_6.z < -450 then
							arg_824_0.in_duck = true
						end
					end
				end
			end
		end
	end

	slot_701_74_0 = slot_0_1_0.typeof("struct {\n    char pad0[0x18];\n    uint32_t sequence;\n    float prev_cycle;\n    float weight;\n    float weight_delta_rate;\n    float playback_rate;\n    float cycle;\n    void *entity;\n    char pad1[4];\n} **\n")

	function slot_701_75_0()
		refs.leg_movement:override()
	end

	function slot_701_76_0(arg_826_0)
		local var_826_0 = arg_826_0 and arg_826_0.m_fFlags

		if var_826_0 == nil then
			return false
		end

		return bit.band(var_826_0, 1) == 0
	end

	function slot_701_77_0(arg_827_0, arg_827_1, arg_827_2)
		local var_827_0 = arg_827_0 and arg_827_0[0]

		if not var_827_0 then
			return
		end

		local var_827_1 = slot_0_1_0.cast(slot_701_74_0, slot_0_1_0.cast("uintptr_t", var_827_0) + 10640)[0]

		if not var_827_1 or not var_827_1[arg_827_1] then
			return
		end

		var_827_1[arg_827_1].weight = arg_827_2
	end

	function slot_701_78_0(arg_828_0)
		local var_828_0 = slot_0_152_0.vars.anim_breaker

		if not var_828_0 or var_828_0:get() ~= true then
			return
		end

		local var_828_1 = entity.get_local_player()

		if not var_828_1 or not var_828_1:is_alive() or arg_828_0 ~= var_828_1 then
			return
		end

		local var_828_2 = slot_701_76_0(var_828_1)
		local var_828_3 = var_828_0.ground_legs and var_828_0.ground_legs:get() or "Disabled"
		local var_828_4 = var_828_0.air_legs and var_828_0.air_legs:get() or "Disabled"

		if var_828_2 then
			if var_828_4 == "Static" then
				var_828_1.m_flPoseParameter[6] = 1
			elseif var_828_4 == "Moonwalk" then
				slot_701_77_0(var_828_1, 6, 1)
			end
		elseif var_828_3 == "Static" then
			refs.leg_movement:override("Sliding")

			var_828_1.m_flPoseParameter[0] = 1
		elseif var_828_3 == "Moonwalk" then
			refs.leg_movement:override("Walking")

			var_828_1.m_flPoseParameter[7] = 0
		end

		if var_828_0.land_pitch_zero and var_828_0.land_pitch_zero:get() == true then
			local var_828_5 = var_828_1:get_anim_state()

			if var_828_5 and var_828_5.landing and not var_828_2 then
				var_828_1.m_flPoseParameter[12] = 0.5
			end
		end
	end

	pcall(function()
		if events.post_update_clientside_animation and type(events.post_update_clientside_animation.set) == "function" then
			events.post_update_clientside_animation:set(function(arg_830_0)
				pcall(slot_701_78_0, arg_830_0)
			end)
		end
	end)
	pcall(function()
		local var_831_0 = slot_0_152_0.vars.anim_breaker

		if var_831_0 and type(var_831_0.set_callback) == "function" then
			var_831_0:set_callback(function(arg_832_0)
				if arg_832_0:get() ~= true and slot_0_78_0.anim and slot_0_78_0.anim.clear_legs then
					slot_0_78_0.anim.clear_legs()
				end
			end, true)
		end
	end)
	events.bullet_impact:set(function(arg_833_0)
		local var_833_0 = entity.get_local_player()

		if not var_833_0 or var_833_0.m_iHealth <= 0 then
			return
		end

		local var_833_1 = entity.get(arg_833_0.userid, true)

		if not var_833_1 or not var_833_1:is_enemy() then
			return
		end

		local var_833_2 = var_833_0:get_origin()
		local var_833_3 = vector(arg_833_0.x or 0, arg_833_0.y or 0, arg_833_0.z or 0)
		local var_833_4 = var_833_2:dist(var_833_3)

		if var_833_4 < 120 then
			table.insert(slot_0_78_0.anti_bruteforce.tickcounts, globals.tickcount)
			table.insert(slot_0_78_0.anti_bruteforce.realtime, globals.realtime)

			while #slot_0_78_0.anti_bruteforce.realtime > 32 do
				table.remove(slot_0_78_0.anti_bruteforce.realtime, 1)
				table.remove(slot_0_78_0.anti_bruteforce.tickcounts, 1)
			end

			pcall(slot_701_30_0, var_833_1, var_833_4)
		end

		local var_833_5 = _G.evade_try_bullet or evade_try_bullet

		if type(var_833_5) == "function" then
			pcall(var_833_5, arg_833_0)
		end
	end)
	slot_0_152_0.home.cfg_create:set_callback(function()
		local var_834_0 = tostring(slot_0_152_0.home.cfg_name:get() or ""):gsub("^%s+", ""):gsub("%s+$", "")

		if var_834_0 == "" then
			slot_0_78_0.set_cfg_status_temporary("name required", 2)

			return
		end

		if var_834_0 == slot_0_112_0 then
			slot_0_78_0.set_cfg_status_temporary("reserved name", 2)

			return
		end

		if slot_0_137_0.configs[var_834_0] then
			slot_0_78_0.set_cfg_status_temporary("already exists", 2)

			return
		end

		slot_0_78_0.sanitize_config_ui()

		local var_834_1, var_834_2 = pcall(slot_0_0_0.save)

		if not var_834_1 then
			slot_0_78_0.set_cfg_status_temporary("save snapshot failed", 2)

			return
		end

		slot_0_137_0.configs[var_834_0] = slot_0_120_0(var_834_2, slot_0_18_0, slot_0_118_0(), slot_0_123_0())
		slot_0_137_0.loaded = var_834_0

		slot_0_115_0(slot_0_137_0)
		slot_0_78_0.refresh_config_list(var_834_0)
		slot_0_78_0.set_cfg_status_temporary("created: " .. var_834_0, 2)
		slot_0_78_0.sanitize_config_ui()
	end)
	slot_0_152_0.home.cfg_new:set_callback(function()
		slot_0_152_0.home.cfg_new_state:set(true)
	end)
	slot_0_152_0.home.cfg_cancel:set_callback(function()
		slot_0_152_0.home.cfg_new_state:set(false)
	end)
	slot_0_152_0.home.cfg_new:depend({
		slot_0_152_0.home.cfg_new_state,
		false
	})
	slot_0_152_0.home.cfg_import:depend({
		slot_0_152_0.home.cfg_new_state,
		false
	})
	slot_0_152_0.home.cfg_create:depend({
		slot_0_152_0.home.cfg_new_state,
		true
	})
	slot_0_152_0.home.cfg_cancel:depend({
		slot_0_152_0.home.cfg_new_state,
		true
	})
	slot_0_152_0.home.cfg_name:depend({
		slot_0_152_0.home.cfg_new_state,
		true
	})
	slot_0_152_0.home.cfg_save:set_callback(function()
		local var_837_0 = slot_0_78_0.selected_config_name()

		if var_837_0 == "" then
			slot_0_78_0.set_cfg_status_temporary("nothing selected", 2)

			return
		end

		slot_0_78_0.sanitize_config_ui()

		local var_837_1, var_837_2 = pcall(slot_0_0_0.save)

		if not var_837_1 then
			slot_0_78_0.set_cfg_status_temporary("save failed", 2)

			return
		end

		local var_837_3, var_837_4, var_837_5 = slot_0_121_0(slot_0_137_0.configs[var_837_0])

		slot_0_137_0.configs[var_837_0] = slot_0_120_0(var_837_2, var_837_4 or slot_0_18_0, slot_0_118_0(), slot_0_123_0())
		slot_0_137_0.loaded = var_837_0

		slot_0_115_0(slot_0_137_0)
		slot_0_78_0.refresh_config_list(var_837_0)
		slot_0_78_0.set_cfg_status_temporary("saved: " .. var_837_0, 2)
		slot_0_78_0.sanitize_config_ui()
	end)
	slot_0_152_0.home.cfg_load:set_callback(function()
		local var_838_0 = slot_0_78_0.selected_config_name()
		local var_838_1 = slot_0_137_0.configs[var_838_0]

		if not var_838_1 then
			slot_0_78_0.set_cfg_status_temporary("config not found", 2)

			return
		end

		local var_838_2 = slot_0_121_0(var_838_1)

		if not pcall(slot_0_0_0.load, var_838_2) then
			slot_0_78_0.set_cfg_status_temporary("load failed", 2)

			return
		end

		slot_0_78_0.sanitize_config_ui()
		slot_0_124_0(slot_0_122_0(var_838_1))

		if slot_0_78_0.cfg_post_load then
			slot_0_78_0.cfg_post_load()
		end

		slot_0_137_0.loaded = var_838_0

		slot_0_115_0(slot_0_137_0)
		slot_0_78_0.refresh_config_list(var_838_0)
		slot_0_78_0.cloud_ui.refresh_gate()
		slot_0_78_0.set_cfg_status_temporary("loaded: " .. var_838_0, 2)
	end)

	function slot_701_79_0(arg_839_0)
		if type(arg_839_0) ~= "table" then
			return false
		end

		if pcall(slot_0_0_0.load, arg_839_0, "antiaim") then
			return true
		end

		if arg_839_0.antiaim ~= nil and pcall(slot_0_0_0.load, {
			antiaim = arg_839_0.antiaim
		}) then
			return true
		end

		return false
	end

	slot_0_152_0.home.cfg_load_aa:set_callback(function()
		local var_840_0 = slot_0_78_0.selected_config_name()
		local var_840_1 = slot_0_137_0.configs[var_840_0]

		if not var_840_1 then
			slot_0_78_0.set_cfg_status_temporary("config not found", 2)

			return
		end

		local var_840_2 = slot_0_121_0(var_840_1)

		if not slot_701_79_0(var_840_2) then
			slot_0_78_0.set_cfg_status_temporary("load AA failed", 2)

			return
		end

		slot_0_78_0.sanitize_config_ui()

		if slot_0_78_0.cfg_post_load then
			slot_0_78_0.cfg_post_load()
		end

		slot_0_137_0.loaded = var_840_0

		slot_0_115_0(slot_0_137_0)
		slot_0_78_0.refresh_config_list(var_840_0)
		slot_0_78_0.set_cfg_status_temporary("loaded AA: " .. var_840_0, 2)
	end)

	slot_701_80_0 = " \f<trash> "
	slot_701_81_0 = " \ad25151ff\f<triangle-exclamation>\r "
	slot_701_82_0 = 8

	function slot_701_83_0(arg_841_0)
		slot_0_78_0[arg_841_0 .. "_armed"] = false
		slot_0_78_0[arg_841_0 .. "_deadline"] = 0
		slot_0_78_0[arg_841_0 .. "_arm_token"] = (slot_0_78_0[arg_841_0 .. "_arm_token"] or 0) + 1

		local var_841_0 = slot_0_152_0.home[arg_841_0]

		pcall(function()
			if var_841_0 and type(var_841_0.name) == "function" then
				var_841_0:name(slot_701_80_0)
			end
		end)
	end

	function slot_701_84_0(arg_843_0)
		slot_0_78_0[arg_843_0 .. "_arm_token"] = (slot_0_78_0[arg_843_0 .. "_arm_token"] or 0) + 1

		local var_843_0 = slot_0_78_0[arg_843_0 .. "_arm_token"]

		utils.execute_after(slot_701_82_0, function()
			if var_843_0 ~= slot_0_78_0[arg_843_0 .. "_arm_token"] then
				return
			end

			if not slot_0_78_0[arg_843_0 .. "_armed"] then
				return
			end

			slot_701_83_0(arg_843_0)
		end)
	end

	function slot_701_85_0(arg_845_0, arg_845_1)
		local var_845_0 = globals.realtime or 0
		local var_845_1 = tonumber(slot_0_78_0[arg_845_0 .. "_deadline"]) or 0
		local var_845_2 = slot_0_152_0.home[arg_845_0]

		if not slot_0_78_0[arg_845_0 .. "_armed"] then
			slot_0_78_0[arg_845_0 .. "_armed"] = true
			slot_0_78_0[arg_845_0 .. "_deadline"] = var_845_0 + slot_701_82_0

			pcall(function()
				if var_845_2 and type(var_845_2.name) == "function" then
					var_845_2:name(slot_701_81_0)
				end
			end)
			slot_701_84_0(arg_845_0)

			return
		end

		if var_845_1 < var_845_0 then
			slot_0_78_0[arg_845_0 .. "_armed"] = true
			slot_0_78_0[arg_845_0 .. "_deadline"] = var_845_0 + slot_701_82_0
			slot_0_78_0[arg_845_0 .. "_arm_token"] = (slot_0_78_0[arg_845_0 .. "_arm_token"] or 0) + 1

			pcall(function()
				if var_845_2 and type(var_845_2.name) == "function" then
					var_845_2:name(slot_701_81_0)
				end
			end)
			slot_701_84_0(arg_845_0)

			return
		end

		slot_701_83_0(arg_845_0)
		arg_845_1()
	end

	function slot_0_78_0.cfg_delete_disarm()
		slot_701_83_0("cfg_delete")
	end

	function slot_0_78_0.cloud_delete_disarm()
		slot_701_83_0("cloud_delete")
	end

	slot_0_152_0.home.cfg_delete:set_callback(function()
		local var_850_0 = slot_0_78_0.selected_config_name()

		if var_850_0 == slot_0_112_0 then
			slot_0_78_0.set_cfg_status_temporary("cant delete recommended", 2)

			return
		end

		slot_701_85_0("cfg_delete", function()
			slot_0_137_0.configs[var_850_0] = nil
			slot_0_137_0.loaded = slot_0_112_0

			slot_0_115_0(slot_0_137_0)
			slot_0_78_0.refresh_config_list(slot_0_112_0)
			slot_0_78_0.set_cfg_status_temporary("deleted: " .. var_850_0, 2)
		end)
	end)
	slot_0_152_0.home.cfg_export:set_callback(function()
		local var_852_0 = slot_0_78_0.selected_config_name()
		local var_852_1 = slot_0_137_0.configs[var_852_0]

		if not var_852_1 then
			slot_0_78_0.set_cfg_status_temporary("config not found", 2)

			return
		end

		local var_852_2, var_852_3, var_852_4 = slot_0_121_0(var_852_1)
		local var_852_5, var_852_6 = pcall(slot_0_127_0, var_852_0, var_852_3 or slot_0_18_0, var_852_2)

		if not var_852_5 or not var_852_6 then
			slot_0_78_0.set_cfg_status_temporary("export failed", 2)

			return
		end

		slot_0_68_0.set(var_852_6)
		slot_0_78_0.set_cfg_status_temporary("exported (encrypted): " .. var_852_0, 2)
	end)
	slot_0_152_0.home.cfg_import:set_callback(function()
		local var_853_0 = (slot_0_68_0.get() or ""):match("^%s*(.-)%s*$") or ""

		if var_853_0 == "" then
			slot_0_78_0.set_cfg_status_temporary("empty clipboard", 2)

			return
		end

		local var_853_1 = tostring(slot_0_152_0.home.cfg_name:get() or ""):gsub("^%s+", ""):gsub("%s+$", "")

		if string.match(var_853_0, "^%a+::%a+::") then
			local var_853_2, var_853_3, var_853_4, var_853_5, var_853_6 = slot_0_128_0(var_853_0)

			if not var_853_2 then
				slot_0_78_0.set_cfg_status_temporary(tostring(var_853_3 or "import failed"), 2)

				return
			end

			if var_853_1 == "" then
				var_853_1 = var_853_4 and var_853_4 ~= "" and var_853_4 or slot_0_119_0()
			end

			if var_853_1 == slot_0_112_0 then
				slot_0_78_0.set_cfg_status_temporary("reserved name", 2)

				return
			end

			slot_0_137_0.configs[var_853_1] = slot_0_120_0(var_853_6, var_853_5 or slot_0_18_0, slot_0_118_0(), slot_0_123_0())
			slot_0_137_0.loaded = var_853_1

			slot_0_115_0(slot_0_137_0)
			slot_0_78_0.refresh_config_list(var_853_1)
			slot_0_78_0.set_cfg_status_temporary("imported preset: " .. var_853_1, 2)
			slot_0_78_0.sanitize_config_ui()
			slot_0_124_0(slot_0_122_0(slot_0_137_0.configs[var_853_1]))

			return
		end

		local var_853_7, var_853_8 = pcall(json.parse, var_853_0)

		if not var_853_7 or type(var_853_8) ~= "table" then
			slot_0_78_0.set_cfg_status_temporary("invalid import data", 2)

			return
		end

		if var_853_1 == "" then
			var_853_1 = slot_0_119_0()
		end

		if var_853_1 == slot_0_112_0 then
			slot_0_78_0.set_cfg_status_temporary("reserved name", 2)

			return
		end

		slot_0_137_0.configs[var_853_1] = slot_0_120_0(var_853_8, slot_0_18_0, slot_0_118_0(), slot_0_123_0())
		slot_0_137_0.loaded = var_853_1

		slot_0_115_0(slot_0_137_0)
		slot_0_78_0.refresh_config_list(var_853_1)
		slot_0_78_0.set_cfg_status_temporary("imported (legacy json): " .. var_853_1, 2)
		slot_0_78_0.sanitize_config_ui()
		slot_0_124_0(slot_0_122_0(slot_0_137_0.configs[var_853_1]))
	end)
	pcall(function()
		if slot_0_152_0.home.cloud_filter and type(slot_0_152_0.home.cloud_filter.set_callback) == "function" then
			slot_0_152_0.home.cloud_filter:set_callback(function()
				slot_0_78_0.cloud_ui.apply_view()
			end, true)
		end
	end)
	pcall(function()
		if slot_0_152_0.home.cloud_sort and type(slot_0_152_0.home.cloud_sort.set_callback) == "function" then
			slot_0_152_0.home.cloud_sort:set_callback(function()
				slot_0_78_0.cloud_ui.apply_view()
			end, true)
		end
	end)
	pcall(function()
		if slot_0_152_0.home.cloud_list and type(slot_0_152_0.home.cloud_list.set_callback) == "function" then
			slot_0_152_0.home.cloud_list:set_callback(function()
				slot_0_78_0.cloud_ui.sync_actions()

				if slot_0_78_0.cloud_delete_disarm then
					slot_0_78_0.cloud_delete_disarm()
				end
			end)
		end
	end)
	slot_0_152_0.home.cloud_refresh:set_callback(function()
		slot_0_78_0.cloud_ui.fetch_list()
	end)
	slot_0_152_0.home.cloud_load:set_callback(function()
		local var_861_0 = slot_0_78_0.cloud_ui.selected_preset()

		if not var_861_0 then
			slot_0_78_0.set_cfg_status_temporary("select cloud preset", 2)

			return
		end

		slot_0_90_0.post("/v1/cloud/get", {
			id = var_861_0.id
		}, function(arg_862_0, arg_862_1, arg_862_2)
			if not arg_862_0 or type(arg_862_1) ~= "table" or arg_862_1.ok ~= true or type(arg_862_1.preset) ~= "table" then
				slot_0_78_0.set_cfg_status_temporary("cloud get failed", 2)

				return
			end

			local var_862_0 = arg_862_1.preset.entry

			if type(var_862_0) ~= "table" then
				slot_0_78_0.set_cfg_status_temporary("cloud data invalid", 2)

				return
			end

			local var_862_1 = slot_0_121_0(var_862_0)

			if not pcall(slot_0_0_0.load, var_862_1) then
				slot_0_78_0.set_cfg_status_temporary("cloud load failed", 2)

				return
			end

			slot_0_78_0.sanitize_config_ui()
			slot_0_124_0(slot_0_122_0(var_862_0))

			if slot_0_78_0.cfg_post_load then
				slot_0_78_0.cfg_post_load()
			end

			local var_862_2 = tostring(arg_862_1.preset.name or "Cloud")

			slot_0_137_0.configs[var_862_2] = var_862_0
			slot_0_137_0.loaded = var_862_2

			slot_0_115_0(slot_0_137_0)
			slot_0_78_0.refresh_config_list(var_862_2)
			slot_0_78_0.cloud_ui.refresh_gate()
			slot_0_78_0.cloud_ui.track_load(var_861_0.id)
			slot_0_78_0.set_cfg_status_temporary("loaded from cloud: " .. var_862_2, 2)
		end)
	end)
	slot_0_152_0.home.cloud_load_aa:set_callback(function()
		local var_863_0 = slot_0_78_0.cloud_ui.selected_preset()

		if not var_863_0 then
			slot_0_78_0.set_cfg_status_temporary("select cloud preset", 2)

			return
		end

		slot_0_90_0.post("/v1/cloud/get", {
			id = var_863_0.id
		}, function(arg_864_0, arg_864_1, arg_864_2)
			if not arg_864_0 or type(arg_864_1) ~= "table" or arg_864_1.ok ~= true or type(arg_864_1.preset) ~= "table" then
				slot_0_78_0.set_cfg_status_temporary("cloud get failed", 2)

				return
			end

			local var_864_0 = arg_864_1.preset.entry

			if type(var_864_0) ~= "table" then
				slot_0_78_0.set_cfg_status_temporary("cloud data invalid", 2)

				return
			end

			local var_864_1 = slot_0_121_0(var_864_0)

			if not slot_701_79_0(var_864_1) then
				slot_0_78_0.set_cfg_status_temporary("cloud load AA failed", 2)

				return
			end

			slot_0_78_0.sanitize_config_ui()

			if slot_0_78_0.cfg_post_load then
				slot_0_78_0.cfg_post_load()
			end

			local var_864_2 = tostring(arg_864_1.preset.name or "Cloud")

			slot_0_137_0.configs[var_864_2] = var_864_0
			slot_0_137_0.loaded = var_864_2

			slot_0_115_0(slot_0_137_0)
			slot_0_78_0.refresh_config_list(var_864_2)
			slot_0_78_0.cloud_ui.track_load(var_863_0.id)
			slot_0_78_0.set_cfg_status_temporary("loaded cloud AA: " .. var_864_2, 2)
		end)
	end)
	slot_0_152_0.home.cloud_upload:set_callback(function()
		local var_865_0 = slot_0_78_0.selected_config_name()

		if var_865_0 == "" or var_865_0 == slot_0_112_0 then
			slot_0_78_0.set_cfg_status_temporary("select local preset", 2)

			return
		end

		local var_865_1 = slot_0_137_0.configs[var_865_0]

		if not var_865_1 then
			slot_0_78_0.set_cfg_status_temporary("config not found", 2)

			return
		end

		local var_865_2 = slot_0_123_0()

		if var_865_2 and type(var_865_1) == "table" and var_865_1.__ap_cfg == true then
			var_865_1.overlay = var_865_2

			slot_0_115_0(slot_0_137_0)
		end

		slot_0_90_0.post("/v1/cloud/save", {
			name = var_865_0,
			entry = var_865_1,
			build_name = tostring(slot_0_17_0.name or "amnesia.plus"),
			build_version = tostring(slot_0_78_0.api_script_version or slot_0_17_0.version or "")
		}, function(arg_866_0, arg_866_1, arg_866_2)
			if not arg_866_0 or type(arg_866_1) ~= "table" or arg_866_1.ok ~= true then
				local var_866_0 = "cloud save failed"

				if type(arg_866_1) == "table" then
					var_866_0 = tostring(arg_866_1.error or arg_866_1.message or var_866_0)
				end

				slot_0_78_0.set_cfg_status_temporary(var_866_0, 2)

				return
			end

			slot_0_78_0.set_cfg_status_temporary("cloud saved: " .. var_865_0, 2)
			slot_0_78_0.cloud_ui.fetch_list()
		end)
	end)
	slot_0_152_0.home.cloud_save:set_callback(function()
		local var_867_0 = slot_0_78_0.cloud_ui.selected_preset()

		if not var_867_0 then
			slot_0_78_0.set_cfg_status_temporary("select cloud preset", 2)

			return
		end

		if string.lower(tostring(var_867_0.author or "")) ~= string.lower(tostring(slot_0_18_0 or "")) then
			slot_0_78_0.set_cfg_status_temporary("cloud save forbidden", 2)

			return
		end

		local var_867_1, var_867_2 = pcall(slot_0_0_0.save)

		if not var_867_1 or type(var_867_2) ~= "table" then
			slot_0_78_0.set_cfg_status_temporary("cloud save failed", 2)

			return
		end

		local var_867_3 = slot_0_120_0(var_867_2, slot_0_18_0, slot_0_118_0(), slot_0_123_0())

		slot_0_90_0.post("/v1/cloud/save", {
			id = var_867_0.id,
			name = tostring(var_867_0.name or "Cloud"),
			entry = var_867_3,
			build_name = tostring(slot_0_17_0.name or "amnesia.plus"),
			build_version = tostring(slot_0_78_0.api_script_version or slot_0_17_0.version or "")
		}, function(arg_868_0, arg_868_1, arg_868_2)
			if not arg_868_0 or type(arg_868_1) ~= "table" or arg_868_1.ok ~= true then
				local var_868_0 = "cloud save failed"

				if type(arg_868_1) == "table" then
					var_868_0 = tostring(arg_868_1.error or arg_868_1.message or var_868_0)
				end

				slot_0_78_0.set_cfg_status_temporary(var_868_0, 2)

				return
			end

			slot_0_78_0.set_cfg_status_temporary("cloud saved: " .. tostring(var_867_0.name or "?"), 2)
			slot_0_78_0.cloud_ui.fetch_list()
		end)
	end)
	slot_0_152_0.home.cloud_like:set_callback(function()
		local var_869_0 = slot_0_78_0.cloud_ui.selected_preset()

		if not var_869_0 or not var_869_0.id then
			slot_0_78_0.set_cfg_status_temporary("select cloud preset", 2)

			return
		end

		slot_0_90_0.post("/v1/cloud/like", {
			id = var_869_0.id
		}, function(arg_870_0, arg_870_1, arg_870_2)
			if not arg_870_0 or type(arg_870_1) ~= "table" or arg_870_1.ok ~= true then
				slot_0_78_0.set_cfg_status_temporary("cloud like failed", 2)

				return
			end

			local var_870_0 = arg_870_1.liked == true
			local var_870_1 = tonumber(arg_870_1.likes) or 0
			local var_870_2 = tostring(var_869_0.id)

			;(function(arg_871_0)
				if type(arg_871_0) ~= "table" then
					return
				end

				for iter_871_0 = 1, #arg_871_0 do
					if tostring(arg_871_0[iter_871_0].id or "") == var_870_2 then
						arg_871_0[iter_871_0].liked = var_870_0
						arg_871_0[iter_871_0].likes = var_870_1
					end
				end
			end)(slot_0_78_0.cloud_presets_raw)
			slot_0_78_0.cloud_ui.apply_view()
			slot_0_78_0.set_cfg_status_temporary(var_870_0 and "cloud liked" or "cloud unliked", 2)
		end)
	end)
	slot_0_152_0.home.cloud_delete:set_callback(function()
		local var_872_0 = slot_0_78_0.cloud_ui.selected_preset()

		if not var_872_0 then
			slot_0_78_0.set_cfg_status_temporary("select cloud preset", 2)

			return
		end

		if string.lower(tostring(var_872_0.author or "")) ~= string.lower(tostring(slot_0_18_0 or "")) then
			slot_0_78_0.set_cfg_status_temporary("cloud delete forbidden", 2)

			return
		end

		slot_701_85_0("cloud_delete", function()
			slot_0_90_0.post("/v1/cloud/delete", {
				id = var_872_0.id
			}, function(arg_874_0, arg_874_1, arg_874_2)
				if not arg_874_0 or type(arg_874_1) ~= "table" or arg_874_1.ok ~= true then
					slot_0_78_0.set_cfg_status_temporary("cloud delete failed", 2)

					return
				end

				slot_0_78_0.set_cfg_status_temporary("cloud deleted: " .. tostring(var_872_0.name or "?"), 2)
				slot_0_78_0.cloud_ui.fetch_list()
			end)
		end)
	end)

	function slot_701_86_0(arg_875_0, arg_875_1)
		if not arg_875_0 or type(arg_875_0.get) ~= "function" then
			return arg_875_1
		end

		local var_875_0, var_875_1 = pcall(arg_875_0.get, arg_875_0)

		if not var_875_0 or var_875_1 == nil then
			return arg_875_1
		end

		return var_875_1
	end

	slot_701_87_0 = {
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

	function slot_701_88_0(arg_876_0, arg_876_1, arg_876_2)
		arg_876_2 = math.max(0, math.min(1, tonumber(arg_876_2) or 0))

		return arg_876_0 + (arg_876_1 - arg_876_0) * arg_876_2
	end

	function slot_701_89_0(arg_877_0, arg_877_1)
		arg_877_1 = math.max(1, math.floor(tonumber(arg_877_1) or 1))

		local var_877_0 = math.floor(tonumber(arg_877_0) or 0) % arg_877_1

		if var_877_0 < 0 then
			var_877_0 = var_877_0 + arg_877_1
		end

		return slot_701_87_0[var_877_0 + 1] or 0
	end

	function slot_701_90_0(arg_878_0, arg_878_1, arg_878_2)
		arg_878_2 = math.max(1, math.floor(tonumber(arg_878_2) or 1))

		if arg_878_1 == "Static" then
			return arg_878_2
		end

		if arg_878_1 == "Fluctuate" then
			if arg_878_2 <= arg_878_0.phase then
				arg_878_0.phase = 0

				return 0
			end

			arg_878_0.phase = arg_878_0.phase + 1

			return arg_878_2
		end

		if arg_878_1 == "Random" then
			if arg_878_0.rand_target == nil then
				arg_878_0.rand_target = math.random(0, arg_878_2)
			end

			return arg_878_0.rand_target
		end

		return 0
	end

	function slot_701_91_0(arg_879_0)
		return arg_879_0.yaw_mod and slot_701_86_0(arg_879_0.yaw_mod.mod_ignore_delay, false) == true
	end

	function slot_701_92_0(arg_880_0)
		if slot_701_91_0(arg_880_0) then
			return slot_0_78_0.aa_mod_sent or 0
		end

		return globals.tickcount or 0
	end

	function slot_701_93_0(arg_881_0)
		if slot_701_86_0(arg_881_0.yaw_mod, "Disabled") ~= "Skitter" then
			return 0
		end

		return slot_701_89_0(slot_701_92_0(arg_881_0), #slot_701_87_0)
	end

	function slot_701_94_0(arg_882_0)
		local var_882_0 = math.max(1, slot_701_86_0(arg_882_0.yaw.yaw_delay, 1))

		return var_882_0 > (slot_0_78_0.aa_mod_sent or 0) % (var_882_0 * 2) and "left" or "right"
	end

	function slot_701_95_0(arg_883_0)
		if globals.choked_commands ~= 0 then
			return
		end

		local var_883_0 = slot_701_86_0(arg_883_0.yaw_mod.mod_delay, "None")
		local var_883_1 = slot_701_86_0(arg_883_0.yaw_mod.mod_delay_ticks, 4)
		local var_883_2 = slot_701_90_0(slot_0_78_0.aa_mod_switch, var_883_0, var_883_1)

		slot_0_78_0.aa_mod_switch.hold = (slot_0_78_0.aa_mod_switch.hold or 0) + 1

		if var_883_2 < slot_0_78_0.aa_mod_switch.hold then
			slot_0_78_0.aa_mod_switch.switch = not slot_0_78_0.aa_mod_switch.switch
			slot_0_78_0.aa_mod_switch.hold = 0
			slot_0_78_0.aa_mod_switch.phase = 0
			slot_0_78_0.aa_mod_switch.rand_target = nil
		end
	end

	function slot_701_96_0(arg_884_0, arg_884_1)
		local var_884_0 = slot_701_86_0(arg_884_0.yaw_mod.randomize, 0) * 0.5

		if var_884_0 <= 0 then
			return arg_884_1
		end

		local var_884_1 = math.floor(var_884_0)

		return arg_884_1 + math.random(-var_884_1, var_884_1)
	end

	function slot_701_97_0()
		return slot_0_3_0
	end

	function slot_701_98_0()
		local var_886_0, var_886_1 = pcall(function()
			return refs.body_yaw:get()
		end)

		if not var_886_0 or not var_886_1 then
			return 0
		end

		local var_886_2, var_886_3 = pcall(function()
			return refs.inverter:get()
		end)

		if var_886_2 and var_886_3 then
			return 1
		end

		return -1
	end

	function slot_701_99_0()
		local var_889_0 = slot_701_97_0()

		if var_889_0 then
			local var_889_1

			pcall(function()
				if type(var_889_0.get_inverter_state) == "function" then
					local var_890_0 = var_889_0.get_inverter_state()

					if var_890_0 == true then
						var_889_1 = 1
					elseif var_890_0 == false then
						var_889_1 = -1
					end
				end
			end)

			if var_889_1 ~= nil then
				return var_889_1
			end

			pcall(function()
				if type(var_889_0.get_body_yaw) == "function" then
					local var_891_0, var_891_1 = var_889_0.get_body_yaw()
					local var_891_2 = var_891_1

					if var_891_2 == nil then
						var_891_2 = var_891_0
					end

					if type(var_891_2) == "number" then
						if var_891_2 > 0.5 then
							var_889_1 = 1
						elseif var_891_2 < -0.5 then
							var_889_1 = -1
						else
							var_889_1 = 0
						end
					end
				end
			end)

			if var_889_1 ~= nil then
				return var_889_1
			end

			pcall(function()
				if type(var_889_0.get_desync_delta) == "function" then
					local var_892_0, var_892_1 = var_889_0.get_desync_delta()
					local var_892_2 = var_892_1

					if var_892_2 == nil then
						var_892_2 = var_892_0
					end

					if type(var_892_2) == "number" then
						if var_892_2 > 0.5 then
							var_889_1 = 1
						elseif var_892_2 < -0.5 then
							var_889_1 = -1
						else
							var_889_1 = 0
						end
					end
				end
			end)

			if var_889_1 ~= nil then
				return var_889_1
			end
		end

		return slot_701_98_0()
	end

	slot_701_100_0 = nil

	function slot_701_101_0(arg_893_0, arg_893_1)
		local var_893_0 = slot_701_86_0(arg_893_0.yaw_mod.auto_min, -64)
		local var_893_1 = slot_701_86_0(arg_893_0.yaw_mod.auto_max, 33)

		if arg_893_1 then
			var_893_0 = slot_701_86_0(arg_893_0.yaw_mod.auto_alt_min, -33)
			var_893_1 = slot_701_86_0(arg_893_0.yaw_mod.auto_alt_max, 12)
		end

		local var_893_2 = math.floor(tonumber(var_893_0) or 0)
		local var_893_3 = math.floor(tonumber(var_893_1) or 0)

		if var_893_3 < var_893_2 then
			var_893_2, var_893_3 = var_893_3, var_893_2
		end

		return var_893_2, var_893_3
	end

	function slot_701_102_0(arg_894_0)
		local var_894_0 = math.max(0, math.min(100, math.floor(tonumber(slot_701_86_0(arg_894_0.yaw_mod.auto_alt_chance, 20)) or 0)))
		local var_894_1 = var_894_0 > 0 and var_894_0 >= math.random(1, 100)
		local var_894_2, var_894_3 = slot_701_101_0(arg_894_0, var_894_1)
		local var_894_4 = slot_701_100_0()
		local var_894_5

		if var_894_4 > 0 then
			local var_894_6 = math.max(0, var_894_2)
			local var_894_7 = math.max(0, var_894_3)

			if var_894_7 < var_894_6 then
				var_894_6, var_894_7 = var_894_7, var_894_6
			end

			var_894_5 = math.random(var_894_6, var_894_7)
		elseif var_894_4 < 0 then
			local var_894_8 = math.min(0, var_894_2)
			local var_894_9 = math.min(0, var_894_3)

			if var_894_9 < var_894_8 then
				var_894_8, var_894_9 = var_894_9, var_894_8
			end

			var_894_5 = math.random(var_894_8, var_894_9)
		else
			var_894_5 = math.random(var_894_2, var_894_3)
		end

		return slot_701_96_0(arg_894_0, var_894_5)
	end

	function slot_701_103_0(arg_895_0)
		slot_0_78_0.aa_auto.state_idx = arg_895_0 or -1
		slot_0_78_0.aa_auto.degree = nil
		slot_0_78_0.aa_auto.last_switch = slot_0_78_0.aa_mod_switch.switch == true
	end

	function slot_701_104_0(arg_896_0)
		if globals.choked_commands ~= 0 then
			return false
		end

		if slot_701_86_0(arg_896_0.yaw_mod.mod_delay, "None") == "None" then
			return true
		end

		if slot_701_91_0(arg_896_0) then
			local var_896_0 = math.max(1, slot_701_86_0(arg_896_0.yaw_mod.mod_delay_ticks, 4))

			return (slot_0_78_0.aa_mod_sent or 0) % var_896_0 == 0
		end

		local var_896_1 = slot_0_78_0.aa_mod_switch.switch ~= slot_0_78_0.aa_auto.last_switch

		slot_0_78_0.aa_auto.last_switch = slot_0_78_0.aa_mod_switch.switch == true

		return var_896_1
	end

	function slot_701_105_0(arg_897_0)
		local var_897_0 = slot_701_86_0(arg_897_0.yaw_mod, "Disabled")

		if var_897_0 == "Automatic" then
			return "Amnesic"
		end

		return var_897_0
	end

	function slot_701_106_0(arg_898_0, arg_898_1, arg_898_2)
		local var_898_0 = slot_701_105_0(arg_898_0)
		local var_898_1 = slot_701_86_0(arg_898_0.yaw_mod.offset, 0)

		refs.yaw_mod:set("Disabled")
		refs.yaw_mod_degree:set(0)

		if var_898_0 == "Amnesic" then
			arg_898_2 = tonumber(arg_898_2) or -1

			if slot_0_78_0.aa_auto.state_idx ~= arg_898_2 then
				slot_701_103_0(arg_898_2)
			end

			if slot_701_86_0(arg_898_0.yaw_mod.mod_delay, "None") ~= "None" and globals.choked_commands == 0 then
				slot_701_95_0(arg_898_0)
			end

			if (slot_0_78_0.aa_auto.degree == nil or slot_701_104_0(arg_898_0)) and (slot_0_78_0.aa_auto.degree == nil or globals.choked_commands == 0) then
				slot_0_78_0.aa_auto.degree = slot_701_102_0(arg_898_0)
			end

			refs.yaw_mod:override("Center")
			refs.yaw_mod_degree:override(slot_0_78_0.aa_auto.degree or 0)
			refs.offset:override(arg_898_1)

			return
		end

		if var_898_0 ~= "Disabled" then
			slot_701_95_0(arg_898_0)
		end

		if var_898_0 == "Jitter" then
			refs.yaw_mod:override("Offset")

			local var_898_2

			if slot_701_91_0(arg_898_0) then
				var_898_2 = (slot_0_78_0.aa_mod_sent or 0) % 2 == 0 and 1 or -1
			else
				var_898_2 = slot_0_78_0.aa_mod_switch.switch and 1 or -1
			end

			refs.yaw_mod_degree:override(slot_701_96_0(arg_898_0, var_898_1 * var_898_2))
			refs.offset:override(arg_898_1)

			return
		end

		if var_898_0 == "Ways" then
			local var_898_3 = math.max(3, math.min(8, slot_701_86_0(arg_898_0.yaw_mod.sweep_steps, 4)))
			local var_898_4 = slot_701_92_0(arg_898_0) % var_898_3 / math.max(var_898_3 - 1, 1)

			refs.offset:override(slot_701_96_0(arg_898_0, slot_701_88_0(-var_898_1, var_898_1, var_898_4)) + arg_898_1)

			return
		end

		if var_898_0 == "Rotate" then
			local var_898_5 = (globals.curtime or 0) * 4 % 1

			refs.offset:override(slot_701_96_0(arg_898_0, slot_701_88_0(-var_898_1, var_898_1, var_898_5)) + arg_898_1)

			return
		end

		if var_898_0 == "Skitter" then
			local var_898_6 = slot_701_93_0(arg_898_0)

			slot_0_78_0.aa_skitter_sign = var_898_6

			refs.offset:override(slot_701_96_0(arg_898_0, var_898_6 * var_898_1 * 2) + arg_898_1)

			return
		end

		slot_0_78_0.aa_skitter_sign = 0

		if var_898_0 ~= "Disabled" then
			refs.yaw_mod:override(var_898_0)
			refs.yaw_mod_degree:override(slot_701_96_0(arg_898_0, var_898_1))
		end
	end

	function slot_701_107_0(arg_899_0)
		local var_899_0 = {}

		if arg_899_0.body_yaw and arg_899_0.body_yaw.fake_options then
			local var_899_1 = arg_899_0.body_yaw.fake_options:get()

			if type(var_899_1) == "table" then
				for iter_899_0 = 1, #var_899_1 do
					if var_899_1[iter_899_0] ~= "Avoid Overlap" then
						var_899_0[#var_899_0 + 1] = var_899_1[iter_899_0]
					end
				end
			elseif type(var_899_1) == "string" and var_899_1 ~= "" and var_899_1 ~= "Avoid Overlap" then
				return var_899_1
			end
		end

		if #var_899_0 == 0 then
			return ""
		end

		return var_899_0
	end

	function slot_701_108_0(arg_900_0)
		if type(arg_900_0) == "boolean" then
			return arg_900_0
		end

		if type(arg_900_0) == "number" then
			return math.abs(arg_900_0) >= 1
		end

		return false
	end

	function slot_701_109_0()
		local var_901_0 = slot_701_97_0()

		if var_901_0 and type(var_901_0.get_inverter_state) == "function" then
			local var_901_1, var_901_2 = pcall(var_901_0.get_inverter_state)

			if var_901_1 and var_901_2 ~= nil then
				return var_901_2 == true
			end
		end

		local var_901_3, var_901_4 = pcall(function()
			return refs.inverter:get() == true
		end)

		if var_901_3 then
			return var_901_4 == true
		end

		return false
	end

	function slot_701_110_0(arg_903_0, arg_903_1)
		arg_903_1 = type(arg_903_1) == "table" and arg_903_1 or {}

		if not (arg_903_1.force == true) and (not arg_903_0 or not arg_903_0.body_yaw or slot_701_86_0(arg_903_0.body_yaw.avoid_overlap, false) ~= true) then
			return
		end

		local var_903_0, var_903_1 = pcall(function()
			return refs.body_yaw:get()
		end)

		if not var_903_0 or not var_903_1 then
			return
		end

		local var_903_2 = slot_701_97_0()

		if not var_903_2 or type(var_903_2.get_overlap) ~= "function" then
			return
		end

		local var_903_3 = arg_903_1.inverter

		if var_903_3 == nil then
			var_903_3 = slot_701_109_0()
		else
			var_903_3 = var_903_3 == true
		end

		local var_903_4

		pcall(function()
			var_903_4 = var_903_2.get_overlap(var_903_3)
		end)

		if var_903_4 == nil then
			pcall(function()
				var_903_4 = var_903_2.get_overlap(nil)
			end)
		end

		if not slot_701_108_0(var_903_4) then
			return
		end

		local var_903_5

		pcall(function()
			var_903_5 = var_903_2.get_overlap(not var_903_3)
		end)

		if type(var_903_4) == "number" and type(var_903_5) == "number" then
			if math.abs(var_903_5) + 0.001 < math.abs(var_903_4) then
				refs.inverter:override(not var_903_3)
			end

			return
		end

		refs.inverter:override(not var_903_3)
	end

	function slot_701_111_0(arg_908_0)
		if globals.choked_commands ~= 0 then
			return
		end

		local var_908_0 = slot_701_86_0(arg_908_0.switch_delay, "None")
		local var_908_1 = slot_701_86_0(arg_908_0.switch_ticks, 4)
		local var_908_2 = slot_701_90_0(slot_0_78_0.aa_switch, var_908_0, var_908_1)

		slot_0_78_0.aa_switch.hold = (slot_0_78_0.aa_switch.hold or 0) + 1

		if var_908_2 < slot_0_78_0.aa_switch.hold then
			slot_0_78_0.aa_switch.switch = not slot_0_78_0.aa_switch.switch
			slot_0_78_0.aa_switch.hold = 0
			slot_0_78_0.aa_switch.phase = 0
			slot_0_78_0.aa_switch.rand_target = nil
		end
	end

	slot_701_100_0 = slot_701_99_0

	function slot_701_112_0(arg_909_0, arg_909_1)
		if not arg_909_0.yaw_mod or not slot_701_86_0(arg_909_0.yaw_mod.add_yaw, false) then
			return arg_909_1
		end

		local var_909_0 = slot_701_100_0()

		if var_909_0 > 0 then
			return arg_909_1 + slot_701_86_0(arg_909_0.yaw_mod.add_right, 0)
		end

		if var_909_0 < 0 then
			return arg_909_1 + slot_701_86_0(arg_909_0.yaw_mod.add_left, 0)
		end

		return arg_909_1
	end

	function slot_701_113_0(arg_910_0, arg_910_1)
		if arg_910_1 then
			refs.body_freestanding:override(true)
			refs.desync_freestand:override(arg_910_1)

			return
		end

		local var_910_0 = slot_701_86_0(arg_910_0.body_yaw.body_fs, "Off")

		if var_910_0 ~= "Off" then
			refs.body_freestanding:override(true)
			refs.desync_freestand:override(var_910_0)
		else
			refs.body_freestanding:override()
			refs.desync_freestand:override()
		end
	end

	slot_701_114_0 = {
		15,
		11,
		13,
		17,
		12,
		9,
		8
	}

	function slot_701_115_0(arg_911_0)
		return (slot_701_114_0[tonumber(arg_911_0) or 1] or 13) + math.random(0, 3)
	end

	function slot_701_116_0()
		local var_912_0 = 58

		pcall(function()
			var_912_0 = math.floor(rage.antiaim:get_max_desync() or 58)
		end)

		var_912_0 = math.max(32, math.min(60, var_912_0))

		local var_912_1 = 0

		if slot_0_78_0.aa and slot_0_78_0.aa.desync_value then
			var_912_1 = slot_0_78_0.aa.desync_value() or 0
		end

		local var_912_2 = var_912_0 - var_912_1
		local var_912_3 = math.random(0, 5)
		local var_912_4 = math.max(28, var_912_2 - var_912_3)
		local var_912_5 = math.max(28, var_912_2 - math.random(0, 4))

		if math.random(1, 100) <= 18 then
			var_912_4, var_912_5 = var_912_5, var_912_4
		end

		return var_912_4, var_912_5
	end

	function slot_701_117_0(arg_914_0, arg_914_1)
		if not arg_914_0 or not arg_914_1 then
			return false
		end

		local var_914_0, var_914_1 = pcall(function()
			return arg_914_1.m_fThrowTime
		end)

		if var_914_0 and var_914_1 and var_914_1 ~= 0 then
			return true
		end

		local var_914_2 = ""

		pcall(function()
			var_914_2 = tostring(arg_914_1:get_weapon_name() or ""):lower()
		end)

		if var_914_2:find("grenade", 1, true) or var_914_2:find("flashbang", 1, true) or var_914_2:find("molotov", 1, true) or var_914_2:find("incgrenade", 1, true) then
			local var_914_3 = globals.tickcount or 0

			slot_0_78_0.aa_amnesia_body.nade_seen = var_914_3

			return true
		end

		local var_914_4 = globals.tickcount or 0
		local var_914_5 = slot_0_78_0.aa_amnesia_body.nade_seen or 0

		return var_914_5 > 0 and var_914_4 - var_914_5 <= 16
	end

	function slot_701_118_0(arg_917_0)
		local var_917_0 = tonumber(arg_917_0) or 0

		while var_917_0 > 180 do
			var_917_0 = var_917_0 - 360
		end

		while var_917_0 < -180 do
			var_917_0 = var_917_0 + 360
		end

		return var_917_0
	end

	function slot_701_119_0(arg_918_0)
		if not arg_918_0 then
			return 0
		end

		return slot_701_86_0(arg_918_0.offset, 0)
	end

	function slot_701_120_0(arg_919_0, arg_919_1)
		arg_919_1 = arg_919_1 == true

		local var_919_0 = arg_919_1 and slot_701_86_0(arg_919_0.yaw.yaw_add_left, 0) or slot_701_86_0(arg_919_0.yaw.yaw_add_right, 0)

		return slot_701_118_0(var_919_0)
	end

	function slot_701_121_0(arg_920_0)
		return math.max(-89, math.min(89, tonumber(arg_920_0) or 0))
	end

	function slot_701_122_0(arg_921_0)
		slot_0_78_0.defensive_runtime[arg_921_0] = slot_0_78_0.defensive_runtime[arg_921_0] or {
			pitch_spin = 0,
			cycle = 0,
			ways_tick = 0,
			delayed = 0,
			jitter_side = false,
			yaw_spin = 0
		}

		return slot_0_78_0.defensive_runtime[arg_921_0]
	end

	function slot_701_123_0(arg_922_0)
		if not arg_922_0 then
			return 1
		end

		local var_922_0 = arg_922_0.m_vecVelocity
		local var_922_1 = 0

		if var_922_0 then
			var_922_1 = math.sqrt(var_922_0.x * var_922_0.x + var_922_0.y * var_922_0.y)
		end

		if var_922_1 > 24 then
			local var_922_2 = math.deg(math.atan2(var_922_0.y, var_922_0.x))
			local var_922_3 = render.camera_angles().y
			local var_922_4 = slot_701_118_0(var_922_2 - var_922_3)

			if math.abs(var_922_4) > 8 then
				return var_922_4 > 0 and 1 or -1
			end
		end

		local var_922_5 = false

		pcall(function()
			if refs.peek_assist then
				if type(refs.peek_assist.get_override) == "function" then
					local var_923_0 = refs.peek_assist:get_override()

					if var_923_0 ~= nil then
						var_922_5 = var_923_0 == true
					end
				end

				if not var_922_5 and type(refs.peek_assist.get) == "function" then
					var_922_5 = refs.peek_assist:get() == true
				end
			end
		end)

		if var_922_5 and var_922_1 > 2 and var_922_0 then
			local var_922_6 = math.deg(math.atan2(var_922_0.y, var_922_0.x))
			local var_922_7 = render.camera_angles().y

			return slot_701_118_0(var_922_6 - var_922_7) >= 0 and 1 or -1
		end

		local var_922_8 = slot_701_100_0()

		if var_922_8 == 0 then
			var_922_8 = 1
		end

		return var_922_8
	end

	function slot_701_124_0(arg_924_0)
		local var_924_0 = false

		pcall(function()
			if refs.peek_assist and type(refs.peek_assist.get) == "function" then
				var_924_0 = refs.peek_assist:get() == true
			end

			if not var_924_0 and refs.peek_assist and type(refs.peek_assist.get_override) == "function" then
				var_924_0 = refs.peek_assist:get_override() == true
			end
		end)

		if var_924_0 then
			return "Peek Fake"
		end

		if not arg_924_0 then
			return "Off"
		end

		local var_924_1 = arg_924_0.m_vecVelocity
		local var_924_2 = 0

		if var_924_1 then
			var_924_2 = math.sqrt(var_924_1.x * var_924_1.x + var_924_1.y * var_924_1.y)
		end

		if var_924_2 > 28 then
			return "Peek Fake"
		end

		if var_924_2 > 8 and slot_701_123_0(arg_924_0) ~= 0 then
			return "Peek Fake"
		end

		return "Off"
	end

	function slot_701_125_0(arg_926_0, arg_926_1, arg_926_2, arg_926_3)
		local var_926_0 = slot_0_78_0.aa_amnesia_body

		arg_926_3 = tonumber(arg_926_3) or 1

		if var_926_0.state_idx ~= arg_926_3 then
			var_926_0.state_idx = arg_926_3
			var_926_0.tick = 0
			var_926_0.side = false
			var_926_0.hold = false
			var_926_0.ll, var_926_0.rl = slot_701_116_0()
		end

		if slot_701_117_0(arg_926_1, arg_926_2) then
			refs.body_yaw:override(false)
			refs.options:override("")
			refs.body_freestanding:override()
			refs.desync_freestand:override()

			return
		end

		if globals.choked_commands == 0 then
			var_926_0.tick = (var_926_0.tick or 0) + 1

			if var_926_0.tick > slot_701_115_0(arg_926_3) then
				var_926_0.tick = 0
				var_926_0.hold = not var_926_0.hold

				if not var_926_0.hold then
					var_926_0.side = not var_926_0.side
					var_926_0.ll, var_926_0.rl = slot_701_116_0()
				end
			end
		end

		refs.extended:override(false)
		refs.extended_p:override(0)

		if var_926_0.hold then
			refs.body_yaw:override(false)
			refs.options:override("")
			refs.body_freestanding:override()
			refs.desync_freestand:override()

			return
		end

		local var_926_1 = slot_701_124_0(arg_926_1)

		if var_926_1 ~= "Off" then
			refs.body_freestanding:override(true)
			refs.desync_freestand:override(var_926_1)
		else
			refs.body_freestanding:override()
			refs.desync_freestand:override()
		end

		refs.body_yaw:override(true)

		local var_926_2 = var_926_0.side == true

		refs.inverter:override(var_926_2)
		refs.left_limit:override(var_926_0.ll or 58)
		refs.right_limit:override(var_926_0.rl or 58)
		refs.options:override({
			"Jitter"
		})

		if math.random(1, 100) <= 12 then
			var_926_2 = not var_926_2

			refs.inverter:override(var_926_2)
		end

		slot_701_110_0(arg_926_0, {
			force = true,
			inverter = var_926_2
		})
	end

	function slot_701_126_0(arg_927_0)
		if arg_927_0 then
			slot_0_78_0.defensive_runtime[arg_927_0] = nil
		end
	end

	function slot_701_127_0()
		slot_0_78_0.def_snap.active = false
		slot_0_78_0.def_snap.ticks = 0
		slot_0_78_0.def_snap.apex_lc = 0
		slot_0_78_0.def_snap.snapping = false
	end

	function slot_701_128_0()
		slot_0_78_0.def_use_active = false

		refs.hidden:override(false)
		refs.lag_options:override()

		if slot_0_78_0.def_was_snapping then
			pcall(function()
				rage.antiaim:override_hidden_pitch(89)
				rage.antiaim:override_hidden_yaw_offset(0)
			end)

			slot_0_78_0.def_was_snapping = false
		end
	end

	function slot_701_129_0(arg_931_0)
		local var_931_0 = arg_931_0.m_nTickBase or 0
		local var_931_1 = slot_0_78_0.exploit.tickbase_apex or 0

		if math.abs(var_931_0 - var_931_1) > 64 then
			var_931_1 = 0
		end

		if var_931_1 < var_931_0 then
			var_931_1 = var_931_0
		end

		slot_0_78_0.exploit.tickbase_apex = var_931_1

		return math.min(14, math.max(0, var_931_1 - var_931_0 - 1))
	end

	function slot_701_130_0()
		local var_932_0 = slot_701_97_0()

		if not var_932_0 or type(var_932_0.get_tickbase_value) ~= "function" then
			return 0
		end

		local var_932_1, var_932_2 = pcall(var_932_0.get_tickbase_value)

		if not var_932_1 or var_932_2 == nil then
			return 0
		end

		return math.min(14, math.max(0, math.floor(tonumber(var_932_2) or 0)))
	end

	function slot_701_131_0(arg_933_0)
		if not arg_933_0 then
			return
		end

		local var_933_0 = slot_701_129_0(arg_933_0)
		local var_933_1 = slot_701_130_0()
		local var_933_2 = math.max(var_933_0, var_933_1)
		local var_933_3 = 0
		local var_933_4 = slot_701_97_0()

		if var_933_4 then
			pcall(function()
				if type(var_933_4.get_exploit_charge) == "function" then
					var_933_3 = tonumber(var_933_4.get_exploit_charge()) or 0
				end
			end)
		end

		slot_0_78_0.exploit.lc_left = var_933_2
		slot_0_78_0.exploit.charge = var_933_3
		slot_0_78_0.exploit.tickbase_shift = var_933_1

		local var_933_5 = slot_0_78_0.exploit.prev_kind or "off"

		if refs.fd:get() == true then
			slot_0_78_0.exploit.active_kind = "off"
		elseif refs.dt:get() == true then
			slot_0_78_0.exploit.active_kind = "dt"
		elseif refs.hs:get() == true then
			slot_0_78_0.exploit.active_kind = "hs"
		else
			slot_0_78_0.exploit.active_kind = "off"
		end

		if slot_0_78_0.exploit.active_kind ~= var_933_5 then
			slot_701_127_0()
			slot_701_128_0()
		end

		slot_0_78_0.exploit.prev_kind = slot_0_78_0.exploit.active_kind

		if var_933_2 <= 0 and not slot_0_78_0.def_snap.snapping then
			slot_701_127_0()
		end
	end

	function slot_701_132_0()
		if refs.fd:get() == true then
			return false
		end

		local var_935_0 = slot_701_97_0()

		if var_935_0 and type(var_935_0.get_doubletap_state) == "function" then
			local var_935_1, var_935_2 = pcall(var_935_0.get_doubletap_state)

			if var_935_1 and var_935_2 == true then
				return true
			end
		end

		if (slot_0_78_0.exploit.charge or 0) > 0 and refs.dt:get() == true then
			return true
		end

		if refs.dt:get() == true then
			return true
		end

		if slot_0_152_0.antiaim.def_settings and slot_0_152_0.antiaim.def_settings.allow_hs and slot_0_152_0.antiaim.def_settings.allow_hs:get() == true and refs.hs:get() == true then
			return true
		end

		return false
	end

	function slot_701_133_0()
		return slot_0_78_0.exploit.active_kind == "hs" and refs.dt:get() ~= true
	end

	function slot_701_134_0(arg_937_0)
		arg_937_0 = tonumber(arg_937_0) or 1

		if arg_937_0 >= 2 and arg_937_0 <= 7 then
			return arg_937_0 - 1
		end

		if arg_937_0 == 8 then
			return 6
		end

		return 1
	end

	function slot_701_135_0(arg_938_0, arg_938_1)
		local var_938_0 = slot_0_78_0.exploit.lc_left or 0
		local var_938_1 = math.max(1, math.min(13, slot_701_86_0(arg_938_0.duration, 13)))

		if not arg_938_1 then
			slot_701_127_0()

			return false
		end

		if var_938_0 > (slot_0_78_0.def_snap.apex_lc or 0) then
			slot_0_78_0.def_snap.active = true
			slot_0_78_0.def_snap.ticks = 0
			slot_0_78_0.def_snap.apex_lc = var_938_0
			slot_0_78_0.def_snap.fresh = true
			slot_0_78_0.def_snap.snapping = false
		end

		if var_938_0 <= 0 and not slot_0_78_0.def_snap.snapping then
			slot_701_127_0()

			return false
		end

		slot_0_78_0.def_snap.ticks = (slot_0_78_0.def_snap.ticks or 0) + 1

		local var_938_2 = var_938_1 >= slot_0_78_0.def_snap.ticks

		if var_938_2 then
			slot_0_78_0.def_snap.snapping = true
		elseif slot_0_78_0.def_snap.snapping then
			slot_0_78_0.def_snap.snapping = false
		end

		return var_938_2
	end

	function slot_701_136_0(arg_939_0, arg_939_1)
		local var_939_0 = math.max(1, math.min(13, slot_701_86_0(arg_939_0.duration, 13)))

		arg_939_1.once_apex = arg_939_1.once_apex or slot_0_78_0.def_snap.apex_lc or var_939_0

		local var_939_1 = math.min(arg_939_1.once_apex, var_939_0)

		if var_939_1 <= 1 then
			return 0
		end

		local var_939_2 = arg_939_1.once_apex - (var_939_1 - 1)
		local var_939_3 = slot_0_78_0.exploit.lc_left or 0

		return math.max(0, math.min(1, (var_939_3 - var_939_2) / (var_939_1 - 1)))
	end

	function slot_701_137_0(arg_940_0, arg_940_1)
		arg_940_1 = math.max(0, math.floor(tonumber(arg_940_1) or 0))

		if arg_940_1 <= 0 then
			if globals.choked_commands == 0 then
				arg_940_0.jitter_side = not arg_940_0.jitter_side
			end

			return
		end

		if globals.choked_commands == 0 then
			arg_940_0.delayed = (arg_940_0.delayed or 0) + 1
		end

		if arg_940_1 < (arg_940_0.delayed or 0) then
			arg_940_0.jitter_side = not arg_940_0.jitter_side
			arg_940_0.delayed = 0
		end
	end

	function slot_701_138_0(arg_941_0)
		local var_941_0 = entity.get_threat(false)

		if not var_941_0 or not var_941_0:is_alive() then
			return render.camera_angles().y
		end

		local var_941_1 = arg_941_0:get_origin()
		local var_941_2 = var_941_0:get_origin()
		local var_941_3 = var_941_2.y - var_941_1.y
		local var_941_4 = var_941_2.x - var_941_1.x

		return math.deg(math.atan2(var_941_3, var_941_4))
	end

	function slot_701_139_0(arg_942_0)
		local var_942_0 = slot_0_152_0.antiaim and slot_0_152_0.antiaim.def_settings and slot_0_152_0.antiaim.def_settings.land_pitch

		if not var_942_0 or var_942_0:get() ~= true or not arg_942_0 then
			return false
		end

		local var_942_1 = arg_942_0:get_anim_state()

		return var_942_1 and var_942_1.landing == true and not slot_701_0_0(arg_942_0)
	end

	function slot_701_140_0()
		local var_943_0 = slot_0_152_0.antiaim and slot_0_152_0.antiaim.def_settings and slot_0_152_0.antiaim.def_settings.clear_mod

		return not var_943_0 or var_943_0:get() ~= false
	end

	function slot_701_141_0(arg_944_0, arg_944_1)
		if arg_944_0 ~= nil and slot_701_139_0(arg_944_1) then
			return 0
		end

		return arg_944_0
	end

	function slot_701_142_0()
		if slot_701_140_0() then
			refs.yaw_mod:set("Disabled")
			refs.yaw_mod_degree:set(0)
		end
	end

	function slot_701_143_0(arg_946_0, arg_946_1, arg_946_2)
		local var_946_0 = arg_946_0.pitch:get()
		local var_946_1 = slot_701_86_0(arg_946_0.pitch.angle, -89)
		local var_946_2 = slot_701_86_0(arg_946_0.pitch.angle2, 89)
		local var_946_3 = slot_701_86_0(arg_946_0.pitch.speed, 20)
		local var_946_4 = render.camera_angles().x

		if var_946_0 == "Off" then
			return nil
		elseif var_946_0 == "Static" then
			return var_946_1
		elseif var_946_0 == "Jitter" then
			return arg_946_1.jitter_side and var_946_2 or var_946_1
		elseif var_946_0 == "Random" then
			return math.random(math.min(var_946_1, var_946_2), math.max(var_946_1, var_946_2))
		elseif var_946_0 == "Random Static" then
			if arg_946_1.cycle % 12 == 0 then
				arg_946_1.pitch_spin = math.random(math.min(var_946_1, var_946_2), math.max(var_946_1, var_946_2))
			end

			return arg_946_1.pitch_spin
		elseif var_946_0 == "Spin" then
			arg_946_1.pitch_spin = slot_701_121_0((arg_946_1.pitch_spin or var_946_1) + var_946_3 * 0.15)

			return arg_946_1.pitch_spin
		elseif var_946_0 == "Spin Full" then
			local var_946_5 = slot_701_136_0(arg_946_0, arg_946_1)

			return slot_701_121_0(slot_701_88_0(var_946_1, var_946_2, var_946_5))
		elseif var_946_0 == "Camera" then
			return var_946_4
		elseif var_946_0 == "At target" then
			return -var_946_4
		end

		return nil
	end

	function slot_701_144_0(arg_947_0, arg_947_1, arg_947_2)
		slot_947_3_0 = arg_947_0.yaw:get()
		slot_947_4_0 = slot_701_86_0(arg_947_0.yaw.angle, 180)
		slot_947_5_0 = slot_701_86_0(arg_947_0.yaw.angle2, 90)
		slot_947_6_0 = math.max(0, slot_701_86_0(arg_947_0.yaw.delay, 0))
		slot_947_7_0 = slot_701_86_0(arg_947_0.yaw.speed, 20)
		slot_947_8_0 = slot_701_118_0(slot_947_4_0 - 180 + slot_0_78_0.yaw_add)

		if slot_947_3_0 == "Off" then
			return nil
		elseif slot_947_3_0 == "Static" then
			return slot_947_8_0
		elseif slot_947_3_0 == "Jitter" then
			return slot_701_118_0((arg_947_1.jitter_side and slot_947_5_0 - 180 or slot_947_4_0 - 180) + slot_0_78_0.yaw_add)
		elseif slot_947_3_0 == "Switch" then
			return slot_701_118_0((arg_947_1.jitter_side and slot_947_5_0 - 180 or slot_947_4_0 - 180) + slot_0_78_0.yaw_add)
		elseif slot_947_3_0 == "Random" then
			return slot_701_118_0(math.random(-179, 179))
		elseif slot_947_3_0 == "Random Jitter" then
			slot_947_9_5 = math.random(0, 1) == 1 and slot_947_4_0 or slot_947_5_0

			return slot_701_118_0((arg_947_1.jitter_side and slot_947_9_5 - 180 or -(slot_947_9_5 - 180)) + slot_0_78_0.yaw_add)
		elseif slot_947_3_0 == "Random Static" then
			if arg_947_1.cycle % 12 == 0 then
				arg_947_1.yaw_spin = math.random(-179, 179)
			end

			return slot_701_118_0((arg_947_1.yaw_spin or 0) + slot_0_78_0.yaw_add)
		elseif slot_947_3_0 == "Spin" then
			arg_947_1.yaw_spin = slot_701_118_0((arg_947_1.yaw_spin or slot_947_8_0) + slot_947_7_0)

			return arg_947_1.yaw_spin
		elseif slot_947_3_0 == "Spin Full" then
			slot_947_9_4 = slot_701_136_0(arg_947_0, arg_947_1)

			return slot_701_118_0(slot_701_88_0(slot_947_4_0 * -0.5, slot_947_4_0 * 0.5, slot_947_9_4) + slot_0_78_0.yaw_add)
		elseif slot_947_3_0 == "Spin Jitter" then
			arg_947_1.yaw_spin = slot_701_118_0((arg_947_1.yaw_spin or slot_947_8_0) + slot_947_7_0)

			return slot_701_118_0(arg_947_1.yaw_spin + (arg_947_1.jitter_side and 35 or -35))
		elseif slot_947_3_0 == "Sway" then
			slot_947_9_3 = slot_947_4_0 - 180
			slot_947_10_2 = slot_947_5_0 - 180
			slot_947_11_2 = math.max(0.05, math.abs(slot_947_7_0) * 0.08)
			slot_947_12_2 = (math.sin((globals.realtime or 0) * slot_947_11_2) + 1) * 0.5

			return slot_701_118_0(slot_701_88_0(slot_947_9_3, slot_947_10_2, slot_947_12_2) + slot_0_78_0.yaw_add)
		elseif slot_947_3_0 == "Ways" then
			if globals.choked_commands == 0 then
				arg_947_1.ways_tick = (arg_947_1.ways_tick or 0) + 1
			end

			slot_947_9_2 = math.max(2, math.min(8, slot_701_86_0(arg_947_0.yaw.ways, 4)))
			slot_947_10_1 = math.max(1, math.abs(slot_947_4_0 - 180))
			slot_947_11_1 = (arg_947_1.ways_tick or 0) % slot_947_9_2
			slot_947_12_1 = slot_947_9_2 > 1 and slot_947_11_1 / (slot_947_9_2 - 1) or 0

			return slot_701_118_0(slot_701_88_0(-slot_947_10_1, slot_947_10_1, slot_947_12_1) + slot_0_78_0.yaw_add)
		elseif slot_947_3_0 == "Peek" then
			slot_947_9_1 = slot_701_123_0(arg_947_2)

			return slot_701_118_0(slot_0_78_0.yaw_add + slot_947_9_1 * (slot_947_4_0 - 180))
		elseif slot_947_3_0 == "90w" then
			slot_947_9_0 = math.max(1, math.min(13, slot_701_86_0(arg_947_0.duration, 13)))
			slot_947_10_0 = arg_947_1.cycle % 2 == 0 and 1 or -1
			slot_947_11_0 = (slot_0_78_0.exploit.lc_left or 0) / slot_947_9_0 * math.max(0.01, math.abs(slot_947_7_0)) * 0.05 % 1
			slot_947_12_0 = slot_701_88_0(slot_947_4_0 * -0.5, slot_947_4_0 * 0.5, slot_947_11_0)

			return slot_701_118_0(slot_0_78_0.yaw_add + slot_947_10_0 * 90 + slot_947_12_0 - 90)
		elseif slot_947_3_0 == "180v" then
			arg_947_1.yaw_spin = slot_701_118_0((arg_947_1.yaw_spin or 0) + slot_947_7_0)

			return slot_701_118_0(slot_0_78_0.yaw_add + math.sin(math.rad(arg_947_1.yaw_spin)) * 180)
		elseif slot_947_3_0 == "Opposite" then
			return slot_701_118_0(slot_701_138_0(arg_947_2) + 180)
		end

		return nil
	end

	function slot_701_145_0(arg_948_0, arg_948_1, arg_948_2)
		slot_0_78_0.def_use_active = false

		refs.hidden:override(true)
		slot_701_142_0()

		local var_948_0 = slot_701_122_0(arg_948_0)

		if slot_0_78_0.def_snap.fresh then
			var_948_0.once_apex = slot_0_78_0.def_snap.apex_lc
			var_948_0.pitch_spin = 0
			var_948_0.yaw_spin = 0
			var_948_0.ways_tick = 0
			var_948_0.pitch_once = nil
			var_948_0.yaw_once = nil
			slot_0_78_0.def_snap.fresh = false
		end

		var_948_0.cycle = (var_948_0.cycle or 0) + 1

		local var_948_1 = slot_701_86_0(arg_948_1.pitch, "Off")
		local var_948_2 = slot_701_86_0(arg_948_1.yaw, "Off")
		local var_948_3 = math.max(0, slot_701_86_0(arg_948_1.yaw.delay, 0))

		if var_948_1 == "Jitter" or var_948_2 == "Jitter" or var_948_2 == "Switch" or var_948_2 == "Random Jitter" or var_948_2 == "Spin Jitter" then
			slot_701_137_0(var_948_0, var_948_3)
		end

		local var_948_4 = slot_701_143_0(arg_948_1, var_948_0, arg_948_2)
		local var_948_5 = slot_701_144_0(arg_948_1, var_948_0, arg_948_2)
		local var_948_6 = slot_701_141_0(var_948_4, arg_948_2)

		if var_948_6 ~= nil then
			rage.antiaim:override_hidden_pitch(slot_701_121_0(var_948_6))
		end

		if var_948_5 ~= nil then
			rage.antiaim:override_hidden_yaw_offset(slot_701_118_0(var_948_5))
		end
	end

	slot_701_146_0 = {
		{
			name = "Standing",
			pitch = "cycle",
			lc = false,
			yaw_delay = 5,
			yaw_amp = 82
		},
		{
			name = "Moving",
			pitch = "down",
			lc = true,
			yaw_delay = 3,
			yaw_amp = 104
		},
		{
			name = "Walking",
			pitch = "cycle",
			lc = true,
			yaw_delay = 4,
			yaw_amp = 96
		},
		{
			name = "Air",
			pitch = "up",
			lc = true,
			yaw_delay = 2,
			yaw_amp = 122
		},
		{
			name = "Air~C",
			pitch = "up",
			lc = true,
			yaw_delay = 2,
			yaw_amp = 128
		},
		{
			name = "Crouching",
			pitch = "zero",
			lc = false,
			yaw_delay = 4,
			yaw_amp = 88
		}
	}
	slot_701_147_0 = {
		{
			pitch = "down",
			yaw_delay = 2,
			yaw_amp = 58
		},
		{
			pitch = "up",
			yaw_delay = 2,
			yaw_amp = 72
		},
		{
			pitch = "cycle",
			yaw_delay = 3,
			yaw_amp = 68
		},
		{
			pitch = "up",
			yaw_delay = 1,
			yaw_amp = 96
		},
		{
			pitch = "up",
			yaw_delay = 1,
			yaw_amp = 102
		},
		{
			pitch = "zero",
			yaw_delay = 3,
			yaw_amp = 54
		}
	}

	function slot_701_148_0(arg_949_0)
		return slot_701_146_0[arg_949_0] or slot_701_146_0[1]
	end

	function slot_701_149_0(arg_950_0, arg_950_1, arg_950_2)
		local var_950_0 = slot_0_152_0.antiaim.defensive_states[arg_950_2]

		if var_950_0 and var_950_0.force_lc and var_950_0.force_lc:get() == true then
			return true
		end

		if arg_950_1 == "Default" and not slot_701_133_0() then
			return slot_701_148_0(arg_950_2).lc == true
		end

		return false
	end

	function slot_701_150_0(arg_951_0, arg_951_1)
		if not arg_951_0 or not arg_951_1 then
			return false
		end

		if not slot_701_12_0(arg_951_1) then
			return false
		end

		if slot_701_13_0(arg_951_0) then
			return false
		end

		if not slot_701_14_0(arg_951_0, arg_951_1) then
			return false
		end

		return true
	end

	function slot_701_151_0(arg_952_0, arg_952_1)
		local var_952_0, var_952_1 = pcall(function()
			local var_953_0 = entity.get_threat(false)

			if not var_953_0 then
				return false
			end

			local var_953_1, var_953_2 = pcall(function()
				return var_953_0:is_alive()
			end)

			if not var_953_1 or var_953_2 ~= true then
				return false
			end

			local var_953_3
			local var_953_4
			local var_953_5, var_953_6 = pcall(function()
				return var_953_0:get_eye_position()
			end)

			if var_953_5 then
				var_953_3 = var_953_6
			end

			local var_953_7, var_953_8 = pcall(function()
				return arg_952_1:get_hitbox_position(1)
			end)

			if var_953_7 then
				var_953_4 = var_953_8
			end

			if not var_953_3 or not var_953_4 then
				return false
			end

			local var_953_9
			local var_953_10, var_953_11 = pcall(function()
				return var_953_3:dist(var_953_4)
			end)

			if var_953_10 and type(var_953_11) == "number" then
				var_953_9 = var_953_11
			else
				local var_953_12 = (var_953_4.x or 0) - (var_953_3.x or 0)
				local var_953_13 = (var_953_4.y or 0) - (var_953_3.y or 0)
				local var_953_14 = (var_953_4.z or 0) - (var_953_3.z or 0)

				var_953_9 = math.sqrt(var_953_12 * var_953_12 + var_953_13 * var_953_13 + var_953_14 * var_953_14)
			end

			if not var_953_9 or var_953_9 <= 1 then
				return false
			end

			local var_953_15 = ((var_953_4.z or 0) - (var_953_3.z or 0)) / var_953_9
			local var_953_16 = 0.25
			local var_953_17 = 0.5

			if arg_952_0 == 6 then
				var_953_16, var_953_17 = -0.05, 0.3
			elseif arg_952_0 == 4 then
				var_953_16, var_953_17 = 0.15, 0.75
			elseif arg_952_0 == 5 then
				local var_953_18 = false
				local var_953_19 = false
				local var_953_20, var_953_21 = pcall(function()
					return arg_952_1:get_player_weapon()
				end)

				if var_953_20 and var_953_21 then
					local var_953_22, var_953_23 = pcall(function()
						return var_953_21:get_classid()
					end)

					if var_953_22 and var_953_23 then
						var_953_18 = var_953_23 == 107
						var_953_19 = var_953_23 == 268
					end
				end

				if var_953_18 or var_953_19 then
					var_953_16, var_953_17 = -0.05, 0.55
				else
					var_953_16, var_953_17 = 0.1, 0.75
				end
			end

			return var_953_16 <= var_953_15 and var_953_15 <= var_953_17
		end)

		return var_952_0 and var_952_1 == true
	end

	function slot_701_152_0(arg_960_0, arg_960_1, arg_960_2)
		refs.hidden:override(true)
		slot_701_142_0()

		local var_960_0 = slot_701_122_0(arg_960_0)

		if slot_0_78_0.def_snap.fresh then
			var_960_0.once_apex = slot_0_78_0.def_snap.apex_lc
			var_960_0.pitch_spin = 0
			var_960_0.yaw_spin = 0
			var_960_0.pitch_once = nil
			var_960_0.yaw_once = nil
			slot_0_78_0.def_snap.fresh = false
		end

		slot_0_78_0.def_use_active = false

		if slot_701_150_0(arg_960_1, arg_960_2) then
			slot_0_78_0.def_use_active = true

			pcall(function()
				refs.body_freestanding:override(true)
				refs.desync_freestand:override("Peek Real")
				rage.antiaim:override_hidden_yaw_offset(180)
				rage.antiaim:override_hidden_pitch(89)
			end)

			return
		end

		local var_960_1 = slot_701_148_0(arg_960_0)
		local var_960_2 = math.max(1, var_960_1.yaw_delay or 3)
		local var_960_3 = math.floor(globals.tickcount / var_960_2) % 2 == 0 and 1 or -1
		local var_960_4 = slot_701_118_0((slot_0_78_0.yaw_add or 0) + (var_960_1.yaw_amp or 90) * var_960_3)
		local var_960_5
		local var_960_6 = var_960_1.pitch or "cycle"
		local var_960_7

		if var_960_6 == "up" then
			var_960_7 = -89
		elseif var_960_6 == "down" then
			var_960_7 = 89
		elseif var_960_6 == "zero" then
			var_960_7 = 0
		elseif slot_701_0_0(arg_960_1) then
			var_960_7 = -89
		else
			local var_960_8 = globals.tickcount % 6

			var_960_7 = var_960_8 < 2 and 89 or var_960_8 < 4 and -89 or 0
		end

		if slot_701_151_0(arg_960_0, arg_960_1) then
			var_960_4 = 0
		end

		local var_960_9 = slot_701_141_0(var_960_7, arg_960_1)

		pcall(function()
			rage.antiaim:override_hidden_yaw_offset(var_960_4)
			rage.antiaim:override_hidden_pitch(slot_701_121_0(var_960_9))
		end)
	end

	function slot_701_153_0(arg_963_0, arg_963_1)
		slot_0_78_0.def_use_active = false

		refs.hidden:override(true)
		slot_701_142_0()

		local var_963_0 = slot_701_147_0[arg_963_0] or slot_701_147_0[1]
		local var_963_1 = slot_701_122_0(arg_963_0)

		if slot_0_78_0.def_snap.fresh then
			var_963_1.once_apex = slot_0_78_0.def_snap.apex_lc
			var_963_1.pitch_spin = 0
			var_963_1.yaw_spin = 0
			var_963_1.pitch_once = nil
			var_963_1.yaw_once = nil
			slot_0_78_0.def_snap.fresh = false
		end

		var_963_1.cycle = (var_963_1.cycle or 0) + 1

		local var_963_2 = math.max(1, var_963_0.yaw_delay or 2)

		slot_701_137_0(var_963_1, var_963_2)

		local var_963_3 = var_963_1.jitter_side and 1 or -1
		local var_963_4 = slot_701_118_0((var_963_0.yaw_amp or 60) * var_963_3)
		local var_963_5
		local var_963_6 = var_963_0.pitch or "down"
		local var_963_7 = var_963_6 == "up" and -89 or var_963_6 == "down" and 89 or var_963_6 == "zero" and 0 or var_963_1.jitter_side and 89 or -89
		local var_963_8 = slot_701_141_0(var_963_7, arg_963_1)

		rage.antiaim:override_hidden_yaw_offset(var_963_4)
		rage.antiaim:override_hidden_pitch(slot_701_121_0(var_963_8))
	end

	function slot_701_154_0(arg_964_0)
		if slot_0_78_0.aa_defensive_allowed and slot_0_78_0.aa_defensive_allowed() == false then
			return false
		end

		if slot_0_152_0.antiaim.safe_head:get() then
			local var_964_0 = slot_701_22_0()

			if var_964_0 > 0 and slot_701_23_0(arg_964_0, var_964_0) then
				return false
			end
		end

		local var_964_1 = globals.realtime
		local var_964_2 = false

		for iter_964_0 = #slot_0_78_0.anti_bruteforce.realtime, 1, -1 do
			local var_964_3 = var_964_1 - (slot_0_78_0.anti_bruteforce.realtime[iter_964_0] or 0)

			if var_964_3 <= 0.35 then
				var_964_2 = true

				break
			end

			if var_964_3 > 1 then
				break
			end
		end

		local var_964_4 = arg_964_0.m_vecVelocity
		local var_964_5 = var_964_4 and var_964_4:length() or 0
		local var_964_6 = slot_701_0_0(arg_964_0)
		local var_964_7 = slot_701_4_0() < -0.08

		return var_964_2 or var_964_7 or var_964_6 and var_964_5 > 150
	end

	slot_0_78_0.def = {
		algorithm = slot_701_154_0,
		exploit_update = slot_701_131_0,
		resolve_idx = slot_701_134_0,
		exploit_active = slot_701_132_0,
		is_hs_only = slot_701_133_0,
		snap_advance = slot_701_135_0,
		snap_reset = slot_701_127_0,
		disarm = slot_701_128_0,
		force_lc = slot_701_149_0,
		apply_hs = slot_701_153_0,
		apply_default = slot_701_152_0,
		apply_custom = slot_701_145_0,
		runtime_reset = slot_701_126_0
	}
	slot_0_78_0.aa = {
		sim_diff = slot_701_4_0,
		cond_trig = slot_701_6_0,
		freestand_apply = slot_701_10_0,
		force_static = slot_701_9_0,
		manual_yaw_mode = slot_0_153_0,
		manual_mode_active = slot_0_154_0,
		manual_static_apply = slot_701_11_0,
		safe_head = slot_701_24_0,
		legit_aa_process = slot_701_16_0,
		fix_bomb_site_e = slot_701_17_0,
		yaw_base_degree = slot_701_7_0,
		yaw_value = slot_701_31_0,
		dynamic_right = slot_701_25_0,
		desync_value = slot_701_32_0,
		apply_yaw_modifier = slot_701_106_0,
		yaw_apply_add = slot_701_112_0,
		apply_body_freestanding = slot_701_113_0,
		apply_body_amnesia = slot_701_125_0,
		body_options_value = slot_701_107_0,
		apply_overlap = slot_701_110_0,
		switch_delay_tick = slot_701_111_0,
		mod_wave_pick = slot_701_89_0,
		mod_phase_clock = slot_701_92_0,
		mod_skitter_sign = slot_701_93_0,
		flick_side = slot_701_94_0,
		brute_reset = slot_701_28_0,
		brute_trigger = slot_701_30_0,
		yaw_method_name = slot_701_27_0,
		lr_yaw_pick = slot_701_120_0,
		builder_yaw_offset = slot_701_119_0
	}
	slot_0_78_0.anim = {
		clear_legs = slot_701_75_0
	}
	slot_0_78_0.move_apply = slot_701_73_0
	slot_0_78_0.safe_item_get = slot_701_86_0

	function slot_701_155_0(arg_965_0, arg_965_1)
		if type(arg_965_0) ~= "table" then
			return
		end

		arg_965_1 = math.max(8, math.floor(tonumber(arg_965_1) or 64))

		local var_965_0 = {
			drag_hint = true,
			wm = true,
			hud_menu = true
		}
		local var_965_1 = 0

		for iter_965_0 in pairs(arg_965_0) do
			var_965_1 = var_965_1 + 1

			if arg_965_1 < var_965_1 then
				for iter_965_1, iter_965_2 in pairs(arg_965_0) do
					if not var_965_0[iter_965_1] then
						arg_965_0[iter_965_1] = nil
					end
				end

				return
			end
		end
	end

	function slot_701_156_0(arg_966_0)
		slot_0_78_0.anti_bruteforce.tickcounts = {}
		slot_0_78_0.anti_bruteforce.realtime = {}

		slot_701_28_0()

		if type(slot_0_78_0.defensive) == "table" then
			slot_0_78_0.defensive = nil
		end

		slot_701_155_0(slot_0_78_0.hc_manip_miss, 64)
		slot_701_155_0(slot_0_78_0.hud_fade_mix, 32)
		slot_701_155_0(slot_0_78_0.presence_peer_roster, 128)
		slot_701_155_0(slot_0_78_0.presence_sid_roster, 128)
		slot_701_155_0(slot_0_78_0.ap_userid_steamid64, 64)
		slot_701_155_0(slot_0_78_0.ap_entity_sid_cache, 64)

		if arg_966_0 ~= true then
			return
		end

		slot_0_78_0.defensive_runtime = {}
		slot_0_78_0.prev_simulation_time = 0

		if slot_0_78_0.hc_manip_reset_misses then
			slot_0_78_0.hc_manip_reset_misses()
		end

		local var_966_0 = slot_0_78_0.screen_logs
		local var_966_1 = slot_0_78_0.ELOG_MAX_ROWS or 8

		if type(var_966_0) == "table" then
			while var_966_1 < #var_966_0 do
				table.remove(var_966_0)
			end
		end

		if slot_0_78_0.def then
			slot_0_78_0.def.snap_reset()
			slot_0_78_0.def.disarm()
		end

		slot_0_78_0.exploit.tickbase_apex = 0
		slot_0_78_0.exploit.lc_left = 0
		slot_0_78_0.exploit.charge = 0
		slot_0_78_0.exploit.tickbase_shift = 0
		slot_0_78_0.exploit.prev_kind = "off"
		slot_0_78_0.def_was_snapping = false
		slot_0_78_0.aa_auto = {
			last_switch = false,
			state_idx = -1
		}
		slot_0_78_0.aa_amnesia_body = {
			hold = false,
			state_idx = -1,
			side = false,
			tick = 0,
			ll = 58,
			nade_seen = 0,
			rl = 58
		}
	end

	slot_0_78_0.runtime_sanitize = slot_701_156_0
	slot_0_78_0.runtime_trim_map = slot_701_155_0

	function slot_0_78_0.cfg_post_load()
		slot_701_156_0(true)

		if slot_0_78_0.aspect_cfg_reload then
			pcall(slot_0_78_0.aspect_cfg_reload)
		end

		pcall(function()
			rage.antiaim:override_hidden_pitch(89)
			rage.antiaim:override_hidden_yaw_offset(0)
		end)
		pcall(function()
			refs.hidden:override()
			refs.lag_options:override()
		end)

		if slot_0_78_0.cfg_sync_linked_selectors then
			slot_0_78_0.cfg_sync_linked_selectors()
		end

		if slot_0_78_0.aa_selector_sync then
			slot_0_78_0.aa_selector_sync()
		end
	end
end)()

safe_item_get = slot_0_78_0.safe_item_get

function slot_0_78_0.ping_apply()
	local var_970_0 = slot_0_152_0.vars.ping_spike_unlock

	if not var_970_0 or var_970_0:get() ~= true then
		refs.fakeping:override()

		return
	end

	local var_970_1 = var_970_0.ovr
	local var_970_2 = var_970_1 and var_970_1:get() or 200

	refs.fakeping:override(var_970_2)
end

pcall(function()
	local var_971_0 = slot_0_152_0.vars.ping_spike_unlock

	if not var_971_0 or type(var_971_0.set_callback) ~= "function" then
		return
	end

	var_971_0:set_callback(function()
		slot_0_78_0.ping_apply()
	end, true)

	if var_971_0.ovr and type(var_971_0.ovr.set_callback) == "function" then
		var_971_0.ovr:set_callback(slot_0_78_0.ping_apply)
	end
end)
;(function()
	local var_973_0 = slot_0_107_0()
	local var_973_1 = {
		AWP = "AWP",
		["SSG-08"] = "SSG-08",
		["Auto Snipers"] = "AutoSnipers",
		Pistols = "Pistols",
		Revolver = "R8 Revolver",
		["Desert Eagle"] = "Desert Eagle"
	}
	local var_973_2 = HC_TRIGGER_OPTS

	local function var_973_3(arg_974_0)
		arg_974_0 = tostring(arg_974_0 or "")
		arg_974_0 = arg_974_0:gsub("\a%x%x%x%x%x%x%x%x", "")
		arg_974_0 = arg_974_0:gsub("\x01.", "")
		arg_974_0 = arg_974_0:gsub("\f<[^>]+>", "")
		arg_974_0 = arg_974_0:gsub("\r\t", "")

		return arg_974_0:match("^%s*(.-)%s*$") or arg_974_0
	end

	local var_973_4 = 1
	local var_973_5 = 5
	local var_973_6 = {}

	local function var_973_7()
		return {
			get = function()
				return nil
			end,
			set = function()
				return
			end,
			override = function()
				return
			end
		}
	end

	local function var_973_8(...)
		local var_979_0, var_979_1 = pcall(ui.find, ...)

		if var_979_0 and var_979_1 then
			return var_979_1
		end

		return var_973_7()
	end

	local function var_973_9(arg_980_0, arg_980_1)
		if slot_0_78_0 and type(slot_0_78_0.safe_item_get) == "function" then
			return slot_0_78_0.safe_item_get(arg_980_0, arg_980_1)
		end

		if not arg_980_0 or type(arg_980_0.get) ~= "function" then
			return arg_980_1
		end

		local var_980_0, var_980_1 = pcall(function()
			return arg_980_0:get()
		end)

		if var_980_0 and var_980_1 ~= nil then
			return var_980_1
		end

		return arg_980_1
	end

	local function var_973_10(arg_982_0)
		local var_982_0 = var_973_9(arg_982_0, var_973_2[1])

		if type(var_982_0) == "number" then
			return var_973_2[var_982_0 + 1] or var_973_2[1]
		end

		local var_982_1 = var_973_3(var_982_0)

		for iter_982_0 = 1, #var_973_2 do
			if var_982_1 == var_973_2[iter_982_0] then
				return var_973_2[iter_982_0]
			end
		end

		return var_973_2[1]
	end

	local function var_973_11()
		for iter_983_0 = 1, #var_973_0 do
			local var_983_0 = var_973_0[iter_983_0]
			local var_983_1 = var_973_1[var_983_0]

			if var_983_1 and not var_973_6[var_983_0] then
				var_973_6[var_983_0] = var_973_8("Aimbot", "Ragebot", "Selection", var_983_1, "Hit Chance")
			end
		end
	end

	local function var_973_12()
		for iter_984_0 = 1, #var_973_0 do
			local var_984_0 = var_973_6[var_973_0[iter_984_0]]

			if var_984_0 and type(var_984_0.override) == "function" then
				pcall(function()
					var_984_0:override()
				end)
			end
		end
	end

	local function var_973_13(arg_986_0)
		if not arg_986_0 then
			return nil
		end

		local var_986_0, var_986_1 = pcall(function()
			return arg_986_0:get_weapon_info()
		end)

		if not var_986_0 or not var_986_1 then
			return nil
		end

		local var_986_2 = tonumber(var_986_1.weapon_type) or 0
		local var_986_3 = tonumber(arg_986_0:get_weapon_index()) or 0

		if var_986_2 == var_973_4 then
			if var_986_3 == 1 then
				return "Desert Eagle"
			end

			if var_986_3 == 64 then
				return "Revolver"
			end

			return "Pistols"
		end

		if var_986_2 == var_973_5 then
			if var_986_3 == 9 then
				return "AWP"
			end

			if var_986_3 == 40 then
				return "SSG-08"
			end

			return "Auto Snipers"
		end

		return nil
	end

	local function var_973_14(arg_988_0)
		if not arg_988_0 then
			return 0
		end

		local var_988_0, var_988_1 = pcall(function()
			return arg_988_0:get_origin()
		end)

		if var_988_0 and var_988_1 and type(var_988_1.z) == "number" then
			return var_988_1.z
		end

		return 0
	end

	local function var_973_15(arg_990_0, arg_990_1)
		return var_973_14(arg_990_1) - var_973_14(arg_990_0) > 53
	end

	local function var_973_16(arg_991_0, arg_991_1)
		return var_973_14(arg_991_0) - var_973_14(arg_991_1) > 53
	end

	local function var_973_17(arg_992_0, arg_992_1, arg_992_2)
		if not arg_992_0 or not arg_992_1 or not arg_992_2 then
			return false
		end

		local var_992_0, var_992_1 = pcall(function()
			return arg_992_2:get_weapon_info()
		end)

		if not var_992_0 or not var_992_1 then
			return false
		end

		local var_992_2, var_992_3 = pcall(function()
			return arg_992_0:get_eye_position()
		end)
		local var_992_4, var_992_5 = pcall(function()
			return arg_992_1:get_hitbox_position(3)
		end)

		if not var_992_2 or not var_992_3 or not var_992_4 or not var_992_5 then
			return false
		end

		local var_992_6 = var_992_3:dist(var_992_5)
		local var_992_7 = tonumber(var_992_1.damage) or 0
		local var_992_8 = tonumber(var_992_1.range) or 8192
		local var_992_9 = tonumber(var_992_1.range_modifier) or 1
		local var_992_10 = var_992_7 * math.pow(var_992_9, math.min(var_992_8, var_992_6) * 0.002)

		if (tonumber(arg_992_1.m_ArmorValue) or 0) > 0 then
			var_992_10 = var_992_10 * (tonumber(var_992_1.armor_ratio) or 0.5) * 0.5
		end

		return var_992_10 >= (tonumber(arg_992_1.m_iHealth) or 0)
	end

	local function var_973_18(arg_996_0)
		slot_0_78_0.hc_manip_miss = slot_0_78_0.hc_manip_miss or {}

		local var_996_0 = tostring(arg_996_0 or "")

		if var_996_0 == "" then
			return 0
		end

		return tonumber(slot_0_78_0.hc_manip_miss[var_996_0]) or 0
	end

	local function var_973_19(arg_997_0, arg_997_1, arg_997_2, arg_997_3, arg_997_4)
		if arg_997_0 == "Higher elevation" then
			return var_973_15(arg_997_1, arg_997_2)
		end

		if arg_997_0 == "Lower elevation" then
			return var_973_16(arg_997_1, arg_997_2)
		end

		if arg_997_0 == "Lethal" then
			return var_973_17(arg_997_1, arg_997_2, arg_997_3)
		end

		if arg_997_0 == "After misses" then
			local var_997_0 = math.max(1, math.floor(tonumber(var_973_9(arg_997_4.miss_need, 2)) or 2))
			local var_997_1, var_997_2 = pcall(function()
				return arg_997_2:get_index()
			end)

			if not var_997_1 or var_997_2 == nil then
				return false
			end

			return var_997_0 <= var_973_18(var_997_2)
		end

		if arg_997_0 == "Low enemy HP" then
			return math.max(1, math.floor(tonumber(var_973_9(arg_997_4.hp_below, 80)) or 80)) > (tonumber(arg_997_2.m_iHealth) or 100)
		end

		return false
	end

	local function var_973_20()
		var_973_11()

		local var_999_0 = slot_0_152_0.vars and slot_0_152_0.vars.hc_manip

		if not var_999_0 or var_973_9(var_999_0, false) ~= true then
			var_973_12()

			return
		end

		local var_999_1 = entity.get_local_player()

		if not var_999_1 then
			var_973_12()

			return
		end

		local var_999_2, var_999_3 = pcall(function()
			return var_999_1:is_alive()
		end)

		if not var_999_2 or var_999_3 ~= true then
			var_973_12()

			return
		end

		local var_999_4 = var_999_1:get_player_weapon()

		if not var_999_4 then
			var_973_12()

			return
		end

		local var_999_5 = var_973_13(var_999_4)

		if not var_999_5 then
			var_973_12()

			return
		end

		local var_999_6 = entity.get_threat()

		if not var_999_6 then
			var_973_12()

			return
		end

		local var_999_7 = slot_0_152_0.vars and slot_0_152_0.vars.hc_manip_profiles
		local var_999_8 = var_999_7 and var_999_7[var_999_5]

		if not var_999_8 or var_973_9(var_999_8.enabled, false) ~= true then
			var_973_12()

			return
		end

		local var_999_9 = var_973_10(var_999_8.when)

		if not var_973_19(var_999_9, var_999_1, var_999_6, var_999_4, var_999_8) then
			var_973_12()

			return
		end

		local var_999_10 = math.max(1, math.min(100, math.floor(tonumber(var_973_9(var_999_8.chance, 55)) or 55)))

		var_973_12()

		local var_999_11 = var_973_6[var_999_5]

		if var_999_11 and type(var_999_11.override) == "function" then
			pcall(function()
				var_999_11:override(var_999_10)
			end)
		end
	end

	local function var_973_21(arg_1002_0)
		if not arg_1002_0 or arg_1002_0.state == nil or not arg_1002_0.target then
			return
		end

		local var_1002_0 = slot_0_152_0.vars and slot_0_152_0.vars.hc_manip

		if not var_1002_0 or var_973_9(var_1002_0, false) ~= true then
			return
		end

		local var_1002_1 = entity.get(arg_1002_0.target)

		if not var_1002_1 then
			return
		end

		local var_1002_2, var_1002_3 = pcall(function()
			return var_1002_1:get_index()
		end)

		if not var_1002_2 or var_1002_3 == nil then
			return
		end

		slot_0_78_0.hc_manip_miss = slot_0_78_0.hc_manip_miss or {}

		local var_1002_4 = tostring(var_1002_3)

		slot_0_78_0.hc_manip_miss[var_1002_4] = (tonumber(slot_0_78_0.hc_manip_miss[var_1002_4]) or 0) + 1

		if slot_0_78_0.runtime_trim_map then
			slot_0_78_0.runtime_trim_map(slot_0_78_0.hc_manip_miss, 64)
		end
	end

	local function var_973_22(arg_1004_0)
		if type(arg_1004_0) ~= "table" then
			return
		end

		local var_1004_0 = entity.get_local_player()
		local var_1004_1 = entity.get(arg_1004_0.attacker, true)

		if not var_1004_0 or var_1004_1 ~= var_1004_0 then
			return
		end

		local var_1004_2 = entity.get(arg_1004_0.userid, true)

		if not var_1004_2 then
			return
		end

		local var_1004_3, var_1004_4 = pcall(function()
			return var_1004_2:get_index()
		end)

		if var_1004_3 and var_1004_4 ~= nil then
			slot_0_78_0.hc_manip_miss = slot_0_78_0.hc_manip_miss or {}
			slot_0_78_0.hc_manip_miss[tostring(var_1004_4)] = nil
		end
	end

	local function var_973_23()
		slot_0_78_0.hc_manip_miss = {}
	end

	slot_0_78_0.hc_manip_tick = var_973_20
	slot_0_78_0.hc_manip_clear = var_973_12
	slot_0_78_0.hc_manip_reset_misses = var_973_23
	slot_0_78_0.hc_manip_on_aim_ack = var_973_21
	slot_0_78_0.hc_manip_on_kill = var_973_22
end)()
;(function()
	local var_1007_0 = bit.lshift(1, 0)
	local var_1007_1 = 17
	local var_1007_2 = 3
	local var_1007_3 = 2
	local var_1007_4 = 450
	local var_1007_5 = 0.14
	local var_1007_6 = 0.25
	local var_1007_7 = 64
	local var_1007_8 = 65
	local var_1007_9 = table.clear or function(arg_1008_0)
		for iter_1008_0 in pairs(arg_1008_0) do
			arg_1008_0[iter_1008_0] = nil
		end
	end
	local var_1007_10 = {}
	local var_1007_11 = false
	local var_1007_12
	local var_1007_13 = 0
	local var_1007_14 = false
	local var_1007_15 = math.huge
	local var_1007_16 = false
	local var_1007_17 = 0
	local var_1007_18 = false

	local function var_1007_19(...)
		local var_1009_0, var_1009_1 = pcall(ui.find, ...)

		if var_1009_0 and var_1009_1 then
			return var_1009_1
		end
	end

	local var_1007_20 = {
		dt = refs and refs.dt or var_1007_19("Aimbot", "Ragebot", "Main", "Double Tap"),
		peek = var_1007_19("Aimbot", "Ragebot", "Main", "Peek Assist"),
		retreat = var_1007_19("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"),
		slow_walk = var_1007_19("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
		hit_chance = var_1007_19("Aimbot", "Ragebot", "Selection", "Hit Chance"),
		min_damage = var_1007_19("Aimbot", "Ragebot", "Selection", "Min. Damage"),
		hitboxes = var_1007_19("Aimbot", "Ragebot", "Selection", "Hitboxes"),
		body_aim = var_1007_19("Aimbot", "Ragebot", "Safety", "Body Aim"),
		body_dis = var_1007_19("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers"),
		head_scale = var_1007_19("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"),
		body_scale = var_1007_19("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale"),
		hitbox_safe = var_1007_19("Aimbot", "Ragebot", "Safety", "Ensure Hitbox Safety"),
		safe_pts = var_1007_19("Aimbot", "Ragebot", "Safety", "Safe Points"),
		body_aim_safe = var_1007_19("Aimbot", "Ragebot", "Safety", "Body Aim"),
		force_peek = var_1007_19("Aimbot", "Ragebot", "Safety", "Body Aim", "Force on Peek")
	}

	local function var_1007_21()
		return slot_0_152_0.vars and slot_0_152_0.vars.adaptive_peek
	end

	local function var_1007_22(arg_1011_0, arg_1011_1)
		if slot_0_78_0 and type(slot_0_78_0.safe_item_get) == "function" then
			return slot_0_78_0.safe_item_get(arg_1011_0, arg_1011_1)
		end

		if not arg_1011_0 or type(arg_1011_0.get) ~= "function" then
			return arg_1011_1
		end

		local var_1011_0, var_1011_1 = pcall(function()
			return arg_1011_0:get()
		end)

		if var_1011_0 and var_1011_1 ~= nil then
			return var_1011_1
		end

		return arg_1011_1
	end

	local function var_1007_23(arg_1013_0)
		if not arg_1013_0 then
			return false
		end

		if type(arg_1013_0.get_override) == "function" then
			local var_1013_0, var_1013_1 = pcall(function()
				return arg_1013_0:get_override()
			end)

			if var_1013_0 and var_1013_1 ~= nil then
				if type(var_1013_1) == "boolean" then
					return var_1013_1
				end

				if type(var_1013_1) == "number" then
					return var_1013_1 > 0
				end

				return var_1013_1 ~= ""
			end
		end

		if type(arg_1013_0.get) == "function" then
			local var_1013_2, var_1013_3 = pcall(function()
				return arg_1013_0:get()
			end)

			return var_1013_2 and var_1013_3 == true
		end

		return false
	end

	local function var_1007_24(arg_1016_0)
		return (arg_1016_0 + 180) % 360 - 180
	end

	local function var_1007_25(arg_1017_0)
		if arg_1017_0 == 40 then
			return "SSG 08"
		end

		if arg_1017_0 == 9 then
			return "AWP"
		end

		if arg_1017_0 == 1 then
			return "Desert Eagle"
		end

		if arg_1017_0 == 64 then
			return "R8 Revolver"
		end

		local var_1017_0
		local var_1017_1 = entity.get_local_player()

		if var_1017_1 then
			local var_1017_2 = var_1017_1:get_player_weapon()

			if var_1017_2 and var_1017_2:get_weapon_index() == arg_1017_0 then
				var_1017_0 = var_1017_2:get_weapon_info()
			end
		end

		if var_1017_0 and tonumber(var_1017_0.weapon_type) == 1 then
			return "Pistol"
		end

		return "Other"
	end

	local function var_1007_26(arg_1018_0, arg_1018_1)
		if not arg_1018_0 or not arg_1018_0.weapons or not arg_1018_1 then
			return false
		end

		local var_1018_0 = _G.bind_listed_check

		if type(var_1018_0) == "function" then
			return var_1018_0(arg_1018_0.weapons, arg_1018_1, AP_PEEK_WEAPON_DEFS)
		end

		local var_1018_1, var_1018_2 = pcall(function()
			return arg_1018_0.weapons:get(arg_1018_1)
		end)

		return var_1018_1 and var_1018_2 == true
	end

	local function var_1007_27(arg_1020_0, arg_1020_1)
		if not arg_1020_0 or not arg_1020_0.opts or not arg_1020_1 then
			return false
		end

		local var_1020_0 = _G.bind_listed_check

		if type(var_1020_0) == "function" then
			return var_1020_0(arg_1020_0.opts, arg_1020_1, AP_PEEK_OPT_DEFS)
		end

		local var_1020_1, var_1020_2 = pcall(function()
			return arg_1020_0.opts:get(arg_1020_1)
		end)

		return var_1020_1 and var_1020_2 == true
	end

	local function var_1007_28(arg_1022_0, arg_1022_1)
		arg_1022_1 = math.max(0, math.min(1, tonumber(arg_1022_1) or 1))

		local var_1022_0 = math.floor(arg_1022_1 * 255 + 0.5)

		if type(arg_1022_0) == "userdata" and type(arg_1022_0.alpha_modulate) == "function" then
			local var_1022_1, var_1022_2 = pcall(function()
				return arg_1022_0:alpha_modulate(var_1022_0)
			end)

			if var_1022_1 and var_1022_2 then
				return var_1022_2
			end
		end

		if type(arg_1022_0) == "userdata" or type(arg_1022_0) == "table" then
			return color(tonumber(arg_1022_0.r) or 165, tonumber(arg_1022_0.g) or 125, tonumber(arg_1022_0.b) or 255, var_1022_0)
		end

		return color(165, 125, 255, var_1022_0)
	end

	local var_1007_29
	local var_1007_30 = "\aAAAAAAFF"
	local var_1007_31 = 8
	local var_1007_32 = 4
	local var_1007_33 = 20

	local function var_1007_34()
		if not var_1007_29 then
			local var_1024_0, var_1024_1 = pcall(render.load_font, "Segoe UI Semibold", vector(14, 12), "a")

			var_1007_29 = var_1024_0 and var_1024_1 or 1
		end
	end

	local function var_1007_35(arg_1025_0, arg_1025_1)
		arg_1025_1 = math.max(0, math.min(1, tonumber(arg_1025_1) or 1))

		local var_1025_0 = var_1007_22(arg_1025_0.visualization, color(165, 125, 255, 255))
		local var_1025_1 = color(255, 255, 255, 255)

		if slot_0_89_0 and type(slot_0_89_0.hud_accent_color) == "function" then
			var_1025_1 = slot_0_89_0.hud_accent_color(arg_1025_1)
		end

		local var_1025_2 = 0.32
		local var_1025_3 = math.floor((var_1025_0.r or 165) * var_1025_2 + (var_1025_1.r or 255) * (1 - var_1025_2))
		local var_1025_4 = math.floor((var_1025_0.g or 125) * var_1025_2 + (var_1025_1.g or 255) * (1 - var_1025_2))
		local var_1025_5 = math.floor((var_1025_0.b or 255) * var_1025_2 + (var_1025_1.b or 255) * (1 - var_1025_2))

		return color(var_1025_3, var_1025_4, var_1025_5, math.floor(255 * arg_1025_1))
	end

	local function var_1007_36(arg_1026_0)
		if not arg_1026_0 then
			return nil
		end

		local var_1026_0, var_1026_1 = pcall(function()
			return render.world_to_screen(arg_1026_0)
		end)

		if var_1026_0 and var_1026_1 then
			return var_1026_1
		end

		return render.get_offscreen(arg_1026_0, 1, true)
	end

	local function var_1007_37(arg_1028_0, arg_1028_1)
		arg_1028_1 = arg_1028_1 or var_1007_29 or 1

		local var_1028_0, var_1028_1 = slot_0_89_0.measure_cached(arg_1028_1, arg_1028_0)

		return var_1028_0, type(var_1028_1) == "number" and var_1028_1 > 0 and var_1028_1 or 12
	end

	local function var_1007_38(arg_1029_0, arg_1029_1, arg_1029_2, arg_1029_3)
		if not arg_1029_0 or not arg_1029_1 then
			return
		end

		arg_1029_3 = tonumber(arg_1029_3) or 1.5

		local var_1029_0 = arg_1029_2 and (arg_1029_2.a or 180) or 180

		pcall(function()
			render.line(arg_1029_0, arg_1029_1, color(0, 0, 0, math.floor(var_1029_0 * 0.22)), arg_1029_3 + 0.5)
			render.line(arg_1029_0, arg_1029_1, arg_1029_2 or color(255, 255, 255, math.floor(var_1029_0 * 0.7)), arg_1029_3)
		end)
	end

	local function var_1007_39(arg_1031_0, arg_1031_1, arg_1031_2)
		if not arg_1031_0 then
			return
		end

		arg_1031_2 = tonumber(arg_1031_2) or 1

		local var_1031_0 = var_1007_28(arg_1031_1, 0.28 * arg_1031_2)
		local var_1031_1 = var_1007_28(arg_1031_1, 0.82 * arg_1031_2)

		pcall(function()
			render.circle(arg_1031_0, var_1031_0, 2.5, 0, 1)
			render.circle_outline(arg_1031_0, var_1031_1, 4, 0, 1, 1)
		end)
	end

	local function var_1007_40(arg_1033_0, arg_1033_1, arg_1033_2)
		arg_1033_0 = tostring(arg_1033_0 or "")
		arg_1033_1 = tostring(arg_1033_1 or "")

		local var_1033_0 = ""

		if slot_0_89_0 and type(slot_0_89_0.hud_accent_markup) == "function" then
			var_1033_0 = slot_0_89_0.hud_accent_markup(arg_1033_2)
		end

		if arg_1033_1 ~= "" then
			return var_1033_0 .. arg_1033_0 .. var_1007_30 .. " · " .. arg_1033_1
		end

		return var_1033_0 .. arg_1033_0
	end

	local function var_1007_41(arg_1034_0, arg_1034_1, arg_1034_2, arg_1034_3, arg_1034_4)
		if not arg_1034_0 or arg_1034_3 <= 0.02 then
			return
		end

		var_1007_34()

		local var_1034_0 = var_1007_40(arg_1034_1, arg_1034_2, arg_1034_3)
		local var_1034_1, var_1034_2 = var_1007_37(var_1034_0, var_1007_29)
		local var_1034_3 = var_1034_1 + var_1007_31 * 2
		local var_1034_4 = math.max(var_1007_33, var_1034_2 + var_1007_32 * 2)
		local var_1034_5 = math.floor(arg_1034_0.x - var_1034_3 * 0.5 + 0.5)
		local var_1034_6 = math.floor(arg_1034_0.y - var_1034_4 - 8 + 0.5)
		local var_1034_7 = vector(var_1034_5, var_1034_6)
		local var_1034_8 = vector(var_1034_5 + var_1034_3, var_1034_6 + var_1034_4)
		local var_1034_9
		local var_1034_10

		if slot_0_89_0 and type(slot_0_89_0.ensure_hud_corners) == "function" then
			var_1034_9, var_1034_10 = slot_0_89_0.ensure_hud_corners()
		end

		if slot_0_89_0 and type(slot_0_89_0.paint_hud_card_bg) == "function" then
			local var_1034_11 = slot_0_89_0.hud_widget_radius and slot_0_89_0.hud_widget_radius() or 4

			slot_0_89_0.paint_hud_card_bg(var_1034_7, var_1034_8, arg_1034_3, var_1034_9, var_1034_10, {
				radius = var_1034_11
			})
		else
			pcall(function()
				render.rect(var_1034_7, var_1034_8, color(0, 0, 0, math.floor(140 * arg_1034_3)), 4)
			end)
		end

		pcall(function()
			render.text(var_1007_29, vector(var_1034_5 + var_1007_31, var_1034_6 + (var_1034_4 - var_1034_2) * 0.5), color(255, 255, 255, math.floor(255 * arg_1034_3)), nil, var_1034_0)
		end)
		var_1007_38(vector(arg_1034_0.x, var_1034_6 + var_1034_4), vector(arg_1034_0.x, arg_1034_0.y - 1), var_1007_28(arg_1034_4, 0.55), 1)
		var_1007_39(arg_1034_0, arg_1034_4, arg_1034_3)
	end

	local function var_1007_42(arg_1037_0, arg_1037_1, arg_1037_2, arg_1037_3)
		if not arg_1037_0 or not arg_1037_1 then
			return
		end

		var_1007_38(arg_1037_0, arg_1037_1, var_1007_28(arg_1037_2, 0.5), 1.25)

		local var_1037_0 = (arg_1037_0.x + arg_1037_1.x) * 0.5
		local var_1037_1 = (arg_1037_0.y + arg_1037_1.y) * 0.5
		local var_1037_2 = arg_1037_1.x - arg_1037_0.x
		local var_1037_3 = arg_1037_1.y - arg_1037_0.y
		local var_1037_4 = math.sqrt(var_1037_2 * var_1037_2 + var_1037_3 * var_1037_3)

		if var_1037_4 > 12 then
			var_1037_2, var_1037_3 = var_1037_2 / var_1037_4, var_1037_3 / var_1037_4

			local var_1037_5 = -var_1037_3
			local var_1037_6 = var_1037_2
			local var_1037_7 = vector(var_1037_0 + var_1037_2 * 4, var_1037_1 + var_1037_3 * 4)
			local var_1037_8 = 3.5

			pcall(function()
				render.line(var_1037_7, vector(var_1037_0 - var_1037_2 * 3 + var_1037_5 * var_1037_8, var_1037_1 - var_1037_3 * 3 + var_1037_6 * var_1037_8), var_1007_28(arg_1037_2, 0.42 * arg_1037_3), 1)
				render.line(var_1037_7, vector(var_1037_0 - var_1037_2 * 3 - var_1037_5 * var_1037_8, var_1037_1 - var_1037_3 * 3 - var_1037_6 * var_1037_8), var_1007_28(arg_1037_2, 0.42 * arg_1037_3), 1)
			end)
		end
	end

	local function var_1007_43(arg_1039_0, arg_1039_1, arg_1039_2, arg_1039_3)
		if not arg_1039_0 or not arg_1039_1 then
			return
		end

		var_1007_38(arg_1039_0, arg_1039_1, var_1007_28(arg_1039_2, 0.38), 1)
		var_1007_39(arg_1039_1, arg_1039_2, arg_1039_3)
	end

	local function var_1007_44()
		for iter_1040_0, iter_1040_1 in pairs(var_1007_20) do
			if iter_1040_1 and type(iter_1040_1.override) == "function" then
				pcall(function()
					iter_1040_1:override()
				end)
			end
		end

		if refs and refs.sw and type(refs.sw.override) == "function" then
			pcall(function()
				refs.sw:override()
			end)
		end
	end

	local function var_1007_45()
		var_1007_11 = false
		var_1007_12 = nil
		var_1007_14 = false
		var_1007_15 = math.huge
		var_1007_16 = false
		var_1007_17 = 0

		var_1007_44()

		slot_0_78_0.ap_hc_active = false
	end

	local function var_1007_46(arg_1044_0)
		if arg_1044_0 and arg_1044_0.min_dmg then
			local var_1044_0 = math.floor(tonumber(var_1007_22(arg_1044_0.min_dmg, 0)) or 0)

			if var_1044_0 > 0 then
				return var_1044_0
			end
		end

		local var_1044_1 = math.floor(tonumber(var_1007_22(var_1007_20.min_damage, 20)) or 20)

		if var_1044_1 <= 21 then
			var_1044_1 = 20
		end

		return var_1044_1
	end

	local function var_1007_47(arg_1045_0, arg_1045_1)
		if arg_1045_0 > 100 then
			return arg_1045_1 + (arg_1045_0 - 100)
		end

		return arg_1045_0
	end

	local function var_1007_48(arg_1046_0)
		local var_1046_0 = {}
		local var_1046_1 = false

		if var_1007_20.body_aim and var_1007_20.body_dis then
			local var_1046_2, var_1046_3 = pcall(function()
				return var_1007_20.body_aim:get()
			end)
			local var_1046_4, var_1046_5 = pcall(function()
				return var_1007_20.body_dis:get()
			end)

			if var_1046_2 and var_1046_3 == "Force" and var_1046_4 and type(var_1046_5) == "table" and #var_1046_5 == 0 then
				var_1046_1 = true
			end
		end

		local var_1046_6

		if arg_1046_0 and arg_1046_0.hitboxes then
			local var_1046_7 = false

			for iter_1046_0, iter_1046_1 in ipairs({
				"Head",
				"Chest",
				"Stomach",
				"Legs",
				"Feet",
				"Arms"
			}) do
				local var_1046_8, var_1046_9 = pcall(function()
					return arg_1046_0.hitboxes:get(iter_1046_1)
				end)

				if var_1046_8 and var_1046_9 == true then
					var_1046_7 = true

					break
				end
			end

			if var_1046_7 then
				var_1046_6 = arg_1046_0.hitboxes
			end
		end

		local function var_1046_10(arg_1050_0)
			local var_1050_0 = var_1046_6 or var_1007_20.hitboxes

			if not var_1050_0 then
				return false
			end

			local var_1050_1, var_1050_2 = pcall(function()
				return var_1050_0:get(arg_1050_0)
			end)

			return var_1050_1 and var_1050_2 == true
		end

		if not var_1046_1 and var_1046_10("Head") then
			var_1046_0[#var_1046_0 + 1] = 0
		end

		if var_1046_10("Chest") then
			var_1046_0[#var_1046_0 + 1] = 5
		end

		if var_1046_10("Stomach") then
			var_1046_0[#var_1046_0 + 1] = 3
		end

		if not var_1007_27(arg_1046_0, "Ignore Limbs") then
			if var_1046_10("Legs") then
				var_1046_0[#var_1046_0 + 1] = 7
				var_1046_0[#var_1046_0 + 1] = 8
			end

			if var_1046_10("Feet") then
				var_1046_0[#var_1046_0 + 1] = 9
				var_1046_0[#var_1046_0 + 1] = 10
			end

			if var_1046_10("Arms") then
				var_1046_0[#var_1046_0 + 1] = 15
				var_1046_0[#var_1046_0 + 1] = 17
			end
		end

		return var_1046_0
	end

	local function var_1007_49()
		local var_1052_0 = render.camera_position()
		local var_1052_1 = render.camera_angles()
		local var_1052_2 = vector():angles(var_1052_1)
		local var_1052_3 = math.huge
		local var_1052_4

		for iter_1052_0, iter_1052_1 in ipairs(entity.get_players(true, false)) do
			if iter_1052_1:is_alive() and not iter_1052_1.m_bGunGameImmunity then
				local var_1052_5 = iter_1052_1:get_origin()

				var_1052_5.z = var_1052_5.z + iter_1052_1.m_vecMaxs.z * 0.5

				local var_1052_6 = var_1052_5:dist_to_ray(var_1052_0, var_1052_2)

				if var_1052_6 < var_1052_3 then
					var_1052_3 = var_1052_6
					var_1052_4 = iter_1052_1
				end
			end
		end

		return var_1052_4
	end

	local function var_1007_50()
		return var_1007_49()
	end

	local function var_1007_51()
		local var_1054_0 = math.huge
		local var_1054_1

		for iter_1054_0 = 1, #var_1007_10 do
			local var_1054_2 = var_1007_10[iter_1054_0]

			if var_1054_2 and var_1054_2.dmg ~= -1 and var_1054_0 > var_1054_2.dist then
				var_1054_0 = var_1054_2.dist
				var_1054_1 = var_1054_2
			end
		end

		return var_1054_1
	end

	local function var_1007_52(arg_1055_0)
		local var_1055_0 = arg_1055_0 and arg_1055_0:get_player_weapon() or nil

		if not var_1055_0 then
			return false
		end

		local var_1055_1, var_1055_2 = pcall(function()
			if var_1055_0.m_bInReload == true then
				return true
			end

			local var_1056_0 = tonumber(var_1055_0.m_iClip1) or 0
			local var_1056_1 = tonumber(var_1055_0.m_flNextPrimaryAttack) or 0
			local var_1056_2 = globals.curtime or 0

			return var_1056_0 <= 0 and var_1056_1 > var_1056_2 + 0.05
		end)

		return var_1055_1 and var_1055_2 == true
	end

	local function var_1007_53(arg_1057_0)
		if not arg_1057_0 then
			return false
		end

		local var_1057_0, var_1057_1 = pcall(function()
			return arg_1057_0:is_alive()
		end)

		if not var_1057_0 or not var_1057_1 then
			return false
		end

		local var_1057_2, var_1057_3 = pcall(function()
			return arg_1057_0.m_bGunGameImmunity == true
		end)

		return not var_1057_2 or not var_1057_3
	end

	local function var_1007_54(arg_1060_0)
		local var_1060_0, var_1060_1 = pcall(function()
			if rage and rage.lagcomp and type(rage.lagcomp.get_snapshot) == "function" then
				return rage.lagcomp.get_snapshot(arg_1060_0)
			end

			return nil
		end)

		if not var_1060_0 or not var_1060_1 or not var_1060_1.command or not var_1060_1.command.no_entry then
			return false
		end

		local var_1060_2 = var_1060_1.command.no_entry

		if type(var_1060_2) == "table" and (tonumber(var_1060_2.y) or 0) > 0 then
			return true
		end

		return false
	end

	local function var_1007_55(arg_1062_0, arg_1062_1)
		local var_1062_0 = (tonumber(var_1007_22(arg_1062_0.simulation, 30)) or 30) * 0.01

		if arg_1062_1 == 9 then
			var_1062_0 = var_1062_0 * 2
		end

		return var_1062_0
	end

	local function var_1007_56(arg_1063_0)
		return math.max(0, (tonumber(var_1007_22(arg_1063_0.delay, 9)) or 9) * 0.01)
	end

	local function var_1007_57(arg_1064_0, arg_1064_1, arg_1064_2, arg_1064_3, arg_1064_4, arg_1064_5)
		local var_1064_0 = var_1007_46(arg_1064_5)
		local var_1064_1 = tonumber(arg_1064_2.m_iHealth) or 100
		local var_1064_2 = var_1007_47(var_1064_0, var_1064_1)
		local var_1064_3 = var_1007_48(arg_1064_5)

		if #var_1064_3 == 0 then
			return false
		end

		local var_1064_4 = {}

		for iter_1064_0 = 1, #var_1064_3 do
			var_1064_4[iter_1064_0] = arg_1064_2:get_hitbox_position(var_1064_3[iter_1064_0])
		end

		local var_1064_5 = math.max(1, math.floor(var_1007_55(arg_1064_5, arg_1064_4) / globals.tickinterval))
		local var_1064_6 = arg_1064_1:get_eye_position():to(arg_1064_2:get_origin()):angles().y
		local var_1064_7 = arg_1064_0.view_angles.y
		local var_1064_8 = arg_1064_0.forwardmove
		local var_1064_9 = arg_1064_0.sidemove
		local var_1064_10 = arg_1064_0.buttons

		arg_1064_0.forwardmove = var_1007_4
		arg_1064_0.sidemove = 0
		arg_1064_0.buttons = 0

		var_1007_9(var_1007_10)

		local var_1064_11 = false
		local var_1064_12 = 360 / var_1007_3

		for iter_1064_1 = -180, 179, var_1064_12 do
			arg_1064_0.view_angles.y = var_1007_24(var_1064_6 + iter_1064_1 + 90)

			local var_1064_13 = arg_1064_1:simulate_movement()
			local var_1064_14 = var_1064_13.origin:clone()
			local var_1064_15 = 0

			for iter_1064_2 = 1, var_1064_5 do
				local var_1064_16 = var_1064_13.velocity:length2d()

				var_1064_13:think()

				local var_1064_17 = var_1064_13.velocity:length2d()

				if bit.band(var_1064_13.flags, var_1007_0) == 1 and var_1064_16 <= var_1064_17 then
					local var_1064_18 = var_1064_13.origin:dist2d(var_1064_14)

					if var_1064_18 >= var_1007_1 then
						if var_1064_15 % var_1007_2 == 0 then
							local var_1064_19 = var_1064_13.origin:clone()
							local var_1064_20 = var_1064_19:clone()

							var_1064_20.z = var_1064_20.z + var_1064_13.view_offset

							local var_1064_21 = -1
							local var_1064_22
							local var_1064_23

							for iter_1064_3 = 1, #var_1064_4 do
								local var_1064_24, var_1064_25 = utils.trace_bullet(arg_1064_1, var_1064_20, var_1064_4[iter_1064_3])

								var_1064_23 = var_1064_25 and var_1064_25.end_pos or var_1064_23

								if (var_1064_2 <= var_1064_24 or var_1064_1 <= var_1064_24) and var_1064_25 and var_1064_25.entity == arg_1064_2 then
									var_1064_11 = true
									var_1064_21 = var_1064_24
									var_1064_22 = var_1064_3[iter_1064_3]

									break
								end
							end

							var_1007_10[#var_1007_10 + 1] = {
								player = arg_1064_2,
								player_origin = arg_1064_2:get_origin(),
								hitbox_id = var_1064_22 or -1,
								start_pos = var_1064_14,
								pos = var_1064_19,
								eye_pos = var_1064_20,
								dmg = var_1064_21,
								dist = var_1064_18,
								ticks_to_move = iter_1064_2,
								yaw = arg_1064_0.view_angles.y,
								tr_end_pos = var_1064_23
							}

							if var_1064_21 ~= -1 and var_1064_2 <= var_1064_21 then
								break
							end
						end

						var_1064_15 = var_1064_15 + 1
					end
				else
					break
				end
			end
		end

		arg_1064_0.view_angles.y = var_1064_7
		arg_1064_0.forwardmove = var_1064_8
		arg_1064_0.sidemove = var_1064_9
		arg_1064_0.buttons = var_1064_10

		return var_1064_11
	end

	local function var_1007_58(arg_1065_0)
		local var_1065_0 = math.floor(tonumber(var_1007_22(arg_1065_0.peek_chance, 45)) or 45)

		if var_1007_20.retreat then
			pcall(function()
				var_1007_20.retreat:override("On Shot")
			end)
		end

		if var_1007_20.hit_chance then
			pcall(function()
				var_1007_20.hit_chance:override(var_1065_0)
			end)

			slot_0_78_0.ap_hc_active = true
		end

		if var_1007_27(arg_1065_0, "Low Safety") then
			if var_1007_20.head_scale then
				pcall(function()
					var_1007_20.head_scale:override(100)
				end)
			end

			if var_1007_20.body_scale then
				pcall(function()
					var_1007_20.body_scale:override(100)
				end)
			end

			if var_1007_20.hitbox_safe then
				pcall(function()
					var_1007_20.hitbox_safe:override({})
				end)
			end

			if var_1007_20.body_aim_safe then
				pcall(function()
					var_1007_20.body_aim_safe:override("Default")
				end)
			end

			if var_1007_20.safe_pts then
				pcall(function()
					var_1007_20.safe_pts:override("Default")
				end)
			end

			if var_1007_20.force_peek then
				pcall(function()
					var_1007_20.force_peek:override(false)
				end)
			end
		end

		if var_1007_20.slow_walk then
			pcall(function()
				var_1007_20.slow_walk:override(false)
			end)
		end
	end

	local function var_1007_59(arg_1075_0)
		slot_1075_1_0 = var_1007_21()

		if not slot_1075_1_0 or var_1007_22(slot_1075_1_0, false) ~= true then
			if var_1007_11 or var_1007_12 or var_1007_14 then
				var_1007_45()
			end

			var_1007_18 = false

			return
		end

		if var_1007_18 then
			var_1007_18 = false

			var_1007_45()

			return
		end

		slot_1075_2_0 = entity.get_local_player()
		slot_1075_3_0 = slot_1075_2_0 and slot_1075_2_0:get_player_weapon() or nil
		slot_1075_4_0 = slot_1075_3_0 and slot_1075_3_0:get_weapon_index() or nil
		slot_1075_5_0 = slot_1075_4_0 and var_1007_25(slot_1075_4_0) or nil

		function slot_1075_6_0()
			if var_1007_11 or var_1007_12 or var_1007_14 then
				var_1007_45()
			end
		end

		if not var_1007_23(var_1007_20.dt) or not var_1007_23(var_1007_20.peek) then
			slot_1075_6_0()

			return
		end

		if not slot_1075_2_0 or not slot_1075_3_0 or not slot_1075_2_0:is_alive() then
			slot_1075_6_0()

			return
		end

		if not var_1007_26(slot_1075_1_0, slot_1075_5_0) then
			slot_1075_6_0()

			return
		end

		if (slot_1075_5_0 == "SSG 08" or slot_1075_5_0 == "AWP") and slot_1075_2_0.m_bIsScoped ~= true then
			slot_1075_6_0()

			return
		end

		if var_1007_52(slot_1075_2_0) then
			slot_1075_6_0()

			return
		end

		slot_1075_7_0 = var_1007_23(var_1007_20.dt) and rage and rage.exploit and (tonumber(rage.exploit:get()) or 1) < 1

		pcall(function()
			if var_1007_20.slow_walk then
				var_1007_20.slow_walk:override()
			end

			if var_1007_20.hit_chance then
				var_1007_20.hit_chance:override()
			end

			if var_1007_20.head_scale then
				var_1007_20.head_scale:override()
			end

			if var_1007_20.body_scale then
				var_1007_20.body_scale:override()
			end

			if var_1007_20.hitbox_safe then
				var_1007_20.hitbox_safe:override()
			end

			if var_1007_20.body_aim_safe then
				var_1007_20.body_aim_safe:override()
			end

			if var_1007_20.safe_pts then
				var_1007_20.safe_pts:override()
			end

			if var_1007_20.force_peek then
				var_1007_20.force_peek:override()
			end

			if var_1007_20.retreat then
				var_1007_20.retreat:override()
			end
		end)

		slot_0_78_0.ap_hc_active = false

		if var_1007_56(slot_1075_1_0) <= globals.realtime - var_1007_13 and not var_1007_11 and not entity.get_threat(true) and not slot_1075_7_0 then
			slot_1075_9_2 = true
			slot_1075_10_2 = math.floor(tonumber(var_1007_22(slot_1075_1_0.max_enemies, 5)) or 5)

			if slot_1075_10_2 < 5 then
				slot_1075_11_3 = 0

				for iter_1075_0, iter_1075_1 in ipairs(entity.get_players(true, false)) do
					if iter_1075_1:is_alive() and not iter_1075_1.m_bGunGameImmunity then
						slot_1075_11_3 = slot_1075_11_3 + 1
					end
				end

				slot_1075_9_2 = slot_1075_11_3 <= slot_1075_10_2
			end

			if slot_1075_9_2 then
				slot_1075_11_2 = var_1007_50()

				if var_1007_53(slot_1075_11_2) and not var_1007_54(slot_1075_11_2) then
					slot_1075_12_2 = false
					slot_1075_13_2 = math.floor(tonumber(var_1007_22(slot_1075_1_0.max_distance, 0)) or 0)

					if slot_1075_13_2 > 0 then
						slot_1075_14_3, slot_1075_15_2 = pcall(function()
							return slot_1075_2_0:get_origin():dist(slot_1075_11_2:get_origin())
						end)

						if slot_1075_14_3 and slot_1075_15_2 and slot_1075_13_2 < slot_1075_15_2 then
							slot_1075_12_2 = true
						end
					end

					if not slot_1075_12_2 and slot_1075_2_0.m_vecVelocity:length2d() < var_1007_8 then
						var_1007_12 = nil
						slot_1075_14_2 = var_1007_57(arg_1075_0, slot_1075_2_0, slot_1075_11_2, slot_1075_3_0, slot_1075_4_0, slot_1075_1_0)
						var_1007_13 = globals.realtime

						if slot_1075_14_2 then
							slot_1075_15_1 = var_1007_51()

							if slot_1075_15_1 and math.max(tonumber(slot_1075_3_0.m_flNextPrimaryAttack) or 0, tonumber(slot_1075_2_0.m_flNextAttack) or 0) - slot_1075_15_1.ticks_to_move * globals.tickinterval <= globals.curtime then
								var_1007_11 = true
								var_1007_12 = slot_1075_15_1
							end
						end
					end
				end
			end
		end

		slot_1075_9_1 = math.max(tonumber(slot_1075_3_0.m_flNextPrimaryAttack) or 0, tonumber(slot_1075_2_0.m_flNextAttack) or 0)

		if var_1007_11 and var_1007_12 then
			if not var_1007_53(var_1007_12.player) then
				var_1007_14 = true
			end

			slot_1075_10_1 = slot_1075_2_0:simulate_movement()

			slot_1075_10_1:think()

			if var_1007_12.player:get_origin():dist(var_1007_12.player_origin) > var_1007_7 then
				var_1007_14 = true
			end

			slot_1075_11_1 = slot_1075_10_1.origin:clone()
			slot_1075_11_1.z = slot_1075_11_1.z + slot_1075_10_1.view_offset
			slot_1075_12_1 = slot_1075_11_1:dist(var_1007_12.eye_pos)
			arg_1075_0.move_yaw = var_1007_12.yaw
			arg_1075_0.forwardmove = var_1007_4
			arg_1075_0.sidemove = 0
			arg_1075_0.buttons = 0
			arg_1075_0.jitter_move = false

			var_1007_58(slot_1075_1_0)

			slot_1075_13_1 = var_1007_12.start_pos:dist(var_1007_12.pos)
			slot_1075_14_1 = slot_1075_13_1 > 0 and slot_1075_12_1 / slot_1075_13_1 or 1
			slot_1075_9_1 = slot_1075_9_1 - globals.tickinterval
			slot_1075_15_0 = var_1007_51()
			slot_1075_16_0 = false

			pcall(function()
				if slot_1075_15_0 and slot_1075_15_0.player then
					slot_1075_16_0 = slot_1075_15_0.player:is_dormant() == true
				elseif var_1007_12.player then
					slot_1075_16_0 = var_1007_12.player:is_dormant() == true
				end
			end)

			if slot_1075_14_1 < var_1007_5 or slot_1075_9_1 >= globals.curtime or slot_1075_7_0 or slot_1075_16_0 then
				var_1007_14 = true
			end
		else
			var_1007_14 = false
		end

		if var_1007_14 and var_1007_12 then
			slot_1075_10_0 = slot_1075_2_0:simulate_movement()

			slot_1075_10_0:think()

			slot_1075_11_0 = slot_1075_10_0.origin:dist(var_1007_12.start_pos)
			arg_1075_0.move_yaw = slot_1075_10_0.origin:to(var_1007_12.start_pos):angles().y
			arg_1075_0.forwardmove = var_1007_4
			arg_1075_0.sidemove = 0
			arg_1075_0.buttons = 0
			arg_1075_0.jitter_move = false

			var_1007_58(slot_1075_1_0)

			slot_1075_12_0 = var_1007_12.start_pos:dist(var_1007_12.pos)
			slot_1075_13_0 = slot_1075_12_0 > 0 and slot_1075_11_0 / slot_1075_12_0 or 0
			slot_1075_14_0 = false

			if slot_1075_7_0 and slot_1075_13_0 > 1 then
				slot_1075_14_0 = true
			elseif slot_1075_13_0 < var_1007_6 then
				slot_1075_14_0 = true
			end

			if slot_1075_14_0 then
				var_1007_45()
			else
				slot_1075_9_0 = slot_1075_9_1 - globals.tickinterval

				if slot_1075_7_0 and slot_1075_9_0 >= globals.curtime then
					var_1007_11 = false
				end

				if slot_1075_7_0 and (slot_1075_5_0 == "SSG 08" or slot_1075_5_0 == "AWP") and slot_1075_2_0.m_bIsScoped ~= true then
					var_1007_11 = false
				end

				if slot_1075_11_0 < var_1007_15 then
					if not var_1007_16 then
						var_1007_17 = globals.tickcount + 4
					end

					var_1007_16 = true
				else
					var_1007_16 = false
				end

				var_1007_15 = slot_1075_11_0
			end
		else
			var_1007_15 = -math.huge
			var_1007_16 = false
		end

		if var_1007_23(var_1007_20.dt) and globals.tickcount == var_1007_17 then
			pcall(function()
				rage.exploit:force_teleport()
			end)
		end
	end

	local function var_1007_60()
		local var_1081_0 = var_1007_21()

		if not var_1081_0 or var_1007_22(var_1081_0, false) ~= true or not var_1007_11 or not var_1007_12 then
			return
		end

		if not var_1007_23(var_1007_20.dt) or not var_1007_23(var_1007_20.peek) then
			return
		end

		local var_1081_1 = entity.get_local_player()

		if not var_1081_1 or not var_1081_1:is_alive() then
			return
		end

		local var_1081_2 = var_1007_12
		local var_1081_3 = 0.92
		local var_1081_4 = var_1007_35(var_1081_0, var_1081_3)
		local var_1081_5 = var_1007_36(var_1081_2.start_pos)
		local var_1081_6 = var_1007_36(var_1081_2.pos)
		local var_1081_7 = var_1007_36(var_1081_2.eye_pos)
		local var_1081_8 = var_1081_2.tr_end_pos and var_1007_36(var_1081_2.tr_end_pos) or nil

		if not var_1081_5 or not var_1081_6 then
			return
		end

		var_1007_42(var_1081_5, var_1081_6, var_1081_4, var_1081_3)

		local var_1081_9 = var_1007_14 and "return" or nil

		var_1007_41(var_1081_5, "HOME", var_1081_9, var_1081_3, var_1081_4)

		local var_1081_10 = ""

		if var_1081_2.dmg and tonumber(var_1081_2.dmg) and tonumber(var_1081_2.dmg) > 0 then
			var_1081_10 = tostring(math.floor(tonumber(var_1081_2.dmg) + 0.5)) .. " hp"
		end

		var_1007_41(var_1081_6, "PEEK", var_1081_10 ~= "" and var_1081_10 or nil, var_1081_3, var_1081_4)

		if var_1081_7 and var_1081_8 then
			var_1007_43(var_1081_7, var_1081_8, var_1081_4, var_1081_3 * 0.85)
		end

		if var_1081_2.hitbox_id and var_1081_2.hitbox_id >= 0 and var_1081_2.player then
			pcall(function()
				render.highlight_hitbox(var_1081_2.player, var_1081_2.hitbox_id, var_1007_28(var_1081_4, 0.38))
			end)
		end
	end

	local var_1007_61

	local function var_1007_62(arg_1083_0)
		if not var_1007_61 then
			return
		end

		pcall(function()
			if arg_1083_0 then
				if type(events.createmove.set) == "function" then
					events.createmove:set(var_1007_61)
				elseif type(events.createmove) == "function" then
					events.createmove(var_1007_61, true)
				end

				return
			end

			if type(events.createmove.unset) == "function" then
				events.createmove:unset(var_1007_61)
			elseif type(events.createmove) == "function" then
				events.createmove(var_1007_61, false)
			end
		end)
	end

	function var_1007_61(arg_1085_0)
		pcall(var_1007_59, arg_1085_0)
	end

	local function var_1007_63()
		var_1007_18 = true

		var_1007_45()
		var_1007_62(false)
	end

	local function var_1007_64()
		local var_1087_0 = var_1007_21()

		if not var_1087_0 or var_1007_22(var_1087_0, false) ~= true or not var_1007_11 or not var_1007_12 then
			return false
		end

		if not var_1007_23(var_1007_20.dt) or not var_1007_23(var_1007_20.peek) then
			return false
		end

		local var_1087_1 = entity.get_local_player()

		if not var_1087_1 or not var_1087_1:is_alive() then
			return false
		end

		return true
	end

	slot_0_78_0.adaptive_peek_render = var_1007_60
	slot_0_78_0.adaptive_peek_wants_render = var_1007_64
	slot_0_78_0.adaptive_peek_shutdown = var_1007_63

	function slot_0_78_0.ai_peek_bind_on()
		local var_1088_0 = var_1007_21()

		return var_1088_0 and var_1007_22(var_1088_0, false) == true
	end

	pcall(function()
		local var_1089_0 = var_1007_21()

		if var_1089_0 and type(var_1089_0.set_callback) == "function" then
			var_1089_0:set_callback(function(arg_1090_0)
				var_1007_62(arg_1090_0:get() == true)

				if arg_1090_0:get() ~= true then
					var_1007_18 = true

					var_1007_45()
				end
			end, true)
		end
	end)
end)()
;(function()
	local var_1091_0
	local var_1091_1 = 0.0095
	local var_1091_2

	local function var_1091_3()
		return slot_0_152_0.vars and slot_0_152_0.vars.dormant_aim
	end

	local function var_1091_4()
		local var_1093_0 = var_1091_3()

		if not var_1093_0 or type(var_1093_0.get) ~= "function" then
			return false
		end

		local var_1093_1, var_1093_2 = pcall(function()
			return var_1093_0:get() == true
		end)

		return var_1093_1 and var_1093_2 == true
	end

	local function var_1091_5()
		local var_1095_0 = var_1091_3()

		if not var_1095_0 or not var_1095_0.memory or type(var_1095_0.memory.get) ~= "function" then
			return 0.65
		end

		local var_1095_1, var_1095_2 = pcall(function()
			return var_1095_0.memory:get()
		end)

		return (tonumber(var_1095_2) or 65) * 0.01
	end

	local function var_1091_6(arg_1097_0)
		if not refs.dormant or type(refs.dormant.override) ~= "function" then
			return
		end

		pcall(function()
			if arg_1097_0 then
				refs.dormant:override(true)
			else
				refs.dormant:override()
			end
		end)
	end

	local function var_1091_7(arg_1099_0)
		local var_1099_0 = tonumber(arg_1099_0.m_fFlags) or 0

		return bit.band(var_1099_0, 1) ~= 0
	end

	local function var_1091_8(arg_1100_0, arg_1100_1, arg_1100_2)
		local var_1100_0 = globals.curtime

		pcall(function()
			local var_1101_0 = arg_1100_0:get_simulation_time()

			if type(var_1101_0) == "table" and var_1101_0.current then
				var_1100_0 = var_1101_0.current
			end
		end)

		if arg_1100_2 == 64 then
			return var_1100_0 > (tonumber(arg_1100_1.m_flNextPrimaryAttack) or 0)
		end

		local var_1100_1 = tonumber(arg_1100_0.m_flNextAttack) or 0
		local var_1100_2 = tonumber(arg_1100_1.m_flNextPrimaryAttack) or 0
		local var_1100_3 = tonumber(arg_1100_1.m_flNextSecondaryAttack) or 0

		return var_1100_1 < var_1100_0 and var_1100_2 < var_1100_0 and var_1100_3 < var_1100_0
	end

	local function var_1091_9(arg_1102_0)
		if not arg_1102_0 then
			return false
		end

		local var_1102_0 = 1
		local var_1102_1 = 1

		pcall(function()
			var_1102_0 = arg_1102_0:get_spread()
			var_1102_1 = arg_1102_0:get_inaccuracy()
		end)

		return (tonumber(var_1102_0) or 1) + (tonumber(var_1102_1) or 1) < var_1091_1
	end

	local function var_1091_10()
		local var_1104_0 = 0

		pcall(function()
			var_1104_0 = tonumber(refs.min_damage:get()) or 0
		end)

		var_1104_0 = math.floor(var_1104_0)

		if var_1104_0 > 100 then
			return true, var_1104_0 - 100
		end

		return false, var_1104_0
	end

	local function var_1091_11(arg_1106_0, arg_1106_1, arg_1106_2)
		arg_1106_2 = tonumber(arg_1106_2) or 100

		if arg_1106_0 then
			return arg_1106_1 + arg_1106_2
		end

		return math.min(arg_1106_1, arg_1106_2)
	end

	local function var_1091_12(arg_1107_0)
		if not arg_1107_0 or not arg_1107_0.entity then
			return false
		end

		local var_1107_0, var_1107_1 = pcall(function()
			return arg_1107_0.entity:get_name()
		end)

		return var_1107_0 and var_1107_1 == "CWorld"
	end

	local function var_1091_13(arg_1109_0)
		if not arg_1109_0 then
			return 4
		end

		return tonumber(arg_1109_0.headshot_multiplier) or tonumber(arg_1109_0.m_iHeadshotMultiplier) or 4
	end

	local function var_1091_14(arg_1110_0, arg_1110_1)
		for iter_1110_0 = 1, #arg_1110_0 do
			local var_1110_0 = arg_1110_0[iter_1110_0]

			if var_1110_0 and var_1110_0:is_enemy() and var_1110_0:is_alive() and var_1110_0:is_dormant() then
				local var_1110_1 = var_1110_0:get_network_state()

				if var_1110_1 ~= 0 and var_1110_1 < 4 then
					local var_1110_2 = var_1110_0:get_bbox()

					if var_1110_2 and var_1110_2.alpha < 0.8 and arg_1110_1 < var_1110_2.alpha then
						return true
					end
				end
			end
		end

		return false
	end

	local function var_1091_15(arg_1111_0, arg_1111_1, arg_1111_2, arg_1111_3)
		local var_1111_0, var_1111_1 = var_1091_10()
		local var_1111_2 = var_1091_5()
		local var_1111_3

		for iter_1111_0 = 1, #arg_1111_3 do
			local var_1111_4 = arg_1111_3[iter_1111_0]

			if var_1111_4 and var_1111_4:is_enemy() and var_1111_4:is_alive() and var_1111_4:is_dormant() then
				local var_1111_5 = var_1111_4:get_network_state()

				if var_1111_5 ~= 0 and var_1111_5 < 4 then
					local var_1111_6 = var_1111_4:get_bbox()

					if var_1111_6 and var_1111_6.alpha < 0.8 and var_1111_2 < var_1111_6.alpha then
						local var_1111_7 = var_1091_11(var_1111_0, var_1111_1, var_1111_4.m_iHealth)
						local var_1111_8 = var_1111_5 == 1 or var_1111_6.alpha >= 0.75
						local var_1111_9 = var_1111_8 and var_1111_7 > 80
						local var_1111_10 = var_1111_4:get_origin()
						local var_1111_11 = var_1111_8 and var_1111_4:get_hitbox_position(var_1111_9 and 1 or 4) or var_1111_10 + vector(0, 0, 40)
						local var_1111_12, var_1111_13 = utils.trace_bullet(arg_1111_0, arg_1111_1, var_1111_11)
						local var_1111_14

						var_1111_14 = tonumber(var_1111_12) or 0

						if var_1111_9 then
							var_1111_14 = var_1111_14 * var_1091_13(arg_1111_2)
						end

						if var_1091_12(var_1111_13) and var_1111_7 < var_1111_14 and (not var_1111_3 or var_1111_14 >= var_1111_3.dmg) then
							var_1111_3 = {
								ent = var_1111_4,
								pos = var_1111_11,
								dmg = var_1111_14,
								net = var_1111_5,
								alpha = var_1111_6.alpha
							}
						end
					end
				end
			end
		end

		return var_1111_3
	end

	local function var_1091_16()
		var_1091_0 = nil
	end

	local function var_1091_17(arg_1113_0)
		local var_1113_0 = entity.get_game_rules()

		if var_1113_0 and var_1113_0.m_bFreezePeriod then
			return
		end

		local var_1113_1 = entity.get_local_player()

		if not var_1113_1 or not var_1113_1:is_alive() then
			var_1091_16()

			return
		end

		local var_1113_2 = var_1113_1:get_player_weapon()

		if not var_1113_2 then
			return
		end

		local var_1113_3 = var_1113_2:get_weapon_info()

		if not var_1113_3 then
			return
		end

		local var_1113_4 = tonumber(var_1113_3.weapon_type) or 0

		if var_1113_4 == 0 or var_1113_4 == 9 then
			return
		end

		if not var_1091_8(var_1113_1, var_1113_2, var_1113_2:get_weapon_index()) then
			return
		end

		local var_1113_5 = var_1113_1:get_eye_position()

		if not var_1113_5 then
			return
		end

		local var_1113_6 = entity.get_players(true, false)

		if type(var_1113_6) ~= "table" or #var_1113_6 == 0 then
			return
		end

		local var_1113_7 = var_1091_5()

		if not var_1091_14(var_1113_6, var_1113_7) then
			return
		end

		local var_1113_8 = var_1091_15(var_1113_1, var_1113_5, var_1113_3, var_1113_6)

		if not var_1113_8 then
			return
		end

		arg_1113_0.block_movement = 1
		arg_1113_0.view_angles = var_1113_5:to(var_1113_8.pos):angles()

		if var_1113_4 == 5 and var_1113_1.m_bIsScoped ~= true and var_1091_7(var_1113_1) then
			arg_1113_0.in_attack2 = true
		end

		if var_1091_9(var_1113_2) then
			arg_1113_0.in_attack = true
			var_1091_0 = var_1113_8

			local var_1113_9 = var_1113_8.ent

			utils.execute_after(1, function()
				if var_1091_0 and var_1091_0.ent == var_1113_9 then
					var_1091_16()
				end
			end)
		end
	end

	local function var_1091_18(arg_1115_0)
		if not var_1091_2 then
			return
		end

		pcall(function()
			if arg_1115_0 then
				if type(events.createmove.set) == "function" then
					events.createmove:set(var_1091_2)
				elseif type(events.createmove) == "function" then
					events.createmove(var_1091_2, true)
				end

				return
			end

			if type(events.createmove.unset) == "function" then
				events.createmove:unset(var_1091_2)
			elseif type(events.createmove) == "function" then
				events.createmove(var_1091_2, false)
			end
		end)
	end

	function var_1091_2(arg_1117_0)
		pcall(var_1091_17, arg_1117_0)
	end

	local function var_1091_19(arg_1118_0)
		if not var_1091_4() or not var_1091_0 then
			return
		end

		local var_1118_0 = entity.get_local_player()
		local var_1118_1 = entity.get(arg_1118_0.attacker, true)
		local var_1118_2 = entity.get(arg_1118_0.userid, true)

		if var_1118_0 and var_1118_1 == var_1118_0 and var_1118_2 == var_1091_0.ent then
			var_1091_16()
		end
	end

	local function var_1091_20(arg_1119_0)
		if not var_1091_4() or not var_1091_0 or not arg_1119_0 then
			return
		end

		local var_1119_0 = entity.get(arg_1119_0.target)

		if var_1119_0 and var_1119_0 == var_1091_0.ent and arg_1119_0.state ~= nil then
			var_1091_16()
		end
	end

	local function var_1091_21()
		var_1091_16()
		var_1091_6(false)
		var_1091_18(false)
	end

	slot_0_78_0.dormant_aim_on_hurt = var_1091_19
	slot_0_78_0.dormant_aim_on_ack = var_1091_20
	slot_0_78_0.dormant_aim_shutdown = var_1091_21

	pcall(function()
		local var_1121_0 = var_1091_3()

		if var_1121_0 and type(var_1121_0.set_callback) == "function" then
			var_1121_0:set_callback(function(arg_1122_0)
				local var_1122_0 = arg_1122_0:get() == true

				var_1091_6(var_1122_0)
				var_1091_18(var_1122_0)

				if not var_1122_0 then
					var_1091_16()
				end
			end, true)
		end
	end)
end)()
;(function()
	local var_1123_0 = cvar.cl_interpolate
	local var_1123_1 = cvar.cl_interp_ratio
	local var_1123_2 = cvar.cl_interp
	local var_1123_3 = {
		r = 2,
		i = 1,
		d = 0.015625
	}
	local var_1123_4 = {
		Light = {
			r = 3,
			i = 1,
			d = 0.031
		},
		Normal = {
			r = 2,
			i = 1,
			d = 0.026
		},
		Heavy = {
			r = 1,
			i = 1,
			d = 0.015625
		},
		Full = {
			r = 1,
			i = 0,
			d = 0.015625
		}
	}

	local function var_1123_5(arg_1124_0)
		if not arg_1124_0 then
			return
		end

		pcall(function()
			var_1123_0:int(arg_1124_0.i)
			var_1123_1:int(arg_1124_0.r)
			var_1123_2:float(arg_1124_0.d)
		end)
	end

	local function var_1123_6(arg_1126_0)
		if not arg_1126_0 or not arg_1126_0.tier then
			return var_1123_4.Normal
		end

		local var_1126_0, var_1126_1 = pcall(function()
			return arg_1126_0.tier:get()
		end)

		if not var_1126_0 or var_1126_1 == nil then
			return var_1123_4.Normal
		end

		if type(var_1126_1) == "number" then
			local var_1126_2 = {
				"Light",
				"Normal",
				"Heavy",
				"Full"
			}

			return var_1123_4[var_1126_2[math.floor(var_1126_1) % 4 + 1]] or var_1123_4.Normal
		end

		return var_1123_4[tostring(var_1126_1)] or var_1123_4.Normal
	end

	function slot_0_78_0.net_interp_restore()
		var_1123_5(var_1123_3)
	end

	function slot_0_78_0.net_interp_tick()
		local var_1129_0 = slot_0_152_0.vars.tick_lead

		if not var_1129_0 or var_1129_0:get() ~= true then
			return
		end

		var_1123_5(var_1123_6(var_1129_0))
	end

	pcall(function()
		local var_1130_0 = slot_0_152_0.vars.tick_lead

		if not var_1130_0 or type(var_1130_0.set_callback) ~= "function" then
			return
		end

		local function var_1130_1()
			if var_1130_0:get() == true then
				slot_0_78_0.net_interp_tick()
			else
				slot_0_78_0.net_interp_restore()
			end
		end

		var_1130_0:set_callback(var_1130_1, true)

		if var_1130_0.tier and type(var_1130_0.tier.set_callback) == "function" then
			var_1130_0.tier:set_callback(function()
				if var_1130_0:get() == true then
					slot_0_78_0.net_interp_tick()
				end
			end)
		end
	end)
end)()
events.createmove:set(function(arg_1133_0)
	local var_1133_0, var_1133_1 = pcall(function()
		slot_0_89_0.overlay_suppress_attack(arg_1133_0)

		slot_0_78_0.in_score = arg_1133_0 and arg_1133_0.in_score == true

		slot_0_78_0.ping_apply()

		if slot_0_78_0.hc_manip_tick then
			slot_0_78_0.hc_manip_tick()
		end

		if slot_0_78_0.astop_tick then
			slot_0_78_0.astop_tick(arg_1133_0)
		end

		if slot_0_78_0.auto_teleport_tick then
			slot_0_78_0.auto_teleport_tick(arg_1133_0)
		end

		if slot_0_78_0.auto_hide_shots_tick then
			slot_0_78_0.auto_hide_shots_tick(arg_1133_0)
		end

		if slot_0_78_0.warmup_setup_tick then
			slot_0_78_0.warmup_setup_tick()
		end

		if slot_0_78_0.net_interp_tick then
			slot_0_78_0.net_interp_tick()
		end

		slot_0_78_0.scope_overlay_sync()

		if slot_0_78_0.scope_force_vm_sync then
			slot_0_78_0.scope_force_vm_sync()
		end

		slot_0_78_0.move_apply(arg_1133_0)

		slot_1134_0_0 = entity.get_local_player()

		if not slot_1134_0_0 then
			return
		end

		if not slot_0_152_0.antiaim.enabled:get() then
			return
		end

		if slot_1134_0_0.m_iHealth <= 0 then
			return
		end

		if slot_0_152_0.antiaim.avoid_backstab:get() then
			refs.avoid_backstab:override(true)
		else
			refs.avoid_backstab:override()
		end

		slot_0_78_0.aa.freestand_apply()

		if globals.choked_commands == 0 then
			slot_0_78_0.jitter = not slot_0_78_0.jitter
			slot_0_78_0.aa_sway.inverted = slot_1134_0_0.m_flPoseParameter and slot_1134_0_0.m_flPoseParameter[11] and slot_1134_0_0.m_flPoseParameter[11] * 120 - 60 > 0 or false
			slot_0_78_0.aa_mod_sent = (slot_0_78_0.aa_mod_sent or 0) >= 65535 and 0 or (slot_0_78_0.aa_mod_sent or 0) + 1
		end

		slot_0_78_0.def.exploit_update(slot_1134_0_0)

		slot_1134_1_0 = slot_1134_0_0:get_player_weapon()
		slot_1134_2_0 = slot_1134_1_0 and slot_1134_1_0:get_weapon_index() or nil

		if slot_1134_2_0 == 64 then
			refs.dtlim:override(2)
		else
			refs.dtlim:override()
		end

		if slot_0_78_0.aa.fix_bomb_site_e(arg_1133_0) and common.is_button_down(69) and slot_1134_0_0.m_iTeamNum == 2 then
			refs.pitch:override("Disabled")
			refs.yaw_mod_degree:override(0)
			refs.yaw_mod:override("Disabled")
			refs.offset:override(180)
			refs.left_limit:override(0)
			refs.right_limit:override(0)
			refs.fake_options:override("")
			refs.body_freestanding:override()
			refs.desync_freestand:override()

			slot_0_78_0.jit_yaw = 0
			slot_0_78_0.yaw_add = 0

			return
		elseif slot_0_78_0.aa.legit_aa_process(arg_1133_0, slot_1134_0_0) then
			return
		elseif slot_0_78_0.aa.manual_static_apply(slot_1134_0_0) then
			return
		elseif slot_0_78_0.aa.safe_head(slot_1134_2_0) then
			slot_1134_3_1 = 8

			pcall(function()
				slot_1134_3_1 = slot_0_152_0.antiaim.safe_head.desync_limit:get() or 8
			end)
			refs.pitch:override("Down")
			refs.yaw:override("Backward")
			refs.base:override("At Target")
			refs.body_yaw:override(true)
			refs.inverter:override(true)
			refs.hidden:override(false)
			refs.yaw_mod_degree:override(0)
			refs.yaw_mod:override("Disabled")
			refs.offset:override(0)
			refs.left_limit:override(slot_1134_3_1)
			refs.right_limit:override(slot_1134_3_1)
			refs.fake_options:override("")
			refs.body_freestanding:override(true)
			refs.desync_freestand:override("Peek Real")
			refs.extended:override(false)
			refs.extended_p:override(0)

			slot_0_78_0.jit_yaw = 0
			slot_0_78_0.yaw_add = 0

			return
		elseif slot_0_78_0.aa.force_static() then
			refs.pitch:override("Disabled")
			refs.yaw_mod:override("Disabled")
			refs.yaw:override("Backward")
			refs.yaw_mod_degree:set(0)
			refs.offset:override(math.random(-360, 360))
			refs.left_limit:override(60)
			refs.right_limit:override(60)
			refs.fake_options:override("")
			refs.body_freestanding:override()
			refs.desync_freestand:override()
			refs.body_yaw:override(false)

			slot_0_78_0.jit_yaw = 0
			slot_0_78_0.yaw_add = 0

			return
		end

		slot_1134_3_0 = slot_0_78_0.aa.cond_trig()[1]
		slot_1134_4_0 = slot_0_152_0.antiaim.builder_states[slot_1134_3_0] and slot_0_152_0.antiaim.builder_states[slot_1134_3_0].enabled:get() and slot_0_152_0.antiaim.builder_states[slot_1134_3_0] or slot_0_152_0.antiaim.builder_states[1]

		if not slot_1134_4_0 then
			return
		end

		refs.pitch:override("Down")
		refs.yaw:set(safe_item_get(slot_1134_4_0.yaw, "Disabled"))
		refs.hidden:override(false)

		slot_1134_5_0 = safe_item_get(slot_1134_4_0.body_yaw, "Disabled")

		if slot_1134_5_0 == "Amnesia" then
			refs.fake_options:override("")
			refs.body_freestanding:override()
			refs.desync_freestand:override()
		else
			refs.fake_options:set(slot_0_78_0.aa.body_options_value(slot_1134_4_0))
			slot_0_78_0.aa.apply_body_freestanding(slot_1134_4_0)
		end

		slot_0_78_0.aa_skitter_sign = slot_0_78_0.aa.mod_skitter_sign(slot_1134_4_0)

		refs.body_yaw:set(slot_1134_5_0 ~= "Disabled")
		refs.left_limit:set((safe_item_get(slot_1134_4_0.body_yaw.left_limit, 58) or 58) - slot_0_78_0.aa.desync_value())
		refs.right_limit:set((safe_item_get(slot_1134_4_0.body_yaw.right_limit, 58) or 58) - slot_0_78_0.aa.desync_value())
		refs.extended:override(false)
		refs.extended_p:override(0)
		refs.extended_r:override()

		slot_1134_6_0 = slot_0_78_0.aa.yaw_method_name(slot_1134_4_0)

		if slot_1134_6_0 == "Sync" and slot_1134_5_0 ~= "Amnesia" then
			slot_1134_5_0 = "Static"
		end

		if slot_1134_5_0 == "Amnesia" then
			slot_0_78_0.aa.apply_body_amnesia(slot_1134_4_0, slot_1134_0_0, slot_1134_1_0, slot_1134_3_0)
		elseif slot_1134_5_0 == "Jitter" then
			slot_0_78_0.aa.switch_delay_tick(slot_1134_4_0)
			refs.options:set("")

			slot_1134_7_4 = safe_item_get(slot_1134_4_0.body_yaw.left_limit, 58)
			slot_1134_8_4 = safe_item_get(slot_1134_4_0.body_yaw.right_limit, 58)

			refs.left_limit:set(slot_1134_7_4)
			refs.right_limit:set(slot_1134_8_4)

			if safe_item_get(slot_1134_4_0.yaw_mod, "Disabled") == "Skitter" then
				slot_1134_9_2 = slot_0_78_0.aa_skitter_sign or 0

				if slot_1134_9_2 == 0 then
					refs.body_yaw:override(false)
				else
					refs.body_yaw:override(true)

					if slot_1134_9_2 > 0 then
						refs.inverter:override(true)
						refs.left_limit:set(slot_1134_8_4)
						refs.right_limit:set(slot_1134_8_4)
					else
						refs.inverter:override(false)
						refs.left_limit:set(slot_1134_7_4)
						refs.right_limit:set(slot_1134_7_4)
					end
				end
			else
				refs.inverter:override(slot_0_78_0.aa_switch.switch)

				slot_1134_9_1 = safe_item_get(slot_1134_4_0.body_yaw.jitter_randomness, 0)

				if slot_1134_9_1 > 0 and math.random(0, math.max(1, slot_1134_9_1)) == 0 then
					refs.inverter:override(not refs.inverter:get())
				end
			end
		elseif slot_1134_5_0 == "Sway" then
			if slot_0_78_0.aa_sway.sway == nil then
				slot_0_78_0.aa_sway.sway = safe_item_get(slot_1134_4_0.body_yaw.min_limit, 44)
			end

			refs.inverter:set(false)
			refs.right_limit:override(slot_0_78_0.aa_sway.sway)

			if safe_item_get(slot_1134_4_0.body_yaw.sway_back, false) then
				if slot_0_78_0.aa_sway.sway_back == true then
					slot_0_78_0.aa_sway.sway = slot_0_78_0.aa_sway.sway - safe_item_get(slot_1134_4_0.body_yaw.sway_speed, 1) / 5
				else
					slot_0_78_0.aa_sway.sway = slot_0_78_0.aa_sway.sway + safe_item_get(slot_1134_4_0.body_yaw.sway_speed, 1) / 5
				end

				if slot_0_78_0.aa_sway.sway >= safe_item_get(slot_1134_4_0.body_yaw.max_limit, 58) then
					slot_0_78_0.aa_sway.sway_back = true
				elseif slot_0_78_0.aa_sway.sway <= safe_item_get(slot_1134_4_0.body_yaw.min_limit, 44) then
					slot_0_78_0.aa_sway.sway_back = false
				end
			else
				slot_0_78_0.aa_sway.sway = slot_0_78_0.aa_sway.sway + safe_item_get(slot_1134_4_0.body_yaw.sway_speed, 1) / 5

				if slot_0_78_0.aa_sway.sway >= safe_item_get(slot_1134_4_0.body_yaw.max_limit, 58) then
					slot_0_78_0.aa_sway.sway = safe_item_get(slot_1134_4_0.body_yaw.min_limit, 44)
				end
			end
		else
			refs.extended:override(safe_item_get(slot_1134_4_0.body_yaw.extra_limit, 0) > 0)
			refs.extended_p:override(-safe_item_get(slot_1134_4_0.body_yaw.extra_limit, 0) * 18)

			if slot_1134_6_0 ~= "Sync" then
				refs.inverter:override(safe_item_get(slot_1134_4_0.body_yaw.inverter, false))
			end
		end

		if slot_1134_5_0 ~= "Disabled" and slot_1134_5_0 ~= "Amnesia" then
			slot_0_78_0.aa.apply_overlap(slot_1134_4_0)
		end

		if slot_0_78_0.aa.manual_mode_active and slot_0_78_0.aa.manual_mode_active() then
			slot_1134_7_3 = slot_0_78_0.aa.yaw_base_degree() + slot_0_78_0.aa.builder_yaw_offset(slot_1134_4_0) + slot_0_78_0.aa.yaw_value()

			refs.yaw:override("Backward")
			refs.offset:override(slot_1134_7_3)

			slot_0_78_0.yaw_add = slot_1134_7_3
		elseif slot_1134_6_0 == "180" then
			slot_1134_7_2 = false

			pcall(function()
				slot_1134_7_2 = refs.inverter:get() == true
			end)

			slot_1134_8_3 = slot_0_78_0.aa.lr_yaw_pick(slot_1134_4_0, slot_1134_7_2) + slot_0_78_0.aa.yaw_base_degree() + slot_0_78_0.aa.builder_yaw_offset(slot_1134_4_0) + slot_0_78_0.aa.yaw_value()

			refs.offset:override(slot_1134_8_3)

			slot_0_78_0.yaw_add = slot_1134_8_3
		elseif slot_1134_6_0 == "Sway" then
			if slot_0_78_0.aa_sway.sway_yaw == nil then
				slot_0_78_0.aa_sway.sway_yaw = safe_item_get(slot_1134_4_0.yaw.yaw_add_left, 0)
			end

			if slot_0_78_0.aa_sway.sway_yaw_back == true then
				slot_0_78_0.aa_sway.sway_yaw = slot_0_78_0.aa_sway.sway_yaw - safe_item_get(slot_1134_4_0.yaw.yaw_speed, 1) / 5
			else
				slot_0_78_0.aa_sway.sway_yaw = slot_0_78_0.aa_sway.sway_yaw + safe_item_get(slot_1134_4_0.yaw.yaw_speed, 1) / 5
			end

			if slot_0_78_0.aa_sway.sway_yaw >= safe_item_get(slot_1134_4_0.yaw.yaw_add_right, 0) then
				slot_0_78_0.aa_sway.sway_yaw_back = true
			elseif slot_0_78_0.aa_sway.sway_yaw <= safe_item_get(slot_1134_4_0.yaw.yaw_add_left, 0) then
				slot_0_78_0.aa_sway.sway_yaw_back = false
			end

			refs.offset:override(slot_0_78_0.aa_sway.sway_yaw + slot_0_78_0.aa.yaw_base_degree() + slot_0_78_0.aa.builder_yaw_offset(slot_1134_4_0) + slot_0_78_0.aa.yaw_value())

			slot_0_78_0.yaw_add = slot_0_78_0.aa_sway.sway_yaw + slot_0_78_0.aa.yaw_base_degree() + slot_0_78_0.aa.builder_yaw_offset(slot_1134_4_0) + slot_0_78_0.aa.yaw_value()
		elseif slot_1134_6_0 == "Flick" or slot_1134_6_0 == "Sync" then
			slot_1134_7_1 = slot_0_78_0.aa.yaw_base_degree() + slot_0_78_0.aa.builder_yaw_offset(slot_1134_4_0) + slot_0_78_0.aa.yaw_value()

			if slot_0_78_0.aa.flick_side(slot_1134_4_0) == "left" then
				slot_1134_8_2 = safe_item_get(slot_1134_4_0.yaw.yaw_add_left, 0) + slot_1134_7_1

				refs.offset:override(slot_1134_8_2)

				slot_0_78_0.yaw_add = slot_1134_8_2
			else
				slot_1134_8_1 = slot_0_78_0.aa.dynamic_right(slot_1134_3_0) + slot_1134_7_1

				refs.offset:override(slot_1134_8_1)

				slot_0_78_0.yaw_add = slot_1134_8_1
			end
		else
			refs.offset:override(slot_0_78_0.aa.yaw_base_degree() + slot_0_78_0.aa.builder_yaw_offset(slot_1134_4_0) + slot_0_78_0.aa.yaw_value())

			slot_0_78_0.yaw_add = slot_0_78_0.aa.yaw_base_degree() + slot_0_78_0.aa.builder_yaw_offset(slot_1134_4_0) + slot_0_78_0.aa.yaw_value()
		end

		slot_1134_7_0 = slot_0_78_0.def.resolve_idx(slot_1134_3_0)
		slot_1134_8_0 = slot_0_152_0.antiaim.defensive_states[slot_1134_7_0]
		slot_1134_9_0 = (slot_0_78_0.exploit.lc_left or 0) > 0
		slot_1134_10_0 = slot_1134_8_0 and safe_item_get(slot_1134_8_0.mode, "None") or "None"
		slot_1134_11_0 = not slot_0_78_0.aa_defensive_allowed or slot_0_78_0.aa_defensive_allowed() ~= false
		slot_1134_12_0 = slot_1134_11_0 and slot_1134_8_0 and safe_item_get(slot_1134_8_0.enabled, false) and slot_1134_10_0 ~= "None" and slot_0_78_0.def.exploit_active() and slot_1134_9_0
		slot_1134_13_0 = slot_1134_11_0 and slot_0_78_0.def.snap_advance(slot_1134_8_0, slot_1134_12_0)

		if slot_1134_13_0 then
			refs.offset:override(0)
			refs.yaw_mod:override("Disabled")
			refs.yaw_mod_degree:override(0)

			slot_0_78_0.yaw_add = 0
		elseif slot_0_78_0.aa.manual_mode_active and slot_0_78_0.aa.manual_mode_active() then
			refs.yaw_mod:override("Disabled")
			refs.yaw_mod_degree:override(0)
		else
			slot_0_78_0.aa.apply_yaw_modifier(slot_1134_4_0, slot_0_78_0.aa.yaw_apply_add(slot_1134_4_0, slot_0_78_0.yaw_add), slot_1134_3_0)
		end

		if slot_1134_13_0 then
			slot_0_78_0.def_was_snapping = true
			slot_1134_14_0 = safe_item_get(slot_1134_8_0.mode, "Default")

			if slot_1134_14_0 ~= "None" then
				if slot_0_78_0.def.force_lc(slot_1134_8_0, slot_1134_14_0, slot_1134_7_0) then
					refs.lag_options:override("Always On")
				else
					refs.lag_options:override()
				end

				refs.body_yaw:set(true)
				refs.yaw:set("Backward")

				if slot_0_78_0.def.is_hs_only() then
					slot_0_78_0.def.apply_hs(slot_1134_7_0, slot_1134_0_0)
				elseif slot_1134_14_0 == "Default" then
					slot_0_78_0.def.apply_default(slot_1134_7_0, slot_1134_0_0, arg_1133_0)
				else
					slot_0_78_0.def.apply_custom(slot_1134_7_0, slot_1134_8_0, slot_1134_0_0)
				end

				if slot_0_78_0.def_use_active == true then
					arg_1133_0.in_use = false
				end
			else
				slot_0_78_0.def.disarm()
			end
		else
			slot_0_78_0.def.disarm()

			if not slot_1134_9_0 then
				slot_0_78_0.def.runtime_reset(slot_1134_7_0)
			end
		end
	end)

	if not var_1133_0 then
		print_raw("\aD35050FF[amnesia.plus]\aFFFFFFFF error(createmove): " .. tostring(var_1133_1))
	end
end)

function slot_0_195_0(arg_1137_0)
	arg_1137_0 = tostring(arg_1137_0 or "live"):lower()

	if arg_1137_0 == "alpha" then
		return ""
	elseif arg_1137_0 == "debug" then
		return ""
	end

	return ""
end

slot_0_78_0.sidebar_typing = {
	idx = 1,
	shown = "",
	next_at = 0,
	done = false,
	text_plain = "amnesia.plus • " .. slot_0_195_0(slot_0_25_0),
	text_marked = "amnesia.plus • \a{Link Active}" .. slot_0_195_0(slot_0_25_0),
	last_build_channel = tostring(slot_0_25_0 or "live"):lower()
}
chi = (function()
	local var_1138_0 = _G.CHI_BIND_DEFS
	local var_1138_1 = {
		_measure_cache_tick = 0,
		smooth_ns = "amnesia.chi",
		DECOR_TEXT = "*ੈ✩",
		decor_font_cache = false,
		LOGO_W_L = 27,
		LOGO_W_R = 25,
		LOGO_H = 13,
		LOGO_W = 52,
		logo_fetch_busy = false,
		FONT_SUB = 2,
		FONT_HDR = 4,
		LOGO_DIR = "amnesia.plus/chi",
		smooth_fb = {},
		cond_map = {
			["Fake-Lag"] = "FAKE-LAG",
			Crouching = "CROUCH",
			["Air~C"] = "AIR CROUCH",
			Air = "IN AIR",
			Walking = "SLOW MOVE",
			Moving = "MOVING",
			Standing = "STANDING",
			Global = "GLOBAL",
			[""] = "GLOBAL"
		},
		hdr_c1 = color(255, 255, 255, 255),
		hdr_c2 = color(220, 220, 220, 255),
		cond_c1 = color(255, 255, 255, 255),
		cond_c2 = color(190, 190, 190, 255),
		_measure_cache = {},
		_flash_spreads = {
			0,
			3,
			7
		},
		drag = {
			active = false,
			hover = false
		},
		LOGO_SRC_L = vector(59, 30),
		LOGO_SRC_R = vector(56, 30),
		logo_tex = {},
		logo_net_pending = {}
	}

	pcall(function()
		local var_1139_0, var_1139_1 = pcall(require, "neverlose/smooth")

		if var_1139_0 then
			var_1138_1.nl_smooth = var_1139_1
		end
	end)
	pcall(function()
		local var_1140_0, var_1140_1 = pcall(require, "neverlose/monylinear")

		if var_1140_0 then
			var_1138_1.nl_monylinear = var_1140_1
		end
	end)

	function var_1138_1.strip_markup(arg_1141_0)
		return (tostring(arg_1141_0 or ""):gsub("\\a%x%x%x%x%x%x%x%x", ""))
	end

	function var_1138_1.safe_measure(arg_1142_0, arg_1142_1)
		arg_1142_1 = var_1138_1.strip_markup(arg_1142_1)

		if arg_1142_1 == "" then
			return 0
		end

		local var_1142_0 = globals.tickcount or 0

		if var_1138_1._measure_cache_tick ~= var_1142_0 then
			var_1138_1._measure_cache_tick = var_1142_0
			var_1138_1._measure_cache = {}
		end

		local var_1142_1 = tostring(arg_1142_0) .. "\x00" .. arg_1142_1
		local var_1142_2 = var_1138_1._measure_cache[var_1142_1]

		if type(var_1142_2) == "number" then
			return var_1142_2
		end

		local var_1142_3, var_1142_4 = pcall(function()
			return render.measure_text(arg_1142_0, nil, arg_1142_1).x
		end)

		if var_1142_3 and var_1142_4 then
			var_1138_1._measure_cache[var_1142_1] = var_1142_4

			return var_1142_4
		end

		return #arg_1142_1 * 6
	end

	function var_1138_1.smooth_linear(arg_1144_0, arg_1144_1)
		local var_1144_0 = arg_1144_1 == true

		if var_1138_1.nl_smooth and var_1138_1.nl_smooth.linear then
			local var_1144_1, var_1144_2 = pcall(var_1138_1.nl_smooth.linear, var_1138_1.smooth_ns, arg_1144_0, var_1144_0)

			if var_1144_1 and type(var_1144_2) == "number" then
				return var_1144_2
			end
		end

		local var_1144_3 = var_1138_1.smooth_ns .. "\x00" .. arg_1144_0
		local var_1144_4 = var_1138_1.smooth_fb[var_1144_3] or 0
		local var_1144_5 = math.min(1, (globals.frametime or 0.016) * 14)
		local var_1144_6 = var_1144_4 + (var_1144_0 - var_1144_4) * var_1144_5

		var_1138_1.smooth_fb[var_1144_3] = var_1144_6

		return var_1144_6
	end

	function var_1138_1.color_mix(arg_1145_0, arg_1145_1, arg_1145_2)
		arg_1145_0 = math.max(0, math.min(1, tonumber(arg_1145_0) or 0))

		return color(arg_1145_1.r * arg_1145_0 + arg_1145_2.r * (1 - arg_1145_0), arg_1145_1.g * arg_1145_0 + arg_1145_2.g * (1 - arg_1145_0), arg_1145_1.b * arg_1145_0 + arg_1145_2.b * (1 - arg_1145_0), 255)
	end

	function var_1138_1.decor_font()
		if var_1138_1.decor_font_cache == false then
			local var_1146_0, var_1146_1 = pcall(render.load_font, "Tahoma", 13, "a")

			var_1138_1.decor_font_cache = var_1146_0 and var_1146_1 or var_1138_1.FONT_SUB
		end

		return var_1138_1.decor_font_cache
	end

	function var_1138_1.style_value()
		local var_1147_0 = slot_0_152_0.vars and slot_0_152_0.vars.chi_enable
		local var_1147_1 = var_1147_0 and var_1147_0.chi_style

		if not var_1147_1 or type(var_1147_1.get) ~= "function" then
			return 1
		end

		local var_1147_2, var_1147_3 = pcall(function()
			return var_1147_1:get()
		end)

		if var_1147_2 and type(var_1147_3) == "number" then
			return var_1147_3 == 2 and 2 or 1
		end

		if var_1147_2 and type(var_1147_3) == "string" then
			if var_1147_3:find("Classic", 1, true) then
				return 2
			end

			return 1
		end

		return 1
	end

	function var_1138_1.logo_body_off(arg_1149_0)
		if arg_1149_0 == 2 then
			return var_1138_1.LOGO_H - 4
		end

		return 0
	end

	function var_1138_1.logo_url(arg_1150_0)
		local var_1150_0 = slot_0_78_0.chi_logo_urls

		if type(var_1150_0) == "table" and type(var_1150_0[arg_1150_0]) == "string" and var_1150_0[arg_1150_0] ~= "" then
			return var_1150_0[arg_1150_0]
		end

		if arg_1150_0 == "logo_l" then
			return "https://api.amnesia.plus/storage/logo_l.png"
		end

		if arg_1150_0 == "logo_r" then
			return "https://api.amnesia.plus/storage/logo_r.png"
		end

		return "https://api.amnesia.plus/storage/" .. arg_1150_0 .. ".png"
	end

	function var_1138_1.logo_path(arg_1151_0)
		return var_1138_1.LOGO_DIR .. "/" .. arg_1151_0 .. ".png"
	end

	function var_1138_1.logo_apply_bytes(arg_1152_0, arg_1152_1, arg_1152_2)
		if var_1138_1.logo_tex[arg_1152_0] or type(arg_1152_1) ~= "string" or #arg_1152_1 < 16 or arg_1152_1:sub(2, 4) ~= "PNG" then
			return false
		end

		local var_1152_0, var_1152_1 = pcall(render.load_image, arg_1152_1, arg_1152_2)

		if var_1152_0 and var_1152_1 then
			var_1138_1.logo_tex[arg_1152_0] = var_1152_1

			return true
		end

		return false
	end

	function var_1138_1.logo_fetch_one(arg_1153_0, arg_1153_1)
		if var_1138_1.logo_tex[arg_1153_0] then
			return
		end

		local var_1153_0 = var_1138_1.logo_path(arg_1153_0)

		pcall(function()
			var_1138_1.logo_apply_bytes(arg_1153_0, files.read(var_1153_0), arg_1153_1)
		end)

		if var_1138_1.logo_tex[arg_1153_0] then
			return
		end

		if var_1138_1.logo_net_pending[arg_1153_0] then
			return
		end

		var_1138_1.logo_net_pending[arg_1153_0] = true

		pcall(function()
			files.create_folder(var_1138_1.LOGO_DIR)
		end)
		pcall(function()
			network.get(var_1138_1.logo_url(arg_1153_0), nil, function(arg_1157_0)
				var_1138_1.logo_net_pending[arg_1153_0] = nil

				if type(arg_1157_0) ~= "string" or #arg_1157_0 < 16 or arg_1157_0:sub(2, 4) ~= "PNG" then
					return
				end

				if var_1138_1.logo_apply_bytes(arg_1153_0, arg_1157_0, arg_1153_1) then
					pcall(files.write, var_1153_0, arg_1157_0, true)
				end
			end)
		end)
	end

	function var_1138_1.logo_fetch()
		if var_1138_1.logo_fetch_busy then
			return
		end

		var_1138_1.logo_fetch_busy = true

		var_1138_1.logo_fetch_one("logo_l", var_1138_1.LOGO_SRC_L)
		var_1138_1.logo_fetch_one("logo_r", var_1138_1.LOGO_SRC_R)

		var_1138_1.logo_fetch_busy = false
	end

	function var_1138_1.draw_logo(arg_1159_0, arg_1159_1, arg_1159_2, arg_1159_3, arg_1159_4, arg_1159_5)
		var_1138_1.logo_fetch()

		local var_1159_0 = var_1138_1.hdr_c1
		local var_1159_1 = var_1138_1.hdr_c2

		if type(arg_1159_5) == "table" then
			if arg_1159_5.c1 then
				var_1159_0 = arg_1159_5.c1
			end

			if arg_1159_5.c2 then
				var_1159_1 = arg_1159_5.c2
			end
		end

		arg_1159_2 = tonumber(arg_1159_2) or 1
		arg_1159_4 = math.max(0, math.min(1, tonumber(arg_1159_4) or 0))

		local var_1159_2 = math.floor(255 * arg_1159_2)
		local var_1159_3 = color(var_1159_0.r, var_1159_0.g, var_1159_0.b, var_1159_2)
		local var_1159_4 = color(var_1159_1.r, var_1159_1.g, var_1159_1.b, var_1159_2)
		local var_1159_5 = var_1138_1.LOGO_W * 0.5 + 5
		local var_1159_6 = (var_1159_5 - 1) * (arg_1159_3 or 0)
		local var_1159_7 = vector(arg_1159_0 - var_1138_1.LOGO_W * 0.5 + var_1159_6, arg_1159_1)
		local var_1159_8 = var_1138_1.logo_tex.logo_l
		local var_1159_9 = var_1138_1.logo_tex.logo_r

		if var_1159_8 and var_1159_9 then
			pcall(function()
				render.texture(var_1159_8, var_1159_7, vector(var_1138_1.LOGO_W_L, var_1138_1.LOGO_H), var_1159_3, "f")
				render.texture(var_1159_9, vector(var_1159_7.x + var_1138_1.LOGO_W_L, var_1159_7.y), vector(var_1138_1.LOGO_W_R, var_1138_1.LOGO_H), var_1159_4, "f")
			end)
		end

		if arg_1159_4 > 0.02 then
			local var_1159_10 = math.min(1, arg_1159_2 * arg_1159_4)
			local var_1159_11 = color(255, 255, 255, math.floor(255 * var_1159_10))

			for iter_1159_0, iter_1159_1 in ipairs(var_1138_1._flash_spreads or {
				0,
				3,
				7
			}) do
				pcall(function()
					render.shadow(vector(var_1159_7.x - iter_1159_1, var_1159_7.y + var_1138_1.LOGO_H), vector(var_1159_7.x + var_1138_1.LOGO_W + iter_1159_1, var_1159_7.y + var_1138_1.LOGO_H), var_1159_11)
				end)
			end
		end

		return var_1159_5
	end

	function var_1138_1.draw_name_decor(arg_1162_0, arg_1162_1, arg_1162_2, arg_1162_3, arg_1162_4, arg_1162_5)
		local var_1162_0 = var_1138_1.decor_font()
		local var_1162_1 = arg_1162_0 + (arg_1162_4 - 1) * arg_1162_3 + arg_1162_4 + 4
		local var_1162_2 = arg_1162_1 - 1
		local var_1162_3 = var_1138_1.hdr_c1
		local var_1162_4 = color(255, 255, 255, 255)

		if type(arg_1162_5) == "table" then
			if arg_1162_5.glow then
				var_1162_3 = arg_1162_5.glow
			end

			if arg_1162_5.c1 then
				var_1162_4 = arg_1162_5.c1
			end
		end

		local var_1162_5 = color(var_1162_3.r, var_1162_3.g, var_1162_3.b, math.floor(45 * arg_1162_2))
		local var_1162_6 = color(var_1162_4.r, var_1162_4.g, var_1162_4.b, math.floor(72 * arg_1162_2))
		local var_1162_7 = var_1138_1.safe_measure(var_1162_0, var_1138_1.DECOR_TEXT) * 0.5 + 4

		pcall(function()
			render.shadow(vector(var_1162_1 - var_1162_7 + 4, var_1162_2 + 2), vector(var_1162_1 + var_1162_7 - 4, var_1162_2 + 2), var_1162_5)
		end)
		pcall(function()
			render.text(var_1162_0, vector(var_1162_1, var_1162_2), var_1162_6, "c", var_1138_1.DECOR_TEXT)
		end)
	end

	function var_1138_1.animate_text(arg_1165_0, arg_1165_1, arg_1165_2)
		if var_1138_1.nl_monylinear and type(var_1138_1.nl_monylinear.Animate) == "function" then
			local var_1165_0, var_1165_1 = pcall(function()
				return var_1138_1.nl_monylinear:Animate(arg_1165_0, {
					arg_1165_1,
					arg_1165_2
				}, 3)
			end)

			if var_1165_0 and type(var_1165_1) == "string" and var_1165_1 ~= "" then
				return var_1165_1
			end
		end

		return arg_1165_0
	end

	function var_1138_1.draw_header(arg_1167_0, arg_1167_1, arg_1167_2, arg_1167_3, arg_1167_4, arg_1167_5, arg_1167_6)
		arg_1167_4 = arg_1167_4 or 0
		arg_1167_5 = math.max(0, math.min(1, tonumber(arg_1167_5) or 0))
		arg_1167_3 = tonumber(arg_1167_3) or 1

		local var_1167_0 = var_1138_1.hdr_c1
		local var_1167_1 = var_1138_1.hdr_c2
		local var_1167_2 = var_1138_1.hdr_c1

		if type(arg_1167_6) == "table" then
			if arg_1167_6.c1 then
				var_1167_0 = arg_1167_6.c1
			end

			if arg_1167_6.c2 then
				var_1167_1 = arg_1167_6.c2
			end

			if arg_1167_6.glow then
				var_1167_2 = arg_1167_6.glow
			end
		end

		local function var_1167_3(arg_1168_0, arg_1168_1)
			arg_1168_0 = arg_1168_0 or color(255, 255, 255, 255)

			local var_1168_0 = (arg_1168_0.a or 255) / 255

			return color(arg_1168_0.r, arg_1168_0.g, arg_1168_0.b, math.floor(255 * arg_1167_3 * var_1168_0 * (arg_1168_1 or 1)))
		end

		local var_1167_4 = var_1167_3(var_1167_0)
		local var_1167_5 = var_1167_3(var_1167_1)
		local var_1167_6 = var_1167_3(var_1167_2)
		local var_1167_7 = var_1138_1.animate_text(string.lower(tostring(arg_1167_2 or "")), var_1167_4, var_1167_5)
		local var_1167_8 = var_1138_1.safe_measure(var_1138_1.FONT_HDR, var_1167_7) * 0.5 + 5
		local var_1167_9 = (var_1167_8 - 1) * arg_1167_4

		pcall(function()
			render.shadow(vector(arg_1167_0 - var_1167_8 + 5 + var_1167_9, arg_1167_1 + 2), vector(arg_1167_0 + var_1167_8 - 5 + var_1167_9, arg_1167_1 + 2), var_1167_6)
		end)
		pcall(function()
			render.text(var_1138_1.FONT_HDR, vector(arg_1167_0 + var_1167_9, arg_1167_1), color(255, 255, 255, math.floor(255 * arg_1167_3)), "c", var_1167_7)
		end)

		if arg_1167_5 > 0.02 then
			local var_1167_10 = math.min(1, arg_1167_3 * arg_1167_5)
			local var_1167_11 = color(255, 255, 255, math.floor(255 * var_1167_10))

			for iter_1167_0, iter_1167_1 in ipairs(var_1138_1._flash_spreads or {
				0,
				3,
				7
			}) do
				pcall(function()
					render.shadow(vector(arg_1167_0 - var_1167_8 - iter_1167_1 + 5 + var_1167_9, arg_1167_1 + 2), vector(arg_1167_0 + var_1167_8 + iter_1167_1 - 5 + var_1167_9, arg_1167_1 + 2), var_1167_11)
				end)
			end
		end

		return var_1167_7, var_1138_1.safe_measure(var_1138_1.FONT_HDR, var_1167_7)
	end

	function var_1138_1.draw_dt_charge_ring(arg_1172_0, arg_1172_1, arg_1172_2, arg_1172_3)
		arg_1172_2 = tonumber(arg_1172_2) or 1

		if arg_1172_2 <= 0.001 then
			return
		end

		local var_1172_0 = var_1138_1.exploit_charge()
		local var_1172_1 = false

		pcall(function()
			if refs.dt and type(refs.dt.get_override) == "function" then
				local var_1173_0 = refs.dt:get_override()

				var_1172_1 = var_1173_0 ~= nil and var_1173_0 == false
			end
		end)

		local var_1172_2 = var_1172_1 and 100 or 255
		local var_1172_3 = color(255, 255, 255, math.floor(var_1172_2 * arg_1172_2))
		local var_1172_4 = color(0, 0, 0, math.floor(50 * arg_1172_2))
		local var_1172_5 = tonumber(arg_1172_3) or 0
		local var_1172_6 = math.max(0, var_1172_5 - 5)
		local var_1172_7 = 3.4
		local var_1172_8 = 1
		local var_1172_9 = vector(arg_1172_0 + var_1172_6 + var_1172_8 + var_1172_7, arg_1172_1)

		pcall(function()
			render.circle_outline(var_1172_9, var_1172_4, 3.4, 0, 1, 1)
			render.circle_outline(var_1172_9, var_1172_3, 3.4, 0, var_1172_0, 1)
		end)
	end

	function var_1138_1.dt_override_dimmed()
		local var_1175_0 = false

		pcall(function()
			if refs.dt and type(refs.dt.get_override) == "function" then
				local var_1176_0 = refs.dt:get_override()

				var_1175_0 = var_1176_0 ~= nil and var_1176_0 == false
			end
		end)

		return var_1175_0
	end

	function var_1138_1.dt_charge_bars_label(arg_1177_0)
		arg_1177_0 = tonumber(arg_1177_0) or 1

		local var_1177_0 = math.max(0, math.min(1, var_1138_1.exploit_charge()))
		local var_1177_1 = math.floor(var_1177_0 * 6 + 0.0001)
		local var_1177_2 = slot_0_89_0.hud_accent_markup(arg_1177_0)
		local var_1177_3 = string.format("\a%02X%02X%02X%02X", 255, 255, 255, math.floor(96 * arg_1177_0))
		local var_1177_4 = "IIIIII"

		if var_1177_1 < 6 then
			var_1177_4 = var_1177_4:sub(1, var_1177_1) .. var_1177_3 .. var_1177_4:sub(var_1177_1 + 1)
		end

		return ("DT %s%s"):format(var_1177_2, var_1177_4)
	end

	function var_1138_1.dt_bind_label(arg_1178_0, arg_1178_1, arg_1178_2)
		if arg_1178_0 and arg_1178_0.id == "Double Tap" and arg_1178_2 == 2 then
			return var_1138_1.dt_charge_bars_label(arg_1178_1)
		end

		return var_1138_1.bind_hud_label(arg_1178_0, arg_1178_1)
	end

	function var_1138_1.dt_bind_plain(arg_1179_0, arg_1179_1)
		if arg_1179_0 and arg_1179_0.id == "Double Tap" and arg_1179_1 == 2 then
			return "DT IIIIII"
		end

		if arg_1179_0 and arg_1179_0.id == "Damage" then
			return var_1138_1.min_damage_label()
		end

		return var_1138_1.strip_markup(var_1138_1.bind_hud_label(arg_1179_0, 1))
	end

	function var_1138_1.gear_on(arg_1180_0, arg_1180_1)
		if not arg_1180_0 or type(arg_1180_0.get) ~= "function" then
			return false
		end

		local var_1180_0, var_1180_1 = pcall(function()
			return arg_1180_0:get(arg_1180_1)
		end)

		return var_1180_0 and var_1180_1 == true
	end

	function var_1138_1.bind_listed(arg_1182_0, arg_1182_1)
		local var_1182_0 = _G.bind_listed_check or bind_listed_check

		if type(var_1182_0) ~= "function" then
			return false
		end

		return var_1182_0(arg_1182_0, arg_1182_1)
	end

	function var_1138_1.freestand_script_enabled()
		local var_1183_0 = slot_0_152_0.antiaim and slot_0_152_0.antiaim.freestand

		if not var_1183_0 or type(var_1183_0.get) ~= "function" then
			return false
		end

		local var_1183_1, var_1183_2 = pcall(function()
			return var_1183_0:get()
		end)

		return var_1183_1 and var_1183_2 == true
	end

	function var_1138_1.bind_visible(arg_1185_0, arg_1185_1)
		if arg_1185_1 == "Freestanding" and var_1138_1.freestand_script_enabled() then
			return true
		end

		return var_1138_1.bind_listed(arg_1185_0.chi_binds, arg_1185_1)
	end

	function var_1138_1.ref_bool(arg_1186_0)
		if not arg_1186_0 or type(arg_1186_0.get) ~= "function" then
			return false
		end

		local var_1186_0, var_1186_1 = pcall(function()
			return arg_1186_0:get()
		end)

		return var_1186_0 and var_1186_1 == true
	end

	function var_1138_1.ref_live(arg_1188_0)
		if not arg_1188_0 then
			return false
		end

		if type(arg_1188_0.get_override) == "function" then
			local var_1188_0, var_1188_1 = pcall(function()
				return arg_1188_0:get_override()
			end)

			if var_1188_0 and var_1188_1 ~= nil then
				if type(var_1188_1) == "boolean" then
					return var_1188_1
				end

				if type(var_1188_1) == "number" then
					return var_1188_1 > 0
				end

				return var_1188_1 ~= ""
			end
		end

		return var_1138_1.ref_bool(arg_1188_0)
	end

	function var_1138_1.autopeek_on()
		if var_1138_1.ref_live(refs.peek_assist) then
			return true
		end

		local var_1190_0, var_1190_1 = pcall(ui.get_binds)

		if not var_1190_0 or type(var_1190_1) ~= "table" then
			return false
		end

		for iter_1190_0 = 1, #var_1190_1 do
			local var_1190_2 = var_1190_1[iter_1190_0]

			if var_1190_2 and var_1190_2.active then
				local var_1190_3 = tostring(var_1190_2.name or ""):lower()

				if var_1190_3 == "peek assist" or var_1190_3 == "auto peek" or var_1190_3:find("peek assist", 1, true) then
					return true
				end
			end
		end

		return false
	end

	function var_1138_1.bind_fs_pa_plus()
		if var_1138_1.bind_active({
			id = "Freestanding"
		}) ~= true then
			return false
		end

		if var_1138_1.bind_active({
			id = "Double Tap"
		}) ~= true then
			return false
		end

		return var_1138_1.autopeek_on()
	end

	function var_1138_1.accent_color(arg_1192_0)
		arg_1192_0 = tonumber(arg_1192_0) or 1

		local var_1192_0, var_1192_1 = pcall(ui.get_style, "Link Active")

		if var_1192_0 and var_1192_1 then
			return color(var_1192_1.r, var_1192_1.g, var_1192_1.b, math.floor(255 * arg_1192_0))
		end

		return slot_0_89_0.hud_accent_color(arg_1192_0)
	end

	function var_1138_1.bind_active(arg_1193_0)
		if not arg_1193_0 then
			return false
		end

		if arg_1193_0.id == "Body Aim" then
			return var_1138_1.body_aim_force()
		end

		if arg_1193_0.id == "Damage" then
			return var_1138_1.damage_bind_active()
		end

		if arg_1193_0.id == "Double Tap" then
			return var_1138_1.ref_live(refs.dt)
		end

		if arg_1193_0.id == "Hide Shots" then
			return var_1138_1.ref_live(refs.hs)
		end

		if arg_1193_0.id == "AI Peek" then
			if type(slot_0_78_0.ai_peek_bind_on) == "function" then
				return slot_0_78_0.ai_peek_bind_on() == true
			end

			return false
		end

		if arg_1193_0.id == "Fake Duck" then
			return var_1138_1.ref_live(refs.fd)
		end

		if arg_1193_0.id == "Freestanding" then
			if slot_0_152_0.antiaim and slot_0_152_0.antiaim.freestand and slot_0_152_0.antiaim.freestand:get() == true then
				return true
			end

			return var_1138_1.ref_live(refs.freestanding)
		end

		return false
	end

	function var_1138_1.bind_muted(arg_1194_0)
		if not arg_1194_0 or arg_1194_0.id ~= "Hide Shots" then
			return false
		end

		return var_1138_1.ref_bool(refs.dt) and var_1138_1.ref_bool(refs.hs)
	end

	function var_1138_1.bind_hud_label(arg_1195_0, arg_1195_1)
		if not arg_1195_0 then
			return ""
		end

		if arg_1195_0.id == "Freestanding" and var_1138_1.bind_fs_pa_plus() then
			return ("\a%sPA+"):format(var_1138_1.accent_color(arg_1195_1 or 1):to_hex())
		end

		if arg_1195_0.id == "Damage" then
			return var_1138_1.min_damage_label()
		end

		if var_1138_1.bind_muted(arg_1195_0) then
			return ("\a%s%s"):format(color(150, 150, 150, 190):to_hex(), arg_1195_0.hud or "")
		end

		if arg_1195_0.color == "exploit" then
			return ("\a%s%s"):format(var_1138_1.color_mix(var_1138_1.exploit_charge(), color(64, 255, 64, 255), color(255, 64, 64, 255)):to_hex(), arg_1195_0.hud or "")
		end

		return arg_1195_0.hud or ""
	end

	function var_1138_1.body_aim_force()
		if not refs.body_aim or type(refs.body_aim.get) ~= "function" then
			return false
		end

		local var_1196_0, var_1196_1 = pcall(function()
			return refs.body_aim:get()
		end)

		return var_1196_0 and var_1196_1 == "Force"
	end

	function var_1138_1.min_damage_value()
		local var_1198_0 = 0

		pcall(function()
			if refs.min_damage and type(refs.min_damage.get) == "function" then
				var_1198_0 = math.floor(tonumber(refs.min_damage:get()) or 0)
			end
		end)

		return var_1198_0
	end

	function var_1138_1.min_damage_label()
		local var_1200_0 = var_1138_1.min_damage_value()

		if var_1200_0 == 0 then
			return "A"
		end

		if var_1200_0 > 100 then
			return "+" .. tostring(var_1200_0 - 100)
		end

		return tostring(var_1200_0)
	end

	function var_1138_1.damage_bind_active()
		local var_1201_0, var_1201_1 = pcall(ui.get_binds)

		if var_1201_0 and type(var_1201_1) == "table" then
			for iter_1201_0 = 1, #var_1201_1 do
				local var_1201_2 = var_1201_1[iter_1201_0]

				if var_1201_2 and var_1201_2.active and tostring(var_1201_2.name or "") == "Min. Damage" then
					return true
				end
			end
		end

		if refs.min_damage and type(refs.min_damage.get_override) == "function" then
			local var_1201_3, var_1201_4 = pcall(function()
				return refs.min_damage:get_override()
			end)

			return var_1201_3 and var_1201_4 ~= nil
		end

		return false
	end

	function var_1138_1.exploit_charge()
		local var_1203_0, var_1203_1 = pcall(function()
			return rage.exploit:get()
		end)

		if not var_1203_0 then
			return 0
		end

		return tonumber(var_1203_1) or 0
	end

	function var_1138_1.condition_label()
		local var_1205_0 = slot_0_78_0.aa.cond_trig()[2] or ""
		local var_1205_1 = entity.get_local_player()

		if var_1205_1 and var_1205_1.m_iHealth > 0 then
			if var_1205_0 == "Air" or var_1205_0 == "Air~C" then
				slot_0_78_0.chi_cond_hold = var_1205_0
				slot_0_78_0.chi_cond_grace = 12
			elseif type(slot_0_78_0.chi_cond_grace) == "number" and slot_0_78_0.chi_cond_grace > 0 then
				slot_0_78_0.chi_cond_grace = slot_0_78_0.chi_cond_grace - 1

				if (var_1205_0 == "Standing" or var_1205_0 == "Moving") and slot_0_78_0.chi_cond_hold then
					var_1205_0 = slot_0_78_0.chi_cond_hold
				end
			elseif slot_0_78_0.chi_cond_grace == 0 then
				slot_0_78_0.chi_cond_hold = nil
			end
		else
			slot_0_78_0.chi_cond_hold = nil
			slot_0_78_0.chi_cond_grace = 0
		end

		local var_1205_2 = var_1138_1.cond_map[var_1205_0]

		if var_1205_2 then
			return var_1205_2
		end

		local var_1205_3 = tostring(var_1205_0 or "")

		if var_1205_3 == "" then
			return "GLOBAL"
		end

		return string.upper(var_1205_3)
	end

	function var_1138_1.enabled()
		local var_1206_0 = slot_0_152_0.vars and slot_0_152_0.vars.chi_enable

		if not var_1206_0 or type(var_1206_0.get) ~= "function" then
			return false
		end

		return var_1206_0:get() == true
	end

	function var_1138_1.anchor_xy(arg_1207_0)
		if not slot_0_78_0.ov_store_loaded then
			slot_0_89_0.store_read()

			slot_0_78_0.ov_store_loaded = true
		end

		local var_1207_0 = slot_0_89_0.store_slot("chi")

		if var_1207_0._init ~= true then
			var_1207_0.x = arg_1207_0.x * 0.5
			var_1207_0.y = arg_1207_0.y * 0.5
			var_1207_0._init = true

			slot_0_89_0.store_write()
		end

		return var_1207_0.x, var_1207_0.y, var_1207_0
	end

	function var_1138_1.mouse_over_menu(arg_1208_0)
		local var_1208_0, var_1208_1, var_1208_2 = pcall(function()
			return ui.get_position(), ui.get_size()
		end)

		if not var_1208_0 or not var_1208_1 or not var_1208_2 then
			return false
		end

		local var_1208_3 = arg_1208_0.x
		local var_1208_4 = arg_1208_0.y

		pcall(function()
			local var_1210_0 = ui.get_mouse_position()

			var_1208_3, var_1208_4 = var_1210_0.x, var_1210_0.y
		end)

		return slot_0_89_0.point_in_rect(var_1208_3, var_1208_4, var_1208_1.x, var_1208_1.y, var_1208_2.x, var_1208_2.y)
	end

	function var_1138_1.stack_metrics(arg_1211_0, arg_1211_1, arg_1211_2, arg_1211_3, arg_1211_4)
		local var_1211_0 = arg_1211_2 + 16
		local var_1211_1 = var_1138_1.gear_on(arg_1211_0.chi_display, "Version")
		local var_1211_2 = var_1138_1.gear_on(arg_1211_0.chi_display, "Condition")
		local var_1211_3 = tostring(slot_0_25_0 or "live"):lower()
		local var_1211_4 = ("amnesia%s"):format(var_1211_1 and " " .. var_1211_3 or "")
		local var_1211_5 = var_1138_1.condition_label()
		local var_1211_6 = var_1138_1.style_value()
		local var_1211_7
		local var_1211_8

		if var_1211_6 == 2 then
			var_1211_8 = var_1138_1.LOGO_W * 0.5 + 5 + 4
		else
			local var_1211_9 = var_1138_1.animate_text(string.lower(var_1211_4), var_1138_1.hdr_c1, var_1138_1.hdr_c2)
			local var_1211_10 = var_1138_1.safe_measure(var_1138_1.FONT_HDR, var_1211_9) * 0.5 + 5

			var_1211_8 = var_1211_10 + 4

			local var_1211_11 = 0

			pcall(function()
				var_1211_11 = var_1138_1.safe_measure(var_1138_1.decor_font(), var_1138_1.DECOR_TEXT) * 0.5 + 4
			end)

			var_1211_8 = math.max(var_1211_8, var_1211_10 + var_1211_11 + 8)
		end

		local var_1211_12 = 16 + var_1138_1.logo_body_off(var_1211_6)
		local var_1211_13 = 12

		if var_1211_2 then
			var_1211_12 = var_1211_12 + 9
			var_1211_8 = math.max(var_1211_8, var_1138_1.safe_measure(var_1138_1.FONT_SUB, var_1211_5) * 0.5 + 5)
		else
			var_1211_12 = var_1211_12 + 1
		end

		for iter_1211_0 = 1, #var_1138_0 do
			local var_1211_14 = var_1138_0[iter_1211_0]

			if var_1138_1.bind_visible(arg_1211_0, var_1211_14.id) then
				local var_1211_15 = var_1138_1.bind_active(var_1211_14) == true
				local var_1211_16 = var_1138_1.smooth_linear("bind_" .. var_1211_14.key, var_1211_15 == true)

				if var_1211_16 > 0.001 then
					local var_1211_17 = var_1138_1.safe_measure(var_1138_1.FONT_SUB, var_1138_1.dt_bind_plain(var_1211_14, var_1211_6)) * 0.5 + 5

					if var_1211_14.id == "Double Tap" and var_1211_6 ~= 2 then
						var_1211_17 = var_1211_17 + 8
					end

					var_1211_12 = var_1211_12 + 8 * var_1211_16
					var_1211_8 = math.max(var_1211_8, var_1211_17)
				end
			end
		end

		local var_1211_18 = var_1211_8 + math.abs(arg_1211_4 or 0) + 6
		local var_1211_19 = var_1211_18 * 2
		local var_1211_20 = var_1211_12 + var_1211_13

		return var_1211_0, arg_1211_1 - var_1211_18, var_1211_0 - var_1211_13, var_1211_19, var_1211_20
	end

	var_1138_1.CH_DRAG_MARGIN = 100
	var_1138_1.CH_BOX_TOP_OFFSET = 4

	function var_1138_1.drag_reset(arg_1213_0)
		local var_1213_0 = var_1138_1.drag

		if arg_1213_0 and var_1213_0.active then
			slot_0_89_0.store_write()
		end

		slot_0_89_0.overlay_drag_clear(var_1213_0, arg_1213_0 ~= true)

		slot_0_78_0.chi_mouse_block = false
	end

	function var_1138_1.drag_box_metrics(arg_1214_0, arg_1214_1, arg_1214_2, arg_1214_3, arg_1214_4)
		local var_1214_0, var_1214_1, var_1214_2, var_1214_3, var_1214_4 = var_1138_1.stack_metrics(arg_1214_0, arg_1214_1, arg_1214_2, arg_1214_3, arg_1214_4)

		return var_1214_1, var_1214_2, var_1214_3, var_1214_4
	end

	function var_1138_1.frame_state()
		if not var_1138_1.enabled() then
			return nil
		end

		local var_1215_0 = slot_0_152_0.vars.chi_enable

		if not var_1215_0 then
			return nil
		end

		local var_1215_1 = slot_0_89_0.screen_size_cached()

		if not var_1215_1 or not var_1215_1.x then
			return nil
		end

		local var_1215_2 = 0

		pcall(function()
			var_1215_2 = ui.get_alpha() or 0
		end)

		local var_1215_3 = false

		if slot_0_78_0.in_score ~= true then
			var_1215_3 = var_1215_2 > 0

			local var_1215_4 = entity.get_local_player()

			if var_1215_4 then
				local var_1215_5, var_1215_6 = pcall(function()
					return var_1215_4:is_alive()
				end)

				var_1215_3 = var_1215_3 or var_1215_5 and var_1215_6 == true
			end
		end

		local var_1215_7 = slot_0_89_0.hud_fade("chi", var_1215_3 == true)

		if var_1215_7 <= 0.001 and var_1215_2 <= 0.01 then
			return nil
		end

		local var_1215_8, var_1215_9, var_1215_10 = var_1138_1.anchor_xy(var_1215_1)
		local var_1215_11 = 0
		local var_1215_12 = entity.get_local_player()

		if var_1215_12 then
			local var_1215_13, var_1215_14 = pcall(function()
				return var_1215_12.m_bIsScoped == true
			end)

			if var_1215_13 and var_1215_14 then
				var_1215_11 = var_1138_1.smooth_linear("scope", true)
			else
				var_1215_11 = var_1138_1.smooth_linear("scope", false)
			end
		end

		return {
			cfg = var_1215_0,
			scr = var_1215_1,
			slot = var_1215_10,
			alpha = var_1215_7,
			menu_alpha = var_1215_2,
			cx = var_1215_8,
			cy = var_1215_9,
			scope_off = var_1215_11
		}
	end

	function var_1138_1.drag_think(arg_1219_0, arg_1219_1, arg_1219_2, arg_1219_3, arg_1219_4, arg_1219_5)
		local var_1219_0 = var_1138_1.drag

		if arg_1219_0 <= 0.01 then
			var_1138_1.drag_reset(var_1219_0.active == true)

			return
		end

		local var_1219_1 = var_1138_1.CH_DRAG_MARGIN or 100
		local var_1219_2 = arg_1219_1.y * 0.5

		slot_0_89_0.overlay_drag_think({
			drag = var_1219_0,
			menu_alpha = arg_1219_0,
			scr = arg_1219_1,
			slot = arg_1219_2,
			mouse_on_menu = var_1138_1.mouse_over_menu,
			get_rect = function()
				local var_1220_0 = arg_1219_1.x * 0.5

				return var_1138_1.drag_box_metrics(arg_1219_3, var_1220_0, arg_1219_2.y, arg_1219_4, arg_1219_5)
			end,
			is_blocked = function()
				return slot_0_78_0.ov_wm_mouse_block or slot_0_78_0.ov_elog_mouse_block or slot_0_78_0.ov_slowdown_mouse_block or slot_0_78_0.ov_keybinds_mouse_block or slot_0_78_0.ov_damage_ind_mouse_block or slot_0_78_0.ov_metrics_mouse_block or slot_0_78_0.ov_spectators_mouse_block
			end,
			snap_pos = function(arg_1222_0, arg_1222_1, arg_1222_2, arg_1222_3)
				local var_1222_0 = var_1219_0.aligning == "y" and "y" or var_1219_0.aligning == "x" and "x" or "x"
				local var_1222_1 = slot_0_89_0.snap_box_to_guides(vector(arg_1222_0, arg_1222_1), vector(arg_1222_2, arg_1222_3), arg_1219_1, var_1222_0)

				return var_1222_1.x, var_1222_1.y
			end,
			clamp_pos = function(arg_1223_0, arg_1223_1, arg_1223_2, arg_1223_3)
				arg_1223_0 = arg_1219_1.x * 0.5 - arg_1223_2 * 0.5

				local var_1223_0 = math.max(32, var_1219_2 - var_1219_1)
				local var_1223_1 = math.min(arg_1219_1.y - arg_1223_3 - 32, var_1219_2 + var_1219_1 - arg_1223_3)

				arg_1223_1 = math.max(var_1223_0, math.min(var_1223_1, arg_1223_1))

				return arg_1223_0, arg_1223_1
			end,
			apply_layout = function(arg_1224_0, arg_1224_1)
				arg_1219_2.x = arg_1219_1.x * 0.5
				arg_1219_2.y = arg_1224_1 - var_1138_1.CH_BOX_TOP_OFFSET
			end,
			on_held = function()
				var_1219_0.aligning = "y"
			end,
			on_save = function()
				slot_0_89_0.store_write()
			end,
			on_reset = function(arg_1227_0)
				var_1138_1.drag_reset(arg_1227_0 == true)
			end,
			set_mouse_block = function(arg_1228_0)
				slot_0_78_0.chi_mouse_block = arg_1228_0
			end
		})
	end

	function var_1138_1.overlay_tick()
		local var_1229_0 = 0

		pcall(function()
			var_1229_0 = ui.get_alpha() or 0
		end)

		if var_1229_0 <= 0.01 then
			var_1138_1.drag_reset(var_1138_1.drag.active == true)

			return
		end

		local var_1229_1 = var_1138_1.frame_state()

		if not var_1229_1 then
			return
		end

		var_1138_1.drag_think(var_1229_1.menu_alpha, var_1229_1.scr, var_1229_1.slot, var_1229_1.cfg, var_1229_1.alpha, var_1229_1.scope_off)

		var_1229_1.slot.x = var_1229_1.scr.x * 0.5
	end

	function var_1138_1.render_draw()
		if not var_1138_1.enabled() then
			return
		end

		slot_1231_0_0 = var_1138_1.frame_state()

		if not slot_1231_0_0 then
			slot_0_78_0.chi_mouse_block = false

			return
		end

		slot_1231_1_0 = slot_1231_0_0.cfg
		slot_1231_2_0 = slot_1231_0_0.scr
		slot_1231_3_0 = slot_1231_0_0.slot
		slot_1231_4_0 = slot_1231_0_0.alpha
		slot_1231_5_0 = slot_1231_0_0.menu_alpha
		slot_1231_6_0 = slot_1231_0_0.scr.x * 0.5
		slot_1231_7_0 = slot_1231_3_0.y
		slot_1231_8_0 = slot_1231_0_0.scope_off

		if slot_1231_4_0 <= 0.001 then
			slot_0_78_0.chi_mouse_block = false

			return
		end

		slot_1231_9_0 = var_1138_1.gear_on(slot_1231_1_0.chi_display, "Version")
		slot_1231_10_0 = var_1138_1.gear_on(slot_1231_1_0.chi_display, "Condition")
		slot_1231_11_0 = tostring(slot_0_25_0 or "live"):lower()
		slot_1231_12_0 = ("amnesia%s"):format(slot_1231_9_0 and " " .. slot_1231_11_0 or "")
		slot_1231_13_0 = var_1138_1.condition_label()
		slot_1231_14_0, slot_1231_15_0, slot_1231_16_0 = slot_0_89_0.chi_style_colors(slot_1231_4_0)
		slot_1231_17_0 = var_1138_1.animate_text(slot_1231_13_0, slot_1231_14_0, slot_1231_15_0)
		slot_1231_18_0 = {
			c1 = slot_1231_14_0,
			c2 = slot_1231_15_0,
			glow = slot_1231_16_0
		}
		slot_1231_19_0 = var_1138_1.style_value()
		slot_1231_20_0 = var_1138_1.animate_text(string.lower(slot_1231_12_0), slot_1231_14_0, slot_1231_15_0)
		slot_1231_21_0 = var_1138_1.safe_measure(var_1138_1.FONT_HDR, slot_1231_20_0) * 0.5 + 5
		slot_1231_22_0 = slot_1231_7_0 + 16
		slot_1231_23_0 = 0

		if slot_1231_19_0 ~= 2 and slot_1231_1_0.chi_flash_kill and slot_1231_1_0.chi_flash_kill:get() == true then
			slot_1231_23_0 = slot_0_78_0.ui_kill_flash or 0
		end

		if slot_1231_19_0 == 2 then
			slot_1231_21_0 = var_1138_1.draw_logo(slot_1231_6_0, slot_1231_22_0, slot_1231_4_0, slot_1231_8_0, slot_1231_23_0, slot_1231_18_0)
		else
			var_1138_1.draw_name_decor(slot_1231_6_0, slot_1231_22_0, slot_1231_4_0, slot_1231_8_0, slot_1231_21_0, slot_1231_18_0)
			var_1138_1.draw_header(slot_1231_6_0, slot_1231_22_0, slot_1231_12_0, slot_1231_4_0, slot_1231_8_0, slot_1231_23_0, slot_1231_18_0)
		end

		slot_1231_24_0 = var_1138_1.safe_measure(var_1138_1.FONT_SUB, slot_1231_13_0) * 0.5 + 5
		slot_1231_26_0 = 16 + var_1138_1.logo_body_off(slot_1231_19_0)

		if slot_1231_10_0 then
			slot_1231_26_0 = slot_1231_26_0 + 9
			slot_1231_27_0 = slot_1231_17_0

			if var_1138_1.strip_markup(slot_1231_27_0) == "" then
				slot_1231_27_0 = slot_1231_13_0
			end

			pcall(function()
				render.text(var_1138_1.FONT_SUB, vector(slot_1231_6_0 + slot_1231_24_0 * slot_1231_8_0, slot_1231_22_0 + (slot_1231_26_0 - 16)), color(255, 255, 255, 255 * slot_1231_4_0), "c", slot_1231_27_0)
			end)
		else
			slot_1231_26_0 = slot_1231_26_0 + 1
		end

		for iter_1231_0 = 1, #var_1138_0 do
			slot_1231_31_0 = var_1138_0[iter_1231_0]

			if not var_1138_1.bind_visible(slot_1231_1_0, slot_1231_31_0.id) then
				var_1138_1.smooth_linear("bind_" .. slot_1231_31_0.key, false)
			else
				slot_1231_32_0 = var_1138_1.bind_active(slot_1231_31_0) == true
				slot_1231_33_0 = var_1138_1.smooth_linear("bind_" .. slot_1231_31_0.key, slot_1231_32_0 == true)

				if slot_1231_33_0 > 0.001 then
					slot_1231_34_0 = var_1138_1.dt_bind_label(slot_1231_31_0, slot_1231_4_0, slot_1231_19_0)
					slot_1231_35_0 = var_1138_1.dt_bind_plain(slot_1231_31_0, slot_1231_19_0)

					if slot_1231_35_0 == "" then
						slot_1231_35_0 = slot_1231_31_0.hud or ""
					end

					slot_1231_36_0 = var_1138_1.safe_measure(var_1138_1.FONT_SUB, slot_1231_35_0) * 0.5 + 5
					slot_1231_26_0 = slot_1231_26_0 + 8 * slot_1231_33_0
					slot_1231_37_0 = slot_1231_22_0 + (slot_1231_26_0 - 16)
					slot_1231_38_0 = slot_1231_6_0 + slot_1231_36_0 * slot_1231_8_0
					slot_1231_39_0 = slot_1231_4_0 * slot_1231_33_0

					if var_1138_1.bind_muted(slot_1231_31_0) then
						slot_1231_39_0 = slot_1231_39_0 * 0.55
					end

					slot_1231_40_0 = slot_1231_39_0

					if slot_1231_31_0.id == "Double Tap" and slot_1231_19_0 == 2 then
						slot_1231_40_0 = slot_1231_39_0 * (0.5 + var_1138_1.smooth_linear("dt_ovr_p", not var_1138_1.dt_override_dimmed()) * 0.5)
					end

					pcall(function()
						render.text(var_1138_1.FONT_SUB, vector(slot_1231_38_0, slot_1231_37_0), color(255, 255, 255, 255 * slot_1231_40_0), "c", slot_1231_34_0)
					end)

					if slot_1231_31_0.id == "Double Tap" and slot_1231_19_0 ~= 2 then
						var_1138_1.draw_dt_charge_ring(slot_1231_38_0, slot_1231_37_0, slot_1231_4_0 * slot_1231_33_0, slot_1231_36_0)
					end
				end
			end
		end

		if slot_1231_5_0 > 0.01 then
			slot_0_89_0.overlay_drag_paint_hover({
				drag = var_1138_1.drag,
				get_rect = function()
					return var_1138_1.drag_box_metrics(slot_1231_1_0, slot_1231_6_0, slot_1231_7_0, slot_1231_4_0, slot_1231_8_0)
				end
			}, slot_1231_5_0, slot_1231_2_0)
		end
	end

	function var_1138_1.render()
		if type(slot_0_89_0) == "table" and type(slot_0_89_0.hud_dpi_paint_begin) == "function" then
			slot_0_89_0.hud_dpi_hook_install()
			slot_0_89_0.hud_dpi_paint_begin()
			pcall(var_1138_1.render_draw)
			slot_0_89_0.hud_dpi_paint_end()

			return
		end

		pcall(var_1138_1.render_draw)
	end

	return var_1138_1
end)()
slot_0_78_0.hud_chi_tick = chi.overlay_tick
slot_0_89_0 = {
	WM_KILL_FLASH_DUR = 0.4,
	WM_LOGO_URL = "https://amnesia.plus/logotype.png",
	WM_LOGO_PATH = "amnesia.plus/logotype.png",
	HUD_FADE_RATE = 10,
	WM_BRAND_TEXT = "·.·★amnesia★·.·",
	WM_BOTTOM_MARGIN = 10,
	store = {
		slots = {}
	},
	ext = {}
}

function slot_0_89_0.hud_dpi_enabled()
	local var_1236_0 = slot_0_152_0.vars and slot_0_152_0.vars.hud_style and slot_0_152_0.vars.hud_style.dpi_scale

	if not var_1236_0 or type(var_1236_0.get) ~= "function" then
		return false
	end

	local var_1236_1, var_1236_2 = pcall(function()
		return var_1236_0:get()
	end)

	return var_1236_1 and var_1236_2 == true
end

function slot_0_89_0.hud_dpi_update()
	local var_1238_0 = 1

	if slot_0_89_0.hud_dpi_enabled() then
		pcall(function()
			var_1238_0 = render.get_scale(2) or 1
		end)

		if var_1238_0 <= 0 then
			var_1238_0 = 1
		end
	end

	slot_0_78_0.hud_dpi = var_1238_0
	slot_0_78_0.hud_dpi_suffix = slot_0_89_0.hud_dpi_enabled() and "s" or ""
end

function slot_0_89_0.dpi()
	return slot_0_78_0.hud_dpi or 1
end

function slot_0_89_0.ds(arg_1241_0)
	local var_1241_0 = slot_0_89_0.dpi()

	if var_1241_0 == 1 then
		return tonumber(arg_1241_0) or 0
	end

	return (tonumber(arg_1241_0) or 0) * var_1241_0
end

function slot_0_89_0.dv(arg_1242_0)
	if not arg_1242_0 then
		return vector(0, 0)
	end

	local var_1242_0 = slot_0_89_0.dpi()

	if var_1242_0 == 1 then
		return arg_1242_0
	end

	return vector(arg_1242_0.x * var_1242_0, arg_1242_0.y * var_1242_0)
end

function slot_0_89_0.hud_dpi_active()
	return slot_0_78_0.hud_dpi_paint == true and slot_0_89_0.dpi() ~= 1
end

function slot_0_89_0.hud_mouse_pos()
	local var_1244_0 = vector(0, 0)

	pcall(function()
		var_1244_0 = ui.get_mouse_position()
	end)

	if slot_0_89_0.hud_dpi_active() then
		local var_1244_1 = slot_0_89_0.dpi()

		return vector(var_1244_0.x / var_1244_1, var_1244_0.y / var_1244_1)
	end

	return var_1244_0
end

function slot_0_89_0.hud_dpi_paint_begin()
	slot_0_89_0.hud_dpi_update()

	slot_0_78_0.hud_dpi_paint_depth = (slot_0_78_0.hud_dpi_paint_depth or 0) + 1
	slot_0_78_0.hud_dpi_paint = true
end

function slot_0_89_0.hud_dpi_paint_end()
	slot_0_78_0.hud_dpi_paint_depth = math.max(0, (slot_0_78_0.hud_dpi_paint_depth or 1) - 1)
	slot_0_78_0.hud_dpi_paint = slot_0_78_0.hud_dpi_paint_depth > 0
end

function slot_0_89_0.hud_dpi_hook_install()
	if slot_0_78_0.hud_dpi_hooked then
		return
	end

	slot_0_78_0.hud_dpi_hooked = true

	local var_1248_0 = {
		text = render.text,
		texture = render.texture,
		rect = render.rect,
		rect_outline = render.rect_outline,
		gradient = render.gradient,
		line = render.line,
		shadow = render.shadow,
		blur = render.blur,
		circle = render.circle,
		circle_outline = render.circle_outline,
		measure_text = render.measure_text,
		screen_size = render.screen_size
	}

	local function var_1248_1()
		return slot_0_89_0.hud_dpi_active()
	end

	local function var_1248_2()
		return slot_0_89_0.dpi()
	end

	local function var_1248_3(arg_1251_0)
		if not var_1248_1() or not arg_1251_0 then
			return arg_1251_0
		end

		return vector(arg_1251_0.x * var_1248_2(), arg_1251_0.y * var_1248_2())
	end

	local function var_1248_4(arg_1252_0)
		if not var_1248_1() then
			return arg_1252_0
		end

		return (tonumber(arg_1252_0) or 0) * var_1248_2()
	end

	local function var_1248_5(arg_1253_0)
		if not slot_0_89_0.hud_dpi_enabled() then
			return arg_1253_0
		end

		local var_1253_0 = slot_0_78_0.hud_dpi_suffix or ""

		if var_1253_0 == "" then
			return arg_1253_0
		end

		if type(arg_1253_0) == "string" and arg_1253_0 ~= "" then
			return arg_1253_0 .. var_1253_0
		end

		return var_1253_0
	end

	function render.text(arg_1254_0, arg_1254_1, arg_1254_2, arg_1254_3, arg_1254_4, ...)
		return var_1248_0.text(arg_1254_0, var_1248_3(arg_1254_1), arg_1254_2, var_1248_5(arg_1254_3), arg_1254_4, ...)
	end

	function render.texture(arg_1255_0, arg_1255_1, arg_1255_2, arg_1255_3, ...)
		return var_1248_0.texture(arg_1255_0, var_1248_3(arg_1255_1), arg_1255_2 and var_1248_3(arg_1255_2) or arg_1255_2, arg_1255_3, ...)
	end

	function render.rect(arg_1256_0, arg_1256_1, arg_1256_2, arg_1256_3, ...)
		return var_1248_0.rect(var_1248_3(arg_1256_0), var_1248_3(arg_1256_1), arg_1256_2, type(arg_1256_3) == "number" and var_1248_4(arg_1256_3) or arg_1256_3, ...)
	end

	function render.rect_outline(arg_1257_0, arg_1257_1, arg_1257_2, arg_1257_3, arg_1257_4, ...)
		return var_1248_0.rect_outline(var_1248_3(arg_1257_0), var_1248_3(arg_1257_1), arg_1257_2, var_1248_4(arg_1257_3), type(arg_1257_4) == "number" and var_1248_4(arg_1257_4) or arg_1257_4, ...)
	end

	function render.gradient(arg_1258_0, arg_1258_1, arg_1258_2, arg_1258_3, arg_1258_4, arg_1258_5, arg_1258_6)
		return var_1248_0.gradient(var_1248_3(arg_1258_0), var_1248_3(arg_1258_1), arg_1258_2, arg_1258_3, arg_1258_4, arg_1258_5, arg_1258_6)
	end

	function render.line(arg_1259_0, arg_1259_1, arg_1259_2, arg_1259_3)
		return var_1248_0.line(var_1248_3(arg_1259_0), var_1248_3(arg_1259_1), arg_1259_2, var_1248_4(arg_1259_3))
	end

	function render.shadow(arg_1260_0, arg_1260_1, arg_1260_2, arg_1260_3, arg_1260_4, arg_1260_5)
		return var_1248_0.shadow(var_1248_3(arg_1260_0), var_1248_3(arg_1260_1), arg_1260_2, var_1248_4(arg_1260_3), arg_1260_4 and var_1248_4(arg_1260_4) or arg_1260_4, type(arg_1260_5) == "number" and var_1248_4(arg_1260_5) or arg_1260_5)
	end

	function render.blur(arg_1261_0, arg_1261_1, arg_1261_2, arg_1261_3, arg_1261_4)
		return var_1248_0.blur(var_1248_3(arg_1261_0), var_1248_3(arg_1261_1), var_1248_4(arg_1261_2), arg_1261_3, type(arg_1261_4) == "number" and var_1248_4(arg_1261_4) or arg_1261_4)
	end

	function render.circle(arg_1262_0, arg_1262_1, arg_1262_2, arg_1262_3, arg_1262_4)
		return var_1248_0.circle(var_1248_3(arg_1262_0), arg_1262_1, var_1248_4(arg_1262_2), arg_1262_3, arg_1262_4)
	end

	function render.circle_outline(arg_1263_0, arg_1263_1, arg_1263_2, arg_1263_3, arg_1263_4, arg_1263_5)
		return var_1248_0.circle_outline(var_1248_3(arg_1263_0), arg_1263_1, var_1248_4(arg_1263_2), arg_1263_3, arg_1263_4, var_1248_4(arg_1263_5))
	end

	function render.measure_text(arg_1264_0, arg_1264_1, arg_1264_2)
		local var_1264_0 = var_1248_0.measure_text(arg_1264_0, var_1248_5(arg_1264_1), arg_1264_2)

		if var_1248_1() and var_1264_0 then
			local var_1264_1 = var_1248_2()

			return vector(var_1264_0.x / var_1264_1, var_1264_0.y / var_1264_1)
		end

		return var_1264_0
	end

	function render.screen_size()
		local var_1265_0 = var_1248_0.screen_size()

		if var_1248_1() then
			local var_1265_1 = var_1248_2()

			return vector(var_1265_0.x / var_1265_1, var_1265_0.y / var_1265_1)
		end

		return var_1265_0
	end
end

function slot_0_89_0.hud_fade(arg_1266_0, arg_1266_1)
	slot_0_78_0.hud_fade_mix = slot_0_78_0.hud_fade_mix or {}

	local var_1266_0 = tostring(arg_1266_0 or "default")
	local var_1266_1 = slot_0_78_0.hud_fade_mix[var_1266_0] or 0
	local var_1266_2

	if type(arg_1266_1) == "boolean" then
		var_1266_2 = arg_1266_1 and 1 or 0
	else
		var_1266_2 = math.max(0, math.min(1, tonumber(arg_1266_1) or 0))
	end

	local var_1266_3 = math.min(1, (globals.frametime or 0.016) * slot_0_89_0.HUD_FADE_RATE)
	local var_1266_4 = var_1266_1 + (var_1266_2 - var_1266_1) * var_1266_3

	if math.abs(var_1266_2 - var_1266_4) < 0.002 then
		var_1266_4 = var_1266_2
	end

	slot_0_78_0.hud_fade_mix[var_1266_0] = var_1266_4

	return var_1266_4
end

function slot_0_89_0.hud_anim(arg_1267_0, arg_1267_1, arg_1267_2, arg_1267_3)
	slot_0_78_0.hud_fade_mix = slot_0_78_0.hud_fade_mix or {}

	local var_1267_0 = tostring(arg_1267_0 or "default")
	local var_1267_1 = slot_0_78_0.hud_fade_mix[var_1267_0] or 0
	local var_1267_2

	if type(arg_1267_1) == "boolean" then
		var_1267_2 = arg_1267_1 and 1 or 0
	else
		var_1267_2 = math.max(0, math.min(1, tonumber(arg_1267_1) or 0))
	end

	arg_1267_2 = tonumber(arg_1267_2) or slot_0_89_0.HUD_FADE_RATE
	arg_1267_3 = tonumber(arg_1267_3) or slot_0_89_0.HUD_FADE_RATE

	local var_1267_3 = var_1267_1 < var_1267_2 and arg_1267_2 or arg_1267_3
	local var_1267_4 = math.min(1, (globals.frametime or 0.016) * var_1267_3)
	local var_1267_5 = var_1267_1 + (var_1267_2 - var_1267_1) * var_1267_4

	if math.abs(var_1267_2 - var_1267_5) < 0.002 then
		var_1267_5 = var_1267_2
	end

	slot_0_78_0.hud_fade_mix[var_1267_0] = var_1267_5

	return var_1267_5
end

function slot_0_89_0.anim_ease_out_back(arg_1268_0)
	arg_1268_0 = math.max(0, math.min(1, tonumber(arg_1268_0) or 0))

	local var_1268_0 = 1.525

	return 1 + (var_1268_0 + 1) * math.pow(arg_1268_0 - 1, 3) + var_1268_0 * math.pow(arg_1268_0 - 1, 2)
end

function slot_0_89_0.anim_ease_in_quad(arg_1269_0)
	arg_1269_0 = math.max(0, math.min(1, tonumber(arg_1269_0) or 0))

	return arg_1269_0 * arg_1269_0
end

function slot_0_89_0.elog_row_motion(arg_1270_0, arg_1270_1, arg_1270_2, arg_1270_3, arg_1270_4)
	arg_1270_0 = math.max(0, math.min(1, tonumber(arg_1270_0) or 0))
	arg_1270_1 = math.max(1, math.floor(tonumber(arg_1270_1) or 1))
	arg_1270_2 = math.max(1, math.floor(tonumber(arg_1270_2) or 1))
	arg_1270_3 = math.max(0, math.min(2, math.floor(tonumber(arg_1270_3) or 0)))

	local var_1270_0 = arg_1270_3 == 2 and 1 or -1

	if arg_1270_3 == 1 then
		var_1270_0 = arg_1270_1 % 2 == 0 and 1 or -1
	end

	local var_1270_1 = 0.075
	local var_1270_2 = math.max(0.22, 1 - (arg_1270_2 - 1) * var_1270_1 * 0.55)
	local var_1270_3 = arg_1270_4 and arg_1270_2 - arg_1270_1 + 1 or arg_1270_1
	local var_1270_4 = math.max(0, math.min(1, (arg_1270_0 - (var_1270_3 - 1) * var_1270_1) / var_1270_2))
	local var_1270_5 = arg_1270_4 and var_1270_4 or slot_0_89_0.anim_ease_out_back(var_1270_4)
	local var_1270_6 = math.max(0, math.min(1, var_1270_5))

	return {
		alpha = var_1270_4,
		slide_x = (1 - var_1270_6) * 26 * var_1270_0,
		slide_y = (1 - var_1270_6) * 6,
		scale_x = 0.84 + 0.16 * var_1270_6
	}
end

function slot_0_89_0.wm_kill_flash_mix()
	local var_1271_0 = slot_0_78_0.wm_kill_flash or 0

	if var_1271_0 <= 0 then
		return 0
	end

	local var_1271_1 = (globals.frametime or 0.016) / slot_0_89_0.WM_KILL_FLASH_DUR

	slot_0_78_0.wm_kill_flash = math.max(0, var_1271_0 - var_1271_1 * 1.35)

	return var_1271_0
end

function slot_0_89_0.trigger_kill_flash()
	slot_0_78_0.wm_kill_flash = 1
end

function slot_0_89_0.on_local_enemy_kill(arg_1273_0)
	local var_1273_0 = entity.get_local_player()

	if not var_1273_0 then
		return
	end

	local var_1273_1 = entity.get(arg_1273_0.userid, true)
	local var_1273_2 = entity.get(arg_1273_0.attacker, true)

	if not var_1273_1 or not var_1273_2 then
		return
	end

	if var_1273_2 ~= var_1273_0 or var_1273_1 == var_1273_0 then
		return
	end

	local var_1273_3, var_1273_4 = pcall(function()
		return var_1273_1:is_enemy()
	end)

	if var_1273_3 and var_1273_4 then
		slot_0_89_0.trigger_kill_flash()
	end
end

function slot_0_89_0.store_read()
	local var_1275_0 = files.read(slot_0_111_0)

	if not var_1275_0 or var_1275_0 == "" then
		slot_0_89_0.store.slots = {
			wm = {
				align = 2,
				y = 24,
				x = 0
			},
			elog = {
				align = 1,
				_init = true,
				_elog_v2 = true,
				y = 829,
				x = 868
			},
			slowdown = {
				align = 1,
				_init = true,
				_slowdown_v1 = true,
				y = 380,
				x = 900
			},
			keybinds = {
				align = 0,
				_init = true,
				_kb_v1 = true,
				y = 420,
				x = 120
			},
			damage_ind = {
				_dmg_v1 = true,
				y = 0,
				x = 0
			},
			metrics = {
				align = 0,
				_init = true,
				_metrics_v1 = true,
				y = 520,
				x = 24
			}
		}

		return
	end

	local var_1275_1, var_1275_2 = pcall(json.parse, var_1275_0)

	if var_1275_1 and type(var_1275_2) == "table" and type(var_1275_2.slots) == "table" then
		slot_0_89_0.store = var_1275_2

		if type(slot_0_89_0.store.slots.elog) ~= "table" then
			slot_0_89_0.store.slots.elog = {
				align = 1,
				_init = true,
				_elog_v2 = true,
				y = 829,
				x = 868
			}
		end

		if type(slot_0_89_0.store.slots.slowdown) ~= "table" then
			slot_0_89_0.store.slots.slowdown = {
				align = 1,
				_init = true,
				_slowdown_v1 = true,
				y = 380,
				x = 900
			}
		end

		if type(slot_0_89_0.store.slots.keybinds) ~= "table" then
			slot_0_89_0.store.slots.keybinds = {
				align = 0,
				_init = true,
				_kb_v1 = true,
				y = 420,
				x = 120
			}
		end

		if type(slot_0_89_0.store.slots.damage_ind) ~= "table" then
			slot_0_89_0.store.slots.damage_ind = {
				_dmg_v1 = true,
				y = 0,
				x = 0
			}
		end

		if type(slot_0_89_0.store.slots.metrics) ~= "table" then
			slot_0_89_0.store.slots.metrics = {
				align = 0,
				_init = true,
				_metrics_v1 = true,
				y = 520,
				x = 24
			}
		end
	else
		slot_0_89_0.store.slots = {
			wm = {
				align = 2,
				y = 24,
				x = 0
			},
			elog = {
				align = 1,
				_init = true,
				_elog_v2 = true,
				y = 829,
				x = 868
			},
			slowdown = {
				align = 1,
				_init = true,
				_slowdown_v1 = true,
				y = 380,
				x = 900
			},
			keybinds = {
				align = 0,
				_init = true,
				_kb_v1 = true,
				y = 420,
				x = 120
			},
			damage_ind = {
				_dmg_v1 = true,
				y = 0,
				x = 0
			},
			metrics = {
				align = 0,
				_init = true,
				_metrics_v1 = true,
				y = 520,
				x = 24
			}
		}
	end
end

function slot_0_89_0.store_write()
	pcall(function()
		local var_1277_0, var_1277_1 = pcall(json.stringify, slot_0_89_0.store)

		if var_1277_0 and var_1277_1 then
			files.write(slot_0_111_0, var_1277_1)
		end
	end)
end

function slot_0_89_0.store_slot(arg_1278_0)
	slot_0_89_0.store.slots = slot_0_89_0.store.slots or {}

	local var_1278_0 = slot_0_89_0.store.slots[arg_1278_0]

	if type(var_1278_0) ~= "table" then
		var_1278_0 = {
			align = 2,
			y = 24,
			x = 0
		}
		slot_0_89_0.store.slots[arg_1278_0] = var_1278_0
	end

	var_1278_0.x = tonumber(var_1278_0.x) or 0
	var_1278_0.y = tonumber(var_1278_0.y) or 24

	if arg_1278_0 == "wm" or arg_1278_0 == "elog" or arg_1278_0 == "slowdown" or arg_1278_0 == "keybinds" or arg_1278_0 == "metrics" or arg_1278_0 == "spectators" then
		var_1278_0.align = math.max(0, math.min(2, math.floor(tonumber(var_1278_0.align) or 0)))
	end

	return var_1278_0
end

function slot_0_89_0.ov_sw(arg_1279_0, arg_1279_1)
	if not arg_1279_0 or type(arg_1279_0.get) ~= "function" then
		return arg_1279_1 == true
	end

	local var_1279_0, var_1279_1 = pcall(function()
		return arg_1279_0:get() == true
	end)

	return var_1279_0 and var_1279_1 or false
end

function slot_0_196_0(arg_1281_0, arg_1281_1)
	arg_1281_1 = tonumber(arg_1281_1) or 1

	if type(arg_1281_0) ~= "userdata" and type(arg_1281_0) ~= "table" then
		arg_1281_0 = color(255, 255, 255, 255)
	end

	if type(arg_1281_0) == "table" and arg_1281_0[1] then
		arg_1281_0 = arg_1281_0[1]
	end

	local var_1281_0 = (arg_1281_0.a or 255) / 255

	return color(arg_1281_0.r or 255, arg_1281_0.g or 255, arg_1281_0.b or 255, math.floor(255 * arg_1281_1 * var_1281_0))
end

function slot_0_89_0.hud_style_text_glow_colors(arg_1282_0, arg_1282_1)
	arg_1282_1 = arg_1282_1 or "bw"

	local var_1282_0 = slot_0_152_0.vars and slot_0_152_0.vars.hud_style
	local var_1282_1 = color(255, 255, 255, 255)
	local var_1282_2 = color(255, 255, 255, 255)

	if not var_1282_0 then
		return slot_0_196_0(var_1282_1, arg_1282_0), slot_0_196_0(var_1282_1, arg_1282_0), slot_0_196_0(var_1282_2, arg_1282_0)
	end

	local var_1282_3 = var_1282_0[arg_1282_1 .. "_unified"]
	local var_1282_4 = var_1282_0[arg_1282_1 .. "_color"]
	local var_1282_5 = var_1282_0[arg_1282_1 .. "_text"]
	local var_1282_6 = var_1282_0[arg_1282_1 .. "_glow"]
	local var_1282_7 = false

	pcall(function()
		var_1282_7 = var_1282_3 and var_1282_3:get() == true
	end)

	if var_1282_7 and var_1282_4 then
		local var_1282_8, var_1282_9 = pcall(function()
			return var_1282_4:get()
		end)

		if var_1282_8 and var_1282_9 then
			var_1282_1 = var_1282_9
			var_1282_2 = var_1282_9
		end
	else
		if var_1282_5 then
			local var_1282_10, var_1282_11 = pcall(function()
				return var_1282_5:get()
			end)

			if var_1282_10 and var_1282_11 then
				var_1282_1 = var_1282_11
			end
		end

		if var_1282_6 then
			local var_1282_12, var_1282_13 = pcall(function()
				return var_1282_6:get()
			end)

			if var_1282_12 and var_1282_13 then
				var_1282_2 = var_1282_13
			end
		end
	end

	local var_1282_14 = slot_0_196_0(var_1282_1, arg_1282_0)
	local var_1282_15 = slot_0_196_0(var_1282_1, arg_1282_0)

	if not var_1282_7 then
		local var_1282_16 = color(math.floor((var_1282_1.r or 255) * 0.86), math.floor((var_1282_1.g or 255) * 0.86), math.floor((var_1282_1.b or 255) * 0.86), var_1282_1.a or 255)

		var_1282_15 = slot_0_196_0(var_1282_16, arg_1282_0)
	end

	return var_1282_14, var_1282_15, slot_0_196_0(var_1282_2, arg_1282_0)
end

function slot_0_89_0.bottom_wm_style_colors(arg_1287_0)
	return slot_0_89_0.hud_style_text_glow_colors(arg_1287_0, "bw")
end

function slot_0_89_0.chi_style_colors(arg_1288_0)
	return slot_0_89_0.hud_style_text_glow_colors(arg_1288_0, "chi")
end

function slot_0_89_0.hud_style_mode()
	local var_1289_0 = "Default"

	if slot_0_152_0.vars and slot_0_152_0.vars.hud_style and slot_0_152_0.vars.hud_style.stripe_mode then
		local var_1289_1, var_1289_2 = pcall(function()
			return slot_0_152_0.vars.hud_style.stripe_mode:get()
		end)

		if var_1289_1 and type(var_1289_2) == "string" and var_1289_2 ~= "" then
			var_1289_0 = var_1289_2
		end
	end

	return var_1289_0
end

function slot_0_89_0.hud_widget_style()
	local var_1291_0 = slot_0_152_0.vars and slot_0_152_0.vars.hud_style and slot_0_152_0.vars.hud_style.widget_style

	if not var_1291_0 or type(var_1291_0.get) ~= "function" then
		return "Lined"
	end

	local var_1291_1, var_1291_2 = pcall(function()
		return var_1291_0:get()
	end)

	if var_1291_1 then
		if type(var_1291_2) == "number" then
			return var_1291_2 == 2 and "Minimalistic" or "Lined"
		end

		if type(var_1291_2) == "string" and var_1291_2 ~= "" then
			if var_1291_2:find("Minimal", 1, true) then
				return "Minimalistic"
			end

			if var_1291_2:find("Lined", 1, true) then
				return "Lined"
			end
		end
	end

	local var_1291_3, var_1291_4 = pcall(function()
		return var_1291_0:get(2)
	end)

	if var_1291_3 and (var_1291_4 == true or var_1291_4 == 1) then
		return "Minimalistic"
	end

	return "Lined"
end

function slot_0_89_0.hud_widget_radius()
	if slot_0_89_0.hud_widget_style() == "Minimalistic" then
		return 10
	end

	return 4
end

function slot_0_89_0.hud_widget_stripe_enabled()
	return slot_0_89_0.hud_widget_style() ~= "Minimalistic"
end

function slot_0_89_0.hud_minimal_outline_enabled()
	if slot_0_89_0.hud_widget_style() ~= "Minimalistic" then
		return false
	end

	local var_1296_0 = slot_0_152_0.vars and slot_0_152_0.vars.hud_style and slot_0_152_0.vars.hud_style.minimal_outline

	if not var_1296_0 or type(var_1296_0.get) ~= "function" then
		return true
	end

	local var_1296_1, var_1296_2 = pcall(function()
		return var_1296_0:get()
	end)

	return var_1296_1 and var_1296_2 == true
end

function slot_0_89_0.hud_accent_color(arg_1298_0)
	arg_1298_0 = tonumber(arg_1298_0) or 1

	local var_1298_0 = math.floor(255 * arg_1298_0)
	local var_1298_1 = slot_0_89_0.hud_style_mode()

	if var_1298_1 == "Accent" then
		local var_1298_2, var_1298_3 = pcall(ui.get_style, "Link Active")

		if var_1298_2 and var_1298_3 then
			return color(var_1298_3.r, var_1298_3.g, var_1298_3.b, var_1298_0)
		end
	elseif var_1298_1 == "Custom" then
		local var_1298_4 = color(255, 255, 255, 255)

		if slot_0_152_0.vars and slot_0_152_0.vars.hud_style and slot_0_152_0.vars.hud_style.stripe_custom then
			local var_1298_5, var_1298_6 = pcall(function()
				return slot_0_152_0.vars.hud_style.stripe_custom:get()
			end)

			if var_1298_5 and var_1298_6 then
				var_1298_4 = var_1298_6
			end
		end

		local var_1298_7 = (var_1298_4.a or 255) / 255

		return color(var_1298_4.r, var_1298_4.g, var_1298_4.b, math.floor(var_1298_0 * var_1298_7))
	end

	return color(255, 255, 255, var_1298_0)
end

function slot_0_89_0.hud_accent_markup(arg_1300_0)
	local var_1300_0 = slot_0_89_0.hud_accent_color(arg_1300_0)

	return string.format("\a%02X%02X%02X%02X", var_1300_0.r, var_1300_0.g, var_1300_0.b, var_1300_0.a or 255)
end

function slot_0_89_0.hud_stripe_edge_colors(arg_1301_0)
	arg_1301_0 = tonumber(arg_1301_0) or 1

	local var_1301_0 = math.floor(220 * arg_1301_0)
	local var_1301_1 = math.floor(150 * arg_1301_0)
	local var_1301_2 = slot_0_89_0.hud_style_mode()

	if var_1301_2 == "Accent" then
		local var_1301_3, var_1301_4 = pcall(ui.get_style, "Link Active")

		if var_1301_3 and var_1301_4 then
			local var_1301_5 = var_1301_4

			if type(var_1301_4.lerp) == "function" then
				var_1301_5 = var_1301_4:lerp(color(0, 0, 0, 255), 0.4)
			end

			return color(var_1301_4.r, var_1301_4.g, var_1301_4.b, var_1301_0), color(var_1301_5.r, var_1301_5.g, var_1301_5.b, var_1301_1)
		end
	elseif var_1301_2 == "Custom" then
		local var_1301_6 = color(255, 255, 255, 255)

		if slot_0_152_0.vars and slot_0_152_0.vars.hud_style and slot_0_152_0.vars.hud_style.stripe_custom then
			local var_1301_7, var_1301_8 = pcall(function()
				return slot_0_152_0.vars.hud_style.stripe_custom:get()
			end)

			if var_1301_7 and var_1301_8 then
				var_1301_6 = var_1301_8
			end
		end

		local var_1301_9 = (var_1301_6.a or 255) / 255

		return color(var_1301_6.r, var_1301_6.g, var_1301_6.b, math.floor(var_1301_0 * var_1301_9)), color(var_1301_6.r, var_1301_6.g, var_1301_6.b, math.floor(var_1301_1 * var_1301_9))
	end

	return color(255, 255, 255, var_1301_0), color(255, 255, 255, var_1301_1)
end

function slot_0_89_0.ensure_hud_corners()
	if slot_0_89_0._hud_corners and slot_0_89_0._hud_corners.l then
		return slot_0_89_0._hud_corners.l, slot_0_89_0._hud_corners.r
	end

	slot_0_89_0._hud_corners = slot_0_89_0._hud_corners or {}

	pcall(function()
		slot_0_89_0._hud_corners.l = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M0 6V4c0-2 2-4 4-4v2C2 2 0 4 0 6Z\"/></svg>", vector(8, 12))
		slot_0_89_0._hud_corners.r = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M4 6c0-2-2-4-4-4V0c2 0 4 2 4 4v2Z\"/></svg>", vector(8, 12))
	end)

	return slot_0_89_0._hud_corners.l, slot_0_89_0._hud_corners.r
end

function slot_0_89_0.hud_minimal_stroke_color(arg_1305_0, arg_1305_1)
	arg_1305_1 = tonumber(arg_1305_1) or 0.52

	local var_1305_0 = slot_0_89_0.hud_accent_color(arg_1305_0)
	local var_1305_1 = math.floor((var_1305_0.a or 255) * arg_1305_1)

	if var_1305_1 < 1 then
		var_1305_1 = 1
	end

	return color(var_1305_0.r, var_1305_0.g, var_1305_0.b, var_1305_1)
end

function slot_0_89_0.hud_blur_enabled()
	local var_1306_0 = slot_0_152_0.vars and slot_0_152_0.vars.hud_style and slot_0_152_0.vars.hud_style.blur

	if not var_1306_0 or type(var_1306_0.get) ~= "function" then
		return true
	end

	local var_1306_1, var_1306_2 = pcall(function()
		return var_1306_0:get()
	end)

	if not var_1306_1 then
		return true
	end

	return var_1306_2 ~= false
end

function slot_0_89_0.paint_hud_card_bg(arg_1308_0, arg_1308_1, arg_1308_2, arg_1308_3, arg_1308_4, arg_1308_5)
	arg_1308_5 = arg_1308_5 or {}

	if arg_1308_2 <= 0.001 then
		return
	end

	local var_1308_0 = tonumber(arg_1308_0.x)
	local var_1308_1 = tonumber(arg_1308_0.y)
	local var_1308_2 = tonumber(arg_1308_1.x)
	local var_1308_3 = tonumber(arg_1308_1.y)

	if not var_1308_0 or not var_1308_1 or not var_1308_2 or not var_1308_3 or var_1308_2 <= var_1308_0 + 2 or var_1308_3 <= var_1308_1 + 1 then
		return
	end

	local var_1308_4 = tonumber(arg_1308_5.radius) or slot_0_89_0.hud_widget_radius()

	if arg_1308_2 >= 0.04 and slot_0_89_0.hud_blur_enabled() then
		pcall(function()
			render.blur(arg_1308_0, arg_1308_1, 1, 1, var_1308_4)
		end)
	end

	local var_1308_5 = tonumber(arg_1308_5.bg_alpha) or 140

	pcall(function()
		render.rect(arg_1308_0, arg_1308_1, color(0, 0, 0, math.floor(var_1308_5 * arg_1308_2)), var_1308_4)
	end)

	if arg_1308_5.stripe ~= false and slot_0_89_0.hud_widget_stripe_enabled() then
		if not arg_1308_3 or not arg_1308_4 then
			arg_1308_3, arg_1308_4 = slot_0_89_0.ensure_hud_corners()
		end

		if var_1308_2 - var_1308_0 > 8 then
			slot_0_89_0.paint_hud_stripe_edge(var_1308_0, var_1308_1, var_1308_2, arg_1308_2, arg_1308_3, arg_1308_4)
		end
	end

	if slot_0_89_0.hud_widget_style() == "Minimalistic" and slot_0_89_0.hud_minimal_outline_enabled() then
		pcall(function()
			render.rect_outline(arg_1308_0, arg_1308_1, slot_0_89_0.hud_minimal_stroke_color(arg_1308_2), 1, var_1308_4)
		end)
	elseif slot_0_89_0.hud_widget_style() ~= "Minimalistic" then
		local var_1308_6 = math.floor(38 * arg_1308_2)

		if var_1308_6 > 0 then
			pcall(function()
				render.rect_outline(arg_1308_0, arg_1308_1, color(255, 255, 255, var_1308_6), 1, var_1308_4)
			end)
		end
	end
end

function slot_0_89_0.paint_hud_stripe_edge(arg_1313_0, arg_1313_1, arg_1313_2, arg_1313_3, arg_1313_4, arg_1313_5)
	if arg_1313_2 - arg_1313_0 <= 8 or arg_1313_3 <= 0.001 then
		return
	end

	local var_1313_0, var_1313_1 = slot_0_89_0.hud_stripe_edge_colors(arg_1313_3)
	local var_1313_2 = color(var_1313_0.r, var_1313_0.g, var_1313_0.b, math.floor((var_1313_0.a or 255) * 0.82))
	local var_1313_3 = color(var_1313_1.r, var_1313_1.g, var_1313_1.b, math.floor((var_1313_1.a or 255) * 0.72))

	pcall(function()
		render.gradient(vector(arg_1313_0 + 4, arg_1313_1 - 1), vector(arg_1313_2 - 4, arg_1313_1 + 1), var_1313_2, var_1313_3, var_1313_2, var_1313_3)
	end)

	if arg_1313_4 then
		pcall(function()
			render.texture(arg_1313_4, vector(arg_1313_0, arg_1313_1 - 1), vector(4, 6), var_1313_2, "f")
		end)
	end

	if arg_1313_5 then
		pcall(function()
			render.texture(arg_1313_5, vector(arg_1313_2 - 4, arg_1313_1 - 1), vector(4, 6), var_1313_3, "f")
		end)
	end
end

function slot_0_89_0.hud_widget_use_arc_divider()
	return slot_0_89_0.hud_widget_style() == "Minimalistic"
end

function slot_0_89_0.paint_hud_divider_line(arg_1318_0, arg_1318_1, arg_1318_2, arg_1318_3)
	arg_1318_3 = tonumber(arg_1318_3) or 1

	if arg_1318_3 <= 0.001 then
		return
	end

	arg_1318_1 = tonumber(arg_1318_1) or 0
	arg_1318_2 = tonumber(arg_1318_2) or arg_1318_1

	if arg_1318_2 <= arg_1318_1 + 1 then
		return
	end

	arg_1318_0 = tonumber(arg_1318_0) or 0

	local var_1318_0 = slot_0_89_0.hud_minimal_stroke_color(arg_1318_3, 0.48)

	pcall(function()
		render.line(vector(arg_1318_0, arg_1318_1), vector(arg_1318_0, arg_1318_2), var_1318_0)
	end)
end

function slot_0_89_0.paint_hud_divider_arc(arg_1320_0, arg_1320_1, arg_1320_2, arg_1320_3, arg_1320_4)
	arg_1320_3 = tonumber(arg_1320_3) or 1

	if arg_1320_3 <= 0.001 then
		return
	end

	arg_1320_1 = tonumber(arg_1320_1) or 0
	arg_1320_2 = tonumber(arg_1320_2) or arg_1320_1

	if arg_1320_2 <= arg_1320_1 + 2 then
		return
	end

	arg_1320_0 = tonumber(arg_1320_0) or 0

	local var_1320_0 = (arg_1320_1 + arg_1320_2) * 0.5
	local var_1320_1 = arg_1320_2 - arg_1320_1
	local var_1320_2 = math.max(1, math.min(2, var_1320_1 * 0.05))
	local var_1320_3 = arg_1320_4 == true and arg_1320_0 - var_1320_2 or arg_1320_0 + var_1320_2
	local var_1320_4 = slot_0_89_0.hud_minimal_stroke_color(arg_1320_3, 0.48)
	local var_1320_5 = 12

	pcall(function()
		for iter_1321_0 = 0, var_1320_5 - 1 do
			local var_1321_0 = iter_1321_0 / var_1320_5
			local var_1321_1 = (iter_1321_0 + 1) / var_1320_5

			local function var_1321_2(arg_1322_0)
				local var_1322_0 = 1 - arg_1322_0
				local var_1322_1 = var_1322_0 * var_1322_0 * arg_1320_0 + 2 * var_1322_0 * arg_1322_0 * var_1320_3 + arg_1322_0 * arg_1322_0 * arg_1320_0
				local var_1322_2 = var_1322_0 * var_1322_0 * arg_1320_1 + 2 * var_1322_0 * arg_1322_0 * var_1320_0 + arg_1322_0 * arg_1322_0 * arg_1320_2

				return var_1322_1, var_1322_2
			end

			local var_1321_3, var_1321_4 = var_1321_2(var_1321_0)
			local var_1321_5, var_1321_6 = var_1321_2(var_1321_1)

			render.line(vector(var_1321_3, var_1321_4), vector(var_1321_5, var_1321_6), var_1320_4)
		end
	end)
end

function slot_0_89_0.wm_brand_alpha()
	return 1
end

function slot_0_89_0.paint_bottom_watermark(arg_1324_0, arg_1324_1)
	local var_1324_0 = slot_0_89_0.wm_brand_alpha()

	if var_1324_0 <= 0.001 then
		return
	end

	local var_1324_1, var_1324_2, var_1324_3 = slot_0_89_0.bottom_wm_style_colors(var_1324_0)

	chi.draw_header(arg_1324_0.x * 0.5, arg_1324_0.y - slot_0_89_0.WM_BOTTOM_MARGIN, slot_0_89_0.WM_BRAND_TEXT, var_1324_0, 0, arg_1324_1 or 0, {
		c1 = var_1324_1,
		c2 = var_1324_2,
		glow = var_1324_3
	})
end

function slot_0_89_0.point_in_rect(arg_1325_0, arg_1325_1, arg_1325_2, arg_1325_3, arg_1325_4, arg_1325_5)
	return arg_1325_2 <= arg_1325_0 and arg_1325_0 <= arg_1325_2 + arg_1325_4 and arg_1325_3 <= arg_1325_1 and arg_1325_1 <= arg_1325_3 + arg_1325_5
end

slot_0_89_0._scr_cache_tick = slot_0_89_0._scr_cache_tick or -1

function slot_0_89_0.screen_size_cached()
	local var_1326_0 = globals.tickcount or 0

	if slot_0_89_0._scr_cache_tick ~= var_1326_0 or not slot_0_89_0._scr_cache then
		slot_0_89_0._scr_cache_tick = var_1326_0
		slot_0_89_0._scr_cache = render.screen_size()
	end

	return slot_0_89_0._scr_cache
end

slot_0_89_0._measure_cache = slot_0_89_0._measure_cache or {}
slot_0_89_0._measure_cache_tick = slot_0_89_0._measure_cache_tick or -1

function slot_0_89_0.measure_cached(arg_1327_0, arg_1327_1)
	arg_1327_1 = tostring(arg_1327_1 or "")

	local var_1327_0 = globals.tickcount or 0

	if slot_0_89_0._measure_cache_tick ~= var_1327_0 then
		slot_0_89_0._measure_cache_tick = var_1327_0
		slot_0_89_0._measure_cache = {}
	end

	local var_1327_1 = tostring(arg_1327_0) .. "\x00" .. arg_1327_1
	local var_1327_2 = slot_0_89_0._measure_cache[var_1327_1]

	if var_1327_2 then
		return var_1327_2[1], var_1327_2[2]
	end

	local var_1327_3
	local var_1327_4
	local var_1327_5, var_1327_6 = pcall(function()
		return render.measure_text(arg_1327_0, nil, arg_1327_1)
	end)

	if var_1327_5 and var_1327_6 and type(var_1327_6.x) == "number" and type(var_1327_6.y) == "number" then
		var_1327_3, var_1327_4 = var_1327_6.x, var_1327_6.y
	else
		var_1327_3, var_1327_4 = #arg_1327_1 * 7, 12
	end

	slot_0_89_0._measure_cache[var_1327_1] = {
		var_1327_3,
		var_1327_4
	}

	return var_1327_3, var_1327_4
end

function slot_0_89_0.overlay_drag_clear(arg_1329_0, arg_1329_1)
	if type(arg_1329_0) ~= "table" then
		return
	end

	if slot_0_78_0.ov_drag_owner == arg_1329_0 then
		slot_0_78_0.ov_drag_owner = nil
		slot_0_78_0.ov_drag_active = false
	end

	arg_1329_0.grab = nil
	arg_1329_0.ready = nil
	arg_1329_0.init = nil
	arg_1329_0.point = nil
	arg_1329_0.draw_align = nil
	arg_1329_0.active = false
	arg_1329_0.hover = false
	arg_1329_0.aligning = nil
	arg_1329_0._vx = nil
	arg_1329_0._vy = nil
	arg_1329_0._lmb_prev = false

	if arg_1329_1 == true then
		arg_1329_0._ov_anim = nil
	end
end

function slot_0_89_0.ov_drag_anim_step(arg_1330_0, arg_1330_1, arg_1330_2, arg_1330_3, arg_1330_4)
	if type(arg_1330_0) ~= "table" then
		return 0
	end

	arg_1330_0._ov_anim = arg_1330_0._ov_anim or {}

	local var_1330_0 = arg_1330_0._ov_anim[arg_1330_1] or 0

	arg_1330_2 = tonumber(arg_1330_2) or 0
	arg_1330_3 = tonumber(arg_1330_3) or 14
	arg_1330_4 = tonumber(arg_1330_4) or arg_1330_3

	local var_1330_1 = var_1330_0 < arg_1330_2 and arg_1330_3 or arg_1330_4
	local var_1330_2 = globals.frametime or 0.016
	local var_1330_3 = var_1330_0 + (arg_1330_2 - var_1330_0) * math.min(1, var_1330_2 * var_1330_1)

	if math.abs(arg_1330_2 - var_1330_3) < 0.002 then
		var_1330_3 = arg_1330_2
	end

	arg_1330_0._ov_anim[arg_1330_1] = var_1330_3

	return var_1330_3
end

function slot_0_89_0.overlay_drag_captures_mouse(arg_1331_0, arg_1331_1)
	if arg_1331_1 <= 0.01 or type(arg_1331_0) ~= "table" then
		return false
	end

	return arg_1331_0.active == true or arg_1331_0.hover == true
end

function slot_0_89_0.overlay_menu_blocks_mouse()
	if (ui.get_alpha() or 0) <= 0.01 then
		return false
	end

	if common.is_button_down(1) == true then
		return true
	end

	return slot_0_78_0.ov_drag_capture == true or slot_0_78_0.ov_wm_mouse_block == true or slot_0_78_0.ov_elog_mouse_block == true or slot_0_78_0.ov_slowdown_mouse_block == true or slot_0_78_0.ov_keybinds_mouse_block == true or slot_0_78_0.ov_damage_ind_mouse_block == true or slot_0_78_0.ov_metrics_mouse_block == true or slot_0_78_0.ov_spectators_mouse_block == true or slot_0_78_0.chi_mouse_block == true
end

function slot_0_89_0.overlay_suppress_attack(arg_1333_0)
	if not arg_1333_0 or not slot_0_89_0.overlay_menu_blocks_mouse() then
		return
	end

	arg_1333_0.in_attack = false
	arg_1333_0.in_attack2 = false
end

function slot_0_89_0.snap_center_to_guides(arg_1334_0, arg_1334_1, arg_1334_2, arg_1334_3)
	local var_1334_0 = 11
	local var_1334_1 = arg_1334_0
	local var_1334_2 = arg_1334_1

	if arg_1334_3 ~= "y" then
		for iter_1334_0, iter_1334_1 in ipairs({
			arg_1334_2.x * 0.5,
			arg_1334_2.x / 3,
			arg_1334_2.x * 2 / 3
		}) do
			if var_1334_0 > math.abs(arg_1334_0 - iter_1334_1) then
				var_1334_1 = iter_1334_1
			end
		end
	end

	if arg_1334_3 ~= "x" then
		for iter_1334_2, iter_1334_3 in ipairs({
			24,
			arg_1334_2.y * 0.5,
			arg_1334_2.y - 24
		}) do
			if var_1334_0 > math.abs(arg_1334_1 - iter_1334_3) then
				var_1334_2 = iter_1334_3
			end
		end
	end

	return var_1334_1, var_1334_2
end

function slot_0_89_0.snap_box_to_guides(arg_1335_0, arg_1335_1, arg_1335_2, arg_1335_3)
	local var_1335_0 = 11
	local var_1335_1 = arg_1335_0.x
	local var_1335_2 = arg_1335_0.y
	local var_1335_3 = arg_1335_0.x + arg_1335_1.x * 0.5
	local var_1335_4 = arg_1335_0.y + arg_1335_1.y * 0.5
	local var_1335_5 = arg_1335_0.y
	local var_1335_6 = arg_1335_0.y + arg_1335_1.y
	local var_1335_7 = 24

	if arg_1335_3 ~= "y" then
		for iter_1335_0, iter_1335_1 in ipairs({
			arg_1335_2.x * 0.5,
			arg_1335_2.x / 3,
			arg_1335_2.x * 2 / 3
		}) do
			if var_1335_0 > math.abs(var_1335_3 - iter_1335_1) then
				var_1335_1 = iter_1335_1 - arg_1335_1.x * 0.5
			end
		end
	end

	if arg_1335_3 ~= "x" then
		if var_1335_0 > math.abs(var_1335_5 - var_1335_7) then
			var_1335_2 = var_1335_7
		end

		if var_1335_0 > math.abs(var_1335_4 - arg_1335_2.y * 0.5) then
			var_1335_2 = arg_1335_2.y * 0.5 - arg_1335_1.y * 0.5
		end

		if var_1335_0 > math.abs(var_1335_6 - (arg_1335_2.y - var_1335_7)) then
			var_1335_2 = arg_1335_2.y - var_1335_7 - arg_1335_1.y
		end
	end

	return vector(var_1335_1, var_1335_2)
end

function slot_0_89_0.paint_drag_environment(arg_1336_0, arg_1336_1, arg_1336_2, arg_1336_3)
	local var_1336_0 = tonumber(arg_1336_1) or 0

	if var_1336_0 <= 0.001 or not arg_1336_0 or not arg_1336_0.x then
		return
	end

	pcall(function()
		render.rect(vector(0, 0), arg_1336_0, color(0, 0, 0, math.floor(38 * var_1336_0)), 0)
	end)

	local var_1336_1 = 11
	local var_1336_2
	local var_1336_3

	if arg_1336_2 and arg_1336_3 and arg_1336_3.x and arg_1336_3.y then
		var_1336_2 = arg_1336_2.x + arg_1336_3.x * 0.5
		var_1336_3 = arg_1336_2.y + arg_1336_3.y * 0.5
	end

	slot_0_78_0.ov_drag_guide_x = nil
	slot_0_78_0.ov_drag_guide_y = nil
	slot_0_89_0._guide_pulse = slot_0_89_0._guide_pulse or {}

	local var_1336_4 = slot_0_89_0.hud_accent_color(var_1336_0)

	local function var_1336_5(arg_1338_0, arg_1338_1)
		local var_1338_0 = slot_0_89_0._guide_pulse[arg_1338_0] or 0
		local var_1338_1 = arg_1338_1 and 1 or 0
		local var_1338_2 = arg_1338_1 and 20 or 12
		local var_1338_3 = var_1338_0 + (var_1338_1 - var_1338_0) * math.min(1, (globals.frametime or 0.016) * var_1338_2)

		if math.abs(var_1338_1 - var_1338_3) < 0.002 then
			var_1338_3 = var_1338_1
		end

		slot_0_89_0._guide_pulse[arg_1338_0] = var_1338_3

		return var_1338_3
	end

	local function var_1336_6(arg_1339_0, arg_1339_1)
		local var_1339_0 = var_1336_2 and math.abs(var_1336_2 - arg_1339_0) < var_1336_1

		if var_1339_0 then
			slot_0_78_0.ov_drag_guide_x = arg_1339_0
		end

		local var_1339_1 = var_1336_5(arg_1339_1, var_1339_0 == true)
		local var_1339_2 = math.floor((28 + 92 * var_1339_1) * var_1336_0)

		if var_1339_2 < 2 then
			return
		end

		local var_1339_3 = color(var_1336_4.r, var_1336_4.g, var_1336_4.b, var_1339_2)
		local var_1339_4 = color(var_1336_4.r, var_1336_4.g, var_1336_4.b, math.floor(var_1339_2 * 0.15))

		pcall(function()
			render.gradient(vector(arg_1339_0 - 1, 0), vector(arg_1339_0 + 1, arg_1336_0.y * 0.5), var_1339_4, var_1339_3, var_1339_4, var_1339_3)
			render.gradient(vector(arg_1339_0 - 1, arg_1336_0.y * 0.5), vector(arg_1339_0 + 1, arg_1336_0.y), var_1339_3, var_1339_4, var_1339_3, var_1339_4)
		end)

		if var_1339_1 > 0.35 then
			pcall(function()
				render.shadow(vector(arg_1339_0 - 2, arg_1336_0.y * 0.5 - 24), vector(arg_1339_0 + 2, arg_1336_0.y * 0.5 + 24), color(var_1336_4.r, var_1336_4.g, var_1336_4.b, math.floor(48 * var_1336_0 * var_1339_1)))
			end)
		end
	end

	local function var_1336_7(arg_1342_0, arg_1342_1)
		local var_1342_0 = false

		if arg_1336_2 and arg_1336_3 and arg_1336_3.y then
			if arg_1342_0 <= 24.5 then
				var_1342_0 = math.abs(arg_1336_2.y - 24) < var_1336_1
			elseif arg_1342_0 >= arg_1336_0.y - 24.5 then
				var_1342_0 = math.abs(arg_1336_2.y + arg_1336_3.y - (arg_1336_0.y - 24)) < var_1336_1
			elseif var_1336_3 then
				var_1342_0 = math.abs(var_1336_3 - arg_1342_0) < var_1336_1
			end
		end

		if var_1342_0 then
			slot_0_78_0.ov_drag_guide_y = arg_1342_0
		end

		local var_1342_1 = var_1336_5(arg_1342_1, var_1342_0 == true)
		local var_1342_2 = math.floor((28 + 92 * var_1342_1) * var_1336_0)

		if var_1342_2 < 2 then
			return
		end

		local var_1342_3 = color(var_1336_4.r, var_1336_4.g, var_1336_4.b, var_1342_2)
		local var_1342_4 = color(var_1336_4.r, var_1336_4.g, var_1336_4.b, math.floor(var_1342_2 * 0.15))

		pcall(function()
			render.gradient(vector(0, arg_1342_0 - 1), vector(arg_1336_0.x * 0.5, arg_1342_0 + 1), var_1342_4, var_1342_4, var_1342_3, var_1342_3)
			render.gradient(vector(arg_1336_0.x * 0.5, arg_1342_0 - 1), vector(arg_1336_0.x, arg_1342_0 + 1), var_1342_3, var_1342_3, var_1342_4, var_1342_4)
		end)
	end

	for iter_1336_0, iter_1336_1 in ipairs({
		arg_1336_0.x * 0.5,
		arg_1336_0.x / 3,
		arg_1336_0.x * 2 / 3
	}) do
		var_1336_6(iter_1336_1, "x" .. tostring(iter_1336_1))
	end

	for iter_1336_2, iter_1336_3 in ipairs({
		24,
		arg_1336_0.y * 0.5,
		arg_1336_0.y - 24
	}) do
		var_1336_7(iter_1336_3, "y" .. tostring(iter_1336_3))
	end
end

function slot_0_89_0.paint_snap_guides(arg_1344_0, arg_1344_1, arg_1344_2, arg_1344_3)
	if not arg_1344_3 then
		return
	end

	slot_0_89_0.paint_drag_environment(arg_1344_0, 1, arg_1344_1, arg_1344_2)
end

function slot_0_89_0.slot_align_from_fraction(arg_1345_0)
	arg_1345_0 = tonumber(arg_1345_0) or 0.5

	if arg_1345_0 < 0.4 then
		return 0
	elseif arg_1345_0 > 0.6 then
		return 2
	end

	return 1
end

function slot_0_89_0.slot_anchor_fraction(arg_1346_0, arg_1346_1, arg_1346_2)
	if type(arg_1346_0) ~= "table" or not arg_1346_2 or not arg_1346_2.x or arg_1346_2.x <= 1 then
		return 0.5
	end

	local var_1346_0 = tonumber(arg_1346_0.cxf)

	if not var_1346_0 then
		local var_1346_1 = math.max(0, math.min(2, math.floor(tonumber(arg_1346_0.align) or 0)))
		local var_1346_2 = tonumber(arg_1346_0.x)

		if var_1346_1 == 1 then
			var_1346_0 = 0.5
		elseif var_1346_1 == 2 then
			var_1346_0 = 1 - (arg_1346_1 * 0.5 + 4) / arg_1346_2.x
		elseif var_1346_2 then
			var_1346_0 = (var_1346_2 + arg_1346_1 * 0.5) / arg_1346_2.x
		else
			var_1346_0 = (arg_1346_1 * 0.5 + 4) / arg_1346_2.x
		end

		arg_1346_0.cxf = math.max(0, math.min(1, var_1346_0))
	end

	return math.max(0, math.min(1, arg_1346_0.cxf))
end

function slot_0_89_0.slot_apply_rest(arg_1347_0, arg_1347_1, arg_1347_2, arg_1347_3, arg_1347_4, arg_1347_5, arg_1347_6)
	arg_1347_4 = arg_1347_4 or 4
	arg_1347_5 = arg_1347_5 or 24
	arg_1347_6 = arg_1347_6 or arg_1347_3.y - (tonumber(arg_1347_2) or 0) - 24

	local var_1347_0 = slot_0_89_0.slot_anchor_fraction(arg_1347_0, arg_1347_1, arg_1347_3)
	local var_1347_1 = var_1347_0 * arg_1347_3.x - arg_1347_1 * 0.5
	local var_1347_2 = math.max(arg_1347_4, math.min(arg_1347_3.x - arg_1347_1 - arg_1347_4, var_1347_1))
	local var_1347_3 = math.max(arg_1347_5, math.min(arg_1347_6, tonumber(arg_1347_0.y) or arg_1347_5))

	arg_1347_0.x = var_1347_2
	arg_1347_0.y = var_1347_3
	arg_1347_0.align = slot_0_89_0.slot_align_from_fraction(var_1347_0)

	return var_1347_2, var_1347_3, arg_1347_0.align
end

function slot_0_89_0.slot_commit_drag(arg_1348_0, arg_1348_1, arg_1348_2, arg_1348_3, arg_1348_4, arg_1348_5)
	arg_1348_3 = arg_1348_3 or 4
	arg_1348_4 = arg_1348_4 or 24
	arg_1348_5 = arg_1348_5 or arg_1348_2.y - 24

	local var_1348_0 = math.max(arg_1348_3, math.min(arg_1348_2.x - arg_1348_1 - arg_1348_3, tonumber(arg_1348_0.x) or arg_1348_3))

	arg_1348_0.y, arg_1348_0.x = math.max(arg_1348_4, math.min(arg_1348_5, tonumber(arg_1348_0.y) or arg_1348_4)), var_1348_0

	local var_1348_1 = math.max(0, math.min(1, (var_1348_0 + arg_1348_1 * 0.5) / math.max(1, arg_1348_2.x)))

	arg_1348_0.cxf = var_1348_1
	arg_1348_0.align = slot_0_89_0.slot_align_from_fraction(var_1348_1)

	return arg_1348_0.align
end

function slot_0_89_0.overlay_drag_release_third(arg_1349_0, arg_1349_1, arg_1349_2, arg_1349_3, arg_1349_4, arg_1349_5)
	slot_0_89_0.slot_commit_drag(arg_1349_0, arg_1349_1, arg_1349_2, arg_1349_3 or 4, arg_1349_4 or 24, arg_1349_5 or arg_1349_2.y - 24)

	return true
end

function slot_0_89_0.wm_third_snap_release(arg_1350_0, arg_1350_1, arg_1350_2)
	slot_0_89_0.slot_commit_drag(arg_1350_0, arg_1350_1, arg_1350_2, 12, 24, arg_1350_2.y - 24)
end

function slot_0_89_0.widget_drag_overlay_mix(arg_1351_0, arg_1351_1)
	local var_1351_0 = tonumber(arg_1351_1) or 0

	if var_1351_0 <= 0.001 or type(arg_1351_0) ~= "table" then
		return 0, var_1351_0, 0
	end

	local var_1351_1 = (arg_1351_0.hover == true or arg_1351_0.active == true) and 1 or 0
	local var_1351_2 = arg_1351_0.active == true and 1 or 0
	local var_1351_3 = var_1351_2 < 0.5 and 1 or 0
	local var_1351_4 = slot_0_89_0.ov_drag_anim_step(arg_1351_0, "idle", var_1351_3, 10, 12)
	local var_1351_5 = slot_0_89_0.ov_drag_anim_step(arg_1351_0, "hover", var_1351_1, 19, 10)
	local var_1351_6 = slot_0_89_0.ov_drag_anim_step(arg_1351_0, "active", var_1351_2, 7, 10)
	local var_1351_7 = globals.realtime or 0
	local var_1351_8 = 0.5 + 0.5 * math.sin(var_1351_7 * 2.8)
	local var_1351_9 = 0.5 + 0.5 * math.sin(var_1351_7 * 5)
	local var_1351_10 = var_1351_6 * var_1351_6 * (3 - 2 * var_1351_6)

	return math.max(var_1351_4 * (0.34 + 0.1 * var_1351_8), var_1351_5 * (0.8 + 0.09 * var_1351_9), var_1351_10), var_1351_0, var_1351_10
end

function slot_0_89_0.paint_widget_drag_frame(arg_1352_0, arg_1352_1, arg_1352_2, arg_1352_3, arg_1352_4, arg_1352_5, arg_1352_6, arg_1352_7, arg_1352_8)
	if arg_1352_4 <= 0.003 then
		return
	end

	arg_1352_8 = math.max(0, math.min(1, tonumber(arg_1352_8) or 0))

	local var_1352_0 = 2 + arg_1352_4 * 2.5 + arg_1352_8 * 1.5
	local var_1352_1 = vector(arg_1352_0 - var_1352_0, arg_1352_1 - var_1352_0)
	local var_1352_2 = vector(arg_1352_0 + arg_1352_2 + var_1352_0, arg_1352_1 + arg_1352_3 + var_1352_0)
	local var_1352_3 = math.floor((12 + 28 * arg_1352_4) * arg_1352_5)
	local var_1352_4 = math.floor((38 + 82 * arg_1352_4) * arg_1352_5)
	local var_1352_5 = 1 + arg_1352_4 * 0.35

	pcall(function()
		if var_1352_3 > 1 then
			render.rect(var_1352_1, var_1352_2, color(0, 0, 0, var_1352_3), arg_1352_7)
		end

		if arg_1352_4 > 0.18 then
			render.shadow(var_1352_1, var_1352_2, color(arg_1352_6.r, arg_1352_6.g, arg_1352_6.b, math.floor((24 + 22 * arg_1352_8) * arg_1352_5 * arg_1352_4)))
		end

		if arg_1352_8 > 0.01 then
			local var_1353_0 = 3 + arg_1352_8 * 4

			render.rect_outline(vector(var_1352_1.x - var_1353_0, var_1352_1.y - var_1353_0), vector(var_1352_2.x + var_1353_0, var_1352_2.y + var_1353_0), color(arg_1352_6.r, arg_1352_6.g, arg_1352_6.b, math.floor(46 * arg_1352_5 * arg_1352_8)), 1, arg_1352_7 + var_1353_0)
		end

		render.rect_outline(var_1352_1, var_1352_2, color(arg_1352_6.r, arg_1352_6.g, arg_1352_6.b, var_1352_4), var_1352_5, arg_1352_7)
	end)
end

function slot_0_89_0.paint_widget_drag_hover(arg_1354_0, arg_1354_1, arg_1354_2, arg_1354_3, arg_1354_4, arg_1354_5, arg_1354_6)
	local var_1354_0 = tonumber(arg_1354_0) or 0

	if var_1354_0 <= 0.001 or type(arg_1354_1) ~= "table" or not arg_1354_4 or not arg_1354_5 or arg_1354_4 <= 0 or arg_1354_5 <= 0 then
		return
	end

	local var_1354_1, var_1354_2, var_1354_3 = slot_0_89_0.widget_drag_overlay_mix(arg_1354_1, var_1354_0)

	if var_1354_1 <= 0.003 then
		return
	end

	local var_1354_4 = slot_0_89_0.hud_accent_color(var_1354_2)
	local var_1354_5 = slot_0_89_0.hud_widget_radius() + 1

	slot_0_89_0.paint_widget_drag_frame(arg_1354_2, arg_1354_3, arg_1354_4, arg_1354_5, var_1354_1, var_1354_2, var_1354_4, var_1354_5, var_1354_3)

	if arg_1354_1.active == true and arg_1354_6 then
		if arg_1354_1.aligning == "y" then
			slot_0_89_0.paint_wm_axis_lock(arg_1354_6, vector(arg_1354_2, arg_1354_3), arg_1354_4, arg_1354_5, 0, var_1354_2)
		elseif arg_1354_1.aligning == "x" then
			slot_0_89_0.paint_wm_axis_lock(arg_1354_6, vector(arg_1354_2, arg_1354_3), arg_1354_4, arg_1354_5, 1, var_1354_2)
		end
	end
end

function slot_0_89_0.overlay_drag_paint_hover(arg_1355_0, arg_1355_1, arg_1355_2)
	if arg_1355_1 <= 0.01 or type(arg_1355_0) ~= "table" then
		return
	end

	local var_1355_0 = arg_1355_0.drag

	if type(var_1355_0) ~= "table" then
		return
	end

	local var_1355_1, var_1355_2, var_1355_3, var_1355_4 = arg_1355_0.get_rect()

	slot_0_89_0.paint_widget_drag_hover(arg_1355_1, var_1355_0, var_1355_1, var_1355_2, var_1355_3, var_1355_4, arg_1355_2)
end

slot_0_197_0 = nil

function slot_0_89_0.paint_drag_hint(arg_1356_0, arg_1356_1, arg_1356_2, arg_1356_3, arg_1356_4)
	local var_1356_0 = tonumber(arg_1356_1) or 0

	arg_1356_4 = math.max(0, math.min(1, tonumber(arg_1356_4) or var_1356_0))

	if var_1356_0 <= 0.001 or arg_1356_4 <= 0.001 or not arg_1356_0 or not arg_1356_0.x then
		return
	end

	if not arg_1356_2 or not arg_1356_3 or not arg_1356_3.x or not arg_1356_3.y then
		return
	end

	if not slot_0_197_0 then
		pcall(function()
			slot_0_197_0 = render.load_font("Segoe UI", vector(13, 11, 0, 0), "a")
		end)

		if not slot_0_197_0 then
			slot_0_197_0 = 1
		end
	end

	local var_1356_1 = common.is_button_down(160) == true
	local var_1356_2 = common.is_button_down(162) == true
	local var_1356_3
	local var_1356_4 = var_1356_2 and "Alt — guides off" or var_1356_1 and "Shift — axis lock" or "Drag to snap · Shift axis · Alt no guides"
	local var_1356_5 = arg_1356_2.x + arg_1356_3.x * 0.5
	local var_1356_6 = arg_1356_2.y + arg_1356_3.y + 10
	local var_1356_7 = slot_0_89_0.anim_ease_out_back(arg_1356_4)
	local var_1356_8 = slot_0_89_0.anim_ease_in_quad(1 - arg_1356_4)
	local var_1356_9 = (1 - var_1356_7) * 10 + var_1356_8 * 6
	local var_1356_10 = 0.88 + 0.12 * var_1356_7 - var_1356_8 * 0.06
	local var_1356_11 = var_1356_0 * arg_1356_4 * (1 - var_1356_8 * 0.35)
	local var_1356_12 = 0
	local var_1356_13 = 12

	pcall(function()
		local var_1358_0 = render.measure_text(slot_0_197_0, "c", var_1356_4)

		if var_1358_0 then
			var_1356_12 = tonumber(var_1358_0.x) or 0
			var_1356_13 = tonumber(var_1358_0.y) or 12
		end
	end)

	if var_1356_12 <= 0 then
		var_1356_12 = chi and chi.safe_measure(slot_0_197_0, var_1356_4) or #var_1356_4 * 6
	end

	local var_1356_14 = 10
	local var_1356_15 = 5
	local var_1356_16 = (var_1356_12 + var_1356_14 * 2) * var_1356_10
	local var_1356_17 = (var_1356_13 + var_1356_15 * 2) * (0.92 + 0.08 * var_1356_7)
	local var_1356_18 = var_1356_5 - var_1356_16 * 0.5
	local var_1356_19 = var_1356_6 - 2 + var_1356_9
	local var_1356_20 = var_1356_18 + var_1356_16
	local var_1356_21 = var_1356_19 + var_1356_17
	local var_1356_22 = var_1356_18 + var_1356_16 * 0.5
	local var_1356_23 = var_1356_19 + var_1356_17 * 0.5

	pcall(function()
		if slot_0_89_0.hud_blur_enabled() then
			render.blur(vector(var_1356_18, var_1356_19), vector(var_1356_20, var_1356_21), 1, 1, 6)
		end

		render.rect(vector(var_1356_18, var_1356_19), vector(var_1356_20, var_1356_21), color(0, 0, 0, math.floor(150 * var_1356_11)), 6)
		render.rect_outline(vector(var_1356_18, var_1356_19), vector(var_1356_20, var_1356_21), color(255, 255, 255, math.floor(32 * var_1356_11)), 1, 6)
		render.text(slot_0_197_0, vector(var_1356_22, var_1356_23), color(255, 255, 255, math.floor(185 * var_1356_11)), "c", var_1356_4)
	end)
end

function slot_0_89_0.overlay_drag_apply_shift(arg_1360_0, arg_1360_1, arg_1360_2, arg_1360_3)
	if not arg_1360_3 or type(arg_1360_2) ~= "table" or not arg_1360_2.init then
		if type(arg_1360_2) == "table" then
			arg_1360_2.aligning = nil
		end

		return arg_1360_0, arg_1360_1
	end

	if arg_1360_2.aligning == nil then
		local var_1360_0 = math.abs(arg_1360_0 - arg_1360_2.init.x)
		local var_1360_1 = math.abs(arg_1360_1 - arg_1360_2.init.y)

		if var_1360_1 > 0.9 and var_1360_0 <= var_1360_1 then
			arg_1360_2.aligning = "y"
		elseif var_1360_0 > 0.9 then
			arg_1360_2.aligning = "x"
		end
	end

	if arg_1360_2.aligning == "y" then
		arg_1360_0 = arg_1360_2.init.x
	elseif arg_1360_2.aligning == "x" then
		arg_1360_1 = arg_1360_2.init.y
	end

	return arg_1360_0, arg_1360_1
end

function slot_0_89_0.overlay_drag_think(arg_1361_0)
	slot_1361_1_0 = arg_1361_0.drag
	slot_1361_2_0 = arg_1361_0.menu_alpha or 0
	slot_1361_3_0 = arg_1361_0.scr
	slot_1361_4_0 = arg_1361_0.slot

	if slot_1361_2_0 <= 0.01 then
		if arg_1361_0.on_reset then
			arg_1361_0.on_reset(slot_1361_1_0.active == true)
		end

		slot_0_89_0.overlay_drag_clear(slot_1361_1_0, true)

		return
	end

	slot_1361_5_0 = vector(0, 0)

	pcall(function()
		slot_1361_5_0 = slot_0_89_0.hud_mouse_pos()
	end)

	slot_1361_6_0 = slot_1361_2_0 > 0.01 and common.is_button_down(1) == true
	slot_1361_7_0 = slot_1361_1_0._lmb_prev == true
	slot_1361_1_0._lmb_prev = slot_1361_6_0
	slot_1361_8_0 = slot_1361_6_0 and not slot_1361_7_0
	slot_1361_9_0 = common.is_button_down(160) == true
	slot_1361_10_0 = common.is_button_down(162) == true
	slot_1361_11_0, slot_1361_12_0, slot_1361_13_0, slot_1361_14_0 = arg_1361_0.get_rect()
	slot_1361_15_0 = slot_0_89_0.point_in_rect(slot_1361_5_0.x, slot_1361_5_0.y, slot_1361_11_0, slot_1361_12_0, slot_1361_13_0, slot_1361_14_0)

	if arg_1361_0.mouse_on_menu then
		slot_1361_15_0 = slot_1361_15_0 and not arg_1361_0.mouse_on_menu(slot_1361_5_0)
	end

	slot_1361_1_0.hover = slot_1361_15_0 == true
	slot_1361_16_0 = arg_1361_0.is_blocked and arg_1361_0.is_blocked() or false

	if slot_1361_2_0 > 0.01 and slot_1361_15_0 == true and not slot_1361_16_0 then
		slot_0_78_0.ov_drag_hint_box = {
			x = slot_1361_11_0,
			y = slot_1361_12_0,
			w = slot_1361_13_0,
			h = slot_1361_14_0
		}
	end

	slot_1361_17_0 = slot_0_78_0.ov_drag_owner and slot_0_78_0.ov_drag_owner ~= slot_1361_1_0 and slot_0_78_0.ov_drag_owner.active == true

	if slot_1361_8_0 and slot_1361_1_0.ready == nil then
		if slot_1361_15_0 and not slot_1361_16_0 and not slot_1361_17_0 then
			slot_1361_1_0.ready = true
			slot_1361_1_0.point = {
				ox = slot_1361_5_0.x - slot_1361_11_0,
				oy = slot_1361_5_0.y - slot_1361_12_0
			}
			slot_1361_1_0.init = {
				x = slot_1361_11_0,
				y = slot_1361_12_0
			}
			slot_1361_1_0.grab = slot_1361_1_0.point
			slot_1361_1_0.aligning = nil
			slot_1361_1_0._vx = slot_1361_11_0
			slot_1361_1_0._vy = slot_1361_12_0

			if arg_1361_0.on_held then
				arg_1361_0.on_held(slot_1361_4_0, slot_1361_1_0)
			end
		else
			slot_1361_1_0.ready = false
		end
	end

	if slot_1361_6_0 and slot_1361_1_0.ready == true then
		if slot_1361_17_0 then
			slot_1361_1_0.ready = false
			slot_1361_1_0.active = false
		else
			slot_0_78_0.ov_drag_owner = slot_1361_1_0
			slot_1361_1_0.active = true
			slot_0_78_0.ov_drag_active = true
			slot_1361_18_2 = slot_1361_5_0.x - (slot_1361_1_0.point and slot_1361_1_0.point.ox or 0)
			slot_1361_19_2 = slot_1361_5_0.y - (slot_1361_1_0.point and slot_1361_1_0.point.oy or 0)
			slot_1361_20_0 = math.min(1, (globals.frametime or 0.016) * 30)
			slot_1361_1_0._vx = (slot_1361_1_0._vx or slot_1361_18_2) + (slot_1361_18_2 - (slot_1361_1_0._vx or slot_1361_18_2)) * slot_1361_20_0
			slot_1361_1_0._vy = (slot_1361_1_0._vy or slot_1361_19_2) + (slot_1361_19_2 - (slot_1361_1_0._vy or slot_1361_19_2)) * slot_1361_20_0
			slot_1361_18_1, slot_1361_19_1 = slot_1361_1_0._vx, slot_1361_1_0._vy
			slot_1361_18_0, slot_1361_19_0 = slot_0_89_0.overlay_drag_apply_shift(slot_1361_18_1, slot_1361_19_1, slot_1361_1_0, slot_1361_9_0)

			if not slot_1361_10_0 then
				if arg_1361_0.snap_pos then
					slot_1361_18_0, slot_1361_19_0 = arg_1361_0.snap_pos(slot_1361_18_0, slot_1361_19_0, slot_1361_13_0, slot_1361_14_0, slot_1361_3_0, slot_1361_1_0)
				else
					slot_1361_18_0, slot_1361_19_0 = slot_0_89_0.snap_box_to_guides(vector(slot_1361_18_0, slot_1361_19_0), vector(slot_1361_13_0, slot_1361_14_0), slot_1361_3_0, slot_1361_1_0.aligning == "y" and "y" or slot_1361_1_0.aligning == "x" and "x" or nil)
				end
			end

			if arg_1361_0.clamp_pos then
				slot_1361_18_0, slot_1361_19_0 = arg_1361_0.clamp_pos(slot_1361_18_0, slot_1361_19_0, slot_1361_13_0, slot_1361_14_0, slot_1361_3_0)
			end

			if arg_1361_0.apply_layout then
				arg_1361_0.apply_layout(slot_1361_18_0, slot_1361_19_0)
			else
				slot_1361_4_0.x = slot_1361_18_0
				slot_1361_4_0.y = slot_1361_19_0
			end

			slot_0_78_0.ov_drag_snap_pos = vector(slot_1361_18_0, slot_1361_19_0)
			slot_0_78_0.ov_drag_snap_sz = vector(slot_1361_13_0, slot_1361_14_0)
		end
	elseif not slot_1361_6_0 then
		if slot_1361_1_0.active == true then
			pcall(function()
				if arg_1361_0.on_release then
					arg_1361_0.on_release(slot_1361_4_0, slot_1361_1_0)
				end
			end)
			pcall(function()
				if arg_1361_0.on_save then
					arg_1361_0.on_save()
				end
			end)
		end

		slot_0_89_0.overlay_drag_clear(slot_1361_1_0, false)
	end

	if slot_0_89_0.overlay_drag_captures_mouse(slot_1361_1_0, slot_1361_2_0) then
		slot_0_78_0.ov_drag_capture = true
	end

	if arg_1361_0.set_mouse_block then
		arg_1361_0.set_mouse_block(slot_1361_2_0 > 0.01 and (slot_1361_1_0.hover == true or slot_1361_1_0.active == true))
	end
end

function slot_0_89_0.paint_wm_axis_lock(arg_1365_0, arg_1365_1, arg_1365_2, arg_1365_3, arg_1365_4, arg_1365_5)
	arg_1365_5 = tonumber(arg_1365_5) or 1

	local var_1365_0 = slot_0_89_0.hud_accent_color(arg_1365_5 * 0.9)
	local var_1365_1 = math.floor(120 * arg_1365_5)
	local var_1365_2 = color(var_1365_0.r, var_1365_0.g, var_1365_0.b, var_1365_1)

	if arg_1365_4 == 0 then
		local var_1365_3 = arg_1365_1.x + arg_1365_2 * 0.5

		pcall(function()
			render.line(vector(var_1365_3, 0), vector(var_1365_3, arg_1365_0.y), var_1365_2)
		end)
	elseif arg_1365_4 == 1 then
		local var_1365_4 = arg_1365_1.y + arg_1365_3 * 0.5

		pcall(function()
			render.line(vector(0, var_1365_4), vector(arg_1365_0.x, var_1365_4), var_1365_2)
		end)
	end
end

slot_0_78_0.hud_wm_tick = (function()
	local var_1368_0 = 22
	local var_1368_1 = vector(18, 18)
	local var_1368_2 = 4
	local var_1368_3 = "amnesia.plus"
	local var_1368_4 = 4
	local var_1368_5 = 3
	local var_1368_6 = 6
	local var_1368_7 = 3

	local function var_1368_8()
		return var_1368_7 + var_1368_6 + var_1368_7
	end

	local var_1368_9 = vector(16, 16)
	local var_1368_10 = 8
	local var_1368_11 = {}
	local var_1368_12
	local var_1368_13 = false
	local var_1368_14 = (function(arg_1370_0, arg_1370_1, arg_1370_2, arg_1370_3)
		local var_1370_0, var_1370_1 = pcall(render.load_font, arg_1370_0, arg_1370_1, arg_1370_2)

		if var_1370_0 and var_1370_1 then
			return var_1370_1
		end

		return arg_1370_3
	end)("Segoe UI Semibold", vector(14, 12), "a", 1)
	local var_1368_15 = false
	local var_1368_16
	local var_1368_17
	local var_1368_18
	local var_1368_19
	local var_1368_20 = false
	local var_1368_21
	local var_1368_22 = 0
	local var_1368_23 = {}
	local var_1368_24 = 0
	local var_1368_25 = {
		active = false,
		hover = false
	}
	local var_1368_26 = {
		align = 0,
		active = 0,
		show_mix = 0,
		logo_mix = 0,
		pos = vector(0, 24),
		size = vector(320, var_1368_0),
		slots = {}
	}

	local function var_1368_27(arg_1371_0, arg_1371_1, arg_1371_2)
		arg_1371_2 = arg_1371_2 or 14

		local var_1371_0 = "ap.wm\x00" .. arg_1371_0
		local var_1371_1 = var_1368_11[var_1371_0] or 0
		local var_1371_2 = math.min(1, (globals.frametime or 0.016) * arg_1371_2)
		local var_1371_3 = var_1371_1 + (arg_1371_1 - var_1371_1) * var_1371_2

		var_1368_11[var_1371_0] = var_1371_3

		return var_1371_3
	end

	local function var_1368_28()
		return slot_0_152_0.vars and slot_0_152_0.vars.ov_watermark
	end

	local function var_1368_29(arg_1373_0, arg_1373_1)
		if not arg_1373_0 or type(arg_1373_0.get) ~= "function" then
			return arg_1373_1
		end

		local var_1373_0, var_1373_1 = pcall(function()
			return arg_1373_0:get()
		end)

		if not var_1373_0 then
			return arg_1373_1
		end

		return var_1373_1
	end

	local function var_1368_30(arg_1375_0, arg_1375_1)
		arg_1375_0 = chi.strip_markup(tostring(arg_1375_0 or ""))

		if arg_1375_0 == "" then
			return 0
		end

		local var_1375_0 = globals.tickcount or 0

		if var_1368_24 ~= var_1375_0 then
			var_1368_24 = var_1375_0
			var_1368_23 = {}
		end

		local var_1375_1 = tostring(arg_1375_1 or var_1368_14) .. "\x00" .. arg_1375_0
		local var_1375_2 = var_1368_23[var_1375_1]

		if type(var_1375_2) == "number" then
			return var_1375_2
		end

		local var_1375_3, var_1375_4 = pcall(function()
			return render.measure_text(arg_1375_1 or var_1368_14, nil, arg_1375_0)
		end)

		if var_1375_3 and var_1375_4 and type(var_1375_4.x) == "number" then
			var_1368_23[var_1375_1] = var_1375_4.x

			return var_1375_4.x
		end

		local var_1375_5, var_1375_6 = pcall(function()
			return render.measure_text(arg_1375_1 or var_1368_14, arg_1375_0)
		end)
		local var_1375_7 = var_1375_6

		if var_1375_5 and var_1375_7 and type(var_1375_7.x) == "number" then
			var_1368_23[var_1375_1] = var_1375_7.x

			return var_1375_7.x
		end

		return #arg_1375_0 * 7
	end

	local function var_1368_31(arg_1378_0)
		return color(240, 240, 240, math.floor(235 * (arg_1378_0 or 1)))
	end

	local function var_1368_32(arg_1379_0)
		return color(255, 255, 255, math.floor(52 * (arg_1379_0 or 1)))
	end

	local function var_1368_33()
		return var_1368_1.x + var_1368_2 + var_1368_30(var_1368_3, var_1368_14)
	end

	local function var_1368_34(arg_1381_0, arg_1381_1)
		local var_1381_0 = 0

		if arg_1381_1 then
			var_1381_0 = 16
		end

		if arg_1381_0 and #chi.strip_markup(arg_1381_0) > 0 then
			if arg_1381_1 then
				var_1381_0 = var_1381_0 + 4
			end

			var_1381_0 = var_1381_0 + var_1368_30(arg_1381_0, var_1368_14)
		end

		return var_1381_0
	end

	local function var_1368_35(arg_1382_0, arg_1382_1, arg_1382_2, arg_1382_3)
		if not arg_1382_2 or arg_1382_2 <= 0.001 or not arg_1382_1 or arg_1382_1 <= 0 then
			return
		end

		arg_1382_3 = arg_1382_3 or {}

		local var_1382_0 = arg_1382_0 == "brand" and arg_1382_3.logo_only == true and 0 or var_1368_5

		var_1368_26.slots[#var_1368_26.slots + 1] = {
			kind = arg_1382_0,
			cw = arg_1382_1,
			sw = arg_1382_1 + var_1382_0 * 2,
			mix = arg_1382_2,
			extra = arg_1382_3
		}
		var_1368_26.active = var_1368_26.active + 1
	end

	local function var_1368_36()
		if var_1368_12 or var_1368_13 then
			return
		end

		var_1368_13 = true

		local var_1383_0 = false

		pcall(function()
			local var_1384_0 = files.read(slot_0_89_0.WM_LOGO_PATH)

			if type(var_1384_0) == "string" and #var_1384_0 > 16 then
				local var_1384_1, var_1384_2 = pcall(render.load_image, var_1384_0, var_1368_1)

				if var_1384_1 and var_1384_2 then
					var_1368_12 = var_1384_2
					var_1383_0 = true
				end
			end
		end)

		if var_1383_0 then
			var_1368_13 = false

			return
		end

		pcall(function()
			local var_1385_0 = network.get(slot_0_89_0.WM_LOGO_URL)

			if type(var_1385_0) == "string" and #var_1385_0 > 16 then
				pcall(files.write, slot_0_89_0.WM_LOGO_PATH, var_1385_0)

				local var_1385_1, var_1385_2 = pcall(render.load_image, var_1385_0, var_1368_1)

				if var_1385_1 and var_1385_2 then
					var_1368_12 = var_1385_2
				end
			end
		end)

		var_1368_13 = false
	end

	local function var_1368_37()
		return string.format("https://neverlose.cc/static/avatars/%s.png", tostring(common.get_username() or ""))
	end

	local function var_1368_38(arg_1387_0)
		if type(arg_1387_0) == "string" then
			return arg_1387_0
		end

		if type(arg_1387_0) == "table" and type(arg_1387_0.body) == "string" then
			return arg_1387_0.body
		end

		return nil
	end

	local function var_1368_39(arg_1388_0)
		arg_1388_0 = var_1368_38(arg_1388_0)

		if type(arg_1388_0) ~= "string" or #arg_1388_0 < 16 then
			return false
		end

		if arg_1388_0:sub(2, 4) ~= "PNG" then
			return false
		end

		local var_1388_0, var_1388_1 = pcall(render.load_image, arg_1388_0, vector(64, 64))

		if var_1388_0 and var_1388_1 then
			var_1368_19 = var_1388_1

			return true
		end

		return false
	end

	local function var_1368_40(arg_1389_0)
		arg_1389_0 = var_1368_38(arg_1389_0)

		if type(arg_1389_0) ~= "string" or #arg_1389_0 < 16 then
			return false
		end

		local var_1389_0, var_1389_1 = pcall(render.load_image, arg_1389_0, vector(64, 64))

		if var_1389_0 and var_1389_1 then
			var_1368_21 = var_1389_1

			return true
		end

		return false
	end

	local function var_1368_41(arg_1390_0)
		if not arg_1390_0 and var_1368_21 and slot_0_78_0.cloud_avatar_loaded_stamp == slot_0_78_0.cloud_avatar_stamp then
			return var_1368_21
		end

		local var_1390_0 = slot_0_78_0.cloud_avatar_b64

		if type(var_1390_0) ~= "string" or var_1390_0 == "" then
			var_1368_21 = nil

			return nil
		end

		local var_1390_1, var_1390_2 = pcall(slot_0_2_0.decode, var_1390_0)

		if not var_1390_1 or type(var_1390_2) ~= "string" or var_1390_2 == "" then
			return var_1368_21
		end

		if var_1368_40(var_1390_2) then
			slot_0_78_0.cloud_avatar_loaded_stamp = slot_0_78_0.cloud_avatar_stamp
		end

		return var_1368_21
	end

	local function var_1368_42()
		if not slot_0_90_0.is_configured() then
			return
		end

		local var_1391_0 = globals.realtime or 0

		if var_1391_0 < (slot_0_78_0.cloud_avatar_fetch_at or 0) then
			return
		end

		slot_0_78_0.cloud_avatar_fetch_at = var_1391_0 + 5

		slot_0_90_0.fetch_client_config(true)
	end

	local function var_1368_43()
		if var_1368_19 or var_1368_20 then
			return
		end

		var_1368_20 = true

		local var_1392_0 = var_1368_37()
		local var_1392_1 = false

		pcall(function()
			local var_1393_0 = network.get(var_1392_0)

			if var_1368_39(var_1393_0) then
				var_1392_1 = true
			end
		end)

		if var_1392_1 then
			var_1368_20 = false

			return
		end

		local var_1392_2 = false

		pcall(function()
			network.get(var_1392_0, nil, function(arg_1395_0)
				var_1368_20 = false

				var_1368_39(arg_1395_0)
			end)

			var_1392_2 = true
		end)

		if not var_1392_2 then
			var_1368_20 = false
		end
	end

	local function var_1368_44(arg_1396_0)
		local var_1396_0 = globals.realtime or 0

		if not arg_1396_0 and var_1368_18 and var_1396_0 < var_1368_22 then
			return var_1368_18
		end

		local var_1396_1 = entity.get_local_player()

		if not var_1396_1 then
			return var_1368_18
		end

		local var_1396_2, var_1396_3 = pcall(function()
			return var_1396_1:is_alive()
		end)

		if not var_1396_2 or not var_1396_3 then
			var_1368_22 = var_1396_0 + 0.05

			return var_1368_18
		end

		local var_1396_4, var_1396_5 = pcall(function()
			return var_1396_1:get_steam_avatar()
		end)

		if var_1396_4 and var_1396_5 then
			var_1368_18 = var_1396_5
			var_1368_22 = var_1396_0 + 0.25
		else
			var_1368_22 = var_1396_0 + 0.1
		end

		return var_1368_18
	end

	local function var_1368_45()
		local var_1399_0 = {
			0.05,
			0.15,
			0.35,
			0.75,
			1.5
		}

		for iter_1399_0 = 1, #var_1399_0 do
			local var_1399_1 = var_1399_0[iter_1399_0]

			utils.execute_after(var_1399_1, function()
				if not globals.is_connected then
					return
				end

				var_1368_44(true)
			end)
		end
	end

	local function var_1368_46(arg_1401_0)
		if arg_1401_0 == "Hidden" then
			return nil
		end

		if arg_1401_0 == "Neverlose" then
			var_1368_43()

			return var_1368_19
		end

		if arg_1401_0 == "Cloud" then
			var_1368_41(false)

			if not var_1368_21 then
				var_1368_42()
			end

			return var_1368_21
		end

		if var_1368_18 then
			return var_1368_18
		end

		return var_1368_44(true)
	end

	local function var_1368_47(arg_1402_0)
		local var_1402_0 = var_1368_29(arg_1402_0.wm_name_src, "Custom")

		if var_1402_0 == "Steam" then
			local var_1402_1 = ""

			pcall(function()
				var_1402_1 = tostring(cvar.name:string() or "")
			end)

			return var_1402_1
		end

		if var_1402_0 == "Neverlose" then
			return tostring(slot_0_18_0 or "")
		end

		return tostring(var_1368_29(arg_1402_0.wm_name_custom, slot_0_18_0 or "amnesia") or slot_0_18_0 or "amnesia")
	end

	local function var_1368_48(arg_1404_0, arg_1404_1)
		return _G.wm_element_on(arg_1404_0 and arg_1404_0.wm_elements, arg_1404_1)
	end

	local function var_1368_49(arg_1405_0)
		for iter_1405_0 = 1, #WM_ELEMENT_DEFS do
			if var_1368_48(arg_1405_0, WM_ELEMENT_DEFS[iter_1405_0].id) then
				return true
			end
		end

		return false
	end

	local function var_1368_50()
		return var_1368_1.x
	end

	local function var_1368_51(arg_1407_0)
		if not var_1368_48(arg_1407_0, "Build") then
			return nil
		end

		local var_1407_0 = slot_0_70_0(slot_0_25_0)

		return tostring(var_1407_0.title or slot_0_25_0)
	end

	local function var_1368_52(arg_1408_0)
		local var_1408_0 = var_1368_48(arg_1408_0, "Nickname") and var_1368_47(arg_1408_0) or ""
		local var_1408_1 = var_1368_51(arg_1408_0)
		local var_1408_2 = #chi.strip_markup(var_1408_0) > 0
		local var_1408_3 = var_1408_1 ~= nil and var_1408_1 ~= ""

		return var_1408_0, var_1408_1, var_1408_2, var_1408_3
	end

	local function var_1368_53(arg_1409_0)
		if not var_1368_48(arg_1409_0, "Time") then
			return nil, nil
		end

		local var_1409_0 = var_1368_29(arg_1409_0.wm_time, "24-hour")

		if var_1409_0 == "Off" then
			return nil, nil
		end

		local var_1409_1 = ""
		local var_1409_2 = ""

		if var_1409_0 == "12-hour" then
			local var_1409_3 = ""
			local var_1409_4 = ""

			pcall(function()
				var_1409_3 = common.get_date("%I:%M") or ""
				var_1409_4 = common.get_date("%p") or ""
			end)

			if var_1409_3 ~= "" then
				var_1409_1 = var_1409_4 ~= "" and var_1409_3 .. " \aFFFFFF50" .. var_1409_4 or var_1409_3
			end
		else
			pcall(function()
				var_1409_1 = common.get_date("%H:%M") or ""
			end)
		end

		pcall(function()
			var_1409_2 = common.get_date("%A") or ""
		end)

		if var_1409_1 == "" then
			return nil, nil
		end

		if var_1409_2 == "" then
			return var_1409_1, nil
		end

		return var_1409_1, "\aFFFFFF50" .. var_1409_2
	end

	local function var_1368_54()
		local var_1413_0 = 0

		pcall(function()
			local var_1414_0 = utils.net_channel()

			if var_1414_0 and var_1414_0.latency and var_1414_0.latency[1] then
				var_1413_0 = var_1414_0.latency[1] * 1000
			end
		end)

		return string.format("%d \aFFFFFF60ms", math.floor(var_1413_0 + 0.5)), var_1413_0
	end

	local function var_1368_55(arg_1415_0)
		if not slot_0_78_0.ov_store_loaded then
			slot_0_89_0.store_read()

			slot_0_78_0.ov_store_loaded = true
		end

		local var_1415_0 = slot_0_89_0.store_slot("wm")

		if var_1415_0._init ~= true then
			var_1415_0.align = 2
			var_1415_0.y = 24
			var_1415_0.x = 0
			var_1415_0._init = true
			var_1415_0._wm_topright_v3 = true

			slot_0_89_0.store_write()
		elseif var_1415_0._wm_topright_v3 ~= true then
			var_1415_0.align = 2
			var_1415_0.y = 24
			var_1415_0._wm_topright_v3 = true

			slot_0_89_0.store_write()
		end

		if var_1415_0._user_pos ~= true and (tonumber(var_1415_0.x) or 0) > var_1368_4 + 2 then
			var_1415_0._user_pos = true
		end

		var_1368_26.align = math.max(0, math.min(2, math.floor(tonumber(var_1415_0.align) or 0)))

		return var_1415_0
	end

	local function var_1368_56(arg_1416_0)
		var_1368_26.pos.x = arg_1416_0.x
		var_1368_26.pos.y = arg_1416_0.y
	end

	local function var_1368_57(arg_1417_0, arg_1417_1, arg_1417_2)
		local var_1417_0 = var_1368_4

		arg_1417_0.x = math.max(var_1417_0, math.min(arg_1417_2.x - arg_1417_1 - var_1417_0, arg_1417_0.x))
		arg_1417_0.y = math.max(24, math.min(arg_1417_2.y - var_1368_0 - 24, arg_1417_0.y))
	end

	local function var_1368_58(arg_1418_0, arg_1418_1, arg_1418_2)
		local var_1418_0 = var_1368_4
		local var_1418_1 = math.max(0, math.min(2, math.floor(tonumber(arg_1418_0.align) or 0)))

		arg_1418_0.y = math.max(24, math.min(arg_1418_2.y - var_1368_0 - 24, tonumber(arg_1418_0.y) or 24))

		if var_1418_1 == 2 then
			arg_1418_0.x = arg_1418_2.x - arg_1418_1 - var_1418_0
		elseif var_1418_1 == 1 then
			arg_1418_0.x = arg_1418_2.x * 0.5 - arg_1418_1 * 0.5
		elseif (tonumber(arg_1418_0.x) or 0) <= var_1418_0 + 2 then
			arg_1418_0.x = var_1418_0
		end

		var_1368_57(arg_1418_0, arg_1418_1, arg_1418_2)
	end

	local function var_1368_59(arg_1419_0, arg_1419_1, arg_1419_2)
		local var_1419_0 = var_1368_4
		local var_1419_1 = math.max(0, math.min(2, math.floor(tonumber(arg_1419_0.align) or 0)))
		local var_1419_2 = tonumber(arg_1419_0.x) or var_1419_0

		arg_1419_0.y = math.max(24, math.min(arg_1419_2.y - var_1368_0 - 24, tonumber(arg_1419_0.y) or 24))

		if arg_1419_0._user_pos ~= true and (var_1419_1 == 2 and var_1419_2 <= var_1419_0 + 2 or var_1419_1 == 1 and math.abs(var_1419_2 + arg_1419_1 * 0.5 - arg_1419_2.x * 0.5) <= 3) then
			var_1368_58(arg_1419_0, arg_1419_1, arg_1419_2)
		else
			var_1368_57(arg_1419_0, arg_1419_1, arg_1419_2)
		end
	end

	local function var_1368_60(arg_1420_0, arg_1420_1, arg_1420_2, arg_1420_3)
		arg_1420_1 = math.max(1, tonumber(arg_1420_1) or arg_1420_2)
		arg_1420_2 = math.max(1, tonumber(arg_1420_2) or arg_1420_1)

		local var_1420_0 = var_1368_4
		local var_1420_1 = math.max(0, math.min(2, math.floor(tonumber(arg_1420_0.align) or 0)))

		if var_1420_1 == 2 then
			arg_1420_0.x = arg_1420_0.x + arg_1420_1 - arg_1420_2
		elseif var_1420_1 == 0 and arg_1420_0.x <= var_1420_0 + 2 then
			-- block empty
		else
			arg_1420_0.x = arg_1420_0.x + arg_1420_1 * 0.5 - arg_1420_2 * 0.5
		end

		var_1368_57(arg_1420_0, arg_1420_2, arg_1420_3)
	end

	local function var_1368_61()
		if var_1368_15 then
			return
		end

		var_1368_15 = true

		pcall(function()
			var_1368_16 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M0 6V4c0-2 2-4 4-4v2C2 2 0 4 0 6Z\"/></svg>", vector(8, 12))
			var_1368_17 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M4 6c0-2-2-4-4-4V0c2 0 4 2 4 4v2Z\"/></svg>", vector(8, 12))
		end)
	end

	local function var_1368_62(arg_1423_0, arg_1423_1, arg_1423_2)
		if arg_1423_2 <= 0.001 then
			return
		end

		local var_1423_0 = var_1368_32(arg_1423_2)
		local var_1423_1 = arg_1423_1 + 5
		local var_1423_2 = arg_1423_1 + var_1368_0 - 5
		local var_1423_3 = var_1368_6 * 0.5

		pcall(function()
			render.line(vector(arg_1423_0 + var_1423_3, var_1423_1), vector(arg_1423_0 - var_1423_3, var_1423_2), var_1423_0)
		end)
	end

	local function var_1368_63(arg_1425_0, arg_1425_1, arg_1425_2, arg_1425_3)
		if not arg_1425_0 or arg_1425_3 <= 0.001 then
			return
		end

		pcall(function()
			render.texture(arg_1425_0, vector(arg_1425_1, arg_1425_2 + (var_1368_0 - var_1368_9.y) * 0.5), var_1368_9, color(255, 255, 255, math.floor(255 * arg_1425_3)), nil, var_1368_10)
		end)
	end

	local function var_1368_64(arg_1427_0, arg_1427_1, arg_1427_2, arg_1427_3)
		var_1368_36()

		local var_1427_0 = arg_1427_1 + (var_1368_0 - var_1368_1.y) * 0.5

		if var_1368_12 then
			pcall(function()
				render.texture(var_1368_12, vector(arg_1427_0, var_1427_0), var_1368_1, color(255, 255, 255, math.floor(255 * arg_1427_2)), nil, 0)
			end)
		end

		if arg_1427_3 then
			return
		end

		pcall(function()
			render.text(var_1368_14, vector(arg_1427_0 + var_1368_1.x + var_1368_2, arg_1427_1 + 4), var_1368_31(arg_1427_2), nil, var_1368_3)
		end)
	end

	local function var_1368_65(arg_1430_0, arg_1430_1, arg_1430_2, arg_1430_3, arg_1430_4)
		local var_1430_0 = arg_1430_0

		if arg_1430_4 then
			var_1368_63(arg_1430_4, var_1430_0, arg_1430_1, arg_1430_2)

			var_1430_0 = var_1430_0 + 16 + 4
		end

		if arg_1430_3 and #chi.strip_markup(arg_1430_3) > 0 then
			pcall(function()
				render.text(var_1368_14, vector(var_1430_0, arg_1430_1 + 4), var_1368_31(arg_1430_2), nil, arg_1430_3)
			end)
		end
	end

	local function var_1368_66(arg_1432_0, arg_1432_1, arg_1432_2, arg_1432_3, arg_1432_4)
		if not arg_1432_3 or arg_1432_3 == "" then
			return
		end

		pcall(function()
			render.text(var_1368_14, vector(arg_1432_0, arg_1432_1 + 4), arg_1432_4 or var_1368_31(arg_1432_2), nil, arg_1432_3)
		end)
	end

	local function var_1368_67(arg_1434_0, arg_1434_1, arg_1434_2)
		if arg_1434_2 <= 0.001 then
			return
		end

		var_1368_61()
		slot_0_89_0.paint_hud_card_bg(arg_1434_0, arg_1434_1, arg_1434_2, var_1368_16, var_1368_17)
	end

	local function var_1368_68(arg_1435_0, arg_1435_1, arg_1435_2, arg_1435_3)
		local var_1435_0 = arg_1435_3 * arg_1435_0.mix

		if arg_1435_0.kind == "brand" then
			var_1368_64(arg_1435_1, arg_1435_2, var_1435_0, arg_1435_0.extra.logo_only == true)
		elseif arg_1435_0.kind == "id" then
			var_1368_65(arg_1435_1, arg_1435_2, var_1435_0, arg_1435_0.extra.name, arg_1435_0.extra.avatar)
		elseif arg_1435_0.kind == "build" then
			var_1368_66(arg_1435_1, arg_1435_2, var_1435_0, arg_1435_0.extra.text, nil)
		elseif arg_1435_0.kind == "time" then
			var_1368_66(arg_1435_1, arg_1435_2, var_1435_0, arg_1435_0.extra.text, nil)
		elseif arg_1435_0.kind == "day" then
			var_1368_66(arg_1435_1, arg_1435_2, var_1435_0, arg_1435_0.extra.text, nil)
		elseif arg_1435_0.kind == "ping" then
			var_1368_66(arg_1435_1, arg_1435_2, var_1435_0, arg_1435_0.extra.text, nil)
		end
	end

	local function var_1368_69(arg_1436_0)
		local var_1436_0, var_1436_1, var_1436_2 = pcall(function()
			return ui.get_position(), ui.get_size()
		end)

		if not var_1436_0 or not var_1436_1 or not var_1436_2 then
			return false
		end

		return slot_0_89_0.point_in_rect(arg_1436_0.x, arg_1436_0.y, var_1436_1.x, var_1436_1.y, var_1436_2.x, var_1436_2.y)
	end

	local function var_1368_70(arg_1438_0)
		if arg_1438_0 and var_1368_25.active then
			slot_0_89_0.store_write()
		end

		slot_0_89_0.overlay_drag_clear(var_1368_25, arg_1438_0 ~= true)

		slot_0_78_0.ov_wm_mouse_block = false
	end

	local function var_1368_71(arg_1439_0, arg_1439_1, arg_1439_2)
		slot_0_89_0.overlay_drag_think({
			drag = var_1368_25,
			menu_alpha = arg_1439_0,
			scr = arg_1439_1,
			slot = arg_1439_2,
			mouse_on_menu = var_1368_69,
			get_rect = function()
				return var_1368_26.pos.x, var_1368_26.pos.y, var_1368_26.size.x, var_1368_26.size.y
			end,
			is_blocked = function()
				return slot_0_78_0.chi_mouse_block or slot_0_78_0.ov_elog_mouse_block or slot_0_78_0.ov_slowdown_mouse_block or slot_0_78_0.ov_keybinds_mouse_block or slot_0_78_0.ov_damage_ind_mouse_block or slot_0_78_0.ov_metrics_mouse_block or slot_0_78_0.ov_spectators_mouse_block
			end,
			snap_pos = function(arg_1442_0, arg_1442_1, arg_1442_2, arg_1442_3)
				local var_1442_0 = var_1368_25.aligning == "y" and "y" or var_1368_25.aligning == "x" and "x" or nil
				local var_1442_1 = slot_0_89_0.snap_box_to_guides(vector(arg_1442_0, arg_1442_1), vector(arg_1442_2, arg_1442_3), arg_1439_1, var_1442_0)

				return var_1442_1.x, var_1442_1.y
			end,
			clamp_pos = function(arg_1443_0, arg_1443_1, arg_1443_2, arg_1443_3)
				return math.max(0, math.min(arg_1439_1.x - arg_1443_2, arg_1443_0)), math.max(24, math.min(arg_1439_1.y - arg_1443_3 - 24, arg_1443_1))
			end,
			apply_layout = function(arg_1444_0, arg_1444_1)
				var_1368_26.pos.x = arg_1444_0
				var_1368_26.pos.y = arg_1444_1
				arg_1439_2.x = arg_1444_0
				arg_1439_2.y = arg_1444_1
				arg_1439_2._user_pos = true

				local var_1444_0 = math.max(1, tonumber(var_1368_26.size.x) or 1)

				arg_1439_2.cxf = math.max(0, math.min(1, (arg_1444_0 + var_1444_0 * 0.5) / math.max(1, arg_1439_1.x)))
			end,
			on_release = function(arg_1445_0)
				slot_0_89_0.overlay_drag_release_third(arg_1445_0, var_1368_26.size.x, arg_1439_1, var_1368_4, 24, arg_1439_1.y - var_1368_26.size.y - 24)

				arg_1445_0._user_pos = true
				arg_1445_0.cxf = math.max(0, math.min(1, (arg_1445_0.x + var_1368_26.size.x * 0.5) / math.max(1, arg_1439_1.x)))
				var_1368_26.align = arg_1445_0.align
				var_1368_26.pos.x = arg_1445_0.x
				var_1368_26.pos.y = arg_1445_0.y
			end,
			on_save = function()
				slot_0_89_0.store_write()
				pcall(slot_0_125_0)
			end,
			on_reset = function(arg_1447_0)
				var_1368_70(arg_1447_0 == true)
			end,
			set_mouse_block = function(arg_1448_0)
				slot_0_78_0.ov_wm_mouse_block = arg_1448_0
			end
		})
	end

	local function var_1368_72(arg_1449_0, arg_1449_1)
		var_1368_26.slots = {}
		var_1368_26.active = 0

		local var_1449_0, var_1449_1, var_1449_2, var_1449_3 = var_1368_52(arg_1449_0)
		local var_1449_4 = var_1368_48(arg_1449_0, "Avatar") and var_1368_46(var_1368_29(arg_1449_0.wm_avatar, "Steam")) or nil
		local var_1449_5 = var_1449_4 ~= nil or var_1449_2 or var_1449_3
		local var_1449_6 = var_1368_27("p1", var_1449_5 and arg_1449_1 or 0, 12)
		local var_1449_7 = var_1368_49(arg_1449_0)

		if not var_1449_7 then
			var_1368_35("brand", var_1368_50(), var_1368_26.logo_mix, {
				logo_only = true
			})
		elseif var_1368_48(arg_1449_0, "Logo") then
			var_1368_35("brand", var_1368_33(), var_1368_26.logo_mix)
		end

		local var_1449_8 = var_1368_34(var_1449_0, var_1449_4)

		if var_1449_8 > 0 then
			var_1368_35("id", var_1449_8, var_1449_6, {
				name = var_1449_0,
				avatar = var_1449_4
			})
		end

		if var_1449_3 then
			local var_1449_9 = "\aFFFFFF50" .. var_1449_1

			var_1368_35("build", var_1368_30(var_1449_9, var_1368_14), var_1449_6, {
				text = var_1449_9
			})
		end

		local var_1449_10, var_1449_11 = var_1368_53(arg_1449_0)
		local var_1449_12 = var_1368_27("p2", var_1449_10 ~= nil and arg_1449_1 or 0, 12)

		if var_1449_10 then
			var_1368_35("time", var_1368_30(var_1449_10, var_1368_14), var_1449_12, {
				text = var_1449_10
			})
		end

		if var_1449_11 then
			var_1368_35("day", var_1368_30(var_1449_11, var_1368_14), var_1449_12, {
				text = var_1449_11
			})
		end

		local var_1449_13, var_1449_14 = var_1368_54()

		if var_1368_48(arg_1449_0, "Ping") and var_1449_14 > 5 and var_1368_26.active > 0 and var_1368_30(var_1449_13, var_1368_14) > 0 then
			var_1368_35("ping", var_1368_30(var_1449_13, var_1368_14), var_1368_27("p3", arg_1449_1, 12), {
				text = var_1449_13
			})
		end

		local var_1449_15 = var_1368_4

		for iter_1449_0 = 1, #var_1368_26.slots do
			local var_1449_16 = var_1368_26.slots[iter_1449_0]

			var_1449_15 = var_1449_15 + var_1449_16.sw * var_1449_16.mix

			if iter_1449_0 < #var_1368_26.slots then
				local var_1449_17 = var_1368_26.slots[iter_1449_0 + 1]

				var_1449_15 = var_1449_15 + var_1368_8() * math.min(var_1449_16.mix, var_1449_17.mix)
			end
		end

		local var_1449_18 = not var_1449_7 and #var_1368_26.slots == 1 and var_1368_26.slots[1].kind == "brand" and var_1368_26.slots[1].extra.logo_only == true and var_1368_1.x + var_1368_4 * 2 or 66

		var_1368_26.size.x = math.max(var_1449_18, var_1449_15 + var_1368_4)
		var_1368_26.size.y = var_1368_0
	end

	local function var_1368_73(arg_1450_0)
		local var_1450_0 = var_1368_26.pos.y
		local var_1450_1 = var_1368_26.pos.x + var_1368_4

		for iter_1450_0 = 1, #var_1368_26.slots do
			local var_1450_2 = var_1368_26.slots[iter_1450_0]

			if var_1450_2.mix > 0.001 then
				local var_1450_3 = var_1450_1 + (var_1450_2.sw - var_1450_2.cw) * 0.5

				var_1368_68(var_1450_2, var_1450_3, var_1450_0, arg_1450_0)

				var_1450_1 = var_1450_1 + var_1450_2.sw * var_1450_2.mix

				if iter_1450_0 < #var_1368_26.slots then
					local var_1450_4 = var_1368_26.slots[iter_1450_0 + 1]

					if var_1450_4.mix > 0.001 then
						local var_1450_5 = arg_1450_0 * math.min(var_1450_2.mix, var_1450_4.mix)
						local var_1450_6 = var_1450_1 + var_1368_7 + var_1368_6 * 0.5

						if slot_0_89_0.hud_widget_use_arc_divider() and var_1450_2.kind == "brand" then
							slot_0_89_0.paint_hud_divider_arc(var_1450_6, var_1450_0, var_1450_0 + var_1368_0, var_1450_5, false)
						else
							var_1368_62(var_1450_6, var_1450_0, var_1450_5)
						end

						var_1450_1 = var_1450_1 + var_1368_8() * math.min(var_1450_2.mix, var_1450_4.mix)
					end
				end
			end
		end
	end

	var_1368_43()
	var_1368_36()
	var_1368_44(true)
	pcall(function()
		events.player_spawn:set(function(arg_1452_0)
			if type(arg_1452_0) ~= "table" then
				return
			end

			local var_1452_0 = entity.get_local_player()

			if not var_1452_0 then
				return
			end

			local var_1452_1, var_1452_2 = pcall(function()
				return entity.get(arg_1452_0.userid, true) == var_1452_0
			end)

			if var_1452_1 and var_1452_2 then
				var_1368_45()
			end
		end)
	end)
	pcall(function()
		events.round_prestart:set(function()
			var_1368_45()
			pcall(aa_brute_reset)

			if slot_0_78_0.runtime_sanitize then
				slot_0_78_0.runtime_sanitize(false)
			end

			if slot_0_78_0.hc_manip_reset_misses then
				slot_0_78_0.hc_manip_reset_misses()
			end
		end)
	end)
	pcall(function()
		local var_1456_0 = slot_0_152_0.vars.ov_watermark and slot_0_152_0.vars.ov_watermark.wm_name_custom

		if var_1456_0 and type(var_1456_0.set_callback) == "function" then
			var_1456_0:set_callback(function(arg_1457_0)
				local var_1457_0 = tostring(arg_1457_0.value or ""):gsub("^%s+", ""):gsub("%s+$", ""):gsub("\\f<(.-)>", ui.get_icon):gsub("\\v", "\a{Link Active}"):gsub("\\r", "\aDEFAULT")

				if #var_1457_0 > 24 then
					var_1457_0 = var_1457_0:sub(1, 24)
				end

				arg_1457_0:set(var_1457_0)
			end, true)
		end
	end)

	return function()
		slot_0_78_0.ov_wm_mouse_block = false

		if not slot_0_65_0() then
			var_1368_70(false)

			return
		end

		if not slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_panel, false) then
			var_1368_70(false)

			return
		end

		local var_1458_0 = var_1368_28()

		if not var_1458_0 or slot_0_89_0.ov_sw(var_1458_0, false) ~= true then
			var_1368_70(false)

			return
		end

		local var_1458_1 = slot_0_89_0.screen_size_cached()
		local var_1458_2 = var_1368_55(var_1458_1)
		local var_1458_3 = 0

		pcall(function()
			var_1458_3 = ui.get_alpha() or 0
		end)

		slot_0_78_0.ui_kill_flash = slot_0_89_0.wm_kill_flash_mix()
		var_1368_26.show_mix = 1

		if not var_1368_18 and var_1368_29(var_1458_0.wm_avatar, "Steam") == "Steam" then
			var_1368_44(true)
		end

		if var_1368_29(var_1458_0.wm_avatar, "Steam") == "Cloud" then
			var_1368_41(false)

			if not var_1368_21 then
				var_1368_42()
			end
		end

		local var_1458_4 = not var_1368_49(var_1458_0) or var_1368_48(var_1458_0, "Logo")

		var_1368_26.logo_mix = var_1458_4 and 1 or 0

		var_1368_72(var_1458_0, 1)

		local var_1458_5 = var_1368_26.size.x
		local var_1458_6 = var_1368_26.size.y

		var_1368_26.size_x_prev = var_1458_5

		if not var_1368_25.active then
			var_1368_59(var_1458_2, var_1458_5, var_1458_1)
		end

		var_1368_26.pos.x = var_1458_2.x
		var_1368_26.pos.y = var_1458_2.y
		var_1368_26.align = math.max(0, math.min(2, math.floor(tonumber(var_1458_2.align) or var_1368_26.align or 0)))

		var_1368_71(var_1458_3, var_1458_1, var_1458_2)

		var_1368_26.pos.x = var_1458_2.x
		var_1368_26.pos.y = var_1458_2.y

		local var_1458_7 = 1

		if var_1368_26.active > 0 or var_1368_26.logo_mix > 0 then
			var_1368_67(vector(var_1368_26.pos.x, var_1368_26.pos.y - 2), vector(var_1368_26.pos.x + var_1458_5, var_1368_26.pos.y + var_1368_0), var_1458_7)
		end

		var_1368_73(var_1458_7)

		if var_1458_3 > 0.01 then
			slot_0_89_0.overlay_drag_paint_hover({
				drag = var_1368_25,
				get_rect = function()
					return var_1368_26.pos.x, var_1368_26.pos.y, var_1458_5, var_1458_6
				end
			}, var_1458_3, var_1458_1)
		end
	end
end)()
slot_0_78_0.hud_elog_tick = (function()
	slot_1461_0_0 = 22
	slot_1461_1_0 = 10
	slot_1461_2_0 = 4
	slot_1461_3_0 = 24
	slot_1461_4_0 = 6
	slot_1461_5_0 = 3
	slot_1461_6_0 = 4
	slot_1461_7_0 = slot_1461_3_0 + slot_1461_5_0 + slot_1461_4_0 + slot_1461_5_0 + slot_1461_6_0
	slot_1461_8_0 = {
		hit = {
			fallback = "",
			names = {
				"gun"
			},
			size = vector(16, 12)
		},
		skull = {
			fallback = "",
			names = {
				"skull"
			},
			size = vector(18, 14)
		},
		harmed = {
			fallback = "",
			names = {
				"face-anguished"
			},
			size = vector(18, 14)
		},
		evaded = {
			fallback = "",
			names = {
				"person-circle-check",
				"circle-user-check"
			},
			size = vector(16, 12)
		},
		miss = {
			fallback = "",
			names = {
				"triangle-exclamation",
				"exclamation-triangle"
			},
			size = vector(18, 14)
		},
		greet = {
			fallback = "",
			names = {
				"hand-wave",
				"hand"
			},
			size = vector(16, 12)
		},
		antibrute = {
			fallback = "",
			names = {
				"timer"
			},
			size = vector(16, 12)
		},
		cfg_save = {
			fallback = "",
			names = {
				"floppy-disk"
			},
			size = vector(16, 12)
		},
		cfg_load = {
			fallback = "",
			names = {
				"arrow-down",
				"download"
			},
			size = vector(16, 12)
		},
		cfg_cloud = {
			fallback = "",
			names = {
				"cloud",
				"cloud-arrow-up"
			},
			size = vector(16, 12)
		},
		cfg_delete = {
			fallback = "",
			names = {
				"trash"
			},
			size = vector(16, 12)
		},
		cfg_import = {
			fallback = "",
			names = {
				"arrow-down-to-bracket",
				"file-import"
			},
			size = vector(16, 12)
		},
		cfg_export = {
			fallback = "",
			names = {
				"arrow-up-from-bracket",
				"file-export"
			},
			size = vector(16, 12)
		},
		cfg_warn = {
			fallback = "",
			names = {
				"triangle-exclamation",
				"exclamation-triangle"
			},
			size = vector(16, 12)
		},
		cfg_sync = {
			fallback = "",
			names = {
				"arrows-rotate",
				"rotate"
			},
			size = vector(16, 12)
		},
		server = {
			fallback = "",
			names = {
				"server"
			},
			size = vector(16, 12)
		}
	}
	slot_1461_9_0 = {}
	slot_1461_10_0 = {}
	slot_1461_11_0 = {}
	slot_1461_12_0 = false
	slot_1461_13_0 = nil
	slot_1461_14_0 = nil
	slot_1461_15_0 = {
		active = false,
		hover = false
	}
	slot_1461_16_0 = {
		align = 1,
		pos = vector(868, 829),
		size = vector(280, slot_1461_0_0)
	}

	function slot_1461_17_0(arg_1462_0)
		local var_1462_0, var_1462_1 = pcall(render.load_font, "Segoe UI Semibold", arg_1462_0 or vector(14, 12), "a")

		if var_1462_0 and var_1462_1 then
			return var_1462_1
		end

		return 1
	end

	slot_1461_18_0 = slot_1461_17_0(vector(14, 12))

	function slot_1461_19_0(arg_1463_0)
		return slot_1461_8_0[arg_1463_0] or slot_1461_8_0.hit
	end

	function slot_1461_20_0(arg_1464_0)
		if not slot_1461_8_0[arg_1464_0] then
			arg_1464_0 = "hit"
		end

		if slot_1461_9_0[arg_1464_0] ~= nil then
			return slot_1461_9_0[arg_1464_0]
		end

		local var_1464_0 = slot_1461_19_0(arg_1464_0)

		for iter_1464_0 = 1, #var_1464_0.names do
			local var_1464_1, var_1464_2 = pcall(ui.get_icon, var_1464_0.names[iter_1464_0])

			if var_1464_1 and type(var_1464_2) == "string" and #var_1464_2 > 0 then
				slot_1461_9_0[arg_1464_0] = var_1464_2

				return var_1464_2
			end
		end

		slot_1461_9_0[arg_1464_0] = var_1464_0.fallback or ""

		return slot_1461_9_0[arg_1464_0]
	end

	function slot_1461_21_0(arg_1465_0)
		if not slot_1461_8_0[arg_1465_0] then
			arg_1465_0 = "hit"
		end

		if slot_1461_10_0[arg_1465_0] then
			return slot_1461_10_0[arg_1465_0]
		end

		slot_1461_10_0[arg_1465_0] = slot_1461_17_0(slot_1461_19_0(arg_1465_0).size)

		return slot_1461_10_0[arg_1465_0]
	end

	function slot_1461_22_0(arg_1466_0)
		if arg_1466_0 and slot_1461_8_0[arg_1466_0.icon] then
			return arg_1466_0.icon
		end

		slot_1466_1_0 = tostring(arg_1466_0 and arg_1466_0.text or "")

		if slot_1466_1_0:find("connected to ", 1, true) or slot_1466_1_0:find("Disconnected from ", 1, true) then
			return "server"
		end

		if slot_1466_1_0:find("Good day, ", 1, true) or slot_1466_1_0:find("good Night, ", 1, true) then
			return "greet"
		end

		if slot_1466_1_0:find("Harmed by", 1, true) then
			return "harmed"
		end

		if slot_1466_1_0:find("Destroyed ", 1, true) then
			return "skull"
		end

		if slot_1466_1_0:find("Evaded ", 1, true) then
			return "evaded"
		end

		if slot_1466_1_0:find("Changed anti-aim due to ", 1, true) or slot_1466_1_0:find("Anti-aim ", 1, true) then
			return "antibrute"
		end

		if slot_1466_1_0:find("Missed ", 1, true) then
			return "miss"
		end

		if slot_1466_1_0:find("Saved cloud config", 1, true) or slot_1466_1_0:find("Loaded cloud", 1, true) or slot_1466_1_0:find("Deleted cloud config", 1, true) then
			return "cfg_cloud"
		end

		if slot_1466_1_0:find("Saved config", 1, true) or slot_1466_1_0:find("Created config", 1, true) then
			return "cfg_save"
		end

		if slot_1466_1_0:find("Loaded config", 1, true) or slot_1466_1_0:find("Loaded AA", 1, true) then
			return "cfg_load"
		end

		if slot_1466_1_0:find("Deleted config", 1, true) then
			return "cfg_delete"
		end

		if slot_1466_1_0:find("Imported config", 1, true) then
			return "cfg_import"
		end

		if slot_1466_1_0:find("Exported config", 1, true) then
			return "cfg_export"
		end

		if slot_1466_1_0:find("Statistics", 1, true) then
			return "cfg_sync"
		end

		slot_1466_2_0 = slot_1466_1_0:lower()

		if slot_1466_2_0:find("failed", 1, true) or slot_1466_2_0:find("invalid", 1, true) or slot_1466_2_0:find("not found", 1, true) or slot_1466_2_0:find("required", 1, true) or slot_1466_2_0:find("forbidden", 1, true) or slot_1466_2_0:find("configured", 1, true) or slot_1466_2_0:find("connect first", 1, true) or slot_1466_2_0:find("empty", 1, true) or slot_1466_2_0:find("selected", 1, true) or slot_1466_2_0:find("reserved", 1, true) or slot_1466_2_0:find("recommended", 1, true) then
			return "cfg_warn"
		end

		return "hit"
	end

	function slot_1461_23_0(arg_1467_0, arg_1467_1, arg_1467_2)
		local var_1467_0 = "ap.elog\x00" .. arg_1467_0
		local var_1467_1 = slot_1461_11_0[var_1467_0] or 0
		local var_1467_2 = var_1467_1 + (arg_1467_1 - var_1467_1) * math.min(1, (globals.frametime or 0.016) * (arg_1467_2 or 14))

		slot_1461_11_0[var_1467_0] = var_1467_2

		return var_1467_2
	end

	function slot_1461_24_0(arg_1468_0)
		return (slot_0_89_0.measure_cached(slot_1461_18_0, arg_1468_0))
	end

	function slot_1461_25_0(arg_1469_0)
		return color(255, 255, 255, math.floor(52 * (arg_1469_0 or 1)))
	end

	function slot_1461_26_0(arg_1470_0, arg_1470_1)
		local var_1470_0, var_1470_1 = slot_0_89_0.measure_cached(arg_1470_1 or slot_1461_18_0, arg_1470_0)

		if type(var_1470_1) == "number" and var_1470_1 > 0 then
			return var_1470_1
		end

		return 12
	end

	function slot_1461_27_0(arg_1471_0, arg_1471_1, arg_1471_2)
		return arg_1471_0 + math.max(1, (slot_1461_0_0 - slot_1461_26_0(arg_1471_2, arg_1471_1)) * 0.5)
	end

	function slot_1461_28_0(arg_1472_0, arg_1472_1, arg_1472_2, arg_1472_3, arg_1472_4)
		local var_1472_0 = slot_1461_20_0(arg_1472_3)

		if var_1472_0 == "" or arg_1472_2 <= 0.001 then
			return
		end

		arg_1472_4 = arg_1472_4 or arg_1472_0 + slot_1461_3_0 + slot_1461_5_0 + slot_1461_4_0 * 0.5

		local var_1472_1 = slot_1461_21_0(arg_1472_3)
		local var_1472_2 = slot_0_89_0.hud_accent_color(arg_1472_2)

		pcall(function()
			local var_1473_0, var_1473_1 = pcall(function()
				return render.measure_text(var_1472_1, nil, var_1472_0)
			end)
			local var_1473_2 = var_1473_0 and var_1473_1 and type(var_1473_1.x) == "number" and var_1473_1.x or 14
			local var_1473_3 = arg_1472_0 + slot_1461_3_0 + slot_1461_5_0
			local var_1473_4 = arg_1472_0 + slot_1461_3_0 * 0.5 - var_1473_2 * 0.5
			local var_1473_5 = math.max(arg_1472_0, math.min(var_1473_4, var_1473_3 - var_1473_2 - 2))
			local var_1473_6 = slot_1461_27_0(arg_1472_1, var_1472_1, var_1472_0)

			render.text(var_1472_1, vector(var_1473_5, var_1473_6), var_1472_2, nil, var_1472_0)
		end)
	end

	function slot_1461_29_0(arg_1475_0, arg_1475_1, arg_1475_2)
		if arg_1475_2 <= 0.001 then
			return
		end

		local var_1475_0 = slot_1461_25_0(arg_1475_2)
		local var_1475_1 = arg_1475_1 + 5
		local var_1475_2 = arg_1475_1 + slot_1461_0_0 - 5
		local var_1475_3 = slot_1461_4_0 * 0.5

		pcall(function()
			render.line(vector(arg_1475_0 + var_1475_3, var_1475_1), vector(arg_1475_0 - var_1475_3, var_1475_2), var_1475_0)
		end)
	end

	function slot_1461_30_0(arg_1477_0, arg_1477_1)
		local var_1477_0 = slot_0_78_0.ELOG_TTL_SEC or 4
		local var_1477_1 = slot_0_78_0.ELOG_FADE_SEC or 0.4
		local var_1477_2 = arg_1477_1 - (arg_1477_0.time or 0)

		if var_1477_0 <= var_1477_2 then
			return 0
		end

		if var_1477_2 <= var_1477_0 - var_1477_1 then
			return 1
		end

		return math.max(0, (var_1477_0 - var_1477_2) / var_1477_1)
	end

	function slot_1461_31_0()
		if slot_1461_12_0 then
			return
		end

		slot_1461_12_0 = true

		pcall(function()
			slot_1461_13_0 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M0 6V4c0-2 2-4 4-4v2C2 2 0 4 0 6Z\"/></svg>", vector(8, 12))
			slot_1461_14_0 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M4 6c0-2-2-4-4-4V0c2 0 4 2 4 4v2Z\"/></svg>", vector(8, 12))
		end)
	end

	function slot_1461_32_0(arg_1480_0, arg_1480_1, arg_1480_2)
		slot_1461_31_0()
		slot_0_89_0.paint_hud_card_bg(arg_1480_0, arg_1480_1, arg_1480_2, slot_1461_13_0, slot_1461_14_0)
	end

	function slot_1461_33_0(arg_1481_0, arg_1481_1, arg_1481_2, arg_1481_3, arg_1481_4)
		local var_1481_0 = type(arg_1481_3) == "table" and arg_1481_3.text or arg_1481_3

		if arg_1481_4 <= 0.001 or not var_1481_0 or var_1481_0 == "" then
			return
		end

		if slot_0_78_0.screen_log_body and not var_1481_0:find(ELOG_SCREEN_MUTED, 1, true) then
			var_1481_0 = slot_0_78_0.screen_log_body(var_1481_0)
		end

		if var_1481_0:find(ELOG_SCREEN_HI, 1, true) then
			local var_1481_1 = type(slot_0_78_0.elog_accent_markup) == "function" and slot_0_78_0.elog_accent_markup or nil

			if var_1481_1 then
				var_1481_0 = var_1481_0:gsub(ELOG_SCREEN_HI, var_1481_1(arg_1481_4))
			end
		end

		local var_1481_2 = arg_1481_0 + slot_1461_2_0
		local var_1481_3 = var_1481_2 + slot_1461_3_0 + slot_1461_5_0 + slot_1461_4_0 * 0.5

		slot_1461_28_0(var_1481_2, arg_1481_1, arg_1481_4, slot_1461_22_0(type(arg_1481_3) == "table" and arg_1481_3 or nil), var_1481_3)

		if slot_0_89_0.hud_widget_use_arc_divider() then
			slot_0_89_0.paint_hud_divider_line(var_1481_3, arg_1481_1, arg_1481_1 + slot_1461_0_0, arg_1481_4)
		else
			slot_1461_29_0(var_1481_3, arg_1481_1, arg_1481_4)
		end

		local var_1481_4 = var_1481_2 + slot_1461_7_0

		pcall(function()
			render.text(slot_1461_18_0, vector(var_1481_4, slot_1461_27_0(arg_1481_1, slot_1461_18_0, var_1481_0)), color(255, 255, 255, math.floor(255 * arg_1481_4)), nil, var_1481_0)
		end)
	end

	function slot_1461_34_0(arg_1483_0)
		if not slot_0_78_0.ov_store_loaded then
			slot_0_89_0.store_read()

			slot_0_78_0.ov_store_loaded = true
		end

		local var_1483_0 = slot_0_89_0.store_slot("elog")

		if var_1483_0._init ~= true then
			var_1483_0.align = 1
			var_1483_0.y = 829
			var_1483_0.x = 868
			var_1483_0._init = true
			var_1483_0._elog_v2 = true

			slot_0_89_0.store_write()
		elseif var_1483_0._elog_v2 ~= true then
			var_1483_0.align = 1
			var_1483_0.y = 829
			var_1483_0.x = 868
			var_1483_0._elog_v2 = true

			slot_0_89_0.store_write()
		end

		slot_1461_16_0.align = math.max(0, math.min(2, math.floor(tonumber(var_1483_0.align) or 0)))

		return var_1483_0
	end

	function slot_1461_35_0(arg_1484_0, arg_1484_1, arg_1484_2, arg_1484_3)
		local var_1484_0 = slot_1461_2_0

		arg_1484_0.x = math.max(var_1484_0, math.min(arg_1484_3.x - arg_1484_1 - var_1484_0, arg_1484_0.x))
		arg_1484_0.y = math.max(24, math.min(arg_1484_3.y - arg_1484_2 - 24, arg_1484_0.y))
	end

	function slot_1461_36_0(arg_1485_0, arg_1485_1, arg_1485_2, arg_1485_3, arg_1485_4)
		arg_1485_1 = math.max(1, tonumber(arg_1485_1) or arg_1485_2)
		arg_1485_2 = math.max(1, tonumber(arg_1485_2) or arg_1485_1)

		local var_1485_0 = slot_1461_2_0
		local var_1485_1 = math.max(0, math.min(2, math.floor(tonumber(arg_1485_0.align) or 0)))

		if var_1485_1 == 2 then
			arg_1485_0.x = arg_1485_0.x + arg_1485_1 - arg_1485_2
		elseif var_1485_1 == 0 and arg_1485_0.x <= var_1485_0 + 2 then
			-- block empty
		else
			arg_1485_0.x = arg_1485_0.x + arg_1485_1 * 0.5 - arg_1485_2 * 0.5
		end

		slot_1461_35_0(arg_1485_0, arg_1485_2, arg_1485_4, arg_1485_3)
	end

	slot_1461_37_0 = {
		{
			mix = 1,
			icon = "hit",
			text = elog_screen_fmt("m", "Hit ", "h", "enemy", "m", "'s ", "h", "head", "m", " for ", "h", "87", "m", " hp  ~  Δ: ", "h", "12", "m", "t")
		},
		{
			mix = 1,
			icon = "skull",
			text = elog_screen_fmt("m", "Destroyed ", "h", "enemy")
		},
		{
			mix = 1,
			icon = "harmed",
			text = elog_screen_fmt("m", "Harmed by ", "h", "enemy", "m", " in the ", "h", "chest", "m", " for ", "h", "42", "m", " damage (", "h", "58", "m", " health remaining)")
		},
		{
			mix = 1,
			icon = "miss",
			text = elog_screen_fmt("m", "Missed ", "h", "head", "m", " due to ", "h", "spread")
		},
		{
			mix = 1,
			icon = "evaded",
			text = elog_screen_fmt("m", "Evaded ", "h", "enemy", "m", "'s shot (~", "h", "64", "m", "u)")
		},
		{
			mix = 1,
			icon = "antibrute",
			text = elog_screen_fmt("m", "Changed anti-aim due to ", "h", "enemy", "m", "'s bullet")
		}
	}

	function slot_1461_38_0(arg_1486_0, arg_1486_1)
		local var_1486_0 = {}
		local var_1486_1 = slot_0_78_0.screen_logs or {}

		for iter_1486_0 = 1, #var_1486_1 do
			local var_1486_2 = var_1486_1[iter_1486_0]

			if not arg_1486_1 or var_1486_2.force == true then
				local var_1486_3 = slot_1461_30_0(var_1486_2, arg_1486_0)

				if var_1486_3 > 0.001 then
					var_1486_0[#var_1486_0 + 1] = {
						text = var_1486_2.text,
						mix = var_1486_3,
						icon = var_1486_2.icon
					}
				end
			end
		end

		return var_1486_0
	end

	function slot_1461_39_0(arg_1487_0)
		if arg_1487_0 <= 0.001 then
			return {}
		end

		local var_1487_0 = {}

		for iter_1487_0 = 1, #slot_1461_37_0 do
			local var_1487_1 = slot_1461_37_0[iter_1487_0]

			var_1487_0[#var_1487_0 + 1] = {
				text = var_1487_1.text,
				mix = arg_1487_0,
				icon = var_1487_1.icon
			}
		end

		return var_1487_0
	end

	function slot_1461_40_0(arg_1488_0)
		local var_1488_0 = 120

		for iter_1488_0 = 1, #arg_1488_0 do
			var_1488_0 = math.max(var_1488_0, slot_1461_2_0 + slot_1461_7_0 + slot_1461_24_0(arg_1488_0[iter_1488_0].text) + slot_1461_2_0)
		end

		local var_1488_1 = 0

		if #arg_1488_0 > 0 then
			var_1488_1 = #arg_1488_0 * slot_1461_0_0 + (#arg_1488_0 - 1) * slot_1461_1_0
		end

		slot_1461_16_0.size.x = var_1488_0
		slot_1461_16_0.size.y = math.max(slot_1461_0_0, var_1488_1)
	end

	function slot_1461_41_0(arg_1489_0)
		local var_1489_0, var_1489_1, var_1489_2 = pcall(function()
			return ui.get_position(), ui.get_size()
		end)

		if not var_1489_0 or not var_1489_1 or not var_1489_2 then
			return false
		end

		return slot_0_89_0.point_in_rect(arg_1489_0.x, arg_1489_0.y, var_1489_1.x, var_1489_1.y, var_1489_2.x, var_1489_2.y)
	end

	function slot_1461_42_0(arg_1491_0)
		if arg_1491_0 and slot_1461_15_0.active then
			slot_0_89_0.store_write()
		end

		slot_0_89_0.overlay_drag_clear(slot_1461_15_0, arg_1491_0 ~= true)

		slot_0_78_0.ov_elog_mouse_block = false
	end

	function slot_1461_43_0(arg_1492_0, arg_1492_1, arg_1492_2)
		slot_0_89_0.overlay_drag_think({
			drag = slot_1461_15_0,
			menu_alpha = arg_1492_0,
			scr = arg_1492_1,
			slot = arg_1492_2,
			mouse_on_menu = slot_1461_41_0,
			get_rect = function()
				return slot_1461_16_0.pos.x, slot_1461_16_0.pos.y, slot_1461_16_0.size.x, slot_1461_16_0.size.y
			end,
			is_blocked = function()
				return slot_0_78_0.ov_wm_mouse_block or slot_0_78_0.chi_mouse_block or slot_0_78_0.ov_slowdown_mouse_block or slot_0_78_0.ov_keybinds_mouse_block or slot_0_78_0.ov_damage_ind_mouse_block or slot_0_78_0.ov_metrics_mouse_block or slot_0_78_0.ov_spectators_mouse_block
			end,
			on_held = function(arg_1495_0, arg_1495_1)
				arg_1495_1.draw_align = slot_1461_16_0.align
				arg_1495_0.align = 0
			end,
			snap_pos = function(arg_1496_0, arg_1496_1, arg_1496_2, arg_1496_3)
				local var_1496_0 = slot_1461_15_0.aligning == "y" and "y" or slot_1461_15_0.aligning == "x" and "x" or nil
				local var_1496_1 = slot_0_89_0.snap_box_to_guides(vector(arg_1496_0, arg_1496_1), vector(arg_1496_2, arg_1496_3), arg_1492_1, var_1496_0)

				return var_1496_1.x, var_1496_1.y
			end,
			clamp_pos = function(arg_1497_0, arg_1497_1, arg_1497_2, arg_1497_3)
				return math.max(0, math.min(arg_1492_1.x - arg_1497_2, arg_1497_0)), math.max(24, math.min(arg_1492_1.y - arg_1497_3 - 24, arg_1497_1))
			end,
			apply_layout = function(arg_1498_0, arg_1498_1)
				slot_1461_16_0.pos.x = arg_1498_0
				slot_1461_16_0.pos.y = arg_1498_1
				arg_1492_2.x = arg_1498_0
				arg_1492_2.y = arg_1498_1
			end,
			on_release = function(arg_1499_0)
				slot_0_89_0.overlay_drag_release_third(arg_1499_0, slot_1461_16_0.size.x, arg_1492_1, slot_1461_2_0, 24, arg_1492_1.y - slot_1461_16_0.size.y - 24)

				slot_1461_16_0.align = arg_1499_0.align
			end,
			on_save = function()
				slot_0_89_0.store_write()
			end,
			on_reset = function(arg_1501_0)
				slot_1461_42_0(arg_1501_0 == true)
			end,
			set_mouse_block = function(arg_1502_0)
				slot_0_78_0.ov_elog_mouse_block = arg_1502_0
			end
		})
	end

	function slot_1461_44_0(arg_1503_0)
		local var_1503_0 = slot_0_78_0.screen_logs or {}
		local var_1503_1 = {}

		for iter_1503_0 = 1, #var_1503_0 do
			if slot_1461_30_0(var_1503_0[iter_1503_0], arg_1503_0) > 0.001 then
				var_1503_1[#var_1503_1 + 1] = var_1503_0[iter_1503_0]
			end
		end

		slot_0_78_0.screen_logs = var_1503_1
	end

	return function()
		slot_0_78_0.ov_elog_mouse_block = false
		slot_1504_0_0 = screen_log_hud_enabled()
		slot_1504_1_0 = not slot_1504_0_0

		if not slot_1504_0_0 and not screen_log_has_forced() then
			slot_1461_42_0(false)

			return
		end

		slot_1504_2_0 = slot_0_89_0.screen_size_cached()

		if not slot_1504_2_0 or not slot_1504_2_0.x or slot_1504_2_0.x < 8 then
			return
		end

		slot_1504_3_0 = globals.realtime or 0

		slot_1461_44_0(slot_1504_3_0)

		slot_1504_4_0 = 0

		pcall(function()
			slot_1504_4_0 = ui.get_alpha() or 0
		end)

		slot_1504_5_0 = slot_1461_34_0(slot_1504_2_0)
		slot_1504_6_0 = slot_1461_38_0(slot_1504_3_0, slot_1504_1_0)
		slot_1504_7_0 = slot_1504_0_0 and slot_1504_4_0 > 0.01
		slot_1504_8_0 = slot_1504_0_0 and slot_0_89_0.hud_fade("hud_menu", slot_1504_7_0) or 0
		slot_1504_9_0 = slot_1504_6_0

		if #slot_1504_6_0 == 0 and slot_1504_8_0 > 0.001 then
			slot_1504_9_0 = slot_1461_39_0(slot_1504_8_0)
		end

		slot_1461_40_0(slot_1504_9_0)

		slot_1461_16_0.size_x_prev = slot_1461_16_0.size.x

		if not slot_1461_15_0.active then
			slot_0_89_0.slot_apply_rest(slot_1504_5_0, slot_1461_16_0.size.x, slot_1461_16_0.size.y, slot_1504_2_0, slot_1461_2_0, 24, slot_1504_2_0.y - slot_1461_16_0.size.y - 24)

			slot_1461_16_0.align = slot_1504_5_0.align
		end

		slot_1461_43_0(slot_1504_4_0, slot_1504_2_0, slot_1504_5_0)

		slot_1461_16_0.pos.x = slot_1504_5_0.x
		slot_1461_16_0.pos.y = slot_1504_5_0.y
		slot_1504_10_0 = slot_0_89_0.hud_anim("elog", #slot_1504_6_0 > 0 or slot_1504_8_0 > 0.001, 24, 20)
		slot_0_78_0._elog_mix_prev = slot_0_78_0._elog_mix_prev or 0
		slot_1504_11_0 = slot_1504_10_0 < slot_0_78_0._elog_mix_prev - 0.0005
		slot_0_78_0._elog_mix_prev = slot_1504_10_0

		if slot_1504_10_0 <= 0.001 and slot_1504_8_0 <= 0.001 then
			return
		end

		slot_1504_12_0 = slot_1461_16_0.pos.y
		slot_1504_13_0 = slot_1461_16_0.align

		if slot_1461_15_0.active and slot_1461_15_0.draw_align ~= nil then
			slot_1504_13_0 = slot_1461_15_0.draw_align
		end

		for iter_1504_0 = 1, #slot_1504_9_0 do
			slot_1504_18_0 = slot_1504_9_0[iter_1504_0]
			slot_1504_19_0 = slot_0_89_0.elog_row_motion(slot_1504_10_0, iter_1504_0, #slot_1504_9_0, slot_1504_13_0, slot_1504_11_0)
			slot_1504_20_0 = slot_1504_10_0 * slot_1504_18_0.mix * slot_1504_19_0.alpha
			slot_1504_21_0 = math.max(80, slot_1461_2_0 + slot_1461_7_0 + slot_1461_24_0(slot_1504_18_0.text) + slot_1461_2_0) * slot_1504_19_0.scale_x
			slot_1504_22_0 = slot_1461_16_0.pos.x + slot_1504_19_0.slide_x

			if slot_1504_13_0 == 2 then
				slot_1504_22_0 = slot_1461_16_0.pos.x + slot_1461_16_0.size.x - slot_1504_21_0 + slot_1504_19_0.slide_x
			elseif slot_1504_13_0 == 1 then
				slot_1504_22_0 = slot_1461_16_0.pos.x + (slot_1461_16_0.size.x - slot_1504_21_0) * 0.5 + slot_1504_19_0.slide_x
			end

			slot_1504_23_0 = slot_1504_12_0 + slot_1504_19_0.slide_y

			slot_1461_32_0(vector(slot_1504_22_0, slot_1504_23_0), vector(slot_1504_22_0 + slot_1504_21_0, slot_1504_23_0 + slot_1461_0_0), slot_1504_20_0)
			slot_1461_33_0(slot_1504_22_0, slot_1504_23_0, slot_1504_21_0, slot_1504_18_0, slot_1504_20_0)

			slot_1504_12_0 = slot_1504_12_0 + slot_1461_0_0 + slot_1461_1_0
		end

		if slot_1504_4_0 > 0.01 then
			slot_0_89_0.overlay_drag_paint_hover({
				drag = slot_1461_15_0,
				get_rect = function()
					return slot_1461_16_0.pos.x, slot_1461_16_0.pos.y, slot_1461_16_0.size.x, slot_1461_16_0.size.y
				end
			}, slot_1504_4_0, slot_1504_2_0)
		end
	end
end)()
slot_0_78_0.hud_slowdown_tick = (function()
	local var_1507_0 = 22
	local var_1507_1 = 30
	local var_1507_2 = 4
	local var_1507_3 = 34
	local var_1507_4 = 6
	local var_1507_5 = 3
	local var_1507_6 = 4
	local var_1507_7 = var_1507_3 + var_1507_5 + var_1507_4 + var_1507_5 + var_1507_6
	local var_1507_8
	local var_1507_9 = 0.5
	local var_1507_10 = {}
	local var_1507_11 = false
	local var_1507_12
	local var_1507_13
	local var_1507_14 = {
		active = false,
		hover = false
	}
	local var_1507_15 = {
		align = 1,
		pos = vector(900, 380),
		size = vector(150, var_1507_1)
	}

	local function var_1507_16(arg_1508_0)
		local var_1508_0, var_1508_1 = pcall(render.load_font, "Segoe UI Semibold", arg_1508_0 or vector(14, 12), "a")

		if var_1508_0 and var_1508_1 then
			return var_1508_1
		end

		return 1
	end

	local var_1507_17 = var_1507_16(vector(14, 12))
	local var_1507_18 = var_1507_16(vector(24, 20))

	local function var_1507_19()
		if var_1507_8 ~= nil then
			return var_1507_8
		end

		local var_1509_0, var_1509_1 = pcall(ui.get_icon, "rabbit-running")

		if var_1509_0 and type(var_1509_1) == "string" and #var_1509_1 > 0 then
			var_1507_8 = var_1509_1

			return var_1509_1
		end

		var_1507_8 = ""

		return ""
	end

	local function var_1507_20(arg_1510_0, arg_1510_1, arg_1510_2)
		local var_1510_0 = "ap.slow\x00" .. arg_1510_0
		local var_1510_1 = var_1507_10[var_1510_0] or 0
		local var_1510_2 = var_1510_1 + (arg_1510_1 - var_1510_1) * math.min(1, (globals.frametime or 0.016) * (arg_1510_2 or 14))

		var_1507_10[var_1510_0] = var_1510_2

		return var_1510_2
	end

	local function var_1507_21(arg_1511_0)
		return (slot_0_89_0.measure_cached(var_1507_17, arg_1511_0))
	end

	local function var_1507_22(arg_1512_0)
		return arg_1512_0 + var_1507_2 + var_1507_3 + var_1507_5 + var_1507_4 * 0.5
	end

	local function var_1507_23()
		if var_1507_19() == "" then
			return 0
		end

		return var_1507_7
	end

	local function var_1507_24(arg_1514_0)
		return arg_1514_0 + var_1507_2 + var_1507_23()
	end

	local function var_1507_25(arg_1515_0, arg_1515_1, arg_1515_2, arg_1515_3)
		local var_1515_0 = var_1507_19()

		if var_1515_0 == "" or arg_1515_3 <= 0.001 then
			return
		end

		local var_1515_1 = slot_0_89_0.hud_accent_color(arg_1515_3)

		pcall(function()
			local var_1516_0, var_1516_1 = pcall(function()
				return render.measure_text(var_1507_18, nil, var_1515_0)
			end)
			local var_1516_2 = var_1516_0 and var_1516_1 and type(var_1516_1.x) == "number" and var_1516_1.x or 20
			local var_1516_3 = var_1516_0 and var_1516_1 and type(var_1516_1.y) == "number" and var_1516_1.y or 20
			local var_1516_4 = arg_1515_0 + var_1507_2
			local var_1516_5 = var_1516_4 + (var_1507_22(arg_1515_0) - var_1516_4) * 0.5 - var_1516_2 * 0.5
			local var_1516_6 = arg_1515_1 + math.max(1, (arg_1515_2 - var_1516_3) * 0.5)

			render.text(var_1507_18, vector(var_1516_5, var_1516_6), var_1515_1, nil, var_1515_0)
		end)
	end

	local function var_1507_26()
		if var_1507_11 then
			return
		end

		var_1507_11 = true

		pcall(function()
			var_1507_12 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M0 6V4c0-2 2-4 4-4v2C2 2 0 4 0 6Z\"/></svg>", vector(8, 12))
			var_1507_13 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M4 6c0-2-2-4-4-4V0c2 0 4 2 4 4v2Z\"/></svg>", vector(8, 12))
		end)
	end

	local function var_1507_27(arg_1520_0, arg_1520_1, arg_1520_2)
		var_1507_26()
		slot_0_89_0.paint_hud_card_bg(arg_1520_0, arg_1520_1, arg_1520_2, var_1507_12, var_1507_13)
	end

	local function var_1507_28(arg_1521_0, arg_1521_1)
		local var_1521_0 = math.max(0, math.min(1, arg_1521_0 or 0))

		return color(math.floor(240 + -76 * var_1521_0), math.floor(60 + 195 * var_1521_0), math.floor(60 + 147 * var_1521_0), math.floor((var_1521_0 * 196 + 58) * arg_1521_1))
	end

	local function var_1507_29()
		if not slot_0_65_0() then
			return false
		end

		if not slot_0_152_0.vars or not slot_0_152_0.vars.ov_panel or not slot_0_152_0.vars.ov_slowdown then
			return false
		end

		if not slot_0_89_0 or type(slot_0_89_0.ov_sw) ~= "function" then
			return false
		end

		if slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_panel, false) ~= true then
			return false
		end

		return slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_slowdown, false) == true
	end

	local function var_1507_30(arg_1523_0)
		if not arg_1523_0 then
			return 1
		end

		return math.max(0, math.min(1, tonumber(arg_1523_0.m_flVelocityModifier) or 1))
	end

	local function var_1507_31(arg_1524_0)
		local var_1524_0 = string.format("%d%%", math.floor((arg_1524_0 or 0) * 100))
		local var_1524_1 = ELOG_SCREEN_MUTED .. "slowed"
		local var_1524_2 = ELOG_SCREEN_HI .. var_1524_0
		local var_1524_3 = var_1507_21(var_1524_1) + var_1507_21(var_1524_2) + 10
		local var_1524_4 = var_1507_2 + var_1507_23() + math.max(var_1524_3, 72) + var_1507_2

		return math.max(140, var_1524_4), var_1524_1, var_1524_2, var_1524_0
	end

	local function var_1507_32(arg_1525_0, arg_1525_1, arg_1525_2, arg_1525_3, arg_1525_4, arg_1525_5, arg_1525_6)
		var_1507_25(arg_1525_0, arg_1525_1, var_1507_1, arg_1525_3)

		if var_1507_19() ~= "" and slot_0_89_0.hud_widget_use_arc_divider() then
			slot_0_89_0.paint_hud_divider_arc(var_1507_22(arg_1525_0), arg_1525_1, arg_1525_1 + var_1507_1, arg_1525_3, false)
		end

		local var_1525_0 = var_1507_24(arg_1525_0)

		pcall(function()
			render.text(var_1507_17, vector(var_1525_0, arg_1525_1 + 3), color(255, 255, 255, math.floor(255 * arg_1525_3)), nil, arg_1525_5)
		end)

		local var_1525_1 = arg_1525_6

		if var_1525_1:find(ELOG_SCREEN_HI, 1, true) then
			var_1525_1 = var_1525_1:gsub(ELOG_SCREEN_HI, slot_0_89_0.hud_accent_markup(arg_1525_3))
		end

		pcall(function()
			render.text(var_1507_17, vector(arg_1525_0 + arg_1525_2 - var_1507_2, arg_1525_1 + 3), color(255, 255, 255, math.floor(255 * arg_1525_3)), "r", var_1525_1)
		end)

		local var_1525_2 = var_1525_0
		local var_1525_3 = arg_1525_0 + arg_1525_2 - var_1507_2
		local var_1525_4 = arg_1525_1 + var_1507_0 + 1
		local var_1525_5 = arg_1525_1 + var_1507_1 - 4
		local var_1525_6 = var_1525_2 + (var_1525_3 - var_1525_2) * math.max(0, math.min(1, arg_1525_4 or 0))
		local var_1525_7 = math.max(2, math.floor(slot_0_89_0.hud_widget_radius() * 0.45))

		pcall(function()
			render.rect(vector(var_1525_2, var_1525_4), vector(var_1525_3, var_1525_5), color(255, 255, 255, math.floor(32 * arg_1525_3)), var_1525_7)
		end)

		if var_1525_6 > var_1525_2 + 1 then
			pcall(function()
				render.rect(vector(var_1525_2, var_1525_4), vector(var_1525_6, var_1525_5), var_1507_28(arg_1525_4, arg_1525_3), var_1525_7)
			end)
		end
	end

	local function var_1507_33(arg_1530_0)
		if not slot_0_78_0.ov_store_loaded then
			slot_0_89_0.store_read()

			slot_0_78_0.ov_store_loaded = true
		end

		local var_1530_0 = slot_0_89_0.store_slot("slowdown")

		if var_1530_0._init ~= true then
			var_1530_0.align = 1
			var_1530_0.x = arg_1530_0.x * 0.5 - 75
			var_1530_0.y = arg_1530_0.y * 0.5 - 160
			var_1530_0._init = true
			var_1530_0._slowdown_v1 = true

			slot_0_89_0.store_write()
		elseif var_1530_0._slowdown_v1 ~= true then
			var_1530_0.align = 1
			var_1530_0.x = arg_1530_0.x * 0.5 - 75
			var_1530_0.y = arg_1530_0.y * 0.5 - 160
			var_1530_0._slowdown_v1 = true

			slot_0_89_0.store_write()
		end

		var_1507_15.align = math.max(0, math.min(2, math.floor(tonumber(var_1530_0.align) or 0)))

		return var_1530_0
	end

	local function var_1507_34(arg_1531_0, arg_1531_1, arg_1531_2, arg_1531_3)
		local var_1531_0 = var_1507_2

		arg_1531_0.x = math.max(var_1531_0, math.min(arg_1531_3.x - arg_1531_1 - var_1531_0, arg_1531_0.x))
		arg_1531_0.y = math.max(24, math.min(arg_1531_3.y - arg_1531_2 - 24, arg_1531_0.y))
	end

	local function var_1507_35(arg_1532_0, arg_1532_1, arg_1532_2, arg_1532_3, arg_1532_4)
		arg_1532_1 = math.max(1, tonumber(arg_1532_1) or arg_1532_2)
		arg_1532_2 = math.max(1, tonumber(arg_1532_2) or arg_1532_1)

		local var_1532_0 = var_1507_2
		local var_1532_1 = math.max(0, math.min(2, math.floor(tonumber(arg_1532_0.align) or 0)))

		if var_1532_1 == 2 then
			arg_1532_0.x = arg_1532_0.x + arg_1532_1 - arg_1532_2
		elseif var_1532_1 == 0 and arg_1532_0.x <= var_1532_0 + 2 then
			-- block empty
		else
			arg_1532_0.x = arg_1532_0.x + arg_1532_1 * 0.5 - arg_1532_2 * 0.5
		end

		var_1507_34(arg_1532_0, arg_1532_2, arg_1532_4, arg_1532_3)
	end

	local function var_1507_36(arg_1533_0)
		local var_1533_0, var_1533_1, var_1533_2 = pcall(function()
			return ui.get_position(), ui.get_size()
		end)

		if not var_1533_0 or not var_1533_1 or not var_1533_2 then
			return false
		end

		return slot_0_89_0.point_in_rect(arg_1533_0.x, arg_1533_0.y, var_1533_1.x, var_1533_1.y, var_1533_2.x, var_1533_2.y)
	end

	local function var_1507_37(arg_1535_0)
		if arg_1535_0 and var_1507_14.active then
			slot_0_89_0.store_write()
		end

		slot_0_89_0.overlay_drag_clear(var_1507_14, arg_1535_0 ~= true)

		slot_0_78_0.ov_slowdown_mouse_block = false
	end

	local function var_1507_38(arg_1536_0, arg_1536_1, arg_1536_2, arg_1536_3, arg_1536_4)
		slot_0_89_0.overlay_drag_think({
			drag = var_1507_14,
			menu_alpha = arg_1536_0,
			scr = arg_1536_1,
			slot = arg_1536_2,
			mouse_on_menu = var_1507_36,
			get_rect = function()
				return var_1507_15.pos.x, var_1507_15.pos.y, arg_1536_3, arg_1536_4
			end,
			is_blocked = function()
				return slot_0_78_0.ov_wm_mouse_block or slot_0_78_0.ov_elog_mouse_block or slot_0_78_0.chi_mouse_block or slot_0_78_0.ov_keybinds_mouse_block or slot_0_78_0.ov_damage_ind_mouse_block or slot_0_78_0.ov_metrics_mouse_block or slot_0_78_0.ov_spectators_mouse_block
			end,
			on_held = function(arg_1539_0)
				arg_1539_0.align = 0
			end,
			snap_pos = function(arg_1540_0, arg_1540_1, arg_1540_2, arg_1540_3)
				local var_1540_0 = var_1507_14.aligning == "y" and "y" or var_1507_14.aligning == "x" and "x" or nil
				local var_1540_1 = slot_0_89_0.snap_box_to_guides(vector(arg_1540_0, arg_1540_1), vector(arg_1540_2, arg_1540_3), arg_1536_1, var_1540_0)

				return var_1540_1.x, var_1540_1.y
			end,
			clamp_pos = function(arg_1541_0, arg_1541_1, arg_1541_2, arg_1541_3)
				return math.max(0, math.min(arg_1536_1.x - arg_1541_2, arg_1541_0)), math.max(24, math.min(arg_1536_1.y - arg_1541_3 - 24, arg_1541_1))
			end,
			apply_layout = function(arg_1542_0, arg_1542_1)
				var_1507_15.pos.x = arg_1542_0
				var_1507_15.pos.y = arg_1542_1
				arg_1536_2.x = arg_1542_0
				arg_1536_2.y = arg_1542_1
			end,
			on_release = function(arg_1543_0)
				slot_0_89_0.overlay_drag_release_third(arg_1543_0, arg_1536_3, arg_1536_1, var_1507_2, 24, arg_1536_1.y - arg_1536_4 - 24)

				var_1507_15.align = arg_1543_0.align
			end,
			on_save = function()
				slot_0_89_0.store_write()
			end,
			on_reset = function(arg_1545_0)
				var_1507_37(arg_1545_0 == true)
			end,
			set_mouse_block = function(arg_1546_0)
				slot_0_78_0.ov_slowdown_mouse_block = arg_1546_0
			end
		})
	end

	return function()
		slot_0_78_0.ov_slowdown_mouse_block = false

		if not var_1507_29() then
			var_1507_37(false)

			return
		end

		local var_1547_0 = slot_0_89_0.screen_size_cached()

		if not var_1547_0 or not var_1547_0.x or var_1547_0.x < 8 then
			return
		end

		local var_1547_1 = 0

		pcall(function()
			var_1547_1 = ui.get_alpha() or 0
		end)

		local var_1547_2 = entity.get_local_player()
		local var_1547_3 = var_1547_2 and (var_1547_2.m_iHealth or 0) > 0
		local var_1547_4 = var_1507_30(var_1547_2)
		local var_1547_5 = var_1547_1 > 0.01
		local var_1547_6 = slot_0_89_0.hud_fade("hud_menu", var_1547_5)
		local var_1547_7 = var_1547_3 and var_1547_4 < 0.995
		local var_1547_8 = slot_0_89_0.hud_fade("slowdown", var_1547_7 or var_1547_5)

		if var_1547_8 <= 0.001 and var_1547_6 <= 0.001 then
			var_1507_37(false)

			return
		end

		local var_1547_9 = var_1547_4

		if var_1547_5 and var_1547_9 >= 0.995 then
			var_1547_9 = var_1507_9
		end

		local var_1547_10, var_1547_11, var_1547_12 = var_1507_31(var_1547_9)
		local var_1547_13 = var_1507_1

		var_1507_15.size.x = var_1547_10
		var_1507_15.size.y = var_1547_13

		local var_1547_14 = var_1507_33(var_1547_0)

		var_1507_15.size_x_prev = var_1507_15.size.x

		if not var_1507_14.active then
			slot_0_89_0.slot_apply_rest(var_1547_14, var_1547_10, var_1547_13, var_1547_0, var_1507_2, 24, var_1547_0.y - var_1547_13 - 24)
		end

		var_1507_15.pos.x = var_1547_14.x
		var_1507_15.pos.y = var_1547_14.y

		local var_1547_15 = var_1507_15.pos.x
		local var_1547_16 = var_1547_8

		var_1507_27(vector(var_1547_15, var_1507_15.pos.y), vector(var_1547_15 + var_1547_10, var_1507_15.pos.y + var_1547_13), var_1547_16)
		var_1507_32(var_1547_15, var_1507_15.pos.y, var_1547_10, var_1547_16, var_1547_9, var_1547_11, var_1547_12)
		var_1507_38(var_1547_1, var_1547_0, var_1547_14, var_1547_10, var_1547_13)

		if var_1547_1 > 0.01 then
			slot_0_89_0.overlay_drag_paint_hover({
				drag = var_1507_14,
				get_rect = function()
					return var_1507_15.pos.x, var_1507_15.pos.y, var_1547_10, var_1547_13
				end
			}, var_1547_1, var_1547_0)
		end
	end
end)()
slot_0_78_0.hud_damage_ind_tick = (function()
	local var_1550_0 = {}
	local var_1550_1 = 0
	local var_1550_2 = 0
	local var_1550_3 = 1
	local var_1550_4 = 6
	local var_1550_5 = 2

	local function var_1550_6()
		return slot_0_152_0.vars and slot_0_152_0.vars.ov_damage_ind
	end

	local function var_1550_7()
		return slot_0_89_0.ov_sw(var_1550_6(), false)
	end

	local function var_1550_8(arg_1553_0, arg_1553_1)
		if not arg_1553_0 or type(arg_1553_0.get) ~= "function" then
			return arg_1553_1
		end

		local var_1553_0, var_1553_1 = pcall(function()
			return arg_1553_0:get()
		end)

		if var_1553_0 and var_1553_1 ~= nil then
			return var_1553_1
		end

		return arg_1553_1
	end

	local function var_1550_9(arg_1555_0)
		arg_1555_0 = math.floor(tonumber(arg_1555_0) or 0)

		if arg_1555_0 <= 0 then
			return nil
		end

		if arg_1555_0 > 100 then
			return "+" .. tostring(arg_1555_0 - 100)
		end

		return tostring(arg_1555_0)
	end

	local function var_1550_10(arg_1556_0)
		if not arg_1556_0 then
			return false
		end

		local var_1556_0 = arg_1556_0:get_player_weapon()

		if not var_1556_0 then
			return false
		end

		local var_1556_1, var_1556_2 = pcall(function()
			return var_1556_0.weapon_type
		end)

		if var_1556_1 and var_1556_2 then
			return var_1556_2 ~= 9 and var_1556_2 ~= 0
		end

		return true
	end

	local function var_1550_11(arg_1558_0)
		local var_1558_0, var_1558_1, var_1558_2 = pcall(function()
			return ui.get_position(), ui.get_size()
		end)

		if not var_1558_0 or not var_1558_1 or not var_1558_2 then
			return false
		end

		return slot_0_89_0.point_in_rect(arg_1558_0.x, arg_1558_0.y, var_1558_1.x, var_1558_1.y, var_1558_2.x, var_1558_2.y)
	end

	local function var_1550_12(arg_1560_0)
		if arg_1560_0 and var_1550_0.active then
			slot_0_89_0.store_write()
		end

		slot_0_89_0.overlay_drag_clear(var_1550_0, arg_1560_0 ~= true)

		slot_0_78_0.ov_damage_ind_mouse_block = false
	end

	return function()
		slot_0_78_0.ov_damage_ind_mouse_block = false

		if not var_1550_7() then
			var_1550_12(false)

			return
		end

		if slot_0_78_0.in_score == true then
			var_1550_12(false)

			return
		end

		if not slot_0_78_0.ov_store_loaded then
			slot_0_89_0.store_read()

			slot_0_78_0.ov_store_loaded = true
		end

		local var_1561_0 = slot_0_89_0.screen_size_cached()

		if not var_1561_0 or not var_1561_0.x or var_1561_0.x < 8 then
			return
		end

		local var_1561_1 = 0

		pcall(function()
			var_1561_1 = ui.get_alpha() or 0
		end)

		local var_1561_2 = entity.get_local_player()
		local var_1561_3 = var_1561_2 and (var_1561_2.m_iHealth or 0) > 0
		local var_1561_4 = var_1561_1 > 0.01
		local var_1561_5 = false

		pcall(function()
			var_1561_5 = globals.is_in_game == true
		end)

		local var_1561_6 = var_1550_6()
		local var_1561_7 = chi.min_damage_value()
		local var_1561_8 = var_1561_4 or var_1561_3 and var_1550_10(var_1561_2) and var_1561_5 and var_1561_7 > 0
		local var_1561_9 = globals.frametime or 0.016

		var_1550_2 = var_1550_2 + ((var_1561_8 and 1 or 0) - var_1550_2) * math.min(1, var_1561_9 * 16)

		if var_1550_2 <= 0.001 and not var_1561_4 then
			var_1550_12(false)

			return
		end

		if var_1550_8(var_1561_6 and var_1561_6.anim, false) == true then
			var_1550_1 = var_1550_1 + (var_1561_7 - var_1550_1) * math.min(1, var_1561_9 * 16)
		else
			var_1550_1 = var_1561_7
		end

		local var_1561_10 = true

		if var_1550_8(var_1561_6 and var_1561_6.show_state, false) == true then
			var_1561_10 = chi.damage_bind_active()
		end

		var_1550_3 = var_1550_3 + ((var_1561_10 and 1 or 0) - var_1550_3) * math.min(1, var_1561_9 * 16)

		local var_1561_11 = slot_0_89_0.store_slot("damage_ind")

		if var_1561_11._init ~= true then
			var_1561_11.x = var_1561_0.x * 0.5 + 4
			var_1561_11.y = var_1561_0.y * 0.5 + 4
			var_1561_11._init = true
			var_1561_11._dmg_v1 = true

			slot_0_89_0.store_write()
		end

		local var_1561_12 = var_1550_9(var_1550_1)

		if not var_1561_12 and not var_1561_4 then
			var_1550_12(false)

			return
		end

		var_1561_12 = var_1561_12 or ""

		local var_1561_13 = var_1550_5
		local var_1561_14 = 20
		local var_1561_15 = 14

		if var_1561_12 ~= "" then
			pcall(function()
				local var_1564_0 = render.measure_text(var_1561_13, nil, var_1561_12)

				if var_1564_0 then
					var_1561_14 = var_1564_0.x or var_1561_14
					var_1561_15 = var_1564_0.y or var_1561_15
				end
			end)
		end

		local var_1561_16 = var_1561_14 + var_1550_4 * 2
		local var_1561_17 = var_1561_15 + var_1550_4 * 2
		local var_1561_18 = var_1561_11.x
		local var_1561_19 = var_1561_11.y

		slot_0_89_0.overlay_drag_think({
			drag = var_1550_0,
			menu_alpha = var_1561_1,
			scr = var_1561_0,
			slot = var_1561_11,
			mouse_on_menu = var_1550_11,
			get_rect = function()
				return var_1561_18, var_1561_19, var_1561_16, var_1561_17
			end,
			is_blocked = function()
				return slot_0_78_0.ov_wm_mouse_block or slot_0_78_0.ov_elog_mouse_block or slot_0_78_0.ov_slowdown_mouse_block or slot_0_78_0.ov_keybinds_mouse_block or slot_0_78_0.chi_mouse_block or slot_0_78_0.ov_metrics_mouse_block or slot_0_78_0.ov_spectators_mouse_block
			end,
			snap_pos = function(arg_1567_0, arg_1567_1, arg_1567_2, arg_1567_3)
				local var_1567_0 = var_1550_0.aligning == "y" and "y" or var_1550_0.aligning == "x" and "x" or nil
				local var_1567_1 = slot_0_89_0.snap_box_to_guides(vector(arg_1567_0, arg_1567_1), vector(arg_1567_2, arg_1567_3), var_1561_0, var_1567_0)

				return var_1567_1.x, var_1567_1.y
			end,
			clamp_pos = function(arg_1568_0, arg_1568_1, arg_1568_2, arg_1568_3)
				return math.max(0, math.min(var_1561_0.x - arg_1568_2, arg_1568_0)), math.max(24, math.min(var_1561_0.y - arg_1568_3 - 24, arg_1568_1))
			end,
			apply_layout = function(arg_1569_0, arg_1569_1)
				var_1561_18 = arg_1569_0
				var_1561_19 = arg_1569_1
				var_1561_11.x = arg_1569_0
				var_1561_11.y = arg_1569_1
			end,
			on_save = function()
				slot_0_89_0.store_write()
			end,
			on_reset = function(arg_1571_0)
				var_1550_12(arg_1571_0 == true)
			end,
			set_mouse_block = function(arg_1572_0)
				slot_0_78_0.ov_damage_ind_mouse_block = arg_1572_0
			end
		})

		local var_1561_20 = var_1550_2 * (var_1550_3 * 0.5 + 0.5)

		if var_1561_12 ~= "" then
			local var_1561_21 = color(255, 255, 255, math.floor(255 * var_1561_20))

			pcall(function()
				render.text(var_1561_13, vector(var_1561_18 + var_1550_4, var_1561_19 + var_1550_4), var_1561_21, "", var_1561_12)
			end)
		end

		if var_1561_1 > 0.01 then
			slot_0_89_0.overlay_drag_paint_hover({
				drag = var_1550_0,
				get_rect = function()
					return var_1561_18, var_1561_19, var_1561_16, var_1561_17
				end
			}, var_1561_1, var_1561_0)
		end
	end
end)()
slot_0_78_0.hud_metrics_tick = (function()
	local var_1575_0 = 22
	local var_1575_1 = 20
	local var_1575_2 = 6
	local var_1575_3 = 22
	local var_1575_4 = 28
	local var_1575_5 = 11
	local var_1575_6 = 4
	local var_1575_7 = 248
	local var_1575_8 = "\aFFFFFF50"
	local var_1575_9 = "\aFFFFFFFF"
	local var_1575_10 = false
	local var_1575_11
	local var_1575_12
	local var_1575_13 = {
		active = false,
		hover = false
	}
	local var_1575_14 = {
		align = 0,
		pos = vector(24, 520),
		size = vector(var_1575_7, 120)
	}
	local var_1575_15 = {
		out_rate = 0,
		in_rate = 0,
		out_bytes = 0,
		in_bytes = 0,
		sv_hist = {}
	}
	local var_1575_16 = {}
	local var_1575_17

	local function var_1575_18(arg_1576_0)
		local var_1576_0, var_1576_1 = pcall(render.load_font, "Segoe UI Semibold", arg_1576_0 or vector(14, 12), "a")

		return var_1576_0 and var_1576_1 or 2
	end

	local var_1575_19 = var_1575_18()
	local var_1575_20 = var_1575_18(vector(18, 14))

	local function var_1575_21(arg_1577_0)
		return (slot_0_89_0.measure_cached(var_1575_19, arg_1577_0))
	end

	local function var_1575_22(arg_1578_0)
		if not arg_1578_0 or arg_1578_0 == "" then
			return 0
		end

		return (slot_0_89_0.measure_cached(var_1575_20, arg_1578_0))
	end

	local function var_1575_23(arg_1579_0)
		arg_1579_0 = tostring(arg_1579_0 or "")

		if var_1575_16[arg_1579_0] ~= nil then
			return var_1575_16[arg_1579_0]
		end

		local var_1579_0, var_1579_1 = pcall(ui.get_icon, arg_1579_0)

		var_1575_16[arg_1579_0] = var_1579_0 and var_1579_1 and var_1579_1 ~= "" and var_1579_1 or ""

		return var_1575_16[arg_1579_0]
	end

	local function var_1575_24()
		if var_1575_17 ~= nil then
			return var_1575_17
		end

		var_1575_17 = var_1575_23("chart-network")

		if var_1575_17 == "" then
			var_1575_17 = var_1575_23("gauge-high")
		end

		return var_1575_17
	end

	local function var_1575_25(arg_1581_0, arg_1581_1)
		for iter_1581_0 = 1, #arg_1581_1 do
			local var_1581_0, var_1581_1 = pcall(function()
				return arg_1581_0[arg_1581_1[iter_1581_0]]
			end)

			if var_1581_0 and type(var_1581_1) == "number" then
				return var_1581_1
			end
		end

		return nil
	end

	local function var_1575_26(arg_1583_0, arg_1583_1)
		arg_1583_1 = math.max(0.001, tonumber(arg_1583_1) or 0.016)

		local var_1583_0 = var_1575_25(arg_1583_0, {
			"total_bytes_in",
			"bytes_in",
			"in_bytes",
			"bytes_received"
		}) or 0
		local var_1583_1 = var_1575_25(arg_1583_0, {
			"total_bytes_out",
			"bytes_out",
			"out_bytes",
			"bytes_sent"
		}) or 0

		if var_1575_15.in_bytes > 0 or var_1575_15.out_bytes > 0 then
			var_1575_15.in_rate = var_1575_15.in_rate + ((var_1583_0 - var_1575_15.in_bytes) / arg_1583_1 / 1024 - var_1575_15.in_rate) * math.min(1, arg_1583_1 * 8)
			var_1575_15.out_rate = var_1575_15.out_rate + ((var_1583_1 - var_1575_15.out_bytes) / arg_1583_1 / 1024 - var_1575_15.out_rate) * math.min(1, arg_1583_1 * 8)
		end

		var_1575_15.in_bytes = var_1583_0
		var_1575_15.out_bytes = var_1583_1
	end

	local function var_1575_27(arg_1584_0)
		if not arg_1584_0 then
			return 0
		end

		local var_1584_0 = var_1575_25(arg_1584_0, {
			"packet_loss",
			"loss",
			"packet_loss_in",
			"packet_loss_out"
		})

		if not var_1584_0 then
			return 0
		end

		if var_1584_0 <= 1 then
			return var_1584_0 * 100
		end

		return var_1584_0
	end

	local function var_1575_28()
		local var_1585_0

		pcall(function()
			var_1585_0 = utils.net_channel()
		end)

		local var_1585_1 = globals.frametime or globals.tickinterval or 0.015625
		local var_1585_2 = globals.tickinterval or 0.015625
		local var_1585_3 = globals.exactframetime or var_1585_1

		var_1575_26(var_1585_0, var_1585_1)

		local var_1585_4 = math.min(999, var_1585_1 / var_1585_2 * 100)
		local var_1585_5 = math.min(999, var_1585_3 / var_1585_2 * 100)
		local var_1585_6 = 2

		pcall(function()
			if common.get_processor_frequency then
				var_1585_6 = (tonumber(common.get_processor_frequency()) or 0) / 1000000000
			end
		end)

		if var_1585_6 <= 0 then
			var_1585_6 = 1.8 + math.min(1.2, var_1585_4 / 120)
		end

		local var_1585_7 = var_1585_0 and var_1585_0.avg_latency and (tonumber(var_1585_0.avg_latency[0]) or 0) or 0
		local var_1585_8 = var_1585_0 and var_1585_0.avg_latency and (tonumber(var_1585_0.avg_latency[1]) or 0) or 0

		if var_1585_7 <= 0 and var_1585_0 and var_1585_0.latency then
			var_1585_7 = tonumber(var_1585_0.latency[0]) or 0
			var_1585_8 = tonumber(var_1585_0.latency[1]) or 0
		end

		local var_1585_9 = (var_1585_7 + var_1585_8) * 0.5 * 1000

		if var_1585_9 <= 0 and var_1585_8 > 0 then
			var_1585_9 = var_1585_8 * 1000
		end

		local var_1585_10 = math.floor(var_1585_9 / (var_1585_2 * 1000) + 0.5)
		local var_1585_11 = var_1575_27(var_1585_0)
		local var_1585_12 = var_1585_1 * 1000

		var_1575_15.sv_hist[#var_1575_15.sv_hist + 1] = var_1585_12

		while #var_1575_15.sv_hist > 32 do
			table.remove(var_1575_15.sv_hist, 1)
		end

		local var_1585_13 = 0
		local var_1585_14 = 0

		for iter_1585_0 = 1, #var_1575_15.sv_hist do
			var_1585_13 = var_1585_13 + var_1575_15.sv_hist[iter_1585_0]
			var_1585_14 = var_1585_14 + var_1575_15.sv_hist[iter_1585_0] * var_1575_15.sv_hist[iter_1585_0]
		end

		local var_1585_15 = var_1585_13 / math.max(1, #var_1575_15.sv_hist)
		local var_1585_16 = math.sqrt(math.max(0, var_1585_14 / math.max(1, #var_1575_15.sv_hist) - var_1585_15 * var_1585_15))
		local var_1585_17 = 1 / var_1585_2

		return {
			{
				icon = "microchip",
				label = "cpu",
				value = string.format("%.1f%% (%.2f GHz), %.1f%%", var_1585_4, var_1585_6, var_1585_5)
			},
			{
				icon = "cloud",
				label = "ping",
				value = string.format("%.1fms (%d ticks) loss: %.0f%%", var_1585_9, var_1585_10, var_1585_11)
			},
			{
				icon = "server",
				label = "server",
				value = string.format("%.1f +- %.1fms rate: %.1f tps", var_1585_15, var_1585_16, var_1585_17)
			},
			{
				icon = "diagram-project",
				label = "network",
				value = string.format("in: %.1f kb/s, out: %.1f kb/s", var_1575_15.in_rate, var_1575_15.out_rate)
			}
		}
	end

	local function var_1575_29()
		if not slot_0_65_0() then
			return false
		end

		if not slot_0_152_0.vars or not slot_0_152_0.vars.ov_panel or not slot_0_152_0.vars.ov_metrics then
			return false
		end

		if slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_panel, false) ~= true then
			return false
		end

		return slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_metrics, false) == true
	end

	local function var_1575_30()
		if var_1575_10 then
			return
		end

		var_1575_10 = true

		pcall(function()
			var_1575_11 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M0 6V4c0-2 2-4 4-4v2C2 2 0 4 0 6Z\"/></svg>", vector(8, 12))
			var_1575_12 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M4 6c0-2-2-4-4-4V0c2 0 4 2 4 4v2Z\"/></svg>", vector(8, 12))
		end)
	end

	local function var_1575_31(arg_1591_0, arg_1591_1, arg_1591_2)
		var_1575_30()
		slot_0_89_0.paint_hud_card_bg(arg_1591_0, arg_1591_1, arg_1591_2, var_1575_11, var_1575_12)
	end

	local function var_1575_32(arg_1592_0, arg_1592_1)
		local var_1592_0, var_1592_1 = slot_0_89_0.measure_cached(arg_1592_0, arg_1592_1)

		return var_1592_0, type(var_1592_1) == "number" and var_1592_1 > 0 and var_1592_1 or 12
	end

	local function var_1575_33(arg_1593_0, arg_1593_1, arg_1593_2, arg_1593_3)
		if arg_1593_3 <= 0.001 then
			return
		end

		local var_1593_0 = var_1575_24()
		local var_1593_1 = "Network Metrics"
		local var_1593_2 = slot_0_89_0.hud_accent_color(arg_1593_3)
		local var_1593_3 = color(255, 255, 255, math.floor(255 * arg_1593_3))
		local var_1593_4 = var_1575_22(var_1593_0)
		local var_1593_5 = var_1575_21(var_1575_9 .. var_1593_1)
		local var_1593_6, var_1593_7 = var_1575_32(var_1575_19, var_1593_1)
		local var_1593_8, var_1593_9 = var_1575_32(var_1575_20, var_1593_0 ~= "" and var_1593_0 or " ")
		local var_1593_10 = arg_1593_0 + (arg_1593_2 - ((var_1593_0 ~= "" and var_1593_4 + 4 or 0) + var_1593_5)) * 0.5
		local var_1593_11 = arg_1593_1 + (var_1575_3 - var_1593_9) * 0.5
		local var_1593_12 = arg_1593_1 + (var_1575_3 - var_1593_7) * 0.5

		pcall(function()
			if var_1593_0 ~= "" then
				render.text(var_1575_20, vector(var_1593_10, var_1593_11), var_1593_2, nil, var_1593_0)

				var_1593_10 = var_1593_10 + var_1593_4 + 4
			end

			render.text(var_1575_19, vector(var_1593_10, var_1593_12), var_1593_3, nil, var_1593_1)
		end)
	end

	local function var_1575_34(arg_1595_0, arg_1595_1, arg_1595_2, arg_1595_3, arg_1595_4)
		if arg_1595_4 <= 0.001 then
			return
		end

		local var_1595_0 = arg_1595_0
		local var_1595_1 = arg_1595_1
		local var_1595_2 = arg_1595_0 + arg_1595_2
		local var_1595_3 = arg_1595_1 + var_1575_1

		slot_0_89_0.paint_hud_card_bg(vector(var_1595_0, var_1595_1), vector(var_1595_2, var_1595_3), arg_1595_4, nil, nil, {
			bg_alpha = 105,
			stripe = false
		})

		local var_1595_4 = var_1575_23(arg_1595_3.icon)
		local var_1595_5 = math.floor(255 * arg_1595_4)
		local var_1595_6 = var_1595_1 + 3
		local var_1595_7 = var_1595_0 + var_1575_2

		pcall(function()
			if var_1595_4 ~= "" then
				render.text(var_1575_20, vector(var_1595_7, var_1595_6 - 1), slot_0_89_0.hud_accent_color(arg_1595_4), nil, var_1595_4)

				var_1595_7 = var_1595_7 + var_1575_22(var_1595_4) + 4
			end

			render.text(var_1575_19, vector(var_1595_7, var_1595_6), color(255, 255, 255, var_1595_5), nil, var_1575_8 .. arg_1595_3.label)
			render.text(var_1575_19, vector(var_1595_2 - var_1575_2, var_1595_6), color(255, 255, 255, var_1595_5), "r", var_1575_9 .. arg_1595_3.value)
		end)
	end

	local function var_1575_35(arg_1597_0)
		local var_1597_0 = var_1575_24()
		local var_1597_1 = "Network Metrics"
		local var_1597_2 = var_1575_22(var_1597_0)
		local var_1597_3 = var_1575_21(var_1575_9 .. var_1597_1)
		local var_1597_4 = (var_1597_0 ~= "" and var_1597_2 + 4 or 0) + var_1597_3 + var_1575_6 * 2

		for iter_1597_0 = 1, #arg_1597_0 do
			local var_1597_5 = arg_1597_0[iter_1597_0]
			local var_1597_6 = var_1575_2 * 2 + var_1575_22(var_1575_23(var_1597_5.icon)) + 4 + var_1575_21(var_1575_8 .. var_1597_5.label) + var_1575_21(var_1575_9 .. var_1597_5.value) + 12

			var_1597_4 = math.max(var_1597_4, var_1597_6)
		end

		local var_1597_7 = math.max(var_1575_7, var_1597_4)
		local var_1597_8 = var_1575_4 + #arg_1597_0 * var_1575_0 + var_1575_6

		return var_1597_7, var_1597_8
	end

	local function var_1575_36(arg_1598_0)
		if not slot_0_78_0.ov_store_loaded then
			slot_0_89_0.store_read()

			slot_0_78_0.ov_store_loaded = true
		end

		local var_1598_0 = slot_0_89_0.store_slot("metrics")

		if var_1598_0._init ~= true then
			var_1598_0.align = 0
			var_1598_0.x = 24
			var_1598_0.y = arg_1598_0.y - 220
			var_1598_0._init = true
			var_1598_0._metrics_v1 = true

			slot_0_89_0.store_write()
		end

		var_1575_14.align = math.max(0, math.min(2, math.floor(tonumber(var_1598_0.align) or 0)))

		return var_1598_0
	end

	local function var_1575_37(arg_1599_0)
		local var_1599_0, var_1599_1, var_1599_2 = pcall(function()
			return ui.get_position(), ui.get_size()
		end)

		if not var_1599_0 or not var_1599_1 or not var_1599_2 then
			return false
		end

		return slot_0_89_0.point_in_rect(arg_1599_0.x, arg_1599_0.y, var_1599_1.x, var_1599_1.y, var_1599_2.x, var_1599_2.y)
	end

	local function var_1575_38(arg_1601_0)
		if arg_1601_0 and var_1575_13.active then
			slot_0_89_0.store_write()
		end

		slot_0_89_0.overlay_drag_clear(var_1575_13, arg_1601_0 ~= true)

		slot_0_78_0.ov_metrics_mouse_block = false
	end

	local function var_1575_39(arg_1602_0, arg_1602_1, arg_1602_2, arg_1602_3, arg_1602_4)
		slot_0_89_0.overlay_drag_think({
			drag = var_1575_13,
			menu_alpha = arg_1602_0,
			scr = arg_1602_1,
			slot = arg_1602_2,
			mouse_on_menu = var_1575_37,
			get_rect = function()
				return var_1575_14.pos.x, var_1575_14.pos.y, arg_1602_3, arg_1602_4
			end,
			is_blocked = function()
				return slot_0_78_0.ov_wm_mouse_block or slot_0_78_0.ov_elog_mouse_block or slot_0_78_0.ov_slowdown_mouse_block or slot_0_78_0.ov_keybinds_mouse_block or slot_0_78_0.chi_mouse_block or slot_0_78_0.ov_damage_ind_mouse_block or slot_0_78_0.ov_metrics_mouse_block or slot_0_78_0.ov_spectators_mouse_block
			end,
			on_held = function(arg_1605_0)
				arg_1605_0.align = 0
			end,
			snap_pos = function(arg_1606_0, arg_1606_1, arg_1606_2, arg_1606_3)
				local var_1606_0 = var_1575_13.aligning == "y" and "y" or var_1575_13.aligning == "x" and "x" or nil
				local var_1606_1 = slot_0_89_0.snap_box_to_guides(vector(arg_1606_0, arg_1606_1), vector(arg_1606_2, arg_1606_3), arg_1602_1, var_1606_0)

				return var_1606_1.x, var_1606_1.y
			end,
			clamp_pos = function(arg_1607_0, arg_1607_1, arg_1607_2, arg_1607_3)
				return math.max(0, math.min(arg_1602_1.x - arg_1607_2, arg_1607_0)), math.max(24, math.min(arg_1602_1.y - arg_1607_3 - 24, arg_1607_1))
			end,
			apply_layout = function(arg_1608_0, arg_1608_1)
				var_1575_14.pos.x = arg_1608_0
				var_1575_14.pos.y = arg_1608_1
				arg_1602_2.x = arg_1608_0
				arg_1602_2.y = arg_1608_1
			end,
			on_release = function(arg_1609_0)
				slot_0_89_0.overlay_drag_release_third(arg_1609_0, arg_1602_3, arg_1602_1, var_1575_6, 24, arg_1602_1.y - arg_1602_4 - 24)

				var_1575_14.align = arg_1609_0.align
			end,
			on_save = function()
				slot_0_89_0.store_write()
			end,
			on_reset = function(arg_1611_0)
				var_1575_38(arg_1611_0 == true)
			end,
			set_mouse_block = function(arg_1612_0)
				slot_0_78_0.ov_metrics_mouse_block = arg_1612_0
			end
		})
	end

	return function()
		slot_0_78_0.ov_metrics_mouse_block = false

		if not var_1575_29() then
			var_1575_38(false)

			return
		end

		if slot_0_78_0.in_score == true then
			var_1575_38(false)

			return
		end

		local var_1613_0 = slot_0_89_0.screen_size_cached()

		if not var_1613_0 or not var_1613_0.x or var_1613_0.x < 8 then
			return
		end

		local var_1613_1 = 0

		pcall(function()
			var_1613_1 = ui.get_alpha() or 0
		end)

		local var_1613_2 = var_1613_1 > 0.01
		local var_1613_3 = false

		pcall(function()
			var_1613_3 = globals.is_in_game == true
		end)

		local var_1613_4 = slot_0_89_0.hud_fade("metrics", var_1613_3 or var_1613_2)

		if var_1613_4 <= 0.001 and not var_1613_2 then
			var_1575_38(false)

			return
		end

		local var_1613_5 = var_1575_28()
		local var_1613_6, var_1613_7 = var_1575_35(var_1613_5)
		local var_1613_8 = var_1575_36(var_1613_0)

		if not var_1575_13.active then
			slot_0_89_0.slot_apply_rest(var_1613_8, var_1613_6, var_1613_7, var_1613_0, var_1575_6, 24, var_1613_0.y - var_1613_7 - 24)
		end

		var_1575_14.pos.x = var_1613_8.x
		var_1575_14.pos.y = var_1613_8.y

		local var_1613_9 = var_1575_14.pos.x
		local var_1613_10 = var_1575_14.pos.y
		local var_1613_11 = var_1613_4

		var_1575_31(vector(var_1613_9, var_1613_10), vector(var_1613_9 + var_1613_6, var_1613_10 + var_1575_3), var_1613_11)
		var_1575_33(var_1613_9, var_1613_10, var_1613_6, var_1613_11)

		local var_1613_12 = var_1613_10 + var_1575_4

		for iter_1613_0 = 1, #var_1613_5 do
			var_1575_34(var_1613_9, var_1613_12, var_1613_6, var_1613_5[iter_1613_0], var_1613_11)

			var_1613_12 = var_1613_12 + var_1575_0
		end

		var_1575_39(var_1613_1, var_1613_0, var_1613_8, var_1613_6, var_1613_7)

		if var_1613_1 > 0.01 then
			slot_0_89_0.overlay_drag_paint_hover({
				drag = var_1575_13,
				get_rect = function()
					return var_1575_14.pos.x, var_1575_14.pos.y, var_1613_6, var_1613_7
				end
			}, var_1613_1, var_1613_0)
		end
	end
end)()
slot_0_78_0.hud_spectators_tick = (function()
	local var_1617_0 = 20
	local var_1617_1 = 22
	local var_1617_2 = 6
	local var_1617_3 = 22
	local var_1617_4 = 28
	local var_1617_5 = 4
	local var_1617_6 = 148
	local var_1617_7 = 16
	local var_1617_8 = "\aFFFFFF50"
	local var_1617_9 = "\aFFFFFFFF"
	local var_1617_10 = {
		{
			nick = "player one",
			id = "preview.1"
		},
		{
			nick = "spectator",
			id = "preview.2"
		}
	}
	local var_1617_11 = {}
	local var_1617_12 = {}
	local var_1617_13 = {}
	local var_1617_14 = false
	local var_1617_15
	local var_1617_16
	local var_1617_17
	local var_1617_18 = {
		active = false,
		hover = false
	}
	local var_1617_19 = {
		align = 2,
		pos = vector(280, 120),
		size = vector(var_1617_6, 80)
	}

	local function var_1617_20(arg_1618_0)
		local var_1618_0, var_1618_1 = pcall(render.load_font, "Segoe UI Semibold", arg_1618_0 or vector(14, 12), "a")

		return var_1618_0 and var_1618_1 or 2
	end

	local var_1617_21 = var_1617_20()
	local var_1617_22 = var_1617_20(vector(18, 14))

	local function var_1617_23(arg_1619_0, arg_1619_1)
		local var_1619_0 = chi.strip_markup(tostring(arg_1619_0 or ""))

		arg_1619_1 = tonumber(arg_1619_1) or 20

		if arg_1619_1 >= #var_1619_0 then
			return var_1619_0
		end

		return var_1619_0:sub(1, math.max(1, arg_1619_1 - 3)) .. "..."
	end

	local function var_1617_24(arg_1620_0)
		return (slot_0_89_0.measure_cached(var_1617_21, arg_1620_0))
	end

	local function var_1617_25(arg_1621_0, arg_1621_1)
		local var_1621_0, var_1621_1 = slot_0_89_0.measure_cached(arg_1621_0, arg_1621_1)

		return var_1621_0, var_1621_1
	end

	local function var_1617_26(arg_1622_0)
		if not arg_1622_0 or arg_1622_0 == "" then
			return 0
		end

		return (slot_0_89_0.measure_cached(var_1617_22, arg_1622_0))
	end

	local function var_1617_27()
		if var_1617_17 ~= nil then
			return var_1617_17
		end

		local var_1623_0, var_1623_1 = pcall(ui.get_icon, "camera-cctv")

		if var_1623_0 and var_1623_1 and var_1623_1 ~= "" then
			var_1617_17 = var_1623_1
		else
			local var_1623_2, var_1623_3 = pcall(ui.get_icon, "glasses-round")
			local var_1623_4 = var_1623_3

			var_1617_17 = var_1623_2 and var_1623_4 and var_1623_4 ~= "" and var_1623_4 or ""
		end

		return var_1617_17
	end

	local function var_1617_28(arg_1624_0, arg_1624_1, arg_1624_2)
		local var_1624_0 = "ap.sp\x00" .. arg_1624_0
		local var_1624_1 = var_1617_11[var_1624_0] or 0
		local var_1624_2 = var_1624_1 + (arg_1624_1 - var_1624_1) * math.min(1, (globals.frametime or 0.016) * (arg_1624_2 or 14))

		var_1617_11[var_1624_0] = var_1624_2

		return var_1624_2
	end

	local function var_1617_29(arg_1625_0)
		return tostring(arg_1625_0.id or arg_1625_0.nick or "")
	end

	local function var_1617_30(arg_1626_0)
		for iter_1626_0 = 1, #var_1617_13 do
			if var_1617_13[iter_1626_0] == arg_1626_0 then
				return true
			end
		end

		return false
	end

	local function var_1617_31()
		var_1617_12 = {}
		var_1617_13 = {}
	end

	local function var_1617_32(arg_1628_0)
		local var_1628_0 = {}

		for iter_1628_0 = 1, #arg_1628_0 do
			local var_1628_1 = arg_1628_0[iter_1628_0]
			local var_1628_2 = var_1617_29(var_1628_1)

			if var_1628_2 ~= "" then
				var_1628_0[var_1628_2] = true

				if not var_1617_12[var_1628_2] then
					var_1617_12[var_1628_2] = {
						mix = 0,
						exiting = false
					}

					if not var_1617_30(var_1628_2) then
						var_1617_13[#var_1617_13 + 1] = var_1628_2
					end
				end

				var_1617_12[var_1628_2].id = var_1628_1.id
				var_1617_12[var_1628_2].nick = var_1628_1.nick
				var_1617_12[var_1628_2].avatar = var_1628_1.avatar
				var_1617_12[var_1628_2].exiting = false
			end
		end

		for iter_1628_1, iter_1628_2 in pairs(var_1617_12) do
			if not var_1628_0[iter_1628_1] then
				iter_1628_2.exiting = true
			end
		end

		for iter_1628_3 = #var_1617_13, 1, -1 do
			if not var_1617_12[var_1617_13[iter_1628_3]] then
				table.remove(var_1617_13, iter_1628_3)
			end
		end

		for iter_1628_4, iter_1628_5 in pairs(var_1617_12) do
			local var_1628_3 = iter_1628_5.exiting and 0 or 1
			local var_1628_4 = iter_1628_5.exiting and 16 or 20

			iter_1628_5.mix = var_1617_28("row." .. iter_1628_4, var_1628_3, var_1628_4)

			if iter_1628_5.mix <= 0.004 and iter_1628_5.exiting then
				var_1617_12[iter_1628_4] = nil
			end
		end
	end

	local function var_1617_33(arg_1629_0)
		var_1617_32(arg_1629_0)

		local var_1629_0 = {}

		for iter_1629_0 = 1, #var_1617_13 do
			local var_1629_1 = var_1617_13[iter_1629_0]
			local var_1629_2 = var_1617_12[var_1629_1]

			if var_1629_2 and var_1629_2.mix > 0.004 then
				var_1629_0[#var_1629_0 + 1] = {
					nick = var_1629_2.nick,
					avatar = var_1629_2.avatar,
					mix = var_1629_2.mix,
					exiting = var_1629_2.exiting == true
				}
			end
		end

		return var_1629_0
	end

	local function var_1617_34()
		local var_1630_0 = {}

		for iter_1630_0 = 1, #var_1617_10 do
			var_1630_0[iter_1630_0] = {
				mix = 1,
				exiting = false,
				nick = var_1617_10[iter_1630_0].nick
			}
		end

		return var_1630_0
	end

	local function var_1617_35()
		local var_1631_0 = {}

		if globals.is_in_game ~= true then
			return var_1631_0
		end

		local var_1631_1 = entity.get_local_player()

		if not var_1631_1 then
			return var_1631_0
		end

		local var_1631_2 = var_1631_1
		local var_1631_3
		local var_1631_4

		pcall(function()
			var_1631_3 = var_1631_1.m_hObserverTarget
			var_1631_4 = var_1631_1.m_iObserverMode
		end)

		if var_1631_3 and (var_1631_4 == 4 or var_1631_4 == 5) then
			var_1631_2 = var_1631_3
		end

		local var_1631_5 = entity.get_players(false, false) or {}
		local var_1631_6 = {}

		for iter_1631_0 = 1, #var_1631_5 do
			local var_1631_7 = var_1631_5[iter_1631_0]

			if var_1631_7 and var_1631_7 ~= var_1631_1 then
				local var_1631_8 = true

				pcall(function()
					var_1631_8 = var_1631_7:is_dormant()
				end)

				if not var_1631_8 then
					local var_1631_9
					local var_1631_10

					pcall(function()
						var_1631_9 = var_1631_7.m_hObserverTarget
						var_1631_10 = var_1631_7.m_iObserverMode
					end)

					if var_1631_9 and var_1631_9 == var_1631_2 and (var_1631_10 == 4 or var_1631_10 == 5) then
						local var_1631_11 = "?"

						pcall(function()
							var_1631_11 = var_1631_7:get_name() or "?"
						end)

						local var_1631_12 = tostring(iter_1631_0)

						pcall(function()
							var_1631_12 = var_1631_7:get_xuid() or var_1631_12
						end)

						if not var_1631_6[var_1631_12] then
							var_1631_6[var_1631_12] = true

							local var_1631_13

							pcall(function()
								var_1631_13 = var_1631_7:get_steam_avatar()
							end)

							var_1631_0[#var_1631_0 + 1] = {
								id = var_1631_12,
								nick = var_1617_23(var_1631_11, 20),
								avatar = var_1631_13
							}
						end
					end
				end
			end
		end

		return var_1631_0
	end

	local function var_1617_36()
		if not slot_0_65_0() then
			return false
		end

		if not slot_0_152_0.vars or not slot_0_152_0.vars.ov_panel or not slot_0_152_0.vars.ov_spectators then
			return false
		end

		if slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_panel, false) ~= true then
			return false
		end

		return slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_spectators, false) == true
	end

	local function var_1617_37()
		if var_1617_14 then
			return
		end

		var_1617_14 = true

		pcall(function()
			var_1617_15 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M0 6V4c0-2 2-4 4-4v2C2 2 0 4 0 6Z\"/></svg>", vector(8, 12))
			var_1617_16 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M4 6c0-2-2-4-4-4V0c2 0 4 2 4 4v2Z\"/></svg>", vector(8, 12))
		end)
	end

	local function var_1617_38(arg_1641_0, arg_1641_1, arg_1641_2)
		var_1617_37()
		slot_0_89_0.paint_hud_card_bg(arg_1641_0, arg_1641_1, arg_1641_2, var_1617_15, var_1617_16)
	end

	local function var_1617_39(arg_1642_0, arg_1642_1, arg_1642_2, arg_1642_3, arg_1642_4)
		if arg_1642_3 <= 0.001 then
			return
		end

		local var_1642_0 = var_1617_27()
		local var_1642_1 = " Spectators"
		local var_1642_2 = arg_1642_4 > 0 and var_1617_8 .. " (" .. arg_1642_4 .. ")" or ""
		local var_1642_3 = slot_0_89_0.hud_accent_color(arg_1642_3)
		local var_1642_4 = color(255, 255, 255, math.floor(255 * arg_1642_3))
		local var_1642_5 = var_1617_26(var_1642_0)
		local var_1642_6 = var_1617_24(var_1617_9 .. var_1642_1)
		local var_1642_7 = arg_1642_4 > 0 and var_1617_24(var_1642_2) or 0
		local var_1642_8, var_1642_9 = var_1617_25(var_1617_21, var_1642_1)
		local var_1642_10, var_1642_11 = var_1617_25(var_1617_22, var_1642_0 ~= "" and var_1642_0 or " ")
		local var_1642_12 = arg_1642_0 + (arg_1642_2 - ((var_1642_0 ~= "" and var_1642_5 + 4 or 0) + var_1642_6 + var_1642_7)) * 0.5
		local var_1642_13 = arg_1642_1 + (var_1617_3 - var_1642_11) * 0.5
		local var_1642_14 = arg_1642_1 + (var_1617_3 - var_1642_9) * 0.5

		pcall(function()
			if var_1642_0 ~= "" then
				render.text(var_1617_22, vector(var_1642_12, var_1642_13), var_1642_3, nil, var_1642_0)

				var_1642_12 = var_1642_12 + var_1642_5 + 4
			end

			render.text(var_1617_21, vector(var_1642_12, var_1642_14), var_1642_4, nil, var_1617_9 .. var_1642_1)

			if arg_1642_4 > 0 then
				render.text(var_1617_21, vector(var_1642_12 + var_1642_6, var_1642_14), var_1642_4, nil, var_1642_2)
			end
		end)
	end

	local function var_1617_40(arg_1644_0, arg_1644_1, arg_1644_2, arg_1644_3, arg_1644_4, arg_1644_5)
		arg_1644_5 = math.max(0, math.min(1, tonumber(arg_1644_5) or 1))

		if arg_1644_4 <= 0.001 or arg_1644_5 <= 0.004 then
			return
		end

		local var_1644_0 = arg_1644_4 * arg_1644_5
		local var_1644_1 = arg_1644_3.exiting == true and (1 - arg_1644_5) * 10 or (1 - arg_1644_5) * 4
		local var_1644_2 = arg_1644_0
		local var_1644_3 = arg_1644_1 - var_1644_1
		local var_1644_4 = arg_1644_0 + arg_1644_2
		local var_1644_5 = var_1644_3 + var_1617_0 * arg_1644_5

		if var_1644_4 <= var_1644_2 + 4 or var_1644_5 <= var_1644_3 + 0.5 then
			return
		end

		slot_0_89_0.paint_hud_card_bg(vector(var_1644_2, var_1644_3), vector(var_1644_4, var_1644_5), var_1644_0, nil, nil, {
			bg_alpha = 105,
			stripe = false
		})

		local var_1644_6 = var_1617_9 .. tostring(arg_1644_3.nick or "")
		local var_1644_7 = math.floor(255 * var_1644_0)
		local var_1644_8 = var_1644_2 + var_1617_2
		local var_1644_9 = var_1644_3 + 3

		pcall(function()
			if arg_1644_3.avatar then
				render.texture(arg_1644_3.avatar, vector(var_1644_4 - var_1617_2 - var_1617_7, var_1644_3 + 2), vector(var_1617_7, var_1617_7), color(255, 255, 255, var_1644_7), "f", 8)
			end

			render.text(var_1617_21, vector(var_1644_8, var_1644_9), color(255, 255, 255, var_1644_7), nil, var_1644_6)
		end)
	end

	local function var_1617_41(arg_1646_0)
		return var_1617_2 * 2 + var_1617_24(var_1617_9 .. arg_1646_0.nick) + var_1617_7 + 8
	end

	local function var_1617_42(arg_1647_0, arg_1647_1)
		local var_1647_0 = var_1617_27()
		local var_1647_1 = " Spectators"
		local var_1647_2 = arg_1647_1 > 0 and var_1617_8 .. " (" .. arg_1647_1 .. ")" or ""
		local var_1647_3 = var_1617_26(var_1647_0)
		local var_1647_4 = (var_1647_0 ~= "" and var_1647_3 + 4 or 0) + var_1617_24(var_1617_9 .. var_1647_1) + (arg_1647_1 > 0 and var_1617_24(var_1647_2) or 0) + var_1617_5 * 2

		for iter_1647_0 = 1, #arg_1647_0 do
			var_1647_4 = math.max(var_1647_4, var_1617_41(arg_1647_0[iter_1647_0]))
		end

		local var_1647_5 = math.max(var_1617_6, var_1647_4)
		local var_1647_6 = 0

		for iter_1647_1 = 1, #arg_1647_0 do
			var_1647_6 = var_1647_6 + var_1617_1 * (arg_1647_0[iter_1647_1].mix or 1)
		end

		local var_1647_7

		if var_1647_6 > 0.001 then
			var_1647_7 = var_1617_4 + var_1647_6 + var_1617_5
		else
			var_1647_7 = var_1617_3 + var_1617_5 * 2
		end

		return var_1647_5, var_1647_7
	end

	local function var_1617_43(arg_1648_0)
		if not slot_0_78_0.ov_store_loaded then
			slot_0_89_0.store_read()

			slot_0_78_0.ov_store_loaded = true
		end

		local var_1648_0 = slot_0_89_0.store_slot("spectators")

		if var_1648_0._init ~= true then
			var_1648_0.align = 2
			var_1648_0.x = arg_1648_0.x - var_1617_6 - 24
			var_1648_0.y = 120
			var_1648_0._init = true
			var_1648_0._sp_v1 = true

			slot_0_89_0.store_write()
		end

		var_1617_19.align = math.max(0, math.min(2, math.floor(tonumber(var_1648_0.align) or 0)))

		return var_1648_0
	end

	local function var_1617_44(arg_1649_0)
		local var_1649_0, var_1649_1, var_1649_2 = pcall(function()
			return ui.get_position(), ui.get_size()
		end)

		if not var_1649_0 or not var_1649_1 or not var_1649_2 then
			return false
		end

		return slot_0_89_0.point_in_rect(arg_1649_0.x, arg_1649_0.y, var_1649_1.x, var_1649_1.y, var_1649_2.x, var_1649_2.y)
	end

	local function var_1617_45(arg_1651_0)
		if arg_1651_0 and var_1617_18.active then
			slot_0_89_0.store_write()
		end

		slot_0_89_0.overlay_drag_clear(var_1617_18, arg_1651_0 ~= true)

		slot_0_78_0.ov_spectators_mouse_block = false
	end

	local function var_1617_46(arg_1652_0, arg_1652_1, arg_1652_2, arg_1652_3, arg_1652_4)
		slot_0_89_0.overlay_drag_think({
			drag = var_1617_18,
			menu_alpha = arg_1652_0,
			scr = arg_1652_1,
			slot = arg_1652_2,
			mouse_on_menu = var_1617_44,
			get_rect = function()
				return var_1617_19.pos.x, var_1617_19.pos.y, arg_1652_3, arg_1652_4
			end,
			is_blocked = function()
				return slot_0_78_0.ov_wm_mouse_block or slot_0_78_0.ov_elog_mouse_block or slot_0_78_0.ov_slowdown_mouse_block or slot_0_78_0.ov_keybinds_mouse_block or slot_0_78_0.chi_mouse_block or slot_0_78_0.ov_damage_ind_mouse_block or slot_0_78_0.ov_metrics_mouse_block
			end,
			on_held = function(arg_1655_0)
				arg_1655_0.align = 0
			end,
			snap_pos = function(arg_1656_0, arg_1656_1, arg_1656_2, arg_1656_3)
				local var_1656_0 = var_1617_18.aligning == "y" and "y" or var_1617_18.aligning == "x" and "x" or nil
				local var_1656_1 = slot_0_89_0.snap_box_to_guides(vector(arg_1656_0, arg_1656_1), vector(arg_1656_2, arg_1656_3), arg_1652_1, var_1656_0)

				return var_1656_1.x, var_1656_1.y
			end,
			clamp_pos = function(arg_1657_0, arg_1657_1, arg_1657_2, arg_1657_3)
				return math.max(0, math.min(arg_1652_1.x - arg_1657_2, arg_1657_0)), math.max(24, math.min(arg_1652_1.y - arg_1657_3 - 24, arg_1657_1))
			end,
			apply_layout = function(arg_1658_0, arg_1658_1)
				var_1617_19.pos.x = arg_1658_0
				var_1617_19.pos.y = arg_1658_1
				arg_1652_2.x = arg_1658_0
				arg_1652_2.y = arg_1658_1
			end,
			on_release = function(arg_1659_0)
				slot_0_89_0.overlay_drag_release_third(arg_1659_0, arg_1652_3, arg_1652_1, var_1617_5, 24, arg_1652_1.y - arg_1652_4 - 24)

				var_1617_19.align = arg_1659_0.align
				var_1617_18.ready = nil
				var_1617_18.grab = nil
			end,
			on_save = function()
				slot_0_89_0.store_write()
			end,
			on_reset = function(arg_1661_0)
				var_1617_45(arg_1661_0 == true)
			end,
			set_mouse_block = function(arg_1662_0)
				slot_0_78_0.ov_spectators_mouse_block = arg_1662_0
			end
		})
	end

	pcall(function()
		events.round_start:set(function()
			var_1617_31()
		end)
	end)

	return function()
		slot_0_78_0.ov_spectators_mouse_block = false

		if not var_1617_36() then
			var_1617_45(false)
			var_1617_31()

			return
		end

		local var_1665_0 = slot_0_89_0.screen_size_cached()

		if not var_1665_0 or not var_1665_0.x or var_1665_0.x < 8 then
			return
		end

		local var_1665_1 = 0

		pcall(function()
			var_1665_1 = ui.get_alpha() or 0
		end)

		local var_1665_2 = var_1665_1 > 0.01
		local var_1665_3 = var_1617_35()
		local var_1665_4

		if var_1665_2 and #var_1665_3 == 0 then
			var_1665_4 = var_1617_34()
		else
			var_1665_4 = var_1617_33(var_1665_3)
		end

		local var_1665_5 = #var_1665_3
		local var_1665_6 = slot_0_89_0.hud_fade("spectators", var_1665_5 > 0 or var_1665_2)

		if var_1665_6 <= 0.001 and not var_1665_2 then
			var_1617_45(false)
			var_1617_31()

			return
		end

		local var_1665_7, var_1665_8 = var_1617_42(var_1665_4, var_1665_5)

		var_1617_19.size.x = var_1665_7
		var_1617_19.size.y = var_1665_8

		local var_1665_9 = var_1617_43(var_1665_0)

		if not var_1617_18.active then
			slot_0_89_0.slot_apply_rest(var_1665_9, var_1665_7, var_1665_8, var_1665_0, var_1617_5, 24, var_1665_0.y - var_1665_8 - 24)
		end

		var_1617_19.pos.x = var_1665_9.x
		var_1617_19.pos.y = var_1665_9.y

		local var_1665_10 = var_1617_19.pos.x
		local var_1665_11 = var_1617_19.pos.y
		local var_1665_12 = var_1665_6

		var_1617_38(vector(var_1665_10, var_1665_11), vector(var_1665_10 + var_1665_7, var_1665_11 + var_1617_3), var_1665_12)
		var_1617_39(var_1665_10, var_1665_11, var_1665_7, var_1665_12, var_1665_5)

		if #var_1665_4 == 0 then
			var_1617_46(var_1665_1, var_1665_0, var_1665_9, var_1665_7, var_1665_8)

			if var_1665_1 > 0.01 then
				slot_0_89_0.overlay_drag_paint_hover({
					drag = var_1617_18,
					get_rect = function()
						return var_1617_19.pos.x, var_1617_19.pos.y, var_1665_7, var_1665_8
					end
				}, var_1665_1, var_1665_0)
			end

			return
		end

		local var_1665_13 = var_1665_11 + var_1617_4

		for iter_1665_0 = 1, #var_1665_4 do
			local var_1665_14 = var_1665_4[iter_1665_0]
			local var_1665_15 = var_1665_14.mix or 1

			var_1617_40(var_1665_10, var_1665_13, var_1665_7, var_1665_14, var_1665_12, var_1665_15)

			var_1665_13 = var_1665_13 + var_1617_1 * var_1665_15
		end

		var_1617_46(var_1665_1, var_1665_0, var_1665_9, var_1665_7, var_1665_8)

		if var_1665_1 > 0.01 then
			local var_1665_16 = var_1617_4 + var_1617_5

			for iter_1665_1 = 1, #var_1665_4 do
				var_1665_16 = var_1665_16 + var_1617_1 * (var_1665_4[iter_1665_1].mix or 1)
			end

			slot_0_89_0.overlay_drag_paint_hover({
				drag = var_1617_18,
				get_rect = function()
					return var_1617_19.pos.x, var_1617_19.pos.y, var_1665_7, var_1665_16
				end
			}, var_1665_1, var_1665_0)
		end
	end
end)()
slot_0_78_0.manual_arrows_render = (function()
	local var_1669_0 = {
		ready = false
	}
	local var_1669_1 = {}

	local function var_1669_2()
		if var_1669_0.ready then
			return
		end

		var_1669_0.ready = true

		pcall(function()
			var_1669_0.left = render.load_image("<svg width=\"10\" height=\"10\" viewBox=\"0 0 10 10\"><path fill=\"#fff\" d=\"M7 1 L2 5 L7 9 Z\"/></svg>", vector(10, 10))
			var_1669_0.right = render.load_image("<svg width=\"10\" height=\"10\" viewBox=\"0 0 10 10\"><path fill=\"#fff\" d=\"M3 1 L8 5 L3 9 Z\"/></svg>", vector(10, 10))
			var_1669_0.up = render.load_image("<svg width=\"10\" height=\"10\" viewBox=\"0 0 10 10\"><path fill=\"#fff\" d=\"M1 7 L5 2 L9 7 Z\"/></svg>", vector(10, 10))
			var_1669_0.down = render.load_image("<svg width=\"10\" height=\"10\" viewBox=\"0 0 10 10\"><path fill=\"#fff\" d=\"M1 3 L5 8 L9 3 Z\"/></svg>", vector(10, 10))
		end)
	end

	local function var_1669_3(arg_1672_0, arg_1672_1)
		if not arg_1672_0 or type(arg_1672_0.get) ~= "function" then
			return arg_1672_1
		end

		local var_1672_0, var_1672_1 = pcall(function()
			return arg_1672_0:get()
		end)

		if var_1672_0 and var_1672_1 ~= nil then
			return var_1672_1
		end

		return arg_1672_1
	end

	local function var_1669_4(arg_1674_0, arg_1674_1, arg_1674_2)
		return arg_1674_0 + (arg_1674_1 - arg_1674_0) * arg_1674_2
	end

	return function()
		local var_1675_0 = slot_0_152_0.vars and slot_0_152_0.vars.ov_arrows

		if not var_1675_0 or var_1669_3(var_1675_0, false) ~= true then
			return
		end

		local var_1675_1 = entity.get_local_player()

		if not var_1675_1 or not var_1675_1:is_alive() then
			return
		end

		local var_1675_2 = slot_0_89_0.screen_size_cached()

		if not var_1675_2 or not var_1675_2.x or var_1675_2.x < 8 then
			return
		end

		local var_1675_3 = slot_0_78_0.aa and slot_0_78_0.aa.manual_yaw_mode and slot_0_78_0.aa.manual_yaw_mode() or "Off"
		local var_1675_4 = var_1675_3 ~= "Off"
		local var_1675_5 = math.min(1, (globals.frametime or 0.016) * 12)
		local var_1675_6 = var_1669_4(var_1669_1.group or 0, var_1675_4 and 1 or 0, var_1675_5)

		var_1669_1.group = var_1675_6

		if var_1675_6 <= 0.01 then
			return
		end

		var_1669_2()

		if not var_1669_0.left then
			return
		end

		local var_1675_7 = math.floor(tonumber(var_1669_3(var_1675_0.arrows_size, 11)) or 11)
		local var_1675_8 = tonumber(var_1669_3(var_1675_0.arrows_gap, 26)) or 26
		local var_1675_9 = var_1669_3(var_1675_0.arrows_color, color(165, 125, 255, 255))
		local var_1675_10 = tonumber(var_1675_9.r) or 165
		local var_1675_11 = tonumber(var_1675_9.g) or 125
		local var_1675_12 = tonumber(var_1675_9.b) or 255
		local var_1675_13 = tonumber(var_1675_9.a) or 255
		local var_1675_14 = var_1675_2.x * 0.5
		local var_1675_15 = var_1675_2.y * 0.5
		local var_1675_16 = {
			{
				key = "left",
				on = var_1675_3 == "Left",
				pos = vector(var_1675_14 - var_1675_8 - var_1675_7, var_1675_15 - var_1675_7 * 0.5)
			},
			{
				key = "right",
				on = var_1675_3 == "Right",
				pos = vector(var_1675_14 + var_1675_8, var_1675_15 - var_1675_7 * 0.5)
			}
		}

		if _G.arrow_extra_on(var_1675_0.extra_dirs, "Forward") then
			var_1675_16[#var_1675_16 + 1] = {
				key = "up",
				on = var_1675_3 == "Forward",
				pos = vector(var_1675_14 - var_1675_7 * 0.5, var_1675_15 - var_1675_8 - var_1675_7)
			}
		end

		for iter_1675_0 = 1, #var_1675_16 do
			local var_1675_17 = var_1675_16[iter_1675_0]
			local var_1675_18 = var_1669_4(var_1669_1[var_1675_17.key] or 0, var_1675_17.on and 1 or 0, var_1675_5)

			var_1669_1[var_1675_17.key] = var_1675_18

			local var_1675_19 = var_1669_0[var_1675_17.key]

			if var_1675_19 then
				local var_1675_20 = color(math.floor(var_1669_4(255, var_1675_10, var_1675_18)), math.floor(var_1669_4(255, var_1675_11, var_1675_18)), math.floor(var_1669_4(255, var_1675_12, var_1675_18)), math.floor(var_1669_4(70, var_1675_13, var_1675_18) * var_1675_6))

				pcall(function()
					render.texture(var_1675_19, var_1675_17.pos, vector(var_1675_7, var_1675_7), var_1675_20, "f")
				end)
			end
		end
	end
end)()
slot_0_78_0.hud_keybinds_tick = (function()
	local var_1677_0 = 20
	local var_1677_1 = 22
	local var_1677_2 = 6
	local var_1677_3 = 22
	local var_1677_4 = 28
	local var_1677_5 = 11
	local var_1677_6 = 4
	local var_1677_7 = 148
	local var_1677_8 = "\aFFFFFF50"
	local var_1677_9 = "\aFFFFFFFF"
	local var_1677_10 = ""
	local var_1677_11
	local var_1677_12 = {}
	local var_1677_13 = {
		{
			state = "on",
			icon = "bolt",
			label = "double tap"
		},
		{
			state = "on",
			icon = "eye-slash",
			label = "hide shots"
		},
		{
			state = "holding",
			icon = "gun",
			label = "min. damage"
		}
	}
	local var_1677_14 = {}
	local var_1677_15 = {}
	local var_1677_16 = {}
	local var_1677_17 = {}
	local var_1677_18 = false
	local var_1677_19
	local var_1677_20
	local var_1677_21 = {
		active = false,
		hover = false
	}
	local var_1677_22 = {
		align = 0,
		pos = vector(120, 420),
		size = vector(var_1677_7, 80)
	}
	local var_1677_23 = {
		h = 80,
		w = var_1677_7
	}

	local function var_1677_24(arg_1678_0)
		local var_1678_0, var_1678_1 = pcall(render.load_font, "Segoe UI Semibold", arg_1678_0 or vector(14, 12), "a")

		if var_1678_0 and var_1678_1 then
			return var_1678_1
		end

		return 1
	end

	local var_1677_25 = var_1677_24()
	local var_1677_26 = var_1677_24(vector(18, 14))
	local var_1677_27

	local function var_1677_28()
		if var_1677_27 ~= nil then
			return var_1677_27
		end

		local var_1679_0, var_1679_1 = pcall(ui.get_icon, "toggle-on")

		if var_1679_0 and var_1679_1 and var_1679_1 ~= "" then
			var_1677_27 = var_1679_1
		else
			var_1677_27 = ""
		end

		return var_1677_27
	end

	for iter_1677_0 = 1, #var_1677_13 do
		if var_1677_13[iter_1677_0].state == "on" then
			var_1677_13[iter_1677_0].state = var_1677_28()
		end
	end

	local function var_1677_29()
		local var_1680_0 = slot_0_152_0.vars and slot_0_152_0.vars.ov_keybinds

		if not var_1680_0 or not var_1680_0.feature_icons or type(var_1680_0.feature_icons.get) ~= "function" then
			return false
		end

		local var_1680_1, var_1680_2 = pcall(function()
			return var_1680_0.feature_icons:get() == true
		end)

		return var_1680_1 and var_1680_2 == true
	end

	local function var_1677_30()
		local var_1682_0 = slot_0_152_0.vars and slot_0_152_0.vars.ov_keybinds

		if not var_1682_0 or not var_1682_0.revert or type(var_1682_0.revert.get) ~= "function" then
			return false
		end

		local var_1682_1, var_1682_2 = pcall(function()
			return var_1682_0.revert:get() == true
		end)

		return var_1682_1 and var_1682_2 == true
	end

	local function var_1677_31(arg_1684_0)
		return var_1677_29() and arg_1684_0 and arg_1684_0 ~= ""
	end

	local function var_1677_32(arg_1685_0)
		local var_1685_0 = _G.KB_BIND_DEFS or {}

		for iter_1685_0 = 1, #var_1685_0 do
			local var_1685_1 = var_1685_0[iter_1685_0]

			if var_1685_1 and var_1685_1.id == arg_1685_0 then
				return var_1685_1.icon
			end
		end

		return nil
	end

	local function var_1677_33(arg_1686_0)
		arg_1686_0 = tostring(arg_1686_0 or "")

		if arg_1686_0 == "" then
			return ""
		end

		if var_1677_12[arg_1686_0] ~= nil then
			return var_1677_12[arg_1686_0]
		end

		local var_1686_0, var_1686_1 = pcall(ui.get_icon, arg_1686_0)

		if var_1686_0 and type(var_1686_1) == "string" and var_1686_1 ~= "" then
			var_1677_12[arg_1686_0] = var_1686_1

			return var_1686_1
		end

		var_1677_12[arg_1686_0] = ""

		return ""
	end

	local function var_1677_34(arg_1687_0)
		return var_1677_33(var_1677_32(arg_1687_0))
	end

	local function var_1677_35(arg_1688_0)
		arg_1688_0 = tostring(arg_1688_0 or "")

		if arg_1688_0 == "" then
			return 0
		end

		return (slot_0_89_0.measure_cached(var_1677_26, arg_1688_0))
	end

	local function var_1677_36()
		if var_1677_11 ~= nil then
			return var_1677_11
		end

		local var_1689_0, var_1689_1 = pcall(ui.get_icon, "keyboard-brightness")

		if var_1689_0 and var_1689_1 and var_1689_1 ~= "" then
			var_1677_11 = var_1689_1

			return var_1677_11
		end

		var_1677_11 = var_1677_10

		return var_1677_11
	end

	local function var_1677_37()
		return var_1677_9 .. var_1677_36() .. " Key Binds"
	end

	local var_1677_38 = 18
	local var_1677_39 = 6
	local var_1677_40 = 3
	local var_1677_41 = 4
	local var_1677_42 = var_1677_38 + var_1677_40 + var_1677_39 + var_1677_40 + var_1677_41

	local function var_1677_43(arg_1691_0)
		return arg_1691_0 + var_1677_6 + var_1677_38 + var_1677_40 + var_1677_39 * 0.5
	end

	local function var_1677_44()
		local var_1692_0 = var_1677_36()

		if var_1692_0 == "" then
			return 0
		end

		return (slot_0_89_0.measure_cached(var_1677_26, var_1692_0))
	end

	local function var_1677_45(arg_1693_0, arg_1693_1)
		local var_1693_0, var_1693_1 = slot_0_89_0.measure_cached(arg_1693_0, arg_1693_1)

		return var_1693_0, var_1693_1
	end

	local function var_1677_46(arg_1694_0, arg_1694_1, arg_1694_2)
		local var_1694_0 = "ap.kb\x00" .. arg_1694_0
		local var_1694_1 = var_1677_15[var_1694_0] or 0
		local var_1694_2 = var_1694_1 + (arg_1694_1 - var_1694_1) * math.min(1, (globals.frametime or 0.016) * (arg_1694_2 or 14))

		var_1677_15[var_1694_0] = var_1694_2

		return var_1694_2
	end

	local function var_1677_47(arg_1695_0)
		return (slot_0_89_0.measure_cached(var_1677_25, arg_1695_0))
	end

	local function var_1677_48(arg_1696_0)
		arg_1696_0 = tostring(arg_1696_0 or "")

		if var_1677_14[arg_1696_0] then
			return var_1677_14[arg_1696_0]
		end

		local var_1696_0 = chi.strip_markup(arg_1696_0):gsub("[\t ]+", " "):gsub("^%s+", ""):gsub("%s+$", ""):lower()

		var_1677_14[arg_1696_0] = var_1696_0

		return var_1696_0
	end

	local function var_1677_49(arg_1697_0, arg_1697_1)
		local var_1697_0 = tonumber(arg_1697_1) or 0

		if type(arg_1697_0) == "boolean" then
			if var_1697_0 == 1 then
				return arg_1697_0 and "holding" or "holding"
			end

			return arg_1697_0 and var_1677_28() or "off"
		end

		if type(arg_1697_0) == "table" then
			local var_1697_1 = {}

			for iter_1697_0 = 1, #arg_1697_0 do
				local var_1697_2 = tostring(arg_1697_0[iter_1697_0] or "")

				if #var_1697_2 > 0 then
					var_1697_1[#var_1697_1 + 1] = var_1697_2:sub(1, 1):upper()
				end
			end

			if #var_1697_1 > 0 then
				return table.concat(var_1697_1, ", ")
			end

			return var_1677_28()
		end

		local var_1697_3 = tostring(arg_1697_0 or "")

		if var_1697_3 == "" then
			return var_1677_28()
		end

		return var_1697_3:lower()
	end

	local var_1677_50 = {
		Damage = "Min. Damage",
		Hitchance = "Hit Chance"
	}

	local function var_1677_51(arg_1698_0)
		local var_1698_0 = slot_0_152_0.vars and slot_0_152_0.vars.ov_keybinds

		if not var_1698_0 or not var_1698_0.binds then
			return true
		end

		return _G.bind_listed_check(var_1698_0.binds, arg_1698_0, _G.KB_BIND_DEFS)
	end

	local function var_1677_52(arg_1699_0)
		if not arg_1699_0 or type(arg_1699_0.get) ~= "function" then
			return false
		end

		local var_1699_0, var_1699_1 = pcall(function()
			return arg_1699_0:get()
		end)

		return var_1699_0 and var_1699_1 == true
	end

	local function var_1677_53(arg_1701_0, arg_1701_1)
		if not arg_1701_0 or type(arg_1701_0.get) ~= "function" then
			return false
		end

		local var_1701_0, var_1701_1 = pcall(function()
			return arg_1701_0:get()
		end)

		return var_1701_0 and tostring(var_1701_1 or "") == arg_1701_1
	end

	local function var_1677_54()
		local var_1703_0 = 0
		local var_1703_1 = slot_0_152_0.vars and slot_0_152_0.vars.ping_spike_unlock

		if var_1703_1 and type(var_1703_1.get) == "function" then
			local var_1703_2, var_1703_3 = pcall(function()
				return var_1703_1:get() == true
			end)

			if var_1703_2 and var_1703_3 and var_1703_1.ovr and type(var_1703_1.ovr.get) == "function" then
				local var_1703_4, var_1703_5 = pcall(function()
					return var_1703_1.ovr:get()
				end)

				if var_1703_4 and type(var_1703_5) == "number" then
					var_1703_0 = math.max(0, var_1703_5)
				end
			end
		end

		return var_1703_0
	end

	local function var_1677_55()
		if var_1677_52(refs.freestanding) then
			return true
		end

		local var_1706_0 = slot_0_152_0.antiaim and slot_0_152_0.antiaim.freestand

		if var_1706_0 and type(var_1706_0.get) == "function" then
			local var_1706_1, var_1706_2 = pcall(function()
				return var_1706_0:get() == true
			end)

			return var_1706_1 and var_1706_2 == true
		end

		return false
	end

	local function var_1677_56(arg_1708_0, arg_1708_1)
		if arg_1708_0 == "PING" then
			local var_1708_0 = var_1677_54()
			local var_1708_1 = false

			pcall(function()
				if refs.fakeping and type(refs.fakeping.get) == "function" then
					var_1708_1 = (tonumber(refs.fakeping:get()) or 0) > 0
				end
			end)

			return var_1708_1 or var_1708_0 > 0
		end

		if arg_1708_0 == "Double Tap" then
			return var_1677_52(refs.dt) and not var_1677_52(refs.hs)
		end

		if arg_1708_0 == "Hide Shots" then
			return var_1677_52(refs.hs)
		end

		if arg_1708_0 == "AI Peek" then
			return type(slot_0_78_0.ai_peek_bind_on) == "function" and slot_0_78_0.ai_peek_bind_on() == true
		end

		if arg_1708_0 == "Dormant Aimbot" then
			return var_1677_52(refs.dormant)
		end

		if arg_1708_0 == "Fake Duck" then
			return var_1677_52(refs.fd)
		end

		if arg_1708_0 == "Body Aim" then
			return var_1677_53(refs.body_aim, "Force")
		end

		if arg_1708_0 == "Safe Points" then
			return var_1677_53(refs.safe_points, "Force")
		end

		if arg_1708_0 == "Freestanding" then
			return var_1677_55()
		end

		if arg_1708_0 == "Hitchance" then
			return arg_1708_1["Hit Chance"] ~= nil
		end

		if arg_1708_0 == "Damage" then
			return arg_1708_1["Min. Damage"] ~= nil
		end

		return false
	end

	local function var_1677_57(arg_1710_0, arg_1710_1)
		local var_1710_0 = arg_1710_1[var_1677_50[arg_1710_0] or arg_1710_0]

		if var_1710_0 then
			return var_1677_49(var_1710_0.value, var_1710_0.mode)
		end

		return var_1677_28()
	end

	local function var_1677_58()
		local var_1711_0 = {}
		local var_1711_1 = {}
		local var_1711_2, var_1711_3 = pcall(ui.get_binds)

		if var_1711_2 and type(var_1711_3) == "table" then
			for iter_1711_0 = 1, #var_1711_3 do
				local var_1711_4 = var_1711_3[iter_1711_0]

				if var_1711_4 and var_1711_4.active then
					var_1711_1[tostring(var_1711_4.name or "")] = var_1711_4
				end
			end
		end

		local var_1711_5 = _G.KB_BIND_DEFS or {}
		local var_1711_6 = {}

		for iter_1711_1 = 1, #var_1711_5 do
			local var_1711_7 = var_1711_5[iter_1711_1]
			local var_1711_8 = var_1711_7 and var_1711_7.id

			if var_1711_8 and var_1677_51(var_1711_8) and var_1677_56(var_1711_8, var_1711_1) and not var_1711_6[var_1711_8] then
				var_1711_6[var_1711_8] = true

				local var_1711_9 = var_1677_34(var_1711_8)

				var_1711_0[#var_1711_0 + 1] = {
					id = var_1711_8,
					label = var_1677_48(var_1711_8),
					state = var_1677_57(var_1711_8, var_1711_1),
					glyph = var_1711_9 ~= "" and var_1711_9 or nil
				}
			end
		end

		table.sort(var_1711_0, function(arg_1712_0, arg_1712_1)
			return tostring(arg_1712_0.label) < tostring(arg_1712_1.label)
		end)

		return var_1711_0
	end

	local function var_1677_59(arg_1713_0)
		return tostring(arg_1713_0 and arg_1713_0.id or arg_1713_0.label or "")
	end

	local function var_1677_60(arg_1714_0)
		for iter_1714_0 = 1, #var_1677_17 do
			if var_1677_17[iter_1714_0] == arg_1714_0 then
				return true
			end
		end

		return false
	end

	local function var_1677_61()
		var_1677_16 = {}
		var_1677_17 = {}
	end

	local function var_1677_62(arg_1716_0)
		local var_1716_0 = {}

		for iter_1716_0 = 1, #arg_1716_0 do
			local var_1716_1 = arg_1716_0[iter_1716_0]
			local var_1716_2 = var_1677_59(var_1716_1)

			if var_1716_2 ~= "" then
				var_1716_0[var_1716_2] = true

				if not var_1677_16[var_1716_2] then
					var_1677_16[var_1716_2] = {
						mix = 0,
						exiting = false
					}

					if not var_1677_60(var_1716_2) then
						var_1677_17[#var_1677_17 + 1] = var_1716_2
					end
				end

				var_1677_16[var_1716_2].id = var_1716_1.id
				var_1677_16[var_1716_2].label = var_1716_1.label
				var_1677_16[var_1716_2].state = var_1716_1.state
				var_1677_16[var_1716_2].glyph = var_1716_1.glyph
				var_1677_16[var_1716_2].exiting = false
			end
		end

		for iter_1716_1, iter_1716_2 in pairs(var_1677_16) do
			if not var_1716_0[iter_1716_1] then
				iter_1716_2.exiting = true
			end
		end

		for iter_1716_3 = #var_1677_17, 1, -1 do
			if not var_1677_16[var_1677_17[iter_1716_3]] then
				table.remove(var_1677_17, iter_1716_3)
			end
		end

		for iter_1716_4, iter_1716_5 in pairs(var_1677_16) do
			local var_1716_3 = iter_1716_5.exiting and 0 or 1
			local var_1716_4 = iter_1716_5.exiting and 16 or 20

			iter_1716_5.mix = var_1677_46("row." .. iter_1716_4, var_1716_3, var_1716_4)

			if iter_1716_5.mix <= 0.004 and iter_1716_5.exiting then
				var_1677_16[iter_1716_4] = nil
			end
		end
	end

	local function var_1677_63(arg_1717_0)
		var_1677_62(arg_1717_0)

		local var_1717_0 = {}

		for iter_1717_0 = 1, #var_1677_17 do
			local var_1717_1 = var_1677_17[iter_1717_0]
			local var_1717_2 = var_1677_16[var_1717_1]

			if var_1717_2 and var_1717_2.mix > 0.004 then
				var_1717_0[#var_1717_0 + 1] = {
					label = var_1717_2.label,
					state = var_1717_2.state,
					glyph = var_1717_2.glyph,
					mix = var_1717_2.mix,
					exiting = var_1717_2.exiting == true
				}
			end
		end

		return var_1717_0
	end

	local function var_1677_64()
		local var_1718_0 = {}

		for iter_1718_0 = 1, #var_1677_13 do
			local var_1718_1 = var_1677_13[iter_1718_0]
			local var_1718_2 = var_1718_1.icon and var_1677_33(var_1718_1.icon) or ""

			if not var_1677_31(var_1718_2) then
				var_1718_2 = nil
			end

			var_1718_0[iter_1718_0] = {
				mix = 1,
				exiting = false,
				label = var_1718_1.label,
				state = var_1718_1.state,
				glyph = var_1718_2
			}
		end

		return var_1718_0
	end

	local function var_1677_65()
		if var_1677_18 then
			return
		end

		var_1677_18 = true

		pcall(function()
			var_1677_19 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M0 6V4c0-2 2-4 4-4v2C2 2 0 4 0 6Z\"/></svg>", vector(8, 12))
			var_1677_20 = render.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M4 6c0-2-2-4-4-4V0c2 0 4 2 4 4v2Z\"/></svg>", vector(8, 12))
		end)
	end

	local function var_1677_66(arg_1721_0, arg_1721_1, arg_1721_2)
		var_1677_65()
		slot_0_89_0.paint_hud_card_bg(arg_1721_0, arg_1721_1, arg_1721_2, var_1677_19, var_1677_20)
	end

	local function var_1677_67(arg_1722_0, arg_1722_1, arg_1722_2, arg_1722_3)
		if arg_1722_3 <= 0.001 then
			return
		end

		local var_1722_0 = var_1677_36()
		local var_1722_1 = " Key Binds"
		local var_1722_2 = slot_0_89_0.hud_accent_color(arg_1722_3)
		local var_1722_3 = color(255, 255, 255, math.floor(255 * arg_1722_3))
		local var_1722_4 = var_1677_44()
		local var_1722_5, var_1722_6 = var_1677_45(var_1677_25, var_1722_1)
		local var_1722_7, var_1722_8 = var_1677_45(var_1677_26, var_1722_0 ~= "" and var_1722_0 or " ")
		local var_1722_9 = var_1677_47(var_1677_9 .. var_1722_1)
		local var_1722_10 = arg_1722_1 + var_1677_5
		local var_1722_11 = var_1722_10 - var_1722_6 * 0.5

		pcall(function()
			if slot_0_89_0.hud_widget_use_arc_divider() and var_1722_0 ~= "" then
				local var_1723_0 = arg_1722_0 + var_1677_6
				local var_1723_1 = var_1677_43(arg_1722_0)
				local var_1723_2, var_1723_3 = pcall(function()
					return render.measure_text(var_1677_26, nil, var_1722_0)
				end)
				local var_1723_4 = var_1723_2 and var_1723_3 and type(var_1723_3.x) == "number" and var_1723_3.x or var_1722_4
				local var_1723_5 = var_1723_0 + (var_1723_1 - var_1723_0) * 0.5 - var_1723_4 * 0.5
				local var_1723_6 = arg_1722_1 + (var_1677_3 - var_1722_8) * 0.5

				render.text(var_1677_26, vector(var_1723_5, var_1723_6), var_1722_2, nil, var_1722_0)
				slot_0_89_0.paint_hud_divider_arc(var_1723_1, arg_1722_1, arg_1722_1 + var_1677_3, arg_1722_3, false)

				local var_1723_7 = var_1723_1
				local var_1723_8 = arg_1722_0 + arg_1722_2 - var_1677_6
				local var_1723_9 = var_1723_7 + math.max(0, (var_1723_8 - var_1723_7 - var_1722_9) * 0.5)

				render.text(var_1677_25, vector(var_1723_9, var_1722_11), var_1722_3, nil, var_1722_1)
			else
				local var_1723_10 = var_1722_4 + var_1722_9
				local var_1723_11 = arg_1722_0 + (arg_1722_2 - var_1723_10) * 0.5
				local var_1723_12 = var_1722_10 - var_1722_8 * 0.5

				if var_1722_0 ~= "" then
					render.text(var_1677_26, vector(var_1723_11, var_1723_12), var_1722_2, nil, var_1722_0)
				end

				render.text(var_1677_25, vector(var_1723_11 + var_1722_4, var_1722_11), var_1722_3, nil, var_1722_1)
			end
		end)
	end

	local function var_1677_68(arg_1725_0, arg_1725_1, arg_1725_2, arg_1725_3, arg_1725_4, arg_1725_5, arg_1725_6, arg_1725_7)
		local var_1725_0 = arg_1725_6 and var_1677_35(arg_1725_6) + 3 or 0
		local var_1725_1 = var_1677_47(arg_1725_5) + var_1725_0
		local var_1725_2

		if arg_1725_7 then
			var_1725_2 = arg_1725_1 - var_1725_1
		else
			var_1725_2 = arg_1725_0
		end

		if arg_1725_6 then
			local var_1725_3 = slot_0_89_0.hud_accent_color(arg_1725_4)

			render.text(var_1677_26, vector(var_1725_2, arg_1725_2), var_1725_3, nil, arg_1725_6)

			var_1725_2 = var_1725_2 + var_1677_35(arg_1725_6) + 3
		end

		if arg_1725_7 then
			render.text(var_1677_25, vector(arg_1725_1, arg_1725_2), color(255, 255, 255, arg_1725_3), "r", arg_1725_5)
		else
			render.text(var_1677_25, vector(var_1725_2, arg_1725_2), color(255, 255, 255, arg_1725_3), nil, arg_1725_5)
		end
	end

	local function var_1677_69(arg_1726_0, arg_1726_1, arg_1726_2, arg_1726_3, arg_1726_4, arg_1726_5)
		arg_1726_5 = math.max(0, math.min(1, tonumber(arg_1726_5) or 1))

		if arg_1726_4 <= 0.001 or arg_1726_5 <= 0.004 then
			return
		end

		local var_1726_0 = arg_1726_4 * arg_1726_5
		local var_1726_1 = arg_1726_3.exiting == true and (1 - arg_1726_5) * 10 or (1 - arg_1726_5) * 4
		local var_1726_2 = arg_1726_0
		local var_1726_3 = arg_1726_1 - var_1726_1
		local var_1726_4 = arg_1726_0 + arg_1726_2
		local var_1726_5 = var_1726_3 + var_1677_0 * arg_1726_5

		if var_1726_4 <= var_1726_2 + 4 or var_1726_5 <= var_1726_3 + 0.5 then
			return
		end

		local var_1726_6 = vector(var_1726_2, var_1726_3)
		local var_1726_7 = vector(var_1726_4, var_1726_5)

		slot_0_89_0.paint_hud_card_bg(var_1726_6, var_1726_7, var_1726_0, nil, nil, {
			bg_alpha = 105,
			stripe = false
		})

		local var_1726_8 = var_1677_9 .. tostring(arg_1726_3.label or "")
		local var_1726_9 = var_1677_8 .. tostring(arg_1726_3.state or "")
		local var_1726_10 = var_1726_3 + 3
		local var_1726_11 = math.floor(255 * var_1726_0)
		local var_1726_12 = var_1677_31(arg_1726_3.glyph) and arg_1726_3.glyph or nil
		local var_1726_13 = var_1677_30()

		pcall(function()
			if var_1726_13 then
				render.text(var_1677_25, vector(var_1726_2 + var_1677_2, var_1726_10), color(255, 255, 255, var_1726_11), nil, var_1726_9)
				var_1677_68(var_1726_2 + var_1677_2, var_1726_4 - var_1677_2, var_1726_10, var_1726_11, var_1726_0, var_1726_8, var_1726_12, true)
			else
				var_1677_68(var_1726_2 + var_1677_2, var_1726_4 - var_1677_2, var_1726_10, var_1726_11, var_1726_0, var_1726_8, var_1726_12, false)
				render.text(var_1677_25, vector(var_1726_4 - var_1677_2, var_1726_10), color(255, 255, 255, var_1726_11), "r", var_1726_9)
			end
		end)
	end

	local function var_1677_70(arg_1728_0)
		local var_1728_0 = var_1677_47(var_1677_9 .. arg_1728_0.label)

		if var_1677_31(arg_1728_0.glyph) then
			var_1728_0 = var_1728_0 + var_1677_35(arg_1728_0.glyph) + 3
		end

		return var_1728_0 + var_1677_47(var_1677_8 .. arg_1728_0.state) + var_1677_2 * 2 + 32
	end

	local function var_1677_71(arg_1729_0)
		local var_1729_0

		if slot_0_89_0.hud_widget_use_arc_divider() then
			var_1729_0 = var_1677_6 + var_1677_42 + var_1677_47(var_1677_9 .. " Key Binds") + var_1677_6
		else
			var_1729_0 = var_1677_44() + var_1677_47(var_1677_9 .. " Key Binds")
		end

		for iter_1729_0 = 1, #arg_1729_0 do
			var_1729_0 = math.max(var_1729_0, var_1677_70(arg_1729_0[iter_1729_0]))
		end

		local var_1729_1 = math.max(var_1677_7, var_1729_0)
		local var_1729_2 = 0

		for iter_1729_1 = 1, #arg_1729_0 do
			var_1729_2 = var_1729_2 + var_1677_1 * (arg_1729_0[iter_1729_1].mix or 1)
		end

		local var_1729_3

		if var_1729_2 > 0.001 then
			var_1729_3 = var_1677_4 + var_1729_2 + var_1677_6
		else
			var_1729_3 = var_1677_3 + var_1677_6 * 2
		end

		return var_1729_1, var_1729_3
	end

	local function var_1677_72()
		if not slot_0_65_0() then
			return false
		end

		if not slot_0_152_0.vars or not slot_0_152_0.vars.ov_panel or not slot_0_152_0.vars.ov_keybinds then
			return false
		end

		if not slot_0_89_0 or type(slot_0_89_0.ov_sw) ~= "function" then
			return false
		end

		if slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_panel, false) ~= true then
			return false
		end

		return slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_keybinds, false) == true
	end

	local function var_1677_73(arg_1731_0)
		if not slot_0_78_0.ov_store_loaded then
			slot_0_89_0.store_read()

			slot_0_78_0.ov_store_loaded = true
		end

		local var_1731_0 = slot_0_89_0.store_slot("keybinds")

		if var_1731_0._init ~= true then
			var_1731_0.align = 0
			var_1731_0.x = 120
			var_1731_0.y = 420
			var_1731_0._init = true
			var_1731_0._kb_v1 = true

			slot_0_89_0.store_write()
		elseif var_1731_0._kb_v1 ~= true then
			var_1731_0.align = 0
			var_1731_0.x = 120
			var_1731_0.y = 420
			var_1731_0._kb_v1 = true

			slot_0_89_0.store_write()
		end

		var_1677_22.align = math.max(0, math.min(2, math.floor(tonumber(var_1731_0.align) or 0)))

		return var_1731_0
	end

	local function var_1677_74(arg_1732_0, arg_1732_1, arg_1732_2, arg_1732_3)
		local var_1732_0 = var_1677_6

		arg_1732_0.x = math.max(var_1732_0, math.min(arg_1732_3.x - arg_1732_1 - var_1732_0, arg_1732_0.x))
		arg_1732_0.y = math.max(24, math.min(arg_1732_3.y - arg_1732_2 - 24, arg_1732_0.y))
	end

	local function var_1677_75(arg_1733_0, arg_1733_1, arg_1733_2, arg_1733_3, arg_1733_4)
		arg_1733_1 = math.max(1, tonumber(arg_1733_1) or arg_1733_2)
		arg_1733_2 = math.max(1, tonumber(arg_1733_2) or arg_1733_1)

		local var_1733_0 = var_1677_6
		local var_1733_1 = math.max(0, math.min(2, math.floor(tonumber(arg_1733_0.align) or 0)))

		if var_1733_1 == 2 then
			arg_1733_0.x = arg_1733_0.x + arg_1733_1 - arg_1733_2
		elseif var_1733_1 == 0 and arg_1733_0.x <= var_1733_0 + 2 then
			-- block empty
		else
			arg_1733_0.x = arg_1733_0.x + arg_1733_1 * 0.5 - arg_1733_2 * 0.5
		end

		var_1677_74(arg_1733_0, arg_1733_2, arg_1733_4, arg_1733_3)
	end

	local function var_1677_76(arg_1734_0)
		local var_1734_0, var_1734_1, var_1734_2 = pcall(function()
			return ui.get_position(), ui.get_size()
		end)

		if not var_1734_0 or not var_1734_1 or not var_1734_2 then
			return false
		end

		return slot_0_89_0.point_in_rect(arg_1734_0.x, arg_1734_0.y, var_1734_1.x, var_1734_1.y, var_1734_2.x, var_1734_2.y)
	end

	local function var_1677_77(arg_1736_0)
		if arg_1736_0 and var_1677_21.active then
			slot_0_89_0.store_write()
		end

		slot_0_89_0.overlay_drag_clear(var_1677_21, arg_1736_0 ~= true)

		slot_0_78_0.ov_keybinds_mouse_block = false
	end

	local function var_1677_78(arg_1737_0, arg_1737_1, arg_1737_2, arg_1737_3, arg_1737_4)
		slot_0_89_0.overlay_drag_think({
			drag = var_1677_21,
			menu_alpha = arg_1737_0,
			scr = arg_1737_1,
			slot = arg_1737_2,
			mouse_on_menu = var_1677_76,
			get_rect = function()
				return var_1677_22.pos.x, var_1677_22.pos.y, arg_1737_3, arg_1737_4
			end,
			is_blocked = function()
				return slot_0_78_0.ov_wm_mouse_block or slot_0_78_0.ov_elog_mouse_block or slot_0_78_0.ov_slowdown_mouse_block or slot_0_78_0.chi_mouse_block or slot_0_78_0.ov_damage_ind_mouse_block or slot_0_78_0.ov_metrics_mouse_block or slot_0_78_0.ov_spectators_mouse_block
			end,
			on_held = function(arg_1740_0)
				arg_1740_0.align = 0
			end,
			snap_pos = function(arg_1741_0, arg_1741_1, arg_1741_2, arg_1741_3)
				local var_1741_0 = var_1677_21.aligning == "y" and "y" or var_1677_21.aligning == "x" and "x" or nil
				local var_1741_1 = slot_0_89_0.snap_box_to_guides(vector(arg_1741_0, arg_1741_1), vector(arg_1741_2, arg_1741_3), arg_1737_1, var_1741_0)

				return var_1741_1.x, var_1741_1.y
			end,
			clamp_pos = function(arg_1742_0, arg_1742_1, arg_1742_2, arg_1742_3)
				return math.max(0, math.min(arg_1737_1.x - arg_1742_2, arg_1742_0)), math.max(24, math.min(arg_1737_1.y - arg_1742_3 - 24, arg_1742_1))
			end,
			apply_layout = function(arg_1743_0, arg_1743_1)
				var_1677_22.pos.x = arg_1743_0
				var_1677_22.pos.y = arg_1743_1
				arg_1737_2.x = arg_1743_0
				arg_1737_2.y = arg_1743_1
			end,
			on_release = function(arg_1744_0)
				slot_0_89_0.overlay_drag_release_third(arg_1744_0, arg_1737_3, arg_1737_1, var_1677_6, 24, arg_1737_1.y - arg_1737_4 - 24)

				var_1677_22.align = arg_1744_0.align
			end,
			on_save = function()
				slot_0_89_0.store_write()
			end,
			on_reset = function(arg_1746_0)
				var_1677_77(arg_1746_0 == true)
			end,
			set_mouse_block = function(arg_1747_0)
				slot_0_78_0.ov_keybinds_mouse_block = arg_1747_0
			end
		})
	end

	return function()
		slot_0_78_0.ov_keybinds_mouse_block = false

		if not var_1677_72() then
			var_1677_77(false)
			var_1677_61()

			var_1677_23.rows = nil

			return
		end

		local var_1748_0 = slot_0_89_0.screen_size_cached()

		if not var_1748_0 or not var_1748_0.x or var_1748_0.x < 8 then
			return
		end

		local var_1748_1 = 0

		pcall(function()
			var_1748_1 = ui.get_alpha() or 0
		end)

		local var_1748_2 = var_1748_1 > 0.01
		local var_1748_3 = slot_0_89_0.hud_fade("hud_menu", var_1748_2)
		local var_1748_4 = var_1677_58()
		local var_1748_5

		if var_1748_3 > 0.001 and #var_1748_4 == 0 then
			var_1748_5 = var_1677_64()
		else
			var_1748_5 = var_1677_63(var_1748_4)
		end

		local var_1748_6 = slot_0_89_0.hud_fade("keybinds", #var_1748_4 > 0 or #var_1748_5 > 0 or var_1748_2)

		if var_1748_6 <= 0.001 and var_1748_3 <= 0.001 then
			var_1677_77(false)
			var_1677_61()

			var_1677_23.rows = nil

			return
		end

		local var_1748_7, var_1748_8 = var_1677_71(var_1748_5)

		var_1677_23.w, var_1677_23.h = var_1748_7, var_1748_8
		var_1677_22.size.x = var_1748_7
		var_1677_22.size.y = var_1748_8

		local var_1748_9 = var_1677_73(var_1748_0)

		var_1677_22.size_x_prev = var_1677_22.size.x

		if not var_1677_21.active then
			slot_0_89_0.slot_apply_rest(var_1748_9, var_1748_7, var_1748_8, var_1748_0, var_1677_6, 24, var_1748_0.y - var_1748_8 - 24)
		end

		var_1677_22.pos.x = var_1748_9.x
		var_1677_22.pos.y = var_1748_9.y

		local var_1748_10 = var_1677_22.pos.x
		local var_1748_11 = var_1748_6

		if #var_1748_5 == 0 then
			var_1677_78(var_1748_1, var_1748_0, var_1748_9, var_1748_7, var_1748_8)

			if var_1748_1 > 0.01 then
				slot_0_89_0.overlay_drag_paint_hover({
					drag = var_1677_21,
					get_rect = function()
						return var_1677_22.pos.x, var_1677_22.pos.y, var_1748_7, var_1748_8
					end
				}, var_1748_1, var_1748_0)
			end

			return
		end

		local var_1748_12 = var_1677_22.pos.y

		var_1677_66(vector(var_1748_10, var_1748_12), vector(var_1748_10 + var_1748_7, var_1748_12 + var_1677_3), var_1748_11)
		var_1677_67(var_1748_10, var_1748_12, var_1748_7, var_1748_11)

		local var_1748_13 = var_1748_12 + var_1677_4

		for iter_1748_0 = 1, #var_1748_5 do
			local var_1748_14 = var_1748_5[iter_1748_0]
			local var_1748_15 = var_1748_14.mix or 1

			var_1677_69(var_1748_10, var_1748_13, var_1748_7, var_1748_14, var_1748_11, var_1748_15)

			var_1748_13 = var_1748_13 + var_1677_1 * var_1748_15
		end

		var_1677_78(var_1748_1, var_1748_0, var_1748_9, var_1748_7, var_1748_8)

		if var_1748_1 > 0.01 then
			local var_1748_16 = var_1677_4 + var_1677_6

			for iter_1748_1 = 1, #var_1748_5 do
				var_1748_16 = var_1748_16 + var_1677_1 * (var_1748_5[iter_1748_1].mix or 1)
			end

			slot_0_89_0.overlay_drag_paint_hover({
				drag = var_1677_21,
				get_rect = function()
					return var_1677_22.pos.x, var_1677_22.pos.y, var_1748_7, var_1748_16
				end
			}, var_1748_1, var_1748_0)
		end
	end
end)()
slot_0_78_0.hud_gs_inds_tick = (function()
	local var_1752_0 = 44
	local var_1752_1 = 3.125
	local var_1752_2 = color(255, 200)
	local var_1752_3 = color(200, 255)
	local var_1752_4 = color(210, 216, 112, 255)
	local var_1752_5 = color(255, 0, 0, 255)
	local var_1752_6 = {
		site = "",
		fill = 0,
		started = 0,
		active = false
	}
	local var_1752_7
	local var_1752_8 = render.load_image("\x89PNG\r\n\x1A\n\x00\x00\x00\rIHDR\x00\x00\x00d\x00\x00\x00\\\b\x03\x00\x00\x00\xAF\x15\xE0\xA6\x00\x00\x00\x01sRGB\x01\xD9\xC9,\x7F\x00\x00\x00\tpHYs\x00\x00\v\x13\x00\x00\v\x13\x01\x00\x9A\x9C\x18\x00\x00\x02\xDFPLTE\x00\x00\x00\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFFv\x99it\x00\x00\x00\xF5tRNS\x00\x01C\x93X\x06Z\xFB\xFF\xFD\x96\x04\xD5\xF9\x02\x0E\xE3\x18\x16\xEA+\x1B\xEF6)sr\x1E\xF2?uk \xEB\xF42!\xF6G/\xE7\xE27^\xB7\x0F#\xF8Q\b\xB3\x9A}\xF7c\x00pz\xC1%n-\xE0b\xFC\xC2(v\xAE\x88\v\xC9]~\xFA\xE9'\\\xDF\x121\x84،ϗ:\x8A\x03\xAC\xDA\x1Cl.B\x8F{\xA1K\x95\x10\xCA\x13U=\x1A3\nNi\x82\xBBAǀ\x87\x91\x9E\xA6\xAA\x86\x7F_&\xDC\xFEI\xE8\x17\xC3F\x89\x92\xBA,\xC0\xB8\xA3\x9F\xA8\xAF\xB1\xB5\xBC\xD4|\xF3\x9D$\r\x8E[\x05\xD9љ\xF1\xCC˛O\x14\xCE\xC5\xCD\x190\xF5\a\xDE\x15\xA4\x1D\x11\xE5\x83*\xA0q\xD6\xD0ƹ\xA9mR5\xDD\f\xE4d\xED\xBFčw\x85\x8B\x90\xEE\xE6\xA5x\xEC\t`\x1F\x81\xAB\x9C\x988aJ\xB24Lۧ\xD2E9S\xB0\xF0\xBD\x94M\xB4DT>\xA2\"Yj\xE1׭@H;\xBEet4r\x01\xD4\x00\x00\anIDATx\x9C\xED\x9A\xF9[\xD4F\x18ǳ\"2+\x8B\x8AX\xD0B\xE5\x10T(B\x11p\x11\x11\x10\x95\"(V,\x88\x14\x05\xE4\xB4\x1C\xC5 `E\xBCQ\x01\xA1\x88\x88\xA2\xA2xq\x15\x15\v\x88x\v\x15T\x14\xCF\nx\xB6\xB5\xD5Z\xDB\xDA\xEB\x0Fhf&\xBB\x9B\x84\xDD%\x86\xA5\xCF\xD3>\xBE\xBFd\xE7\x9B\xF7}?9f\x92w&K\x10\x02L4@k\xA0\xB6\x90\xC07\xB1A:@<\xB8\x9F\x19\xBA\x12\x00\x80ސ\xFE\x85\f\x1DFA\x80~\xFFB\x86\x1B@Ȉ\xFE\x85\xBCc\b!F\x9AK8rԻ=\x0E\xD9\xD8\x04B\xDE㨢\x91\xA3M\xCD\x041\xF4\xCD\x01\xB0\x18\xC3\x11-\xAD d,G\x1D7\x1E\x00k\x1B!\x90\xF7a:\xDB\tl\xD1\xCE\x1E\xAA\x1F\xB0E\x87\x89Pt\x14\x02\xB1\x13\xC3P'\x8E\xE8\f\xC5I,M\xEA\xA2\x03\xC5\xC9B \x84+\f\x15\xB3o\xCB\x14=(\xBA\xB1\xB4\xA9\xE3\xA1\xE6n&\b\xE2\xE1\t\x83\xA7905/\xA4MgJ\xBA3\xA0\x04f\nb\x10\xDE\x1F\xA2h\x1F\xA66\x02I\xB3\x18\x8A\xD4\xC3\x17J~\xB3\x85A\x889(\xA3\xFF\\\x86\xF4\x11\x92\xE61\x14\xCB\x00$\xCD\x17\xFC\xA8\xF9\x18\xC5\a2⃐\xB2@!\x04/DJ\xC8'B\x19D(\xBA\x03\x16\x8B\x14\xCAb\x942L!\x8CE\x02\b\x17̐ݕ\b\x85\xB2\x04\t\x91\xF2v\x14\xF6\x88\x8E\x11\x0E!\xC6\xC4B\x8BS\bK\x91\xF0\xA9\xBC\x1D\x9F\x90\xE8\x96\xE4\xF8Yr\x1F\x18o\xED\x7FcR\xE3P\xDBe\x83D\xB2f\x82\xA9\x9B\x13I\x92)\xCB#\xB1\x05\xA6\xA6\xA5\xF3\xB4\x88@\x18\xA0\xB5\xE2s\x97\x95\x19l\x86\xFEtw\xAAW\xDB{\xE1\x96\x03i\x0F4a\xAB\x18}|Ȕ\xF9\xAB2\x91\xBA\x1A\vnb\x8D0\xA8'\xB5\xB7\x8Ca\xB6`\r\xAD\x19\xAC\xC5\xCA:\r1\x80\xF3z\x9C\xD0{\x83\xBFL\xB2ZBc\xFD\xD5\x05\xBE\x91\x85\xA2|\x1B\xCD\xE5B\xD6&ٹ\x19\xF0\xCB\x10\xB0yKv\x8E\xC2\"\xB2\xD3r\xD3\x17n͛\x98\xBF%\xEB\x8B\x02\xEC\xB2\r\xE5\x93Gx\x92Q\xF2\x9BT\xC8\aa\xA1\xF6m\x14\x8B\x9DR\x98\x10\xCF\xEDE\f\x0F^}\xCBz\a\x0FH1\x03\xE2\xB7s\x17ӃW\xE7*٥4;\x1B\xA2%\x87\x18jq\ne>\f \x11)\xC9ͅ\x04\xA2\x06\xF5\x8A\xCB2\xD2\xE5x\xF0\x82\xECVǐA\xF6\xA0\xC6\xDE\xD2\xD5\\\x04O\xC8>>\x90\xFD\xA8Qv@\x89\a/\xC8A>\x90\xED\xAA=xA\x0E\xF1\x81\xA4\xF6\x11\x12\r=c\xE2\x0E\x1F\x11\x89\xCA+f\x0E%*\xC3K\x8D\xE35\r)\x80\x9E\xB9\x85:U\xD5\xC3\xFD\x80\xD5rbR\xA6x\x8DbBACr\xFA\b\x91H)\xCF/\x010\xA99z\f\x96uǩ\x9F\xB5\\ȉ\xBEB\xE08\xB1\xFC*+\xD6Adc\x10\xB8\x96\x98\xBD\xA0\xC4g\x82\xA6!uj\x8B\\\rA\x02\x82\xFF\x05H\x88\xDAE\x0E\x1A\x82\v\xD9\xF1êJ\n\xEA\xF75\xB8\x9E\x9C\x91޸gީ\xA6\xD3KE\xFC g\x1Cx@\xB2U\x1C\xB4\xA1\x1B?\x88\xFBY\x1E\x904UWf\x95J\x889\xAAy\xF6\xE2ƹ(\x1E\x90tU\x10\x13U\x90\xCC\xF3(D\x82[\x17\xD4.\xA4\xF4\x06\x89V\x05\xB98\x81\t\x11_\xCAkn\x19Ͱ\x96\xC9\xDBf\x91I_\xA7l\xB8\xDCܺі\x03\x11[\xB4]q/\x91H\x0E\xBB\xE6_m\xBDf\xDA\x14\xA3\x02\xD2nD\\/R@xY#\x82\x1C\xF5V\xD2ݕ\a\xB4JE\xE17\x04A\x94\x9A\xCC\xC5j󬸎ʨQ\xA8QeF\x94_\x18ˀ\x18\xEE'o\xE6\x9APݬ\x99$\xB3\x9D\xA9n\xB15)\xE9\x96\x0E5J\xC3H\xF2\xB6/_H\xBD\x11~\x8D\xD7\xC0\x86\xAF\x87\x94\xB8\x03\xEE2 \xF7\xE0>\x12\x802\xB8\r\x03zA\xD4F\xBA\x05\xB4u\xC0\xF6I\xEC\x93\xDB\x1B\xA4t(nI\xBF\x81\xAD\xFB\xC1Dg;XĀ\xA0ŭ.\x00:\xF1\xD6\x1Fս\x81\xA0\x1B=\t\"\xB1σ^ z\xB0\xA0\xDCq\xF9\xA1D\xD2N\xB5*:\b\xDD\x13xiN\x06\x81gE<\x02\x00M>\x1F\xD3\xD5\xCBm\xB0\xAA\x12n\xB5\xF8A\xF2\xA8\x1F\xDA\xF7鄙\xCDT\x1Eg6\xE4\x11tm\x02\xE0\t\xDC.\xA1\xEB\xB0[tї\x8D}\xD2z\x81\xC0K~O\xD6\x05\xFCk\b\"\x15\xB0!\xA7j)s\x02 \xDCL\xBF\xBA\xA6\x11T\x94\r\xAF^Zt\b\x98\aA\x9D\x9E\x18\\\xED\x05r\x9A\xBA\x1B\r2\xC8dj\x86\xE1*\x91H쨽y\x12\x13\x15\x1D\xB6\xA7\xE1\a\xE4\x01eo\x05\xB4\x7F\x1C5;\xAA\xA3}\xCD\xD9ϩ\xC1\xBC!\xF8Q߰\xDCX\x05\x04\xCE_\x02iߧ\xEC\xFD7\x91\xA8S%\t\xF8\x96\xDAzvKJ,\xA0` \xA9k\xA36\xCE%\x92\xEE\n:\x10\xD7]V\xA0ݭGy\x8E\xF6\xC3\x05\xB2\x8Cv\xEC\xDB\x10K\x1B\xEC\xD5F\xB1\xDF!\xB19FZi3\r\x00ǳ\xC4\xF5\xE4n\x00\xBE\xAF\x15\xE9\x06\xED\x05\xBE\xE7\xE3\x89\x1D\xCF\xDAp ^\x7F\x84\x87\xF0\xC3]e\x90h\xD8%\xCB\x1FZ\xB1N\x1F\xDE\xF8\x83\xF4o8\xF8\x88\xD5\x00\xA0:(\x14\xF8\xA1Zt\x06\xB0F\xC3+\x15\xFB\xE0\x15\x1D<\xA9\n\xEB\xE8\t\x11\xFF\b\x7F\xCE\x1D\xF0<6\x96\x05\x91\xCAz\xD7c\xB8?\x19\x80\xA9p\xFB\x02\x04\xA0\x9Az?=N\xE8ۆצ\x86\xE1FHS0\x17\x02\xCEX\xD2M\x11\xFBLd\x90\xC5p_\x17=^d\x831\x82\x1E\xF9?a\x9F\x15(A\xB7,<\xFD\xA5\x94\x03\x01u\x03\xF1\x1B\xD6L9\xA4\v\xEE\xF3\x01\xE0g\xB8}\x05\xAE\xA0\xD5\xC2<p\f\xF5Dz\x14\x87\xA3\x04\x97\xE5\xF3ê\x04.\x04\x00\xFB\x89\xC5$\x19\xF6\vPj\x05\x17)+\x01\xE0׭\xD99\xE9ԭ\v\x89\xC8y\x90o\b|/A\xDD\x10\xFB\xBC\xC2\t-\x9Fʺ\x1B(\x9E˅\xF4\xD5<\x9F\xD0\x19w%\x94f\xD2Z>=\r\xB4\xD6\x14d\x8D\x97\xFC\xEAT'\xD6\xD1SQzy\xEFt\xB7\xFAX\xDE\xD6\xC8,e\x8F\\\xC3\a/\xFB@0սO\xB9\xC5\x15\x15\x15\x85\x06~U\xBFٱF\x06aֲϰ0W>k\x1E\x11\xDB\x17kJ~\xFD\xFAŦ\x91Jf\x8Aڝq\xF1=շ\xF6_1o\x17\x92$\x9D|\x18\x8B\xFD/Ih\xBF+\x84?\xA0\v9]mU\xAE\xDE\x12\xD1w$\xF13\x85\xF2\x02\xF5\xDD\xF9\n\xE19\xEEͦ\xC2!\xA5(\xC1no\x85b\x83\x94\x14\x85\xA0\xBD\f)\xD1jg1\xEAl\x10\x8A\xF7e~\xBA,GR\x12C\xE9D\xAF*O7n0O\xBB\x8E\x0Fґ\xB9\x16\xD5\xF3sӐ\xE3H\xAAW\xB6x\xC3\xC3n\xA0;r\xC1\x92\xA9y\xA1\xA7_\vS\x8A\xA9G\x14\x0Fa\x90?Q\xF0$)S\xCB@e\xBC\v\xCB\xEF9\x02\xAF\x13\xF4W\x80\xB5\xE8Dl\xD9k\x05Eh\xDD2\x91\xA5iG@;K\bd%\f=W\xCB\x16\xF1\xB7_Υ\xE9@\xAF\x8C@!\x902\x189\x87#v\xA0\xF2n'G\xFD\x8B\xBA`:\xA1B \xBA\x91V\x86N܅\x95\x1A4\xF1\xE6|`&\x1C\xFE\x0E(\xBD\xA7\xB9\xBFg\x1CA%\xE3z\x8D\xE5Sj\xD5~\x10\xA2\xC1\x7F\x16(3\xFCG\f\xCB\xDE\x1D\xFBb\xBAp\x96\xE1\xABv\xD1[\x03VLA\xA6\xF53\x83\x88iM\xBF\x93ѻ\x9B\xDC\xFE\x01Q\x900+D^\xBAl\x00\x00\x00\x00IEND\xAEB`\x82", vector(30, 25))

	local function var_1752_9()
		if var_1752_7 then
			return var_1752_7
		end

		local var_1753_0, var_1753_1 = pcall(render.load_font, "Calibri Bold", vector(25, 23.5, 0), "da")

		var_1752_7 = var_1753_0 and var_1753_1 or 1

		return var_1752_7
	end

	local function var_1752_10()
		return var_1752_8
	end

	local function var_1752_11()
		if not slot_0_65_0() then
			return false
		end

		if not slot_0_152_0.vars or not slot_0_152_0.vars.ov_panel or not slot_0_152_0.vars.ov_gs_inds then
			return false
		end

		if slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_panel, true) ~= true then
			return false
		end

		return slot_0_89_0.ov_sw(slot_0_152_0.vars.ov_gs_inds, false) == true
	end

	local function var_1752_12(arg_1756_0)
		local var_1756_0 = slot_0_152_0.vars.ov_gs_inds

		if not var_1756_0 or not var_1756_0.binds then
			return true
		end

		return bind_listed_check(var_1756_0.binds, arg_1756_0, _G.GS_BIND_DEFS)
	end

	local function var_1752_13(arg_1757_0)
		if not arg_1757_0 or type(arg_1757_0.get) ~= "function" then
			return false
		end

		local var_1757_0, var_1757_1 = pcall(function()
			return arg_1757_0:get()
		end)

		return var_1757_0 and var_1757_1 == true
	end

	local function var_1752_14(arg_1759_0, arg_1759_1)
		if not arg_1759_0 or type(arg_1759_0.get) ~= "function" then
			return false
		end

		local var_1759_0, var_1759_1 = pcall(function()
			return arg_1759_0:get()
		end)

		return var_1759_0 and tostring(var_1759_1 or "") == arg_1759_1
	end

	local function var_1752_15(arg_1761_0)
		local var_1761_0, var_1761_1 = pcall(ui.get_binds)

		if not var_1761_0 or type(var_1761_1) ~= "table" then
			return false
		end

		for iter_1761_0 = 1, #var_1761_1 do
			local var_1761_2 = var_1761_1[iter_1761_0]

			if var_1761_2 and var_1761_2.active and tostring(var_1761_2.name or "") == arg_1761_0 then
				return true
			end
		end

		return false
	end

	local function var_1752_16()
		local var_1762_0 = 0
		local var_1762_1 = slot_0_152_0.vars and slot_0_152_0.vars.ping_spike_unlock

		if var_1762_1 and type(var_1762_1.get) == "function" then
			local var_1762_2, var_1762_3 = pcall(function()
				return var_1762_1:get() == true
			end)

			if var_1762_2 and var_1762_3 and var_1762_1.ovr and type(var_1762_1.ovr.get) == "function" then
				local var_1762_4, var_1762_5 = pcall(function()
					return var_1762_1.ovr:get()
				end)

				if var_1762_4 and type(var_1762_5) == "number" then
					var_1762_0 = math.max(0, var_1762_5)
				end
			end
		end

		return var_1762_0
	end

	local function var_1752_17(arg_1765_0, arg_1765_1, arg_1765_2)
		return (arg_1765_1 - arg_1765_0) * arg_1765_2 + arg_1765_0
	end

	local function var_1752_18(arg_1766_0)
		if not arg_1766_0 then
			return 0
		end

		local var_1766_0, var_1766_1 = pcall(function()
			return arg_1766_0:is_alive()
		end)

		if not var_1766_0 or not var_1766_1 then
			return 0
		end

		local var_1766_2, var_1766_3 = pcall(utils.net_channel)

		if not var_1766_2 or not var_1766_3 or not var_1766_3.sequence_nr then
			return 0
		end

		local var_1766_4 = tonumber(var_1766_3.sequence_nr[0]) or 0
		local var_1766_5 = ((tonumber(var_1766_3.sequence_nr[1]) or 0) + var_1766_4) / math.min(math.max(0.1, 0.001), 0.2)

		if var_1766_5 < 0 then
			return 0
		elseif var_1766_5 > 1 then
			return 1
		end

		return var_1766_5
	end

	local function var_1752_19(arg_1768_0)
		local var_1768_0, var_1768_1, var_1768_2 = color(255, 255, 255, 255):to_hsv()
		local var_1768_3, var_1768_4, var_1768_5 = color(151, 175, 54, 255):to_hsv()
		local var_1768_6 = var_1752_18(arg_1768_0)
		local var_1768_7 = color()

		pcall(function()
			var_1768_7:as_hsv(var_1752_17(var_1768_0, var_1768_3, var_1768_6), var_1752_17(var_1768_1, var_1768_4, var_1768_6), var_1752_17(var_1768_2, var_1768_5, var_1768_6), 255)
		end)

		return var_1768_7
	end

	local function var_1752_20()
		local var_1770_0, var_1770_1 = pcall(function()
			return rage.exploit:get()
		end)

		if var_1770_0 and tonumber(var_1770_1) == 1 then
			return color(255, 200)
		end

		return color(255, 0, 53, 255)
	end

	local function var_1752_21()
		if var_1752_13(refs.freestanding) then
			return true
		end

		local var_1772_0 = slot_0_152_0.antiaim and slot_0_152_0.antiaim.freestand

		if var_1772_0 and type(var_1772_0.get) == "function" then
			local var_1772_1, var_1772_2 = pcall(function()
				return var_1772_0:get() == true
			end)

			return var_1772_1 and var_1772_2 == true
		end

		return false
	end

	local function var_1752_22(arg_1774_0, arg_1774_1, arg_1774_2, arg_1774_3, arg_1774_4, arg_1774_5)
		if not arg_1774_0 or arg_1774_0 == "" then
			return
		end

		pcall(function()
			slot_1775_0_0 = var_1752_9()
			slot_1775_1_0 = slot_0_89_0.screen_size_cached()
			slot_1775_2_0 = slot_1775_1_0.x / 100 + 2
			slot_1775_3_0 = slot_1775_1_0.y / 1.47
			slot_1775_4_0 = render.measure_text(slot_1775_0_0, "bad", arg_1774_0)
			arg_1774_1 = arg_1774_1 + 1
			slot_1775_5_0 = slot_1775_3_0 + arg_1774_1

			if arg_1774_5 then
				render.gradient(vector(slot_1775_2_0 - 17, slot_1775_5_0), vector(slot_1775_2_0 + (slot_1775_4_0.x + arg_1774_5.width + 8) / 2, slot_1775_5_0 + slot_1775_4_0.y + 8), color(0, 0, 0, 0), color(0, 0, 0, 55), color(0, 0, 0, 0), color(0, 0, 0, 55))
				render.gradient(vector(slot_1775_2_0 + (slot_1775_4_0.x + arg_1774_5.width + 6) / 2, slot_1775_5_0), vector(slot_1775_2_0 + slot_1775_4_0.x + arg_1774_5.width + 17 + 8, slot_1775_5_0 + slot_1775_4_0.y + 8), color(0, 0, 0, 55), color(0, 0, 0, 0), color(0, 0, 0, 55), color(0, 0, 0, 0))
				render.texture(arg_1774_5, vector(slot_1775_2_0 + 1, slot_1775_5_0 + 3), color(0, 0, 0, 200))
				render.texture(arg_1774_5, vector(slot_1775_2_0, slot_1775_5_0 + 2), arg_1774_2)
				render.text(slot_1775_0_0, vector(slot_1775_2_0 + arg_1774_5.width + 8, slot_1775_3_0 + 5 + arg_1774_1), arg_1774_2, "bad", arg_1774_0)
			else
				render.gradient(vector(slot_1775_2_0 - 17, slot_1775_5_0), vector(slot_1775_2_0 + slot_1775_4_0.x / 2, slot_1775_5_0 + slot_1775_4_0.y + 8), color(0, 0, 0, 0), color(0, 0, 0, 55), color(0, 0, 0, 0), color(0, 0, 0, 55))
				render.gradient(vector(slot_1775_2_0 + slot_1775_4_0.x / 2, slot_1775_5_0), vector(slot_1775_2_0 + slot_1775_4_0.x + 17, slot_1775_5_0 + slot_1775_4_0.y + 8), color(0, 0, 0, 55), color(0, 0, 0, 0), color(0, 0, 0, 55), color(0, 0, 0, 0))
				render.text(slot_1775_0_0, vector(slot_1775_2_0, slot_1775_3_0 + 5 + arg_1774_1), arg_1774_2, "bad", arg_1774_0)
			end

			if arg_1774_3 and arg_1774_4 then
				if arg_1774_5 then
					slot_1775_6_1 = slot_1775_5_0 + slot_1775_4_0.y * 0.6
					slot_1775_7_1 = slot_1775_2_0 + slot_1775_4_0.x + arg_1774_5.width + 18

					render.circle_outline(vector(slot_1775_7_1, slot_1775_6_1), color(0, 0, 0, 255), 9.5, 90, 1, 4)
					render.circle_outline(vector(slot_1775_7_1, slot_1775_6_1), arg_1774_3, 9, 90, arg_1774_4, 3)
				else
					slot_1775_6_0 = slot_1775_5_0 + slot_1775_4_0.y / 2 + 2
					slot_1775_7_0 = slot_1775_2_0 + slot_1775_4_0.x + 18

					render.circle_outline(vector(slot_1775_7_0, slot_1775_6_0), color(0, 0, 0, 255), 10.5, 90, 1, 4)
					render.circle_outline(vector(slot_1775_7_0, slot_1775_6_0), arg_1774_3, 10, 90, arg_1774_4, 3)
				end
			end
		end)
	end

	local function var_1752_23(arg_1776_0)
		if not arg_1776_0 then
			return false
		end

		local var_1776_0, var_1776_1 = pcall(function()
			if arg_1776_0.m_bBombTicking ~= true then
				return false
			end

			if arg_1776_0.m_bBombDefused == true then
				return false
			end

			return (tonumber(arg_1776_0.m_flC4Blow) or 0) - globals.curtime > 0
		end)

		return var_1776_0 and var_1776_1 == true
	end

	local function var_1752_24(arg_1778_0, arg_1778_1)
		if not arg_1778_0 or not arg_1778_1 or not var_1752_23(arg_1778_0) then
			return 0, false, 0
		end

		local var_1778_0, var_1778_1, var_1778_2, var_1778_3 = pcall(function()
			if (tonumber(arg_1778_0.m_flC4Blow) or 0) <= globals.curtime then
				return 0, false, 0
			end

			local var_1779_0 = arg_1778_0:get_origin()
			local var_1779_1 = arg_1778_1:get_origin()

			if not var_1779_0 or not var_1779_1 then
				return 0, false, 0
			end

			local var_1779_2 = var_1779_0:dist(var_1779_1)
			local var_1779_3 = 450.7 * math.exp(-((var_1779_2 - 75.68) / 789.2)^2)
			local var_1779_4 = tonumber(arg_1778_1.m_ArmorValue) or 0

			if var_1779_4 > 0 then
				local var_1779_5 = var_1779_3 * 0.5
				local var_1779_6 = (var_1779_3 - var_1779_5) * 0.5

				if var_1779_4 < var_1779_6 then
					local var_1779_7 = var_1779_4 * 2

					var_1779_5 = var_1779_3 - var_1779_6
				end

				var_1779_3 = var_1779_5
			end

			local var_1779_8 = tonumber(arg_1778_1.m_iHealth) or 0
			local var_1779_9 = math.ceil(var_1779_3)

			return var_1779_9, var_1779_8 <= var_1779_9, var_1779_3
		end)

		if var_1778_0 then
			return tonumber(var_1778_1) or 0, var_1778_2 == true, tonumber(var_1778_3) or 0
		end

		return 0, false, 0
	end

	local function var_1752_25(arg_1780_0, arg_1780_1)
		if not arg_1780_1 then
			return
		end

		pcall(function()
			local var_1781_0 = arg_1780_1.m_hBombDefuser

			if var_1781_0 == nil or var_1781_0 == 4294967295 then
				return
			end

			local var_1781_1 = tonumber(arg_1780_1.m_flDefuseLength) or 0

			if var_1781_1 <= 0 then
				return
			end

			local var_1781_2 = (tonumber(arg_1780_1.m_flDefuseCountDown) or 0) - globals.curtime

			if var_1781_2 <= 0 then
				return
			end

			local var_1781_3 = var_1781_2 < (tonumber(arg_1780_1.m_flC4Blow) or 0) - globals.curtime and color(58, 191, 54, 160) or color(252, 18, 19, 125)
			local var_1781_4 = (arg_1780_0.y - 50) / var_1781_1 * var_1781_2

			render.rect(vector(0, 0), vector(16, arg_1780_0.y), color(25, 25, 25, 160))
			render.rect_outline(vector(0, 0), vector(16, arg_1780_0.y), color(25, 25, 25, 160))
			render.rect(vector(0, arg_1780_0.y - var_1781_4), vector(16, arg_1780_0.y), var_1781_3)
		end)
	end

	local function var_1752_26()
		var_1752_6.active = false
		var_1752_6.site = ""
		var_1752_6.fill = 0
		var_1752_6.started = 0
	end

	pcall(function()
		events.bomb_beginplant:set(function(arg_1784_0)
			pcall(function()
				local var_1785_0 = entity.get_player_resource()
				local var_1785_1 = arg_1784_0 and entity.get(arg_1784_0.userid, true)

				if not var_1785_0 or not var_1785_1 then
					return
				end

				var_1752_6.started = globals.curtime
				var_1752_6.active = true
				var_1752_6.fill = 0

				local var_1785_2 = var_1785_0.m_bombsiteCenterA
				local var_1785_3 = var_1785_0.m_bombsiteCenterB
				local var_1785_4 = var_1785_1:get_origin()

				if var_1785_2 and var_1785_3 and var_1785_4 then
					var_1752_6.site = var_1785_4:dist(var_1785_2) < var_1785_4:dist(var_1785_3) and "A" or "B"
				else
					var_1752_6.site = "?"
				end
			end)
		end)
	end)
	pcall(function()
		events.bomb_abortplant:set(var_1752_26)
		events.bomb_planted:set(var_1752_26)
		events.bomb_defused:set(var_1752_26)
		events.bomb_exploded:set(var_1752_26)
		events.round_prestart:set(var_1752_26)
		events.round_start:set(var_1752_26)
	end)

	return function()
		if not var_1752_11() then
			return
		end

		slot_1787_0_0 = entity.get_local_player()

		if not slot_1787_0_0 then
			return
		end

		slot_1787_1_0, slot_1787_2_0 = pcall(function()
			return slot_1787_0_0:is_alive()
		end)

		if not slot_1787_1_0 or slot_1787_2_0 ~= true then
			return
		end

		var_1752_9()

		slot_1787_3_0 = var_1752_10()
		slot_1787_4_0 = slot_0_89_0.screen_size_cached()
		slot_1787_5_0 = 0
		slot_1787_6_0 = var_1752_16()
		slot_1787_7_0 = false

		pcall(function()
			if refs.fakeping and type(refs.fakeping.get) == "function" then
				slot_1787_7_0 = (tonumber(refs.fakeping:get()) or 0) > 0
			end
		end)

		slot_1787_8_0 = nil

		pcall(function()
			local var_1790_0 = entity.get_entities("CPlantedC4", true)

			if type(var_1790_0) == "table" and var_1790_0[1] then
				slot_1787_8_0 = var_1790_0[1]
			end
		end)

		slot_1787_9_0 = ""
		slot_1787_10_0 = 0
		slot_1787_11_0 = false
		slot_1787_12_0 = false
		slot_1787_13_0 = 0
		slot_1787_14_0 = 0

		if slot_1787_8_0 and var_1752_23(slot_1787_8_0) then
			slot_1787_11_0 = true

			pcall(function()
				slot_1787_10_0 = (tonumber(slot_1787_8_0.m_flC4Blow) or 0) - globals.curtime
				slot_1787_9_0 = (tonumber(slot_1787_8_0.m_nBombSite) or 0) == 0 and "A" or "B"
			end)

			if slot_1787_10_0 > 0 then
				var_1752_25(slot_1787_4_0, slot_1787_8_0)

				slot_1787_13_0, slot_1787_12_0, slot_1787_14_0 = var_1752_24(slot_1787_8_0, slot_1787_0_0)
			else
				slot_1787_11_0 = false
			end
		end

		if var_1752_6.active then
			var_1752_6.fill = var_1752_1 - (var_1752_1 + var_1752_6.started - globals.curtime)

			if var_1752_6.fill > var_1752_1 then
				var_1752_6.fill = var_1752_1
			end

			if var_1752_6.fill >= var_1752_1 or globals.curtime - var_1752_6.started > var_1752_1 + 0.35 then
				var_1752_26()
			end
		end

		function slot_1787_15_0(arg_1792_0, arg_1792_1, arg_1792_2, arg_1792_3, arg_1792_4)
			var_1752_22(arg_1792_0, slot_1787_5_0, arg_1792_1, arg_1792_2, arg_1792_3, arg_1792_4)

			slot_1787_5_0 = slot_1787_5_0 - var_1752_0
		end

		if var_1752_12("PING") and (slot_1787_7_0 or slot_1787_6_0 > 0) then
			slot_1787_15_0("PING", var_1752_19(slot_1787_0_0), nil, nil, nil)
		end

		if var_1752_12("Double Tap") and var_1752_13(refs.dt) and not var_1752_13(refs.hs) then
			slot_1787_15_0("DT", var_1752_20(), nil, nil, nil)
		end

		if var_1752_12("Hide Shots") and var_1752_13(refs.hs) then
			slot_1787_15_0("OSAA", var_1752_3, nil, nil, nil)
		end

		if var_1752_12("AI Peek") and slot_0_78_0.ai_peek_bind_on and slot_0_78_0.ai_peek_bind_on() then
			slot_1787_15_0("AI", var_1752_2, nil, nil, nil)
		end

		if var_1752_12("Dormant Aimbot") and var_1752_13(refs.dormant) then
			slot_1787_15_0("DA", var_1752_2, nil, nil, nil)
		end

		if var_1752_12("Fake Duck") and var_1752_13(refs.fd) then
			slot_1787_15_0("DUCK", var_1752_2, nil, nil, nil)
		end

		if var_1752_12("Body Aim") and var_1752_14(refs.body_aim, "Force") then
			slot_1787_15_0("BODY", var_1752_2, nil, nil, nil)
		end

		if var_1752_12("Safe Points") and var_1752_14(refs.safe_points, "Force") then
			slot_1787_15_0("SAFE", var_1752_2, nil, nil, nil)
		end

		if var_1752_12("Bomb Info") and slot_1787_11_0 and slot_1787_10_0 > 0 then
			slot_1787_15_0(slot_1787_9_0 .. " - " .. string.format("%.1f", slot_1787_10_0) .. "s", var_1752_2, nil, nil, slot_1787_3_0)
		end

		if var_1752_12("Bomb Info") and slot_1787_11_0 and slot_1787_12_0 then
			slot_1787_15_0("FATAL", var_1752_5, nil, nil, nil)
		end

		if var_1752_12("Bomb Info") and slot_1787_11_0 and not slot_1787_12_0 and slot_1787_14_0 > 0.5 then
			slot_1787_15_0("-" .. tostring(slot_1787_13_0) .. " HP", var_1752_4, nil, nil, nil)
		end

		if var_1752_12("Bomb Info") and var_1752_6.active then
			slot_1787_15_0(var_1752_6.site .. " ", var_1752_4, color(255, 255), var_1752_6.fill / 3.3, slot_1787_3_0)
		end

		if var_1752_12("Freestanding") and var_1752_21() then
			slot_1787_15_0("FS", var_1752_2, nil, nil, nil)
		end

		if var_1752_12("Hitchance") and var_1752_15("Hit Chance") then
			slot_1787_15_0("H1TCHANCE", color(255, 255), nil, nil, nil)
		end

		if var_1752_12("Damage") and var_1752_15("Min. Damage") then
			slot_1787_15_0("MD", var_1752_2, nil, nil, nil)
		end
	end
end)()

function slot_0_89_0.scene_tick()
	slot_0_89_0.hud_dpi_hook_install()
	slot_0_89_0.hud_dpi_paint_begin()

	slot_0_78_0.ov_drag_active = false
	slot_0_78_0.ov_drag_capture = false
	slot_0_78_0.ov_drag_snap_pos = nil
	slot_0_78_0.ov_drag_snap_sz = nil
	slot_0_78_0.ov_drag_hint_box = nil
	slot_0_78_0.ui_kill_flash = slot_0_89_0.wm_kill_flash_mix()

	local var_1793_0 = slot_0_89_0.screen_size_cached()

	slot_0_89_0.paint_bottom_watermark(var_1793_0, slot_0_78_0.ui_kill_flash)

	local var_1793_1 = 0

	pcall(function()
		var_1793_1 = ui.get_alpha() or 0
	end)

	local var_1793_2 = slot_0_89_0.ov_sw(slot_0_152_0.vars and slot_0_152_0.vars.ov_panel, false)

	if var_1793_2 and slot_0_78_0.hud_wm_tick then
		pcall(slot_0_78_0.hud_wm_tick)
	end

	local var_1793_3 = slot_0_78_0.render_lanes or {}

	if var_1793_3.elog and slot_0_78_0.hud_elog_tick then
		pcall(slot_0_78_0.hud_elog_tick)
	end

	if var_1793_2 then
		if slot_0_78_0.hud_slowdown_tick then
			pcall(slot_0_78_0.hud_slowdown_tick)
		end

		if slot_0_78_0.hud_keybinds_tick then
			pcall(slot_0_78_0.hud_keybinds_tick)
		end
	end

	if slot_0_78_0.hud_damage_ind_tick then
		pcall(slot_0_78_0.hud_damage_ind_tick)
	end

	if var_1793_2 then
		if slot_0_78_0.hud_metrics_tick then
			pcall(slot_0_78_0.hud_metrics_tick)
		end

		if slot_0_78_0.hud_spectators_tick then
			pcall(slot_0_78_0.hud_spectators_tick)
		end
	end

	if var_1793_3.chi_drag and slot_0_78_0.hud_chi_tick then
		pcall(slot_0_78_0.hud_chi_tick)
	end

	if var_1793_2 then
		if slot_0_78_0.hud_gs_inds_tick then
			pcall(slot_0_78_0.hud_gs_inds_tick)
		end
	else
		slot_0_78_0.ov_wm_mouse_block = false
		slot_0_78_0.ov_slowdown_mouse_block = false
		slot_0_78_0.ov_keybinds_mouse_block = false
		slot_0_78_0.ov_metrics_mouse_block = false
		slot_0_78_0.ov_spectators_mouse_block = false
	end

	if slot_0_78_0.manual_arrows_render then
		pcall(slot_0_78_0.manual_arrows_render)
	end

	if var_1793_1 > 0.01 then
		local var_1793_4
		local var_1793_5

		if slot_0_78_0.ov_drag_active and slot_0_78_0.ov_drag_snap_pos and slot_0_78_0.ov_drag_snap_sz then
			var_1793_4 = slot_0_78_0.ov_drag_snap_pos
			var_1793_5 = slot_0_78_0.ov_drag_snap_sz
		elseif slot_0_78_0.ov_drag_hint_box then
			local var_1793_6 = slot_0_78_0.ov_drag_hint_box

			var_1793_4 = vector(var_1793_6.x, var_1793_6.y)
			var_1793_5 = vector(var_1793_6.w, var_1793_6.h)
		end

		local var_1793_7 = slot_0_89_0.hud_anim("drag_hint", var_1793_4 ~= nil, 20, 16)

		if var_1793_4 and var_1793_5 and var_1793_7 > 0.001 then
			slot_0_89_0.paint_drag_hint(var_1793_0, var_1793_1, var_1793_4, var_1793_5, var_1793_7)
		end

		if slot_0_78_0.ov_drag_active and var_1793_4 and var_1793_5 then
			slot_0_89_0.paint_drag_environment(var_1793_0, var_1793_1, var_1793_4, var_1793_5)
		end
	end

	slot_0_89_0.hud_dpi_paint_end()
end

function slot_0_89_0.register_extension(arg_1795_0)
	if type(arg_1795_0) ~= "table" or type(arg_1795_0.tick) ~= "function" then
		return
	end

	slot_0_89_0.ext[#slot_0_89_0.ext + 1] = arg_1795_0

	table.sort(slot_0_89_0.ext, function(arg_1796_0, arg_1796_1)
		return (tonumber(arg_1796_0.order) or 100) < (tonumber(arg_1796_1.order) or 100)
	end)
end

overlay_register_extension = slot_0_89_0.register_extension

pcall(function()
	if slot_0_78_0.ov_mouse_hooked then
		return
	end

	slot_0_78_0.ov_mouse_hooked = true

	if events.mouse_input and type(events.mouse_input.set) == "function" then
		events.mouse_input:set(function()
			if not slot_0_89_0.overlay_menu_blocks_mouse() then
				return
			end

			return false
		end)
	end
end)

slot_0_78_0.lobby_badge_tick, slot_0_78_0.lobby_badge_shutdown = (function()
	local var_1799_0 = {}
	local var_1799_1
	local var_1799_2 = "\x01\f<users>\r\tShared Features"

	local function var_1799_3()
		local var_1800_0 = slot_0_152_0.vars.lobby_badge

		if not var_1800_0 or type(var_1800_0.get) ~= "function" then
			return false
		end

		return var_1800_0:get() == true
	end

	local function var_1799_4(arg_1801_0)
		local var_1801_0 = slot_0_78_0.badge_icons
		local var_1801_1 = tostring(arg_1801_0 or "live"):lower()

		if var_1801_1 == "" then
			var_1801_1 = "live"
		end

		if type(var_1801_0) == "table" then
			local var_1801_2 = var_1801_0[var_1801_1] or var_1801_0.live

			if type(var_1801_2) == "string" and var_1801_2 ~= "" and var_1801_2:match("^https?://") then
				return var_1801_2
			end
		end

		return "https://amnesia.plus/logotype.png"
	end

	local function var_1799_5(arg_1802_0)
		if not arg_1802_0 then
			return nil
		end

		local var_1802_0 = slot_0_78_0.ap_entity_steamid64(arg_1802_0)

		if var_1802_0 then
			return "s:" .. var_1802_0
		end

		local var_1802_1, var_1802_2 = pcall(function()
			return arg_1802_0:get_index()
		end)

		if var_1802_1 and var_1802_2 ~= nil then
			return "i:" .. tostring(var_1802_2)
		end

		return nil
	end

	local function var_1799_6(arg_1804_0)
		if not arg_1804_0 then
			return nil
		end

		local var_1804_0 = slot_0_78_0.ap_entity_steamid64(arg_1804_0)

		if not var_1804_0 then
			return nil
		end

		return slot_0_8_0(var_1804_0)
	end

	local function var_1799_7(arg_1805_0)
		if not arg_1805_0 then
			return false
		end

		local var_1805_0 = slot_0_78_0.ap_entity_steamid64(arg_1805_0)
		local var_1805_1 = slot_0_78_0.presence_sid_roster

		if var_1805_0 and type(var_1805_1) == "table" and var_1805_1[var_1805_0] then
			return true
		end

		local var_1805_2 = var_1799_6(arg_1805_0)
		local var_1805_3 = slot_0_78_0.presence_peer_roster

		if var_1805_2 and type(var_1805_3) == "table" and var_1805_3[var_1805_2] then
			return true
		end

		local var_1805_4 = entity.get_local_player()

		return var_1805_4 and arg_1805_0 == var_1805_4
	end

	local function var_1799_8(arg_1806_0)
		local var_1806_0 = slot_0_78_0.ap_entity_steamid64(arg_1806_0)
		local var_1806_1 = slot_0_78_0.presence_sid_roster

		if var_1806_0 and type(var_1806_1) == "table" and var_1806_1[var_1806_0] then
			return var_1806_1[var_1806_0]
		end

		local var_1806_2 = slot_0_78_0.presence_peer_roster

		if type(var_1806_2) == "table" then
			local var_1806_3 = var_1799_6(arg_1806_0)

			if var_1806_3 and var_1806_2[var_1806_3] then
				return var_1806_2[var_1806_3]
			end
		end

		local var_1806_4 = entity.get_local_player()

		if var_1806_4 and arg_1806_0 == var_1806_4 then
			return tostring(slot_0_25_0 or "live"):lower()
		end

		return nil
	end

	local function var_1799_9()
		slot_0_90_0.touch_presence(0)
	end

	local function var_1799_10(arg_1808_0)
		if not var_1799_3() then
			return
		end

		if slot_0_87_0 then
			slot_0_87_0(arg_1808_0 == true)
		end
	end

	local function var_1799_11(arg_1809_0)
		if type(arg_1809_0) ~= "function" then
			return
		end

		pcall(function()
			local var_1810_0 = entity.get_players(false, false)

			if type(var_1810_0) == "table" and #var_1810_0 > 0 then
				for iter_1810_0 = 1, #var_1810_0 do
					local var_1810_1 = var_1810_0[iter_1810_0]

					if var_1810_1 then
						arg_1809_0(var_1810_1)
					end
				end

				return
			end

			entity.get_players(false, false, arg_1809_0)
		end)
	end

	local function var_1799_12(arg_1811_0)
		local var_1811_0 = var_1799_5(arg_1811_0)

		if var_1811_0 and var_1799_0[var_1811_0] then
			pcall(function()
				arg_1811_0:set_icon()
			end)

			var_1799_0[var_1811_0] = nil
		end
	end

	local function var_1799_13(arg_1813_0, arg_1813_1)
		if not var_1799_3() then
			return
		end

		local var_1813_0, var_1813_1 = pcall(function()
			return arg_1813_0:is_bot()
		end)

		if var_1813_0 and var_1813_1 then
			return
		end

		local var_1813_2 = var_1799_5(arg_1813_0)

		if not var_1813_2 then
			return
		end

		local var_1813_3 = var_1799_8(arg_1813_0)

		if not var_1813_3 then
			if arg_1813_1 and var_1799_0[var_1813_2] and not var_1799_7(arg_1813_0) then
				var_1799_12(arg_1813_0)
			end

			return
		end

		local var_1813_4 = var_1799_4(var_1813_3)

		if var_1799_0[var_1813_2] == var_1813_4 then
			return
		end

		pcall(function()
			arg_1813_0:set_icon(var_1813_4)
		end)

		var_1799_0[var_1813_2] = var_1813_4
	end

	local function var_1799_14()
		if not var_1799_3() then
			return
		end

		var_1799_11(function(arg_1817_0)
			var_1799_13(arg_1817_0, false)
		end)

		local var_1816_0 = entity.get_local_player()

		if var_1816_0 then
			var_1799_13(var_1816_0, false)
		end
	end

	local function var_1799_15()
		if not var_1799_3() then
			return
		end

		var_1799_11(function(arg_1819_0)
			var_1799_13(arg_1819_0, true)
		end)

		local var_1818_0 = entity.get_local_player()

		if var_1818_0 then
			var_1799_13(var_1818_0, true)
		end
	end

	local function var_1799_16()
		var_1799_11(function(arg_1821_0)
			pcall(function()
				arg_1821_0:set_icon()
			end)
		end)
		pcall(function()
			local var_1823_0 = entity.get_local_player()

			if var_1823_0 then
				var_1823_0:set_icon()
			end
		end)

		var_1799_0 = {}
	end

	local function var_1799_17(arg_1824_0)
		local var_1824_0 = events.net_update_end

		if not var_1824_0 or not var_1799_1 then
			return
		end

		pcall(function()
			if arg_1824_0 then
				if type(var_1824_0.set) == "function" then
					var_1824_0:set(var_1799_1)

					return
				end

				if type(var_1824_0) == "function" then
					var_1824_0(var_1799_1, true)
				end

				return
			end

			if type(var_1824_0.unset) == "function" then
				var_1824_0:unset(var_1799_1)

				return
			end

			if type(var_1824_0) == "function" then
				var_1824_0(var_1799_1, false)
			end
		end)
	end

	local var_1799_18

	function var_1799_1()
		if not var_1799_3() then
			return
		end

		local var_1826_0 = slot_0_16_0()

		if var_1826_0 ~= var_1799_18 then
			var_1799_18 = var_1826_0

			if var_1826_0 then
				var_1799_9()
				var_1799_10(true)
				var_1799_14()
			end

			return
		end

		local var_1826_1 = globals.tickcount or 0

		if var_1826_1 % 128 == 0 then
			var_1799_14()
		end

		if var_1826_1 % 256 == 0 then
			var_1799_10(false)
		end
	end

	function slot_0_78_0.lobby_badge_resync()
		var_1799_14()
		var_1799_15()
	end

	pcall(function()
		if type(slot_0_152_0.vars.lobby_badge.set_callback) == "function" then
			slot_0_152_0.vars.lobby_badge:set_callback(function(arg_1829_0)
				local var_1829_0 = arg_1829_0:get() == true

				pcall(function()
					slot_0_152_0.vars.lobby_badge:name(slot_0_94_0(var_1799_2, var_1829_0))
				end)
				var_1799_17(var_1829_0)

				if var_1829_0 then
					var_1799_9()
					var_1799_10(true)
					var_1799_14()
				else
					var_1799_16()
				end
			end, true)
		end
	end)
	pcall(function()
		slot_0_152_0.vars.lobby_badge:name(slot_0_94_0(var_1799_2, var_1799_3()))
	end)
	pcall(function()
		events.player_spawn:set(function()
			if var_1799_3() then
				var_1799_14()
			end
		end)
	end)
	pcall(function()
		events.round_start:set(function()
			if var_1799_3() then
				var_1799_14()
			end
		end)
	end)
	pcall(function()
		events.round_prestart:set(function()
			if var_1799_3() then
				var_1799_14()
			end
		end)
	end)
	pcall(function()
		events.player_connect_full:set(function(arg_1839_0)
			if not var_1799_3() or type(arg_1839_0) ~= "table" then
				return
			end

			pcall(function()
				local var_1840_0 = entity.get(arg_1839_0.userid, true)

				if var_1840_0 then
					slot_0_78_0.ap_entity_steamid64(var_1840_0)
				end
			end)
			var_1799_14()
		end)
	end)
	var_1799_17(var_1799_3())

	local function var_1799_19()
		var_1799_17(false)
		var_1799_16()

		slot_0_78_0.lobby_badge_resync = nil
	end

	return nil, var_1799_19
end)()

;(function()
	if not pcall(slot_0_1_0.sizeof, "awVector") then
		slot_0_1_0.cdef("            typedef struct { float x, y, z; } awVector;\n            typedef void*(*awCreateEvent)();\n            typedef void*(*awCreateClass)(int, int);\n            typedef struct {\n                awCreateClass create_class;\n                awCreateEvent create_event;\n                char* network_name;\n                void* recv_table;\n                void* next;\n                int class_id;\n            } awClientClass;\n        ")
	end

	local var_1842_0 = {
		bounds = 8192,
		alpha_max = 65,
		width_max = 55,
		radius_max = 750,
		radius_min = 100
	}
	local var_1842_1 = {
		refresh_bounds = false,
		bounds_applied = false,
		create_cooldown = 0,
		clear_sound = false
	}
	local var_1842_2 = {
		"ambient/weather/rain_interior_tinroof.wav"
	}
	local var_1842_3 = {
		"ambient/wind/wind_gust8.wav",
		"ambient/wind/wind_gust10.wav",
		"ambient/wind/wind_med1.wav"
	}
	local var_1842_4 = {
		get_client_classes = utils.get_vfunc("client.dll", "VClient018", 8, "awClientClass*(__thiscall*)(void*)"),
		get_networkable = utils.get_vfunc("client.dll", "VClientEntityList003", 0, "void*(__thiscall*)(void*, int)"),
		clear_sound = utils.get_vfunc("engine.dll", "IEngineSoundClient003", 9, "void(__thiscall*)(void*, bool)"),
		random_seed = slot_0_1_0.cast("int(__cdecl*)(int)", utils.opcode_scan("vstdlib.dll", "55 8B EC 8B 0D ?? ?? ?? ?? FF 75 08")),
		play_sound = (function()
			local var_1843_0 = utils.get_vfunc("engine.dll", "IEngineSoundClient003", 12, "int(__thiscall*)(void*, const char*, float, int, int, float)")

			return function(arg_1844_0, arg_1844_1)
				pcall(var_1843_0, arg_1844_0, (tonumber(arg_1844_1) or 0) / 100, 100, 0, 0)
			end
		end)()
	}
	local var_1842_5 = 0

	local function var_1842_6()
		return slot_0_152_0.vars and slot_0_152_0.vars.weather_manip
	end

	local function var_1842_7()
		local var_1846_0 = var_1842_6()

		if not var_1846_0 or type(var_1846_0.get) ~= "function" then
			return false
		end

		local var_1846_1, var_1846_2 = pcall(function()
			return var_1846_0:get()
		end)

		return var_1846_1 and var_1846_2 == true
	end

	local function var_1842_8()
		local var_1848_0 = var_1842_6()

		if not var_1848_0 then
			return 0
		end

		local var_1848_1, var_1848_2 = pcall(function()
			return var_1848_0.style:get()
		end)

		if not var_1848_1 or type(var_1848_2) ~= "number" then
			return 0
		end

		local var_1848_3 = math.floor(var_1848_2)

		if var_1848_3 >= 0 and var_1848_3 <= 1 then
			return var_1848_3
		end

		if var_1848_3 >= 1 and var_1848_3 <= 2 then
			return var_1848_3 - 1
		end

		return 0
	end

	local function var_1842_9()
		if var_1842_8() == 1 then
			return var_1842_3
		end

		return var_1842_2
	end

	local function var_1842_10()
		return entity.get_entities("CPrecipitation") or {}
	end

	local function var_1842_11()
		pcall(function()
			var_1842_4.clear_sound(false)
		end)

		var_1842_1.clear_sound = false
	end

	local function var_1842_12()
		local var_1854_0 = var_1842_6()

		if not var_1842_7() or not var_1854_0 or var_1854_0.sound:get() ~= true then
			var_1842_11()

			var_1842_1.last_volume = nil

			return
		end

		if not globals.is_in_game then
			return
		end

		local var_1854_1 = var_1842_9()
		local var_1854_2 = var_1854_1[math.random(1, #var_1854_1)]
		local var_1854_3 = var_1854_0.volume:get()

		var_1842_11()

		var_1842_1.clear_sound = true

		pcall(function()
			var_1842_4.play_sound(var_1854_2, var_1854_3)
		end)

		var_1842_1.last_volume = var_1854_3
	end

	local function var_1842_13(arg_1856_0)
		local var_1856_0 = var_1842_6()

		if not var_1842_7() or not var_1856_0 or var_1856_0.sound:get() ~= true then
			var_1842_11()

			var_1842_1.last_volume = nil

			return
		end

		local var_1856_1 = var_1856_0.volume:get()

		if arg_1856_0 or var_1842_1.last_volume ~= var_1856_1 then
			var_1842_12()
		end
	end

	local function var_1842_14()
		local var_1857_0 = var_1842_6()

		if not var_1857_0 then
			return
		end

		pcall(function()
			local var_1858_0 = var_1857_0.radius:get()
			local var_1858_1 = var_1857_0.width:get()
			local var_1858_2 = var_1857_0.alpha:get()
			local var_1858_3 = math.max(var_1842_0.radius_min, math.min(var_1842_0.radius_max, var_1858_0))
			local var_1858_4 = math.max(10, math.min(var_1842_0.width_max, var_1858_1))
			local var_1858_5 = math.max(10, math.min(var_1842_0.alpha_max, var_1858_2))

			cvar.r_rainradius:int(var_1858_3)
			cvar.r_rainwidth:float(var_1858_4 / 100)
			cvar.r_rainalpha:float(var_1858_5 / 100)
		end)
	end

	local function var_1842_15()
		if not globals.is_in_game or not var_1842_7() then
			return
		end

		pcall(function()
			var_1842_4.random_seed(math.random(1, 10000000))
		end)
	end

	local function var_1842_16()
		if var_1842_1.precip_class then
			return var_1842_1.precip_class
		end

		local var_1861_0, var_1861_1 = pcall(function()
			local var_1862_0 = var_1842_4.get_client_classes()

			while var_1862_0 and var_1862_0 ~= slot_0_1_0.NULL do
				if var_1862_0.class_id == 138 then
					return var_1862_0
				end

				if not var_1862_0.next or var_1862_0.next == slot_0_1_0.NULL then
					break
				end

				var_1862_0 = slot_0_1_0.cast("awClientClass*", var_1862_0.next)
			end

			return nil
		end)

		if var_1861_0 and var_1861_1 then
			var_1842_1.precip_class = var_1861_1
		end

		return var_1842_1.precip_class
	end

	local function var_1842_17(arg_1863_0)
		if not arg_1863_0 then
			return
		end

		pcall(function()
			local var_1864_0 = arg_1863_0:get_index()
			local var_1864_1 = var_1842_4.get_networkable(var_1864_0)

			if not var_1864_1 or var_1864_1 == slot_0_1_0.NULL then
				return
			end

			local var_1864_2 = slot_0_1_0.cast("void***", var_1864_1)

			if not var_1864_2 or var_1864_2 == slot_0_1_0.NULL then
				return
			end

			local var_1864_3 = slot_0_1_0.cast("void***(__thiscall*)(void*)", var_1864_2[0][0])(var_1864_2)

			if not var_1864_3 or var_1864_3 == slot_0_1_0.NULL then
				return
			end

			local var_1864_4 = slot_0_1_0.cast("void***(__thiscall*)(void*)", var_1864_3[0][8])(var_1864_3)

			if not var_1864_4 or var_1864_4 == slot_0_1_0.NULL then
				return
			end

			slot_0_1_0.cast("void(__thiscall*)(void*)", var_1864_4[0][4])(var_1864_4)
		end)
	end

	local function var_1842_18()
		local var_1865_0 = var_1842_10()

		for iter_1865_0 = 1, #var_1865_0 do
			var_1842_17(var_1865_0[iter_1865_0])
		end

		var_1842_1.bounds_applied = false
		var_1842_1.refresh_bounds = false
	end

	local function var_1842_19(arg_1866_0)
		if not arg_1866_0 then
			return
		end

		pcall(function()
			local var_1867_0 = arg_1866_0:get_index()
			local var_1867_1 = var_1842_4.get_networkable(var_1867_0)

			if not var_1867_1 or var_1867_1 == slot_0_1_0.NULL then
				return
			end

			local var_1867_2 = slot_0_1_0.cast("void***", arg_1866_0[0])

			if not var_1867_2 or var_1867_2 == slot_0_1_0.NULL then
				return
			end

			local var_1867_3 = slot_0_1_0.cast("void***", var_1867_1)

			if not var_1867_3 or var_1867_3 == slot_0_1_0.NULL then
				return
			end

			slot_0_1_0.cast("void(__thiscall*)(void*, int)", var_1867_3[0][6])(var_1867_1, 0)
			slot_0_1_0.cast("void(__thiscall*)(void*, int)", var_1867_3[0][4])(var_1867_1, 0)

			local var_1867_4 = slot_0_1_0.cast("void***(__thiscall*)(void*)", var_1867_2[0][3])(var_1867_2)

			if var_1867_4 and var_1867_4 ~= slot_0_1_0.NULL then
				local var_1867_5 = slot_0_1_0.cast("awVector*(__thiscall*)(void*)", var_1867_4[0][1])(var_1867_4)
				local var_1867_6 = slot_0_1_0.cast("awVector*(__thiscall*)(void*)", var_1867_4[0][2])(var_1867_4)

				if var_1867_5 and var_1867_5 ~= slot_0_1_0.NULL and var_1867_6 and var_1867_6 ~= slot_0_1_0.NULL then
					local var_1867_7 = var_1842_0.bounds

					var_1867_5.x, var_1867_5.y, var_1867_5.z = -var_1867_7, -var_1867_7, -var_1867_7
					var_1867_6.x, var_1867_6.y, var_1867_6.z = var_1867_7, var_1867_7, var_1867_7
				end
			end

			slot_0_1_0.cast("void(__thiscall*)(void*, int)", var_1867_3[0][5])(var_1867_1, 0)
			slot_0_1_0.cast("void(__thiscall*)(void*, int)", var_1867_3[0][7])(var_1867_1, 0)
		end)
	end

	local function var_1842_20()
		local var_1868_0 = var_1842_10()

		if #var_1868_0 > 1 then
			for iter_1868_0 = 2, #var_1868_0 do
				var_1842_17(var_1868_0[iter_1868_0])
			end

			var_1868_0 = var_1842_10()
		end

		if #var_1868_0 > 0 then
			return var_1868_0[1]
		end

		local var_1868_1 = globals.realtime or 0

		if var_1868_1 < (var_1842_1.create_cooldown or 0) then
			return nil
		end

		local var_1868_2 = var_1842_16()

		if var_1868_2 and var_1868_2.create_class ~= slot_0_1_0.NULL then
			pcall(var_1868_2.create_class, 2047, 0)

			var_1842_1.create_cooldown = var_1868_1 + 1
		end

		local var_1868_3 = var_1842_10()

		if #var_1868_3 > 0 then
			return var_1868_3[1]
		end

		return nil
	end

	local function var_1842_21(arg_1869_0)
		if not arg_1869_0 then
			return
		end

		pcall(function()
			arg_1869_0.m_nPrecipType = var_1842_8()
		end)
	end

	local function var_1842_22()
		if not var_1842_7() then
			if var_1842_1.clear_sound or var_1842_1.last_volume ~= nil then
				var_1842_11()

				var_1842_1.last_volume = nil
			end

			return
		end

		local var_1871_0 = var_1842_6()

		if not var_1871_0 or var_1871_0.sound:get() ~= true then
			if var_1842_1.clear_sound or var_1842_1.last_volume ~= nil then
				var_1842_11()

				var_1842_1.last_volume = nil
			end

			return
		end

		local var_1871_1 = globals.curtime or 0

		if var_1871_1 < var_1842_5 then
			return
		end

		var_1842_5 = var_1871_1 + math.random(5, 10)

		var_1842_12()
	end

	local function var_1842_23()
		var_1842_1.bounds_applied = false
		var_1842_1.refresh_bounds = true
		var_1842_1.create_cooldown = 0
	end

	local function var_1842_24()
		var_1842_14()
	end

	local function var_1842_25()
		var_1842_24()

		var_1842_5 = 0

		var_1842_13(true)
	end

	local function var_1842_26()
		var_1842_24()

		var_1842_5 = 0

		local var_1875_0 = var_1842_6()

		if var_1842_7() then
			var_1842_23()
			var_1842_13(true)
		else
			var_1842_18()
			var_1842_11()

			var_1842_1.last_volume = nil
		end
	end

	local function var_1842_27()
		var_1842_24()

		var_1842_5 = 0

		var_1842_23()
		var_1842_13(true)
	end

	local function var_1842_28()
		var_1842_18()
		var_1842_11()
	end

	local function var_1842_29()
		if not globals.is_in_game or not var_1842_7() then
			return
		end

		var_1842_14()
		var_1842_22()

		local var_1878_0 = var_1842_20()

		if not var_1878_0 then
			return
		end

		var_1842_21(var_1878_0)

		if not var_1842_1.bounds_applied or var_1842_1.refresh_bounds then
			var_1842_19(var_1878_0)

			var_1842_1.bounds_applied = true
			var_1842_1.refresh_bounds = false
		end
	end

	slot_0_78_0.weather_tick = var_1842_29
	slot_0_78_0.weather_shutdown = var_1842_28
	slot_0_78_0.weather_seed_random = var_1842_15
	slot_0_78_0.weather_reset_round = var_1842_23

	pcall(function()
		local var_1879_0 = var_1842_6()

		if not var_1879_0 then
			return
		end

		var_1879_0:set_callback(var_1842_26)
		var_1879_0.style:set_callback(var_1842_27)
		var_1879_0.radius:set_callback(var_1842_24)
		var_1879_0.width:set_callback(var_1842_24)
		var_1879_0.alpha:set_callback(var_1842_24)
		var_1879_0.sound:set_callback(var_1842_25)
		var_1879_0.volume:set_callback(var_1842_25)
	end)
	var_1842_14()
	pcall(function()
		events.round_start:set(function()
			var_1842_23()
		end)
	end)
	pcall(function()
		events.net_update_end:set(function()
			var_1842_15()
		end)
	end)
	pcall(function()
		if events.post_render and type(events.post_render.set) == "function" then
			events.post_render:set(function()
				var_1842_29()
			end)
		end
	end)
end)()
;(function()
	local var_1886_0 = {
		fade = 1,
		fade_time = 0.25,
		wait_time = 0.25,
		active = false
	}
	local var_1886_1 = {}
	local var_1886_2 = {}
	local var_1886_3 = 12
	local var_1886_4 = 1
	local var_1886_5 = {
		[0] = {
			0
		},
		{
			0
		},
		{
			2,
			3
		},
		{
			4,
			5
		},
		{
			13,
			14,
			15,
			16
		},
		{
			9,
			10,
			11,
			12
		},
		{
			17,
			18,
			19,
			20
		},
		{
			21,
			22,
			23,
			24
		}
	}

	local function var_1886_6()
		return slot_0_152_0.vars and slot_0_152_0.vars.hitmarker
	end

	local function var_1886_7()
		local var_1888_0 = var_1886_6()

		if not var_1888_0 or type(var_1888_0.get) ~= "function" then
			return false
		end

		local var_1888_1, var_1888_2 = pcall(function()
			return var_1888_0:get()
		end)

		return var_1888_1 and var_1888_2 == true
	end

	local function var_1886_8(arg_1890_0, arg_1890_1, arg_1890_2)
		if not arg_1890_0 then
			return 1
		end

		local var_1890_0, var_1890_1 = pcall(function()
			return arg_1890_0:get()
		end)

		if not var_1890_0 or var_1890_1 == nil then
			return 1
		end

		if type(var_1890_1) == "number" then
			local var_1890_2 = math.floor(var_1890_1)

			if var_1890_2 >= 0 and var_1890_2 < arg_1890_1 then
				return var_1890_2 + 1
			end

			if var_1890_2 >= 1 and var_1890_2 <= arg_1890_1 then
				return var_1890_2
			end

			return 1
		end

		local var_1890_3 = slot_0_93_0(tostring(var_1890_1))

		if arg_1890_2 and (var_1890_3:find("World", 1, true) or var_1890_3:find("globe", 1, true)) then
			return 2
		end

		if var_1890_3:find("Amnesia", 1, true) or var_1890_3:find("sparkles", 1, true) then
			return 2
		end

		if var_1890_3:find("Gamesense", 1, true) or var_1890_3:find("circle", 1, true) then
			return 1
		end

		if var_1890_3:find("Crosshair", 1, true) or var_1890_3:find("crosshairs", 1, true) then
			return 1
		end

		return 1
	end

	local function var_1886_9()
		return var_1886_8(var_1886_6() and var_1886_6().placement, 2, true)
	end

	local function var_1886_10(arg_1893_0)
		local var_1893_0 = var_1886_6()

		if not var_1893_0 then
			return 1
		end

		local var_1893_1 = arg_1893_0 == "world" and var_1893_0.world_style or var_1893_0.crosshair_style

		return var_1886_8(var_1893_1, 2, false)
	end

	local function var_1886_11()
		local var_1894_0 = refs and refs.world_hitmarker

		if not var_1894_0 or type(var_1894_0.override) ~= "function" then
			return
		end

		if var_1886_7() then
			pcall(function()
				var_1894_0:override(false)
			end)
		else
			pcall(function()
				var_1894_0:override()
			end)
		end
	end

	local function var_1886_12(arg_1897_0)
		var_1886_0.active = false
		var_1886_0.fade = 1
		var_1886_0.fade_time = 0.25
		var_1886_0.wait_time = arg_1897_0 and 0.5 or 0.25
	end

	local function var_1886_13()
		var_1886_1 = {}
		var_1886_2 = {}
	end

	local function var_1886_14(arg_1899_0)
		var_1886_12(arg_1899_0)
		var_1886_13()
	end

	local function var_1886_15(arg_1900_0)
		local var_1900_0 = {}

		for iter_1900_0 = 1, #var_1886_2 do
			local var_1900_1 = var_1886_2[iter_1900_0]

			if var_1900_1 and arg_1900_0 - (var_1900_1.time or 0) <= var_1886_4 then
				var_1900_0[#var_1900_0 + 1] = var_1900_1
			end
		end

		var_1886_2 = var_1900_0
	end

	local function var_1886_16(arg_1901_0, arg_1901_1, arg_1901_2)
		if not arg_1901_0 then
			return nil
		end

		local var_1901_0
		local var_1901_1 = math.huge
		local var_1901_2 = arg_1901_0:get_origin()

		if var_1901_2 then
			for iter_1901_0 = 1, #var_1886_2 do
				local var_1901_3 = var_1886_2[iter_1901_0]

				if var_1901_3 and var_1901_3.origin then
					local var_1901_4 = var_1901_2:dist(var_1901_3.origin)

					if var_1901_4 < var_1901_1 then
						var_1901_1 = var_1901_4
						var_1901_0 = var_1901_3.origin
					end
				end
			end
		end

		if var_1901_0 and var_1901_1 < 96 then
			return var_1901_0
		end

		local var_1901_5 = math.max(0, math.min(7, math.floor(tonumber(arg_1901_1) or 3)))
		local var_1901_6 = var_1886_5[var_1901_5] or var_1886_5[3]

		for iter_1901_1 = 1, #var_1901_6 do
			local var_1901_7, var_1901_8 = pcall(function()
				return arg_1901_0:get_hitbox_position(var_1901_6[iter_1901_1])
			end)

			if var_1901_7 and var_1901_8 then
				return var_1901_8
			end
		end

		local var_1901_9 = arg_1901_0:get_origin()

		if not var_1901_9 then
			return nil
		end

		return vector(var_1901_9.x, var_1901_9.y, var_1901_9.z + 40)
	end

	local function var_1886_17(arg_1903_0)
		if not arg_1903_0 then
			return
		end

		var_1886_1[#var_1886_1 + 1] = {
			fade = 1,
			wait_time = 0.2,
			fade_time = 0.35,
			origin = arg_1903_0
		}

		if #var_1886_1 > var_1886_3 then
			table.remove(var_1886_1, 1)
		end
	end

	local function var_1886_18(arg_1904_0)
		if not var_1886_7() or var_1886_9() ~= 2 then
			return
		end

		local var_1904_0 = entity.get_local_player()

		if not var_1904_0 or entity.get(arg_1904_0.userid, true) ~= var_1904_0 then
			return
		end

		local var_1904_1 = globals.realtime or 0

		var_1886_2[#var_1886_2 + 1] = {
			origin = vector(tonumber(arg_1904_0.x) or 0, tonumber(arg_1904_0.y) or 0, tonumber(arg_1904_0.z) or 0),
			time = var_1904_1
		}

		var_1886_15(var_1904_1)
	end

	local function var_1886_19(arg_1905_0)
		if not var_1886_7() then
			return
		end

		local var_1905_0 = entity.get_local_player()
		local var_1905_1 = entity.get(arg_1905_0.attacker, true)

		if not var_1905_0 or var_1905_0 ~= var_1905_1 then
			return
		end

		local var_1905_2 = var_1886_9()

		if var_1905_2 == 1 then
			var_1886_0.active = true
			var_1886_0.fade = 1
			var_1886_0.fade_time = 0.25
			var_1886_0.wait_time = 0.25

			return
		end

		if var_1905_2 ~= 2 then
			return
		end

		local var_1905_3 = entity.get(arg_1905_0.userid, true)

		if not var_1905_3 then
			return
		end

		local var_1905_4 = globals.realtime or 0

		var_1886_15(var_1905_4)
		var_1886_17(var_1886_16(var_1905_3, arg_1905_0.hitgroup, var_1905_4))
	end

	local function var_1886_20(arg_1906_0)
		if not var_1886_7() then
			return
		end

		local var_1906_0 = entity.get_local_player()
		local var_1906_1 = entity.get(arg_1906_0.userid, true)

		if var_1906_0 and var_1906_0 == var_1906_1 then
			var_1886_14(true)
		end
	end

	local function var_1886_21(arg_1907_0, arg_1907_1, arg_1907_2, arg_1907_3)
		arg_1907_3 = tonumber(arg_1907_3) or 1

		local var_1907_0 = color(255, 255, 255, math.floor(255 * arg_1907_2))
		local var_1907_1 = 5 * arg_1907_3
		local var_1907_2 = 10 * arg_1907_3

		local function var_1907_3(arg_1908_0, arg_1908_1, arg_1908_2, arg_1908_3)
			render.line(vector(arg_1908_0, arg_1908_1), vector(arg_1908_2, arg_1908_3), var_1907_0)
		end

		var_1907_3(arg_1907_0 + var_1907_1, arg_1907_1 + var_1907_1, arg_1907_0 + var_1907_2, arg_1907_1 + var_1907_2)
		var_1907_3(arg_1907_0 - var_1907_1, arg_1907_1 + var_1907_1, arg_1907_0 - var_1907_2, arg_1907_1 + var_1907_2)
		var_1907_3(arg_1907_0 - var_1907_1, arg_1907_1 - var_1907_1, arg_1907_0 - var_1907_2, arg_1907_1 - var_1907_2)
		var_1907_3(arg_1907_0 + var_1907_1, arg_1907_1 - var_1907_1, arg_1907_0 + var_1907_2, arg_1907_1 - var_1907_2)
	end

	local function var_1886_22(arg_1909_0, arg_1909_1, arg_1909_2, arg_1909_3)
		arg_1909_3 = tonumber(arg_1909_3) or 1

		local var_1909_0 = slot_0_89_0 and type(slot_0_89_0.hud_accent_color) == "function" and slot_0_89_0.hud_accent_color(arg_1909_2) or color(164, 255, 207, math.floor(255 * arg_1909_2))
		local var_1909_1 = color(var_1909_0.r, var_1909_0.g, var_1909_0.b, math.floor((var_1909_0.a or 255) * arg_1909_2))
		local var_1909_2 = color(var_1909_0.r, var_1909_0.g, var_1909_0.b, math.floor((var_1909_0.a or 255) * arg_1909_2 * 0.08))
		local var_1909_3 = 1 + (1 - arg_1909_2) * 0.35
		local var_1909_4 = 4 * arg_1909_3 * var_1909_3
		local var_1909_5 = 10 * arg_1909_3 * var_1909_3

		local function var_1909_6(arg_1910_0, arg_1910_1, arg_1910_2, arg_1910_3)
			render.gradient(vector(arg_1910_0, arg_1910_1), vector(arg_1910_2, arg_1910_3), var_1909_1, var_1909_2, var_1909_1, var_1909_2)
		end

		var_1909_6(arg_1909_0 + var_1909_4, arg_1909_1 + var_1909_4, arg_1909_0 + var_1909_5, arg_1909_1 + var_1909_5)
		var_1909_6(arg_1909_0 - var_1909_4, arg_1909_1 + var_1909_4, arg_1909_0 - var_1909_5, arg_1909_1 + var_1909_5)
		var_1909_6(arg_1909_0 - var_1909_4, arg_1909_1 - var_1909_4, arg_1909_0 - var_1909_5, arg_1909_1 - var_1909_5)
		var_1909_6(arg_1909_0 + var_1909_4, arg_1909_1 - var_1909_4, arg_1909_0 + var_1909_5, arg_1909_1 - var_1909_5)
		pcall(function()
			render.shadow(vector(arg_1909_0 - 3, arg_1909_1 - 3), vector(arg_1909_0 + 3, arg_1909_1 + 3), color(var_1909_0.r, var_1909_0.g, var_1909_0.b, math.floor(72 * arg_1909_2)), 8)
		end)
		pcall(function()
			render.circle(vector(arg_1909_0, arg_1909_1), color(255, 255, 255, math.floor(180 * arg_1909_2)), 1.1 * arg_1909_3, 0, 1)
		end)
	end

	local function var_1886_23(arg_1913_0, arg_1913_1, arg_1913_2, arg_1913_3, arg_1913_4)
		if arg_1913_3 == 2 then
			var_1886_22(arg_1913_0, arg_1913_1, arg_1913_2, arg_1913_4)
		else
			var_1886_21(arg_1913_0, arg_1913_1, arg_1913_2, arg_1913_4)
		end
	end

	local function var_1886_24(arg_1914_0, arg_1914_1)
		arg_1914_0.wait_time = (arg_1914_0.wait_time or 0) - arg_1914_1

		if arg_1914_0.wait_time > 0 then
			return arg_1914_0.fade or 1
		end

		local var_1914_0 = arg_1914_0.fade_time or 0.25
		local var_1914_1 = var_1914_0 > 0 and 1 / var_1914_0 or 4

		arg_1914_0.fade = (arg_1914_0.fade or 1) - var_1914_1 * arg_1914_1

		return arg_1914_0.fade
	end

	local function var_1886_25()
		if var_1886_9() ~= 1 or not var_1886_0.active then
			return
		end

		local var_1915_0 = render.screen_size()

		if not var_1915_0 or not var_1915_0.x or not var_1915_0.y then
			return
		end

		local var_1915_1 = globals.frametime or 0.016
		local var_1915_2 = var_1886_24(var_1886_0, var_1915_1)

		if var_1915_2 <= 0 then
			var_1886_0.active = false
			var_1886_0.fade = 0

			return
		end

		local var_1915_3 = math.max(0, math.min(1, var_1915_2))

		var_1886_23(var_1915_0.x * 0.5, var_1915_0.y * 0.5, var_1915_3, var_1886_10("crosshair"), 1)
	end

	local function var_1886_26()
		if var_1886_9() ~= 2 or #var_1886_1 == 0 then
			return
		end

		local var_1916_0 = globals.frametime or 0.016
		local var_1916_1 = var_1886_10("world")
		local var_1916_2 = {}

		for iter_1916_0 = 1, #var_1886_1 do
			local var_1916_3 = var_1886_1[iter_1916_0]
			local var_1916_4 = var_1886_24(var_1916_3, var_1916_0)

			if var_1916_4 > 0 and var_1916_3.origin then
				local var_1916_5, var_1916_6 = pcall(function()
					return render.world_to_screen(var_1916_3.origin)
				end)

				if var_1916_5 and var_1916_6 and var_1916_6.x and var_1916_6.y then
					var_1916_4 = math.max(0, math.min(1, var_1916_4))

					var_1886_23(var_1916_6.x, var_1916_6.y, var_1916_4, var_1916_1, 0.85)

					var_1916_2[#var_1916_2 + 1] = var_1916_3
				elseif var_1916_4 > 0 then
					var_1916_2[#var_1916_2 + 1] = var_1916_3
				end
			end
		end

		var_1886_1 = var_1916_2
	end

	local function var_1886_27()
		var_1886_11()

		if not globals.is_in_game or not var_1886_7() then
			return
		end

		local var_1918_0 = var_1886_9()

		if var_1918_0 == 1 then
			var_1886_25()
		elseif var_1918_0 == 2 then
			var_1886_26()
		end
	end

	slot_0_78_0.hitmarker_render = var_1886_27
	slot_0_78_0.hitmarker_reset = var_1886_14
	slot_0_78_0.hitmarker_sync_nl = var_1886_11

	pcall(function()
		local var_1919_0 = var_1886_6()

		if not var_1919_0 then
			return
		end

		if type(var_1919_0.set_callback) == "function" then
			var_1919_0:set_callback(var_1886_11, true)
		end

		if var_1919_0.placement and type(var_1919_0.placement.set_callback) == "function" then
			var_1919_0.placement:set_callback(var_1886_11)
		end
	end)
	pcall(function()
		events.player_hurt:set(function(arg_1921_0)
			var_1886_19(arg_1921_0)
		end)
	end)
	pcall(function()
		if events.bullet_impact and type(events.bullet_impact.set) == "function" then
			events.bullet_impact:set(function(arg_1923_0)
				var_1886_18(arg_1923_0)
			end)
		end
	end)
	pcall(function()
		if events.player_spawned and type(events.player_spawned.set) == "function" then
			events.player_spawned:set(function(arg_1925_0)
				var_1886_20(arg_1925_0)
			end)
		end
	end)
	pcall(function()
		events.round_start:set(function()
			var_1886_14(false)
		end)
	end)
	pcall(function()
		events.shutdown:set(function()
			local var_1929_0 = refs and refs.world_hitmarker

			if var_1929_0 and type(var_1929_0.override) == "function" then
				pcall(function()
					var_1929_0:override()
				end)
			end
		end)
	end)
end)()
;(function()
	local var_1931_0 = {
		{
			key = "de_overpass",
			id = "de_overpass",
			label = "Overpass"
		},
		{
			key = "de_mirage",
			id = "de_mirage",
			label = "Mirage"
		},
		{
			key = "de_vertigo",
			id = "de_vertigo",
			label = "Vertigo"
		},
		{
			key = "de_inferno",
			id = "de_inferno",
			label = "Inferno"
		},
		{
			key = "de_dust2",
			id = "de_dust2",
			label = "Dust II"
		},
		{
			key = "de_cbble",
			id = "de_cbble",
			label = "Cobblestone"
		},
		{
			key = "de_bank",
			id = "de_bank",
			label = "Bank"
		},
		{
			key = "de_shortdust",
			id = "de_shortdust",
			label = "Shortdust"
		},
		{
			key = "de_shortnuke",
			id = "de_shortnuke",
			label = "Shortnuke"
		},
		{
			key = "cs_office",
			id = "cs_office",
			label = "Office"
		},
		{
			key = "cs_assault",
			id = "cs_assault",
			label = "Assault"
		}
	}
	local var_1931_1 = {
		bot_place_ready = false,
		bot_place_prev = false,
		showpos = false
	}

	local function var_1931_2()
		return slot_0_152_0.vars and slot_0_152_0.vars.warmup_setup
	end

	local function var_1931_3()
		return var_1931_2() ~= nil
	end

	local function var_1931_4(arg_1934_0)
		pcall(function()
			local var_1935_0 = type(slot_0_78_0.elog_accent_hex) == "function" and slot_0_78_0.elog_accent_hex() or "A4FFCF"

			print_raw(string.format("\a%s   amnesia   \aAAAAAAFF%s", var_1935_0, tostring(arg_1934_0 or "")))
		end)
	end

	local function var_1931_5(arg_1936_0)
		if arg_1936_0 and arg_1936_0 ~= "" then
			pcall(function()
				utils.console_exec(arg_1936_0)
			end)
		end
	end

	local function var_1931_6(arg_1938_0, arg_1938_1)
		if not arg_1938_0 or type(arg_1938_0.get) ~= "function" then
			return arg_1938_1 == true
		end

		local var_1938_0, var_1938_1 = pcall(function()
			return arg_1938_0:get()
		end)

		if not var_1938_0 then
			return arg_1938_1 == true
		end

		return var_1938_1 == true
	end

	local function var_1931_7()
		local var_1940_0 = var_1931_2()
		local var_1940_1 = {
			"sv_cheats 1",
			"mp_autoteambalance 0",
			"mp_limitteams 0",
			"mp_teammates_are_enemies 0",
			"mp_freezetime 0",
			"mp_roundtime_defuse 60",
			"mp_roundtime 60",
			"mp_buytime 99999",
			"mp_startmoney 60000",
			"mp_afterroundmoney 60000",
			"mp_maxmoney 60000",
			"ammo_grenade_limit_total 5",
			"ammo_grenade_limit_flashbang 2",
			"mp_warmup_pausetimer 1",
			"mp_warmup_end",
			"mp_restartgame 1"
		}

		if var_1940_0 and var_1931_6(var_1940_0.kick_bots, true) then
			var_1940_1[#var_1940_1 + 1] = "bot_kick"
		end

		if var_1940_0 and var_1931_6(var_1940_0.buy_anywhere, true) then
			var_1940_1[#var_1940_1 + 1] = "mp_buy_anywhere 1"
		end

		if var_1940_0 and var_1931_6(var_1940_0.infinite_ammo, true) then
			var_1940_1[#var_1940_1 + 1] = "sv_infinite_ammo 1"
		else
			var_1940_1[#var_1940_1 + 1] = "sv_infinite_ammo 0"
		end

		if var_1940_0 and var_1931_6(var_1940_0.grenade_traj, true) then
			var_1940_1[#var_1940_1 + 1] = "sv_grenade_trajectory 1"
			var_1940_1[#var_1940_1 + 1] = "sv_grenade_trajectory_time 15"
		else
			var_1940_1[#var_1940_1 + 1] = "sv_grenade_trajectory 0"
		end

		return var_1940_1
	end

	local function var_1931_8(arg_1941_0)
		local var_1941_0 = var_1931_7()

		for iter_1941_0 = 1, #var_1941_0 do
			var_1931_5(var_1941_0[iter_1941_0])
		end

		if not arg_1941_0 then
			var_1931_4("Practice setup \aFFFFFFFFapplied")
		end
	end

	local function var_1931_9(arg_1942_0, arg_1942_1)
		var_1931_1.pending_map = arg_1942_0
		var_1931_1.pending_label = arg_1942_1

		var_1931_5("map " .. arg_1942_0)
		var_1931_4("Loading \aFFFFFFFF" .. tostring(arg_1942_1 or arg_1942_0))
	end

	local function var_1931_10()
		local var_1943_0 = var_1931_2()

		if not var_1931_1.pending_map or not var_1943_0 then
			return
		end

		if not globals.is_in_game then
			return
		end

		local var_1943_1 = globals.mapname

		if type(var_1943_1) ~= "string" or var_1943_1 == "" then
			return
		end

		local var_1943_2 = var_1931_1.pending_map
		local var_1943_3 = var_1943_1:lower()

		if var_1943_3:find(var_1943_2, 1, true) or var_1943_2:find(var_1943_3, 1, true) then
			local var_1943_4 = var_1931_1.pending_label or var_1943_1

			var_1931_1.pending_map = nil
			var_1931_1.pending_label = nil

			if var_1931_6(var_1943_0.auto_on_map, false) then
				utils.execute_after(1.2, function()
					var_1931_8(true)
					var_1931_4("Auto setup on \aFFFFFFFF" .. tostring(var_1943_4))
				end)
			end
		end
	end

	local function var_1931_11()
		if not var_1931_3() or not var_1931_1.bot_place_ready then
			return
		end

		local var_1945_0 = var_1931_2()
		local var_1945_1 = var_1945_0 and var_1945_0.bot_place

		if not var_1945_1 or type(var_1945_1.get) ~= "function" then
			return
		end

		local var_1945_2, var_1945_3 = pcall(function()
			return var_1945_1:get()
		end)

		if not var_1945_2 then
			return
		end

		local var_1945_4 = var_1945_3 == true

		if var_1945_4 and not var_1931_1.bot_place_prev then
			var_1931_5("bot_place")
		end

		var_1931_1.bot_place_prev = var_1945_4
	end

	slot_0_78_0.warmup_setup_tick = var_1931_11

	pcall(function()
		local var_1947_0 = var_1931_2()

		if not var_1947_0 then
			return
		end

		if var_1947_0.apply and type(var_1947_0.apply.set_callback) == "function" then
			var_1947_0.apply:set_callback(function()
				var_1931_8(false)
			end)
		end

		if var_1947_0.showpos and type(var_1947_0.showpos.set_callback) == "function" then
			var_1947_0.showpos:set_callback(function()
				var_1931_1.showpos = not var_1931_1.showpos

				var_1931_5("cl_showpos " .. (var_1931_1.showpos and "1" or "0"))
				var_1931_4("cl_showpos \aFFFFFFFF" .. (var_1931_1.showpos and "on" or "off"))
			end)
		end

		for iter_1947_0 = 1, #var_1931_0 do
			local var_1947_1 = var_1931_0[iter_1947_0]
			local var_1947_2 = var_1947_0[var_1947_1.id]

			if var_1947_2 and type(var_1947_2.set_callback) == "function" then
				var_1947_2:set_callback(function()
					var_1931_9(var_1947_1.key, var_1947_1.label)
				end)
			end
		end
	end)
	pcall(function()
		utils.execute_after(0.1, function()
			var_1931_1.bot_place_ready = true

			local var_1952_0 = var_1931_2()

			if var_1952_0 and var_1952_0.bot_place then
				local var_1952_1, var_1952_2 = pcall(function()
					return var_1952_0.bot_place:get()
				end)

				var_1931_1.bot_place_prev = var_1952_1 and var_1952_2 == true
			end
		end)
	end)
	pcall(function()
		events.level_init:set(function()
			var_1931_10()
		end)
	end)
	pcall(function()
		events.round_start:set(function()
			var_1931_10()
		end)
	end)
	pcall(function()
		events.shutdown:set(function()
			var_1931_1.showpos = false
			var_1931_1.pending_map = nil
			var_1931_1.pending_label = nil
			var_1931_1.bot_place_prev = false
			var_1931_1.bot_place_ready = false
		end)
	end)
end)()
;(function()
	local var_1960_0 = false
	local var_1960_1 = {}

	local function var_1960_2()
		local var_1961_0 = 0

		pcall(function()
			var_1961_0 = ui.get_alpha() or 0
		end)

		return var_1961_0
	end

	local function var_1960_3()
		if _G.screen_log_hud_enabled and _G.screen_log_hud_enabled() then
			return true
		end

		if _G.screen_log_has_forced and _G.screen_log_has_forced() then
			return true
		end

		local var_1963_0 = slot_0_78_0.screen_logs

		if type(var_1963_0) ~= "table" then
			return false
		end

		local var_1963_1 = slot_0_78_0.ELOG_TTL_SEC or 4
		local var_1963_2 = globals.realtime or 0

		for iter_1963_0 = 1, #var_1963_0 do
			local var_1963_3 = var_1963_0[iter_1963_0]

			if type(var_1963_3) == "table" and var_1963_1 > var_1963_2 - (var_1963_3.time or 0) then
				return true
			end
		end

		return false
	end

	local function var_1960_4()
		local var_1964_0 = slot_0_152_0.vars and slot_0_152_0.vars.crosshair_scope
		local var_1964_1 = var_1964_0 and type(var_1964_0.get) == "function" and var_1964_0:get() == true
		local var_1964_2 = tonumber(slot_0_78_0.scope_blend_cur) or 0

		if (var_1964_1 or var_1964_2 > 0.001) and slot_0_78_0.scope_blend_sync then
			var_1964_2 = slot_0_78_0.scope_blend_sync()
		end

		if not var_1964_1 then
			return false
		end

		return var_1964_2 > 0.01
	end

	local function var_1960_5()
		local var_1965_0 = slot_0_152_0.vars and slot_0_152_0.vars.hitmarker

		if not var_1965_0 or type(var_1965_0.get) ~= "function" or var_1965_0:get() ~= true then
			return false
		end

		return globals.is_in_game == true
	end

	local function var_1960_6()
		local var_1966_0 = slot_0_152_0.vars and slot_0_152_0.vars.console_color

		if not var_1966_0 or type(var_1966_0.get) ~= "function" or var_1966_0:get() ~= true then
			return false
		end

		local var_1966_1, var_1966_2 = pcall(function()
			return utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)")()
		end)

		return var_1966_1 and var_1966_2 == true
	end

	local function var_1960_7()
		var_1960_1.scope = var_1960_4()
		var_1960_1.hitmarker = var_1960_5()
		var_1960_1.console = var_1960_6()
		var_1960_1.peek = slot_0_78_0.adaptive_peek_wants_render and slot_0_78_0.adaptive_peek_wants_render() == true
		var_1960_1.splash = slot_0_78_0.startup_splash_wants and slot_0_78_0.startup_splash_wants() == true
		var_1960_1.chi_draw = chi.enabled and chi.enabled() == true
		var_1960_1.chi_drag = var_1960_1.chi_draw
		var_1960_1.elog = var_1960_3()
		slot_0_78_0.render_lanes = var_1960_1
	end

	local function var_1960_8()
		if not var_1960_0 then
			return
		end

		local var_1969_0 = slot_0_78_0.apply_aspect_ratio and slot_0_78_0.apply_aspect_ratio() == true
		local var_1969_1 = slot_0_78_0.vm_viewmodel_tick and slot_0_78_0.vm_viewmodel_tick() == true

		var_1960_0 = var_1969_0 or var_1969_1
	end

	local function var_1960_9()
		var_1960_7()

		if slot_0_78_0.clantag then
			slot_0_78_0.clantag()
		end

		if slot_0_78_0.misc_voice_tick then
			slot_0_78_0.misc_voice_tick()
		end

		var_1960_8()

		if var_1960_2() > 0.001 then
			if slot_0_78_0.menu_accent_anim_tick then
				slot_0_78_0.menu_accent_anim_tick()
			end

			if slot_0_78_0.sidebar_tick then
				slot_0_78_0.sidebar_tick()
			end
		end

		if var_1960_1.scope and slot_0_78_0.draw_custom_scope then
			slot_0_78_0.draw_custom_scope()
		end

		if var_1960_1.hitmarker and slot_0_78_0.hitmarker_render then
			slot_0_78_0.hitmarker_render()
		end

		if var_1960_1.console and slot_0_78_0.misc_console_render then
			slot_0_78_0.misc_console_render()
		end

		if var_1960_1.peek and slot_0_78_0.adaptive_peek_render then
			slot_0_78_0.adaptive_peek_render()
		end

		if var_1960_1.splash and slot_0_78_0.startup_splash_render then
			slot_0_78_0.startup_splash_render()
		end

		if slot_0_78_0.welcome_sound_tick then
			slot_0_78_0.welcome_sound_tick()
		end

		if slot_0_89_0.scene_tick then
			slot_0_89_0.scene_tick()
		end

		if var_1960_1.chi_draw and chi.render then
			chi.render()
		end
	end

	events.render:set(function()
		local var_1971_0, var_1971_1 = pcall(var_1960_9)

		if not var_1971_0 then
			print_raw("\aD35050FF[amnesia.plus]\aFFFFFFFF error(render): " .. tostring(var_1971_1))
		end
	end)

	function slot_0_78_0.ap_render_wake_cvars()
		var_1960_0 = true
	end

	local function var_1960_10()
		if slot_0_78_0.api_ping_ok ~= true or not slot_0_90_0.is_configured() then
			return
		end

		slot_0_90_0.touch_presence(90)

		if slot_0_87_0 then
			slot_0_87_0(false)
		end

		local var_1973_0 = globals.realtime or 0

		if not slot_0_78_0.api_ping_pending and var_1973_0 - (slot_0_78_0.api_ping_recheck_at or 0) >= 60 then
			slot_0_78_0.api_ping_recheck_at = var_1973_0

			slot_0_146_0("auto")
		end
	end

	local function var_1960_11()
		pcall(var_1960_10)
		utils.execute_after(1, var_1960_11)
	end

	local function var_1960_12()
		local var_1975_0 = globals.realtime or 0

		if var_1975_0 - (slot_0_78_0.runtime_sanitize_at or 0) >= 90 then
			slot_0_78_0.runtime_sanitize_at = var_1975_0

			if slot_0_78_0.runtime_sanitize then
				pcall(slot_0_78_0.runtime_sanitize, false)
			end
		end

		utils.execute_after(5, var_1960_12)
	end

	utils.execute_after(1, var_1960_11)
	utils.execute_after(5, var_1960_12)

	function slot_0_78_0.ap_render_bootstrap_cvars()
		pcall(function()
			if not slot_0_78_0.pui_ready then
				return
			end

			local var_1977_0 = false
			local var_1977_1 = slot_0_152_0.vars and slot_0_152_0.vars.aspect

			if var_1977_1 and type(var_1977_1.get) == "function" and var_1977_1:get() == true then
				var_1977_0 = true
			end

			local var_1977_2 = slot_0_152_0.vars and slot_0_152_0.vars.vm_adjust

			if not var_1977_0 and var_1977_2 and type(var_1977_2.get) == "function" and var_1977_2:get() == true then
				var_1977_0 = true
			end

			if var_1977_0 then
				slot_0_78_0.ap_render_wake_cvars()
			end
		end)
	end
end)()
pcall(function()
	events.round_start:set(function()
		if slot_0_78_0.cfg_post_load then
			slot_0_78_0.cfg_post_load()
		end

		if slot_0_78_0.misc_flash_game_round then
			slot_0_78_0.misc_flash_game_round()
		end

		if slot_0_78_0.misc_auto_r8_round then
			pcall(slot_0_78_0.misc_auto_r8_round)
		end
	end)
end)
pcall(function()
	events.shutdown:set(function()
		if slot_0_78_0.misc_voice_restore_all then
			slot_0_78_0.misc_voice_restore_all()
		end

		if slot_0_78_0.misc_console_reset_tint then
			slot_0_78_0.misc_console_reset_tint()
		end

		if slot_0_78_0.misc.super_toss_active then
			slot_0_78_0.misc.super_toss_active = false

			refs.air_strafe:override()
			refs.strafe_assist:override()
		end
	end)
end)
pcall(function()
	if events.level_init and type(events.level_init.set) == "function" then
		events.level_init:set(function()
			if slot_0_78_0.runtime_sanitize then
				slot_0_78_0.runtime_sanitize(true)
			end

			if slot_0_78_0.misc_voice_restore_all then
				slot_0_78_0.misc_voice_restore_all()
			end
		end)
	end
end)
pcall(function()
	if events.grenade_prediction and type(events.grenade_prediction.set) == "function" then
		events.grenade_prediction:set(function(arg_1985_0)
			if arg_1985_0 and (arg_1985_0.type == "Frag" or arg_1985_0.type == "Molly") then
				slot_0_78_0.misc.grenade_pred_dmg = tonumber(arg_1985_0.damage) or 0
			else
				slot_0_78_0.misc.grenade_pred_dmg = 0
			end
		end)
	end
end)
pcall(function()
	if events.grenade_override_view and type(events.grenade_override_view.set) == "function" then
		events.grenade_override_view:set(function(arg_1987_0)
			local var_1987_0 = slot_0_152_0.vars and slot_0_152_0.vars.grenades

			if not var_1987_0 or not var_1987_0.super_toss or var_1987_0.super_toss:get() ~= true then
				return
			end

			if arg_1987_0 and arg_1987_0.angles and arg_1987_0.velocity and slot_0_78_0.misc_super_toss_view then
				slot_0_78_0.misc_super_toss_view(arg_1987_0, arg_1987_0.velocity)
			end
		end)
	end
end)
pcall(function()
	if slot_0_152_0.vars and slot_0_152_0.vars.mute_manipulations and type(slot_0_152_0.vars.mute_manipulations.set_callback) == "function" then
		slot_0_152_0.vars.mute_manipulations:set_callback(function(arg_1989_0)
			if arg_1989_0:get() ~= true and slot_0_78_0.misc_voice_restore_all then
				slot_0_78_0.misc_voice_restore_all()
			end
		end)
	end

	if slot_0_152_0.vars and slot_0_152_0.vars.grenades and slot_0_152_0.vars.grenades.super_toss and type(slot_0_152_0.vars.grenades.super_toss.set_callback) == "function" then
		slot_0_152_0.vars.grenades.super_toss:set_callback(function(arg_1990_0)
			if arg_1990_0:get() ~= true and slot_0_78_0.misc.super_toss_active then
				slot_0_78_0.misc.super_toss_active = false

				refs.air_strafe:override()
				refs.strafe_assist:override()
			end
		end)
	end

	if slot_0_152_0.vars and slot_0_152_0.vars.console_color and type(slot_0_152_0.vars.console_color.set_callback) == "function" then
		slot_0_152_0.vars.console_color:set_callback(function(arg_1991_0)
			if arg_1991_0:get() ~= true and slot_0_78_0.misc_console_reset_tint then
				slot_0_78_0.misc_console_reset_tint()
			end
		end)
	end
end)
events.shutdown:set(function()
	pcall(function()
		slot_0_78_0.def.snap_reset()
		slot_0_78_0.def.disarm()

		slot_0_78_0.exploit.tickbase_apex = 0
		slot_0_78_0.exploit.lc_left = 0
		slot_0_78_0.exploit.charge = 0
		slot_0_78_0.exploit.tickbase_shift = 0
		slot_0_78_0.exploit.prev_kind = "off"

		set_clantag_safe("\x00")
		cvar.r_aspectratio:float(0)
		pcall(function()
			if slot_0_78_0.vm_restore_stock then
				slot_0_78_0.vm_restore_stock()
			end
		end)
		scope_overlay_apply(false)
		scope_force_vm_apply(false)
		refs.leg_movement:override()
		refs.fakeping:override()

		if slot_0_78_0.hc_manip_clear then
			slot_0_78_0.hc_manip_clear()
		end

		if slot_0_78_0.move_extras_reset then
			slot_0_78_0.move_extras_reset()
		end

		if slot_0_78_0.adaptive_peek_shutdown then
			slot_0_78_0.adaptive_peek_shutdown()
		end

		if slot_0_78_0.dormant_aim_shutdown then
			slot_0_78_0.dormant_aim_shutdown()
		end

		if slot_0_78_0.weather_shutdown then
			slot_0_78_0.weather_shutdown()
		end

		if slot_0_78_0.hitmarker_sync_nl then
			slot_0_78_0.hitmarker_sync_nl()
		end

		if slot_0_78_0.net_interp_restore then
			slot_0_78_0.net_interp_restore()
		end

		if slot_0_78_0.anim and slot_0_78_0.anim.clear_legs then
			slot_0_78_0.anim.clear_legs()
		end

		if slot_0_78_0.runtime_sanitize then
			slot_0_78_0.runtime_sanitize(true)
		end
	end)
	pcall(slot_0_78_0.lobby_badge_shutdown)
end)
pcall(function()
	local var_1995_0 = _G.amnesia_plus_ram

	if type(var_1995_0) == "table" and var_1995_0 ~= slot_0_78_0 then
		var_1995_0.defensive = nil

		if type(var_1995_0.anti_bruteforce) == "table" then
			var_1995_0.anti_bruteforce.tickcounts = {}
			var_1995_0.anti_bruteforce.realtime = {}
		end
	end
end)

_G.amnesia_plus_ram = slot_0_78_0

pcall(function()
	if slot_0_78_0.runtime_sanitize then
		slot_0_78_0.runtime_sanitize(true)
	end
end)
slot_0_90_0.init({
	user = slot_0_18_0
})
utils.execute_after(4, function()
	if not slot_0_90_0.is_configured() then
		slot_0_91_0()

		return
	end

	slot_0_146_0("auto")
end)

function slot_0_198_0()
	local var_1998_0, var_1998_1 = pcall(function()
		slot_0_69_0 = slot_0_0_0.setup(slot_0_152_0)
	end)

	if not var_1998_0 then
		pcall(function()
			print_raw("\aD35050FF[amnesia.plus]\aFFFFFFFF pui.setup: " .. tostring(var_1998_1))
		end)

		return false
	end

	slot_0_78_0.pui_ready = true

	if slot_0_78_0.aspect_cfg_reload then
		pcall(slot_0_78_0.aspect_cfg_reload)
	end

	if slot_0_78_0.ap_render_bootstrap_cvars then
		pcall(slot_0_78_0.ap_render_bootstrap_cvars)
	end

	pcall(slot_0_91_0)

	if slot_0_78_0.api_ping_ok == true and slot_0_81_0 then
		pcall(slot_0_81_0)
	end

	if slot_0_78_0.refresh_config_list then
		pcall(slot_0_78_0.refresh_config_list, slot_0_137_0.loaded)
	end

	return true
end

utils.execute_after(0, slot_0_198_0)
