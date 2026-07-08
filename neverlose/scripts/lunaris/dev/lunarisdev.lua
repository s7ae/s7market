slot_0_0_0 = "DEV"
slot_0_1_0 = require("neverlose/easing")
slot_0_2_0 = require("neverlose/pui")
slot_0_3_0 = require("neverlose/clipboard")
slot_0_4_0 = require("neverlose/gradient")
slot_0_5_0 = require("neverlose/base64")
slot_0_6_0 = require("neverlose/drag_system")
slot_0_7_0 = {
	cached_username = common.get_username()
}
slot_0_9_0 = common.get_game_directory() .. "/Lunaris"
slot_0_10_0 = slot_0_9_0 .. "/fonts"
slot_0_11_0 = slot_0_9_0 .. "/presets.json"

files.create_folder(slot_0_9_0)
files.create_folder(slot_0_10_0)

slot_0_12_0 = {
	antiaim = "\f<shield>",
	settings = "\f<gear>",
	main = "\f<house>"
}
slot_0_13_0 = slot_0_2_0.create(slot_0_12_0.main, {
	{
		"Info",
		"Info",
		1
	},
	{
		"Watermark",
		"Watermark",
		2
	},
	{
		"Presets",
		"Presets",
		2
	}
})
slot_0_14_0 = slot_0_2_0.create(slot_0_12_0.antiaim, {
	{
		"Selection",
		"Selection",
		1
	},
	{
		"Tweaks",
		"Tweaks",
		1
	},
	{
		"Builder",
		"Builder",
		2
	},
	{
		"Snap",
		"Snap Builder",
		2
	},
	{
		"Sync",
		"Settings Sync",
		2
	}
})
slot_0_15_0 = slot_0_2_0.create(slot_0_12_0.settings, {
	{
		"Screen",
		"Screen",
		1
	},
	{
		"Indicators",
		"Indicators",
		2
	},
	{
		"Combat",
		"Combat",
		2
	},
	{
		"Misc",
		"Misc",
		1
	},
	{
		"Animations",
		"Animations",
		1
	},
	{
		"Aimbot",
		"Aimbot",
		2
	},
	{
		"Movement",
		"Movement",
		2
	}
})
slot_0_7_0.main_info = slot_0_13_0.Info
slot_0_7_0.main_wm = slot_0_13_0.Watermark
slot_0_7_0.main_preset = slot_0_13_0.Presets
slot_0_7_0.aa_select = slot_0_14_0.Selection
slot_0_7_0.aa_tweaks = slot_0_14_0.Tweaks
slot_0_7_0.aa_builder = slot_0_14_0.Builder
slot_0_7_0.aa_snap = slot_0_14_0.Snap
slot_0_7_0.aa_sync_grp = slot_0_14_0.Sync
slot_0_7_0.vis_screen = slot_0_15_0.Screen
slot_0_7_0.vis_ind = slot_0_15_0.Indicators
slot_0_7_0.vis_combat = slot_0_15_0.Combat
slot_0_7_0.vis_misc = slot_0_15_0.Misc
slot_0_7_0.misc_anim_grp = slot_0_15_0.Animations
slot_0_7_0.misc_aim_grp = slot_0_15_0.Aimbot
slot_0_7_0.misc_mv_grp = slot_0_15_0.Movement
slot_0_16_0 = nil
slot_0_17_0 = {}
slot_0_18_0 = nil
slot_0_19_0 = nil
slot_0_20_0 = nil
slot_0_21_0 = "(no presets)"
slot_0_22_0 = 2
slot_0_23_0 = 20
slot_0_24_0 = {}

function slot_0_25_0(arg_1_0)
	local var_1_0, var_1_1 = (arg_1_0 or ""):gsub("[^\x80-\xC1]", "")

	return var_1_1
end

function slot_0_26_0(arg_2_0)
	return tostring(arg_2_0 or ""):match("^%s*(.-)%s*$") or ""
end

function slot_0_27_0(arg_3_0)
	return (slot_0_26_0(arg_3_0):gsub("[%z\x01-\x1F]", ""))
end

function slot_0_28_0()
	local var_4_0 = files.read(slot_0_11_0)

	if not var_4_0 or #var_4_0 == 0 then
		return {}
	end

	local var_4_1, var_4_2 = pcall(json.parse, var_4_0)

	if not var_4_1 or type(var_4_2) ~= "table" then
		return {}
	end

	local var_4_3 = {}

	for iter_4_0, iter_4_1 in pairs(var_4_2) do
		local var_4_4 = tostring(iter_4_0)

		if type(iter_4_1) == "string" and #var_4_4 > 0 then
			var_4_3[var_4_4] = iter_4_1
		end
	end

	var_4_3.Agressive = "eyJhYV9tZW51IjpbW3siYm9keV95YXciOnRydWUsImJvZHlfeWF3X21vZGUiOiJTdGF0aWMiLCJib2R5X3lhd19vcHRpb25zIjpbIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiLCJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6MTIuMCwiZGVsYXkiOnRydWUsImRlbGF5X21ldGhvZCI6IlJhbmRvbSIsImRlbGF5X3JhbmRvbV9tYXgiOjcuMCwiZGVsYXlfcmFuZG9tX21pbiI6Ni4wLCJkZWxheV90aWNrcyI6OC4wLCJmYWtlbGFnIjoxNC4wLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9mcm9tIjo2MC4wLCJsaW1pdF9tYXgiOjM5LjAsImxpbWl0X21pbiI6MjguMCwibGltaXRfbW9kZSI6IlJhbmRvbSIsImxpbWl0X3RvIjo2MC4wLCJwaXRjaCI6IkRvd24iLCJyaWdodF9saW1pdCI6NjAuMCwieWF3X2Jhc2UiOiJBdCBUYXJnZXQiLCJ5YXdfbGVmdCI6LTE4LjAsInlhd19tb2RlIjoiTC9SIiwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfZGVnIjowLjAsInlhd19vZmZzZXQiOjAuMCwieWF3X3JpZ2h0IjozNi4wfSx7ImFsbG93IjpmYWxzZSwiYm9keV95YXciOnRydWUsImJvZHlfeWF3X21vZGUiOiJTdGF0aWMiLCJib2R5X3lhd19vcHRpb25zIjpbIkppdHRlciIsIn4iXSwiYm9keV95YXdfcmFuZG9tIjo0LjAsImJvZHlfeWF3X3RpY2tzIjo0LjAsImRlbGF5IjpmYWxzZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3JhbmRvbV9tYXgiOjEyLjAsImRlbGF5X3JhbmRvbV9taW4iOjQuMCwiZGVsYXlfdGlja3MiOjguMCwiZmFrZWxhZyI6MC4wLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9mcm9tIjo2MC4wLCJsaW1pdF9tYXgiOjYwLjAsImxpbWl0X21pbiI6MzAuMCwibGltaXRfbW9kZSI6IlN0YXRpYyIsImxpbWl0X3RvIjo2MC4wLCJwaXRjaCI6IkRvd24iLCJyaWdodF9saW1pdCI6NjAuMCwieWF3X2Jhc2UiOiJBdCBUYXJnZXQiLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kZSI6IlNvbG8iLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEb3duIiwicmlnaHRfbGltaXQiOjYwLjAsInlhd19iYXNlIjoiQXQgVGFyZ2V0IiwieWF3X2xlZnQiOjAuMCwieWF3X21vZGUiOiJTdGF0aWMiLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfYmFzZSI6IkxvY2FsIFZpZXciLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kZSI6IlNvbG8iLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfYmFzZSI6IkxvY2FsIFZpZXciLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kZSI6IlNvbG8iLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEb3duIiwicmlnaHRfbGltaXQiOjYwLjAsInlhd19iYXNlIjoiQXQgVGFyZ2V0IiwieWF3X2xlZnQiOjAuMCwieWF3X21vZGUiOiJTb2xvIiwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfZGVnIjowLjAsInlhd19vZmZzZXQiOjAuMCwieWF3X3JpZ2h0IjowLjB9LHsiYWxsb3ciOmZhbHNlLCJib2R5X3lhdyI6dHJ1ZSwiYm9keV95YXdfbW9kZSI6IlN0YXRpYyIsImJvZHlfeWF3X29wdGlvbnMiOlsifiJdLCJib2R5X3lhd19yYW5kb20iOjQuMCwiYm9keV95YXdfdGlja3MiOjQuMCwiZGVsYXkiOmZhbHNlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfcmFuZG9tX21heCI6MTIuMCwiZGVsYXlfcmFuZG9tX21pbiI6NC4wLCJkZWxheV90aWNrcyI6OC4wLCJmYWtlbGFnIjoxNC4wLCJsZWZ0X2xpbWl0Ijo1OC4wLCJsaW1pdF9mcm9tIjo2MC4wLCJsaW1pdF9tYXgiOjYwLjAsImxpbWl0X21pbiI6MzAuMCwibGltaXRfbW9kZSI6IlN0YXRpYyIsImxpbWl0X3RvIjo2MC4wLCJwaXRjaCI6IkRvd24iLCJyaWdodF9saW1pdCI6NTguMCwieWF3X2Jhc2UiOiJBdCBUYXJnZXQiLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kZSI6IlNvbG8iLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6NS4wLCJ5YXdfcmlnaHQiOjAuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NTguMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEb3duIiwicmlnaHRfbGltaXQiOjU4LjAsInlhd19iYXNlIjoiQXQgVGFyZ2V0IiwieWF3X2xlZnQiOjAuMCwieWF3X21vZGUiOiJTb2xvIiwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfZGVnIjowLjAsInlhd19vZmZzZXQiOjAuMCwieWF3X3JpZ2h0IjowLjB9LHsiYWxsb3ciOmZhbHNlLCJib2R5X3lhdyI6dHJ1ZSwiYm9keV95YXdfbW9kZSI6IlN0YXRpYyIsImJvZHlfeWF3X29wdGlvbnMiOlsifiJdLCJib2R5X3lhd19yYW5kb20iOjQuMCwiYm9keV95YXdfdGlja3MiOjQuMCwiZGVsYXkiOmZhbHNlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfcmFuZG9tX21heCI6MTIuMCwiZGVsYXlfcmFuZG9tX21pbiI6NC4wLCJkZWxheV90aWNrcyI6OC4wLCJmYWtlbGFnIjowLjAsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X2Zyb20iOjYwLjAsImxpbWl0X21heCI6NjAuMCwibGltaXRfbWluIjozMC4wLCJsaW1pdF9tb2RlIjoiU3RhdGljIiwibGltaXRfdG8iOjYwLjAsInBpdGNoIjoiRG93biIsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfYmFzZSI6IkF0IFRhcmdldCIsInlhd19sZWZ0IjowLjAsInlhd19tb2RlIjoiU29sbyIsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX2RlZyI6MC4wLCJ5YXdfb2Zmc2V0IjowLjAsInlhd19yaWdodCI6MC4wfSx7ImFsbG93IjpmYWxzZSwiYm9keV95YXciOnRydWUsImJvZHlfeWF3X21vZGUiOiJTdGF0aWMiLCJib2R5X3lhd19vcHRpb25zIjpbIn4iXSwiYm9keV95YXdfcmFuZG9tIjo0LjAsImJvZHlfeWF3X3RpY2tzIjo0LjAsImRlbGF5IjpmYWxzZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3JhbmRvbV9tYXgiOjEyLjAsImRlbGF5X3JhbmRvbV9taW4iOjQuMCwiZGVsYXlfdGlja3MiOjguMCwiZmFrZWxhZyI6MC4wLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9mcm9tIjo2MC4wLCJsaW1pdF9tYXgiOjYwLjAsImxpbWl0X21pbiI6MzAuMCwibGltaXRfbW9kZSI6IlN0YXRpYyIsImxpbWl0X3RvIjo2MC4wLCJwaXRjaCI6IkRpc2FibGVkIiwicmlnaHRfbGltaXQiOjYwLjAsInlhd19iYXNlIjoiTG9jYWwgVmlldyIsInlhd19sZWZ0IjowLjAsInlhd19tb2RlIjoiU29sbyIsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX2RlZyI6MC4wLCJ5YXdfb2Zmc2V0IjowLjAsInlhd19yaWdodCI6MC4wfSx7ImFsbG93IjpmYWxzZSwiYm9keV95YXciOnRydWUsImJvZHlfeWF3X21vZGUiOiJTdGF0aWMiLCJib2R5X3lhd19vcHRpb25zIjpbIn4iXSwiYm9keV95YXdfcmFuZG9tIjo0LjAsImJvZHlfeWF3X3RpY2tzIjo0LjAsImRlbGF5IjpmYWxzZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3JhbmRvbV9tYXgiOjEyLjAsImRlbGF5X3JhbmRvbV9taW4iOjQuMCwiZGVsYXlfdGlja3MiOjguMCwiZmFrZWxhZyI6MC4wLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9mcm9tIjo2MC4wLCJsaW1pdF9tYXgiOjYwLjAsImxpbWl0X21pbiI6MzAuMCwibGltaXRfbW9kZSI6IlN0YXRpYyIsImxpbWl0X3RvIjo2MC4wLCJwaXRjaCI6IkRpc2FibGVkIiwicmlnaHRfbGltaXQiOjYwLjAsInlhd19iYXNlIjoiTG9jYWwgVmlldyIsInlhd19sZWZ0IjowLjAsInlhd19tb2RlIjoiU29sbyIsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX2RlZyI6MC4wLCJ5YXdfb2Zmc2V0IjowLjAsInlhd19yaWdodCI6MC4wfSx7ImFsbG93IjpmYWxzZSwiYm9keV95YXciOnRydWUsImJvZHlfeWF3X21vZGUiOiJTdGF0aWMiLCJib2R5X3lhd19vcHRpb25zIjpbIkppdHRlciIsIn4iXSwiYm9keV95YXdfcmFuZG9tIjo0LjAsImJvZHlfeWF3X3RpY2tzIjo0LjAsImRlbGF5IjpmYWxzZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3JhbmRvbV9tYXgiOjEyLjAsImRlbGF5X3JhbmRvbV9taW4iOjQuMCwiZGVsYXlfdGlja3MiOjguMCwiZmFrZWxhZyI6MC4wLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsaW1pdF9mcm9tIjo2MC4wLCJsaW1pdF9tYXgiOjYwLjAsImxpbWl0X21pbiI6MzAuMCwibGltaXRfbW9kZSI6IlN0YXRpYyIsImxpbWl0X3RvIjo2MC4wLCJwaXRjaCI6IkRvd24iLCJyaWdodF9saW1pdCI6NjAuMCwieWF3X2Jhc2UiOiJBdCBUYXJnZXQiLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kZSI6IlNvbG8iLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH1dLFseyJib2R5X3lhdyI6dHJ1ZSwiYm9keV95YXdfbW9kZSI6IlN0YXRpYyIsImJvZHlfeWF3X29wdGlvbnMiOlsiSml0dGVyIiwiUmFuZG9taXplIEppdHRlciIsIn4iXSwiYm9keV95YXdfcmFuZG9tIjo0LjAsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJkZWxheSI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiUmFuZG9tIiwiZGVsYXlfcmFuZG9tX21heCI6Ny4wLCJkZWxheV9yYW5kb21fbWluIjo2LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4IjozOS4wLCJsaW1pdF9taW4iOjI4LjAsImxpbWl0X21vZGUiOiJSYW5kb20iLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEb3duIiwicmlnaHRfbGltaXQiOjYwLjAsInlhd19iYXNlIjoiQXQgVGFyZ2V0IiwieWF3X2xlZnQiOi0xOC4wLCJ5YXdfbW9kZSI6IkwvUiIsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX2RlZyI6MC4wLCJ5YXdfb2Zmc2V0IjowLjAsInlhd19yaWdodCI6MzYuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfYmFzZSI6IkxvY2FsIFZpZXciLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kZSI6IlNvbG8iLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfYmFzZSI6IkxvY2FsIFZpZXciLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kZSI6IlNvbG8iLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfYmFzZSI6IkxvY2FsIFZpZXciLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kZSI6IlNvbG8iLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfYmFzZSI6IkxvY2FsIFZpZXciLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kZSI6IlNvbG8iLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NjAuMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEaXNhYmxlZCIsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfYmFzZSI6IkxvY2FsIFZpZXciLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfbW9kZSI6IlNvbG8iLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9kZWciOjAuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0seyJhbGxvdyI6ZmFsc2UsImJvZHlfeWF3Ijp0cnVlLCJib2R5X3lhd19tb2RlIjoiU3RhdGljIiwiYm9keV95YXdfb3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHlfeWF3X3JhbmRvbSI6NC4wLCJib2R5X3lhd190aWNrcyI6NC4wLCJkZWxheSI6ZmFsc2UsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9yYW5kb21fbWF4IjoxMi4wLCJkZWxheV9yYW5kb21fbWluIjo0LjAsImRlbGF5X3RpY2tzIjo4LjAsImZha2VsYWciOjAuMCwibGVmdF9saW1pdCI6NTguMCwibGltaXRfZnJvbSI6NjAuMCwibGltaXRfbWF4Ijo2MC4wLCJsaW1pdF9taW4iOjMwLjAsImxpbWl0X21vZGUiOiJTdGF0aWMiLCJsaW1pdF90byI6NjAuMCwicGl0Y2giOiJEb3duIiwicmlnaHRfbGltaXQiOjU4LjAsInlhd19iYXNlIjoiQXQgVGFyZ2V0IiwieWF3X2xlZnQiOjAuMCwieWF3X21vZGUiOiJTb2xvIiwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfZGVnIjowLjAsInlhd19vZmZzZXQiOjUuMCwieWF3X3JpZ2h0IjowLjB9LHsiYWxsb3ciOmZhbHNlLCJib2R5X3lhdyI6dHJ1ZSwiYm9keV95YXdfbW9kZSI6IlN0YXRpYyIsImJvZHlfeWF3X29wdGlvbnMiOlsifiJdLCJib2R5X3lhd19yYW5kb20iOjQuMCwiYm9keV95YXdfdGlja3MiOjQuMCwiZGVsYXkiOmZhbHNlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfcmFuZG9tX21heCI6MTIuMCwiZGVsYXlfcmFuZG9tX21pbiI6NC4wLCJkZWxheV90aWNrcyI6OC4wLCJmYWtlbGFnIjowLjAsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X2Zyb20iOjYwLjAsImxpbWl0X21heCI6NjAuMCwibGltaXRfbWluIjozMC4wLCJsaW1pdF9tb2RlIjoiU3RhdGljIiwibGltaXRfdG8iOjYwLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJyaWdodF9saW1pdCI6NjAuMCwieWF3X2Jhc2UiOiJMb2NhbCBWaWV3IiwieWF3X2xlZnQiOjAuMCwieWF3X21vZGUiOiJTb2xvIiwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfZGVnIjowLjAsInlhd19vZmZzZXQiOjAuMCwieWF3X3JpZ2h0IjowLjB9LHsiYWxsb3ciOmZhbHNlLCJib2R5X3lhdyI6dHJ1ZSwiYm9keV95YXdfbW9kZSI6IlN0YXRpYyIsImJvZHlfeWF3X29wdGlvbnMiOlsifiJdLCJib2R5X3lhd19yYW5kb20iOjQuMCwiYm9keV95YXdfdGlja3MiOjQuMCwiZGVsYXkiOmZhbHNlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfcmFuZG9tX21heCI6MTIuMCwiZGVsYXlfcmFuZG9tX21pbiI6NC4wLCJkZWxheV90aWNrcyI6OC4wLCJmYWtlbGFnIjowLjAsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X2Zyb20iOjYwLjAsImxpbWl0X21heCI6NjAuMCwibGltaXRfbWluIjozMC4wLCJsaW1pdF9tb2RlIjoiU3RhdGljIiwibGltaXRfdG8iOjYwLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJyaWdodF9saW1pdCI6NjAuMCwieWF3X2Jhc2UiOiJMb2NhbCBWaWV3IiwieWF3X2xlZnQiOjAuMCwieWF3X21vZGUiOiJTb2xvIiwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfZGVnIjowLjAsInlhd19vZmZzZXQiOjAuMCwieWF3X3JpZ2h0IjowLjB9LHsiYWxsb3ciOmZhbHNlLCJib2R5X3lhdyI6dHJ1ZSwiYm9keV95YXdfbW9kZSI6IlN0YXRpYyIsImJvZHlfeWF3X29wdGlvbnMiOlsifiJdLCJib2R5X3lhd19yYW5kb20iOjQuMCwiYm9keV95YXdfdGlja3MiOjQuMCwiZGVsYXkiOmZhbHNlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfcmFuZG9tX21heCI6MTIuMCwiZGVsYXlfcmFuZG9tX21pbiI6NC4wLCJkZWxheV90aWNrcyI6OC4wLCJmYWtlbGFnIjowLjAsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X2Zyb20iOjYwLjAsImxpbWl0X21heCI6NjAuMCwibGltaXRfbWluIjozMC4wLCJsaW1pdF9tb2RlIjoiU3RhdGljIiwibGltaXRfdG8iOjYwLjAsInBpdGNoIjoiRGlzYWJsZWQiLCJyaWdodF9saW1pdCI6NjAuMCwieWF3X2Jhc2UiOiJMb2NhbCBWaWV3IiwieWF3X2xlZnQiOjAuMCwieWF3X21vZGUiOiJTb2xvIiwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfZGVnIjowLjAsInlhd19vZmZzZXQiOjAuMCwieWF3X3JpZ2h0IjowLjB9LHsiYWxsb3ciOmZhbHNlLCJib2R5X3lhdyI6dHJ1ZSwiYm9keV95YXdfbW9kZSI6IlN0YXRpYyIsImJvZHlfeWF3X29wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJib2R5X3lhd19yYW5kb20iOjQuMCwiYm9keV95YXdfdGlja3MiOjQuMCwiZGVsYXkiOmZhbHNlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfcmFuZG9tX21heCI6MTIuMCwiZGVsYXlfcmFuZG9tX21pbiI6NC4wLCJkZWxheV90aWNrcyI6OC4wLCJmYWtlbGFnIjowLjAsImxlZnRfbGltaXQiOjYwLjAsImxpbWl0X2Zyb20iOjYwLjAsImxpbWl0X21heCI6NjAuMCwibGltaXRfbWluIjozMC4wLCJsaW1pdF9tb2RlIjoiU3RhdGljIiwibGltaXRfdG8iOjYwLjAsInBpdGNoIjoiRG93biIsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfYmFzZSI6IkF0IFRhcmdldCIsInlhd19sZWZ0IjowLjAsInlhd19tb2RlIjoiU29sbyIsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX2RlZyI6MC4wLCJ5YXdfb2Zmc2V0IjowLjAsInlhd19yaWdodCI6MC4wfV1dLCJsdW5hcmlzX2NvbnRyb2xzIjp7ImFhX2ZvcmNlX2JyZWFrX2xjIjpbIn4iXX0sIm1lbnUiOnsicHJlc2V0cyI6WzEuMCwidGVzdCJdLCJ3YXRlcm1hcmsiOnsiMSI6eyJjdXN0b21fY29sb3IiOiIjQ0FCRkI3RkYiLCJjdXN0b21fdGV4dCI6IkxVQVNFTlNFIElTIEJBRCIsImZvbnRfc3R5bGUiOiJTdGF0aWMiLCJncmFkaWVudF9jb2xvciI6IiNBQUQ0RkZGRiIsImdyYWRpZW50X3NwZWVkIjozLjAsInBvc2l0aW9uIjoiTGVmdCIsInJhaW5ib3ciOmZhbHNlLCJ1cHBlcmNhc2UiOnRydWUsInVzZV9ncmFkaWVudCI6ZmFsc2V9LCIyIjp7ImN1c3RvbV9jb2xvciI6IiNGRkZGRkZGRiIsImN1c3RvbV90ZXh0IjoiTHVuYXJpcyBTaWRlYmFyIiwiZW5hYmxlIjpmYWxzZSwiZ3JhZGllbnRfY29sb3IiOiIjQUFEMEZGRkYiLCJncmFkaWVudF9zcGVlZCI6My4wLCJyYWluYm93IjpmYWxzZSwidXNlX2dyYWRpZW50IjpmYWxzZX19fSwibWlzY19jb250cm9scyI6eyJhYV9hYmZfbW9kZSI6Ik1ldGEiLCJhYV9hbnRpX2JydXRlZm9yY2UiOnRydWUsImFhX2JhY2tzdGFiIjp0cnVlLCJhYV9jb25kaXRpb25fbGlzdCI6Ikdsb2JhbHMiLCJhYV9mcmVlc3RhbmRpbmciOmZhbHNlLCJhYV9mc19ib2R5Ijp0cnVlLCJhYV9mc19kaXNhYmxlX3lhd19tb2QiOnRydWUsImFhX21hbnVhbF9zdGF0aWMiOmZhbHNlLCJhYV9tYW51YWxfeWF3IjoiRGlzYWJsZWQiLCJhYV90ZWFtX2xpc3QiOjEuMCwiYWltX2ZkX2ZyZWV6ZXRpbWUiOnRydWUsImFpbV9sb2dfZXZlbnRzIjp0cnVlLCJhaW1fbG9nX21haW5fY2xyIjoiI0ZGRkZGRkZGIiwiYWltX2xvZ19ub3RpZnkiOnRydWUsImFpbV9sb2dfcHJlZml4X2NsciI6IiNBQUQ0RkZGRiIsImFpbV91bmxvY2tfZmRfc3BlZWQiOnRydWUsImFpbV91bmxvY2tfbGF0ZW5jeSI6ZmFsc2UsImFuaW1fZmFsbCI6MC4wLCJhbmltX2ppdHRlcl9sZWdzIjpmYWxzZSwiYW5pbV9qbF9lbmQiOjQ2LjAsImFuaW1famxfc3RhcnQiOjEwMC4wLCJhbmltX2xlYW4iOjEwMC4wLCJtdl9hdm9pZF9mYWxsIjp0cnVlLCJtdl9mYXN0X2xhZGRlciI6dHJ1ZX0sInZpcyI6eyJhcnJvd3NfY29sb3IiOiIjRkZGRkZGRkYiLCJhcnJvd3NfZGlzdCI6MzUuMCwiYXJyb3dzX2VuYWJsZSI6ZmFsc2UsImFycm93c19mb250IjoiU3RhdGljIiwiYXJyb3dzX3N5bV9iIjoiXiIsImFycm93c19zeW1fbCI6IjwiLCJhcnJvd3Nfc3ltX3IiOiI+IiwiYXNwZWN0X2VuYWJsZSI6dHJ1ZSwiYXNwZWN0X3ZhbCI6MTMwLjAsImRtZ19hbHdheXMiOnRydWUsImRtZ19jb2xvciI6IiNGRkZGRkZGRiIsImRtZ19lbmFibGUiOnRydWUsImRtZ19wb3NfeCI6OTY3LjAsImRtZ19wb3NfeSI6NTIwLjAsImhpdG1hcmsiOlsifiJdLCJoaXRtYXJrX2NvbG9yXzJkIjoiI0RDRkY1QUZGIiwiaGl0bWFya19jb2xvcl8zZCI6IiM1MEEwRkZGRiIsImhpdG1hcmtfZHVyIjoxMC4wLCJub19zbGVldmVzIjp0cnVlLCJzY29wZV9hbmltYXRlIjpmYWxzZSwic2NvcGVfY29sb3JfaW5uZXIiOiIjN0Q3RDdERkYiLCJzY29wZV9jb2xvcl9vdXRlciI6IiMwMDAwMDAwMCIsInNjb3BlX2VuYWJsZSI6dHJ1ZSwic2NvcGVfZ2FwIjo1LjAsInNjb3BlX2xlbmd0aCI6MjE1LjAsInNjb3BlX29wdHMiOlsifiJdLCJ0cmFuc3BhcmVuY3lfZW5hYmxlIjp0cnVlLCJ2ZWx3YXJuX2NvbG9yIjoiI0IxQjFCMUZGIiwidmVsd2Fybl9lbmFibGUiOmZhbHNlLCJ2bV9lbmFibGUiOnRydWUsInZtX2ZvdiI6NjgwLjAsInZtX2hhbmQiOnRydWUsInZtX3giOi02LjAsInZtX3kiOi00LjAsInZtX3oiOjEwLjB9fQ=="

	return var_4_3
