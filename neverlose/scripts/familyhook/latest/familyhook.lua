username = common.get_username()
is_whitelisted = username == "v1pix" or username == "keqx"
screen_size = render.screen_size()
screen_center = screen_size * 0.5

function main_init()
	default_config_b64 = "0ucHJINGekQRUwZWVbPXyYlshz65DfLnpxTtKiFvor4ad9A7M3mSBCE21gjO8q+/="
	clipboard = require("neverlose/clipboard")
	base64_codec = (function()
		local var_2_0 = string.byte
		local var_2_1 = string.char
		local var_2_2 = string.sub
		local var_2_3 = string.format
		local var_2_4 = string.gsub
		local var_2_5 = bit.band
		local var_2_6 = bit.rshift
		local var_2_7 = bit.lshift
		local var_2_8 = next
		local var_2_9 = tostring
		local var_2_10 = table.concat
		local var_2_11 = {}

		local function var_2_12(arg_3_0, arg_3_1, arg_3_2)
			return var_2_5(var_2_6(arg_3_0, arg_3_1), var_2_7(1, arg_3_2) - 1)
		end

		local function var_2_13(arg_4_0)
			local var_4_0 = {}
			local var_4_1 = {}

			for iter_4_0 = 1, 65 do
				local var_4_2 = var_2_0(var_2_2(arg_4_0, iter_4_0, iter_4_0)) or 32

				if var_4_1[var_4_2] ~= nil then
					error("invalid alphabet: duplicate character " .. var_2_9(var_4_2), 3)
				end

				var_4_0[iter_4_0 - 1] = var_4_2
				var_4_1[var_4_2] = iter_4_0 - 1
			end

			return var_4_0, var_4_1
		end

		local var_2_14 = {}
		local var_2_15 = {}

		var_2_14.base64, var_2_15.base64 = var_2_13("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=")

		local var_2_16 = {
			__index = function(arg_5_0, arg_5_1)
				if #arg_5_1 == 64 or #arg_5_1 == 65 then
					var_2_14[arg_5_1], var_2_15[arg_5_1] = var_2_13(arg_5_1)

					return arg_5_0[arg_5_1]
				end
			end
		}

		setmetatable(var_2_14, var_2_16)
		setmetatable(var_2_15, var_2_16)

		function var_2_11.encode(arg_6_0, arg_6_1, arg_6_2)
			arg_6_1 = var_2_14[arg_6_1 or "base64"] or error("invalid alphabet specified", 2)

			local var_6_0 = {}
			local var_6_1 = 1
			local var_6_2 = #arg_6_0
			local var_6_3 = var_6_2 % 3
			local var_6_4 = {}

			for iter_6_0 = 1, var_6_2 - var_6_3, 3 do
				local var_6_5, var_6_6, var_6_7 = var_2_0(arg_6_0, iter_6_0, iter_6_0 + 2)
				local var_6_8 = var_6_5 * 65536 + var_6_6 * 256 + var_6_7
				local var_6_9

				if arg_6_2 then
					var_6_9 = var_6_4[var_6_8]

					if not var_6_9 then
						var_6_9 = var_2_1(arg_6_1[var_2_12(var_6_8, 18, 6)], arg_6_1[var_2_12(var_6_8, 12, 6)], arg_6_1[var_2_12(var_6_8, 6, 6)], arg_6_1[var_2_12(var_6_8, 0, 6)])
						var_6_4[var_6_8] = var_6_9
					end
				else
					var_6_9 = var_2_1(arg_6_1[var_2_12(var_6_8, 18, 6)], arg_6_1[var_2_12(var_6_8, 12, 6)], arg_6_1[var_2_12(var_6_8, 6, 6)], arg_6_1[var_2_12(var_6_8, 0, 6)])
				end

				var_6_0[var_6_1] = var_6_9
				var_6_1 = var_6_1 + 1
			end

			if var_6_3 == 2 then
				local var_6_10, var_6_11 = var_2_0(arg_6_0, var_6_2 - 1, var_6_2)
				local var_6_12 = var_6_10 * 65536 + var_6_11 * 256

				var_6_0[var_6_1] = var_2_1(arg_6_1[var_2_12(var_6_12, 18, 6)], arg_6_1[var_2_12(var_6_12, 12, 6)], arg_6_1[var_2_12(var_6_12, 6, 6)], arg_6_1[64])
			elseif var_6_3 == 1 then
				local var_6_13 = var_2_0(arg_6_0, var_6_2) * 65536

				var_6_0[var_6_1] = var_2_1(arg_6_1[var_2_12(var_6_13, 18, 6)], arg_6_1[var_2_12(var_6_13, 12, 6)], arg_6_1[64], arg_6_1[64])
			end

			return var_2_10(var_6_0)
		end

		function var_2_11.decode(arg_7_0, arg_7_1, arg_7_2)
			arg_7_1 = var_2_15[arg_7_1 or "base64"] or error("invalid alphabet specified", 2)

			local var_7_0 = "[^%w%+%/%=]"

			if arg_7_1 then
				local var_7_1
				local var_7_2

				for iter_7_0, iter_7_1 in var_2_8, arg_7_1 do
					if iter_7_1 == 62 then
						var_7_1 = iter_7_0
					elseif iter_7_1 == 63 then
						var_7_2 = iter_7_0
					end
				end

				var_7_0 = var_2_3("[^%%w%%%s%%%s%%=]", var_2_1(var_7_1), var_2_1(var_7_2))
			end

			arg_7_0 = var_2_4(arg_7_0, var_7_0, "")

			local var_7_3 = arg_7_2 and {}
			local var_7_4 = {}
			local var_7_5 = 1
			local var_7_6 = #arg_7_0
			local var_7_7 = var_2_2(arg_7_0, -2) == "==" and 2 or var_2_2(arg_7_0, -1) == "=" and 1 or 0

			for iter_7_2 = 1, var_7_7 > 0 and var_7_6 - 4 or var_7_6, 4 do
				local var_7_8, var_7_9, var_7_10, var_7_11 = var_2_0(arg_7_0, iter_7_2, iter_7_2 + 3)
				local var_7_12

				if arg_7_2 then
					local var_7_13 = var_7_8 * 16777216 + var_7_9 * 65536 + var_7_10 * 256 + var_7_11

					var_7_12 = var_7_3[var_7_13]

					if not var_7_12 then
						local var_7_14 = arg_7_1[var_7_8] * 262144 + arg_7_1[var_7_9] * 4096 + arg_7_1[var_7_10] * 64 + arg_7_1[var_7_11]

						var_7_12 = var_2_1(var_2_12(var_7_14, 16, 8), var_2_12(var_7_14, 8, 8), var_2_12(var_7_14, 0, 8))
						var_7_3[var_7_13] = var_7_12
					end
				else
					local var_7_15 = arg_7_1[var_7_8] * 262144 + arg_7_1[var_7_9] * 4096 + arg_7_1[var_7_10] * 64 + arg_7_1[var_7_11]

					var_7_12 = var_2_1(var_2_12(var_7_15, 16, 8), var_2_12(var_7_15, 8, 8), var_2_12(var_7_15, 0, 8))
				end

				var_7_4[var_7_5] = var_7_12
				var_7_5 = var_7_5 + 1
			end

			if var_7_7 == 1 then
				local var_7_16, var_7_17, var_7_18 = var_2_0(arg_7_0, var_7_6 - 3, var_7_6 - 1)
				local var_7_19 = arg_7_1[var_7_16] * 262144 + arg_7_1[var_7_17] * 4096 + arg_7_1[var_7_18] * 64

				var_7_4[var_7_5] = var_2_1(var_2_12(var_7_19, 16, 8), var_2_12(var_7_19, 8, 8))
			elseif var_7_7 == 2 then
				local var_7_20, var_7_21 = var_2_0(arg_7_0, var_7_6 - 3, var_7_6 - 2)
				local var_7_22 = arg_7_1[var_7_20] * 262144 + arg_7_1[var_7_21] * 4096

				var_7_4[var_7_5] = var_2_1(var_2_12(var_7_22, 16, 8))
			end

			return var_2_10(var_7_4)
		end

		return var_2_11
	end)()
	smoothy = require("neverlose/smoothy")
	unused_4_1 = nil
	unused_5_1 = nil
	unused_6_1 = nil
	unused_7_1 = nil
	unused_8_1 = nil

	function lerp_func(arg_8_0, arg_8_1, arg_8_2)
		return arg_8_0 + (arg_8_1 - arg_8_0) * arg_8_2
	end

	function lerp_step(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
		return arg_9_2 * arg_9_0 / arg_9_3 + arg_9_1
	end

	function ease_in_out_cubic(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
		arg_10_0 = arg_10_0 / arg_10_3 * 2

		if arg_10_0 < 1 then
			return arg_10_2 * 0.5 * arg_10_0 * arg_10_0 * arg_10_0 + arg_10_1
		else
			arg_10_0 = arg_10_0 - 2

			return arg_10_2 * 0.5 * (arg_10_0 * arg_10_0 * arg_10_0 + 2) + arg_10_1
		end
	end

	math_clamp = math.clamp
	globals_ref_lerp = globals
	lerp_cache = {}

	function lerp_alpha(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
		local var_11_0 = lerp_cache[arg_11_0]

		if var_11_0 == nil then
			var_11_0 = arg_11_5 or arg_11_2
			lerp_cache[arg_11_0] = var_11_0
		end

		if var_11_0 == arg_11_2 and not arg_11_1 then
			return arg_11_2
		end

		if var_11_0 == arg_11_3 and arg_11_1 then
			return arg_11_3
		end

		local var_11_1 = math_clamp(lerp_step(1, var_11_0, globals_ref_lerp.frametime * (arg_11_1 and arg_11_4 or -arg_11_4) * 175, 1), arg_11_2, arg_11_3)

		lerp_cache[arg_11_0] = var_11_1

		return var_11_1
	end

	unused_9_1 = nil
	unused_10_1 = nil
	unused_11_1 = nil
	aimbot_enabled_ref = ui.find("Aimbot", "Ragebot", "Main", "Enabled")
	ui_get_bool, ui_set, ui_override = aimbot_enabled_ref.get, aimbot_enabled_ref.set, aimbot_enabled_ref.override
	unused_12_1 = nil
	global_alpha = nil
	get_binds = ui.get_binds
	get_alpha = ui.get_alpha
	bind_cache = {}

	events.render(function()
		bind_cache = get_binds()

		for iter_12_0 = 1, #bind_cache do
			local var_12_0 = bind_cache[iter_12_0]

			bind_cache[var_12_0.name] = var_12_0
		end

		global_alpha = get_alpha()
	end)

	unused_14_1 = nil
	config_api = {}
	pcall = pcall
	assert = assert
	type = type
	next_iter = next
	string_format_cfg = string.format
	global_config = {}
	antiaim_config = {}
	unused_22_7 = nil
	unused_23_9 = nil
	supported_types = {}
	supported_types.switch = true
	supported_types.slider = true
	supported_types.combo = true
	supported_types.selectable = true
	supported_types.color_picker = true
	supported_types.hotkey = true
	supported_types.textbox = true
	supported_types.list = true
	supported_types.listable = true
	unused_24_12 = nil
	color_to_hex = color().to_hex

	function ui_get_color_picker(arg_13_0)
		local var_13_0 = {}

		var_13_0.color_picker = true

		local var_13_1 = arg_13_0:get()
		local var_13_2 = arg_13_0:list()

		for iter_13_0, iter_13_1 in next_iter, var_13_2 do
			local var_13_3 = arg_13_0:get(iter_13_1)

			for iter_13_2, iter_13_3 in next_iter, var_13_3 do
				local var_13_4 = var_13_0[iter_13_1]

				if var_13_4 == nil then
					var_13_4 = {}
					var_13_0[iter_13_1] = var_13_4
				end

				var_13_4[iter_13_2] = color_to_hex(iter_13_3)
			end
		end

		if type(var_13_1) == "string" then
			var_13_0.mode = var_13_1
		end

		return var_13_0
	end

	function config_get_section(arg_14_0)
		local var_14_0 = {}

		for iter_14_0, iter_14_1 in next_iter, arg_14_0 do
			for iter_14_2, iter_14_3 in next_iter, iter_14_1 do
				local var_14_1 = iter_14_3:type()

				if supported_types[var_14_1] ~= nil then
					var_14_0[iter_14_2] = var_14_1 == "color_picker" and ui_get_color_picker(iter_14_3) or iter_14_3:get()
				end
			end
		end

		return var_14_0
	end

	unused_23_7 = nil
	unused_24_10 = nil

	function config_apply_item(arg_15_0, arg_15_1)
		if arg_15_1.mode then
			pcall(ui_set, arg_15_0, arg_15_1.mode)

			arg_15_1.mode = nil
		end

		arg_15_1.color_picker = nil

		for iter_15_0, iter_15_1 in next_iter, arg_15_1 do
			for iter_15_2, iter_15_3 in next_iter, iter_15_1 do
				iter_15_1[iter_15_2] = color(iter_15_3)
			end

			pcall(ui_set, arg_15_0, iter_15_0, iter_15_1)
		end
	end

	function config_set_section(arg_16_0, arg_16_1)
		local var_16_0 = {}

		for iter_16_0, iter_16_1 in next_iter, arg_16_0 do
			for iter_16_2, iter_16_3 in next_iter, iter_16_1 do
				var_16_0[iter_16_2] = iter_16_3
			end
		end

		for iter_16_4, iter_16_5 in next_iter, arg_16_1 do
			local var_16_1 = var_16_0[iter_16_4]

			if var_16_1 ~= nil then
				pcall(type(iter_16_5) == "table" and iter_16_5.color_picker and config_apply_item or ui_set, var_16_1, iter_16_5)
			elseif is_whitelisted then
				print_raw(string_format_cfg("reference %s is nil", iter_16_4))
			end
		end
	end

	function config_set_item(arg_17_0, arg_17_1, arg_17_2)
		assert(type(arg_17_1) == "string", "invalid name")
		assert(type(arg_17_2) == "userdata", "invalid reference")
		assert(arg_17_0[arg_17_1] == nil, arg_17_1 .. " already exists")

		arg_17_0[arg_17_1] = arg_17_2
	end

	function config_api.global(arg_18_0, ...)
		if #{
			...
		} == 0 then
			return config_get_section({
				global_config,
				antiaim_config
			})
		end

		if type(...) == "table" then
			return config_set_section({
				global_config,
				antiaim_config
			}, ...)
		end

		local var_18_0, var_18_1 = ...

		config_set_item(global_config, var_18_0, var_18_1)

		return var_18_1
	end

	function config_api.antiaim(arg_19_0, ...)
		if #{
			...
		} == 0 then
			return config_get_section({
				antiaim_config
			})
		end

		if type(...) == "table" then
			return config_set_section({
				antiaim_config
			}, ...)
		end

		local var_19_0, var_19_1 = ...

		config_set_item(antiaim_config, var_19_0, var_19_1)

		return var_19_1
	end

	unused_15_1 = nil
	dragger_factory = {
		group = ui.create("dragging"),
		is_in_area = function(arg_20_0, arg_20_1, arg_20_2)
			return arg_20_0.x >= arg_20_1.x and arg_20_0.x <= arg_20_1.x + arg_20_2.x and arg_20_0.y >= arg_20_1.y and arg_20_0.y <= arg_20_1.y + arg_20_2.y
		end
	}

	function dragger_new(arg_21_0, arg_21_1, arg_21_2)
		local var_21_0 = tostring(arg_21_1)
		local var_21_1 = arg_21_2 or vector()
		local var_21_2 = {
			dragging = false,
			positions = {
				x = arg_21_0.group:slider("x: " .. var_21_0, -99999, 99999, var_21_1.x):visibility(false),
				y = arg_21_0.group:slider("y: " .. var_21_0, -99999, 99999, var_21_1.y):visibility(false)
			}
		}
		local var_21_3 = {
			get_position = function(arg_22_0)
				return arg_22_0.position or vector(arg_22_0.positions.x:get(), arg_22_0.positions.y:get())
			end,
			update = function(arg_23_0, arg_23_1, arg_23_2)
				arg_23_2 = arg_23_2 or vector()
				arg_23_0.position = vector(arg_23_0.positions.x:get(), arg_23_0.positions.y:get())

				local var_23_0 = common.is_button_down(1)
				local var_23_1 = common.is_button_down(2)
				local var_23_2 = ui.get_mouse_position()

				if not (ui.get_alpha() > 0) then
					return
				end

				local var_23_3 = dragger_factory.is_in_area(var_23_2, arg_23_0.position - arg_23_2, arg_23_1 + arg_23_2)

				if (var_23_0 or var_23_1) and arg_23_0.intersected == nil then
					arg_23_0.intersected = var_23_3
					arg_23_0.drag_position = var_23_2 - arg_23_0.position
				end

				if (var_23_0 or var_23_1) and arg_23_0.intersected then
					arg_23_0.dragging = true
				elseif not var_23_0 and not var_23_1 then
					arg_23_0.dragging = false
					arg_23_0.intersected = nil
					dragger_factory.target = nil
				end

				if arg_23_0.dragging then
					if dragger_factory.target == nil or dragger_factory.target == var_21_0 then
						dragger_factory.target = var_21_0

						if var_23_0 then
							local var_23_4 = var_23_2 - arg_23_0.drag_position

							arg_23_0.positions.x:set(math.max(1 + arg_23_2.x, math.min(screen_size.x - arg_23_1.x - 1, var_23_4.x)))
							arg_23_0.positions.y:set(math.max(1 + arg_23_2.y, math.min(screen_size.y - arg_23_1.y - 1, var_23_4.y)))
						else
							arg_23_0.positions.x:set(var_21_1.x)
							arg_23_0.positions.y:set(var_21_1.y)
						end
					else
						arg_23_0.dragging = false
					end
				end

				arg_23_0.block_mouse_input = var_21_2.dragging or var_23_3
			end
		}

		_G.events.mouse_input(function()
			if ui.get_alpha() > 0 and var_21_2.block_mouse_input then
				return false
			end
		end)

		return setmetatable(var_21_2, {
			__index = var_21_3
		})
	end

	dragger_factory = setmetatable(dragger_factory, {
		__metatable = false,
		__call = dragger_new
	})
	unused_16_1 = nil
	feature_cfg = {}
	config_tab = ui.create("Familyhook", "Configs", 1)

	config_tab:button("  export", function()
		local var_25_0 = config_api:global()
		local var_25_1 = msgpack.pack(var_25_0)
		local var_25_2 = base64_codec.encode(var_25_1, default_config_b64) .. "_familyhook"

		clipboard.set(var_25_2)
	end, true)
	config_tab:button("  import", function()
		local var_26_0 = clipboard.get()

		if var_26_0 == nil then
			return print("failed to import config")
		end

		local var_26_1 = string.find(var_26_0, "_familyhook")

		if var_26_1 ~= nil then
			var_26_0 = string.sub(var_26_0, 1, var_26_1)
		end

		local var_26_2, var_26_3 = pcall(base64_codec.decode, var_26_0, default_config_b64)

		if not var_26_2 then
			return print("failed to import config")
		end

		local var_26_4, var_26_5 = pcall(msgpack.unpack, var_26_3)

		if not var_26_4 then
			return print("failed to import config")
		end

		config_api:global(var_26_5)
	end, true)

	embedded_config_b64 = "2pu1oEkgw6fi5FIT5NYKrlkg5l82q4bTzG0286YTzNqSwMcthv03rNb7fEjKhFb7wqG+a6wTDHlKzNq254bTLlVB04bTzGU2zQbTzFVmK4rK52YT5NypfNIM4FxrzNypDEx7fGZthFV14NbrDEIT5NYKrNkFzHLP4Fb7flkdzPuBhsc46NiKzPuS6NqBDjwTLXNvzlgxhF3izQbTLlBBrswo6lzBrNkg5HGVEjbTzG030QbTLlMBj6wTDHTKzNq254bTzFVBKQbTLlVmuQbTLlV3ujItMjbTzN81SVJdrNkg5XNozNiShlkdzlPthv0BrNb7fEjKhFbSwNPihvi95SJ0oEkgU4fi5FIT5NYKoEkgwQfi5FIT5NYKrNkg5HeIrlkg5l8mjQwTLXZvzlgxhF3izQbTLsemH4YTzNqSUMcihFb7DSJ0rNkg5Hs3oEkgZQfi5FIT5NYKrlkK52UB0QbTLseCIjbTzGU3U4wT5StHrNkgzHycrNkFzHNVrNkg5XQF5liKzN3irNkg5XlF5liKzN3ioEk7UdZKhFbMUpcihvi95Ss7rlkK52Um0QwTDHQKzNq254bTzN8m0QbTzFVEK4rK52YT5NypfNIM4FxrzNypDEx7fGZKhFbMwfcvrNkKDSemrlkK52UC0QYTLlC7wWLKhFb7wDBu6QwTzHPozNiShlkdzlPthF8BMjbTzGUCXQwT5SWHoEkgw4fi5FIT5NYKoEkMUjbK52fArNkK5S5w0lTKhFzKUgcthF8EMjbTzFVCK4rK52YT5NypfNIM4FxrzNypDEx7fGZKhvidU/6ihFb7DSh0oEkMw4bK52fArNkgDtUioEk7wDZKhvidZ0ZKhviKUMQKhFbMw9c/rNkgDtphrNkg5XZiDExrzvPKhvimwx+KhviKZ0Pihvi95SW7rNkK5SWw0lTKhvi9ZQz96lbK5NlthFVS4NbrDEIT5NYKrNkKDHU0rlkg5l81jjYTLlC7wA+Khvi9w4z96lbK5NlthFVm4NbrDEIT5NYKoEkKw4xK6swxhF3izQbTzG010QbTLlVE04YTzNqSZ0cKhFbSUCAthFV2rGwM6ljKhvidw7QTzNvHrNkKDSxVoEkKU6xK6swxhF3izQbTzGUEU4bTzFV1K4rK52YT5NypfNIM4FxrzNypDEx7fGZthv02rNb7fEjtzNitp43t5E37DiqM6lwazsRHokNobKzNbKzNbK6KhFbMwwcvoEbrDMNthF82MjbTzN830QbTzN8BSVIorlbrDEqKMjbTLse3NQbTLseBR6wTLXLvzlgxhF3izQwt6lsHrNkg5HnSoEbrz4fKzlzxfl3BoEwrh1QdhEqd52knDNit6EYmMjcb4JzNVXIuUyzNrNkgDtDDoEkKw6xK6swxhF3izQIdK63x6lCT52VpDEx7fGZKhviKwMQKhvi9wjz96lbK5Ny="
	decode_ok, decoded_config = pcall(base64_codec.decode, embedded_config_b64, default_config_b64)
	unpack_ok, default_config_data = pcall(msgpack.unpack, decoded_config)

	config_tab:button("  default", function()
		if default_config_data == nil then
			return
		end

		config_api:global(default_config_data)
	end, true)

	builder_tab = ui.create("Familyhook", "\n Builder", 1)
	unused_24_7 = nil
	builder_conditions = {}
	condition_names = {
		"global",
		"standing",
		"moving",
		"slowwalk",
		"crouching ct",
		"crouching t",
		"air",
		"crouch-air"
	}
	condition_combo = builder_tab:combo("  condition", condition_names)

	for iter_1_0 = 1, #condition_names do
		condition_name = condition_names[iter_1_0]
		builder_entry = {}
		builder_override = nil

		if iter_1_0 ~= 1 then
			builder_override = config_api:antiaim("bo" .. iter_1_0, builder_tab:switch("  override " .. condition_name))
			builder_entry.override = builder_override
		end

		unused_34_5 = nil
		builder_subtab = ui.create("Familyhook", "##" .. condition_name, 1)

		function builder_visibility_updater()
			local var_28_0 = condition_combo:get() == condition_name

			if iter_1_0 ~= 1 then
				builder_override:visibility(var_28_0)
			end

			local var_28_1 = iter_1_0 == 1 or builder_override:get()

			builder_subtab:visibility(var_28_0 and var_28_1)
		end

		condition_combo:set_callback(builder_visibility_updater, true)

		if iter_1_0 ~= 1 then
			builder_override:set_callback(builder_visibility_updater, true)
		end

		builder_entry.pitch = config_api:antiaim("bp" .. iter_1_0, builder_subtab:combo("  pitch ##" .. condition_name, "down", "zero"))
		builder_entry.yaw = config_api:antiaim("by" .. iter_1_0, builder_subtab:combo("  yaw", "disabled", "enabled")):tooltip("if two yaw have the same value - you will have a static body yaw. if yaw values are different -  you will have jitter body yaw.")
		yaw_group = builder_entry.yaw:create()

		builder_entry.yaw:set_callback(function(arg_29_0)
			yaw_group:visibility(arg_29_0:get() ~= "disabled")
		end, true)

		builder_entry.yaw_left = config_api:antiaim("byl" .. iter_1_0, yaw_group:slider("  yaw left ##" .. condition_name, -180, 180, 0))
		builder_entry.yaw_right = config_api:antiaim("byr" .. iter_1_0, yaw_group:slider("  yaw right ##" .. condition_name, -180, 180, 0))
		builder_entry.yaw_delay = config_api:antiaim("byd" .. iter_1_0, yaw_group:slider("  yaw delay ##" .. condition_name, 1, 10, 1, 1, function(arg_30_0)
			if arg_30_0 == 1 then
				return "Off"
			end

			return arg_30_0
		end))
		builder_entry.yaw_modifier = config_api:antiaim("bym" .. iter_1_0, builder_subtab:combo("  yaw modifier ##" .. condition_name, "disabled", "middle", "shift", "spin")):tooltip("middle yaw modifier like center in neverlose! \nshift yaw modifier like offset in neverlose! \n\nbut shift and middle are better! for example: this yaw modifiers works well with delay jitter!")
		yaw_mod_group = builder_entry.yaw_modifier:create()

		builder_entry.yaw_modifier:set_callback(function(arg_31_0)
			yaw_mod_group:visibility(arg_31_0:get() ~= "disabled")
		end, true)

		builder_entry.yaw_modifier_offset = config_api:antiaim("bymo" .. iter_1_0, yaw_mod_group:slider("  offset ##" .. condition_name, -180, 180, 0))
		builder_entry.defensive_aa = config_api:antiaim("bd" .. iter_1_0, builder_subtab:combo("  defensive aa ##" .. condition_name, "disabled", "spin", "yaw"))
		defensive_aa_group = builder_entry.defensive_aa:create()
		builder_entry.defensive_aa_pitch = config_api:antiaim("bdp" .. iter_1_0, defensive_aa_group:slider("  pitch ##" .. condition_name, -89, 89, 0))
		builder_entry.defensive_aa_offset = config_api:antiaim("bdos" .. iter_1_0, defensive_aa_group:slider("  offset ##" .. condition_name, -180, 180, 0))
		builder_entry.defensive_aa_spin_offset = config_api:antiaim("bdo" .. iter_1_0, defensive_aa_group:slider("  offset ##spin" .. condition_name, -360, 360, 0))
		builder_entry.defensive_aa_speed = config_api:antiaim("bds" .. iter_1_0, defensive_aa_group:slider("  speed ##" .. condition_name, 1, 100, 50))

		builder_entry.defensive_aa:set_callback(function(arg_32_0)
			local var_32_0 = arg_32_0:get()

			defensive_aa_group:visibility(var_32_0 ~= "disabled")

			local var_32_1 = var_32_0 == "yaw"

			builder_entry.defensive_aa_offset:visibility(var_32_1)

			local var_32_2 = var_32_0 == "spin"

			builder_entry.defensive_aa_spin_offset:visibility(var_32_2)
			builder_entry.defensive_aa_speed:visibility(var_32_2)
		end, true)

		builder_entry.force_defensive = config_api:antiaim("bfd" .. iter_1_0, builder_subtab:selectable("  force defensive ##" .. condition_name, "double tap", "hide shots"))
		builder_conditions[iter_1_0] = builder_entry
	end

	feature_cfg.builder = builder_conditions
	other_tab = ui.create("Familyhook", "Other", 2)
	unused_26_7 = nil
	tweaks_selectable = other_tab:selectable("  tweaks", "fast shooting on min dmg", "fast ladder move", "static with knife", "static on health", "bombsite e fix")
	tweaks_health_group = tweaks_selectable:create()

	tweaks_selectable:set_callback(function(arg_33_0)
		tweaks_health_group:visibility(ui_get_bool(arg_33_0, "static on health"))
	end, true)

	feature_cfg.tweaks_health = tweaks_health_group:slider("health", 0, 100, 25)
	feature_cfg.tweaks = tweaks_selectable
	unused_27_6 = nil
	feature_cfg.manual_yaw = other_tab:combo("  manual yaw", "off", "left", "right", "forward")
	unused_28_6 = nil
	feature_cfg.edge_yaw = other_tab:switch("   edge yaw")
	unused_29_8 = nil
	crosshair_indicators_data = {
		enabled = config_api:global("cie", other_tab:switch("  crosshair indicators"))
	}
	crosshair_indicators_data.color = config_api:global("cic", crosshair_indicators_data.enabled:color_picker())

	crosshair_indicators_data.enabled:set_callback(function(arg_34_0)
		crosshair_indicators_data.color:visibility(ui_get_bool(arg_34_0))
	end, true)

	feature_cfg.crosshair_indicators = crosshair_indicators_data
	unused_30_7 = nil
	damage_indicator_data = {
		enabled = config_api:global("di", other_tab:switch("  damage indicator"))
	}
	di_enabled_group = damage_indicator_data.enabled:create()

	damage_indicator_data.enabled:set_callback(function(arg_35_0)
		di_enabled_group:visibility(ui_get_bool(arg_35_0))
	end, true)

	damage_indicator_data.font = config_api:global("dif", di_enabled_group:combo("font", "default", "pixel"))
	damage_indicator_data.color = config_api:global("dic", damage_indicator_data.font:color_picker())
	damage_indicator_data.style = config_api:global("dis", di_enabled_group:list("\n style", "default", "kibit"))
	damage_indicator_data.show_on_damage = config_api:global("disod", di_enabled_group:switch("show on damage"))

	damage_indicator_data.style:set_callback(function(arg_36_0)
		damage_indicator_data.show_on_damage:visibility(ui_get_bool(arg_36_0) == 1)
	end, true)

	feature_cfg.damage_indicator = damage_indicator_data
	unused_31_7 = nil
	feature_cfg.clan_tag = config_api:global("c", other_tab:switch("   clan tag"))
	unused_32_7 = nil
	indicators_data = {
		enabled = other_tab:selectable("   indicators", "fps", "ping", "time")
	}
	indicators_group = indicators_data.enabled:create()

	indicators_data.enabled:set_callback(function(arg_37_0)
		indicators_group:visibility(#ui_get_bool(arg_37_0) > 0)
	end, true)

	indicators_data.position = indicators_group:list("\n position", "default", "inline")
	feature_cfg.indicators = indicators_data
	unused_33_6 = nil
	feature_cfg.log_events = config_api:global("l", other_tab:selectable("  log events", "aimbot shots", "purchases"))

	ui.sidebar("\a{Link Active}familyhook", "\a{Link Active}")

	tweaks_list = nil
	tweaks_health_val = nil

	feature_cfg.tweaks:set_callback(function(arg_38_0)
		tweaks_list = arg_38_0:list()

		for iter_38_0 = 1, #tweaks_list do
			tweaks_list[iter_38_0] = ui_get_bool(arg_38_0, iter_38_0)
		end
	end, true)
	feature_cfg.tweaks_health:set_callback(function(arg_39_0)
		tweaks_health_val = ui_get_bool(arg_39_0)
	end, true)

	log_events_ref = nil
	get_local_player = entity.get_local_player
	safe_points_ref = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")

	function on_createmove_min_dmg(arg_40_0)
		local var_40_0 = get_local_player()

		if var_40_0 == nil or not var_40_0:is_alive() then
			return
		end

		local var_40_1 = bind_cache["Min. Damage"]
		local var_40_2 = var_40_1 ~= nil and var_40_1.active

		if tweaks_list[1] and var_40_2 then
			ui_override(safe_points_ref, "Default")
		else
			ui_override(safe_points_ref)
		end
	end

	events.createmove(on_createmove_min_dmg)

	unused_20_1 = nil
	antiaim_state = {}
	math_min = math.min
	math_max = math.max
	math_abs = math.abs
	get_local_player_aa = entity.get_local_player
	builder_configs = feature_cfg.builder
	builder_global_config = builder_configs[1]
	tick_counter = 0
	frame_counter = 0
	hide_shots_active = nil
	hide_shots_active_alt = nil
	hide_shots_refs = {
		enabled = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
		options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
	}

	hide_shots_refs.enabled:set_callback(function(arg_41_0)
		hide_shots_active_alt = ui_get_bool(arg_41_0)
	end, true)

	unused_31_6 = nil
	double_tap_active_alt = nil
	double_tap_refs = {
		enabled = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
		options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
	}

	double_tap_refs.enabled:set_callback(function(arg_42_0)
		double_tap_active_alt = ui_get_bool(arg_42_0)
	end, true)

	aa_enabled_ref = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled")
	aa_pitch_ref = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch")
	unused_35_4 = nil
	aa_yaw_refs = {
		mode = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
		base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
		offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
		hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
	}
	unused_36_4 = nil
	aa_yaw_mod_refs = {
		mode = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
		offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
	}
	unused_37_4 = nil
	aa_body_yaw_refs = {
		enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
		inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
		left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
		right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
		options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
		freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
	}
	aa_extended_angles_ref = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles")
	aa_freestanding_ref = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
	unused_40_2 = nil
	slow_walk_active = nil
	slow_walk_ref = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):set_callback(function(arg_43_0)
		slow_walk_active = ui_get_bool(arg_43_0)
	end, true)
	unused_42_2 = nil
	current_condition = nil
	vector_length = vector().length
	bit_band = bit.band

	function get_condition(arg_44_0, arg_44_1)
		local var_44_0 = bit_band(arg_44_1.m_fFlags, 1) ~= 0 and not arg_44_0.in_jump
		local var_44_1 = arg_44_1.m_flDuckAmount > 0 or is_fakeduck

		if not var_44_0 then
			current_condition = var_44_1 and 8 or 7

			return current_condition
		end

		if var_44_1 then
			current_condition = arg_44_1.m_iTeamNum == 2 and 6 or 5

			return current_condition
		end

		if vector_length(arg_44_1.m_vecAbsVelocity) < 2 then
			current_condition = 2

			return current_condition
		end

		if slow_walk_active then
			current_condition = 4

			return current_condition
		end

		if var_44_0 then
			current_condition = 3

			return current_condition
		end
	end

	manual_yaw_val = nil
	manual_yaw_map = {
		forward = 180,
		right = 100,
		left = -75
	}

	feature_cfg.manual_yaw:set_callback(function(arg_45_0)
		local var_45_0 = arg_45_0:get()

		manual_yaw_val = manual_yaw_map[var_45_0]
	end, true)

	unused_45_2 = nil
	edge_yaw_active = nil

	feature_cfg.edge_yaw:set_callback(function(arg_46_0)
		edge_yaw_active = ui_get_bool(arg_46_0)
	end, true)

	math_normalize_yaw = math.normalize_yaw
	math_abs_edge = math.abs
	camera_angles = render.camera_angles
	trace_line = utils.trace_line
	table_sort = table.sort
	vector_new_aa = vector()
	vector_angles = vector_new_aa.angles
	vector_lerp = vector_new_aa.lerp
	edge_trace_vectors = {}

	for iter_1_1 = -162, 180, 18 do
		edge_trace_vectors[iter_1_1] = vector_angles(vector_new_aa, 0, iter_1_1) * 96
	end

	function edge_sort_func(arg_47_0, arg_47_1)
		return arg_47_0.yaw < arg_47_1.yaw
	end

	function get_edge_yaw(arg_48_0, arg_48_1)
		if arg_48_0.in_use then
			return
		end

		local var_48_0 = arg_48_1:get_eye_position()
		local var_48_1 = {}

		for iter_48_0 = -162, 180, 18 do
			local var_48_2 = var_48_0 + edge_trace_vectors[iter_48_0]
			local var_48_3 = trace_line(var_48_0, var_48_2, arg_48_1, 33570827)
			local var_48_4 = var_48_3.entity
			local var_48_5 = var_48_3.fraction

			if var_48_4 and var_48_4:get_index() == 0 and var_48_5 < 0.3 then
				var_48_1[#var_48_1 + 1] = {
					endpos = var_48_3.end_pos,
					yaw = iter_48_0
				}
			end
		end

		table_sort(var_48_1, edge_sort_func)

		local var_48_6

		if #var_48_1 >= 2 then
			local var_48_7 = vector_lerp(var_48_1[1].endpos, var_48_1[#var_48_1].endpos, 0.5)

			var_48_6 = vector_angles(var_48_0 - var_48_7)
		end

		if var_48_6 then
			local var_48_8 = camera_angles().y
			local var_48_9 = var_48_6.y
			local var_48_10 = math_normalize_yaw(var_48_9 - var_48_8)

			if math_abs_edge(var_48_10) < 90 then
				var_48_10 = 0
				var_48_8 = math_normalize_yaw(var_48_9 + 180)
			end

			local var_48_11 = -var_48_8
			local var_48_12 = math_normalize_yaw(var_48_11 + var_48_9 + 180)

			return (math_normalize_yaw(var_48_12 + var_48_10))
		end
	end

	function fast_ladder_move(arg_49_0, arg_49_1, arg_49_2)
		local var_49_0 = arg_49_1.m_MoveType
		local var_49_1 = arg_49_2:get_weapon_info()

		if var_49_1 == nil then
			return
		end

		local var_49_2 = var_49_1.weapon_type

		if var_49_0 ~= 9 or var_49_2 == 9 then
			return
		end

		if arg_49_0.sidemove == 0 then
			arg_49_0.view_angles.y = arg_49_0.view_angles.y + 45
		end

		if arg_49_0.in_forward and arg_49_0.sidemove < 0 then
			arg_49_0.view_angles.y = arg_49_0.view_angles.y + 90
		end

		if arg_49_0.in_back and arg_49_0.sidemove > 0 then
			arg_49_0.view_angles.y = arg_49_0.view_angles.y + 90
		end

		arg_49_0.in_moveleft = arg_49_0.in_back
		arg_49_0.in_moveright = arg_49_0.in_forward

		if arg_49_0.view_angles.x < 0 then
			arg_49_0.view_angles.x = -45
		end
	end

	unused_48_2 = nil
	ui_value_cache = {}

	function cache_ui_value(arg_50_0)
		if arg_50_0 == nil then
			return
		end

		local var_50_0 = ui_value_cache[arg_50_0]

		if var_50_0 == nil then
			arg_50_0:set_callback(function(arg_51_0)
				var_50_0 = ui_get_bool(arg_51_0)
				ui_value_cache[arg_50_0] = var_50_0
			end, true)
		end

		return var_50_0
	end

	rage_antiaim = rage.antiaim
	pitch_name_map = {
		down = "Down",
		zero = "Disabled"
	}
	antiaim_inverter = rage.antiaim.inverter
	yaw_handlers = {
		disabled = function()
			antiaim_state.inverter = false
		end,
		enabled = function(arg_53_0)
			local var_53_0 = cache_ui_value(arg_53_0.yaw_left)
			local var_53_1 = cache_ui_value(arg_53_0.yaw_right)
			local var_53_2 = cache_ui_value(arg_53_0.yaw_delay)
			local var_53_3 = var_53_0 ~= var_53_1
			local var_53_4 = var_53_3 and var_53_2 < tick_counter % (var_53_2 * 2) + 1

			antiaim_inverter(rage_antiaim, var_53_4)

			antiaim_state.inverter = var_53_4

			local var_53_5 = "Backward"
			local var_53_6 = "At Target"
			local var_53_7 = var_53_4 and var_53_0 or var_53_1

			return var_53_5, var_53_6, var_53_7, var_53_3, var_53_4
		end
	}
	yaw_mod_handlers = {
		disabled = function(arg_54_0, arg_54_1)
			return "Disabled", 0, arg_54_1
		end,
		middle = function(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
			local var_55_0 = cache_ui_value(arg_55_0.yaw_modifier_offset)

			if not arg_55_2 then
				return "Center", var_55_0, arg_55_1
			end

			arg_55_1 = arg_55_1 + var_55_0 * (arg_55_3 and 1 or -1)

			return "Disabled", 0, arg_55_1
		end,
		shift = function(arg_56_0, arg_56_1, arg_56_2, arg_56_3)
			local var_56_0 = cache_ui_value(arg_56_0.yaw_modifier_offset)

			if not arg_56_2 then
				return "Offset", var_56_0, arg_56_1
			end

			if arg_56_3 then
				arg_56_1 = arg_56_1 + var_56_0
			end

			return "Disabled", var_56_0, arg_56_1
		end,
		spin = function(arg_57_0, arg_57_1)
			return "Spin", cache_ui_value(arg_57_0.yaw_modifier_offset), arg_57_1
		end
	}
	override_hidden_pitch = rage_antiaim.override_hidden_pitch
	override_hidden_yaw_offset = rage_antiaim.override_hidden_yaw_offset
	defensive_spin_accum = 0
	defensive_aa_handlers = {
		disabled = function()
			return false
		end,
		spin = function(arg_59_0)
			local var_59_0 = cache_ui_value(arg_59_0.defensive_aa_pitch)

			override_hidden_pitch(rage_antiaim, var_59_0)

			local var_59_1 = cache_ui_value(arg_59_0.defensive_aa_spin_offset)
			local var_59_2 = cache_ui_value(arg_59_0.defensive_aa_speed) * 0.1

			if var_59_1 > 0 then
				defensive_spin_accum = defensive_spin_accum + var_59_2

				if var_59_1 < defensive_spin_accum then
					defensive_spin_accum = 0
				end
			else
				defensive_spin_accum = defensive_spin_accum - var_59_2

				if var_59_1 > defensive_spin_accum then
					defensive_spin_accum = 0
				end
			end

			override_hidden_yaw_offset(rage_antiaim, defensive_spin_accum)

			return true
		end,
		yaw = function(arg_60_0)
			local var_60_0 = cache_ui_value(arg_60_0.defensive_aa_pitch)

			override_hidden_pitch(rage_antiaim, var_60_0)

			local var_60_1 = cache_ui_value(arg_60_0.defensive_aa_offset)

			override_hidden_yaw_offset(rage_antiaim, var_60_1)

			return true
		end
	}
	unused_58_1 = nil
	vector_new_trace = vector()
	trace_hull = utils.trace_hull
	get_entities = entity.get_entities
	camera_angles_bf = render.camera_angles
	vector_dist = vector_new_trace.dist
	vector_angles_bf = vector_new_trace.angles
	solid_classes = {
		CCSPlayer = true,
		CFuncBrush = true,
		CWorld = true
	}
	trace_mins = vector(2, 2, 2)
	trace_mask = 1174421515
	trace_distance = 8192

	function bombsite_e_fix(arg_61_0, arg_61_1, arg_61_2)
		local var_61_0 = arg_61_2:get_weapon_index() == 49 and arg_61_1.m_bInBombZone
		local var_61_1 = get_entities("CPlantedC4")
		local var_61_2 = #var_61_1 > 0
		local var_61_3 = 100

		if var_61_2 then
			local var_61_4 = var_61_1[#var_61_1]:get_origin()
			local var_61_5 = arg_61_1:get_origin()

			var_61_3 = vector_dist(var_61_4, var_61_5)
		end

		if var_61_3 < 62 and arg_61_1.m_iTeamNum == 3 then
			return not arg_61_0.in_use
		end

		local var_61_6 = arg_61_1:get_eye_position()
		local var_61_7 = camera_angles_bf()
		local var_61_8 = var_61_6 + vector_angles_bf(vector_new_trace, var_61_7) * trace_distance
		local var_61_9 = trace_hull(var_61_6, var_61_8, trace_mins, trace_mins, arg_61_1, trace_mask)
		local var_61_10 = var_61_9.entity
		local var_61_11 = var_61_9.fraction
		local var_61_12 = arg_61_0.in_use
		local var_61_13 = not var_61_12

		if var_61_10 and var_61_11 < 0.97 then
			local var_61_14 = var_61_10:get_classname()

			var_61_12 = solid_classes[var_61_14] == nil
		end

		if not var_61_12 and not var_61_0 then
			arg_61_0.in_use = false
		end

		return var_61_13
	end

	last_tickbase = 0

	function on_createmove_aa(arg_62_0)
		local_player = get_local_player_aa()

		if local_player == nil or not local_player:is_alive() then
			return
		end

		player_weapon = local_player:get_player_weapon()

		if player_weapon == nil then
			return
		end

		antiaim_state.condition = get_condition(arg_62_0, local_player)
		frame_counter = frame_counter + 1

		if globals.choked_commands == 0 then
			tick_counter = tick_counter + 1
		end

		active_config = builder_configs[current_condition]
		active_config = cache_ui_value(active_config.override) and active_config or builder_global_config
		pitch_key = cache_ui_value(active_config.pitch)
		pitch_mode = pitch_name_map[pitch_key]
		yaw_key = cache_ui_value(active_config.yaw)
		yaw_base, yaw_at_target, yaw_offset, yaw_jitter, yaw_invert = yaw_handlers[yaw_key](active_config)
		yaw_mod_key = cache_ui_value(active_config.yaw_modifier)
		yaw_mod_mode, yaw_mod_offset, yaw_final_offset = yaw_mod_handlers[yaw_mod_key](active_config, yaw_offset, yaw_jitter, yaw_invert)
		tickbase = local_player.m_nTickBase

		if math_abs(tickbase - last_tickbase) > 64 then
			last_tickbase = 0
		end

		ticks_choked = 0

		if tickbase > last_tickbase then
			last_tickbase = tickbase
		elseif tickbase < last_tickbase then
			ticks_choked = math_min(14, math_max(0, last_tickbase - tickbase - 1))
		end

		defensive_aa_key = cache_ui_value(active_config.defensive_aa)
		is_defensive = manual_yaw_val == nil and ticks_choked > 0
		is_defensive = is_defensive and defensive_aa_handlers[defensive_aa_key](active_config)

		if is_defensive then
			yaw_at_target = "Local View"
		end

		force_defensive_list = cache_ui_value(active_config.force_defensive)

		for iter_62_0 = 1, #force_defensive_list do
			force_defensive_list[force_defensive_list[iter_62_0]] = true
		end

		if force_defensive_list["double tap"] ~= nil and double_tap_active_alt or force_defensive_list["hide shots"] ~= nil and hide_shots_active_alt then
			ui_override(double_tap_refs.options, "Always On")
			ui_override(hide_shots_refs.options, "Break LC")
		else
			ui_override(double_tap_refs.options)
			ui_override(hide_shots_refs.options)
		end

		if tweaks_list[2] then
			fast_ladder_move(arg_62_0, local_player, player_weapon)
		end

		player_health = local_player.m_iHealth

		if tweaks_list[3] and player_weapon:get_classname() == "CKnife" or tweaks_list[4] and player_health <= tweaks_health_val then
			pitch_mode = "Down"
			yaw_base = "Backward"
			yaw_at_target = "At Target"
			yaw_final_offset = 28
			is_defensive = false
			yaw_mod_mode = "Offset"
			yaw_mod_offset = -3

			antiaim_inverter(rage_antiaim, false)
		end

		ui_override(aa_freestanding_ref)

		if manual_yaw_val ~= nil then
			yaw_at_target = "Local View"
			yaw_final_offset = manual_yaw_val
			yaw_mod_mode = "Disabled"

			antiaim_inverter(rage_antiaim, false)
			ui_override(aa_freestanding_ref, false)
		end

		if edge_yaw_active then
			yaw_at_target = "Local View"
			yaw_final_offset = get_edge_yaw(arg_62_0, local_player)
			yaw_mod_mode = "Disabled"

			antiaim_inverter(rage_antiaim, false)
		end

		aa_enabled_state = true

		if tweaks_list[5] then
			aa_enabled_state = bombsite_e_fix(arg_62_0, local_player, player_weapon)
		end

		ui_override(aa_enabled_ref, aa_enabled_state)
		ui_override(aa_pitch_ref, pitch_mode)
		ui_override(aa_yaw_refs.mode, yaw_base)
		ui_override(aa_yaw_refs.base, yaw_at_target)
		ui_override(aa_yaw_refs.offset, yaw_final_offset)
		ui_override(aa_yaw_refs.hidden, is_defensive)
		ui_override(aa_yaw_mod_refs.mode, yaw_mod_mode)
		ui_override(aa_yaw_mod_refs.offset, yaw_mod_offset)
		ui_override(aa_body_yaw_refs.enabled, true)
		ui_override(aa_body_yaw_refs.left_limit, 60)
		ui_override(aa_body_yaw_refs.right_limit, 60)
		ui_override(aa_body_yaw_refs.freestanding, "Off")
		ui_override(aa_body_yaw_refs.options, {})
		ui_override(aa_extended_angles_ref, false)
	end

	events.createmove(on_createmove_aa)

	unused_21_1 = nil
	clan_tag_cfg = feature_cfg.clan_tag
	clan_tag_frames = {
		"family",
		"familyhook",
		"family",
		"familyhook",
		"family",
		"familyhook",
		"familyh0ok",
		"familyho0k",
		"familyh00k",
		"familyh00k",
		"familyh0ok",
		"familyhook",
		"familyhook",
		"familyh00k",
		"familyhook",
		"familyh00k",
		"familyhook"
	}
	current_clan_tag = nil
	clan_tag_count = #clan_tag_frames
	get_local_player_ct = entity.get_local_player
	get_game_rules = entity.get_game_rules
	math_floor = math.floor
	math_fmod = math.fmod
	set_clan_tag = common.set_clan_tag
	net_channel = utils.net_channel
	globals_ref = globals

	function clan_tag_update()
		if get_local_player_ct() == nil then
			return
		end

		local var_63_0 = net_channel()

		if var_63_0 == nil then
			return
		end

		local var_63_1 = var_63_0.latency[0] / globals_ref.tickinterval
		local var_63_2 = math_floor(math_fmod((globals_ref.tickcount + var_63_1) / 14, clan_tag_count)) + 1
		local var_63_3 = clan_tag_frames[var_63_2]
		local var_63_4 = get_game_rules()

		if var_63_4 ~= nil then
			local var_63_5 = var_63_4.m_gamePhase

			if var_63_5 == 4 or var_63_5 == 5 then
				var_63_3 = "familyhook"
			end
		end

		if current_clan_tag ~= var_63_3 then
			current_clan_tag = var_63_3

			set_clan_tag(var_63_3)
		end
	end

	function clan_tag_clear()
		local var_64_0 = ""

		if current_clan_tag ~= var_64_0 then
			current_clan_tag = var_64_0

			set_clan_tag(var_64_0)
		end
	end

	clan_tag_cfg:set_callback(function(arg_65_0)
		local var_65_0 = ui_get_bool(arg_65_0)

		events.render(clan_tag_update, var_65_0)
		events.shutdown(clan_tag_clear, var_65_0)

		if not var_65_0 then
			clan_tag_clear()
		end
	end, true)

	unused_22_1 = nil
	crosshair_cfg = feature_cfg.crosshair_indicators
	crosshair_color = nil
	crosshair_color_hex = nil

	crosshair_cfg.color:set_callback(function(arg_66_0)
		crosshair_color = ui_get_bool(arg_66_0)
		crosshair_color_hex = "\a" .. crosshair_color:to_hex()
	end, true)

	render_rect = render.rect
	render_rect_outline = render.rect_outline
	render_text = render.text
	get_local_player_ci = entity.get_local_player
	vector_new_ci = vector
	color_new_ci = color
	globals_tick = globals
	math_abs_ci = math.abs
	unused_33_3 = nil
	dt_active_ci = nil

	;({
		enabled = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
		options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
	}).enabled:set_callback(function(arg_67_0)
		dt_active_ci = ui_get_bool(arg_67_0)
	end, true)

	hs_active_ci = nil
	hs_active_ci_flag = nil

	;({
		enabled = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
		options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
	}).enabled:set_callback(function(arg_68_0)
		hs_active_ci_flag = ui_get_bool(arg_68_0)
	end, true)

	color_alpha_mod = color_new_ci().alpha_modulate
	color_lerp = color_new_ci().lerp
	color_to_hex_ci = color_new_ci().to_hex
	color_fade_from = color_new_ci(255, 100)
	color_fade_to = color_new_ci(255, 255)
	color_green = color_new_ci(143, 194, 21, 255)
	color_red = color_new_ci(255, 0, 50, 255)
	freestanding_ref, freestanding_active = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")

	freestanding_ref:set_callback(function(arg_69_0)
		freestanding_active = ui_get_bool(arg_69_0)
	end, true)

	crosshair_items = {
		{
			name = "DT",
			is_active = function()
				local var_70_0 = rage.exploit:get()

				return dt_active_ci, "\a" .. color_to_hex_ci(color_lerp(color_red, color_green, var_70_0))
			end
		},
		{
			name = "HS",
			is_active = function()
				return hs_active_ci_flag and not dt_active_ci, ""
			end
		}
	}
	ci_font = render.load_font("calibri bold", vector_new_ci(11, 11, 1), "ao")

	function crosshair_render()
		local var_72_0 = get_local_player_ci()

		if var_72_0 == nil or not var_72_0:is_alive() then
			return
		end

		render_text(2, screen_center + vector_new_ci(0, 23), color_new_ci(), nil, "FAMILY" .. crosshair_color_hex .. "  HOOK")

		local var_72_1 = 0

		for iter_72_0 = 1, #crosshair_items do
			local var_72_2 = crosshair_items[iter_72_0]
			local var_72_3 = var_72_2.name
			local var_72_4, var_72_5 = var_72_2.is_active()
			local var_72_6 = lerp_alpha("crosshair indicators -> bind alpha: " .. var_72_3, var_72_4, 0, 1, 0.0365)

			if var_72_6 > 0 then
				render_text(2, screen_center + vector_new_ci(0, 31), color_alpha_mod(crosshair_color, var_72_6 * 255), nil, var_72_5 .. var_72_3)

				var_72_1 = var_72_1 + 8 * var_72_6
			end
		end

		local var_72_7 = bind_cache["Body Aim"]
		local var_72_8 = var_72_7 ~= nil and var_72_7.active

		render_text(2, screen_center + vector_new_ci(0, 31 + var_72_1), color_lerp(color_fade_from, color_fade_to, lerp_alpha("crosshair indicators -> baim", var_72_8, 0, 1, 0.036)), nil, "BAIM")

		local var_72_9 = bind_cache["Safe Points"]
		local var_72_10 = var_72_9 ~= nil and var_72_9.active

		render_text(2, screen_center + vector_new_ci(20, 31 + var_72_1), color_lerp(color_fade_from, color_fade_to, lerp_alpha("crosshair indicators -> sp", var_72_10, 0, 1, 0.036)), nil, "SP")
		render_text(2, screen_center + vector_new_ci(32, 31 + var_72_1), color_lerp(color_fade_from, color_fade_to, lerp_alpha("crosshair indicators -> fs", freestanding_active, 0, 1, 0.036)), nil, "FS")
	end

	crosshair_cfg.enabled:set_callback(function(arg_73_0)
		events.render(crosshair_render, ui_get_bool(arg_73_0))
	end, true)

	unused_23_1 = nil
	damage_indicator_cfg = feature_cfg.damage_indicator
	tostring = tostring
	vector_new = vector
	color_new = color
	get_local_player_di = entity.get_local_player
	render_measure_text = render.measure_text
	render_text_di = render.text
	render_rect_outline_di = render.rect_outline
	di_font = nil
	di_color = nil
	di_style_mode = nil
	di_show_on_dmg = nil

	damage_indicator_cfg.font:set_callback(function(arg_74_0)
		di_font = ui_get_bool(arg_74_0)
		di_font = di_font == "default" and 1 or 2
	end, true)
	damage_indicator_cfg.color:set_callback(function(arg_75_0)
		di_color = ui_get_bool(arg_75_0)
	end, true)
	damage_indicator_cfg.style:set_callback(function(arg_76_0)
		di_style_mode = ui_get_bool(arg_76_0)
	end, true)
	damage_indicator_cfg.show_on_damage:set_callback(function(arg_77_0)
		di_show_on_dmg = ui_get_bool(arg_77_0)
	end, true)

	min_dmg_ref = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
	di_dragger = dragger_factory("damage indicator", vector_new(screen_center.x + 10, screen_center.y - 20))

	function di_render()
		local var_78_0 = get_local_player_di()

		if var_78_0 == nil or not var_78_0:is_alive() then
			return
		end

		local var_78_1 = di_dragger:get_position()
		local var_78_2 = bind_cache["Min. Damage"]
		local var_78_3 = var_78_2 ~= nil and var_78_2.active

		if di_style_mode == 1 and di_show_on_dmg and not var_78_3 then
			return
		end

		local var_78_4 = ui_get_bool(min_dmg_ref)

		if var_78_4 == 0 then
			var_78_4 = di_font == 1 and "Auto" or "AUTO"
		end

		local var_78_5 = tostring(var_78_4)
		local var_78_6 = render_measure_text(di_font, nil, var_78_5)

		render_text_di(di_font, var_78_1, di_color, nil, var_78_5)

		if di_style_mode == 2 then
			render_text_di(di_font, var_78_1 - vector_new(30, 0), di_color, nil, var_78_3 and "1" or "0")
		end

		if global_alpha == 0 then
			return
		end

		local var_78_7 = di_style_mode == 2 and vector_new(30, 0) or vector_new()

		render_rect_outline_di(var_78_1 - var_78_7 - vector_new(1, 1), var_78_1 + var_78_6 + vector_new(1, 1), color_new(255, 255), 1, 4)
		di_dragger:update(var_78_6, var_78_7)
	end

	damage_indicator_cfg.enabled:set_callback(function(arg_79_0)
		events.render(di_render, ui_get_bool(arg_79_0))
	end, true)

	unused_24_1 = nil
	indicators_cfg = feature_cfg.indicators
	panorama_api = panorama.loadstring("            let _GetText = function(text) {\n                let panel = $.GetContextPanel().FindChildTraverse(\"HudRadar\").FindChildTraverse(\"DashboardLabel\");\n                return panel.text;\n            }\n\n            let _ChangeText = function(text) {\n                let panel = $.GetContextPanel().FindChildTraverse(\"HudRadar\").FindChildTraverse(\"DashboardLabel\");\n                panel.text = text;\n            }\n\n            return {\n                get_text: _GetText,\n                change_text: _ChangeText\n            }\n        ", "CSGOHud")()
	indicators_enabled = nil
	indicators_list = nil
	indicators_position_mode = nil

	indicators_cfg.enabled:set_callback(function(arg_80_0)
		indicators_enabled = #ui_get_bool(arg_80_0) > 0
		indicators_list = arg_80_0:list()

		for iter_80_0 = 1, #indicators_list do
			indicators_list[iter_80_0] = ui_get_bool(arg_80_0, iter_80_0)
		end

		if not indicators_enabled then
			panorama_api.change_text("")
		end
	end, true)
	indicators_cfg.position:set_callback(function(arg_81_0)
		indicators_position_mode = ui_get_bool(arg_81_0)
	end, true)

	fps_smooth = 0
	fps_value = nil
	fps_update_time = 0
	globals_ref_fps = globals
	math_floor_fps = math.floor
	table_concat = table.concat
	get_date = common.get_date
	net_channel_di = utils.net_channel
	string_format_fps = string.format
	string_sub = string.sub

	events.render(function()
		fps_smooth = 0.9 * fps_smooth + 0.1 * globals_ref_fps.absoluteframetime

		local var_82_0 = globals_ref_fps.realtime

		if var_82_0 > fps_update_time + 0.8 or fps_value == nil then
			fps_value = 1 / fps_smooth
			fps_update_time = var_82_0
		end

		local var_82_1 = net_channel_di()

		if var_82_1 == nil then
			return
		end

		if not indicators_enabled then
			local var_82_2 = panorama_api.get_text()

			if string_sub(var_82_2, 1, 1) == "#" then
				panorama_api.change_text(string_sub(var_82_2, 2))
			end

			return
		end

		local var_82_3 = var_82_1.is_loopback and 0 or math_floor_fps(var_82_1.latency[1] * 1000)
		local var_82_4 = {}

		if indicators_list[1] then
			var_82_4[#var_82_4 + 1] = string_format_fps("FPS: %d", fps_value)
		end

		if indicators_list[2] then
			var_82_4[#var_82_4 + 1] = string_format_fps("PING: %d", var_82_3)
		end

		if indicators_list[3] then
			var_82_4[#var_82_4 + 1] = get_date("%H:%M")
		end

		local var_82_5 = table_concat(var_82_4, indicators_position_mode == 1 and "\n" or " | ")

		panorama_api.change_text(var_82_5)
	end)

	unused_25_1 = nil
	log_events_cfg = feature_cfg.log_events
	get_local_player_log = entity.get_local_player
	entity_get = entity.get
	string_format_log = string.format
	hitgroup_names = {
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

	function on_aim_ack(arg_83_0)
		local var_83_0 = arg_83_0.target

		if var_83_0 == nil then
			return
		end

		local var_83_1 = var_83_0:get_name()
		local var_83_2 = arg_83_0.state
		local var_83_3 = arg_83_0.hitchance
		local var_83_4 = arg_83_0.backtrack

		if var_83_2 == nil then
			local var_83_5 = hitgroup_names[arg_83_0.hitgroup]
			local var_83_6 = arg_83_0.damage
			local var_83_7 = arg_83_0.wanted_damage

			print_raw(string_format_log("familyhook \aA0CB27FF[+]\aDEFAULT target: %s | %s %s(%s) | hc:%s | bt:%s", var_83_1, var_83_5, var_83_6, var_83_7, var_83_3, var_83_4))
		else
			local var_83_8 = hitgroup_names[arg_83_0.wanted_hitgroup]
			local var_83_9 = arg_83_0.wanted_damage

			print_raw(string_format_log("familyhook \aFF7575FF[-]\aDEFAULT target: %s | %s (%s) due to %s | hc:%s | bt:%s", var_83_1, var_83_8, var_83_9, var_83_2, var_83_3, var_83_4))
		end
	end

	function on_item_purchase(arg_84_0)
		local var_84_0 = get_local_player_log()

		if var_84_0 == nil then
			return
		end

		local var_84_1 = entity_get(arg_84_0.userid, true)

		if var_84_1 == nil or var_84_1 == var_84_0 then
			return
		end

		local var_84_2 = var_84_1:get_name()
		local var_84_3 = arg_84_0.weapon

		print_raw(string_format_log("familyhook \aC7BB64FF[$]\aDEFAULT target: %s — bought %s", var_84_2, var_84_3))
	end

	log_events_ui_ref = ui.find("Miscellaneous", "Main", "Other", "Log Events")

	function log_events_dispatcher()
		local var_85_0 = ui_get_bool(log_events_cfg, "aimbot shots")
		local var_85_1 = ui_get_bool(log_events_cfg, "purchases")

		ui_override(log_events_ui_ref)

		if var_85_0 or var_85_1 then
			ui_override(log_events_ui_ref, {})
		end

		events.aim_ack(on_aim_ack, var_85_0)
		events.item_purchase(on_item_purchase, var_85_1)
	end

	log_events_cfg:set_callback(log_events_dispatcher, true)
	log_events_ui_ref:set_callback(log_events_dispatcher, true)
end

utils.execute_after(0.05, main_init)