end

function slot_0_29_0(arg_5_0)
	files.write(slot_0_11_0, json.stringify(arg_5_0))
end

function slot_0_30_0(arg_6_0)
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_0) do
		table.insert(var_6_0, tostring(iter_6_0))
	end

	table.sort(var_6_0)

	return var_6_0
end

slot_0_31_0 = slot_0_28_0()
slot_0_32_0 = slot_0_30_0(slot_0_31_0)
slot_0_33_0 = slot_0_7_0.main_preset:list("Presets", #slot_0_32_0 > 0 and slot_0_32_0 or {
	slot_0_21_0
})
slot_0_34_0 = slot_0_7_0.main_preset:input("Preset Name", "")

function slot_0_35_0()
	local var_7_0 = slot_0_33_0:get()

	if not var_7_0 then
		return nil
	end

	local var_7_1 = tonumber(var_7_0)

	if var_7_1 then
		local var_7_2 = slot_0_33_0:list()

		if var_7_2 and var_7_2[var_7_1] then
			return tostring(var_7_2[var_7_1])
		end

		return nil
	end

	return tostring(var_7_0)
end

function slot_0_36_0()
	local var_8_0 = slot_0_35_0()

	if not var_8_0 or var_8_0 == slot_0_21_0 then
		return nil
	end

	if slot_0_31_0[var_8_0] then
		return var_8_0
	end

	return nil
end

function slot_0_37_0()
	slot_0_32_0 = slot_0_30_0(slot_0_31_0)

	if #slot_0_32_0 == 0 then
		slot_0_33_0:update({
			slot_0_21_0
		})
	else
		slot_0_33_0:update(slot_0_32_0)
	end
end

function slot_0_38_0()
	local var_10_0 = slot_0_36_0() ~= nil

	if slot_0_24_0.load_btn then
		slot_0_24_0.load_btn:disabled(not var_10_0)
	end

	if slot_0_24_0.export_btn then
		slot_0_24_0.export_btn:disabled(not var_10_0)
	end

	if slot_0_24_0.delete_btn then
		slot_0_24_0.delete_btn:disabled(not var_10_0)
	end
end

function slot_0_39_0()
	local var_11_0 = slot_0_36_0()

	if var_11_0 then
		slot_0_34_0:set(var_11_0)
	end
end

function slot_0_40_0(arg_12_0)
	local var_12_0 = slot_0_25_0(arg_12_0)

	if var_12_0 < slot_0_22_0 or var_12_0 > slot_0_23_0 then
		slot_0_16_0("Preset name must be " .. slot_0_22_0 .. "-" .. slot_0_23_0 .. " chars")

		return false
	end

	return true
end

function slot_0_41_0()
	if slot_0_18_0 then
		slot_0_18_0()
	end

	if slot_0_24_0.full_config_handle and type(slot_0_24_0.full_config_handle.save) == "function" then
		local var_13_0, var_13_1 = pcall(slot_0_24_0.full_config_handle.save, slot_0_24_0.full_config_handle)

		if var_13_0 and type(var_13_1) == "table" then
			return var_13_1
		end
	end

	return slot_0_2_0.save()
end

function slot_0_42_0(arg_14_0)
	if slot_0_18_0 then
		slot_0_18_0()
	end

	if type(arg_14_0) ~= "table" then
		return false
	end

	if type(arg_14_0.pui) == "table" then
		slot_0_2_0.load(arg_14_0.pui)

		return true
	end

	if slot_0_24_0.full_config_handle and type(slot_0_24_0.full_config_handle.load) == "function" and pcall(slot_0_24_0.full_config_handle.load, slot_0_24_0.full_config_handle, arg_14_0) then
		return true
	end

	slot_0_2_0.load(arg_14_0)

	return true
end

function slot_0_43_0()
	local var_15_0 = slot_0_27_0(slot_0_34_0:get())

	if var_15_0 == "Agressive" then
		print("[Lunaris] Cannot overwrite built-in preset.")
		slot_0_16_0("Built-in preset protected")

		return
	end

	if var_15_0 == "" then
		var_15_0 = slot_0_36_0() or ""
	end

	if var_15_0 == "" then
		print("[Lunaris] Enter a preset name first.")
		slot_0_16_0("Invalid preset name")

		return
	end

	if not slot_0_40_0(var_15_0) then
		return
	end

	if not slot_0_31_0[var_15_0] then
		local var_15_1 = 0

		for iter_15_0 in pairs(slot_0_31_0) do
			var_15_1 = var_15_1 + 1
		end

		if var_15_1 >= 4 then
			print("[Lunaris] Maximum of 4 presets reached.")

			return
		end
	end

	local var_15_2 = slot_0_41_0()
	local var_15_3 = slot_0_5_0.encode(json.stringify(var_15_2))

	slot_0_31_0[var_15_0] = var_15_3

	slot_0_29_0(slot_0_31_0)
	slot_0_37_0()
	slot_0_34_0:set(var_15_0)
	print("[Lunaris] Preset '" .. var_15_0 .. "' saved.")
	slot_0_16_0("Saved: " .. var_15_0)
end

function slot_0_44_0()
	local var_16_0 = slot_0_36_0()

	if not var_16_0 then
		print("[Lunaris] No preset selected.")
		slot_0_16_0("No preset selected")

		return
	end

	local var_16_1 = slot_0_31_0[var_16_0]

	if not var_16_1 then
		print("[Lunaris] Preset '" .. var_16_0 .. "' not found.")
		slot_0_16_0("Preset not found")

		return
	end

	local var_16_2, var_16_3 = pcall(slot_0_5_0.decode, var_16_1)

	if not var_16_2 or not var_16_3 then
		print("[Lunaris] Failed to decode preset.")
		slot_0_16_0("Decode failed")

		return
	end

	local var_16_4, var_16_5 = pcall(json.parse, var_16_3)

	if not var_16_4 or type(var_16_5) ~= "table" then
		print("[Lunaris] Invalid preset data.")
		slot_0_16_0("Invalid preset")

		return
	end

	if not pcall(slot_0_42_0, var_16_5) then
		print("[Lunaris] Failed to apply preset snapshot.")
		slot_0_16_0("Apply failed")

		return
	end

	slot_0_38_0()
	slot_0_34_0:set(var_16_0)
	print("[Lunaris] Preset '" .. var_16_0 .. "' loaded.")
	slot_0_16_0("Loaded: " .. var_16_0)
end

function slot_0_45_0()
	local var_17_0 = slot_0_36_0()

	if not var_17_0 then
		print("[Lunaris] No preset selected.")
		slot_0_16_0("No preset selected")

		return
	end

	local var_17_1 = slot_0_31_0[var_17_0]

	if not var_17_1 then
		print("[Lunaris] Preset '" .. var_17_0 .. "' not found.")
		slot_0_16_0("Preset not found")

		return
	end

	slot_0_3_0.set(var_17_1)
	print("[Lunaris] Preset '" .. var_17_0 .. "' exported to clipboard.")
	slot_0_16_0("Exported: " .. var_17_0)
end

function slot_0_46_0()
	local var_18_0 = slot_0_26_0(slot_0_3_0.get())

	if var_18_0 == "" then
		print("[Lunaris] Clipboard is empty.")
		slot_0_16_0("Clipboard empty")

		return
	end

	local var_18_1, var_18_2 = pcall(slot_0_5_0.decode, var_18_0)

	if not var_18_1 or not var_18_2 or #var_18_2 == 0 then
		print("[Lunaris] Invalid base64 data in clipboard.")
		slot_0_16_0("Invalid base64")

		return
	end

	local var_18_3, var_18_4 = pcall(json.parse, var_18_2)

	if not var_18_3 or type(var_18_4) ~= "table" then
		print("[Lunaris] Invalid preset data in clipboard.")
		slot_0_16_0("Invalid preset data")

		return
	end

	local var_18_5 = slot_0_27_0(slot_0_34_0:get())

	if var_18_5 == "Agressive" then
		print("[Lunaris] Cannot overwrite built-in preset.")
		slot_0_16_0("Built-in preset protected")

		return
	end

	if var_18_5 == "" then
		var_18_5 = slot_0_36_0() or "Import_" .. os.date("%H%M%S")
	end

	if not slot_0_40_0(var_18_5) then
		return
	end

	if not slot_0_31_0[var_18_5] then
		local var_18_6 = 0

		for iter_18_0 in pairs(slot_0_31_0) do
			var_18_6 = var_18_6 + 1
		end

		if var_18_6 >= 4 then
			print("[Lunaris] Maximum of 4 presets reached.")

			return
		end
	end

	slot_0_31_0[var_18_5] = var_18_0

	slot_0_29_0(slot_0_31_0)
	slot_0_37_0()
	slot_0_34_0:set(var_18_5)
	print("[Lunaris] Imported preset: " .. var_18_5)
	slot_0_16_0("Imported: " .. var_18_5)
end

function slot_0_47_0()
	local var_19_0 = slot_0_36_0()

	if not var_19_0 then
		print("[Lunaris] No preset selected.")
		slot_0_16_0("No preset selected")

		return
	end

	if var_19_0 == "Agressive" then
		print("[Lunaris] Cannot delete built-in preset.")
		slot_0_16_0("Built-in preset protected")

		return
	end

	slot_0_31_0[var_19_0] = nil

	slot_0_29_0(slot_0_31_0)
	slot_0_37_0()
	print("[Lunaris] Preset '" .. var_19_0 .. "' deleted.")
	slot_0_16_0("Deleted: " .. var_19_0)
end

slot_0_48_0 = {
	main = {
		slot_0_7_0.main_info:label("\f<star>  Version"),
		slot_0_7_0.main_info:button("\f<code-branch>  v0.1", nil, true),
		slot_0_7_0.main_info:label("\f<user>  User"),
		slot_0_7_0.main_info:button(common.get_username(), nil, true),
		slot_0_7_0.main_info:label("\aFFA500FF\f<bug>\r  Encounter any Bugs?"),
		discord = slot_0_7_0.main_info:button("\f<discord>  Join Us!", function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/SqWtj5ZCxR")
		end, true)
	},
	watermark = {
		slot_0_7_0.main_wm:label("\f<droplet>  Watermark", function(arg_21_0)
			return {
				position = arg_21_0:combo("Position", {
					"Left",
					"Bottom",
					"Right"
				}, "Right"),
				font_style = arg_21_0:combo("Font Style", {
					"Default",
					"Small",
					"Console",
					"Bold"
				}, "Default"),
				uppercase = arg_21_0:switch("Uppercase", false),
				custom_text = arg_21_0:input("Text", "Lunaris"),
				custom_color = arg_21_0:color_picker("Text Color", color(255, 255, 255)),
				use_gradient = arg_21_0:switch("Gradient", false),
				gradient_color = arg_21_0:color_picker("Gradient Color", color(170, 212, 255)),
				gradient_speed = arg_21_0:slider("Speed", 1, 10, 3, 1),
				rainbow = arg_21_0:switch("\f<rainbow>  Rainbow", false)
			}
		end),
		slot_0_7_0.main_wm:label("\f<moon>  Sidebar", function(arg_22_0)
			return {
				enable = arg_22_0:switch("Enable Sidebar", false),
				custom_text = arg_22_0:input("Title Text", "Lunaris"),
				custom_color = arg_22_0:color_picker("Title Color", color(255, 255, 255)),
				use_gradient = arg_22_0:switch("Gradient", false),
				gradient_color = arg_22_0:color_picker("Gradient Color", color(170, 212, 255)),
				gradient_speed = arg_22_0:slider("Speed", 1, 10, 3, 1),
				rainbow = arg_22_0:switch("\f<rainbow>  Rainbow", false)
			}
		end)
	},
	presets = {
		slot_0_33_0,
		slot_0_34_0,
		save_btn = slot_0_7_0.main_preset:button("\f<plus>  save", function()
			slot_0_43_0()
		end, true),
		import_btn = slot_0_7_0.main_preset:button("\f<upload>  import", function()
			slot_0_46_0()
		end, true),
		export_btn = slot_0_7_0.main_preset:button("\f<download>  export", function()
			slot_0_45_0()
		end, true),
		load_btn = slot_0_7_0.main_preset:button("\f<plus>  load", function()
			slot_0_44_0()
		end, true),
		delete_btn = slot_0_7_0.main_preset:button("\aFF3333FF                                 \f<trash-can>\r Delete                                 ", function()
			slot_0_47_0()
		end, true)
	},
	changelog = {},
	antiaim = {},
	aa_builder = {},
	aa_snap = {},
	aa_tweaks = {},
	visuals = {},
	misc = {}
}
slot_0_49_0 = {}

for iter_0_0, iter_0_1 in pairs(slot_0_48_0) do
	if type(iter_0_1) == "table" then
		for iter_0_2, iter_0_3 in pairs(iter_0_1) do
			table.insert(slot_0_49_0, iter_0_3)
		end
	else
		table.insert(slot_0_49_0, iter_0_1)
	end
end

slot_0_2_0.setup(slot_0_49_0, true)

slot_0_24_0.load_btn = slot_0_48_0.presets.load_btn
slot_0_24_0.export_btn = slot_0_48_0.presets.export_btn
slot_0_24_0.delete_btn = slot_0_48_0.presets.delete_btn

slot_0_33_0:set_callback(function()
	slot_0_39_0()
	slot_0_38_0()
end, true)
slot_0_34_0:set_callback(function()
	slot_0_38_0()
end, true)
slot_0_37_0()
slot_0_38_0()

slot_0_50_0 = slot_0_48_0.watermark[1]
slot_0_51_0 = slot_0_7_0.main_wm:slider("wm_x", 0, 3840, 0, 1)
slot_0_52_0 = slot_0_7_0.main_wm:slider("wm_y", 0, 2160, 0, 1)

slot_0_51_0:visibility(false)
slot_0_52_0:visibility(false)

function slot_0_53_0(arg_30_0, arg_30_1)
	return render.load_font("Calibri", arg_30_0, arg_30_1 or "a")
end

function slot_0_54_0(arg_31_0, arg_31_1)
	return render.load_font("Calibri", arg_31_0, arg_31_1 or "ab")
end

print("[Lunaris] Calibri font loaded.")

slot_0_55_0 = slot_0_54_0(14, "a")

function slot_0_16_0(arg_32_0)
	local var_32_0 = {
		{
			is_prefix = true,
			text = "Lunaris"
		},
		{
			colored = false,
			text = " · "
		},
		{
			colored = true,
			text = arg_32_0
		}
	}

	table.insert(slot_0_17_0, 1, {
		is_hit = false,
		time = globals.realtime,
		parts = var_32_0
	})
end

slot_0_56_0 = {
	Console = 3,
	Small = 2,
	Default = 1,
	Bold = 4
}

function slot_0_57_0()
	local var_33_0 = slot_0_48_0.watermark[1]

	if var_33_0 and var_33_0.font_style then
		local var_33_1 = var_33_0.font_style:get()

		return slot_0_56_0[var_33_1] or 1
	end

	return 1
end

slot_0_58_0 = slot_0_4_0.text_animate("Lunaris", 3, {
	color(255, 255, 255),
	color(170, 212, 255)
})
slot_0_59_0 = slot_0_4_0.text_animate("Lunaris", 3, {
	color(255, 255, 255),
	color(170, 212, 255)
})
slot_0_60_0 = {
	color(255, 0, 0),
	color(255, 80, 0),
	color(255, 165, 0),
	color(255, 210, 0),
	color(255, 255, 0),
	color(180, 255, 0),
	color(0, 255, 0),
	color(0, 255, 128),
	color(0, 220, 255),
	color(0, 150, 255),
	color(0, 80, 255),
	color(100, 0, 255),
	color(180, 0, 255),
	color(255, 0, 200),
	color(255, 0, 100)
}
slot_0_61_0 = 12
slot_0_62_0 = 6
slot_0_63_0 = 12

function slot_0_64_0(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	local var_34_0
	local var_34_1

	if arg_34_0 == "Left" then
		var_34_0 = slot_0_63_0
		var_34_1 = (arg_34_1.y - arg_34_3) / 2
	elseif arg_34_0 == "Bottom" then
		var_34_0 = (arg_34_1.x - arg_34_2) / 2
		var_34_1 = arg_34_1.y - arg_34_3 - slot_0_63_0
	else
		var_34_0 = arg_34_1.x - arg_34_2 - slot_0_63_0
		var_34_1 = (arg_34_1.y - arg_34_3) / 2
	end

	return var_34_0, var_34_1
end

slot_0_65_0 = nil

function slot_0_66_0()
	local var_35_0 = render.screen_size()

	if not var_35_0 or var_35_0.x < 1 then
		return
	end

	local var_35_1 = slot_0_48_0.watermark[1]
	local var_35_2 = var_35_1.position:get()
	local var_35_3
	local var_35_4
	local var_35_5 = var_35_1.custom_text:get() or "Lunaris"

	if #var_35_5 == 0 then
		var_35_5 = "Lunaris"
	end

	if var_35_1.uppercase and var_35_1.uppercase:get() then
		var_35_5 = string.upper(var_35_5)
	end

	local var_35_6 = slot_0_57_0()
	local var_35_7 = render.measure_text(var_35_6, nil, var_35_5)
	local var_35_8 = var_35_7.x
	local var_35_9 = var_35_7.y
	local var_35_10, var_35_11 = slot_0_64_0(var_35_2, var_35_0, var_35_8, var_35_9)
	local var_35_12 = math.floor(var_35_10)
	local var_35_13 = math.floor(var_35_11)

	slot_0_51_0:set(var_35_12)
	slot_0_52_0:set(var_35_13)

	if slot_0_65_0 then
		slot_0_65_0.position = vector(var_35_12, var_35_13)
	end
end

slot_0_50_0.position:set_callback(function()
	slot_0_66_0()
end)

slot_0_65_0 = slot_0_6_0.register({
	slot_0_51_0,
	slot_0_52_0
}, vector(200, 24), "lunaris_watermark", function(arg_37_0)
	local var_37_0 = render.screen_size()
	local var_37_1 = slot_0_48_0.watermark[1]
	local var_37_2 = arg_37_0.position
	local var_37_3 = var_37_1.custom_text:get() or "Lunaris"

	if #var_37_3 == 0 then
		return
	end

	if var_37_1.uppercase and var_37_1.uppercase:get() then
		var_37_3 = string.upper(var_37_3)
	end

	local var_37_4 = var_37_1.custom_color:get()
	local var_37_5 = var_37_1.gradient_color:get()

	var_37_4 = var_37_4 or color(255, 255, 255)
	var_37_5 = var_37_5 or color(170, 212, 255)

	local var_37_6 = var_37_1.use_gradient:get()
	local var_37_7 = var_37_1.rainbow:get()
	local var_37_8 = var_37_1.gradient_speed:get() or 3
	local var_37_9
	local var_37_10 = var_37_4

	if var_37_6 and #var_37_3 >= 2 then
		slot_0_59_0:set_text(var_37_3)

		if var_37_7 then
			slot_0_59_0:set_colors(slot_0_60_0)
		else
			slot_0_59_0:set_colors({
				var_37_4,
				var_37_5
			})
		end

		slot_0_59_0:set_speed(11 - var_37_8)
		slot_0_59_0:animate()

		local var_37_11, var_37_12 = pcall(slot_0_59_0.get_animated_text, slot_0_59_0)

		var_37_9 = var_37_11 and var_37_12 or var_37_3
	else
		var_37_9 = var_37_3
	end

	local var_37_13 = slot_0_57_0()
	local var_37_14 = render.measure_text(var_37_13, nil, var_37_9)

	arg_37_0.size = vector(var_37_14.x, var_37_14.y)

	render.text(var_37_13, vector(var_37_2.x, var_37_2.y), var_37_10, nil, var_37_9)
end)

function slot_0_67_0()
	slot_0_65_0:update()
end

slot_0_66_0()

slot_0_68_0 = slot_0_4_0.text_animate("Lunaris", 3, {
	color(255, 255, 255),
	color(170, 212, 255)
})

function slot_0_69_0()
	local var_39_0 = slot_0_48_0.watermark[2]
	local var_39_1 = ui.get_icon("moon")

	if not var_39_0.enable:get() then
		ui.sidebar("Lunaris", var_39_1)

		return
	end

	local var_39_2 = var_39_0.custom_text:get() or "Lunaris"

	if #var_39_2 == 0 then
		var_39_2 = "Lunaris"
	end

	local var_39_3 = var_39_0.custom_color:get() or color(255, 255, 255)
	local var_39_4 = var_39_0.gradient_color:get() or color(170, 212, 255)
	local var_39_5 = var_39_0.use_gradient:get()
	local var_39_6 = var_39_0.rainbow:get()
	local var_39_7 = var_39_0.gradient_speed:get() or 3

	if var_39_5 and #var_39_2 >= 2 then
		slot_0_68_0:set_text(var_39_2)

		if var_39_6 then
			slot_0_68_0:set_colors(slot_0_60_0)
		else
			slot_0_68_0:set_colors({
				var_39_3,
				var_39_4
			})
		end

		slot_0_68_0:set_speed(11 - var_39_7)
		slot_0_68_0:animate()

		local var_39_8, var_39_9 = pcall(slot_0_68_0.get_animated_text, slot_0_68_0)

		if var_39_8 and var_39_9 then
			ui.sidebar(var_39_9, var_39_1)
		else
			ui.sidebar(var_39_2, var_39_1)
		end
	else
		ui.sidebar(var_39_2, var_39_1)
	end
end

for iter_0_4, iter_0_5 in pairs(slot_0_48_0.watermark[2]) do
	if type(iter_0_5) == "table" and type(iter_0_5.set_callback) == "function" then
		iter_0_5:set_callback(function()
			pcall(slot_0_69_0)
		end, true)
	end
end

slot_0_70_0 = {
	"Globals",
	"Standing",
	"Moving",
	"Slowwalk",
	"Crouching",
	"Move & Crouch",
	"Air",
	"Air & Crouch",
	"Manual",
	"Freestanding"
}
slot_0_71_0 = {
	"\aFF5E5EFF\r Terrorists",
	"\a5E90FFFF\r Counter-Terrorists"
}
slot_0_72_0 = {
	{},
	{}
}

slot_0_7_0.aa_select:label("\f<moon>  Anti-Aim")
slot_0_7_0.aa_select:label("\f<users>  Team Selection")

slot_0_73_0 = slot_0_7_0.aa_select:list("Team", slot_0_71_0):depend()

slot_0_7_0.aa_select:label("\f<list>  Select the state to configure.")

slot_0_74_0 = slot_0_7_0.aa_select:combo("State", slot_0_70_0):depend()
slot_0_75_0 = slot_0_7_0.aa_builder:combo("\f<arrows-left-right>  Global Yaw", {
	"Backward",
	"Forward",
	"Right",
	"Left",
	"Spin"
}, "Backward"):depend({
	slot_0_74_0,
	"Globals"
})
slot_0_76_1 = nil

function slot_0_77_0(arg_41_0, arg_41_1)
	slot_41_2_0 = slot_0_70_0[arg_41_1]
	slot_41_3_0 = arg_41_0 == 1 and "_T" or "_CT"
	slot_41_4_0 = arg_41_1 == 1
	slot_41_5_0 = "##" .. slot_41_2_0 .. slot_41_3_0
	slot_41_6_0 = {}
	slot_41_7_0 = {
		{
			slot_0_73_0,
			arg_41_0
		},
		{
			slot_0_74_0,
			slot_41_2_0
		}
	}

	if not slot_41_4_0 then
		slot_41_6_0.allow = slot_0_7_0.aa_builder:switch("\f<check>  Enable " .. slot_41_2_0 .. slot_41_5_0, false):depend(table.unpack(slot_41_7_0))
	end

	function slot_41_8_0(...)
		local var_42_0 = {
			table.unpack(slot_41_7_0)
		}

		if not slot_41_4_0 then
			table.insert(var_42_0, {
				slot_41_6_0.allow,
				true
			})
		end

		for iter_42_0, iter_42_1 in ipairs({
			...
		}) do
			table.insert(var_42_0, iter_42_1)
		end

		return table.unpack(var_42_0)
	end

	slot_41_6_0.yaw_mode = slot_0_7_0.aa_builder:combo("\f<right-left>  Yaw Mode" .. slot_41_5_0, {
		"Solo",
		"L/R"
	}, "Solo"):depend(slot_41_8_0())
	slot_41_9_0 = slot_41_6_0.yaw_mode:create()
	slot_41_6_0.yaw = slot_41_9_0:slider("\f<sliders>  Yaw" .. slot_41_5_0, -180, 180, 0, 1):depend(slot_41_8_0())
	slot_41_6_0.base_yaw_state = slot_41_9_0:combo("\f<arrows-left-right>  Base Yaw" .. slot_41_5_0, {
		"Global",
		"Backward",
		"Forward",
		"Right",
		"Left",
		"Spin"
	}, "Global"):depend(slot_41_8_0())
	slot_41_6_0.pitch = slot_41_9_0:combo("\f<arrows-up-down>  Pitch" .. slot_41_5_0, {
		"Disabled",
		"Down",
		"Fake Up",
		"Fake Down"
	}, "Down"):depend(slot_41_8_0())
	slot_41_6_0.yaw_base = slot_41_9_0:combo("\f<compass>  Yaw Base" .. slot_41_5_0, {
		"Local View",
		"At Target"
	}, "At Target"):depend(slot_41_8_0())
	slot_41_6_0.yaw_offset = slot_41_9_0:slider("\f<sliders>  Yaw Offset" .. slot_41_5_0, -180, 180, 0, 1):depend(slot_41_8_0({
		slot_41_6_0.yaw_mode,
		"Solo"
	}))
	slot_41_6_0.yaw_left = slot_41_9_0:slider("\f<arrow-left>  Left Offset" .. slot_41_5_0, -180, 180, 0, 1):depend(slot_41_8_0({
		slot_41_6_0.yaw_mode,
		"L/R"
	}))
	slot_41_6_0.yaw_right = slot_41_9_0:slider("\f<arrow-right>  Right Offset" .. slot_41_5_0, -180, 180, 0, 1):depend(slot_41_8_0({
		slot_41_6_0.yaw_mode,
		"L/R"
	}))
	slot_41_6_0.yaw_modifier = slot_0_7_0.aa_builder:combo("   \a5E90FFFF\r Modifier" .. slot_41_5_0, {
		"Disabled",
		"Center",
		"Offset",
		"Random",
		"Spin",
		"5-Way"
	}, "Disabled"):depend(slot_41_8_0())
	slot_41_10_0 = slot_41_6_0.yaw_modifier:create()
	slot_41_6_0.yaw_modifier_deg = slot_41_10_0:slider("\f<rotate>  Modifier Degree" .. slot_41_5_0, -180, 180, 0, 1):depend(slot_41_8_0({
		slot_41_6_0.yaw_modifier,
		"Disabled",
		true
	}))
	slot_41_6_0.delay = slot_41_10_0:switch("\f<stopwatch>  Delay" .. slot_41_5_0, false):depend(slot_41_8_0({
		slot_41_6_0.yaw_mode,
		"L/R"
	}))
	slot_41_6_0.delay_method = slot_41_10_0:combo("\f<gauge>  Delay Method" .. slot_41_5_0, {
		"Default",
		"Random"
	}, "Default"):depend(slot_41_8_0({
		slot_41_6_0.yaw_mode,
		"L/R"
	}, {
		slot_41_6_0.delay,
		true
	}))
	slot_41_6_0.delay_ticks = slot_41_10_0:slider("\f<clock>  Delay Ticks" .. slot_41_5_0, 2, 22, 8, 1):depend(slot_41_8_0({
		slot_41_6_0.yaw_mode,
		"L/R"
	}, {
		slot_41_6_0.delay,
		true
	}, {
		slot_41_6_0.delay_method,
		"Default"
	}))
	slot_41_6_0.delay_random_min = slot_41_10_0:slider("\f<arrow-down>  Min Ticks" .. slot_41_5_0, 2, 22, 4, 1):depend(slot_41_8_0({
		slot_41_6_0.yaw_mode,
		"L/R"
	}, {
		slot_41_6_0.delay,
		true
	}, {
		slot_41_6_0.delay_method,
		"Random"
	}))
	slot_41_6_0.delay_random_max = slot_41_10_0:slider("\f<arrow-up>  Max Ticks" .. slot_41_5_0, 2, 22, 12, 1):depend(slot_41_8_0({
		slot_41_6_0.yaw_mode,
		"L/R"
	}, {
		slot_41_6_0.delay,
		true
	}, {
		slot_41_6_0.delay_method,
		"Random"
	}))
	slot_41_6_0.body_yaw = slot_0_7_0.aa_builder:switch("\f<person>  Body Yaw" .. slot_41_5_0, true):depend(slot_41_8_0())
	slot_41_11_0 = slot_41_6_0.body_yaw:create()
	slot_41_6_0.body_yaw_mode = slot_41_11_0:combo("\f<repeat>  Body Mode" .. slot_41_5_0, {
		"Static",
		"Ticks",
		"Random"
	}, "Static"):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}))
	slot_41_6_0.body_yaw_ticks = slot_41_11_0:slider("\f<timer>  Flip Ticks" .. slot_41_5_0, 4, 16, 4, 1):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}, {
		slot_41_6_0.body_yaw_mode,
		"Ticks"
	}))
	slot_41_6_0.body_yaw_random = slot_41_11_0:slider("\f<dice>  Random Ticks" .. slot_41_5_0, 4, 16, 4, 1):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}, {
		slot_41_6_0.body_yaw_mode,
		"Random"
	}))
	slot_41_6_0.limit_mode = slot_41_11_0:combo("\f<ruler-combined>  Limit Mode" .. slot_41_5_0, {
		"Static",
		"Random",
		"From/To"
	}, "Static"):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}))
	slot_41_6_0.left_limit = slot_41_11_0:slider("\f<arrow-left>  Left Limit" .. slot_41_5_0, 0, 60, 60, 1):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}, {
		slot_41_6_0.limit_mode,
		"Static"
	}))
	slot_41_6_0.right_limit = slot_41_11_0:slider("\f<arrow-right>  Right Limit" .. slot_41_5_0, 0, 60, 60, 1):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}, {
		slot_41_6_0.limit_mode,
		"Static"
	}))
	slot_41_6_0.limit_min = slot_41_11_0:slider("\f<arrow-down>  Limit Min" .. slot_41_5_0, 0, 60, 30, 1):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}, {
		slot_41_6_0.limit_mode,
		"Random"
	}))
	slot_41_6_0.limit_max = slot_41_11_0:slider("\f<arrow-up>  Limit Max" .. slot_41_5_0, 0, 60, 60, 1):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}, {
		slot_41_6_0.limit_mode,
		"Random"
	}))
	slot_41_6_0.limit_from = slot_41_11_0:slider("\f<arrow-right-from-line>  Limit From" .. slot_41_5_0, 0, 60, 60, 1):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}, {
		slot_41_6_0.limit_mode,
		"From/To"
	}))
	slot_41_6_0.limit_to = slot_41_11_0:slider("\f<arrow-right-to-line>  Limit To" .. slot_41_5_0, 0, 60, 60, 1):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}, {
		slot_41_6_0.limit_mode,
		"From/To"
	}))
	slot_41_6_0.body_yaw_options = slot_0_7_0.aa_builder:selectable("   \a5E90FFFF\r Options" .. slot_41_5_0, {
		"Avoid Overlap",
		"Jitter",
		"Randomize Jitter"
	}):depend(slot_41_8_0({
		slot_41_6_0.body_yaw,
		true
	}))
	slot_41_6_0.fakelag = slot_0_7_0.aa_snap:slider("\f<clock>  Fake Lag" .. slot_41_5_0, 0, 14, 0, 1):depend(slot_41_8_0())

	return slot_41_6_0
end

function slot_0_76_0(arg_43_0, arg_43_1)
	if not slot_0_72_0[arg_43_0][arg_43_1] then
		slot_0_72_0[arg_43_0][arg_43_1] = slot_0_77_0(arg_43_0, arg_43_1)
	end

	return slot_0_72_0[arg_43_0][arg_43_1]
end

function slot_0_78_0()
	for iter_44_0 = 1, 2 do
		for iter_44_1 = 1, #slot_0_70_0 do
			slot_0_76_0(iter_44_0, iter_44_1)
		end
	end
end

slot_0_78_0()

slot_0_79_0 = slot_0_7_0.aa_sync_grp:combo("\f<users>  From Team", slot_0_71_0)
slot_0_80_0 = slot_0_7_0.aa_sync_grp:selectable("\f<list>  Options to Sync", {
	"Angles",
	"Jitter",
	"Body Yaw",
	"Fake Lag"
})
slot_0_81_0 = slot_0_7_0.aa_sync_grp:button("\f<arrow-right-arrow-left>  Send to Opposite Team", function()
	local var_45_0 = slot_0_79_0:get()
	local var_45_1 = var_45_0 == 1 and 2 or 1
	local var_45_2 = slot_0_80_0:get()
	local var_45_3 = {}

	if var_45_2[1] then
		for iter_45_0, iter_45_1 in ipairs({
			"yaw",
			"pitch",
			"yaw_base",
			"yaw_mode",
			"yaw_offset",
			"yaw_left",
			"yaw_right"
		}) do
			table.insert(var_45_3, iter_45_1)
		end
	end

	if var_45_2[2] then
		for iter_45_2, iter_45_3 in ipairs({
			"yaw_modifier",
			"yaw_modifier_deg",
			"delay",
			"delay_method",
			"delay_ticks",
			"delay_random_min",
			"delay_random_max"
		}) do
			table.insert(var_45_3, iter_45_3)
		end
	end

	if var_45_2[3] then
		for iter_45_4, iter_45_5 in ipairs({
			"body_yaw",
			"body_yaw_mode",
			"body_yaw_ticks",
			"body_yaw_random",
			"limit_mode",
			"left_limit",
			"right_limit",
			"limit_min",
			"limit_max",
			"limit_from",
			"limit_to",
			"body_yaw_options"
		}) do
			table.insert(var_45_3, iter_45_5)
		end
	end

	if var_45_2[4] then
		table.insert(var_45_3, "fakelag")
	end

	if #var_45_3 == 0 then
		slot_0_16_0("Nothing selected to sync!")

		return
	end

	for iter_45_6 = 1, #slot_0_70_0 do
		local var_45_4 = slot_0_76_0(var_45_0, iter_45_6)
		local var_45_5 = slot_0_76_0(var_45_1, iter_45_6)

		if var_45_4 and var_45_5 then
			for iter_45_7, iter_45_8 in ipairs(var_45_3) do
				if var_45_4[iter_45_8] and var_45_5[iter_45_8] then
					var_45_5[iter_45_8]:set(var_45_4[iter_45_8]:get())
				end
			end
		end
	end

	slot_0_16_0("Synced settings to -> " .. (var_45_1 == 1 and "T" or "CT"))
end)
slot_0_7_0.aa_force_break_lc = slot_0_7_0.aa_snap:selectable("\f<bolt-lightning>  Break LC", slot_0_70_0):depend()
slot_0_82_0 = slot_0_7_0.aa_tweaks:switch("\f<street-view>  Freestanding", false):depend()
slot_0_83_0 = slot_0_82_0:create()
slot_0_84_0 = slot_0_83_0:switch("\f<person-walking>  Body Freestanding", false):depend({
	slot_0_82_0,
	true
})
slot_0_85_0 = slot_0_83_0:switch("\f<ban>  Disable Yaw Modifiers", false):depend({
	slot_0_82_0,
	true
})
slot_0_86_0 = slot_0_7_0.aa_builder:switch("\f<bolt>  Anti-Bruteforce", false):depend()
slot_0_88_0 = slot_0_86_0:create():combo("\f<gauge>  Mode", {
	"Increasing",
	"Decreasing",
	"Meta"
}, "Meta"):depend({
	slot_0_86_0,
	true
})
slot_0_89_0 = slot_0_7_0.aa_tweaks:switch("\f<sword>  Avoid Backstab", false):depend()
slot_0_91_0 = slot_0_89_0:create():slider("\f<ruler-horizontal>  Distance", 0, 1500, 500, 10):depend({
	slot_0_89_0,
	true
})
slot_0_92_0 = slot_0_7_0.aa_tweaks:switch("\f<helmet>  Safe Head", false):depend()
slot_0_94_0 = slot_0_92_0:create():selectable("\f<list>  Conditions", {
	"Standing",
	"Moving",
	"Slowwalk",
	"Crouching",
	"Move & Crouch",
	"Air",
	"Air & Crouch",
	"Manual",
	"Freestanding"
}):depend({
	slot_0_92_0,
	true
})
slot_0_95_0 = slot_0_7_0.aa_tweaks:switch("\f<fire>  Warmup AA", false):depend()
slot_0_96_0 = slot_0_95_0:create()
slot_0_97_0 = slot_0_96_0:slider("\f<gauge-high>  Spin Speed", 1, 100, 15, 1):depend({
	slot_0_95_0,
	true
})
slot_0_98_0 = slot_0_96_0:combo("\f<arrows-left-right>  Spin Direction", {
	"Left",
	"Right",
	"Both"
}, "Left"):depend({
	slot_0_95_0,
	true
})
slot_0_99_0 = slot_0_7_0.misc_anim_grp:switch("\f<person-walking>  Jitter Legs", false)
slot_0_100_0 = slot_0_99_0:create()
slot_0_101_0 = slot_0_100_0:slider("\f<backward-step>  Start", 0, 100, 0, 0.01):depend({
	slot_0_99_0,
	true
})
slot_0_102_0 = slot_0_100_0:slider("\f<forward-step>  End", 0, 100, 0, 0.01):depend({
	slot_0_99_0,
	true
})
slot_0_103_0 = slot_0_7_0.misc_anim_grp:slider("\f<italic>  Leaning", 0, 100, 50, 1)
slot_0_104_0 = slot_0_7_0.misc_anim_grp:slider("\f<person-falling>  Falling", 0, 100, 50, 1)
slot_0_105_0 = slot_0_7_0.misc_aim_grp:switch("\f<wifi>  Unlock Fake Ping", false)

slot_0_105_0:set_callback(function(arg_46_0)
	cvar.sv_maxunlag:float(arg_46_0:get() and 2 or 0.1)
end)

slot_0_106_0 = slot_0_7_0.misc_aim_grp:switch("\f<gauge-high>  Unlock FD Speed", false)
slot_0_107_0 = slot_0_7_0.misc_aim_grp:switch("\f<snowflake>  Fakeduck on Freezetime", false)
slot_0_108_0 = slot_0_7_0.misc_aim_grp:selectable("\f<trash>  Trashtalk", {
	"Kill",
	"Death"
})
slot_0_109_0 = slot_0_7_0.misc_mv_grp:switch("\f<person-falling-burst>  Avoid Fall Damage", false)
slot_0_110_0 = slot_0_7_0.misc_mv_grp:switch("\f<arrows-up-to-line>  Fast Ladder", false)
slot_0_111_0 = slot_0_7_0.aa_tweaks:combo("\f<arrows-left-right>  Manual Yaw", {
	"Disabled",
	"Left",
	"Right",
	"Back"
}, "Disabled"):depend()
slot_0_113_0 = slot_0_111_0:create():switch("\f<lock>  Static", false):depend({
	slot_0_111_0,
	"Disabled",
	true
})
slot_0_114_0 = {
	pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
	yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
	yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
	yaw_add = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
	modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
	body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
	inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
	left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
	right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
	options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
	freestand_peek = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
	freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
	disable_yaw_mod = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
	body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
	avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
	fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"),
	slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
	leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
	fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	dt_lag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
}
slot_0_115_0 = 972
slot_0_116_0 = 0.1

function slot_0_117_0(arg_47_0)
	if not arg_47_0 or not arg_47_0:is_alive() then
		return "Globals"
	end

	if slot_0_111_0:get() ~= "Disabled" then
		return "Manual"
	end

	if slot_0_82_0:get() then
		return "Freestanding"
	end

	local var_47_0 = arg_47_0:get_anim_overlay(1)

	if var_47_0 and var_47_0.activity == slot_0_115_0 and var_47_0.weight > slot_0_116_0 then
		return "Weapon Swap"
	end

	local var_47_1 = arg_47_0.m_vecVelocity:length2d()
	local var_47_2 = arg_47_0.m_fFlags
	local var_47_3 = bit.band(var_47_2, 1) == 1
	local var_47_4 = (arg_47_0.m_flDuckAmount or 0) > 0.1

	if not var_47_3 then
		if var_47_4 then
			return "Air & Crouch"
		else
			return "Air"
		end
	end

	if slot_0_114_0.slow_walk and slot_0_114_0.slow_walk:get() then
		return "Slowwalk"
	end

	if var_47_4 then
		if var_47_1 > 2 then
			return "Move & Crouch"
		else
			return "Crouching"
		end
	elseif var_47_1 > 2 then
		return "Moving"
	else
		return "Standing"
	end
end

slot_0_118_0 = {
	active = false,
	offset = 0,
	reset_time = 0,
	last_impact = 0
}

function slot_0_119_0()
	slot_0_118_0.active = false
	slot_0_118_0.last_impact = 0
	slot_0_118_0.reset_time = 0
	slot_0_118_0.offset = 0
end

function slot_0_120_0(arg_49_0)
	if not slot_0_86_0:get() then
		return
	end

	local var_49_0 = entity.get_local_player()

	if not var_49_0 or not var_49_0:is_alive() then
		return
	end

	local var_49_1 = entity.get(arg_49_0.userid, true)

	if not var_49_1 or not var_49_1:is_alive() or var_49_1:is_dormant() or not var_49_1:is_enemy() then
		return
	end

	if slot_0_118_0.last_impact == globals.tickcount then
		return
	end

	local var_49_2 = vector(arg_49_0.x, arg_49_0.y, arg_49_0.z)
	local var_49_3 = var_49_1:get_eye_position()
	local var_49_4 = var_49_0:get_hitbox_position(0)

	if var_49_4:closest_ray_point(var_49_3, var_49_2):dist(var_49_4) > 40 then
		return
	end

	slot_0_118_0.last_impact = globals.tickcount
	slot_0_118_0.reset_time = globals.realtime + 3

	local var_49_5 = slot_0_88_0:get()

	if var_49_5 == "Increasing" then
		slot_0_118_0.offset = math.random(-5, 10)
	elseif var_49_5 == "Decreasing" then
		slot_0_118_0.offset = 5
	else
		slot_0_118_0.offset = math.random(-15, 15)
	end
end

events.bullet_impact(slot_0_120_0)

slot_0_121_0 = {
	timer = 0,
	side = false
}
slot_0_122_0 = {
	ticks = 0,
	switch = false
}
slot_0_123_0 = 0
slot_0_124_0 = {
	Back = 180,
	Right = 90,
	Left = -90
}
slot_0_125_0 = 0

function slot_0_126_0(arg_50_0)
	if false then
		for iter_50_0, iter_50_1 in pairs(slot_0_114_0) do
			if iter_50_1 then
				pcall(iter_50_1.override, iter_50_1)
			end
		end

		slot_0_119_0()

		return
	end

	slot_50_1_0 = entity.get_local_player()

	if not slot_50_1_0 or not slot_50_1_0:is_alive() then
		return
	end

	slot_50_2_0 = slot_50_1_0.m_iTeamNum == 3 and 2 or 1

	if slot_50_2_0 ~= slot_0_125_0 then
		slot_0_119_0()

		slot_0_121_0.side = false
		slot_0_121_0.timer = 0
		slot_0_122_0.switch = false
		slot_0_122_0.ticks = 0
		slot_0_125_0 = slot_50_2_0
	end

	slot_50_3_0 = slot_0_117_0(slot_50_1_0)
	slot_50_4_0 = 1

	for iter_50_2, iter_50_3 in ipairs(slot_0_70_0) do
		if slot_50_3_0 == iter_50_3 then
			slot_50_10_2 = slot_0_76_0(slot_50_2_0, iter_50_2)

			if slot_50_10_2.allow and not slot_50_10_2.allow:get() then
				slot_50_4_0 = 1

				break
			end

			slot_50_4_0 = iter_50_2

			break
		end
	end

	slot_50_5_0 = slot_0_76_0(slot_50_2_0, slot_50_4_0)
	slot_50_6_0 = slot_50_5_0.pitch:get()
	slot_50_7_0 = slot_50_5_0.base_yaw_state:get()
	slot_50_8_0 = slot_50_7_0 == "Global" and slot_0_75_0:get() or slot_50_7_0
	slot_50_9_0 = slot_50_5_0.yaw_base:get()
	slot_50_10_1 = 0
	slot_50_11_0 = slot_50_5_0.yaw_modifier:get()
	slot_50_12_0 = slot_50_5_0.yaw_modifier_deg:get()
	slot_50_13_0 = slot_50_5_0.body_yaw:get()
	slot_50_14_0 = 60
	slot_50_15_0 = 60
	slot_50_16_0 = {}
	slot_50_17_0 = slot_50_5_0.body_freestanding and slot_50_5_0.body_freestanding:get() or "Off"
	slot_50_18_0 = slot_0_82_0:get()
	slot_50_19_0 = slot_0_84_0:get()
	slot_50_20_0 = slot_0_85_0:get()
	slot_50_21_0 = false

	if slot_0_89_0:get() then
		slot_50_22_1 = math.huge
		slot_50_23_3 = slot_50_1_0:get_origin()

		for iter_50_4, iter_50_5 in ipairs(entity.get_players(true)) do
			if iter_50_5 and iter_50_5:is_alive() and not iter_50_5:is_dormant() then
				slot_50_29_0 = iter_50_5:get_origin()

				if slot_50_23_3 and slot_50_29_0 then
					slot_50_30_0 = slot_50_23_3:dist(slot_50_29_0)

					if slot_50_30_0 < slot_50_22_1 then
						slot_50_22_1 = slot_50_30_0
					end
				end
			end
		end

		if slot_50_22_1 <= slot_0_91_0:get() then
			slot_50_21_0 = true
		end
	end

	slot_50_22_0 = slot_50_5_0.yaw_mode:get()

	if slot_50_22_0 == "Solo" then
		slot_50_10_1 = slot_50_5_0.yaw_offset:get()
	elseif slot_50_22_0 == "L/R" then
		slot_50_23_2 = slot_50_5_0.yaw_left:get()
		slot_50_24_3 = slot_50_5_0.yaw_right:get()

		if slot_50_5_0.delay:get() then
			if arg_50_0.choked_commands == 0 then
				slot_0_121_0.timer = slot_0_121_0.timer + 1
				slot_50_25_3 = nil

				if slot_50_5_0.delay_method:get() == "Random" then
					slot_50_25_3 = utils.random_int(slot_50_5_0.delay_random_min:get(), slot_50_5_0.delay_random_max:get())
				else
					slot_50_25_3 = slot_50_5_0.delay_ticks:get()
				end

				if slot_0_121_0.timer >= slot_50_25_3 / 2 then
					slot_0_121_0.timer = 0
					slot_0_121_0.side = not slot_0_121_0.side
				end
			end

			rage.antiaim:inverter(slot_0_121_0.side)

			slot_50_10_1 = slot_0_121_0.side and slot_50_23_2 or slot_50_24_3
		else
			slot_50_10_1 = rage.antiaim:inverter() and slot_50_23_2 or slot_50_24_3
		end
	end

	slot_50_10_0 = slot_50_10_1 + (slot_50_5_0.yaw and slot_50_5_0.yaw:get() or 0)

	if slot_50_13_0 then
		slot_50_23_1 = slot_50_5_0.body_yaw_mode:get()

		if slot_50_23_1 == "Ticks" then
			slot_50_24_2 = slot_50_5_0.body_yaw_ticks:get()

			if globals.tickcount % slot_50_24_2 == 0 then
				slot_0_122_0.switch = not slot_0_122_0.switch
				slot_0_122_0.ticks = 0
			end

			if not slot_0_122_0.switch then
				slot_0_122_0.ticks = slot_0_122_0.ticks + 1
			end

			if slot_0_122_0.ticks >= utils.random_int(2, 6) then
				slot_0_122_0.switch = true
				slot_0_122_0.ticks = 0
			end
		elseif slot_50_23_1 == "Random" then
			slot_0_122_0.switch = globals.tickcount % slot_50_5_0.body_yaw_random:get() == 0
		end

		slot_50_24_1 = slot_50_5_0.limit_mode:get()

		if slot_50_24_1 == "Static" then
			slot_50_14_0 = slot_50_5_0.left_limit:get()
			slot_50_15_0 = slot_50_5_0.right_limit:get()
		elseif slot_50_24_1 == "Random" then
			slot_50_25_2 = slot_50_5_0.limit_min:get()
			slot_50_26_2 = slot_50_5_0.limit_max:get()
			slot_50_14_0 = math.random(slot_50_25_2, slot_50_26_2)
			slot_50_15_0 = math.random(slot_50_25_2, slot_50_26_2)
		else
			slot_50_25_1 = rage.antiaim:inverter()
			slot_50_26_1 = slot_50_5_0.limit_from:get()
			slot_50_27_0 = slot_50_5_0.limit_to:get()
			slot_50_14_0 = slot_50_25_1 and slot_50_26_1 or slot_50_27_0
			slot_50_15_0 = slot_50_25_1 and slot_50_26_1 or slot_50_27_0
		end

		slot_50_16_0 = slot_50_5_0.body_yaw_options:get()
	end

	slot_50_23_0 = slot_0_111_0:get()

	if slot_50_23_0 ~= "Disabled" then
		slot_50_10_0 = slot_0_124_0[slot_50_23_0] or 0
		slot_50_9_0 = "Local View"

		if slot_0_113_0:get() then
			slot_50_11_0 = "Disabled"
		end
	end

	if slot_0_86_0:get() then
		if slot_0_118_0.reset_time <= globals.realtime then
			slot_0_119_0()
		else
			slot_0_118_0.active = true
		end

		if slot_0_118_0.active then
			slot_50_10_0 = slot_50_10_0 + (rage.antiaim:inverter() and 1 or -1) * slot_0_118_0.offset
		end
	end

	if slot_0_92_0:get() and slot_0_94_0:get(slot_50_3_0) then
		rage.antiaim:override_hidden_pitch(89)

		slot_50_11_0 = "Disabled"
	end

	if slot_0_7_0.aa_force_break_lc:get(slot_50_3_0) and slot_50_23_0 == "Disabled" then
		if entity.get_threat(true) then
			rage.antiaim:override_hidden_pitch(89)
			rage.antiaim:override_hidden_yaw_offset(180)
		end

		if rage.exploit:get() > 0 then
			arg_50_0.force_defensive = arg_50_0.command_number % 16 == 0

			if slot_0_114_0.dt_lag then
				slot_0_114_0.dt_lag:override("On Peek")
			end
		end
	end

	slot_50_24_0 = entity.get_game_rules()

	if slot_50_24_0 and slot_50_24_0.m_bWarmupPeriod and slot_0_95_0:get() then
		slot_50_25_0 = slot_0_97_0:get()
		slot_50_26_0 = slot_0_98_0:get()

		if slot_50_26_0 == "Left" then
			slot_0_123_0 = (slot_0_123_0 + slot_50_25_0) % 360
		elseif slot_50_26_0 == "Right" then
			slot_0_123_0 = (slot_0_123_0 - slot_50_25_0) % 360
		elseif globals.tickcount % 120 < 60 then
			slot_0_123_0 = (slot_0_123_0 + slot_50_25_0) % 360
		else
			slot_0_123_0 = (slot_0_123_0 - slot_50_25_0) % 360
		end

		slot_50_10_0 = slot_0_123_0 - 180
		slot_50_11_0 = "Disabled"
		slot_50_6_0 = "Disabled"
	end

	if slot_0_114_0.pitch then
		slot_0_114_0.pitch:override(slot_50_6_0)
	end

	if slot_0_114_0.yaw then
		slot_0_114_0.yaw:override(slot_50_8_0)
	end

	if slot_0_114_0.yaw_base then
		slot_0_114_0.yaw_base:override(slot_50_9_0)
	end

	if slot_0_114_0.yaw_add then
		slot_0_114_0.yaw_add:override(slot_50_10_0)
	end

	if slot_0_114_0.yaw_modifier then
		slot_0_114_0.yaw_modifier:override(slot_50_11_0)
	end

	if slot_0_114_0.modifier_offset then
		slot_0_114_0.modifier_offset:override(slot_50_12_0)
	end

	if slot_0_114_0.body_yaw then
		slot_0_114_0.body_yaw:override(slot_50_13_0)
	end

	if slot_0_114_0.left_limit then
		slot_0_114_0.left_limit:override(slot_50_14_0)
	end

	if slot_0_114_0.right_limit then
		slot_0_114_0.right_limit:override(slot_50_15_0)
	end

	if slot_0_114_0.options then
		slot_0_114_0.options:override(slot_50_16_0)
	end

	if slot_0_114_0.freestand_peek then
		slot_0_114_0.freestand_peek:override(slot_50_17_0)
	end

	if slot_0_114_0.freestanding then
		slot_0_114_0.freestanding:override(slot_50_18_0)
	end

	if slot_0_114_0.body_freestanding then
		slot_0_114_0.body_freestanding:override(slot_50_19_0)
	end

	if slot_0_114_0.disable_yaw_mod then
		slot_0_114_0.disable_yaw_mod:override(slot_50_20_0)
	end

	if slot_0_114_0.avoid_backstab then
		slot_0_114_0.avoid_backstab:override(slot_50_21_0)
	end

	if slot_0_114_0.fakelag then
		slot_0_114_0.fakelag:override(slot_50_5_0.fakelag:get())
	end
end

slot_0_127_0 = {
	scope_enable = slot_0_7_0.vis_screen:switch("\f<crosshairs>  Custom Scope Overlay", false)
}
slot_0_128_0 = slot_0_127_0.scope_enable:create()
slot_0_127_0.scope_opts = slot_0_128_0:selectable("\f<list-check>  Scope Options", {
	"Rotation",
	"Inverted"
}):depend({
	slot_0_127_0.scope_enable,
	true
})
slot_0_127_0.scope_animate = slot_0_128_0:switch("\f<rotate>  Animate", false):depend({
	slot_0_127_0.scope_enable,
	true
})
slot_0_127_0.scope_length = slot_0_128_0:slider("\f<ruler-horizontal>  Length", 10, 300, 185, 1):depend({
	slot_0_127_0.scope_enable,
	true
})
slot_0_127_0.scope_gap = slot_0_128_0:slider("\f<arrows-left-right-to-line>  Gap", 1, 300, 5, 1):depend({
	slot_0_127_0.scope_enable,
	true
})
slot_0_127_0.scope_color_inner = slot_0_128_0:color_picker("\f<palette>  Inner Color", color(255, 255, 255, 255)):depend({
	slot_0_127_0.scope_enable,
	true
})
slot_0_127_0.scope_color_outer = slot_0_128_0:color_picker("\f<circle>  Outer Color", color(0, 0, 0, 255)):depend({
	slot_0_127_0.scope_enable,
	true
})
slot_0_127_0.arrows_enable = slot_0_7_0.vis_screen:switch("\f<arrows-left-right>  Manual Arrows", false)
slot_0_129_0 = slot_0_127_0.arrows_enable:create()
slot_0_127_0.arrows_font = slot_0_129_0:combo("\f<font>  Font", {
	"Default",
	"Small",
	"Console",
	"Bold"
}, "Default"):depend({
	slot_0_127_0.arrows_enable,
	true
})
slot_0_127_0.arrows_color = slot_0_129_0:color_picker("\f<palette>  Arrow Color", color(255, 255, 255, 255)):depend({
	slot_0_127_0.arrows_enable,
	true
})
slot_0_127_0.arrows_dist = slot_0_129_0:slider("\f<arrows-left-right-to-line>  Distance", 0, 200, 35, 1):depend({
	slot_0_127_0.arrows_enable,
	true
})
slot_0_127_0.arrows_sym_l = slot_0_129_0:input("\f<arrow-left>  Left Symbol", "<"):depend({
	slot_0_127_0.arrows_enable,
	true
})
slot_0_127_0.arrows_sym_r = slot_0_129_0:input("\f<arrow-right>  Right Symbol", ">"):depend({
	slot_0_127_0.arrows_enable,
	true
})
slot_0_127_0.arrows_sym_b = slot_0_129_0:input("\f<arrow-up>  Back Symbol", "^"):depend({
	slot_0_127_0.arrows_enable,
	true
})
slot_0_127_0.aspect_enable = slot_0_7_0.vis_screen:switch("\f<expand>  Aspect Ratio", false)
slot_0_130_0 = slot_0_127_0.aspect_enable:create()
slot_0_127_0.aspect_val = slot_0_130_0:slider("\f<sliders>  Ratio", 1, 200, 133, 0.01):depend({
	slot_0_127_0.aspect_enable,
	true
})

slot_0_130_0:label("\f<table-cells>  Presets"):depend({
	slot_0_127_0.aspect_enable,
	true
})
slot_0_130_0:button("  4:3  ", function()
	slot_0_127_0.aspect_val:set(133)
end, true):depend({
	slot_0_127_0.aspect_enable,
	true
})
slot_0_130_0:button("  5:4  ", function()
	slot_0_127_0.aspect_val:set(125)
end, true):depend({
	slot_0_127_0.aspect_enable,
	true
})
slot_0_130_0:button("  3:2  ", function()
	slot_0_127_0.aspect_val:set(150)
end, true):depend({
	slot_0_127_0.aspect_enable,
	true
})
slot_0_130_0:button("  16:10  ", function()
	slot_0_127_0.aspect_val:set(160)
end, true):depend({
	slot_0_127_0.aspect_enable,
	true
})
slot_0_130_0:button("  16:9  ", function()
	slot_0_127_0.aspect_val:set(178)
end, true):depend({
	slot_0_127_0.aspect_enable,
	true
})
slot_0_130_0:button("  21:9  ", function()
	slot_0_127_0.aspect_val:set(200)
end, true):depend({
	slot_0_127_0.aspect_enable,
	true
})

slot_0_127_0.vm_enable = slot_0_7_0.vis_screen:switch("\f<hand>  Viewmodel Changer", false)
slot_0_131_0 = slot_0_127_0.vm_enable:create()
slot_0_127_0.vm_fov = slot_0_131_0:slider("\f<binoculars>  Field of View", 0, 1000, 680, 0.1):depend({
	slot_0_127_0.vm_enable,
	true
})
slot_0_127_0.vm_x = slot_0_131_0:slider("\f<arrow-right>  Offset X", -100, 100, 0, 0.1):depend({
	slot_0_127_0.vm_enable,
	true
})
slot_0_127_0.vm_y = slot_0_131_0:slider("\f<arrow-up>  Offset Y", -100, 100, 0, 0.1):depend({
	slot_0_127_0.vm_enable,
	true
})
slot_0_127_0.vm_z = slot_0_131_0:slider("\f<arrow-down>  Offset Z", -100, 100, 0, 0.1):depend({
	slot_0_127_0.vm_enable,
	true
})
slot_0_127_0.vm_hand = slot_0_131_0:switch("\f<hand-paper>  Left Hand", false):depend({
	slot_0_127_0.vm_enable,
	true
})
slot_0_127_0.velwarn_enable = slot_0_7_0.vis_combat:switch("\f<gauge-high>  Velocity Warning", false)
slot_0_132_0 = slot_0_127_0.velwarn_enable:create()
slot_0_127_0.velwarn_color = slot_0_132_0:color_picker("\f<palette>  Bar Color", color(170, 212, 255, 255)):depend({
	slot_0_127_0.velwarn_enable,
	true
})
slot_0_127_0.hitmark = slot_0_7_0.vis_combat:selectable("\f<crosshairs>  Hit Marker", {
	"Screen",
	"World"
})
slot_0_133_0 = slot_0_127_0.hitmark:create()
slot_0_127_0.hitmark_color_2d = slot_0_133_0:color_picker("\f<palette>  Screen Color", color(220, 255, 90, 255)):depend({
	slot_0_127_0.hitmark,
	true
})
slot_0_127_0.hitmark_color_3d = slot_0_133_0:color_picker("\f<globe>  World Color", color(80, 160, 255, 255)):depend({
	slot_0_127_0.hitmark,
	true
})
slot_0_127_0.hitmark_dur = slot_0_133_0:slider("\f<clock>  Duration", 1, 30, 10, 1):depend({
	slot_0_127_0.hitmark,
	true
})
slot_0_127_0.indicator = slot_0_7_0.vis_ind:switch("\f<list>  Indicators", false)
slot_0_134_0 = slot_0_127_0.indicator:create()
slot_0_127_0.indicator_sel = slot_0_134_0:selectable("\f<check-double>  Select", {
	"DT",
	"DA",
	"DUCK",
	"SAFE",
	"BAIM",
	"DMG",
	"H1TCHANCE",
	"OSAA",
	"PING"
}):depend({
	slot_0_127_0.indicator,
	true
})
slot_0_127_0.indicator_color = slot_0_134_0:color_picker("\f<palette>  Accent Color", color(205, 107, 62, 255)):depend({
	slot_0_127_0.indicator,
	true
})
slot_0_127_0.transparency_enable = slot_0_7_0.vis_misc:switch("\f<ghost>  Keep Model Transparency", false)
slot_0_127_0.dmg_enable = slot_0_7_0.vis_combat:switch("\f<burst>  Damage Indicator", false)
slot_0_135_0 = slot_0_127_0.dmg_enable:create()
slot_0_127_0.dmg_always = slot_0_135_0:switch("\f<eye>  Always Show", false):depend({
	slot_0_127_0.dmg_enable,
	true
})
slot_0_127_0.dmg_color = slot_0_135_0:color_picker("\f<palette>  Color", color(255, 255, 255, 255)):depend({
	slot_0_127_0.dmg_enable,
	true
})
slot_0_127_0.dmg_pos_x = slot_0_7_0.vis_combat:slider("dmg_x", 0, 3840, 960, 1)
slot_0_127_0.dmg_pos_y = slot_0_7_0.vis_combat:slider("dmg_y", 0, 2160, 550, 1)

slot_0_127_0.dmg_pos_x:visibility(false)
slot_0_127_0.dmg_pos_y:visibility(false)

slot_0_127_0.no_sleeves = slot_0_7_0.vis_misc:switch("\f<shirt>  Remove Sleeves", false)
slot_0_136_0 = slot_0_7_0.vis_misc:switch("\f<timeline-arrow>  Log Events", false)
slot_0_137_0 = slot_0_136_0:create()
slot_0_138_0 = slot_0_137_0:switch("\f<bell>  Notification", false):depend({
	slot_0_136_0,
	true
})
slot_0_139_0 = slot_0_137_0:color_picker("\f<tag>  Prefix Color", color(170, 212, 255, 255)):depend({
	slot_0_136_0,
	true
})
slot_0_140_0 = slot_0_137_0:color_picker("\f<paint-roller>  Main Color", color(255, 255, 255, 255)):depend({
	slot_0_136_0,
	true
})
slot_0_141_0 = cvar.r_aspectratio

function slot_0_142_0()
	if slot_0_127_0.aspect_enable:get() then
		slot_0_141_0:float(slot_0_127_0.aspect_val:get() * 0.01, true)
	else
		slot_0_141_0:float(0, false)
	end
end

slot_0_127_0.aspect_enable:set_callback(slot_0_142_0, true)
slot_0_127_0.aspect_val:set_callback(slot_0_142_0)
events.shutdown(function()
	slot_0_141_0:float(0, false)
end)

slot_0_143_0 = cvar.viewmodel_fov
slot_0_144_0 = cvar.viewmodel_offset_x
slot_0_145_0 = cvar.viewmodel_offset_y
slot_0_146_0 = cvar.viewmodel_offset_z
slot_0_147_0 = cvar.cl_righthand

function slot_0_148_0()
	slot_0_143_0:float(68, false)
	slot_0_144_0:float(0, false)
	slot_0_145_0:float(0, false)
	slot_0_146_0:float(0, false)
	slot_0_147_0:int(1, false)
end

function slot_0_149_0()
	if slot_0_127_0.vm_enable:get() then
		slot_0_143_0:float(slot_0_127_0.vm_fov:get() * 0.1, true)
		slot_0_144_0:float(slot_0_127_0.vm_x:get() * 0.1, true)
		slot_0_145_0:float(slot_0_127_0.vm_y:get() * 0.1, true)
		slot_0_146_0:float(slot_0_127_0.vm_z:get() * 0.1, true)
		slot_0_147_0:int(slot_0_127_0.vm_hand:get() and 0 or 1, true)
	else
		slot_0_148_0()
	end
end

slot_0_127_0.vm_enable:set_callback(slot_0_149_0, true)
slot_0_127_0.vm_fov:set_callback(slot_0_149_0)
slot_0_127_0.vm_x:set_callback(slot_0_149_0)
slot_0_127_0.vm_y:set_callback(slot_0_149_0)
slot_0_127_0.vm_z:set_callback(slot_0_149_0)
slot_0_127_0.vm_hand:set_callback(slot_0_149_0)
events.shutdown(slot_0_148_0)

slot_0_150_0 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
slot_0_151_0 = 0

function slot_0_152_0()
	slot_61_0_0 = entity.get_local_player()

	if not slot_61_0_0 or not slot_61_0_0:is_alive() then
		if slot_0_150_0 then
			slot_0_150_0:override()
		end

		slot_0_151_0 = 0

		return
	end

	slot_61_1_0 = slot_0_127_0.scope_enable:get()
	slot_61_2_0 = slot_61_0_0.m_bIsScoped
	slot_61_3_0 = slot_61_1_0 and slot_61_2_0 and 1 or 0

	if slot_0_127_0.scope_animate:get() then
		slot_0_151_0 = slot_0_151_0 + (slot_61_3_0 - slot_0_151_0) * 0.08
	else
		slot_0_151_0 = slot_61_3_0
	end

	if slot_0_151_0 < 0.01 then
		if slot_0_150_0 then
			slot_0_150_0:override()
		end

		slot_0_151_0 = 0

		return
	end

	if slot_0_150_0 then
		slot_0_150_0:override("Remove All")
	end

	slot_61_5_0 = render.screen_size()
	slot_61_6_0 = slot_61_5_0.x * 0.5
	slot_61_7_0 = slot_61_5_0.y * 0.5
	slot_61_8_0 = slot_0_127_0.scope_gap:get()
	slot_61_9_0 = slot_0_127_0.scope_length:get()
	slot_61_10_0 = slot_0_127_0.scope_color_inner:get()
	slot_61_11_0 = slot_0_127_0.scope_color_outer:get()

	if slot_0_127_0.scope_opts:get("Inverted") then
		slot_61_10_0, slot_61_11_0 = slot_61_11_0, slot_61_10_0
	end

	slot_61_12_0 = color(slot_61_10_0.r, slot_61_10_0.g, slot_61_10_0.b, math.floor(slot_61_10_0.a * slot_0_151_0))
	slot_61_13_0 = color(slot_61_11_0.r, slot_61_11_0.g, slot_61_11_0.b, math.floor(slot_61_11_0.a * slot_0_151_0))
	slot_61_14_0 = slot_0_127_0.scope_opts:get("Rotation")
	slot_61_15_0 = slot_61_9_0 * slot_0_151_0

	if slot_61_14_0 then
		slot_61_16_0 = 45

		if slot_0_127_0.scope_animate:get() and slot_61_0_0.m_vecVelocity:length2d() >= 5 then
			slot_61_16_0 = globals.framecount % 360
		end

		render.push_rotation(slot_61_16_0)
		render.gradient(vector(slot_61_6_0, slot_61_7_0 - slot_61_8_0), vector(slot_61_6_0 + 1, slot_61_7_0 - slot_61_8_0 - slot_61_15_0), slot_61_12_0, slot_61_12_0, slot_61_13_0, slot_61_13_0)
		render.gradient(vector(slot_61_6_0, slot_61_7_0 + slot_61_8_0 + 1), vector(slot_61_6_0 + 1, slot_61_7_0 + slot_61_8_0 + 1 + slot_61_15_0), slot_61_12_0, slot_61_12_0, slot_61_13_0, slot_61_13_0)
		render.gradient(vector(slot_61_6_0 - slot_61_8_0, slot_61_7_0), vector(slot_61_6_0 - slot_61_8_0 - slot_61_15_0, slot_61_7_0 + 1), slot_61_12_0, slot_61_13_0, slot_61_12_0, slot_61_13_0)
		render.gradient(vector(slot_61_6_0 + slot_61_8_0 + 1, slot_61_7_0), vector(slot_61_6_0 + slot_61_8_0 + 1 + slot_61_15_0, slot_61_7_0 + 1), slot_61_12_0, slot_61_13_0, slot_61_12_0, slot_61_13_0)
		render.pop_rotation()
	else
		render.gradient(vector(slot_61_6_0, slot_61_7_0 - slot_61_8_0), vector(slot_61_6_0 + 1, slot_61_7_0 - slot_61_8_0 - slot_61_15_0), slot_61_12_0, slot_61_12_0, slot_61_13_0, slot_61_13_0)
		render.gradient(vector(slot_61_6_0, slot_61_7_0 + slot_61_8_0 + 1), vector(slot_61_6_0 + 1, slot_61_7_0 + slot_61_8_0 + 1 + slot_61_15_0), slot_61_12_0, slot_61_12_0, slot_61_13_0, slot_61_13_0)
		render.gradient(vector(slot_61_6_0 - slot_61_8_0, slot_61_7_0), vector(slot_61_6_0 - slot_61_8_0 - slot_61_15_0, slot_61_7_0 + 1), slot_61_12_0, slot_61_13_0, slot_61_12_0, slot_61_13_0)
		render.gradient(vector(slot_61_6_0 + slot_61_8_0 + 1, slot_61_7_0), vector(slot_61_6_0 + slot_61_8_0 + 1 + slot_61_15_0, slot_61_7_0 + 1), slot_61_12_0, slot_61_13_0, slot_61_12_0, slot_61_13_0)
	end
end

slot_0_153_0 = {
	Back = 0,
	Right = 0,
	Left = 0
}
slot_0_154_0 = {
	Console = 3,
	Small = 2,
	Default = 1,
	Bold = 4
}

function slot_0_155_0()
	local var_62_0 = entity.get_local_player()

	if not var_62_0 or not var_62_0:is_alive() then
		return
	end

	local var_62_1 = slot_0_127_0.arrows_enable:get()
	local var_62_2 = slot_0_111_0:get()
	local var_62_3 = slot_0_127_0.arrows_color:get()
	local var_62_4 = slot_0_127_0.arrows_dist:get()
	local var_62_5 = slot_0_154_0[slot_0_127_0.arrows_font:get()] or 1
	local var_62_6 = render.screen_size() / 2
	local var_62_7 = {
		{
			key = "Left",
			sym = slot_0_127_0.arrows_sym_l,
			ofs = vector(-var_62_4, 0)
		},
		{
			key = "Right",
			sym = slot_0_127_0.arrows_sym_r,
			ofs = vector(var_62_4, 0)
		},
		{
			key = "Back",
			sym = slot_0_127_0.arrows_sym_b,
			ofs = vector(0, -var_62_4)
		}
	}

	for iter_62_0, iter_62_1 in ipairs(var_62_7) do
		local var_62_8 = var_62_1 and var_62_2 == iter_62_1.key and 1 or 0

		slot_0_153_0[iter_62_1.key] = slot_0_153_0[iter_62_1.key] + (var_62_8 - slot_0_153_0[iter_62_1.key]) * 0.08

		local var_62_9 = slot_0_153_0[iter_62_1.key]

		if var_62_9 > 0.01 then
			local var_62_10 = color(var_62_3.r, var_62_3.g, var_62_3.b, math.floor(var_62_3.a * var_62_9))

			render.text(var_62_5, var_62_6 + iter_62_1.ofs, var_62_10, "c", iter_62_1.sym:get())
		end
	end
end

slot_0_156_0 = 0

function slot_0_157_0()
	local var_63_0 = entity.get_local_player()

	if not var_63_0 then
		return
	end

	local var_63_1 = var_63_0:is_alive()
	local var_63_2 = var_63_1 and var_63_0.m_flVelocityModifier or 1
	local var_63_3 = ui.get_alpha() > 0
	local var_63_4 = slot_0_127_0.velwarn_enable:get() and (var_63_1 and var_63_2 < 1 or var_63_3) and 1 or 0

	slot_0_156_0 = slot_0_156_0 + (var_63_4 - slot_0_156_0) * 0.07

	if slot_0_156_0 < 0.01 then
		slot_0_156_0 = 0

		return
	end

	if var_63_3 and (not var_63_1 or var_63_2 >= 1) then
		var_63_2 = math.abs(math.sin(globals.realtime * 1.5))
	end

	local var_63_5 = render.screen_size()
	local var_63_6 = slot_0_127_0.velwarn_color:get()
	local var_63_7 = var_63_5.x * 0.5 - 80
	local var_63_8 = var_63_5.y * 0.2
	local var_63_9 = 160
	local var_63_10 = 4
	local var_63_11 = string.format("Velocity reduced by %d%%", math.floor(var_63_2 * 100))
	local var_63_12 = render.measure_text(1, nil, var_63_11)
	local var_63_13 = slot_0_156_0

	render.text(1, vector(var_63_7, var_63_8), color(255, 255, 255, math.floor(var_63_6.a * var_63_13)), nil, var_63_11)
	render.rect(vector(var_63_7, var_63_8 + var_63_12.y + 4), vector(var_63_7 + var_63_9, var_63_8 + var_63_12.y + 4 + var_63_10), color(0, 0, 0, math.floor(var_63_13 * 120)), 2)
	render.rect(vector(var_63_7, var_63_8 + var_63_12.y + 4), vector(var_63_7 + var_63_9 * var_63_2 * var_63_13, var_63_8 + var_63_12.y + 4 + var_63_10), color(var_63_6.r, var_63_6.g, var_63_6.b, math.floor(var_63_6.a * var_63_13)), 2)
end

slot_0_158_0 = {
	fade = 0,
	expire = 0
}

function slot_0_159_0(arg_64_0)
	if arg_64_0.state ~= nil then
		return
	end

	local var_64_0 = slot_0_127_0.hitmark_dur:get() * 0.1

	slot_0_158_0 = {
		fade = 0,
		expire = globals.realtime + var_64_0,
		world_pos = arg_64_0.aim
	}
end

events.aim_ack(slot_0_159_0)

function slot_0_160_0()
	local var_65_0 = entity.get_local_player()

	if not var_65_0 then
		return
	end

	local var_65_1 = globals.realtime <= slot_0_158_0.expire and var_65_0:is_alive() and 1 or 0

	slot_0_158_0.fade = slot_0_158_0.fade + (var_65_1 - slot_0_158_0.fade) * 0.05

	if slot_0_158_0.fade < 0.01 then
		slot_0_158_0.fade = 0

		return
	end

	local var_65_2 = slot_0_158_0.fade
	local var_65_3 = render.screen_size()
	local var_65_4 = var_65_3.x * 0.5
	local var_65_5 = var_65_3.y * 0.5

	if slot_0_127_0.hitmark:get("Screen") then
		local var_65_6 = slot_0_127_0.hitmark_color_2d:get()
		local var_65_7 = color(var_65_6.r, var_65_6.g, var_65_6.b, math.floor(var_65_6.a * var_65_2))
		local var_65_8 = 5
		local var_65_9 = 10

		render.line(vector(var_65_4 + var_65_8, var_65_5 + var_65_8), vector(var_65_4 + var_65_9, var_65_5 + var_65_9), var_65_7)
		render.line(vector(var_65_4 - var_65_8, var_65_5 + var_65_8), vector(var_65_4 - var_65_9, var_65_5 + var_65_9), var_65_7)
		render.line(vector(var_65_4 - var_65_8, var_65_5 - var_65_8), vector(var_65_4 - var_65_9, var_65_5 - var_65_9), var_65_7)
		render.line(vector(var_65_4 + var_65_8, var_65_5 - var_65_8), vector(var_65_4 + var_65_9, var_65_5 - var_65_9), var_65_7)
	end

	if slot_0_127_0.hitmark:get("World") and slot_0_158_0.world_pos then
		local var_65_10 = slot_0_127_0.hitmark_color_3d:get()
		local var_65_11 = color(var_65_10.r, var_65_10.g, var_65_10.b, math.floor(var_65_10.a * var_65_2))
		local var_65_12 = slot_0_158_0.world_pos:to_screen()

		if var_65_12 and var_65_12.x then
			local var_65_13 = 5

			render.rect(var_65_12 - vector(var_65_13, 0), var_65_12 + vector(var_65_13, 0), var_65_11)
			render.rect(var_65_12 - vector(0, var_65_13), var_65_12 + vector(0, var_65_13), var_65_11)
		end
	end
end

function slot_0_161_0(arg_66_0)
	local var_66_0 = entity.get_local_player()

	if not var_66_0 or not var_66_0:is_alive() then
		return
	end

	if not slot_0_127_0.transparency_enable:get() then
		return
	end

	if var_66_0.m_bIsScoped or var_66_0.m_bResumeZoom then
		return 59
	end
end

events.localplayer_transparency(slot_0_161_0)

slot_0_162_0 = 0

function slot_0_163_0()
	local var_67_0 = ui.get_binds()

	for iter_67_0 = 1, #var_67_0 do
		local var_67_1 = var_67_0[iter_67_0]

		if var_67_1.name == "Min. Damage" then
			return var_67_1.value, var_67_1.active
		end
	end

	return 0, false
end

slot_0_164_0 = slot_0_6_0.register({
	slot_0_127_0.dmg_pos_x,
	slot_0_127_0.dmg_pos_y
}, vector(40, 24), "lunaris_dmg_indicator", function(arg_68_0)
	if not slot_0_127_0.dmg_enable:get() then
		slot_0_162_0 = 0

		return
	end

	local var_68_0 = entity.get_local_player()

	if not var_68_0 or not var_68_0:is_alive() then
		slot_0_162_0 = 0

		return
	end

	local var_68_1 = false
	local var_68_2 = var_68_0:get_player_weapon()

	if var_68_2 then
		local var_68_3 = var_68_2:get_classname() or ""

		if var_68_3:find("Knife") or var_68_3:find("Taser") or var_68_3 == "CKnife" then
			var_68_1 = true
		end
	end

	local var_68_4, var_68_5 = slot_0_163_0()
	local var_68_6 = ui.get_alpha() > 0
	local var_68_7 = slot_0_127_0.dmg_always:get()
	local var_68_8 = not var_68_1 and (var_68_7 or var_68_5 or var_68_6) and 1 or 0

	slot_0_162_0 = slot_0_162_0 + (var_68_8 - slot_0_162_0) * 0.06

	if slot_0_162_0 < 0.01 then
		slot_0_162_0 = 0

		return
	end

	local var_68_9 = 1
	local var_68_10 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
	local var_68_11 = var_68_10 and var_68_10:get() or 0
	local var_68_12 = var_68_5 and var_68_4 or var_68_11
	local var_68_13 = var_68_12 > 100 and "HP+" .. tostring(var_68_12 - 100) or tostring(var_68_12)

	if not var_68_5 and not var_68_7 and var_68_6 then
		var_68_13 = "--"
	end

	local var_68_14 = render.measure_text(var_68_9, nil, var_68_13)

	arg_68_0.size = vector(math.max(var_68_14.x + 8, 30), var_68_14.y + 6)

	local var_68_15 = arg_68_0.position
	local var_68_16 = slot_0_127_0.dmg_color:get()

	render.text(var_68_9, vector(var_68_15.x, var_68_15.y), color(var_68_16.r, var_68_16.g, var_68_16.b, math.floor(var_68_16.a * slot_0_162_0)), nil, var_68_13)
end)

function slot_0_165_0(...)
	local var_69_0, var_69_1 = pcall(ui.find, ...)

	if var_69_0 then
		return var_69_1
	end

	return nil
end

slot_0_166_0 = {
	dt = slot_0_165_0("Aimbot", "Ragebot", "Main", "Double Tap"),
	hs = slot_0_165_0("Aimbot", "Ragebot", "Main", "Hide Shots"),
	fd = slot_0_165_0("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	safe_point = slot_0_165_0("Aimbot", "Ragebot", "Safety", "Safe Point"),
	baim = slot_0_165_0("Aimbot", "Ragebot", "Safety", "Body Aim"),
	min_dmg = slot_0_165_0("Aimbot", "Ragebot", "Selection", "Min. Damage"),
	hitchance = slot_0_165_0("Aimbot", "Ragebot", "Selection", "Hit Chance"),
	dormant = slot_0_165_0("Aimbot", "Ragebot", "Main", "Dormant Aimbot")
}
slot_0_167_0 = nil

function slot_0_168_0()
	local var_70_0 = ui.get_binds()

	for iter_70_0 = 1, #var_70_0 do
		local var_70_1 = var_70_0[iter_70_0]

		if var_70_1.name == "Hit Chance" then
			return var_70_1.value, var_70_1.active
		end
	end

	return 0, false
end

function slot_0_169_0()
	if not slot_0_127_0.indicator:get() then
		return
	end

	slot_71_0_0 = entity.get_local_player()

	if not slot_71_0_0 or not slot_71_0_0:is_alive() then
		return
	end

	if not slot_0_167_0 then
		slot_0_167_0 = render.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a")
	end

	slot_71_1_0 = render.screen_size()
	slot_71_2_0 = 11
	slot_71_3_0 = slot_71_1_0.y / 2 + 50
	slot_71_4_0 = slot_0_127_0.indicator_color:get()
	slot_71_5_0 = slot_0_127_0.indicator_sel:get()

	function slot_71_6_0(arg_72_0)
		for iter_72_0, iter_72_1 in ipairs(slot_71_5_0) do
			if iter_72_1 == arg_72_0 then
				return true
			end
		end

		return false
	end

	function slot_71_7_0(arg_73_0, arg_73_1)
		if not slot_71_6_0(arg_73_0) then
			return
		end

		local var_73_0 = render.measure_text(slot_0_167_0, "c", arg_73_0)
		local var_73_1 = var_73_0.x + 10
		local var_73_2 = var_73_0.y + 10
		local var_73_3 = vector(slot_71_2_0, slot_71_3_0)
		local var_73_4 = vector(slot_71_2_0 + var_73_1, slot_71_3_0 + var_73_2)

		render.gradient(var_73_3, var_73_4, color(0, 0, 0, 30), color(0, 0, 0, 0), color(0, 0, 0, 30), color(0, 0, 0, 0))

		local var_73_5 = slot_71_2_0 + 6 + var_73_0.x
		local var_73_6 = slot_71_3_0 + (var_73_2 - var_73_0.y) / 1.9

		render.text(slot_0_167_0, vector(var_73_5, var_73_6), arg_73_1, "r", arg_73_0)

		slot_71_3_0 = slot_71_3_0 + 35
	end

	slot_71_8_0 = color(255, 255, 255, 200)

	if slot_0_166_0.dt and slot_0_166_0.dt:get() and slot_0_166_0.fd and not slot_0_166_0.fd:get() then
		slot_71_9_1 = rage.exploit:get() == 1

		slot_71_7_0("DT", slot_71_9_1 and color(255, 255, 255, 200) or color(255, 0, 50, 200))
	end

	if slot_0_166_0.dormant and slot_0_166_0.dormant:get() then
		slot_71_7_0("DA", slot_71_8_0)
	end

	if slot_0_166_0.fd and slot_0_166_0.fd:get() then
		slot_71_7_0("DUCK", slot_71_8_0)
	end

	if slot_0_166_0.safe_point and slot_0_166_0.safe_point:get() == "Force" then
		slot_71_7_0("SAFE", slot_71_8_0)
	end

	if slot_0_166_0.baim and slot_0_166_0.baim:get() == "Force" then
		slot_71_7_0("BAIM", slot_71_8_0)
	end

	slot_71_9_0, slot_71_10_0 = slot_0_163_0()

	if slot_71_10_0 then
		slot_71_7_0("DMG", slot_71_8_0)
	end

	slot_71_11_0, slot_71_12_0 = slot_0_168_0()

	if slot_71_12_0 then
		slot_71_7_0("H1TCHANCE", slot_71_8_0)
	end

	if slot_0_166_0.hs and slot_0_166_0.hs:get() and slot_0_166_0.fd and not slot_0_166_0.fd:get() and slot_0_166_0.dt and not slot_0_166_0.dt:get() then
		slot_71_7_0("OSAA", slot_71_8_0)
	end

	slot_71_13_0 = slot_0_165_0("Miscellaneous", "Main", "Other", "Fake Latency")

	if slot_71_13_0 and (slot_71_13_0:get() > 0 or slot_71_13_0:get_override()) then
		slot_71_14_0 = utils.net_channel()

		if slot_71_14_0 then
			slot_71_15_0 = math.clamp(slot_71_14_0.latency[0] + slot_71_14_0.latency[1], 0.001, 0.2)
			slot_71_16_0 = math.clamp(slot_71_13_0:get() * 0.001 + slot_71_14_0.avg_latency[1], 0.001, 0.2)
			slot_71_17_0 = math.clamp(slot_71_15_0 / slot_71_16_0, 0, 1)
			slot_71_18_0 = slot_71_17_0 < 0.5 and color(250, 234, 232):lerp(color(213, 197, 84), slot_71_17_0 * 2) or color(213, 197, 84):lerp(color(143, 194, 21), (slot_71_17_0 - 0.5) * 2)

			slot_71_7_0("PING", slot_71_18_0)
		end
	end
end

function slot_0_170_0()
	slot_0_164_0:update()
end

events.config_state(function(arg_75_0)
	if arg_75_0 == "post_load" then
		slot_0_6_0.on_config_load()
	end
end)

slot_0_171_0 = ui.find("Visuals", "World", "Main", "Force Thirdperson")

events.draw_model(function(arg_76_0)
	local var_76_0 = entity.get_local_player()

	if not var_76_0 or not var_76_0:is_alive() then
		return
	end

	if not slot_0_127_0.no_sleeves:get() then
		return
	end

	if slot_0_171_0 and (slot_0_171_0:get() or slot_0_171_0:get_override()) then
		return
	end

	if arg_76_0.name:find("sleeve") then
		return false
	end

	return true
end)

slot_0_172_0 = ffi.typeof("    struct {\n        bool client_blend;\n        float blend_in;\n        void *studio_hdr;\n        int dispatch_sequence;\n        int second_dispatch_sequence;\n        uint32_t order;\n        uint32_t sequence;\n        float prev_cycle;\n        float weight;\n        float weight_delta_rate;\n        float playback_rate;\n        float cycle;\n        void *entity;\n        char pad[0x4];\n    } **\n")

function slot_0_173_0(arg_77_0, arg_77_1)
	return ffi.cast(slot_0_172_0, ffi.cast("char*", arg_77_0[0]) + 10640)[0][arg_77_1]
end

slot_0_174_0 = false

function slot_0_175_0(arg_78_0)
	if slot_0_99_0:get() then
		local var_78_0 = arg_78_0.command_number % 3 == 0 and "Walking" or "Sliding"

		slot_0_114_0.leg_movement:override(var_78_0)
	else
		slot_0_114_0.leg_movement:override()
	end

	slot_0_174_0 = arg_78_0.in_use
end

function slot_0_176_0(arg_79_0)
	local var_79_0 = entity.get_local_player()

	if not var_79_0 or not var_79_0:is_alive() then
		return
	end

	if var_79_0 ~= arg_79_0 then
		return
	end

	if var_79_0.m_vecVelocity:length2d() > 5 then
		local var_79_1 = slot_0_173_0(var_79_0, 12)

		if var_79_1 then
			var_79_1.weight = slot_0_103_0:get() / 100
		end
	end

	local var_79_2 = var_79_0:get_player_weapon()

	if var_79_2 and var_79_2:get_index() == 668 and slot_0_174_0 then
		local var_79_3 = slot_0_173_0(var_79_0, 10)

		if var_79_3 then
			var_79_3.weight = 1
			var_79_3.sequence = 200
			var_79_3.cycle = 0.1
		end
	end

	if slot_0_99_0:get() then
		local var_79_4 = slot_0_101_0:get() / 100
		local var_79_5 = slot_0_102_0:get() / 100
		local var_79_6 = (globals.clock_offset + globals.client_tick) % 3 == 0

		var_79_0.m_flPoseParameter[0] = var_79_6 and var_79_4 or var_79_5
	end

	var_79_0.m_flPoseParameter[6] = slot_0_104_0:get() / 100
end

function slot_0_177_0(arg_80_0)
	if not slot_0_106_0:get() then
		return
	end

	if not slot_0_114_0.fake_duck:get() then
		return
	end

	local var_80_0 = 5
	local var_80_1 = arg_80_0.forwardmove
	local var_80_2 = arg_80_0.sidemove

	if var_80_0 < math.abs(var_80_1) or var_80_0 < math.abs(var_80_2) then
		local var_80_3 = 450 / math.sqrt(var_80_1 * var_80_1 + var_80_2 * var_80_2)

		arg_80_0.forwardmove = var_80_1 * var_80_3
		arg_80_0.sidemove = var_80_2 * var_80_3
	end
end

function slot_0_178_0(arg_81_0)
	if not slot_0_107_0:get() then
		return
	end

	if not slot_0_114_0.fake_duck:get() then
		return
	end

	local var_81_0 = entity.get_game_rules()

	if not var_81_0 or not var_81_0.m_bFreezePeriod then
		return
	end

	arg_81_0.in_bullrush = true

	if arg_81_0.choked_commands < 7 then
		arg_81_0.in_duck = false
	else
		arg_81_0.in_duck = true
	end

	arg_81_0.send_packet = arg_81_0.choked_commands ~= 14
end

function slot_0_179_0(arg_82_0)
	if not slot_0_107_0:get() then
		return
	end

	if not slot_0_114_0.fake_duck:get() then
		return
	end

	local var_82_0 = entity.get_local_player()

	if not var_82_0 or not var_82_0:is_alive() then
		return
	end

	local var_82_1 = entity.get_game_rules()

	if not var_82_1 or not var_82_1.m_bFreezePeriod then
		return
	end

	local var_82_2 = arg_82_0.camera

	arg_82_0.camera = vector(var_82_2.x, var_82_2.y, var_82_2.z - var_82_0.m_vecViewOffset.z + 64)
end

slot_0_180_0 = {
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

function slot_0_181_0(arg_83_0, arg_83_1)
	return "\a" .. arg_83_1 .. arg_83_0 .. "\aDEFAULT"
end

function slot_0_182_0(arg_84_0)
	if not slot_0_136_0:get() then
		return
	end

	slot_84_1_0 = entity.get_local_player()

	if not slot_84_1_0 or not slot_84_1_0:is_alive() then
		return
	end

	slot_84_2_0 = arg_84_0.target

	if not slot_84_2_0 then
		return
	end

	slot_84_3_0 = slot_0_139_0:get():to_hex()
	slot_84_4_0 = slot_0_140_0:get():to_hex()
	slot_84_5_0 = slot_0_181_0(slot_84_2_0:get_name(), slot_84_4_0)
	slot_84_6_0 = slot_0_181_0("Lunaris", slot_84_3_0)
	slot_84_7_0 = slot_0_181_0(arg_84_0.hitchance, slot_84_4_0)
	slot_84_8_0 = slot_0_181_0(arg_84_0.backtrack, slot_84_4_0)

	if arg_84_0.state == nil then
		slot_84_9_1 = slot_0_180_0[arg_84_0.hitgroup] or "unknown"
		slot_84_10_1 = slot_0_181_0(slot_84_9_1, slot_84_4_0)

		if arg_84_0.wanted_hitgroup ~= arg_84_0.hitgroup then
			slot_84_10_1 = slot_84_10_1 .. slot_0_181_0("(" .. (slot_0_180_0[arg_84_0.wanted_hitgroup] or "unknown") .. ")", "DEFAULT")
		end

		slot_84_11_1 = slot_0_181_0(arg_84_0.damage, slot_84_4_0)

		if arg_84_0.wanted_damage ~= arg_84_0.damage then
			slot_84_11_1 = slot_84_11_1 .. slot_0_181_0("(" .. arg_84_0.wanted_damage .. ")", "DEFAULT")
		end

		print_raw(("%s · Hit %s's %s for %s damage [hc: %s%% · bt: %st]"):format(slot_84_6_0, slot_84_5_0, slot_84_10_1, slot_84_11_1, slot_84_7_0, slot_84_8_0))

		if slot_0_138_0:get() then
			slot_84_12_1 = {
				{
					is_prefix = true,
					text = "Lunaris"
				},
				{
					colored = false,
					text = " · Hit "
				},
				{
					is_prefix = true,
					text = slot_84_2_0:get_name()
				},
				{
					colored = false,
					text = "'s "
				},
				{
					colored = true,
					text = slot_84_9_1
				},
				{
					colored = false,
					text = " for "
				},
				{
					colored = true,
					text = tostring(arg_84_0.damage)
				},
				{
					colored = false,
					text = " damage "
				},
				{
					colored = false,
					text = "["
				},
				{
					colored = false,
					text = "hc: "
				},
				{
					colored = true,
					text = tostring(arg_84_0.hitchance) .. "%"
				},
				{
					colored = false,
					text = " · bt: "
				},
				{
					colored = true,
					text = tostring(arg_84_0.backtrack) .. "t"
				},
				{
					colored = false,
					text = "]"
				}
			}

			table.insert(slot_0_17_0, 1, {
				is_hit = true,
				time = globals.realtime,
				parts = slot_84_12_1
			})
		end
	else
		slot_84_9_0 = slot_0_181_0(slot_0_180_0[arg_84_0.wanted_hitgroup] or "unknown", slot_84_4_0)
		slot_84_10_0 = slot_0_181_0(arg_84_0.wanted_damage, slot_84_4_0)
		slot_84_11_0 = slot_0_181_0(arg_84_0.state, slot_84_4_0)

		print_raw(("%s · Missed %s's %s due to %s [dmg: %s · hc: %s%% · bt: %st]"):format(slot_84_6_0, slot_84_5_0, slot_84_9_0, slot_84_11_0, slot_84_10_0, slot_84_7_0, slot_84_8_0))

		if slot_0_138_0:get() then
			slot_84_12_0 = slot_0_180_0[arg_84_0.wanted_hitgroup] or "unknown"
			slot_84_13_0 = {
				{
					is_prefix = true,
					text = "Lunaris"
				},
				{
					colored = false,
					text = " · Missed "
				},
				{
					colored = true,
					text = slot_84_2_0:get_name()
				},
				{
					colored = false,
					text = "'s "
				},
				{
					colored = true,
					text = slot_84_12_0
				},
				{
					colored = false,
					text = " due to "
				},
				{
					colored = true,
					text = arg_84_0.state
				},
				{
					colored = false,
					text = " "
				},
				{
					colored = false,
					text = "["
				},
				{
					colored = false,
					text = "dmg: "
				},
				{
					colored = true,
					text = tostring(arg_84_0.wanted_damage)
				},
				{
					colored = false,
					text = " · hc: "
				},
				{
					colored = true,
					text = tostring(arg_84_0.hitchance) .. "%"
				},
				{
					colored = false,
					text = " · bt: "
				},
				{
					colored = true,
					text = tostring(arg_84_0.backtrack) .. "t"
				},
				{
					colored = false,
					text = "]"
				}
			}

			table.insert(slot_0_17_0, 1, {
				is_hit = false,
				time = globals.realtime,
				parts = slot_84_13_0
			})
		end
	end
end

function slot_0_183_0(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_0:get_origin()
	local var_85_1 = math.pi / 4

	for iter_85_0 = 0, math.pi * 2 - var_85_1, var_85_1 do
		local var_85_2 = 10 * math.cos(iter_85_0)
		local var_85_3 = 10 * math.sin(iter_85_0)

		if utils.trace_line(var_85_0, var_85_0 + vector(var_85_2, var_85_3, -arg_85_1), arg_85_0).fraction < 0.992 then
			return true
		end
	end

	return false
end

function slot_0_184_0(arg_86_0)
	if not slot_0_109_0:get() then
		return
	end

	local var_86_0 = entity.get_local_player()

	if not var_86_0 or not var_86_0:is_alive() then
		return
	end

	if var_86_0.m_vecVelocity.z >= -500 then
		return
	end

	if not slot_0_183_0(var_86_0, 15) and slot_0_183_0(var_86_0, 75) then
		arg_86_0.in_duck = true
	end
end

function slot_0_185_0(arg_87_0)
	if not slot_0_110_0:get() then
		return
	end

	if arg_87_0.in_use then
		return
	end

	local var_87_0 = entity.get_local_player()

	if not var_87_0 or not var_87_0:is_alive() then
		return
	end

	if var_87_0.m_MoveType ~= 9 then
		return
	end

	local var_87_1 = var_87_0:get_player_weapon()

	if not var_87_1 or var_87_1.m_bPinPulled then
		return
	end

	if var_87_1.m_fThrowTime and var_87_1.m_fThrowTime ~= 0 then
		return
	end

	if arg_87_0.sidemove == 0 then
		arg_87_0.view_angles.y = arg_87_0.view_angles.y + 45
	end

	if arg_87_0.in_forward and arg_87_0.sidemove < 0 then
		arg_87_0.view_angles.y = arg_87_0.view_angles.y + 90
	end

	if arg_87_0.in_back and arg_87_0.sidemove > 0 then
		arg_87_0.view_angles.y = arg_87_0.view_angles.y + 90
	end

	arg_87_0.in_moveleft = arg_87_0.in_back
	arg_87_0.in_moveright = arg_87_0.in_forward

	if arg_87_0.view_angles.x < 0 then
		arg_87_0.view_angles.x = -45
	end
end

function slot_0_186_0()
	local var_88_0 = {
		menu = slot_0_48_0,
		aa_menu = slot_0_72_0,
		vis = slot_0_127_0,
		misc_controls = {
			aa_team_list = slot_0_73_0,
			aa_condition_list = slot_0_74_0,
			aa_send_opposite = aa_send_opposite,
			aa_anti_bruteforce = slot_0_86_0,
			aa_abf_mode = slot_0_88_0,
			aa_freestanding = slot_0_82_0,
			aa_fs_body = slot_0_84_0,
			aa_fs_disable_yaw_mod = slot_0_85_0,
			aa_backstab = slot_0_89_0,
			anim_jitter_legs = slot_0_99_0,
			anim_jl_start = slot_0_101_0,
			anim_jl_end = slot_0_102_0,
			anim_lean = slot_0_103_0,
			anim_fall = slot_0_104_0,
			aim_unlock_latency = slot_0_105_0,
			aim_unlock_fd_speed = slot_0_106_0,
			aim_fd_freezetime = slot_0_107_0,
			mv_avoid_fall = slot_0_109_0,
			mv_fast_ladder = slot_0_110_0,
			aa_manual_yaw = slot_0_111_0,
			aa_manual_static = slot_0_113_0,
			aim_log_events = slot_0_136_0,
			aim_log_notify = slot_0_138_0,
			aim_log_prefix_clr = slot_0_139_0,
			aim_log_main_clr = slot_0_140_0,
			wm_pos_x = slot_0_51_0,
			wm_pos_y = slot_0_52_0
		},
		lunaris_controls = {
			aa_force_break_lc = slot_0_7_0.aa_force_break_lc
		}
	}
	local var_88_1, var_88_2 = pcall(slot_0_2_0.setup, var_88_0, true)

	if var_88_1 and var_88_2 then
		slot_0_24_0.full_config_handle = var_88_2
	else
		print("[Lunaris] Full preset config fallback active (partial save/load).")
	end
end

slot_0_187_0 = false

function slot_0_18_0()
	if slot_0_187_0 then
		return
	end

	slot_0_187_0 = true

	slot_0_78_0()
	slot_0_186_0()
end

slot_0_18_0()
events.render(function()
	pcall(slot_0_67_0)
	pcall(slot_0_69_0)
	pcall(slot_0_152_0)
	pcall(slot_0_155_0)
	pcall(slot_0_157_0)
	pcall(slot_0_160_0)
	pcall(slot_0_170_0)
	pcall(slot_0_169_0)

	if ui.get_alpha() > 0 then
		for iter_90_0, iter_90_1 in ipairs({
			slot_0_65_0,
			slot_0_127_0.dmg_enable:get() and slot_0_164_0
		}) do
			if iter_90_1 and iter_90_1.position and iter_90_1.size and (iter_90_1.size.x > 0 or iter_90_1.size.y > 0) then
				render.rect_outline(vector(iter_90_1.position.x - 4, iter_90_1.position.y - 4), vector(iter_90_1.position.x + iter_90_1.size.x + 4, iter_90_1.position.y + iter_90_1.size.y + 4), color(255, 255, 255, 180), 1, 4)
			end
		end
	end
end)

slot_0_188_0 = {
	"I have got only lucky twice or something but you was so fucking fat and lucky",
	"What is blud yapping about",
	"shut up random",
	"U are my weak parvo puppy do not speak up",
	"dont speka",
	"YOU ARE AN BOT DONT FORGET",
	"ben1m you have an ego for absolutely nothing its so funny",
	"u all guys are so bed pls no talk",
	"you talk like youre the best player its hilarious",
	"What kind of ego do you have to try to even speak to thy Swedish goddess kind sir",
	"wypierdalaj",
	"vanino x xalegioner",
	"im 80 and i cant do nothink on boiler",
	"@what. that’s ur girls fucking nolifer",
	"Idc I’m Russian in god and I’m king 👑 and I’m imperator and alah bless me@"
}
slot_0_189_0 = {
	"HOW I MISS SO MUCH????",
	"20wr retard vs me",
	"wp 30wr ape",
	"stop going maps that u dont know 30wr",
	"wp pooron",
	"ur gonna be 30wr forever",
	"stop queueing 20wr whore",
	"20wr forever",
	"try to get in a tourney challenge",
	"ugly 20wr sniping me",
	"20wr ape get more lucky",
	"wp luckbased ape",
	"ugly 30wr ape",
	"bro you are 20wr",
	"20wr ape go leave hvh"
}

events.player_death(function(arg_91_0)
	local var_91_0 = entity.get_local_player()

	if not var_91_0 then
		return
	end

	local var_91_1 = entity.get(arg_91_0.attacker, true)
	local var_91_2 = entity.get(arg_91_0.userid, true)

	if var_91_1 == var_91_0 and var_91_2 ~= var_91_0 then
		local var_91_3 = false

		for iter_91_0, iter_91_1 in pairs(slot_0_108_0:get()) do
			if iter_91_1 == "Kill" then
				var_91_3 = true

				break
			end
		end

		if var_91_3 then
			utils.execute_after(0.1, function()
				utils.console_exec("say \"" .. slot_0_188_0[math.random(1, #slot_0_188_0)] .. "\"")
			end)
		end
	elseif var_91_2 == var_91_0 and var_91_1 ~= var_91_0 then
		local var_91_4 = false

		for iter_91_2, iter_91_3 in pairs(slot_0_108_0:get()) do
			if iter_91_3 == "Death" then
				var_91_4 = true

				break
			end
		end

		if var_91_4 then
			utils.execute_after(0.1, function()
				utils.console_exec("say \"" .. slot_0_189_0[math.random(1, #slot_0_189_0)] .. "\"")
			end)
		end
	end
end)
events.createmove(function(arg_94_0)
	slot_0_126_0(arg_94_0)
	slot_0_175_0(arg_94_0)
	slot_0_178_0(arg_94_0)
	slot_0_184_0(arg_94_0)
	slot_0_185_0(arg_94_0)
end)
events.createmove_run(function(arg_95_0)
	slot_0_177_0(arg_95_0)
end)
events.post_update_clientside_animation(slot_0_176_0)
events.override_view(slot_0_179_0)
events.aim_ack(slot_0_182_0)
events.render(function()
	if not slot_0_136_0:get() then
		return
	end

	slot_96_0_0 = 4
	slot_96_1_0 = globals.realtime
	slot_96_2_0 = render.screen_size()
	slot_96_3_0 = slot_96_2_0.x
	slot_96_4_0 = slot_96_2_0.y
	slot_96_5_0 = math.floor(slot_96_3_0 / 2)
	slot_96_6_0 = slot_96_4_0 - 80

	for iter_96_0 = #slot_0_17_0, 1, -1 do
		slot_96_11_0 = slot_0_17_0[iter_96_0]

		if slot_96_11_0 then
			slot_96_12_0 = slot_96_1_0 - slot_96_11_0.time

			if slot_96_0_0 < slot_96_12_0 then
				table.remove(slot_0_17_0, iter_96_0)
			else
				slot_96_13_0 = 255
				slot_96_14_0 = 0

				if slot_96_12_0 < 0.25 then
					slot_96_15_2 = slot_96_12_0 / 0.25
					slot_96_13_0 = slot_96_15_2 * 255
					slot_96_14_0 = math.floor((1 - slot_96_15_2) * 10)
				elseif slot_96_12_0 > slot_96_0_0 - 0.25 then
					slot_96_15_1 = (slot_96_0_0 - slot_96_12_0) / 0.25
					slot_96_13_0 = slot_96_15_1 * 255
					slot_96_14_0 = math.floor((1 - slot_96_15_1) * -8)
				end

				slot_96_15_0 = 0
				slot_96_16_0 = 1

				for iter_96_1, iter_96_2 in ipairs(slot_96_11_0.parts) do
					slot_96_15_0 = slot_96_15_0 + render.measure_text(slot_96_16_0, nil, iter_96_2.text).x
				end

				slot_96_17_0 = slot_96_6_0 + slot_96_14_0
				slot_96_18_0 = math.ceil(slot_96_15_0)
				slot_96_19_0 = math.floor(slot_96_5_0 - slot_96_18_0 / 2)

				render.gradient(vector(slot_96_19_0 - 30, slot_96_17_0), vector(slot_96_19_0, slot_96_17_0 + 16), color(15, 15, 15, 0), color(15, 15, 15, math.floor(slot_96_13_0 * 0.5)), color(15, 15, 15, 0), color(15, 15, 15, math.floor(slot_96_13_0 * 0.5)))
				render.rect(vector(slot_96_19_0, slot_96_17_0), vector(slot_96_19_0 + slot_96_18_0, slot_96_17_0 + 16), color(15, 15, 15, math.floor(slot_96_13_0 * 0.5)))
				render.gradient(vector(slot_96_19_0 + slot_96_18_0, slot_96_17_0), vector(slot_96_19_0 + slot_96_18_0 + 30, slot_96_17_0 + 16), color(15, 15, 15, math.floor(slot_96_13_0 * 0.5)), color(15, 15, 15, 0), color(15, 15, 15, math.floor(slot_96_13_0 * 0.5)), color(15, 15, 15, 0))

				slot_96_20_0 = slot_96_5_0 - slot_96_15_0 / 2

				for iter_96_3, iter_96_4 in ipairs(slot_96_11_0.parts) do
					slot_96_26_0 = 255
					slot_96_27_0 = 255
					slot_96_28_0 = 255

					if iter_96_4.is_prefix or iter_96_4.colored then
						slot_96_29_0 = slot_0_139_0:get()
						slot_96_26_0, slot_96_27_0, slot_96_28_0 = slot_96_29_0.r, slot_96_29_0.g, slot_96_29_0.b

						if iter_96_4.colored and not slot_96_11_0.is_hit then
							slot_96_26_0, slot_96_27_0, slot_96_28_0 = 255, 100, 100
						end
					end

					render.text(slot_96_16_0, vector(slot_96_20_0, slot_96_17_0 + 2), color(slot_96_26_0, slot_96_27_0, slot_96_28_0, math.floor(slot_96_13_0)), nil, iter_96_4.text)

					slot_96_20_0 = slot_96_20_0 + render.measure_text(slot_96_16_0, nil, iter_96_4.text).x
				end

				slot_96_6_0 = slot_96_6_0 - 20
			end
		end
	end
end)
events.shutdown(function()
	cvar.sv_maxunlag:float(0.1)
end)

return slot_0_7_0
