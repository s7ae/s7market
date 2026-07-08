local base64 = require 'neverlose/base64'
local clipboard = require 'neverlose/clipboard'

local smoothy = require 'neverlose/smoothy'
local inspect = require 'neverlose/inspect'

local HSP = '\u{200A}'

local debug_point do
    local dev_break_after_count = cvar.dev_break_after_count

    local function should_print()
        return dev_break_after_count:int() ~= 0
    end

    function debug_point(name)
        if not should_print() then
            return
        end

        print(name)
    end
end

local function find(list, value)
    for i = 1, #list do
        if list[i] == value then
            return i
        end
    end

    return nil
end

local function merge(...)
    local str = ''

    for i = 1, select('#', ...) do
        str = str .. select(i, ...)
    end

    return str
end

local function round(x)
    return math.floor(x + 0.5)
end

local function create_debug_callback(name, func)
    return function(...)
        local result = table.pack(
            pcall(func, ...)
        )

        if not result[1] then
            print_raw(string.format(
                '\aff4040ff[\"%s\"] failed: %s',
                name, result[2]
            ))

            return nil
        end

        return table.unpack(result, 2, result.n)
    end
end

debug_point 'begin_script'

local script = { } do
    local user = common.get_username()

    script.name = 'Frost' do
        script.user = user
        script.build = 'Debug'
    end
end

debug_point 'begin_trial'

local trial = { } do
    -- database name, change only
    -- if it was compromised, but
    -- then trial will be reset to
    -- anyone, who used trial before
    local DB_NAME = 'frost trial'

    -- nil to remove trial version
    -- otherwise number (in seconds)
    local MAX_TIME = nil -- 7200 => 2 hours

    local function process_trial()
        if MAX_TIME == nil then
            return nil
        end

        local time = common.get_unixtime()

        local data = db[DB_NAME] or {
            first_startup = time
        }

        local delta = time - data.first_startup do
            db['frost trial'] = data
        end

        if delta > MAX_TIME then
            error 'Trial expired'
        end

        return MAX_TIME - delta
    end

    function trial.process()
        return process_trial()
    end

    trial.time = process_trial()
end

debug_point 'begin_aux'

local aux do
    aux = { }

    local UNITS_TO_FOOT = 0.0254 * 3.28084

    function aux.lerp(a, b, t)
        return a + t * (b - a)
    end

    function aux.to_foot(units)
        return units * UNITS_TO_FOOT
    end

    function aux.closest_ray_point(a, b, p, should_clamp)
        local ray_delta = p - a
        local line_delta = b - a

        local lengthsqr = line_delta.x * line_delta.x + line_delta.y * line_delta.y
        local dot_product = ray_delta.x * line_delta.x + ray_delta.y * line_delta.y

        local t = dot_product / lengthsqr

        if should_clamp then
            if t <= 0.0 then
                return a
            end

            if t >= 1.0 then
                return b
            end
        end

        return a + t * line_delta
    end
end

debug_point 'begin_software'

local software do
    software = { }

    software.antiaim = {
        angles = {
            enabled = ui.find(
                'Aimbot', 'Anti Aim', 'Angles', 'Enabled'
            ),

            pitch = ui.find(
                'Aimbot', 'Anti Aim', 'Angles', 'Pitch'
            ),

            yaw = {
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Yaw'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Yaw', 'Base'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Yaw', 'Offset'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Yaw', 'Avoid Backstab'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Yaw', 'Hidden')
            },

            yaw_modifier = {
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Yaw Modifier'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Yaw Modifier', 'Offset')
            },

            body_yaw = {
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Body Yaw'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Body Yaw', 'Inverter'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Body Yaw', 'Left Limit'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Body Yaw', 'Right Limit'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Body Yaw', 'Options'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Body Yaw', 'Freestanding')
            },

            freestanding = {
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Freestanding'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Freestanding', 'Disable Yaw Modifiers'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Freestanding', 'Body Freestanding')
            },

            extended_angles = {
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Extended Angles'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Extended Angles', 'Extended Pitch'),
                ui.find('Aimbot', 'Anti Aim', 'Angles', 'Extended Angles', 'Extended Roll')
            }
        },

        misc = {
            fake_duck = ui.find(
                'Aimbot', 'Anti Aim', 'Misc', 'Fake Duck'
            ),

            slow_walk = ui.find(
                'Aimbot', 'Anti Aim', 'Misc', 'Slow Walk'
            ),

            leg_movement = ui.find(
                'Aimbot', 'Anti Aim', 'Misc', 'Leg Movement'
            )
        }
    }

    software.ragebot = {
        main = {
            peek_assist = {
                ui.find('Aimbot', 'Ragebot', 'Main', 'Peek Assist'),
                { ui.find('Aimbot', 'Ragebot', 'Main', 'Peek Assist', 'Style') },
                ui.find('Aimbot', 'Ragebot', 'Main', 'Peek Assist', 'Auto Stop'),
                ui.find('Aimbot', 'Ragebot', 'Main', 'Peek Assist', 'Retreat Mode'),
            },

            hide_shots = {
                ui.find('Aimbot', 'Ragebot', 'Main', 'Hide Shots'),
                ui.find('Aimbot', 'Ragebot', 'Main', 'Hide Shots', 'Options')
            },

            double_tap = {
                ui.find('Aimbot', 'Ragebot', 'Main', 'Double Tap'),
                ui.find('Aimbot', 'Ragebot', 'Main', 'Double Tap', 'Lag Options'),
                ui.find('Aimbot', 'Ragebot', 'Main', 'Double Tap', 'Fake Lag Limit'),
                ui.find('Aimbot', 'Ragebot', 'Main', 'Double Tap', 'Immediate Teleport'),
                ui.find('Aimbot', 'Ragebot', 'Main', 'Double Tap', 'Quick-Switch')
            }
        },

        selection = {
            min_damage = ui.find(
                'Aimbot', 'Ragebot', 'Selection', 'Min. Damage'
            )
        }
    }
end

debug_point 'begin_debug_overlay'

local debug_overlay do
    debug_overlay = { }

    local Vector = ffi.typeof [[
        struct {
            float x, y, z;
        }
    ]]

    local Color = ffi.typeof [[
        struct {
            uint8_t r, g, b, a;
        }
    ]]

    local native_AddBoxOverlay = utils.get_vfunc(
        'engine.dll', 'VDebugOverlay004', 1, ffi.typeof('void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, int r, int g, int b, int a, float duration)', Vector, Vector, Vector, Vector)
    )

    local native_AddLineOverlayAlpha = utils.get_vfunc(
        'engine.dll', 'VDebugOverlay004', 20, ffi.typeof('void(__thiscall*)(void *thisptr, const $ &origin, const $ &dest, int r, int g, int b, int a, bool noDepthTest, float duration)', Vector, Vector)
    )

    local native_AddBoxOverlayNew = utils.get_vfunc(
        'engine.dll', 'VDebugOverlay004', 21, 'void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, $ *face_color, $ *edge_color, float duration)', Vector, Vector, Vector, Vector, Color, Color
    )

    function debug_overlay.box(origin, mins, maxs, angles, r, g, b, a, duration)
        origin = Vector(origin:unpack())
        mins = Vector(mins:unpack())
        maxs = Vector(maxs:unpack())
        angles = Vector(angles:unpack())

        native_AddBoxOverlay(origin, mins, maxs, angles, r, g, b, a, duration)
    end

    function debug_overlay.line(origin, dest, col, nodepth, duration)
        origin = Vector(origin:unpack())
        dest = Vector(dest:unpack())

        native_AddLineOverlayAlpha(origin, dest, col.r, col.g, col.b, col.a, nodepth, duration)
    end

    function debug_overlay.box_new(origin, mins, maxs, angles, face_color, edge_color, duration)
        origin = Vector(origin:unpack())
        mins = Vector(mins:unpack())
        maxs = Vector(maxs:unpack())
        angles = Vector(angles:unpack())

        face_color = Color(face_color:unpack())
        edge_color = Color(edge_color:unpack())

        native_AddBoxOverlayNew(origin, mins, maxs, angles, face_color, edge_color, duration)
    end
end

debug_point 'begin_event_system'

local event_system do
    event_system = { }

    local EventList = { } do
        EventList.__index = EventList

        function EventList:new()
            return setmetatable({
                list = { },
                count = 0
            }, self)
        end

        function EventList:__len()
            return self.count
        end

        function EventList:__call(callback, value)
            if value == false then
                return self:unset(callback)
            end

            return self:set(callback)
        end

        function EventList:unset(callback)
            local index = find(self.list, callback)

            if index ~= nil then
                self.count = self.count - 1
                table.remove(self.list, index)
            end

            return self
        end

        function EventList:set(callback, value)
            if value == false then
                return self:unset(callback)
            end

            if not find(self.list, callback) then
                self.count = self.count + 1
                table.insert(self.list, callback)
            end

            return self
        end

        function EventList:fire(...)
            local list = self.list

            for i = 1, #list do
                list[i](...)
            end

            return self
        end
    end

    local EventBus = { } do
        local function __index(list, k)
            local value = rawget(list, k)

            if value == nil then
                value = EventList:new()
                rawset(list, k, value)
            end

            return value
        end

        function EventBus:new()
            return setmetatable({ }, {
                __index = __index
            })
        end
    end

    function event_system:new()
        return EventBus:new()
    end
end

debug_point 'begin_menu'

local menu do
    menu = { }

    local GROUP_FLAG_CALLBACKS = bit.lshift(1, 0)

    local Group = { } do
        Group.__index = Group

        function Group:__newindex(k, v)
            self[0][k] = v
        end

        function Group:__index(k)
            -- get class field if exists
            local super = rawget(Group, k)

            if super ~= nil then
                return super
            end

            -- get table field if exists
            local this = rawget(self, k)

            if this ~= nil then
                return this
            end

            -- get group field
            local field = self[0][k]

            if field == nil then
                return nil
            end

            if type(field) == 'function' then
                -- function redirect
                local function fn(...)
                    local argv, argc = { }, select('#', ...)

                    for i = 1, argc do
                        argv[i] = select(i, ...)
                    end

                    if bit.band(self.flags, GROUP_FLAG_CALLBACKS) ~= 0 then
                        self:fire_callbacks(argv, argc)
                    end

                    if argv[1] == self then
                        argv[1] = self[0]
                    end

                    return field(unpack(argv, 1, argc))
                end

                -- precache group method
                rawset(self, k, fn)

                return fn
            end

            return field
        end

        function Group:new(group)
            local list = {
                [0] = group,

                flags = 0,
                callbacks = { }
            }

            -- default flags
            list.flags = bit.bor(list.flags, GROUP_FLAG_CALLBACKS)

            return setmetatable(
                list, self
            )
        end

        function Group:fire_callbacks(...)
            local list = rawget(
                self, 'callbacks'
            )

            for i = 1, #list do
                list[i](...)
            end

            return self
        end

        function Group:get_flag(flag)
            return bit.band(self.flags, flag) ~= 0
        end

        function Group:set_flag(flag, value)
            if value then
                self.flags = bit.bor(self.flags, flag)
            else
                self.flags = bit.band(self.flags, bit.bnot(flag))
            end

            return self
        end

        function Group:set_callback(fn)
            local list = rawget(
                self, 'callbacks'
            )

            local index = find(list, fn)

            if index == nil then
                table.insert(list, fn)
            end

            return self
        end

        function Group:unset_callback(fn)
            local list = rawget(
                self, 'callbacks'
            )

            local index = find(list, fn)

            if index ~= nil then
                table.remove(list, index)
            end

            return self
        end
    end

    menu.group_flags = {
        callbacks = GROUP_FLAG_CALLBACKS
    }

    function menu.cast(item)
        return Group:new(item)
    end

    function menu.create(...)
        return Group:new(
            ui.create(...)
        )
    end
end

debug_point 'begin_logging_system'

local logging_system do
    logging_system = { }

    local SOUND_SUCCESS = 'ui\\beepclear.wav'
    local SOUND_FAILURE = 'resource\\warning.wav'

    local play = cvar.play

    local function print_tag(col, msg)
        local sep = ' '

        local tag = string.format(
            '\a%s[%s]\aDEFAULT',
            col:to_hex(), script.name:lower()
        )

        print_raw(tag .. sep .. msg)
    end

    function logging_system.log(msg)
        print_tag(color(255, 255, 255, 200), msg)
    end

    function logging_system.success(msg)
        print_tag(color(100, 175, 255), msg)
        play:call(SOUND_SUCCESS)
    end

    function logging_system.error(msg)
        print_tag(color(250, 50, 50, 255), msg)
        play:call(SOUND_FAILURE)
    end
end

debug_point 'begin_windows'

local windows do
    windows = { }

    local GROUP = ui.create('##WINDOWS') do
        GROUP:visibility(false)
    end

    local data = { }
    local queue = { }

    local mouse_pos = vector()
    local mouse_pos_prev = vector()

    local mouse_down = false
    local mouse_clicked = false

    local mouse_down_duration = 0

    local mouse_delta = vector()
    local mouse_clicked_pos = vector()

    local hovered_window
    local foreground_window

    local c_window = { } do
        function c_window:new(name)
            local window = { }

            window.name = name

            window.pos = vector()
            window.size = vector()

            window.anchor = vector(0.0, 0.0)

            window.updated = false
            window.dragging = false

            window.item_x = GROUP:value(string.format('%s_x', name), '')
            window.item_y = GROUP:value(string.format('%s_y', name), '')

            data[name] = window
            queue[#queue + 1] = window

            return setmetatable(
                window, self
            )
        end

        function c_window:set_pos(pos)
            local screen = render.screen_size()

            local is_screen_invalid = (
                screen.x == 0 and
                screen.y == 0
            )

            if is_screen_invalid then
                return
            end

            local new_pos = pos:clone()

            new_pos.x = math.clamp(new_pos.x, 0, screen.x - self.size.x)
            new_pos.y = math.clamp(new_pos.y, 0, screen.y - self.size.y)

            self.pos = new_pos
        end

        function c_window:set_size(size)
            local screen = render.screen_size()

            local is_screen_invalid = (
                screen.x == 0 and
                screen.y == 0
            )

            if is_screen_invalid then
                return
            end

            local size_delta = size - self.size

            self.size = size
            self:set_pos(self.pos - size_delta * self.anchor)
        end

        function c_window:set_anchor(anchor)
            self.anchor = anchor
        end

        function c_window:is_hovering()
            return self.hovering
        end

        function c_window:is_dragging()
            return self.dragging
        end

        function c_window:update()
            self.updated = true
        end

        c_window.__index = c_window
    end

    local function is_collided(point, a, b)
        return point.x >= a.x and point.y >= a.y
            and point.x <= b.x and point.y <= b.y
    end

    local function update_mouse_inputs()
        local cursor = ui.get_mouse_position()
        local is_down = common.is_button_down(0x01)

        local delta_time = globals.frametime

        mouse_pos = cursor:clone()
        mouse_delta = mouse_pos - mouse_pos_prev

        mouse_pos_prev = mouse_pos

        mouse_down = is_down
        mouse_clicked = is_down and mouse_down_duration < 0

        mouse_down_duration = is_down and (mouse_down_duration < 0 and 0 or mouse_down_duration + delta_time) or -1

        if mouse_clicked then
            mouse_clicked_pos = mouse_pos
        end
    end

    local function appear_all_windows()
        for i = 1, #queue do
            local window = queue[i]

            local pos = window.pos
            local size = window.size

            render.rect_outline(pos, pos + size, color(0, 0, 0, 100))
        end
    end

    local function find_hovered_window()
        local found_window = nil

        if ui.get_alpha() > 0 then
            for i = 1, #queue do
                local window = queue[i]

                local pos = window.pos
                local size = window.size

                if not window.updated then
                    goto continue
                end

                if not is_collided(mouse_pos, pos, pos + size) then
                    goto continue
                end

                found_window = window

                ::continue::
            end
        end

        hovered_window = found_window
    end

    local function find_foreground_window()
        if mouse_down then
            if mouse_clicked and hovered_window ~= nil then
                for i = 1, #queue do
                    local window = queue[i]

                    if window == hovered_window then
                        table.remove(queue, i)
                        table.insert(queue, window)

                        break
                    end
                end

                foreground_window = hovered_window
                return
            end

            return
        end

        foreground_window = nil
    end

    local function update_all_windows()
        for i = 1, #queue do
            local window = queue[i]

            window.updated = false

            window.hovering = false
            window.dragging = false
        end
    end

    local function update_hovered_window()
        if hovered_window == nil then
            return
        end

        hovered_window.hovering = true
    end

    local function update_foreground_window()
        if foreground_window == nil then
            return
        end

        local new_position = foreground_window.pos + mouse_delta

        foreground_window:set_pos(new_position)
        foreground_window.dragging = true
    end

    local function save_windows_settings()
        local screen = render.screen_size()

        for i = 1, #queue do
            local window = queue[i]

            local x = window.pos.x / screen.x
            local y = window.pos.y / screen.y

            window.item_x:set(tostring(x))
            window.item_y:set(tostring(y))
        end
    end

    local function load_windows_settings()
        local screen = render.screen_size()

        for i = 1, #queue do
            local window = queue[i]

            local x = tonumber(window.item_x:get())
            local y = tonumber(window.item_y:get())

            if x ~= nil and y ~= nil then
                window:set_pos(screen * vector(x, y))
            end
        end
    end

    local function on_render()
        -- appear_all_windows()
        update_mouse_inputs()

        find_hovered_window()
        find_foreground_window()

        update_all_windows()

        update_hovered_window()
        update_foreground_window()
    end

    local function on_createmove(cmd)
        local should_update = (
            hovered_window ~= nil or
            foreground_window ~= nil
        )

        if should_update then
            cmd.in_attack = 0
            cmd.in_attack2 = 0
        end
    end

    local function on_config_state(state)
        if state == 'pre_save' then
            save_windows_settings()
        end

        if state == 'post_load' then
            load_windows_settings()
        end
    end

    function windows.new(name, x, y)
        local window = data[name]
            or c_window:new(name)

        local screen = render.screen_size()
        window:set_pos(screen * vector(x, y))

        return window
    end

    function windows.save_settings()
        save_windows_settings()
    end

    function windows.load_settings()
        load_windows_settings()
    end

    on_render = create_debug_callback('windows.on_render', on_render)
    on_createmove = create_debug_callback('windows.on_createmove', on_createmove)
    on_config_state = create_debug_callback('windows.on_config_state', on_config_state)

    events.render(on_render)
    events.createmove(on_createmove)
    events.config_state(on_config_state)

    utils.execute_after(0, function()
        load_windows_settings()
    end)
end

debug_point 'begin_config_system'

local config_system do
    config_system = { }

    local groups = { }

    function config_system.get()
        return groups
    end

    function config_system.add(id, group, group_type)
        groups[id] = { group, group_type }
    end
end

debug_point 'begin_motion'

local motion do
    motion = { }

    local function linear(t, b, c, d)
        return c * t / d + b
    end

    local function get_deltatime()
        return globals.frametime
    end

    local function solve(easing_fn, prev, new, clock, duration)
        if clock <= 0 then return new end
        if clock >= duration then return new end

        prev = easing_fn(clock, prev, new - prev, duration)

        if type(prev) == 'number' then
            if math.abs(new - prev) < 0.001 then
                return new
            end

            local remainder = prev % 1.0

            if remainder < 0.001 then
                return math.floor(prev)
            end

            if remainder > 0.999 then
                return math.ceil(prev)
            end
        end

        return prev
    end

    function motion.interp(a, b, t, easing_fn)
        easing_fn = easing_fn or linear

        if type(b) == 'boolean' then
            b = b and 1 or 0
        end

        return solve(easing_fn, a, b, get_deltatime(), t)
    end
end

debug_point 'begin_render'

-- from @enq
local render do
	local __render = _G.render
	local f = math.floor

    local color_null = color(0, 0, 0, 0)

	local dpi, tf = 1, 's'
	local scale = function (v)  if dpi == 1 then return v end return v * dpi  end

	local alpha, astack = 1, {}
	local __rmod = color().alpha_modulate
	local alphen = function (c, j)  if alpha == 1 then return c elseif not j and alpha == 0 then return color_null else return __rmod(c, alpha, true) end  end

	--
	render = setmetatable({
		dpi = __render.get_scale(2),
		cheap = false,

		push_alpha = function (v)
			local len = #astack

			if len > 255 then
                error 'alpha stack exceeded 255 objects, report to developers'
            end

			astack[len+1] = v
			alpha = alpha * astack[len+1] * (astack[len] or 1)
		end,

		pop_alpha = function ()
			local len = #astack
			astack[len], len = nil, len-1
			alpha = len == 0 and 1 or astack[len] * (astack[len-1] or 1)
		end,

		get_alpha = function (a)
			if a then return astack[a] end
			return alpha, #astack
		end,

		screen_size = function (raw) return __render.screen_size() / (raw and 1 or dpi) end,
		measure_text = function (font, ...)
			return __render.measure_text(font, ...) / dpi
		end,
		load_font = function (name, size, flags)
			return __render.load_font(name, size, flags or '')
		end,
		text = function (font, pos, col, flags, ...)
			__render.text(font, scale(pos), alphen(col), flags, ...)
			if measure == true then
				return render.measure_text(font, flags, ...)
			end
		end,
		blur = function (a, b, strength, al, rounding)
			if render.cheap then return end
			if type(rounding) == 'table' then for i = 1, 4 do rounding[i] = scale(rounding[i] or 0) end else rounding = scale(rounding or 0) end
			al, strength = (al or 1) * alpha, scale(strength or 2)
			if al > 0 and strength > 0 then
				__render.blur(scale(a), scale(b), strength, al, rounding)
			end
		end,
		shadow = function (a, b, col, thickness, offset, rounding)
			if render.cheap then return end
			__render.shadow(scale(a), scale(b), alphen(col), scale(thickness or 16), scale(offset or 0), scale(rounding or 0))
		end,
		line = function (a, b, col)
			__render.line(scale(a), scale(b), alphen(col))
		end,
		rect = function (a, b, col, rounding, no_clamp)
			if type(rounding) == 'table' then for i = 1, 4 do rounding[i] = scale(rounding[i] or 0) end else rounding = scale(rounding or 0) end
			__render.rect(scale(a), scale(b), alphen(col), rounding, no_clamp or false)
		end,
		rect_outline = function (a, b, col, thickness, rounding, no_clamp)
			if type(rounding) == 'table' then for i = 1, 4 do rounding[i] = scale(rounding[i] or 0) end else rounding = scale(rounding or 0) end
			__render.rect_outline(scale(a), scale(b), alphen(col), scale(thickness or 0), rounding, no_clamp or false)
		end,
		gradient = function (a, b, cTL, cTR, cBL, cBR, rounding)
			cBL, cBR = cBL or cTL, cBR or cTR
			__render.gradient(scale(a), scale(b), alphen(cTL, true), alphen(cTR, true), alphen(cBL, true), alphen(cBR, true), rounding or 0)
		end,
		circle = function (a, col, radius, degree, percent)
			__render.circle(scale(a), alphen(col), scale(radius), degree or 0, percent or 1)
		end,
		circle_outline = function (a, col, radius, degree, percent, thickness)
			__render.circle_outline(scale(a), alphen(col), scale(radius), degree or 0, percent or 1, scale(thickness or 1))
		end,
		circle_3d = function (a, col, radius, degree, percent)
			__render.circle_3d(a, alphen(col), radius, degree or 0, percent or 1, false)
		end,
		circle_3d_outline = function (a, col, radius, degree, percent, thickness)
			__render.circle_3d_outline(a, alphen(col), radius, degree or 0, percent or 1, scale(thickness or 1))
		end,
		circle_3d_gradient = function (a, col1, col2, radius, degree, percent, thickness)
			__render.circle_3d_gradient(a, alphen(col1), alphen(col2), radius, degree or 0, percent or 1, scale(thickness or 1))
		end,
		texture = function (image, pos, size, col, mode, rounding)
			if not image then return end
			col = col or color()
			__render.texture(image, scale(pos), scale(size or vector(image.width, image.height)), alphen(col), mode or '', rounding or 0 )
		end,
		push_clip_rect = function (a, b, intersect)
			__render.push_clip_rect(scale(a), scale(b), intersect or false)
		end,
	}, { __index = __render })
end

debug_point 'begin_drag'

-- from @enq
local drag do
	local data = { }
	local current = nil

    local color_white = color(255, 255, 255, 255)

	-- point, position a, position b
	local in_bounds = function (p, a, b)
        return p.x >= a.x and p.x <= b.x
            and p.y >= a.y and p.y <= b.y
    end

	local group = menu.create '##DRAG' do
        group:visibility(false)
    end

    local screen = render.screen_size()

	drag = {
		data = data,
		in_bounds = in_bounds,

        new = function (obj, props)
            if type(props) ~= 'table' then
                props = { }
            end

			drag[obj.id] = {
				x = group:slider(obj.id .. '::x', 0, 10000, (obj.pos.x / screen.x) * 10000),
				y = group:slider(obj.id .. '::y', 0, 10000, (obj.pos.y / screen.y) * 10000)
			}

			drag[obj.id].x:set_callback(function (item) obj.pos.x = round(item:get() * .0001 * screen.x) end, true)
			drag[obj.id].y:set_callback(function (item) obj.pos.y = round(item:get() * .0001 * screen.y) end, true)

			--
			obj.__drag = {
				locked = false, active = false, hovered = nil, point = vector(), aligning = nil,
				progress = {0, 0, 0, 0},

				border = props.border or {vector(), oscreen},
				rulers = props.rulers or {},

				on_release = props.on_release, on_held = props.on_held, on_active = props.on_active,

				config = drag[obj.id],
			}

			events.mouse_input:set(function ()
				if ui.get_alpha() > 0 and (obj.__drag.hovered or obj.__drag.active) then return false end
			end)

			events.dpi_change:set(function (new, old, init)
				drag[obj.id].x:set(drag[obj.id].x.value)
				drag[obj.id].y:set(drag[obj.id].y.value)
			end)
		end,
		process = function (self)
			local ctx = self.__drag

			if ctx.locked or ui.get_alpha() == 0 then return end

			local mouse, menu_pos, menu_size = ui.get_mouse_position() / render.dpi, ui.get_position(), ui.get_size()
			local held = ui.get_alpha() > 0 and common.is_button_down(1)
			local hovered = in_bounds(mouse, self.pos, self.pos + self.size) and not in_bounds(mouse, menu_pos / render.dpi, (menu_pos + menu_size) / render.dpi)

			--
			if held and ctx.ready == nil then
				ctx.ready, ctx.point, ctx.init = hovered, self.pos - mouse, self.pos:clone()
			end

			if held and ctx.ready then
				if current == nil and ctx.on_held then ctx.on_held(self, ctx) end
				current = (ctx.ready and current == nil) and self.id or current
				ctx.active = current == self.id
			elseif not held then
				if ctx.active and ctx.on_release then ctx.on_release(self, ctx) end
				ctx.active = false
				ctx.ready, ctx.point, ctx.init, ctx.aligning, current = nil, nil, nil, nil, nil
			end

			local dpos, dsize = self.pos * render.dpi, self.size * render.dpi

			ctx.hovered = hovered or ctx.active

			local prefer = { nil, nil }
			local center = dpos + dsize * 0.5
			local wished = ctx.point and (ctx.point + mouse) * render.dpi or dpos

            ctx.progress[1] = motion.interp(ctx.progress[1], ctx.active, 0.1)
            ctx.progress[2] = motion.interp(ctx.progress[2], ctx.active or ctx.hovered, 0.1)

            local p = ctx.progress[1]
            local p2 = ctx.progress[2]

            render.push_alpha(ui.get_alpha())

            local draw_outline do
                local pos_start = self.pos - 4
                local pos_finish = self.pos + self.size + 4

                local rect_color = color_white:alpha_modulate(
                    0.1 * (p2 * 0.65 + 0.35), true
                )

                render.rect_outline(pos_start, pos_finish, rect_color, 1, 4)
            end

			render.push_alpha(p)

			if p > 0 and not common.is_button_down(0xA2) then
				local wished_center = (wished + dsize * 0.5) / render.dpi
				for i, v in ipairs(ctx.rulers) do
					v[4] = v[4] or {0}
					local sp = v[2] / render.dpi

					local dist = math.abs(v[1] and wished_center.x - sp.x or wished_center.y - sp.y)
					local allowed = dist < (10 * render.dpi)

					local a, b = sp, v[1] and vector(sp.x + 1, v[3] / render.dpi) or vector(v[3] / render.dpi, sp.y + 1)

					local pxy = v[1] and 1 or 2
					if not prefer[pxy] then
						prefer[pxy] = allowed and (v[1] and sp.x - self.size.x * 0.5 or sp.y - self.size.y * 0.5) or nil
					end

					local adist = math.abs(v[1] and center.x - sp.x or center.y - sp.y)
                    ctx.progress[4] = motion.interp(ctx.progress[4], allowed or adist < (10 * render.dpi), 0.1)


					local pp = ctx.progress[4] * 0.1 + 0.05
					render.rect(a, b, color_white:alpha_modulate(pp, true))
				end
				if ctx.border[3] then
					local inside = utilities.in_bounds(self.pos, ctx.border[1], ctx.border[2] - self.size * 0.5 - 1)
                    ctx.progress[3] = motion.interp(ctx.progress[3], not inside, 0.1)

                    local p3 = ctx.progress[3]
					render.rect_outline(ctx.border[1] / render.dpi, ctx.border[2] / render.dpi, color_white:alpha_modulate(p3 * 0.75 + 0.25, true), 1, 4)
				end
			end

			render.pop_alpha()
			render.pop_alpha()

			--
			if ctx.active then
				local fin = wished / render.dpi
				if common.is_button_down(0xA0) then
					local vtov = ctx.init:to(fin)
					local x, y = math.abs(vtov.y), math.abs(vtov.x)

					if ctx.aligning == nil then
						if x > 0.9 then ctx.aligning = 0 elseif y > 0.9 then ctx.aligning = 1 end
					end

					if ctx.aligning == 0 then
						fin.x = ctx.init.x
						render.rect(vector(fin.x + self.size.x * 0.5, 0), vector(fin.x + self.size.x * 0.5 + 1, screen.y), color(255, 64))
					elseif ctx.aligning == 1 then
						fin.y = ctx.init.y
						render.rect(vector(0, fin.y + self.size.y * 0.5), vector(screen.x, fin.y + self.size.y * 0.5 + 1), color(255, 64))
					end
				end
				fin.x, fin.y = prefer[1] or fin.x, prefer[2] or fin.y

				--
				local min, max = (ctx.border[1] - dsize * 0.5) / render.dpi, (ctx.border[2] - dsize * 0.5) / render.dpi
				local x, y = math.clamp(fin.x, min.x, math.min(max.x, screen.x - self.size.x)), math.clamp(fin.y, min.y, math.min(max.y, screen.y - self.size.y))

				self:set_position(x, y)

				if ctx.on_active then ctx.on_active(self, ctx, fin) end
			end
		end
	}
end

debug_point 'begin_widget'

-- from @enq
local widget do
    local memoized_screen = render.screen_size()

    local function get_screen_size()
        local screen = render.screen_size()

        if screen.x == 0 and screen.y == 0 then
            return memoized_screen
        end

        if memoized_screen.x == 0 and memoized_screen.y == 0 then
            memoized_screen = screen:clone()
        end

        return screen
    end

	local widget_mt; widget_mt = {
		update = function (self) return 1 end,
		paint = function (self, pos, fin) end,

		set_position = function (self, xpos, ypos)
			local x, y

			if type(xpos) == 'userdata' then
                x, y = xpos.x, xpos.y
            else
                x, y = xpos, ypos
            end

            local screen = get_screen_size()

            if screen.x == 0 and screen.y == 0 then
                return
            end

			if self.__drag then
				if x then self.__drag.config.x:set( x / screen.x * 10000 ) end
				if y then self.__drag.config.y:set( y / screen.y * 10000 ) end
			else
				self.pos.x, self.pos.y = x or self.pos.x, y or self.pos.y
			end
		end,

		get_drag_position = function (self)
			local ctx = self.__drag and self.__drag.config
			if not ctx then return self.pos end

            local screen = get_screen_size()
            if screen.x == 0 and screen.y == 0 then return self.pos end

            local rx, ry = ctx.x:get(), ctx.y:get()

			return vector(rx * .0001 * screen.x, ry * .0001 * screen.y)
		end,

		get_drag_size = function (self)
			return self.size:clone()
		end,

		__call = function (self)
			local __list, __drag = self.__list, self.__drag
			if __list then
				__list.items, __list.active = __list.collect(), 0
				for i = 1, #__list.items do
					if __list.items[i].active then __list.active = __list.active + 1 end
				end
			end

            self:sanitize_pos()
			self.alpha = self:update()

			render.push_alpha(self.alpha)

			if self.alpha > 0 then
				if __drag then drag.process(self) end
				if __list then widget_mt.traverse(self) end

                self:paint(self.pos, self.pos + self.size)
			end

			render.pop_alpha()
		end,

        sanitize_pos = function (self)
            local screen = get_screen_size()

            if screen.x == 0 and screen.y == 0 then
                return
            end

            local ctx = self.__drag

            local min = ctx.border[1] - self.size * 0.5
            local max = ctx.border[2] - self.size * 0.5

            local old_x = self.pos.x
            local old_y = self.pos.y

            self.pos.x = math.clamp(self.pos.x, min.x, math.min(max.x, screen.x - self.size.x))
            self.pos.y = math.clamp(self.pos.y, min.y, math.min(max.y, screen.y - self.size.y))

            if old_x ~= self.pos.x or old_y ~= self.pos.y then
                self:set_position(self.pos.x, self.pos.y)
            end
        end,

		enlist = function (self, collector, painter, rev)
			self.__list = {
				items = {}, progress = setmetatable({}, { __mode = 'k' }),
				longest = 0, active = 0, minwidth = self.size.x,
				collect = collector, paint = painter, rev = rev,
			}
		end,
		traverse = function (self)
			local ctx, offset, latest = self.__list, 0, vector()
			ctx.active, ctx.longest = 0, 0

			for i = 1, #ctx.items, 1 do
				local v = ctx.items[i]
				local id = v.name or i
				ctx.progress[id] = ctx.progress[id] or {0}
				local p = anima.condition(ctx.progress[id], v.active, 6, {
					{1, 3}, {2, 3}
				})

				if p > 0 then
					render.push_alpha(p)
					latest = ctx.paint(self, v, offset, p)
					render.pop_alpha()

					ctx.active, offset = ctx.active + 1, offset + (latest.y * p)
					ctx.longest = math.max(ctx.longest, latest.x)
				end
			end

			self.size.x = anima.lerp(self.size.x, math.max(ctx.longest, ctx.minwidth), 10, .5)
		end,

		lock = function (self, b)
			if not self.__drag then return end
			self.__drag.locked = b and true or false
		end,

	}	widget_mt.__index = widget_mt

	--
	widget = {
		new = function (id, pos, size, draggable)
			local obj = {
				id = id, pos = pos, size = size,
				alpha = 1, progress = {0}
			}

			if draggable then
				drag.new(obj, type(draggable) == 'table' and draggable or nil)
			end

			return setmetatable(obj, widget_mt)
		end
	}
end

debug_point 'begin_text_anims'

local text_anims do
    text_anims = { }

    local function u8(str)
        local chars = { }
        local count = 0

        for c in string.gmatch(str, '.[\128-\191]*') do
            count = count + 1
            chars[count] = c
        end

        return chars, count
    end

    function text_anims.gradient(str, time, color_a, color_b, offset)
        local list = { }

        local strbuf, strlen = u8(str)
        local div = 1 / (strlen - 1)

        local delta_r = color_b.r - color_a.r
        local delta_g = color_b.g - color_a.g
        local delta_b = color_b.b - color_a.b
        local delta_a = color_b.a - color_a.a

        for i = 1, strlen do
            local char = strbuf[i]

            local t = time do
                t = t % 2

                if t > 1 then
                    t = 2 - t
                end
            end

            local r = color_a.r + t * delta_r
            local g = color_a.g + t * delta_g
            local b = color_a.b + t * delta_b
            local a = color_a.a + t * delta_a

            local hex = string.format(
                '%02x%02x%02x%02x',
                r, g, b, a
            )

            table.insert(list, '\a')
            table.insert(list, hex)
            table.insert(list, char)

            time = time + div * (offset or 1.0)
        end

        return table.concat(list)
    end
end

debug_point 'begin_session'

local session do
    session = { }

    session.force_lethal = {
        updated_division = false,
        updated_this_tick = false
    }

    session.hitchance = {
        updated_this_tick = false
    }
end

debug_point 'begin_const'

local const do
    const = { }

    const.teams = {
        [1] = 'T',
        [2] = 'CT'
    }

    const.states = {
        [0]  = 'Default',
        [1]  = 'Standing',
        [2]  = 'Slowwalking',
        [3]  = 'Running',
        [4]  = 'Ducking',
        [5]  = 'Sneaking',
        [6]  = 'In Air',
        [7]  = 'In Air & Duck',
        [8]  = 'Freestanding',
        [9]  = 'On Peek'
    }
end

debug_point 'begin_locker_system'

local locker_system do
    locker_system = { }

    local LEVELS = {
        ['Debug'] = -1,
        ['Live']  =  0
    }

    local LEVEL = LEVELS[
        script.build
    ]

    local list = { }

    local function update_item(item, value)
        item:set(unpack(value))
        item:disabled(true)
    end

    local function update_items()
        for i = 1, #list do
            local data = list[i]

            update_item(
                data.item,
                data.value
            )
        end
    end

    function locker_system.is_locked(level)
        -- debug check
        if LEVEL == -1 then
            return false
        end

        -- if not in debug
        if level == -1 then
            return true
        end

        return LEVEL >= level
    end

    function locker_system.push(level, item, ...)
        if not locker_system.is_locked(level) then
            return item
        end

        local value = { ... }

        if select('#', ...) == 0 then
            value = { false }
        end

        table.insert(list, {
            item = item,
            value = value
        })

        local function callback(item)
            update_item(item, value)
        end

        item:set_callback(
            callback, true
        )

        return item
    end

    local function on_config_state(state)
        if state == 'pre_save' then
            update_items()
        end
    end

    on_config_state = create_debug_callback('locker_system.on_config_state', on_config_state)

    utils.execute_after(
        0, update_items
    )

    events.config_state(
        on_config_state
    )
end

debug_point 'begin_resource'

local resource do
    resource = { }

    local COLUMN_LEFT  = 1
    local COLUMN_RIGHT = 2

    local TAB_HOME     = merge('\a', '{Link Active}', ui.get_icon 'house')
    local TAB_ANTIAIM  = merge('\a', '{Link Active}', ui.get_icon 'shield')
    local TAB_FEATURES = merge('\a', '{Link Active}', ui.get_icon 'grid-2')

    local function get_space(count)
        return string.rep(HSP, count)
    end

    local function add_space(text, count)
        local space = string.rep(HSP, count)
        local result = space .. text .. space

        return result
    end

    local function prefix_title_ex(prefix_color, prefix, title, left_space, right_space)
        return get_space(left_space) .. '\a' .. prefix_color .. prefix
            .. get_space(right_space) .. '\aDEFAULT' .. title
    end

    local function prefix_title(prefix, title, left_space, right_space)
        return prefix_title_ex('{Link Active}', prefix, title, left_space, right_space)
    end

    local function icon_title_ex(icon_color, icon, title, left_space, right_space)
        return prefix_title_ex(icon_color, ui.get_icon(icon), title, left_space, right_space)
    end

    local function icon_title(icon, title, left_space, right_space)
        return icon_title_ex('{Link Active}', icon, title, left_space, right_space)
    end

    local function button_title_ex(icon_color, icon_name, title, space)
        local spacing = get_space(space)
        local padding = get_space(3)

        local icon = ui.get_icon(icon_name)

        return spacing .. '\a' .. icon_color .. icon
            .. padding .. '\aDEFAULT' .. title .. spacing
    end

    local function button_title(icon_name, title, space)
        return button_title_ex('{Link Active}', icon_name, title, space)
    end

    local function button_icon_ex(icon_color, icon_name, space)
        local icon = ui.get_icon(icon_name)
        local spacing = get_space(space)

        return spacing .. '\a' .. icon_color .. icon .. spacing
    end

    local function button_icon(icon_name, space)
        return button_icon_ex('{Link Active}', icon_name, space)
    end

    local function lock_unselection(item, default_value)
        local old_value = item:get()

        if #old_value == 0 then
            if default_value == nil then
                local type = item:type()
                local list = item:list()

                if type == 'selectable' then
                    default_value = list
                elseif type == 'listable' then
                    default_value = { }

                    for i = 1, #list do
                        default_value[i] = i
                    end
                end
            end

            old_value = default_value
            item:set(default_value)
        end

        item:set_callback(function()
            local value = item:get()

            if #value > 0 then
                old_value = value
            else
                item:set(old_value)
            end
        end)
    end

    local groups = {
        home = {
            location = menu.create(
                TAB_HOME, '\a{Link Active}Location', COLUMN_LEFT
            ),

            profile = menu.create(
                TAB_HOME, '\a{Link Active}Profile', COLUMN_RIGHT
            ),

            activity = menu.create(
                TAB_HOME, '\a{Link Active}Activity', COLUMN_RIGHT
            ),

            config = menu.create(
                TAB_HOME, '\a{Link Active}Be kind for everyone', COLUMN_RIGHT
            )
        },

        antiaim = {
            selector = menu.create(
                TAB_ANTIAIM, '##AA_SELECTOR', COLUMN_RIGHT
            ),

            settings = menu.create(
                TAB_ANTIAIM, '##AA_SETTINGS', COLUMN_RIGHT
            ),

            builder = menu.create(
                TAB_ANTIAIM, '##AA_BUILDER', COLUMN_RIGHT
            ),

            state = menu.create(
                TAB_ANTIAIM, '##AA_STATE', COLUMN_RIGHT
            ),

            send = menu.create(
                TAB_ANTIAIM, '##AA_SEND', COLUMN_RIGHT
            ),

            settings_extra = menu.create(
                TAB_ANTIAIM, '##AA_SETTINGS_EXTRA', COLUMN_LEFT
            )
        },

        features = {
            category = menu.create(
                TAB_FEATURES, '##CATEGORY', COLUMN_LEFT
            ),

            visuals = menu.create(
                TAB_FEATURES, '##VISUALS', COLUMN_LEFT
            ),

            render = menu.create(
                TAB_FEATURES, '##RENDER', COLUMN_RIGHT
            ),

            extra = menu.create(
                TAB_FEATURES, '##EXTRA', COLUMN_LEFT
            ),

            ragebot = menu.create(
                TAB_FEATURES, '##RAGEBOT', COLUMN_RIGHT
            ),

            misc = menu.create(
                TAB_FEATURES, '##MISC', COLUMN_RIGHT
            ),

            movement = menu.create(
                TAB_FEATURES, '##MOVEMENT', COLUMN_LEFT
            )
        }
    }

    local sidebar do
        local function on_render()
            local style = ui.get_style()

            local link_active = style['Link Active']
            local disabled_text = style['Disabled Text']

            local str = string.format(
                '%s\u{200A}', script.name
            )

            local name = text_anims.gradient(
                str, -globals.realtime,
                link_active, disabled_text
            )

            ui.sidebar(name, 'snowflake')
        end

        on_render = create_debug_callback('sidebar.on_render', on_render)

        events.render(on_render)
    end

    local location do
        local function title_select_ex(col, icon, title, left_space, right_space, active)
            local result = '\a' .. col:to_hex()

            if active then
                result = result .. '»' .. get_space(5)
            end

            result = result .. get_space(left_space) .. ui.get_icon(icon)
            result = result .. get_space(right_space) .. title

            return result
        end

        local function get_list(value)
            local list = { }

            local titles = {
                { 'user', 'Profile', 1, 7 },
                { 'chart-line', 'Activity', 1, 6 },
                { 'floppy-disks', 'Local configs', 1, 6 }
            }

            local link_active = ui.get_style 'Link Active'

            for i = 1, #titles do
                local title = titles[i]
                local is_active = i == value

                local col = link_active

                if not is_active then
                    col = col:clone()
                    col.a = col.a * 0.5
                end

                table.insert(list, title_select_ex(col, title[1], title[2], title[3], title[4], is_active))
            end

            return list
        end

        location = groups.home.location:list(
            '##LOCATION', { }
        )

        local callbacks do
            local function on_location(item)
                local value = item:get()

                groups.home.profile:visibility(value == 1)
                groups.home.activity:visibility(value == 2)
                groups.home.config:visibility(value == 3)

                location:update(get_list(value))
            end

            location:set_callback(
                on_location, true
            )
        end
    end

    local profile = { } do
        local GRP_MAIN = groups.home.profile

        profile.username = GRP_MAIN:label(
            icon_title('user', common.get_username(), 1, 8)
        )

        profile.last_update = GRP_MAIN:label(
            icon_title('clock', '25 March 2025', 1, 7)
        )

        profile.scripts = GRP_MAIN:label(
            icon_title('link', 'Scripts', 0, 6)
        )

        if script.build ~= 'Live' then
            profile.live_button = GRP_MAIN:button('Live', nil, true)
        end

        if script.build ~= 'Secret' then
            profile.secret_button = GRP_MAIN:button('Secret', nil, true)
        end

        if script.build ~= 'Debug' then
            profile.debug_button = GRP_MAIN:button('Debug', nil, true)
        end

        resource.profile = profile
    end

    local activity = { } do
        local GRP_MAIN = groups.home.activity

        if trial.time == nil then
            activity.session_time_label = GRP_MAIN:label(
                icon_title('clock', 'Time Played', 1, 6)
            )

            activity.session_time_button = GRP_MAIN:button(
                '\a{Link Active}0s##SESSION_TIME', nil, true
            )
        else
            activity.time_left_label = GRP_MAIN:label(
                icon_title('clock', 'Time Left', 1, 6)
            )

            activity.time_left_button = GRP_MAIN:button(
                '\a{Link Active}0s##TIME_LEFT', nil, true
            )
        end

        activity.killes_label = GRP_MAIN:label(
            icon_title('skull-crossbones', 'Enemies killed', 2, 6)
        )

        activity.killes_button = GRP_MAIN:button(
            '\a{Link Active}0##KILLS', nil, true
        )

        activity.misses_label = GRP_MAIN:label(
            icon_title('split', 'Local Misses', 1, 6)
        )

        activity.misses_button = GRP_MAIN:button(
            '\a{Link Active}0##MISSES', nil, true
        )

        resource.activity = activity
    end

    local presets = { } do
        local GRP_MAIN = groups.home.config

        local function get_label_text()
            local style = ui.get_style()

            local link_active = style['Link Active']
            local disabled_text = style['Disabled Text']

            local label = string.format(
                '© 2025 %s.lua', string.lower(
                    script.name
                )
            )

            local text = text_anims.gradient(
                label, -globals.realtime * 0.5,
                link_active, disabled_text
            )

            return get_space(40) .. text
        end

        presets.label = GRP_MAIN:label(
            get_label_text()
        )

        presets.list = GRP_MAIN:list(
            '##PRESET_LIST', {
                'Empty'
            }
        )

        presets.name = GRP_MAIN:input(
            '##PRESET_NAME', ''
        )

        presets.load = GRP_MAIN:button(
            button_icon('download', 7), nil, true
        )

        presets.save = GRP_MAIN:button(
            button_icon('floppy-disk', 7), nil, true
        )

        presets.delete = GRP_MAIN:button(
            button_icon_ex('CD3030FF', 'trash', 6), nil, true
        )

        presets.export = GRP_MAIN:button(
            button_icon_ex('DEFAULT', 'copy', 6), nil, true
        )

        presets.import = GRP_MAIN:button(
            button_icon_ex('DEFAULT', 'paste', 6), nil, true
        )

        presets.load:tooltip 'Loads selected preset'
        presets.save:tooltip 'Creates/Saves current settings to preset'
        presets.delete:tooltip 'Deletes selected preset'
        presets.import:tooltip 'Imports preset from clipboard'
        presets.export:tooltip 'Exports preset to clipboard'

        local function on_render()
            if ui.get_alpha() == 0 then
                return
            end

            presets.label:name(
                get_label_text()
            )
        end

        on_render = create_debug_callback('presets.on_render', on_render)

        events.render(on_render)

        resource.presets = presets
    end

    local antiaim = { } do
        local GRP_SELECTOR = groups.antiaim.selector

        local GRP_STATE = groups.antiaim.state
        local GRP_SEND = groups.antiaim.send

        local GRP_SETTINGS = groups.antiaim.settings
        local GRP_SETTINGS_EXTRA = groups.antiaim.settings_extra

        local GRP_BUILDER = groups.antiaim.builder

        config_system.add('##ANTIAIM_STATE', GRP_STATE, 'AA')
        config_system.add('##ANTIAIM_SETTINGS', GRP_SETTINGS, 'AA')
        config_system.add('##ANTIAIM_SETTINGS_EXTRA', GRP_SETTINGS_EXTRA, 'AA')

        local selector = { } do
            selector.list = GRP_SELECTOR:list(
                '##LIST', {
                    icon_title('bars-staggered', 'Setup', 1, 8),
                    icon_title('slider', 'Builder', 1, 8)
                }
            )
        end

        local builder = { } do
            local builder_groups = { }

            local state_list = {
                unpack(const.states, 0)
            }

            local function export_values_list(list)
                if list == nil then
                    return
                end

                local values = { }

                for k, v in pairs(list) do
                    if type(v) == 'userdata' then
                        local item_type = v:type()

                        if item_type == 'label' then
                            goto continue
                        end

                        if item_type == 'button' then
                            goto continue
                        end

                        local result = {
                            pcall(v.get, v)
                        }

                        if result[1] then
                            values[k] = {
                                unpack(result, 2)
                            }
                        end
                    end

                    if type(v) == 'table' then
                        values[k] = export_values_list(v)
                    end

                    ::continue::
                end

                return values
            end

            local function import_values_list(src, dst)
                if src == nil or dst == nil then
                    return
                end

                for k, v in pairs(dst) do
                    local item = src[k]

                    if item == nil or type(v) ~= 'table' then
                        goto continue
                    end

                    if type(item) == 'userdata' then
                        pcall(item.set, item, unpack(v))
                    end

                    if type(item) == 'table' then
                        import_values_list(item, v)
                    end

                    ::continue::
                end
            end

            local team_selector do
                local function title_select_ex(col, title, active)
                    local result = '\a' .. col:to_hex()

                    if active then
                        result = result .. '»' .. get_space(5)
                    end

                    result = result .. title

                    return result
                end

                local function get_list(value)
                    local list = { }

                    local titles = {
                        'Terrorists',
                        'Counter-Terrorists'
                    }

                    local link_active = ui.get_style 'Link Active'

                    for i = 1, #titles do
                        local title = titles[i]
                        local is_active = i == value

                        local col = link_active

                        if not is_active then
                            col = col:clone()
                            col.a = col.a * 0.5
                        end

                        table.insert(list, title_select_ex(col, title, is_active))
                    end

                    return list
                end

                builder.team = GRP_BUILDER:list(
                    '##TEAM', get_list(0)
                )

                local callbacks do
                    local function on_team(item)
                        item:update(get_list(item:get()))
                    end

                    builder.team:set_callback(
                        on_team, true
                    )
                end
            end

            local update_visibility do
                local function update_builder(value)
                    local current_team = builder.team:get() == 1 and 'T' or 'CT'
                    builder.team:visibility(value)

                    for i = 1, #const.teams do
                        local team = const.teams[i]

                        local is_team_visible = value

                        if current_team ~= team then
                            is_team_visible = false
                        end

                        local team_items = builder[team]
                        local team_groups = builder_groups[team]

                        local current_state = team_items.state:get()
                        team_items.state:visibility(is_team_visible)

                        for j = 1, #state_list do
                            local state = state_list[j]

                            local items = team_items[state]
                            local groups = team_groups[state]

                            local is_visible = (
                                current_state == state
                                and is_team_visible
                            )

                            if groups ~= nil then
                                if groups.root ~= nil then
                                    groups.root:visibility(is_visible)

                                    if items ~= nil and items.enabled ~= nil then
                                        items.enabled:visibility(is_visible)
                                        is_visible = is_visible and items.enabled:get()
                                    end
                                end

                                if groups.angles ~= nil then
                                    groups.angles:visibility(is_visible)
                                end

                                if groups.defensive ~= nil then
                                    groups.defensive:visibility(is_visible)
                                end

                                if groups.antibrute ~= nil then
                                    groups.antibrute:visibility(is_visible)
                                end
                            end
                        end
                    end
                end

                function update_visibility()
                    local value = selector.list:get()

                    local is_settings = value == 1
                    local is_anti_aim = value == 2

                    update_builder(is_anti_aim)

                    GRP_STATE:visibility(is_anti_aim)
                    GRP_SEND:visibility(is_anti_aim)

                    GRP_SETTINGS:visibility(is_settings)
                    GRP_SETTINGS_EXTRA:visibility(is_settings)
                end
            end

            local function create_items_angles(group, list)
                local yaw_list = {
                    '1-Way',
                    '2-Way'
                }

                local jitter_list = {
                    'Off',
                    'Offset',
                    'Center',
                    'Skitter',
                    'Spin',
                    'Random',
                    '3-Way',
                    '5-Way'
                }

                local delay_mode_list = {
                    'Default',
                    'Random'
                }

                if not locker_system.is_locked(-1) then
                    table.insert(jitter_list, 'Frost')
                    table.insert(jitter_list, 'Frostbomber')
                end

                table.insert(delay_mode_list, 'Custom')

                list.yaw = group:combo(icon_title('arrow-down-short-wide', 'Yaw', 1, 5), yaw_list) do
                    local gear = list.yaw:create()

                    list.yaw_method = gear:combo(
                        icon_title('bars-progress', 'Method', 1, 6), {
                            'Default',
                            'Wave',
                            'Shake'
                        }
                    )

                    list.yaw_frequency = gear:slider(
                        icon_title('wave-sine', 'Frequency', 0, 5), 0, 60, 0, nil
                    )

                    list.yaw_amplitude = gear:slider(
                        icon_title('wave-triangle', 'Amplitude', 0, 5), 0, 30, 0, nil
                    )

                    list.yaw_min = gear:slider(
                        icon_title('chevrons-left', 'Min. Yaw', 1, 7), 0, 100, 0, nil
                    )

                    list.yaw_max = gear:slider(
                        icon_title('chevrons-right', 'Max. Yaw', 1, 7), 0, 100, 0, nil
                    )

                    list.yaw_scale = gear:slider(
                        icon_title('expand', 'Scale', 1, 7), 0, 100, 0, nil
                    )

                    list.yaw_offset = group:slider(
                        icon_title('arrows-rotate', 'Offset', 1, 6), -180, 180, 0, nil, '°'
                    )

                    list.yaw_left = gear:slider(
                        icon_title('arrow-left', 'Yaw Left', 1, 7), -180, 180, 0, nil, '°'
                    )

                    list.yaw_left_randomize = gear:switch(
                        prefix_title('•', 'Left Random', 3, 8)
                    )

                    list.yaw_left_random = gear:slider(
                        '##YAW_LEFT_RANDOM', -180, 180, 0, nil, '°'
                    )

                    list.yaw_right = gear:slider(
                        icon_title('arrow-right', 'Yaw Right', 1, 7), -180, 180, 0, nil, '°'
                    )

                    list.yaw_right_randomize = gear:switch(
                        prefix_title('•', 'Right Random', 3, 8)
                    )

                    list.yaw_right_random = gear:slider(
                        '##YAW_RIGHT_RANDOM', -180, 180, 0, nil, '°'
                    )

                    list.delay = gear:switch(
                        prefix_title('⤷', 'Delay', 2, 6)
                    )

                    list.delay_mode = gear:combo(
                        icon_title('rotate-right', 'Mode', 1, 6), delay_mode_list
                    )

                    list.delay_random = gear:slider(
                        icon_title('shuffle', 'Random', 1, 6), 0, 100, 0, nil, '%'
                    )

                    list.delay_timing = gear:slider(
                        icon_title('clock', 'Timing', 1, 6), 2, 22, 2, nil, 't'
                    )

                    list.delay_min_timing = gear:slider(
                        icon_title('clock', 'Min. Timing', 1, 6), 1, 22, 2, nil, 't'
                    )

                    list.delay_max_timing = gear:slider(
                        icon_title('clock', 'Max. Timing', 1, 6), 1, 22, 2, nil, 't'
                    )

                    list.delay_sliders = gear:slider(
                        icon_title('shoe-prints', 'Sliders', 0, 5), 2, 8, 2, nil
                    )

                    for i = 1, 8 do
                        list['delay_' .. i] = gear:slider(
                            icon_title('stairs', string.format('Slider: %d', i), 0, 6), 1, 22, 2, nil, 't'
                        )
                    end

                    list.delay_button = gear:button(
                        button_title('arrow-turn-down-right', 'Delay', 46), nil, true
                    )

                    list.back_button = gear:button(
                        button_title('arrow-turn-down-left', 'Back', 47), nil, true
                    )

                    local callbacks do
                        local function on_delay_sliders(item)
                            local value = tonumber(item:get())

                            if value == nil then
                                return
                            end

                            for i = 1, 8 do
                                list['delay_' .. i]:visibility(i <= value)
                            end
                        end

                        local function update_delay(value)
                            local is_default = value == 'Default'
                            local is_random = value == 'Random'
                            local is_custom = value == 'Custom'

                            list.delay_random:visibility(not is_random)
                            list.delay_timing:visibility(is_default)

                            list.delay_min_timing:visibility(is_random)
                            list.delay_max_timing:visibility(is_random)

                            list.delay_sliders:visibility(is_custom)

                            if is_custom then
                                list.delay_sliders:set_callback(on_delay_sliders, true)
                            else
                                list.delay_sliders:unset_callback(on_delay_sliders)
                            end

                            if not is_custom then
                                for i = 1, 8 do
                                    list['delay_' .. i]:visibility(false)
                                end
                            end
                        end

                        local function on_yaw_method(item)
                            local value = item:get()

                            local is_wave = value == 'Wave'
                            local is_shake = value == 'Shake'

                            list.yaw_frequency:visibility(is_wave)
                            list.yaw_amplitude:visibility(is_wave)

                            list.yaw_min:visibility(is_shake)
                            list.yaw_max:visibility(is_shake)
                            list.yaw_scale:visibility(is_shake)
                        end

                        local function on_yaw_left_randomize(item)
                            list.yaw_left_random:visibility(item:get())
                        end

                        local function on_yaw_right_randomize(item)
                            list.yaw_right_random:visibility(item:get())
                        end

                        local function on_delay_mode(item)
                            update_delay(item:get())
                        end

                        local function on_delay(item)
                            local value = item:get()

                            list.delay_mode:visibility(value)

                            if not value then
                                list.delay_random:visibility(false)
                                list.delay_timing:visibility(false)

                                list.delay_min_timing:visibility(false)
                                list.delay_max_timing:visibility(false)

                                list.delay_sliders:visibility(false)

                                for i = 1, 8 do
                                    list['delay_' .. i]:visibility(false)
                                end
                            end

                            if value then
                                list.delay_mode:set_callback(on_delay_mode, true)
                            else
                                list.delay_mode:unset_callback(on_delay_mode)
                            end
                        end

                        local function on_delay_button()
                            list.yaw_method:visibility(false)
                            list.yaw_method:unset_callback(on_yaw_method)

                            list.yaw_frequency:visibility(false)
                            list.yaw_amplitude:visibility(false)

                            list.yaw_min:visibility(false)
                            list.yaw_max:visibility(false)
                            list.yaw_scale:visibility(false)

                            list.yaw_left:visibility(false)
                            list.yaw_left_randomize:visibility(false)
                            list.yaw_left_random:visibility(false)
                            list.yaw_left_randomize:unset_callback(on_yaw_left_randomize)

                            list.yaw_right:visibility(false)
                            list.yaw_right_randomize:visibility(false)
                            list.yaw_right_random:visibility(false)
                            list.yaw_right_randomize:unset_callback(on_yaw_right_randomize)

                            list.delay:visibility(true)
                            list.delay:set_callback(on_delay, true)

                            list.delay_button:visibility(false)
                            list.back_button:visibility(true)
                        end

                        local function on_back_button()
                            list.yaw_method:visibility(true)
                            list.yaw_method:set_callback(on_yaw_method, true)

                            list.yaw_left:visibility(true)
                            list.yaw_left_randomize:visibility(true)
                            list.yaw_left_randomize:set_callback(on_yaw_left_randomize, true)

                            list.yaw_right:visibility(true)
                            list.yaw_right_randomize:visibility(true)
                            list.yaw_right_randomize:set_callback(on_yaw_right_randomize, true)

                            list.delay:visibility(false)
                            list.delay:unset_callback(on_delay)

                            list.delay_mode:visibility(false)
                            list.delay_mode:unset_callback(on_delay_mode)

                            list.delay_random:visibility(false)
                            list.delay_timing:visibility(false)

                            list.delay_min_timing:visibility(false)
                            list.delay_max_timing:visibility(false)

                            list.delay_sliders:visibility(false)
                            list.delay_sliders:unset_callback(on_delay_sliders)

                            for i = 1, 8 do
                                list['delay_' .. i]:visibility(false)
                            end

                            list.delay_button:visibility(true)
                            list.back_button:visibility(false)
                        end

                        local function on_yaw(item)
                            gear:visibility(item:get() == '2-Way')
                        end

                        list.yaw:set_callback(
                            on_yaw, true
                        )

                        list.delay_button:set_callback(
                            on_delay_button, true
                        )

                        list.back_button:set_callback(
                            on_back_button, true
                        )
                    end
                end

                list.yaw_modifier = group:combo(icon_title('arrow-down-left-and-arrow-up-right-to-center', 'Modifier', 1, 6), jitter_list) do
                    local gear = list.yaw_modifier:create()

                    local modifier_list do
                        modifier_list = {
                            'Default',
                            'Random',
                            'Custom'
                        }
                    end

                    list.modifier_switcher = gear:combo(
                        icon_title('gear', 'Switcher', 1, 6), {
                            'Default',
                            'Ticks',
                            'Random'
                        }
                    )

                    list.modifier_ticks_value = gear:slider(
                        '##SWITCHER_VALUE', 3, 16, 0, nil, 't'
                    )

                    list.modifier_random_value = gear:slider(
                        '##SWITCHER_VALUE', 4, 16, 0, nil, 't'
                    )

                    list.modifier_mode = gear:combo(
                        icon_title('rotate-right', 'Mode', 1, 6), modifier_list
                    )

                    list.modifier_offset = gear:slider(
                        icon_title('arrows-rotate', 'Offset', 1, 6), -180, 180, 0, nil, '°'
                    )

                    list.modifier_random = gear:slider(
                        icon_title('shuffle', 'Random', 1, 6), 0, 100, 0, nil, '%'
                    )

                    list.modifier_min_offset = gear:slider(
                        icon_title('arrows-rotate', 'Min. Offset', 1, 6), -180, 180, 0, nil, '°'
                    )

                    list.modifier_max_offset = gear:slider(
                        icon_title('arrows-rotate', 'Max. Offset', 1, 6), -180, 180, 0, nil, '°'
                    )

                    list.modifier_sliders = gear:slider(
                        icon_title('shoe-prints', 'Sliders', 0, 5), 2, 8, 2, nil
                    )

                    for i = 1, 8 do
                        list['modifier_offset_' .. i] = gear:slider(
                            icon_title('stairs', string.format('Slider: %d', i), 0, 6), -180, 180, 0, nil, '°'
                        )
                    end

                    local callbacks do
                        local function on_modifier_sliders(item)
                            local value = tonumber(item:get())

                            if value == nil then
                                return
                            end

                            for i = 1, 8 do
                                list['modifier_offset_' .. i]:visibility(i <= value)
                            end
                        end

                        local function on_modifier_switcher(item)
                            local value = item:get()

                            list.modifier_ticks_value:visibility(value == 'Ticks')
                            list.modifier_random_value:visibility(value == 'Random')
                        end

                        local function on_modifier_mode(item)
                            local value = item:get()

                            local is_default = value == 'Default'
                            local is_random = value == 'Random'
                            local is_custom = value == 'Custom'

                            list.modifier_offset:visibility(is_default)
                            list.modifier_random:visibility(is_default or is_custom)

                            list.modifier_min_offset:visibility(is_random)
                            list.modifier_max_offset:visibility(is_random)

                            list.modifier_sliders:visibility(is_custom)

                            if is_custom then
                                list.modifier_sliders:set_callback(on_modifier_sliders, true)
                            else
                                list.modifier_sliders:unset_callback(on_modifier_sliders)
                            end

                            if not is_custom then
                                for i = 1, 8 do
                                    list['modifier_offset_' .. i]:visibility(false)
                                end
                            end
                        end

                        local function on_yaw_modifier(item)
                            local value = item:get()

                            local is_frostbomber = value == 'Frostbomber'

                            local has_mode = not is_frostbomber
                            list.modifier_mode:visibility(has_mode)

                            if has_mode then
                                list.modifier_mode:set_callback(on_modifier_mode, true)
                            else
                                list.modifier_mode:unset_callback(on_modifier_mode)
                            end

                            if not has_mode then
                                local has_min_max = is_frostbomber

                                list.modifier_offset:visibility(not has_min_max)
                                list.modifier_random:visibility(false)

                                list.modifier_min_offset:visibility(has_min_max)
                                list.modifier_max_offset:visibility(has_min_max)

                                list.modifier_sliders:visibility(false)
                                list.modifier_sliders:unset_callback(on_modifier_sliders)

                                for i = 1, 8 do
                                    list['modifier_offset_' .. i]:visibility(false)
                                end
                            end
                        end

                        list.modifier_switcher:set_callback(
                            on_modifier_switcher, true
                        )

                        list.yaw_modifier:set_callback(
                            on_yaw_modifier, true
                        )
                    end
                end

                list.body_yaw = group:switch(icon_title('rotate', 'Body Yaw', 1, 6)) do
                    local gear = list.body_yaw:create()

                    list.body_yaw_jitter = gear:switch(
                        icon_title('dice-d6', 'Jitter', 1, 6)
                    )

                    list.body_yaw_type = gear:combo(
                        prefix_title('⤷', 'Type', 2, 6), {
                            'Default',
                            'Ticks',
                            'Random'
                        }
                    )

                    list.body_yaw_ticks_value = gear:slider(
                        '##SWITCHER_VALUE', 3, 16, 0, nil, 't'
                    )

                    list.body_yaw_random_value = gear:slider(
                        '##SWITCHER_VALUE', 4, 16, 0, nil, 't'
                    )

                    list.body_yaw_invert_chance = gear:slider(
                        icon_title('dice-d6', 'Invert Chance', 1, 6), 1, 100, 100, nil, '%'
                    )

                    list.body_yaw_freestanding = gear:combo(
                        icon_title('arrows-retweet', 'Freestanding', 0, 4), {
                            'Off',
                            'Default',
                            'Reversed'
                        }
                    )

                    list.body_yaw_limit_type = gear:combo(
                        prefix_title('⤷', 'Limit Type', 2, 6), {
                            'Default',
                            'Random',
                            'Ticks'
                        }
                    )

                    list.body_yaw_timing = gear:slider(
                        icon_title('clock', 'Timing', 1, 6), 2, 22, 2, nil, 't'
                    )

                    list.body_yaw_limit_left_value = gear:slider(
                        prefix_title('•', 'Left Limit', 3, 8), 0, 60, 60, nil, '°'
                    )

                    list.body_yaw_limit_right_value = gear:slider(
                        prefix_title('•', 'Right Limit', 3, 8), 0, 60, 60, nil, '°'
                    )

                    list.body_yaw_limit_min_value = gear:slider(
                        prefix_title('•', 'Min. Limit', 3, 8), 0, 60, 60, nil, '°'
                    )

                    list.body_yaw_limit_max_value = gear:slider(
                        prefix_title('•', 'Max. Limit', 3, 8), 0, 60, 60, nil, '°'
                    )

                    list.body_yaw_other_button = gear:button(
                        button_title('arrow-turn-down-right', 'Other', 45), nil, true
                    )

                    list.body_yaw_back_button = gear:button(
                        button_title('arrow-turn-down-left', 'Back', 47), nil, true
                    )

                    local callbacks do
                        local function on_body_yaw_type(item)
                            list.body_yaw_ticks_value:visibility(item:get() == 'Ticks')
                            list.body_yaw_random_value:visibility(item:get() == 'Random')
                        end

                        local function on_body_yaw_limit_type(item)
                            local value = item:get()

                            local is_default = value == 'Default'
                            local is_random = value == 'Random'
                            local is_ticks = value == 'Ticks'

                            list.body_yaw_timing:visibility(is_ticks)

                            list.body_yaw_limit_left_value:visibility(is_default)
                            list.body_yaw_limit_right_value:visibility(is_default)

                            list.body_yaw_limit_min_value:visibility(is_random or is_ticks)
                            list.body_yaw_limit_max_value:visibility(is_random or is_ticks)
                        end

                        local function on_other_button()
                            list.body_yaw_jitter:visibility(false)

                            list.body_yaw_type:visibility(false)
                            list.body_yaw_type:unset_callback(on_body_yaw_type)

                            list.body_yaw_ticks_value:visibility(false)
                            list.body_yaw_random_value:visibility(false)

                            list.body_yaw_invert_chance:visibility(true)
                            list.body_yaw_freestanding:visibility(true)

                            list.body_yaw_limit_type:visibility(true)
                            list.body_yaw_limit_type:set_callback(on_body_yaw_limit_type, true)

                            list.body_yaw_other_button:visibility(false)
                            list.body_yaw_back_button:visibility(true)
                        end

                        local function on_back_button()
                            list.body_yaw_jitter:visibility(true)

                            list.body_yaw_type:visibility(true)
                            list.body_yaw_type:set_callback(on_body_yaw_type, true)

                            list.body_yaw_invert_chance:visibility(false)
                            list.body_yaw_freestanding:visibility(false)

                            list.body_yaw_limit_type:visibility(false)
                            list.body_yaw_limit_type:unset_callback(on_body_yaw_limit_type)

                            list.body_yaw_timing:visibility(false)

                            list.body_yaw_limit_left_value:visibility(false)
                            list.body_yaw_limit_right_value:visibility(false)

                            list.body_yaw_limit_min_value:visibility(false)
                            list.body_yaw_limit_max_value:visibility(false)

                            list.body_yaw_other_button:visibility(true)
                            list.body_yaw_back_button:visibility(false)
                        end

                        list.body_yaw_type:set_callback(
                            on_body_yaw_type, true
                        )

                        list.body_yaw_other_button:set_callback(on_other_button, true)
                        list.body_yaw_back_button:set_callback(on_back_button, true)
                    end
                end

                return list
            end

            local function create_items_defensive(group, list)
                local pitch_list = {
                    'Off',
                    'Static',
                    'Jitter',
                    'Spin',
                    'Random',
                    'Static Random'
                }

                local yaw_list = {
                    'Off',
                    'Static',
                    'Spin',
                    'Random',
                    'Left/Right',
                    'Static Random'
                }

                local yaw_modifier_list = {
                    'Off',
                    'Offset',
                    'Center',
                    'Skitter'
                }

                list.force_defensive = group:switch(prefix_title('•', 'Tickbase', 3, 8)) do
                    local gear = list.force_defensive:create()

                    local modes_list do
                        modes_list = {
                            'Default',
                            'Random',
                            'Custom'
                        }
                    end

                    list.custom_defensive_ticks = gear:switch(
                        icon_title('shield', 'Custom Defensive Ticks', 0, 7)
                    )

                    list.defensive_ticks_mode = gear:combo(
                        prefix_title('•', 'Mode', 1, 6), modes_list
                    )

                    list.defensive_ticks = gear:slider(
                        button_title('arrow-turn-down-right', 'Ticks', 10, 7), 2, 22, 15, nil, 't'
                    )

                    list.min_defensive_ticks = gear:slider(
                        button_title('arrow-turn-down-right', 'Min. Ticks', 10, 7), 2, 22, 15, nil, 't'
                    )

                    list.max_defensive_ticks = gear:slider(
                        button_title('arrow-turn-down-right', 'Max. Ticks', 10, 7), 2, 22, 15, nil, 't'
                    )

                    list.defensive_ticks_sliders = gear:slider(
                        icon_title('shoe-prints', 'Sliders', 0, 5), 2, 8, 2, nil
                    )

                    for i = 1, 8 do
                        list['defensive_ticks_' .. i] = gear:slider(
                            icon_title('stairs', string.format('Slider: %d', i), 0, 6), 2, 22, 15, nil, 't'
                        )
                    end

                    locker_system.push(-1, list.custom_defensive_ticks)

                    local callbacks do
                        local function on_defensive_ticks_sliders(item)
                            local value = tonumber(item:get())

                            if value == nil then
                                return
                            end

                            for i = 1, 8 do
                                list['defensive_ticks_' .. i]:visibility(i <= value)
                            end
                        end

                        local function on_defensive_ticks_mode(item)
                            local value = item:get()

                            local is_default = value == 'Default'
                            local is_random = value == 'Random'
                            local is_custom = value == 'Custom'

                            list.defensive_ticks:visibility(is_default)

                            list.min_defensive_ticks:visibility(is_random)
                            list.max_defensive_ticks:visibility(is_random)

                            list.defensive_ticks_sliders:visibility(is_custom)

                            if is_custom then
                                list.defensive_ticks_sliders:set_callback(on_defensive_ticks_sliders, true)
                            else
                                list.defensive_ticks_sliders:unset_callback(on_defensive_ticks_sliders)
                            end

                            if not is_custom then
                                for i = 1, 8 do
                                    list['defensive_ticks_' .. i]:visibility(false)
                                end
                            end
                        end

                        local function on_custom_defensive_ticks(item)
                            local value = item:get()

                            if not value then
                                list.defensive_ticks:visibility(false)

                                list.min_defensive_ticks:visibility(false)
                                list.max_defensive_ticks:visibility(false)

                                list.defensive_ticks_sliders:visibility(false)

                                for i = 1, 8 do
                                    list['defensive_ticks_' .. i]:visibility(false)
                                end

                                list.defensive_ticks_mode:unset_callback(on_defensive_ticks_mode)
                                list.defensive_ticks_sliders:unset_callback(on_defensive_ticks_sliders)
                            end

                            if value then
                                list.defensive_ticks_mode:set_callback(on_defensive_ticks_mode, true)
                            end

                            list.defensive_ticks_mode:visibility(value)
                        end

                        list.custom_defensive_ticks:set_callback(
                            on_custom_defensive_ticks, true
                        )
                    end
                end

                list.enabled = group:switch(icon_title('circle-bolt', 'Defensive AA', 1, 7)) do
                    local gear = list.enabled:create()

                    list.exploits = gear:selectable(
                        icon_title('bolt', 'Exploits', 1, 7), {
                            'Double Tap',
                            'Hide Shots'
                        }
                    )

                    list.pitch = group:combo(icon_title('compass-drafting', 'Pitch', 1, 7), pitch_list) do
                        local gear = list.pitch:create()

                        list.pitch_offset = gear:slider(
                            icon_title('arrows-rotate', 'Offset', 1, 5), -89, 89, 0, nil, '°'
                        )

                        list.pitch_offset_1 = gear:slider(
                            icon_title('arrow-left', 'Angle from', 1, 7), -89, 89, 0, nil, '°'
                        )

                        list.pitch_offset_2 = gear:slider(
                            icon_title('arrow-right', 'Angle to', 1, 7), -89, 89, 0, nil, '°'
                        )

                        list.pitch_speed = gear:slider(
                            icon_title('rabbit', 'Speed', 1, 6), -50, 50, 20, 0.1
                        )
                    end

                    list.yaw = group:combo(icon_title('arrow-down-short-wide', 'Yaw', 1, 6), yaw_list) do
                        local gear = list.yaw:create()

                        list.yaw_offset = gear:slider(
                            icon_title('arrows-rotate', 'Offset', 1, 5), -180, 180, 0, nil, '°'
                        )

                        list.yaw_left = gear:slider(
                            icon_title('arrow-left', 'Yaw Left', 1, 7), -180, 180, 0, nil, '°'
                        )

                        list.yaw_right = gear:slider(
                            icon_title('arrow-right', 'Yaw Right', 1, 7), -180, 180, 0, nil, '°'
                        )

                        list.yaw_speed = gear:slider(
                            icon_title('rabbit', 'Speed', 1, 6), -50, 50, 20, 0.1
                        )
                    end

                    list.yaw_modifier = group:combo(icon_title('arrow-down-left-and-arrow-up-right-to-center', 'Modifier', 1, 7), yaw_modifier_list) do
                        local gear = list.yaw_modifier:create()

                        list.modifier_offset = gear:slider(
                            icon_title('arrows-rotate', 'Offset', 1, 5), -180, 180, 0, nil, '°'
                        )
                    end

                    list.delay = group:switch(icon_title('timeline', 'Delay', 1, 5)) do
                        local gear = list.delay:create()

                        local delay_mode_list do
                            delay_mode_list = {
                                'Default',
                                'Random',
                                'Custom'
                            }
                        end

                        list.delay_mode = gear:combo(
                            icon_title('rotate-right', 'Mode', 1, 7), delay_mode_list
                        )

                        list.delay_timing = gear:slider(
                            icon_title('clock', 'Timing', 1, 7), 2, 22, 2, nil, 't'
                        )

                        list.delay_min_timing = gear:slider(
                            icon_title('clock', 'Min. Timing', 1, 7), 1, 22, 2, nil, 't'
                        )

                        list.delay_max_timing = gear:slider(
                            icon_title('clock', 'Max. Timing', 1, 7), 1, 22, 2, nil, 't'
                        )

                        list.delay_sliders = gear:slider(
                            icon_title('shoe-prints', 'Sliders', 0, 5), 2, 8, 2, nil
                        )

                        for i = 1, 8 do
                            list['delay_' .. i] = gear:slider(
                                icon_title('stairs', string.format('Slider: %d', i), 0, 6), 1, 22, 2, nil, 't'
                            )
                        end

                        local callbacks do
                            local function on_delay_sliders(item)
                                local value = tonumber(item:get())

                                if value == nil then
                                    return
                                end

                                for i = 1, 8 do
                                    list['delay_' .. i]:visibility(i <= value)
                                end
                            end

                            local function on_delay_mode(item)
                                local value = item:get()

                                local is_default = value == 'Default'
                                local is_random  = value == 'Random'
                                local is_custom  = value == 'Custom'

                                list.delay_timing:visibility(is_default)

                                list.delay_min_timing:visibility(is_random)
                                list.delay_max_timing:visibility(is_random)

                                list.delay_sliders:visibility(is_custom)

                                if is_custom then
                                    list.delay_sliders:set_callback(on_delay_sliders, true)
                                else
                                    list.delay_sliders:unset_callback(on_delay_sliders)
                                end

                                if not is_custom then
                                    for i = 1, 8 do
                                        list['delay_' .. i]:visibility(false)
                                    end
                                end
                            end

                            list.delay_mode:set_callback(
                                on_delay_mode, true
                            )
                        end
                    end

                    lock_unselection(list.exploits)

                    local callbacks do
                        local function on_pitch(item)
                            local value = item:get()

                            local is_static        = value == 'Static'
                            local is_jitter        = value == 'Jitter'
                            local is_random        = value == 'Random'
                            local is_spin          = value == 'Spin'
                            local is_static_random = value == 'Static Random'

                            list.pitch_offset:visibility(is_static)

                            list.pitch_offset_1:visibility(is_jitter or is_random or is_spin or is_static_random)
                            list.pitch_offset_2:visibility(is_jitter or is_random or is_spin or is_static_random)

                            list.pitch_speed:visibility(is_spin)
                        end

                        local function on_yaw_modifier(item)
                            local value = item:get() ~= 'Off'

                            list.modifier_offset:visibility(value)
                            list.delay:visibility(value)
                        end

                        local function on_yaw(item)
                            local value = item:get()

                            local is_off           = value == 'Off'
                            local is_static        = value == 'Static'
                            local is_random        = value == 'Random'
                            local is_spin          = value == 'Spin'
                            local is_left_right    = value == 'Left/Right'
                            local is_static_random = value == 'Static Random'

                            list.yaw_left:visibility(is_left_right or is_static_random)
                            list.yaw_right:visibility(is_left_right or is_static_random)

                            list.yaw_offset:visibility(is_static or is_random or is_spin)
                            list.yaw_speed:visibility(is_spin)

                            list.yaw_modifier:visibility(not is_off)

                            if not is_off then
                                list.yaw_modifier:set_callback(on_yaw_modifier, true)
                            else
                                list.yaw_modifier:unset_callback(on_yaw_modifier)
                            end

                            if is_off then
                                list.modifier_offset:visibility(false)
                                list.delay:visibility(false)
                            end
                        end

                        local function on_enabled(item)
                            local value = item:get()

                            if not value then
                                list.pitch_offset_1:visibility(false)
                                list.pitch_offset_2:visibility(false)
                                list.pitch_speed:visibility(false)

                                list.yaw_left:visibility(false)
                                list.yaw_right:visibility(false)

                                list.yaw_offset:visibility(false)
                                list.yaw_speed:visibility(false)

                                list.yaw_modifier:visibility(false)
                                list.modifier_offset:visibility(false)

                                list.delay:visibility(false)
                            end

                            if value then
                                list.pitch:set_callback(on_pitch, true)
                                list.yaw:set_callback(on_yaw, true)
                            else
                                list.pitch:unset_callback(on_pitch)
                                list.yaw:unset_callback(on_yaw)

                                list.yaw_modifier:unset_callback(on_yaw_modifier)
                            end

                            list.pitch:visibility(value)
                            list.yaw:visibility(value)
                        end

                        list.enabled:set_callback(
                            on_enabled, true
                        )
                    end
                end

                return list
            end

            local function create_items_flick(group, list)
                list.enabled = group:switch(icon_title('share-all', 'Defensive Flick', 1, 6)) do
                    local gear = list.enabled:create()

                    list.speed_mode = gear:combo(
                        icon_title('rabbit', 'Speed', 1, 5), {
                            'Default',
                            'Random'
                        }
                    )

                    list.speed_default = gear:slider(
                        '##DEFAULT', 2, 10, 7
                    )

                    list.speed_min = gear:slider(
                        icon_title('clock', 'Min. Speed', 1, 5), 2, 10, 7
                    )

                    list.speed_max = gear:slider(
                        icon_title('clock', 'Max. Speed', 1, 5), 2, 10, 7
                    )

                    list.pitch = gear:slider(
                        icon_title('arrows-rotate', 'Pitch', 1, 5), -89, 89, 0, nil, '°'
                    )

                    list.yaw = gear:slider(
                        icon_title('arrows-rotate', 'Yaw', 1, 5), -180, 180, 90, nil, '°'
                    )

                    list.limit = gear:slider(
                        icon_title('arrow-left', 'Limit', 1, 6), 0, 60, 60, nil, '°'
                    )

                    list.inverter = gear:switch(
                        icon_title('toggle-on', 'Inverter', 1, 5)
                    )

                    list.jitter = gear:switch(
                        icon_title('sliders-simple', 'Jitter', 1, 6)
                    )

                    local callbacks do
                        local function on_speed_mode(item)
                            local value = item:get()

                            local is_default = value == 'Default'
                            local is_random = value == 'Random'

                            list.speed_default:visibility(is_default)

                            list.speed_min:visibility(is_random)
                            list.speed_max:visibility(is_random)
                        end

                        list.speed_mode:set_callback(
                            on_speed_mode, true
                        )
                    end
                end

                return list
            end

            local function create_items_antibrute(group, list)
                list.enabled = group:switch(icon_title('dice-d6', 'Anti Bruteforce', 2, 7)) do
                    local gear = list.enabled:create()

                    list.refresh_modifier = gear:combo(
                        icon_title('arrows-spin', 'Modifier', 2, 7), {
                            'Off',
                            'Meta',
                            'Increase',
                            'Decrease'
                        }
                    )

                    list.refresh_offset = gear:switch(
                        icon_title('arrows-repeat', 'Offset', 2, 7)
                    )

                    list.enforce_delay = gear:switch(
                        icon_title('right-left', 'Change Delay', 2, 7)
                    )

                    list.duration = gear:slider(
                        icon_title('clock', 'Duration', 2, 7), 9, 200, 9, 0.1, function(val)
                            return val == 9 and 'Inf.' or (val * 0.1) .. 's'
                        end
                    )
                end

                return list
            end

            for i = 1, #const.teams do
                local team = const.teams[i]

                local team_items = { }

                builder[team] = team_items
                builder_groups[team] = { }

                team_items.state = GRP_STATE:combo(
                    icon_title('person-walking-arrow-loop-left', 'State', 0, 5), state_list
                )

                for j = 1, #state_list do
                    local state = state_list[j]

                    local key_root = string.format('##ROOT_%s_%s', team, state)
                    local key_angles = string.format('##ANGLES_%s_%s', team, state)
                    local key_defensive = string.format('##DEFENSIVE_%s_%s', team, state)
                    local key_antibrute = string.format('##ANTIBRUTE_%s_%s', team, state)

                    local group_root = menu.create(
                        TAB_ANTIAIM, key_root, COLUMN_LEFT
                    )

                    local group_angles = menu.create(
                        TAB_ANTIAIM, key_angles, COLUMN_LEFT
                    )

                    local group_defensive = menu.create(
                        TAB_ANTIAIM, key_defensive, COLUMN_LEFT
                    )

                    local group_antibrute = menu.create(
                        TAB_ANTIAIM, key_antibrute, COLUMN_LEFT
                    )

                    local function key_callback(args)
                        local id = string.format('##%s_%s', team, state)
                        local _, j = string.find(args[2], '##')

                        if j ~= nil then
                            id = id .. string.sub(args[2], j + 1)
                        end

                        args[2] = args[2] .. id
                    end

                    local items = { }

                    GRP_STATE:set_callback(key_callback)

                    group_root:set_callback(key_callback)
                    group_angles:set_callback(key_callback)
                    group_defensive:set_callback(key_callback)
                    group_antibrute:set_callback(key_callback)

                    if state ~= 'Default' then
                        GRP_STATE:set_flag(menu.group_flags.callbacks, false)

                        items.enabled = GRP_STATE:switch(string.format(
                            icon_title('arrow-turn-down-right', 'Override %s', 0, 6), state:lower()
                        ))

                        GRP_STATE:set_flag(menu.group_flags.callbacks, true)

                        items.enabled:set_callback(
                            update_visibility
                        )
                    end

                    if state ~= 'On Peek' then
                        items.angles = create_items_angles(group_angles, { })
                    end

                    items.defensive = create_items_defensive(group_defensive, { })

                    if state ~= 'On Peek' and state ~= 'Freestanding' then
                        items.flick = create_items_flick(group_defensive, { })
                        items.antibrute = create_items_antibrute(group_antibrute, { })
                    end

                    GRP_STATE:unset_callback(key_callback)

                    group_root:unset_callback(key_callback)
                    group_angles:unset_callback(key_callback)
                    group_defensive:unset_callback(key_callback)
                    group_antibrute:unset_callback(key_callback)

                    builder[team][state] = items

                    builder_groups[team][state] = {
                        root = group_root,
                        angles = group_angles,
                        defensive = group_defensive,
                        antibrute = group_antibrute
                    }

                    config_system.add(key_root, group_root, 'AA')
                    config_system.add(key_angles, group_angles, 'AA')
                    config_system.add(key_defensive, group_defensive, 'AA')
                    config_system.add(key_antibrute, group_antibrute, 'AA')
                end

                local callbacks do
                    local function on_state(item)
                        local team_value = builder.team:get() == 1 and 'T' or 'CT'

                        if team_value ~= team then
                            return
                        end

                        local other_items = builder[
                            team == 'CT' and 'T' or 'CT'
                        ]

                        if other_items ~= nil then
                            other_items.state:set(
                                item:get()
                            )
                        end

                        update_visibility()
                    end

                    team_items.state:set_callback(on_state)
                end
            end

            local send_to_another_team do
                local function callback()
                    local current_team = builder.team:get() == 1 and 'T' or 'CT'
                    local other_team = current_team == 'CT' and 'T' or 'CT'

                    local current_items = builder[current_team]
                    local other_items = builder[other_team]

                    if current_items == nil or other_items == nil then
                        return
                    end

                    local state = current_items.state:get()

                    local current = current_items[state]
                    local other = other_items[state]

                    if current == nil or other == nil then
                        return
                    end

                    if current.enabled ~= nil and other.enabled ~= nil then
                        other.enabled:set(current.enabled:get())
                    end

                    import_values_list(other.angles, export_values_list(current.angles))
                    import_values_list(other.defensive, export_values_list(current.defensive))

                    if current.flick ~= nil and other.flick ~= nil then
                        import_values_list(other.flick, export_values_list(current.flick))
                    end

                    if current.antibrute ~= nil and other.antibrute ~= nil then
                        import_values_list(other.antibrute, export_values_list(current.antibrute))
                    end

                    logging_system.success(string.format(
                        'Settings sent to %s team', other_team
                    ))
                end

                GRP_SEND:button(button_title('arrow-up-right-from-square', 'Send To Another Team', 25), callback, true)
            end

            local callbacks do
                builder.team:set_callback(
                    update_visibility
                )

                selector.list:set_callback(
                    update_visibility
                )

                update_visibility()
            end

            antiaim.builder = builder
        end

        local settings = { } do
            local avoid_backstab = { } do
                avoid_backstab.enabled = GRP_SETTINGS_EXTRA:switch(
                    icon_title('sword', 'Avoid Backstab', 1, 6), true
                )

                settings.avoid_backstab = avoid_backstab
            end

            local manual_yaw = { } do
                manual_yaw.select = GRP_SETTINGS_EXTRA:combo(
                    icon_title('arrows-repeat', 'Manual Yaw', 1, 6), {
                        'Off',
                        'Left',
                        'Right',
                        'Backward',
                        'Forward'
                    }
                )

                local group = manual_yaw.select:create() do
                    manual_yaw.disable_yaw_modifiers = group:switch(
                        icon_title('align-slash', 'Disable Yaw Modifiers', 1, 4)
                    )

                    manual_yaw.body_freestanding = group:switch(
                        icon_title('arrows-retweet', 'Body Freestanding', 1, 4)
                    )
                end

                settings.manual_yaw = manual_yaw
            end

            local freestanding = { } do
                freestanding.enabled = GRP_SETTINGS_EXTRA:switch(icon_title('arrows-turn-to-dots', 'Freestanding', 1, 7)) do
                    local group = freestanding.enabled:create()

                    freestanding.disablers = group:selectable(
                        icon_title('power-off', 'Disablers', 2, 5), {
                            'Standing',
                            'Running',
                            'Slowwalking',
                            'Ducking',
                            'In Air',
                            'In Air & Duck'
                        }
                    )

                    freestanding.disable_yaw_modifiers = group:switch(
                        icon_title('align-slash', 'Disable Yaw Modifiers', 1, 4)
                    )

                    freestanding.body_freestanding = group:switch(
                        icon_title('arrows-retweet', 'Body Freestanding', 1, 4)
                    )
                end

                settings.freestanding = freestanding
            end

            local edge_yaw = { } do
                edge_yaw.enabled = GRP_SETTINGS_EXTRA:switch(icon_title('ruler', 'Edge Yaw', 1, 6)) do
                    local group = edge_yaw.enabled:create()

                    edge_yaw.only_on_fake_duck = group:switch(
                        icon_title('duck', 'Only on Fake Duck', 1, 6)
                    )
                end

                settings.edge_yaw = edge_yaw
            end

            local disablers = { } do
                disablers.enabled = GRP_SETTINGS_EXTRA:switch(icon_title('power-off', 'Disablers', 1, 6)) do
                    local group = disablers.enabled:create()

                    disablers.select = group:listable(
                        '##SELECT', {
                            'Warmup',
                            'No Enemies'
                        }
                    )
                end

                lock_unselection(disablers.select)

                settings.disablers = disablers
            end

            local air_lag = { } do
                air_lag.enabled = GRP_SETTINGS_EXTRA:switch(icon_title('wind', 'Air Lag', 1, 6)) do
                    local group = air_lag.enabled:create()

                    air_lag.ticks = group:slider(
                        icon_title('clock', 'Ticks', 1, 7), 1, 8, 4, nil, 't'
                    )
                end

                settings.air_lag = air_lag
            end

            local animations = { } do
                animations.enabled = GRP_SETTINGS:switch(icon_title('layer-group', 'Animations', 1, 6)) do
                    local group = animations.enabled:create()

                    animations.air_legs = group:combo(
                        icon_title('person-ski-lift', 'Air Legs', 1, 6), {
                            'Off',
                            'Static',
                            'Walking'
                        }
                    )

                    animations.ground_legs = group:combo(
                        icon_title('person-walking', 'Ground Legs', 2, 8), {
                            'Off',
                            'Static',
                            'Jitter',
                            'Walking',
                            'Earthquake'
                        }
                    )

                    animations.legs_offset_1 = group:slider(
                        icon_title('arrows-up-down-left-right', 'Offset 1', 1, 7), 0, 100, 100, nil, function (val)
                            return val == 0 and 'Off' or (val * 0.01) .. 'x'
                        end
                    )

                    animations.legs_offset_2 = group:slider(
                        icon_title('arrows-up-down-left-right', 'Offset 2', 1, 7), 0, 100, 100, nil, function (val)
                            return val == 0 and 'Off' or (val * 0.01) .. 'x'
                        end
                    )

                    animations.body_lean = group:slider(
                        icon_title('lines-leaning', 'Body Lean', 1, 9), -1, 100, -1, nil, function (val)
                            return val == -1 and 'Off' or (val * 0.01) .. 'x'
                        end
                    )

                    animations.pitch_on_land = group:switch(
                        icon_title('person-arrow-down-to-line', 'Pitch on Land', 0, 7), true
                    )

                    local callbacks do
                        local function on_ground_legs(item)
                            local value = item:get()

                            animations.legs_offset_1:visibility(value == 'Jitter')
                            animations.legs_offset_2:visibility(value == 'Jitter')
                        end

                        animations.ground_legs:set_callback(
                            on_ground_legs, true
                        )
                    end
                end

                settings.animations = animations
            end

            local safe_head = { } do
                safe_head.enabled = GRP_SETTINGS:switch(icon_title('arrows-minimize', 'Safe Head', 1, 6)) do
                    local group = safe_head.enabled:create()

                    safe_head.select = group:selectable(
                        icon_title('head-side', 'Conditions', 1, 6), {
                            'Air Crouch Knife',
                            'Air Crouch Taser',
                            'Height Advantage',
                            'Crouch'
                        }
                    )

                    safe_head.target_height = group:slider(
                        icon_title('line-height', 'Height', 1, 6), 0, 200, 0, nil, 'u'
                    )

                    safe_head.e_spam_while_safe_head = group:switch(
                        icon_title('hand', 'E Spam While Safe Head', 1, 7)
                    )

                    local callbacks do
                        local function on_select(item)
                            local should_show_height = (
                                item:get 'Air Crouch Knife' or
                                item:get 'Air Crouch Taser'
                            )

                            safe_head.target_height:visibility(should_show_height)
                        end

                        safe_head.select:set_callback(
                            on_select, true
                        )
                    end
                end

                lock_unselection(safe_head.select)

                settings.safe_head = safe_head
            end

            local auto_teleport = { } do
                auto_teleport.enabled = GRP_SETTINGS:switch(icon_title('transporter-1', 'Auto Teleport', 1, 6)) do
                    local group = auto_teleport.enabled:create()

                    auto_teleport.select = group:selectable(
                        icon_title('person-running', 'Conditions', 1, 7), {
                            'In Air',
                            'In Air & Duck'
                        }
                    )

                    auto_teleport.weapons = group:selectable(
                        icon_title('gun', 'Weapons', 1, 6), {
                            'Auto Snipers',
                            'AWP',
                            'Scout',
                            'Desert Eagle',
                            'Pistols',
                            'SMG',
                            'Rifles'
                        }
                    )

                    auto_teleport.select:set {
                        'In Air',
                        'In Air & Duck'
                    }

                    auto_teleport.weapons:set {
                        'AWP',
                        'Scout',
                        'Pistols'
                    }
                end

                settings.auto_teleport = auto_teleport
            end

            antiaim.settings = settings
        end

        resource.antiaim = antiaim
    end

    local category = nil do
        category = groups.features.category:list(
            '##CATEGORY', {
                icon_title('crosshairs', 'Ragebot', 2, 7),
                icon_title('paintbrush', 'Visuals', 1, 7),
                icon_title('gears', 'Misc', 1, 6),
            }
        )

        local callbacks do
            local function on_category(item)
                local value = item:get()

                local is_ragebot = value == 1
                local is_visuals = value == 2
                local is_misc    = value == 3

                groups.features.extra:visibility(is_ragebot)
                groups.features.ragebot:visibility(is_ragebot)

                groups.features.visuals:visibility(is_visuals)
                groups.features.render:visibility(is_visuals)

                groups.features.misc:visibility(is_misc)
                groups.features.movement:visibility(is_misc)
            end

            category:set_callback(
                on_category, true
            )
        end

        resource.category = category
    end

    local ragebot = { } do
        local GRP_RAGEBOT = groups.features.ragebot
        local GRP_EXTRA = groups.features.extra

        config_system.add('##RAGEBOT', GRP_RAGEBOT, 'AA')
        config_system.add('##EXTRA', GRP_EXTRA, 'AA')

        local smart_peek = { } do
            smart_peek.enabled = GRP_RAGEBOT:switch(icon_title('robot', 'Smart Peek', 1, 5)) do
                local group = smart_peek.enabled:create()

                smart_peek.simulation = group:slider(
                    icon_title('clock', 'Simulation', 1, 7), 25, 35, 28, 0.01, 's'
                )

                smart_peek.rate_limit = group:slider(
                    icon_title('wave-pulse', 'Rate Limit', 0, 6), 0, 30, 2, 0.01, 's'
                )

                smart_peek.hit_chance = group:slider(
                    icon_title('dice', 'Hit Chance', 0, 6), 0, 100, 35, nil, function (val)
                        return val == 0 and 'Def.' or val .. '%'
                    end
                )

                smart_peek.unsafety = group:switch(
                    icon_title('shield-slash', 'Unsafety', 0, 6)
                )

                smart_peek.dev_mode = group:switch(
                    icon_title('code', 'Dev Mode', 0, 6)
                )

                smart_peek.range = group:slider(
                    icon_title('forward', 'Range', 1, 7), 15, 25, 20, nil, 't'
                )

                smart_peek.retreat = group:slider(
                    icon_title('backward', 'Retreat', 1, 7), 15, 30, 25, nil, 'u'
                )

                smart_peek.weapons = group:selectable(
                    icon_title('gun', 'Weapons', 1, 6), {
                        'SSG-08',
                        'Pistols',
                        'Deagle'
                    }
                )

                smart_peek.hitboxes = group:selectable(
                    icon_title('bullseye', 'Hitboxes', 1, 7), {
                        'Head',
                        'Chest',
                        'Stomach',
                        'Arms',
                        'Legs'
                    }
                )

                smart_peek.color = group:color_picker(
                    icon_title('palette', 'Color', 1, 7), color(200, 0, 0, 255)
                )

                lock_unselection(smart_peek.weapons)
                lock_unselection(smart_peek.hitboxes)

                smart_peek.enabled:tooltip('· Automatically peeks enemy using algorithms.')

                smart_peek.simulation:tooltip('· Duration of the Peek, adjust it, if \a{Link Active}\"Smart Peek\"\aDEFAULT fails with timings.')
                smart_peek.rate_limit:tooltip('· Delay between hitscan, can be increased if you have poor performance.')
                smart_peek.hit_chance:tooltip('· Overrides ragebot hitchance, while peeking.')

                smart_peek.unsafety:tooltip(
                    '· Disables \a{Link Active}\"Force Body\"\aDEFAULT, '
                    .. '\a{Link Active}\"Safe Points\'\aDEFAULT, '
                    .. '\a{Link Active}\"Ensure Hitbox Safety\"\aDEFAULT '
                    .. 'and Sets \a{Link Active}\"Point Scale\"\aDEFAULT to 100'
                )

                local callbacks do
                    local function on_dev_mode(item)
                        local value = item:get()

                        smart_peek.range:visibility(value)
                        smart_peek.retreat:visibility(value)
                    end

                    smart_peek.dev_mode:set_callback(
                        on_dev_mode, true
                    )
                end
            end

            ragebot.smart_peek = smart_peek
        end

        local dormant_aimbot = { } do
            dormant_aimbot.enabled = GRP_RAGEBOT:switch(icon_title('transporter-1', 'Dormant Aimbot', 2, 6)) do
                local group = dormant_aimbot.enabled:create()

                dormant_aimbot.hitboxes = group:listable(
                    icon_title('bullseye', 'Hitboxes', 1, 7), {
                        'Head',
                        'Chest',
                        'Stomach',
                        'Legs'
                    }
                )

                dormant_aimbot.alpha_modifier = group:slider(
                    icon_title('eye', 'Alpha Modifier', 1, 6), 1, 100, 70, nil, '%'
                )

                dormant_aimbot.minimum_damage = group:slider(
                    icon_title('arrow-down-9-1', 'Min. Damage', 1, 6), 0, 130, 0, nil, function(value)
                        if value == 0 then
                            return 'Def.'
                        end

                        if value > 100 then
                            return '+' .. value - 100
                        end
                    end
                )
            end

            lock_unselection(dormant_aimbot.hitboxes)
            locker_system.push(-1, dormant_aimbot.enabled)

            ragebot.dormant_aimbot = dormant_aimbot
        end

        local aimbot_logs = { } do
            aimbot_logs.enabled = GRP_RAGEBOT:switch(icon_title('calendar-lines-pen', 'Aimbot Logs', 1, 6)) do
                local group = aimbot_logs.enabled:create()

                aimbot_logs.default_colors = group:color_picker(
                    icon_title('palette', 'Colors##DEFAULT', 1, 7), {
                        ['Hit'] = { color(127, 180, 95, 255) },
                        ['Miss'] = { color(132, 163, 209, 255) }
                    }
                )

                aimbot_logs.output = group:selectable(
                    icon_title('list-ul', 'Output', 1, 7), {
                        'Console',
                        'Events',
                        'Render'
                    }
                )

                aimbot_logs.custom_prefix = group:input(
                    icon_title('font', 'Prefix', 1, 8), ''
                )

                aimbot_logs.print_commands = group:button(
                    button_title('code', 'Print Commands', 27), function()
                        logging_system.log('Ragebot logs commands:\n')

                        logging_system.log('pr= — Replace prefix with custom \'word\'')
                        logging_system.log('hit= — Replace hit with custom \'word\'')
                        logging_system.log('prbr=() — Set round brackets for prefix')
                        logging_system.log('backtrack= — Replace backtrack with custom \'word\'')
                        logging_system.log('hitchance= — Replace hitchance with custom \'word\'')
                        logging_system.log('limiter= — Replace limiter with custom character')
                        logging_system.log('rc — Remove color')
                        logging_system.log('rprc — Remove prefix color')
                        logging_system.log('rp — Remove prefix')
                        logging_system.log('rb — Remove brackets')
                        logging_system.log('rpb — Remove prefix brackets')
                        logging_system.log('rm — Remove mismatch')
                        logging_system.log('rch — Remove hitchance color')
                        logging_system.log('rhc — Remove hitchance')
                        logging_system.log('rbt — Remove backtrack')
                        logging_system.log('btms — Show backtrack in milliseconds')
                        logging_system.log('sps — Separate spread in individual brackets')
                        logging_system.log('spr — Always show spread (events)\n')

                        logging_system.log('Example: pr=\"Frost\" rc')
                    end, true
                )

                aimbot_logs.offset_y = group:slider(
                    icon_title('arrows-up-down-left-right', 'Offset', 1, 7), 0, 100, 80, nil, '%'
                )

                aimbot_logs.customize = group:switch(
                    icon_title('gear', 'Customize', 1, 7)
                )

                aimbot_logs.radius = group:combo(
                    icon_title('circle', 'Radius', 1, 7), {
                        'Smooth',
                        'Semi-circle'
                    }
                )

                aimbot_logs.padding = group:slider(
                    icon_title('ruler', 'Padding', 1, 7), 4, 10, 6, nil, 'px'
                )

                aimbot_logs.render_colors = group:color_picker(
                    icon_title('palette', 'Colors##RENDER', 1, 7), {
                        ['Hit'] = { color(168, 201, 228, 255) },
                        ['Miss'] = { color(227, 168, 168, 255) }
                    }
                )

                local callbacks do
                    local function on_customize(item)
                        local value = item:get()

                        aimbot_logs.radius:visibility(value)
                        aimbot_logs.padding:visibility(value)
                        aimbot_logs.render_colors:visibility(value)
                    end

                    local function on_output(item)
                        local is_console = item:get 'Console'
                        local is_events = item:get 'Events'
                        local is_render = item:get 'Render'

                        aimbot_logs.offset_y:visibility(is_render)
                        aimbot_logs.customize:visibility(is_render)

                        aimbot_logs.custom_prefix:visibility(
                            is_console or is_events
                        )

                        if is_render then
                            aimbot_logs.customize:set_callback(on_customize, true)
                        else
                            aimbot_logs.customize:unset_callback(on_customize)
                        end

                        if not is_render or not aimbot_logs.customize:get() then
                            aimbot_logs.radius:visibility(false)
                            aimbot_logs.padding:visibility(false)
                            aimbot_logs.render_colors:visibility(false)
                        end
                    end

                    utils.execute_after(0, function()
                        aimbot_logs.output:set_callback(
                            on_output, true
                        )
                    end)
                end
            end

            lock_unselection(aimbot_logs.output)

            ragebot.aimbot_logs = aimbot_logs
        end

        local auto_hide_shots = { } do
            local weapon_list = {
                'Auto Snipers',
                'AWP',
                'Scout',
                'Desert Eagle',
                'Pistols',
                'SMG',
                'Rifles'
            }

            local state_list = {
                'Standing',
                'Slowwalking',
                'Running',
                'Ducking',
                'Sneaking',
                'In Air',
                'In Air & Duck'
            }

            auto_hide_shots.enabled = GRP_RAGEBOT:switch(
                icon_title('eye-slash', 'Auto Hide Shots', 0, 5), true
            )

            local group = auto_hide_shots.enabled:create() do
                auto_hide_shots.weapons = group:combo(
                    icon_title('gun', 'Weapons', 0, 6), weapon_list
                )

                for i = 1, #weapon_list do
                    local weapon = weapon_list[i]

                    local items = { }

                    items.states = group:selectable(
                        icon_title('person-walking-arrow-loop-left', 'States##' .. weapon, 0, 5), state_list
                    )

                    auto_hide_shots[weapon] = items
                end

                local callbacks do
                    local function on_weapons(item)
                        local value = item:get()

                        for i = 1, #weapon_list do
                            local weapon = weapon_list[i]

                            local items = auto_hide_shots[weapon]

                            if items ~= nil and items.states ~= nil then
                                items.states:visibility(
                                    value == weapon
                                )
                            end
                        end
                    end

                    auto_hide_shots.weapons:set_callback(
                        on_weapons, true
                    )
                end
            end

            ragebot.auto_hide_shots = auto_hide_shots
        end

        local force_lethal = { } do
            local weapon_list = {
                'Auto',
                'Deagle'
            }

            force_lethal.enabled = GRP_RAGEBOT:switch(
                icon_title('head-side', 'Force Lethal', 1, 7)
            )

            local group = force_lethal.enabled:create() do
                force_lethal.weapons = group:selectable(
                    'Weapons', weapon_list
                )

                force_lethal.mode = group:combo(
                    'Mode', {
                        'Default',
                        'Damage = HP/2'
                    }
                )

                for i = 1, #weapon_list do
                    local weapon = weapon_list[i]

                    local list = { }

                    list.hitchance = group:slider(
                        weapon .. ' Hitchance', -1, 100, -1, nil, function (val)
                            return val == -1 and 'Off' or val .. '%'
                        end
                    )

                    force_lethal[weapon] = list
                end
            end

            lock_unselection(force_lethal.weapons)
            locker_system.push(-1, force_lethal.enabled)

            local callbacks do
                local function on_weapons(item)
                    for i = 1, #weapon_list do
                        local weapon = weapon_list[i]
                        local items = force_lethal[weapon]

                        items.hitchance:visibility(
                            force_lethal.weapons:get(weapon)
                        )
                    end
                end

                force_lethal.weapons:set_callback(
                    on_weapons, true
                )
            end

            ragebot.force_lethal = force_lethal
        end

        local hitchance_modifier = { } do
            local weapon_list = {
                'AWP',
                'SSG-08',
                'AutoSnipers',
                'Desert Eagle',
                'R8 Revolver'
            }

            local update_visibility do
                local function update_in_air_visibility(list, value)
                    list.enabled:visibility(value)

                    if not list.enabled:get() then
                        value = false
                    end

                    list.value:visibility(value)
                end

                local function update_no_scope_visibility(list, value)
                    list.enabled:visibility(value)

                    if not list.enabled:get() then
                        value = false
                    end

                    list.value:visibility(value)
                    list.distance:visibility(value)
                end

                function update_visibility()
                    local current = hitchance_modifier.weapon:get()

                    for i = 1, #weapon_list do
                        local weapon = weapon_list[i]

                        local is_weapon_visible = (
                            current == weapon
                        )

                        local items = hitchance_modifier[weapon]

                        if items == nil then
                            goto continue
                        end

                        if items['In Air'] ~= nil then
                            update_in_air_visibility(
                                items['In Air'],
                                is_weapon_visible
                            )
                        end

                        if items['No Scope'] ~= nil then
                            update_no_scope_visibility(
                                items['No Scope'],
                                is_weapon_visible
                            )
                        end

                        ::continue::
                    end
                end
            end

            local function create_in_air_items(group)
                local items = { }

                local function key_callback(args)
                    args[2] = args[2] .. '##IN_AIR'
                end

                group:set_callback(key_callback)

                items.enabled = group:switch(
                    icon_title('plane', 'In Air', 1, 6)
                )

                items.value = group:slider(
                    icon_title('bullseye-arrow', 'Value', 1, 7), 0, 100, 50, nil, '%'
                )

                items.enabled:set_callback(
                    update_visibility
                )

                group:unset_callback(key_callback)

                return items
            end

            local function create_no_scope_items(group)
                local items = { }

                local function key_callback(args)
                    args[2] = args[2] .. '##NO_SCOPE'
                end

                group:set_callback(key_callback)

                items.enabled = group:switch(
                    icon_title('crosshairs', 'No Scope', 1, 7)
                )

                items.value = group:slider(
                    icon_title('bullseye-arrow', 'Value', 1, 7), 0, 100, 50, nil, '%'
                )

                items.distance = group:slider(
                    icon_title('ruler', 'Distance', 1, 6), 30, 1001, 325, 0.1, function(value)
                        if value == 1001 then
                            return 'Inf.'
                        end

                        return string.format(
                            '%.1fft', value * 0.1
                        )
                    end
                )

                items.enabled:set_callback(
                    update_visibility
                )

                group:unset_callback(key_callback)

                return items
            end

            local function create_items(group, weapon)
                local items = { }

                local function key_callback(args)
                    local id = string.format('##%s', weapon)
                    local _, j = string.find(args[2], '##')

                    if j ~= nil then
                        id = id .. string.sub(args[2], j + 1)
                    end

                    args[2] = args[2] .. id
                end

                group:set_callback(key_callback)

                local weapon_has_scope = (
                    weapon == 'AWP' or
                    weapon == 'SSG-08' or
                    weapon == 'AutoSnipers'
                )

                items['In Air'] = create_in_air_items(group)

                if weapon_has_scope then
                    items['No Scope'] = create_no_scope_items(group)
                end

                group:unset_callback(key_callback)

                return items
            end

            hitchance_modifier.enabled = GRP_EXTRA:switch(icon_title('dice', 'Hitchance Modifier', 1, 5)) do
                local group = menu.cast(hitchance_modifier.enabled:create())

                hitchance_modifier.weapon = group:combo(
                    icon_title('gun', 'Weapon', 1, 5), weapon_list
                )

                for i = 1, #weapon_list do
                    local weapon = weapon_list[i]

                    local items = create_items(group, weapon)
                    hitchance_modifier[weapon] = items
                end

                local callbacks do
                    hitchance_modifier.weapon:set_callback(
                        update_visibility, true
                    )
                end
            end

            hitchance_modifier.list = weapon_list
            ragebot.hitchance_modifier = hitchance_modifier
        end

        resource.ragebot = ragebot
    end

    local visuals = { } do
        local GRP_VISUALS = groups.features.visuals
        local GRP_RENDER  = groups.features.render

        config_system.add('##VISUALS', GRP_VISUALS, 'VISUALS')
        config_system.add('##RENDER', GRP_RENDER, 'RENDER')

        local watermark = { } do
            watermark.label = GRP_RENDER:label(icon_title('address-card', 'Watermark', 0, 7)) do
                local group = watermark.label:create()

                watermark.style = group:combo(
                    icon_title('pencil', 'Style', 1, 7), {
                        'Default',
                        'New',
                        'Custom'
                    }
                )

                watermark.radius = group:combo(
                    icon_title('circle', 'Radius', 1, 7), {
                        'Smooth',
                        'Semi-circle'
                    }
                )

                watermark.display = group:selectable(
                    icon_title('display', 'Display', 1, 7), {
                        'User',
                        'FPS',
                        'Time'
                    }
                )

                watermark.padding = group:slider(
                    icon_title('ruler', 'Padding', 1, 7), 5, 10, 5, nil, 'px'
                )

                watermark.color = group:color_picker(
                    icon_title('palette', 'Color', 1, 7), {
                        ['Single'] = {
                            color(120, 200, 255, 255)
                        },

                        ['Gradient'] = {
                            color(120, 200, 255, 255),
                            color(255, 255, 255, 255)
                        }
                    }
                )

                watermark.speed = group:slider(
                    icon_title('rabbit', 'Speed', 1, 7), 1, 100, 16
                )

                watermark.position = group:combo(
                    icon_title('arrows-up-down-left-right', 'Position', 1, 7), {
                        'Left',
                        'Right',
                        'Bottom',
                        'Custom'
                    }
                )

                watermark.font = group:combo(
                    icon_title('font', 'Font', 1, 7), {
                        'Default',
                        'Pixel',
                        'Console',
                        'Bold'
                    }
                )

                watermark.animation = group:combo(
                    icon_title('diagram-venn', 'Animation', 0, 6), {
                        'None',
                        'Encoded'
                    }
                )

                watermark.text = group:input(
                    icon_title('text', 'Text', 1, 7), ''
                )

                watermark.print_commands = group:button(
                    button_title('code', 'Print Commands', 4), function()
                        logging_system.log('Commands:\n')

                        logging_system.log('pre_icon="tree" — Icon before prefix')
                        logging_system.log('post_icon="tree" — Icon after postfix')

                        logging_system.log('pre="Frost." — Prefix text')
                        logging_system.log('main="lua" — Main text')
                        logging_system.log('post="Text" — Postfix text')

                        logging_system.log('nobr — Remove brackets')
                        logging_system.log('nomn — Remove main')
                        logging_system.log('nopr — Remove postfix\n')

                        logging_system.log('Example: pre_icon="snowflake" pre="Frost." main="lua" nopr')
                    end, true
                )

                watermark.custom_colors = {
                    ['Pre'] = group:color_picker(
                        icon_title('palette', 'Pre Color', 1, 7), {
                            ['Single'] = {
                                color(150, 200, 60, 255)
                            },

                            ['Gradient'] = {
                                color(150, 200, 60, 255),
                                color(37, 100, 30, 255)
                            }
                        }
                    ),

                    ['Main'] = group:color_picker(
                        icon_title('palette', 'Main Color', 1, 7), {
                            ['Single'] = {
                                color(255, 255, 255, 255)
                            },

                            ['Gradient'] = {
                                color(255, 255, 255, 255),
                                color(128, 128, 128, 255)
                            }
                        }
                    ),

                    ['Post'] = group:color_picker(
                        icon_title('palette', 'Post Color', 1, 7), {
                            ['Single'] = {
                                color(235, 97, 97, 255)
                            },

                            ['Gradient'] = {
                                color(235, 97, 97, 255),
                                color(117, 48, 48, 255)
                            }
                        }
                    )
                }

                watermark.colors_button = group:button(
                    button_title('palette', 'Colors', 4), nil, true
                )

                watermark.back_button = group:button(
                    button_title('arrow-turn-down-right', 'Back', 47), nil, true
                )

                watermark.custom_colors['Pre']:visibility(false)
                watermark.custom_colors['Main']:visibility(false)
                watermark.custom_colors['Post']:visibility(false)

                watermark.custom_colors['Main']:set 'Gradient'
            end

            local callbacks do
                local function on_color(item)
                    watermark.speed:visibility(
                        item:get() == 'Gradient'
                    )
                end

                local function update_style(value)
                    local is_default = value == 'Default'
                    local is_new = value == 'New'
                    local is_custom = value == 'Custom'

                    local has_radius = is_new
                    local has_display = is_new
                    local has_padding = is_new

                    local has_color = not is_custom
                    local has_speed = has_color and is_default

                    if has_speed then
                        watermark.color:set_callback(on_color, true)
                    else
                        watermark.color:unset_callback(on_color)
                    end

                    watermark.radius:visibility(has_radius)
                    watermark.display:visibility(has_display)
                    watermark.padding:visibility(has_padding)

                    watermark.color:visibility(has_color)

                    watermark.position:visibility(is_custom)
                    watermark.font:visibility(is_custom)
                    watermark.animation:visibility(is_custom)
                    watermark.text:visibility(is_custom)
                    watermark.print_commands:visibility(is_custom)

                    watermark.colors_button:visibility(is_custom)
                end

                local function on_colors_button()
                    watermark.style:visibility(false)

                    watermark.speed:visibility(false)
                    watermark.color:visibility(false)

                    watermark.position:visibility(false)
                    watermark.font:visibility(false)
                    watermark.animation:visibility(false)
                    watermark.text:visibility(false)
                    watermark.print_commands:visibility(false)

                    watermark.custom_colors['Pre']:visibility(true)
                    watermark.custom_colors['Main']:visibility(true)
                    watermark.custom_colors['Post']:visibility(true)

                    watermark.colors_button:visibility(false)
                    watermark.back_button:visibility(true)
                end

                local function on_back_button()
                    watermark.style:visibility(true)
                    update_style(watermark.style:get())

                    watermark.custom_colors['Pre']:visibility(false)
                    watermark.custom_colors['Main']:visibility(false)
                    watermark.custom_colors['Post']:visibility(false)

                    watermark.colors_button:visibility(true)
                    watermark.back_button:visibility(false)
                end

                local function on_style(item)
                    update_style(item:get())
                end

                watermark.colors_button:set_callback(
                    on_colors_button, true
                )

                watermark.back_button:set_callback(
                    on_back_button, true
                )

                watermark.style:set_callback(
                    on_style, true
                )
            end

            visuals.watermark = watermark
        end

        local clantag = { } do
            clantag.enabled = GRP_RENDER:switch(
                icon_title('tag', 'Clantag', 2, 7)
            )

            local group = clantag.enabled:create() do
                clantag.mode = group:combo('Mode', {
                    'Frost',
                    'Custom'
                })

                clantag.style = group:combo('##STYLE', {
                    'Animated',
                    'Static'
                })

                clantag.input = group:input('##INPUT', '')

                local callbacks do
                    local function on_mode(item)
                        local value = item:get()

                        local is_custom = value == 'Custom'

                        clantag.style:visibility(is_custom)
                        clantag.input:visibility(is_custom)
                    end

                    utils.execute_after(0, function()
                        clantag.mode:set_callback(on_mode, true)
                    end)
                end
            end

            visuals.clantag = clantag
        end

        local screen_indicators = { } do
            screen_indicators.enabled = GRP_RENDER:switch(
                icon_title('sparkles', 'Screen Indicator', 0, 8)
            )

            local group = screen_indicators.enabled:create() do
                screen_indicators.color = group:color_picker(
                    icon_title('palette', 'Color', 1, 7), {
                        ['Accent'] = { color(120, 200, 255, 255) },
                        ['Secondary'] = { color(255, 255, 255, 255) }
                    }
                )

                screen_indicators.style = group:combo(
                    icon_title('pencil', 'Style', 1, 7), {
                        'Alternative',
                        'New',
                        'Modern'
                    }
                )

                screen_indicators.padding = group:slider(
                    icon_title('ruler', 'Padding', 1, 7), 0, 10, 4, nil, 'px'
                )

                screen_indicators.offset = group:slider(
                    icon_title('arrows-up-down-left-right', 'Offset', 1, 7), 5, 55, 24, nil, 'px'
                )

                screen_indicators.animation = group:switch(
                    icon_title('diagram-venn', 'Animation', 0, 6)
                )

                local callbacks do
                    local function on_style(item)
                        local value = item:get()

                        screen_indicators.padding:visibility(value == 'New')
                    end

                    utils.execute_after(0, function()
                        screen_indicators.style:set_callback(on_style, true)
                    end)
                end
            end

            visuals.screen_indicators = screen_indicators
        end

        local manual_arrows = { } do
            manual_arrows.enabled = GRP_RENDER:switch(
                icon_title('left-right', 'Manual Arrows', 0, 8)
            )

            local group = manual_arrows.enabled:create() do
                manual_arrows.color = group:color_picker(
                    icon_title('palette', 'Color', 1, 7), {
                        ['Active'] = { color(170, 160, 180, 255) },
                        ['Inactive'] = { color(0, 0, 0, 0) }
                    }
                )

                manual_arrows.style = group:combo(
                    icon_title('pencil', 'Style', 1, 7), {
                        'Classic',
                        'Modern',
                        'Triangle'
                    }
                )

                manual_arrows.animation = group:switch(
                    icon_title('diagram-venn', 'Animation', 0, 6)
                )
            end

            visuals.manual_arrows = manual_arrows
        end

        local damage_indicator = { } do
            damage_indicator.enabled = GRP_RENDER:switch(
                icon_title('list-ol', 'Damage Indicator', 0, 7)
            )

            local group = damage_indicator.enabled:create() do
                damage_indicator.color = group:color_picker(
                    icon_title('palette', 'Color', 1, 7), color(255, 255, 255, 255)
                )

                damage_indicator.font = group:combo(
                    icon_title('font', 'Font', 2, 7), {
                        'Default',
                        'Pixel',
                        'Bold'
                    }
                )

                damage_indicator.when_active = group:switch(
                    icon_title('heat', 'When Active', 2, 7)
                )

                damage_indicator.animation = group:switch(
                    icon_title('diagram-venn', 'Animation', 0, 6)
                )
            end

            visuals.damage_indicator = damage_indicator
        end

        local hitchance_indicator = { } do
            hitchance_indicator.enabled = GRP_RENDER:switch(
                icon_title('percent', 'Hitchance Indicator', 2, 8)
            )

            local group = hitchance_indicator.enabled:create() do
                hitchance_indicator.color = group:color_picker(
                    icon_title('palette', 'Color', 1, 7), color(255, 255, 255, 255)
                )

                hitchance_indicator.font = group:combo(
                    icon_title('font', 'Font', 2, 7), {
                        'Default',
                        'Pixel',
                        'Bold'
                    }
                )

                hitchance_indicator.animation = group:switch(
                    icon_title('diagram-venn', 'Animation', 0, 6)
                )
            end

            visuals.hitchance_indicator = hitchance_indicator
        end

        local velocity_warning = { } do
            velocity_warning.enabled = GRP_RENDER:switch(
                icon_title('triangle-exclamation', 'Velocity Warning', 1, 6)
            )

            local group = velocity_warning.enabled:create() do
                velocity_warning.color = group:color_picker(
                    icon_title('palette', 'Color', 1, 7), color(120, 200, 255, 255)
                )
            end

            visuals.velocity_warning = velocity_warning
        end

        local custom_scope = { } do
            custom_scope.enabled = GRP_VISUALS:switch(icon_title('crosshairs', 'Custom Scope', 1, 7)) do
                local group = custom_scope.enabled:create()

                custom_scope.color = group:color_picker(
                    icon_title('palette', 'Color', 1, 7), {
                        ['Main'] = { color(255, 255, 255, 255) },
                        ['Edge'] = { color(255, 255, 255, 0) }
                    }
                )

                custom_scope.offset = group:slider(
                    icon_title('arrows-up-down-left-right', 'Offset', 1, 7), 0, 500, 10, nil, 'px'
                )

                custom_scope.position = group:slider(
                    icon_title('arrows-minimize', 'Position', 1, 7), 0, 500, 105, nil, 'px'
                )

                custom_scope.thickness = group:slider(
                    icon_title('ruler', 'Thickness', 1, 7), 1, 10, 1, nil, 'px'
                )

                custom_scope.style = group:combo(
                    icon_title('pencil', 'Style', 1, 7), {
                        'Default',
                        'Rotated'
                    }
                )
            end

            visuals.custom_scope = custom_scope
        end

        local aspect_ratio = { } do
            local ratios = {
                '5:4',
                '4:3',
                '16:9',
                '16:10',
            }

            local values = {
                ['5:4'] = 125,
                ['4:3'] = 133,
                ['16:9'] = 177,
                ['16:10'] = 160
            }

            local keys = { } do
                for i = 1, #ratios do
                    local ratio = ratios[i]
                    local value = values[ratio]

                    keys[value] = ratio
                end
            end

            aspect_ratio.enabled = GRP_VISUALS:switch(icon_title('up-right-and-down-left-from-center', 'Aspect Ratio', 1, 7)) do
                local group = aspect_ratio.enabled:create()

                aspect_ratio.value = group:slider(
                    '##VALUE', 1, 200, 177, 0.01, function(val)
                        return keys[val] or nil
                    end
                )

                for i = 1, #ratios do
                    local ratio = ratios[i]
                    local value = values[ratio]

                    local function callback()
                        aspect_ratio.value:set(value)
                    end

                    local space = math.ceil(#ratio * 1.34)
                    local text = add_space(ratio, space)

                    group:button(text, callback, true)
                end
            end

            visuals.aspect_ratio = aspect_ratio
        end

        local viewmodel = { } do
            viewmodel.enabled = GRP_VISUALS:switch(icon_title('hand', 'Viewmodel', 1, 7)) do
                local group = viewmodel.enabled:create()

                viewmodel.fov = group:slider(
                    'FOV', 2000, 17000, 6800, 0.01
                )

                viewmodel.offset_x = group:slider(
                    'X', -2000, 2000, 0, 0.01
                )

                viewmodel.offset_y = group:slider(
                    'Y', -2000, 2000, 0, 0.01
                )

                viewmodel.offset_z = group:slider(
                    'Z', -2000, 2000, 0, 0.01
                )

                viewmodel.opposite_knife_hand = group:switch(
                    'Opposite Knife Hand'
                )
            end

            visuals.viewmodel = viewmodel
        end

        local grenade_radius = { } do
            grenade_radius.enabled = GRP_VISUALS:switch(icon_title('circle', 'Grenade Radius', 1, 7)) do
                local group = grenade_radius.enabled:create()

                grenade_radius.molotov = group:switch(icon_title('fire', 'Molotov', 1, 7), true) do
                    grenade_radius.molotov_color = grenade_radius.molotov:color_picker(
                        color(245, 90, 90, 255)
                    )
                end

                grenade_radius.smoke = group:switch(icon_title('smoke', 'Smoke', 0, 5), true) do
                    grenade_radius.smoke_color = grenade_radius.smoke:color_picker(
                        color(130, 130, 255, 255)
                    )
                end

                local callbacks do
                    local function on_molotov(item)
                        local value = item:get()

                        if not value and not grenade_radius.smoke:get() then
                            grenade_radius.smoke:set(true)
                        end
                    end

                    local function on_smoke(item)
                        local value = item:get()

                        if not value and not grenade_radius.molotov:get() then
                            grenade_radius.molotov:set(true)
                        end
                    end

                    grenade_radius.molotov:set_callback(on_molotov)
                    grenade_radius.smoke:set_callback(on_smoke)
                end
            end

            visuals.grenade_radius = grenade_radius
        end

        local skeet_indicators = { } do
            skeet_indicators.enabled = GRP_VISUALS:switch(
                icon_title('dollar-sign', '500$ Indicators', 2, 9)
            )

            local group = skeet_indicators.enabled:create() do
                local style_list = {
                    'Old'
                }

                if not locker_system.is_locked(-1) then
                    table.insert(style_list, 'New')
                end

                skeet_indicators.style = group:combo(
                    icon_title('pencil', 'Style', 1, 7), style_list
                )

                skeet_indicators.list = group:listable(
                    '##LIST', {
                        'Fake Duck',
                        'Double Tap',
                        'Hide Shots',
                        'Min. Damage',
                        'Force Body Aim',
                        'Force Safe Point',
                        'Fake Latency',
                        'Freestanding',
                        'Dormant Aimbot',
                        'Bomb Information',
                        'Hit/Miss Ratio'
                    }
                )
            end

            lock_unselection(skeet_indicators.list)

            visuals.skeet_indicators = skeet_indicators
        end

        local hit_markers = { } do
            hit_markers.enabled = GRP_RENDER:switch(
                icon_title('bullseye', 'Hit Markers', 1, 6)
            )

            local group = menu.cast(hit_markers.enabled:create()) do
                local function create_items_kibit()
                    local items = { }

                    local function key_callback(args)
                        args[2] = args[2] .. '##KIBIT'
                    end

                    group:set_callback(key_callback)

                    items.enabled = group:switch(
                        icon_title('toggle-on', 'Enabled', 1, 6)
                    )

                    items.color = group:color_picker(
                        icon_title('palette', 'Color', 1, 7), {
                            ['Vertical'] = { color(0, 255, 0, 255) },
                            ['Horizontal'] = { color(0, 255, 255, 255) }
                        }
                    )

                    items.size = group:slider(
                        icon_title('arrows-up-down', 'Size', 3, 9), 2, 6, 4, nil, 'px'
                    )

                    items.thickness = group:slider(
                        icon_title('arrows-left-right', 'Thickness', 1, 7), 1, 3, 2, nil, 'px'
                    )

                    group:unset_callback(key_callback)

                    return items
                end

                local function create_items_screen()
                    local items = { }

                    local function key_callback(args)
                        args[2] = args[2] .. '##SCREEN'
                    end

                    group:set_callback(key_callback)

                    items.enabled = group:switch(
                        icon_title('toggle-on', 'Enabled', 1, 6)
                    )

                    items.color = group:color_picker(
                        icon_title('palette', 'Color', 1, 7), color(255, 255, 255, 255)
                    )

                    group:unset_callback(key_callback)

                    return items
                end

                local function create_items_world()
                    local items = { }

                    local function key_callback(args)
                        args[2] = args[2] .. '##WORLD'
                    end

                    group:set_callback(key_callback)

                    items.enabled = group:switch(
                        icon_title('toggle-on', 'Enabled', 1, 6)
                    )

                    items.color = group:color_picker(
                        icon_title('palette', 'Color', 1, 7), color(120, 200, 255, 255)
                    )

                    items.add_glow = group:switch(
                        icon_title('keyboard-brightness', 'Add Glow', 0, 6), true
                    )

                    group:unset_callback(key_callback)

                    return items
                end

                hit_markers.type = group:list(
                    '##TYPE', {
                        icon_title('plus-large', 'Kibit', 1, 7),
                        icon_title('display', 'Screen', 1, 6),
                        icon_title('earth-americas', 'World', 1, 7)
                    }
                )

                hit_markers.kibit = create_items_kibit()
                hit_markers.screen = create_items_screen()
                hit_markers.world = create_items_world()

                local callbacks do
                    local function on_type(item)
                        local value = item:get()

                        local is_kibit  = value == 1
                        local is_screen = value == 2
                        local is_world  = value == 3

                        for _, v in pairs(hit_markers.kibit) do
                            v:visibility(is_kibit)
                        end

                        for _, v in pairs(hit_markers.screen) do
                            v:visibility(is_screen)
                        end

                        for _, v in pairs(hit_markers.world) do
                            v:visibility(is_world)
                        end
                    end

                    hit_markers.type:set_callback(
                        on_type, true
                    )
                end
            end

            visuals.hit_markers = hit_markers
        end

        resource.visuals = visuals
    end

    local misc = { } do
        local GRP_MAIN = groups.features.misc
        local GRP_MOVEMENT = groups.features.movement

        config_system.add('##MISC', GRP_MAIN, 'MISC')
        config_system.add('##MOVEMENT', GRP_MOVEMENT, 'MISC')

        local nickname_generator = { } do
            nickname_generator.label = GRP_MAIN:label(icon_title('signature', 'Nickname Generator', 1, 5)) do
                local group = nickname_generator.label:create()

                nickname_generator.input = group:input '##INPUT'

                nickname_generator.set_button = group:button(
                    add_space('Set', 11), nil, false
                )

                nickname_generator.generate_button = group:button(
                    add_space('Generate', 5), nil, true
                )

                nickname_generator.reset_button = group:button(
                    add_space('Reset', 8), nil, true
                )
            end

            misc.nickname_generator = nickname_generator
        end

        local unmute_mute_silenced = { } do
            unmute_mute_silenced.label = GRP_MAIN:label(icon_title('volume-high', 'Unmute/Mute Silenced', 1, 5)) do
                local group = unmute_mute_silenced.label:create()

                unmute_mute_silenced.mode = group:list(
                    '##MODE', {
                        'Disabled',
                        'Enemies',
                        'Teammates',
                        'Everyone'
                    }
                )
            end

            locker_system.push(-1, unmute_mute_silenced.mode, 1)

            misc.unmute_mute_silenced = unmute_mute_silenced
        end

        local fake_duck = { } do
            fake_duck.label = GRP_MAIN:label(icon_title('duck', 'Fake Duck', 2, 6)) do
                local group = fake_duck.label:create()

                fake_duck.select = group:listable(
                    '\a{Link Active}Options', {
                        icon_title('duck', 'Unlock Fake Duck Speed', 2, 6),
                        icon_title('wind-warning', 'Freezetime Fake Duck', 1, 5)
                    }
                )
            end

            misc.fake_duck = fake_duck
        end

        local air_duck_collision = { } do
            air_duck_collision.enabled = GRP_MAIN:switch(
                icon_title('person-burst', 'Air Duck Collision', 1, 5)
            )

            misc.air_duck_collision = air_duck_collision
        end

        local ping_spike = { } do
            ping_spike.enabled = GRP_MAIN:switch(icon_title('signal-stream', 'Ping Spike', 1, 6)) do
                local group = ping_spike.enabled:create()

                ping_spike.value = group:slider(
                    icon_title('signal', 'Latency', 0, 6), 0, 200, 0, nil, 'ms'
                )
            end

            misc.ping_spike = ping_spike
        end

        local fps_optimize = { } do
            fps_optimize.enabled = GRP_MAIN:switch(icon_title('frame', 'FPS Optimize', 2, 7)) do
                local group = fps_optimize.enabled:create()

                fps_optimize.always_on = group:switch(
                    icon_title('check', 'Always On', 1, 7), false
                )

                fps_optimize.detections = group:selectable(
                    icon_title('eye', 'Detections', 0, 6), {
                        'Peeking',
                        'Hit Flag'
                    }
                )

                fps_optimize.select = group:selectable(
                    icon_title('filter', 'Optimizations', 1, 6), {
                        'Fog',
                        'Blood',
                        'Bloom',
                        'Decals',
                        'Shadows',
                        'Sprites',
                        'Particles',
                        'Ropes',
                        'Dynamic lights',
                        'Map details',
                        'Weapon effects'
                    }
                )

                local callbacks do
                    local function on_always_on(item)
                        fps_optimize.detections:visibility(not item:get())
                    end

                    fps_optimize.always_on:set_callback(
                        on_always_on, true
                    )
                end
            end

            lock_unselection(fps_optimize.detections)

            lock_unselection(fps_optimize.select, {
                'Blood',
                'Decals',
                'Sprites',
                'Ropes',
                'Dynamic lights',
                'Weapon effects'
            })

            misc.fps_optimize = fps_optimize
        end

        local grenades = { } do
            grenades.label = GRP_MOVEMENT:label(icon_title('bomb', 'Grenades', 1, 5)) do
                local group = grenades.label:create()

                grenades.select = group:listable(
                    '\a{Link Active}Options', {
                        icon_title('hands-holding-circle', 'Super Toss', 1, 5),
                        icon_title('bomb', 'Grenade Release', 2, 6),
                        icon_title('hand-holding', 'Drop Nades', 1, 6)
                    }
                )

                grenades.drop_nades_select = group:listable(
                    '\a{Link Active}Select Drop Nades', {
                        icon_title('fire', 'Molotov', 2, 7),
                        icon_title('smoke', 'Smoke', 1, 5),
                        icon_title('explosion', 'Nade', 1, 7)
                    }
                )

                grenades.drop_nades_bind = group:hotkey('Hotkey')

                grenades.release_damage = group:slider(
                    'Amount', 1, 50, 50, nil, 'hp'
                )

                lock_unselection(grenades.drop_nades_select)

                local callbacks do
                    local function on_select(item)
                        grenades.release_damage:visibility(item:get(2))

                        grenades.drop_nades_bind:visibility(item:get(3))
                        grenades.drop_nades_select:visibility(item:get(3))
                    end

                    grenades.select:set_callback(
                        on_select, true
                    )
                end
            end

            misc.grenades = grenades
        end

        local no_fall_damage = { } do
            no_fall_damage.enabled = GRP_MOVEMENT:switch(
                icon_title('person-falling', 'No Fall Damage', 2, 7)
            )

            misc.no_fall_damage = no_fall_damage
        end

        local fast_ladder = { } do
            fast_ladder.enabled = GRP_MOVEMENT:switch(
                icon_title('water-ladder', 'Fast Ladder', 1, 6)
            )

            misc.fast_ladder = fast_ladder
        end

        resource.misc = misc
    end
end

debug_point 'begin_localplayer'

local localplayer do
    localplayer = { }

    local pre_flags = 0
    local post_flags = 0

    localplayer.is_onground = false

    localplayer.is_moving = false
    localplayer.is_crouched = false

    localplayer.is_peeking = false
    localplayer.is_vulnerable = false

    localplayer.velocity2d = 0
    localplayer.duck_amount = 0

    localplayer.team_num = 0
    localplayer.sent_packets = 0

    -- from @enq
    local function extrapolate(origin, velocity, ticks)
        return origin + velocity * (ticks * globals.tickinterval)
    end

    local function is_peeking(player)
        local should, vulnerable = false, false
        local velocity = player.m_vecVelocity

        local eye = player:get_eye_position()
        local peye = extrapolate(eye, velocity, 14)

        local enemies = entity.get_players(true)
        local hittable = entity.get_threat(true)

        for i = 1, #enemies do
            local enemy = enemies[i]

            if not enemy:is_alive() then
                goto continue
            end

            if enemy == hittable then
                vulnerable = true
                goto continue
            end

            local head = enemy:get_hitbox_position(0)
            local phead = extrapolate(head, velocity, 4)

            local damage = utils.trace_bullet(
                player, peye, phead
            )

            if damage ~= nil and damage > 0 then
                should = true
                break
            end

            ::continue::
        end

        return should, vulnerable
    end

    local function on_createmove(e)
        local me = entity.get_local_player()

        if me == nil then
            return
        end

        local peeking, vulnerable = is_peeking(me)

        pre_flags = me.m_fFlags

        localplayer.velocity2d = me.m_vecVelocity:length2d()

        localplayer.is_peeking = peeking
        localplayer.is_vulnerable = vulnerable

        if e.choked_commands == 0 then
            localplayer.duck_amount = me.m_flDuckAmount
            localplayer.sent_packets = localplayer.sent_packets + 1
        end

        localplayer.is_moving = localplayer.velocity2d > 1.1 * 3.3
        localplayer.is_crouched = localplayer.duck_amount > 0

        localplayer.team_num = me.m_iTeamNum
    end

    local function on_createmove_run(e)
        local me = entity.get_local_player()

        if me == nil then
            return
        end

        post_flags = me.m_fFlags

        localplayer.is_onground = bit.band(pre_flags, 1) == 1
            and bit.band(post_flags, 1) == 1
    end

    on_createmove = create_debug_callback('localplayer.on_createmove', on_createmove)
    on_createmove_run = create_debug_callback('localplayer.on_createmove_run', on_createmove_run)

    events.createmove(
        on_createmove
    )

    events.createmove_run(
        on_createmove_run
    )
end

debug_point 'begin_exploit'

local exploit do
    exploit = { }

    local old_origin = nil
    local max_tickbase = 0

    exploit.max_defensive_ticks = 0
    exploit.defensive_ticks = 0

    exploit.teleport_units_sqr = 0

    local function update_defensive(me)
        local tickbase = me.m_nTickBase

        if math.abs(tickbase - max_tickbase) > 64 then
            -- nullify highest tickbase if the difference is too big
            max_tickbase = 0
        end

        local defensive_ticks_left = 0

        -- defensive effect can be achieved because the lag compensation is made so that
        -- it doesn't write records if the current simulation time is less than/equals highest acknowledged simulation time
        -- https://gitlab.com/KittenPopo/csgo-2018-source/-/blame/main/game/server/player_lagcompensation.cpp#L723

        if tickbase > max_tickbase then
            max_tickbase = tickbase
        elseif max_tickbase > tickbase then
            defensive_ticks_left = math.min(14, math.max(0, max_tickbase - tickbase - 1))
        end

        if defensive_ticks_left > 0 then
            if exploit.max_defensive_ticks == 0 then
                exploit.max_defensive_ticks = defensive_ticks_left
            end

            exploit.defensive_ticks = defensive_ticks_left
        else
            exploit.defensive_ticks = 0
            exploit.max_defensive_ticks = 0
        end
    end

    local function update_teleport(old_origin, new_origin)
        local delta = new_origin - old_origin
        local distancesqr = delta:lengthsqr()

        exploit.teleport_units_sqr = distancesqr
    end

    local function update_simulation_time(me)
        local simtime = me:get_simulation_time()

        if simtime == nil then
            return
        end

        local origin = me.m_vecOrigin

        if old_origin ~= nil then
            local delta = to_ticks(simtime.current - simtime.old)

            if delta < 0 or delta > 0 and delta <= 64 then
                update_teleport(old_origin, origin)
            end
        end

        old_origin = origin
    end

    local function on_createmove()
        local me = entity.get_local_player()

        if me == nil then
            return
        end

        update_defensive(me)
    end

    local function on_net_update_start()
        local me = entity.get_local_player()

        if me == nil then
            return
        end

        update_simulation_time(me)
    end

    on_createmove = create_debug_callback('exploit.on_createmove', on_createmove)
    on_net_update_start = create_debug_callback('exploit.on_net_update_start', on_net_update_start)

    events.createmove(
        on_createmove
    )

    events.net_update_start(
        on_net_update_start
    )
end

debug_point 'begin_statement'

local statement do
    statement = { }

    local state = nil

    local function compute_state()
        if localplayer.is_onground then
            if software.antiaim.misc.slow_walk:get() then
                return 'Slowwalking'
            end

            if localplayer.is_crouched then
                if localplayer.is_moving then
                    return 'Sneaking'
                end

                return 'Ducking'
            end

            if not localplayer.is_moving then
                return 'Standing'
            end

            return 'Running'
        end

        if localplayer.is_crouched then
            return 'In Air & Duck'
        end

        return 'In Air'
    end

    local function on_createmove()
        state = compute_state()
    end

    function statement.get()
        return state
    end

    on_createmove = create_debug_callback('statement.on_createmove', on_createmove)

    events.createmove(
        on_createmove
    )
end

debug_point 'begin_shot_system'

local shot_system do
    shot_system = { }

    local event_bus = event_system:new()

    local shot_list = { }

    local function create_shot_data(player)
        local tick = globals.tickcount
        local eye_pos = player:get_eye_position()

        local data = {
            tick = tick,

            player = player,
            victim = nil,

            eye_pos = eye_pos,
            impacts = { },

            damage = nil,
            hitgroup = nil
        }

        return data
    end

    local function on_weapon_fire(e)
        local userid = entity.get(e.userid, true)

        if userid == nil then
            return
        end

        table.insert(shot_list, create_shot_data(userid))
    end

    local function on_player_hurt(e)
        local userid = entity.get(e.userid, true)
        local attacker = entity.get(e.attacker, true)

        if userid == nil or attacker == nil then
            return
        end

        for i = #shot_list, 1, -1 do
            local data = shot_list[i]

            if data.player == attacker then
                data.victim = userid

                data.damage = e.dmg_health
                data.hitgroup = e.hitgroup

                break
            end
        end
    end

    local function on_bullet_impact(e)
        local userid = entity.get(e.userid, true)

        if userid == nil then
            return
        end

        for i = #shot_list, 1, -1 do
            local data = shot_list[i]

            if data.player == userid then
                local pos = vector(e.x, e.y, e.z)
                table.insert(data.impacts, pos)

                break
            end
        end
    end

    local function on_net_update_start()
        local me = entity.get_local_player()

        if me == nil then
            return
        end

        local head_pos = nil do
            if me:is_alive() then
                head_pos = me:get_hitbox_position(0)
            end
        end

        for i = 1, #shot_list do
            local data = shot_list[i]

            if data.player == nil then
                goto continue
            end

            local impact_count = #data.impacts

            if impact_count == 0 then
                goto continue
            end

            local eye_pos = data.eye_pos
            local end_pos = data.impacts[impact_count]

            if eye_pos == nil or end_pos == nil then
                goto continue
            end

            event_bus.player_shot:fire {
                tick = data.tick,

                player = data.player,
                victim = data.victim,

                eye_pos = eye_pos,
                end_pos = end_pos,

                damage = data.damage,
                hitgroup = data.hitgroup
            }

            if head_pos ~= nil and data.player:is_enemy() then
                local closest_point = aux.closest_ray_point(
                    eye_pos, end_pos, head_pos, true
                )

                local distancesqr = head_pos:distsqr(closest_point)

                if distancesqr <= 80 * 80 then
                    local distance = math.sqrt(distancesqr)

                    event_bus.enemy_shot:fire {
                        tick = data.tick,
                        distance = distance,

                        player = data.player,
                        victim = data.victim,

                        eye_pos = eye_pos,
                        end_pos = end_pos,

                        damage = data.damage,
                        hitgroup = data.hitgroup
                    }
                end
            end

            ::continue::
        end

        for i = 1, #shot_list do
            shot_list[i] = nil
        end
    end

    function shot_system.get_event_bus()
        return event_bus
    end

    on_weapon_fire = create_debug_callback('shot_system.on_weapon_fire', on_weapon_fire)
    on_player_hurt = create_debug_callback('shot_system.on_player_hurt', on_player_hurt)
    on_bullet_impact = create_debug_callback('shot_system.on_bullet_impact', on_bullet_impact)
    on_net_update_start = create_debug_callback('shot_system.on_net_update_start', on_net_update_start)

    events.weapon_fire(on_weapon_fire)
    events.player_hurt(on_player_hurt)
    events.bullet_impact(on_bullet_impact)
    events.net_update_start(on_net_update_start)
end

debug_point 'begin_localdb'

local localdb do
    localdb = { }

    local BASE64_KEY = 'lTZA7O1VkC3wj2YacHuBdMPRE8mtQXpnJKe5Ux9L4SIvNirWohDygszf60FbqG+/='

    local PATH = '.\\' .. script.name
    local FILE = PATH .. '\\db.dat'

    local store = { }

    local function read_file()
        return files.read(FILE)
    end

    local function write_file(str, is_binary)
        if is_binary == nil then
            is_binary = false
        end

        return files.write(FILE, str, is_binary)
    end

    local function encode_data(data)
        local ok, result = pcall(
            json.stringify, data
        )

        if not ok then
            return false, result
        end

        ok, result = pcall(
            base64.encode, result, BASE64_KEY
        )

        if not ok then
            return false, result
        end

        return true, result
    end

    local function decode_data(data)
        local ok, result = pcall(
            base64.decode, data, BASE64_KEY
        )

        if not ok then
            return false, result
        end

        ok, result = pcall(
            json.parse, result
        )

        if not ok then
            return false, result
        end

        return true, result
    end

    local function write_storage(data)
        -- create folder, if doesn't exists
        files.create_folder(PATH)

        local ok, result = encode_data(data)

        if not ok then
            logging_system.error(
                'Unable to encode data'
            )

            return false
        end

        if not write_file(result) then
            logging_system.error(
                'Unable to write db'
            )

            return false
        end

        return true
    end

    local function parse_storage()
        -- create folder, if doesn't exists
        files.create_folder(PATH)

        local content = read_file()

        -- if can't read file, create
        -- new one with empty database
        if content == nil then
            if not write_storage { } then
                logging_system.log 'Unable to create db'
            end

            return { }
        end

        local ok, result = decode_data(content)

        if not ok then
            logging_system.error 'Unable to decode db'
            logging_system.log 'Trying to flush db'

            if not write_storage { } then
                logging_system.error 'Unable to flush db'
            end

            return { }
        end

        return result
    end

    local M = { } do
        function M:__index(key)
            return store[key]
        end

        function M:__newindex(key, value)
            store[key] = value
            write_storage(store)
        end
    end

    store = parse_storage()
    setmetatable(localdb, M)
end

debug_point 'begin_binds_ctx'

local binds_ctx do
    binds_ctx = { }

    local lookup = { }

    local function on_render()
        local binds = ui.get_binds()

        for k in pairs(lookup) do
            lookup[k] = nil
        end

        for i = 1, #binds do
            local bind = binds[i]

            local reference = bind.reference
            local reference_id = reference:id()

            lookup[reference_id] = bind
        end
    end

    function binds_ctx.get(reference)
        if reference == nil then
            return nil
        end

        return lookup[reference:id()]
    end

    on_render = create_debug_callback('binds_ctx.on_render', on_render)

    events.render(on_render)
end

debug_point 'begin_configs'

local configs do
    configs = { }

    local BASE64_KEY = 'MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/='

    local function encode_data(data)
        local ok, result = pcall(
            json.stringify, data
        )

        if not ok then
            return false, result
        end

        ok, result = pcall(
            base64.encode, result, BASE64_KEY
        )

        if not ok then
            return false, result
        end

        return ok, result
    end

    local function decode_data(data)
        local ok, result = pcall(
            base64.decode, data, BASE64_KEY
        )

        if not ok then
            return false, result
        end

        ok, result = pcall(
            json.parse, result
        )

        if not ok then
            return false, result
        end

        return true, result
    end

    function configs:encode(data)
        return encode_data(data)
    end

    function configs:decode(data)
        return decode_data(data)
    end
end

debug_point 'begin_profile'

local profile do
    local ref = resource.profile

    local button = (
        ref.debug_button
        or ref.secret_button
    )

    local button_name = button:name()

    local function update_button(item, name)
        local style = ui.get_style()

        local color_a = style['Link Active']
        local color_b = color_a:clone()

        color_b.a = color_b.a * 0.5

        item:name(text_anims.gradient(
            name, globals.realtime,
            color_a, color_b
        ))
    end

    local function on_render()
        update_button(button, button_name)
    end

    on_render = create_debug_callback('configs.on_render', on_render)

    events.render(on_render)
end

debug_point 'begin_activity'

local activity do
    local ref = resource.activity

    local DB_NAME = 'activity'

    local DB_DEFAULT = {
        killes = 0,
        misses = 0,
        loads = 0
    }

    local db_data = (
        localdb[DB_NAME]
        or DB_DEFAULT
    )

    local session_time = 0

    local function get_formatted_time(seconds)
        local buffer = { }

        local hrs = math.floor(seconds / 3600)
        local min = math.floor(seconds % 3600 / 60)
        local sec = seconds % 60

        if hrs > 0 then
            table.insert(buffer, string.format('%dh', hrs))
        end

        if min > 0 then
            table.insert(buffer, string.format('%dm', min))
        end

        table.insert(buffer, string.format('%ds', sec))

        return table.concat(buffer, '\x20')
    end

    local function update_session_time(seconds)
        local str = get_formatted_time(seconds)
        local name = string.format('\a{Link Active}%s##SESSION_TIME', str)

        ref.session_time_button:name(name)
    end

    local function update_time_left(seconds)
        local str = get_formatted_time(seconds)
        local name = string.format('\a{Link Active}%s##TIME_LEFT', str)

        ref.time_left_button:name(name)
    end

    local function update_killes(killes)
        local name = string.format(
            '\a{Link Active}%s##KILLES', killes
        )

        ref.killes_button:name(name)
    end

    local function update_misses(misses)
        local name = string.format(
            '\a{Link Active}%s##MISSES', misses
        )

        ref.misses_button:name(name)
    end

    local function save_data_in_db()
        localdb[DB_NAME] = db_data
    end

    local function on_delay_loop()
        if trial.time ~= nil then
            update_time_left(trial.process())
        else
            update_session_time(session_time)
            session_time = session_time + 1
        end

        utils.execute_after(1, on_delay_loop)
    end

    local function on_enemy_fire(e)
        if e.distance > 32 then
            return
        end

        db_data.misses = db_data.misses + 1
        update_misses(db_data.misses)

        save_data_in_db()
    end

    local function on_player_death(e)
        local me = entity.get_local_player()

        local userid = entity.get(e.userid, true)
        local attacker = entity.get(e.attacker, true)

        if me == userid or me ~= attacker then
            return
        end

        db_data.killes = db_data.killes + 1
        update_killes(db_data.killes)

        save_data_in_db()
    end

    local function on_stats_init()
        update_killes(db_data.killes)
        update_misses(db_data.misses)

        save_data_in_db()
    end

    local shot_events = shot_system.get_event_bus() do
        shot_events.enemy_shot:set(on_enemy_fire)
    end

    on_player_death = create_debug_callback('activity.on_player_death', on_player_death)

    events.player_death(on_player_death)

    on_delay_loop()
    on_stats_init()
end

debug_point 'begin_presets'

local presets do
    local ref = resource.presets

    local DB_NAME = 'presets'
    local DB_DEFAULT = { }

    local db_data = (
        localdb[DB_NAME]
        or DB_DEFAULT
    )

    local pinned_list = { }
    local preset_list = { }

    local trim do
        local match = string.match

        function trim(s)
            return (
                match(s, '^()%s*$') and ''
                or match(s, '^%s*(.*%S)')
            )
        end
    end

    local function save_data_in_db()
        localdb[DB_NAME] = db_data
    end

    local function export_preset()
        local data = { }

        local list = config_system.get()

        for k, v in pairs(list) do
            data[k] = v[1]:export()
        end

        return data
    end

    local function import_preset(data)
        local list = config_system.get()

        for k, v in pairs(data) do
            local value = list[k]

            if value == nil then
                goto continue
            end

            value[1]:import(v)

            ::continue::
        end
    end

    local function create_preset(author, name, time, content)
        local preset = { }

        preset.name = name
        preset.author = author

        preset.content = content

        preset.created_at = time
        preset.updated_at = time

        return preset
    end

    local function create_blank(name)
        local data = export_preset()

        if data == nil then
            return nil
        end

        return create_preset(
            common.get_username(), name,
            common.get_unixtime(), data
        )
    end

    local function add_to_pinned(preset)
        if type(preset.content) == 'string' then
            local ok, result = configs:decode(
                preset.content
            )

            if not ok then
                return
            end

            preset.content = result
        end

        table.insert(pinned_list, preset)
    end

    local function find_by_name(name)
        for i = #preset_list, 1, -1 do
            local preset = preset_list[i]

            if preset.name == name then
                return preset, i
            end
        end

        return nil, -1
    end

    local function get_preset(index)
        return preset_list[index]
    end

    local function load_preset(name)
        local preset = find_by_name(trim(name))

        if preset == nil or preset.content == nil then
            return false, 'Preset is not valid'
        end

        import_preset(preset.content)
        events.update_records:call()

        return true, preset
    end

    local function save_preset(name)
        name = trim(name)

        if name == '' then
            return false, 'Preset name is empty'
        end

        local preset, index = find_by_name(name)

        if preset == nil then
            local config = create_blank(name)

            if config == nil then
                return false, 'Unable to create preset'
            end

            table.insert(db_data, config)

            save_data_in_db()

            return true, config
        end

        if index ~= -1 and index <= #pinned_list then
            return false, 'Can\'t modify script preset'
        end

        local content = export_preset()

        if content == nil then
            return false, 'Unable to export config'
        end

        local time = common.get_unixtime()

        preset.content = content
        preset.updated_at = time

        save_data_in_db()

        return true, preset
    end

    local function delete_preset(name)
        local preset, index = find_by_name(trim(name))

        if index ~= -1 and index <= #pinned_list then
            return false, 'Can\'t delete script preset'
        end

        local data_index = index - #pinned_list
        table.remove(db_data, data_index)

        save_data_in_db()

        return true, preset
    end

    local function get_render_list()
        local count = #preset_list

        if count == 0 then
            return { 'Empty' }
        end

        local list = { }

        for i = 1, count do
            local preset = preset_list[i]

            local name = preset.name

            if i <= #pinned_list then
                name = string.format(
                    '%s\a{Disabled Text}  ~  pinned', name
                )
            end

            list[i] = name
        end

        return list
    end

    local function update_preset_list()
        preset_list = { }

        for i = 1, #pinned_list do
            table.insert(preset_list, pinned_list[i])
        end

        table.sort(db_data, function(a, b)
            return a.name < b.name
        end)

        for i = 1, #db_data do
            table.insert(preset_list, db_data[i])
        end
    end

    local callbacks do
        local function on_list(item)
            local value = item:get()

            if value == nil or value <= 0 then
                return
            end

            local preset = get_preset(value)

            if preset == nil then
                return
            end

            ref.name:set(preset.name)
        end

        local function on_load()
            local ok, result = load_preset(
                ref.name:get()
            )

            if not ok then
                logging_system.error(result)

                return
            end

            events.update_records:call()

            logging_system.success(string.format(
                'preset %s loaded', result.name
            ))
        end

        local function on_save()
            local ok, result = save_preset(
                ref.name:get()
            )

            if not ok then
                logging_system.error(result)

                return
            end

            update_preset_list()
            ref.list:update(get_render_list())

            logging_system.success(string.format(
                'preset %s saved', result.name
            ))
        end

        local function on_delete()
            local ok, result = delete_preset(
                ref.name:get()
            )

            if not ok then
                logging_system.error(result)

                return
            end

            update_preset_list()
            ref.list:update(get_render_list())

            if result ~= nil then
                logging_system.success(string.format(
                    'preset %s deleted', result.name
                ))
            end
        end

        local function on_export()
            local data = export_preset()

            if data == nil then
                return
            end

            local ok, result = configs:encode(data)

            if not ok then
                logging_system.error(
                    'can\'t encode data'
                )

                return
            end

            clipboard.set(string.format(
                '%s_', result
            ))

            logging_system.success(
                'preset exported'
            )
        end

        local function on_import()
            local str = string.match(
                clipboard.get(), '(.-)_'
            )

            if str == nil then
                return
            end

            local ok, result = configs:decode(str)

            if not ok then
                logging_system.error(
                    'can\'t decode data'
                )

                return
            end

            import_preset(result)
            events.update_records:call()

            logging_system.success(
                'preset imported'
            )
        end

        ref.list:set_callback(on_list)
        ref.load:set_callback(on_load)
        ref.save:set_callback(on_save)
        ref.delete:set_callback(on_delete)
        ref.export:set_callback(on_export)
        ref.import:set_callback(on_import)
    end

    add_to_pinned(create_preset(
        'density', 'Snappy', -1, 'qCfof7ezm72eRHQaZeQEOFO3kF27foDdqHldBo9nBa87gs9lBpldzIG9fofYgr80zaBYBeldzoNQ4eldBrR7gaM0Bry1zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1gaUYBrE0zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8rzafYzaRrgHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezm72eRHQaZeQEkFgTXF0IfoDdqHldBsfnBsfrBrU2gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoU2ht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBrmQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgS7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gY7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsmQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoflht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2BI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzovQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf2grfYBsbHgrk9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDHzP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrB1Br8lBaR1BpldzIG9fofYgr80zaBYBeldzoNQ4eldgaEngrM7za9nzeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzoOQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoE0ht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhmIvpOSg78F0bXF0IfoDdqHldBoBCBoUrBsU1gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBI7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBobHgrBCgrRYzZldzIG9fofYgr80zaBYBeldzoNQ4eldBr91gsElBrRngpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBryHgoE7Bo97BZldzIG9fofYgr80zaBYBeldzoUASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzomQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzd7Yht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDGBs3Q4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQaZeQvcdNNXSfdzdvxSVfCzsfrBrEnzsBHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzo3Q4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzoOQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzoOQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBlza87gsfYBok9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foD2ht29foEn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zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBCgsRlBs9rBsg9fowxSVfCgr9nzsyrgrN9foDlht29foBYgryCzafYBom9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDrht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foD2BP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjgP7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgamQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoEHht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72zP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfCht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoEHht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDnht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRlgoyHBry2BpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzoR1ht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzoR1ht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD2gI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoUR0PsEZsS7gRS7Q6feNpOFAdzdv6kF2AfdldfCgNsbkBmZghUHmhRIZ6c5p6OCfjfIG9foElza8HgsU0Bae9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoEYgsMnza97BZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzogQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoB7ht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBomQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgY7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDrht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDrzS7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fof7goynBsN9fowxSVfCgr9nzsyrgrN9foDlht29fo91gsb2go90gpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzof1ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foD2BP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzd72gP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfj4sEYht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhRn2KkYk3ciGwc59dzdvxSVf2gr91zaf1BrR1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsf7zsRngsB7SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDnht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBoRnBsy1gaflgZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzd72zaNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoeQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9lgoMlBoM0zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7gRSHg6OFeTXF0IfoDdqHldBsblza8HBs90gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzogQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgS7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foD7gS7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foBCBo9CzsEHBaZ9fowxSVfCgr9nzsyrgrN9foDlht29foBrBsECgr91gok9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDnht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDlht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrUYgaBrgaU7SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQaZeQskie6Oip6OCfjfIG9fofCgaUYzayHgop9fowxSVfCgr9nzsyrgrN9foDlht29fofrBoyYgrU0Bre9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd7Hht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoR0zabYzaM7SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobCgoE7zaynBeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzomQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoU2ht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBomQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CBY7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foD7gS7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezm72eRHQRS7mpO5eHcPUdzdvxSVfrBaEYBsfYBsR1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBsylBo8CzsRlSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr8Hza9nzsRrBHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgoR2grbCBag9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQRS7mH8nGwc59dzdvxSVfrgoUlBayCBaB1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjBrNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzokQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzokQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1BaBCBs91BrN9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BS7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sB7ht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDGBoZQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBskQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoE7ht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsvQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoRlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDCht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgaf1Bs9CgaU2BHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzoOQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoE0ht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf0BrEngo91gHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHmhmIvpOSg78F0bXF0IfoDdqHldBsB1gr90gob1geldzIG9fofYgr80zaBYBeldzoNQ4eldBoUrgo90BablSVfjqHldBo9Ygob1Br9lSVfjgV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjgP7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfj4skQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzd72zP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9HgsR0BaRrzZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgaElBs92za92gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBI7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0PsEZsSHmhtF1yUFpCfoDdqHldBsB7BsBYgsfCBeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzoeQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoBHht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBopQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgI7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDrgP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Y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fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foBlBaM2BsRCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB1Bo91zsECBsk9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDHzP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDHzP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzokQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzokQ4eldBryrgo8YBsB1gZld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gr80zaBYBeldzomQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzogQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoB0ht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldzsMlgsbCgaU2SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoElht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzd72gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfj4sE7ht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDGBskQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQRSHgAcYkY8F2TXF0IfoDdqHldBs9lgoE1Bo9lgeldzIG9fofYgr80zaBYBeldzoNQ4eldBofngoEnga8YSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDnht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBobYBrM2gr9lgpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzd72zaNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoeQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldza8nzaylBrRHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghZeQsc5Z3Xnp6OCfjfIG9foflBs92gsyngrN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaMnBa81gsO9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDnht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDlht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElBsf7gabnBZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzoR1ht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzoR1ht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7Bsy0grR1zaM2SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgaNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBI7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfHht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoUHht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDrht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0PsEZsSHmhRYm3c5mwc59dzdvxSVf2BaB7goRHgrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE1BsMrzsflSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjgapQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfj4sfCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDGgS7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoE2za97BoMCgZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBoMYBoRHza8HSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjgP7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgaeQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CgP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfrht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoUHht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foD2ht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDrht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foEYgry1ga81zam9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gaUnBaU7gsEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gayHBs9lgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoR7zsMlBrylSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo9YBsbrgsEYgHldzIG9fofYgr80zaBYBeldzoElBP7ASVfCgr92zsBHBs91SVfjqHldBo9Ygob1Br9lSVfjBsMlht29fof1zaE7BoblBom9fowxSVfCgr9nzsyrgrN9foD2BaNQhS7ASVfHBoy2gob7zaN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2zsM2BaMnBsRHSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCBr87gs8HgsBlSVfjqHldBo9Ygob1Br9lSVfjgPHQht29fo92zsbYBoMHBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fofrzaEYBaR0grp9fowxSVfCgr9nzsyrgrN9foDrht29foBrgryYzs9Ygo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7grR0gs9lBaN9fowxSVfCgr9nzsyrgrN9foDCBaNQhSHQfdldfCgNspmvURpgSHgeZemvsbksS7Z8ZevNfoDdqHldBsUHzsU1gry2gZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBnBsy7goECBHldzIG9fofYgr80zaBYBeldzogQhS7ASVfCzafHBaErBo92SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrR0BoM0zaR0BeldzIG9fofYgr80zaBYBeldzo3QhS7ASVfrgaflBrR2go9YSVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBt29foE0BrU0gobYgeldzo8Y4eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOS7AqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1BpldzoMASVf2zsf1Bof0goe9foDC4eldBsbrgabnzs97SVfjzsMASVfCBablgsEHBaE1SVfjBV29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofCgsMYBsblgok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaMHBsBlgoUrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsRnzsy1zaBHSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf7BoUlgoEYBaE7SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foDH4eldBoM0BaR2gsM2zeldzoEASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9nBafnBsfCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBofHBa92zsMngHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUlBaR2BrMngag9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRCga9lBoBrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fof1BoblgrRlgsg9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BrfngsM2grU0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaM0BsR1BrEYSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2grUrBaRrzablSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gr8lBrMnBr9nSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2za9nBsBnzaUlSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsyCBrRrgaRHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoB0Bs8nBsfHBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoR2Ba8nBs87BeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoy1zsbngrBHgpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrM1BsR1gabrzZldzIG9fofYgr80zaBYBeldzokQ4eldBrE1gobrgaBYgeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrBCgsRYBoRCgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaBHgsM1gaN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUlgsyrBaMrzae9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUlgrf0gobnBak9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUCgobrBrf2Bov9fowxSVfCgr9nzsyrgrN9fow79IZpht29foyHBo80Brb7zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy1zaflBaEHBeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldzsUCBry2Bs9HSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzs80zsRCgsM1SVfjqHldBo9Ygob1Br9lSVfjkPvH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zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7membZzR7pFmZQaZeQEOFO3kF27foDdqHldBsElBay7goECgeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrRlBrfCgrblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfCgoR0gob2goRrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCzsBlBrylBrR2SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBrU0gofCgoN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB7BaEngrBCBrk9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foB7goM7gsy2gsg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhmPZoXnp6OCfjfIG9foEYBoB1BaElBam9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBobYBrfYgr8YBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBrf1Bo87goRrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBrRHBrBrgsfrBZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgaMCga8CzaE2gHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldgaM1BrU2BrMrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobHgrb2grE7BeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRS7OCOFZrkie6Oip6OCfjfIG9fof2gaf2gaB7zs39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fofHgoR1gsfCzav9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fof1BsbnBrbHgak9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foB7gof2BayCzap9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9ngab7gaEHzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo9nzs8lBr9CSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhtF1yUFpCfoDdqHldBs9rzaRrgoE0gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzofCht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBoErzsU0grb7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBr9HBaMYBoErSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjzapQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMC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go80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BobCBrM0zsb0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhsn1yRiZpXCfjfIG9fofCgsfrgaBlBeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBo80Ba8ngrBnzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsUlBsU7BaBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf7BoU0gsECzab1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfnzs8HBo92zaO9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fo9HgsB2BoElBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQaZeQtkF06XF0IfoDdqHldBs9CBoMrBoR0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2za92grRCga87SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoBYgoBnBrf1SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1za92Bsf0zsm9fowx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qHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgr82gsMHzZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldgry1gafYgrErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVf1go92goBYzs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhRn0p8FGwc59dzdvxSVfCBrynBaMrBrN9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfj4sy0hSHQ4eldBoRYBsRrgrf0gHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBoblgoBnBr81BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoEHBY7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf7Bsblgr9HBsy7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVf7Boy1gaylBo90SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU1zsE7zsf7gHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgsR2Bob1goECSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRSHg78F0bXF0IfoDdqHldBsR1zsMrgaBnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBsbCBrynBa97geldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBrflzafYBof7zeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBrBlgsbYgrB7BHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgsR2Ba87goblSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzaM2goErgoMYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza8rgr8Czs9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHmhmiZ58SZAkVfjfIG9foE2grblgsB2geldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBsyrBoB7goU2zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBoUnzay2grUrgpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoR7BrRCgrRCzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBa9YgoMlBsk9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBrgofCzsBnBag9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0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SVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjgapQhS7ASVf2gsM1za9YgsRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVf2goRHgsB0BoflSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsb0gr87BrbCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foD7ht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBoBnBsMCBaUHzeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1gs9rgaM2gsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo9YzsbCgrEnzeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzofCht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQhtfAfdBomEZimR0stZOeSHmhtF1yUFpCfV8ymPZoXCfjfIG9foE2zs97zaMCBHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foECBab7gaElBam9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof2zaU0BrE2gap9fowxSVfCgr9nzsyrgrN9foD74eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBsNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCgoM1goB0zsBrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCza8CgafYBsb1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foBHBaU1zsR0gaN9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDCBIHQht29foB1Ba9YBrE1Bap9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhZeQWcdNUOFZTfoDdqHldBs9lgr9CgoRHzZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBofHBoR0gaBlgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB7Bof2go9ngog9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foUlgsynBrynzae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BrBrgayYgrm9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgoRYBsUYgsRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhSHQfdldfCgEmROespgvZbZhZeQtkF06XF0IfoDdqHldBs8Hga80gsR2zeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBsy7gaRHBafCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoE0zsRnBrfngpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBrgob2Br8nBov9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foUlBaRnBa9ngaN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUlzaMrBs9YBrg9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgoM7BsEngsE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhSHQfdldfCgEmROespgvZbZhZeQsciQYkneAXnp6OCfjfIG9foElzaErBofHgZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf2zsb7gsR7zs8nSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnBa8YBaB7zsk9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDGzapQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBobngry1zab2BZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBryrBo92gof2BZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foRHgaUCBsBCzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldgs9ngs8YBs8nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHld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gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1za87gafHBom9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQRSHg78F0bXF0IfoDdqHldBsflgaB0BaB1BHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs8Ygs81BrfnzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBs9rgaUnzaE1gZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BaB0BrbHza39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBngob1BoB7gsv9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgof7BrBCzafCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf0BrBYBaEnzaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQhS7d4Vfof7Z8ZevNfoDdqHldBob0BsE7zaynBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElgaMYBr87zae9fowxSVfCgr9nzsyrgrN9foD2BaM2ht29foElgobrgoR1BrZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grBHBaU1grN9fowxSVfCgr9nzsyrgrN9foDrBoZQ4eldBs9HzaM7BoM1BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE0Bs8Ygsylgs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBoR1BrbYzsbnSVfjqHldBo9Ygob1Br9lSVfjBrfHht29fofrBrBCgsfHBak9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof7BafHBsR2grm9fowxSVfCgr9nzsyrgrN9foD7gS7ASVfCgrR1BsfCBsyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobnBaU1zaM0zeldzIG9fofYgr80zaBYBeldzoRlht29fof0zsR2goE2zak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBsE7goBrBoE2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBoErgoRHBrU2SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrfCBr9rgsyHgHldzIG9fofYgr80zaBYBeldzoRlht29foBCgsMYzsB0za39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgs9HBa9CBsblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBryngsBYzaM1BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foRlBaElBsE0BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foR1zsMYBrB1BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9CBrE0go82geldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBosRpsUCfjfIG9foE7grM0gaUYgov9fowxSVf7BaRlgayCBsRlSVfjqHldzsfCBafCzafCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1BafYgsRrgre9fowxSVf7BaRlgayCBsRlSVfjqHldBsRrzs9HzaMHgpldz50HcilASVfrBs87BsBlgap9fow6kF2A4eldBr9YBr90zsBHgZldzIG9fofYgr80zaBYBeldzpld78WmykVl784UKGVHfgV/74xUGQV+78aU6giv74Z9fI7ASVfnBrUrBr9rBoN9fow6kF2AhS7ASVfrBsb7goUCgrk9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfngofHBaEngrg9fowxSVfCgr9nzsyrgrN9foD2zsyrht29foyYzsM2Bsy0BeldzIG9fofYgr80zaBYBeldzogQ4eldzsfnBaE0zak9fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBrUCBob0gaEHBpldzIG9foUlgsM7zaf2gsN9fowxSVf2gsUnBsRYgrU7SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo82Bs9ngaBlBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foblgsE1Bo90SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foDYzV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjkPvHOSHk4eldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9lgs8HBs80zZldzIG9fofYgr80zaBYBeldzoblhSHQhtfAfdBosRQFmRHespUdzdvxSVf2gryYBsE2BrbHSVfjqHldgaMHBaU1BoEHBeldzIG9foElza9rgrfrgr39fowxSVfCgr9nzsyrgrN9foDYht29fof1BabCgafrgoe9fowxSVfCgr9nzsyrgrN9foDCgS7ASVfrBayHgrBlgaRYSVfjqHldBo9Ygob1Br9lSVfjgrvQ4eldzsfCBafCzafCSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fof7BrM7Bsy1Bag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB7BrMngaUCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQfdldfCgtURkeUbQRfoDdqHldBsMnBr92Br91BpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEYgsRCBsB0zs39fowxSVfCgr9nzsyrgrN9foDrzS7ASVfCBoy1BoRnBoE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBHBsyHBsBYBZldzIG9fofYgr80zaBYBeldzoeQ4eldBoBngaRngsRrBeldzIG9fofYgr80zaBYBeldzokQ4eldBo91goM0Br90gHldzIG9fofYgr80zaBYBeldzof1ht29fof1gaMrza87BaZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1YzaUrBsBYzs90gsMYgaUnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgr90goRlzab2SVfjqHldBo9Ygob1Br9lSVfjBoZQ4eldgaRrgo8HBsE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzsM2BsBCBoECSVfjqHldBo9Ygob1Br9lSVfjBreQhS7ASVf2zsb7zaRrBaE1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaBngs9rza97SVfjqHldBo9Ygob1Br9lSVfjBoZQ4eldBsUHgrRHBr97BpldzIG9fofYgr80zaBYBeldzovQ4eldBof7grblBsEHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoB7Br87BsfnBeldzIG9fofYgr80zaBYBeldzoNQ4eldBoB7Br8nBaRCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrE1BsErzsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsM0zaErBoy0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BoMYgsb1zs8CSVfjqHldBo9Ygob1Br9lSVfjBomQhS7ASVfCgrbngoyCBaBCSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BsElBa8rBsf0SVfjcIZAcV29foE7BsyYzaB7Bsv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBsbrgaR1zsynSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4obCgsU0BafnBaECgaflgoRASVf2gr9ngrO9foDl4o97gsM0zaMHgaUlzsMCgrEASVf2gr9nzak9foDl4o9CgsU0Baf2BoU7BaU0BakQSS7ASVfCBay0BrR0BaM0SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4obCgsU0BafnBaECgaflgoRASVf2gr9ngrO9foDl4o97gaf7BaEnga9Hgo9YgabASVf2gr9nzak9foDl4o9CgsU0BaEHBoyrgsy7gIHkhS7ASVfCBablgsEHBaE1SVfjBSHQ4eldBsyngafrzafYzZldzIG9fofYgr80zaBYBeldzogQ4eldBoB0gayCBo8nSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzsR0zsE0BryHSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foE0BrUHzab1gpldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11zsR2zs87zs97gaMrBry24eldBs9Ygo9nSVfjBV1nzs9Czs92gsR1gs9lza8C4eldBs9YgoyYSVfjBV1HgryHgsU0BoyrBafYgoU0hZHQ4eldBoM1zsBHzsMlzZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV10BayCzs80gafYBsM1gr8H4eldBs9Ygo9nSVfjBV1ngoBrgrU2BoR0gs97zabASVf2gr9nzak9foDl4o8lgoyHBrUCgsRlBo9YgreQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB7gsU2ga8ngsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrM1gaR1zsyCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfYBoRYBo9nBrO9fowxSVfCgr9nzsyrgrN9fow9fINC8IfDJtNl9oH9SeldOnp6OnZC9nZ69nR6OIvp8FG0Se29fdMyXip7WZ29SVvfXSm9Seldfimpcie0WZ29SVvbOF23qZ29SVfyfivCWtywfPNC8IfQJVby95m7fPvofiv38nG795eoXrH9SeldOiZA8Sp9Seldfi3wkigD8F0oOsH9SeldXig9SeldfPvl95g9fI7ASVf0grfYgsyrzsv9fowxSVfCgr9nzsyrgrN9foD2BaNQhS7ASVfrgryYBsMHBsy2SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foDYgV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjkPvHOSHk4eldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrB1gaEnBo8YzeldzIG9fofYgr80zaBYBeldzoOQ4eldgaf2BrU2zaRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldzsM2BsBCBoECSVfjqHldBo9Ygob1Br9lSVfjBsZQhS7ASVfrzsRHgsyCgov9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gsfrgrBHBrbYSVfjqHldBo9Ygob1Br9lSVfj4seQ4eldBsRrBaf2grElSVfjqHldBo9Ygob1Br9lSVfj4seQ4eldBoM1zsBngsMrgeldzIG9fofYgr80zaBYBeldzoeQ4eldgsf1BrU7BofnSVfjqHldBo9Ygob1Br9lSVfjBYHQhS7d4VfofHvesbmeRdfjfIG9fofHBo80zsU2gre9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBsyCgr9YgrRYSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBaU7BrRHzaf1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6zaf0gob7BrBlgobCBob2BC29foEYgr8YgpldzoM6go82go9HgrR2BoM0BoR04eldBs9YgoyYSVfjBV1nBr9ngoblBo81gsEngsmQSSHQ4eldBoM0BaR2gsM2zeldzoNQhSHQ4eldBrE0zsB7BsEnBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfCgrbYgsRlBaEYSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4o9lgsy1BoBYBaUYBsbHgaBASVf2gr9ngrO9foDl4o8CgrUHBsMlBoR0grylzayASVf2gr9nzak9foDl4o8ngo8ngo81goRrgay1BsOQSS7ASVfrgoEHgr9YBrBnSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oMASVf2gr9ngrO9foDl4oMASVf2gr9nzak9foDl4oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB1BoErgabYBse9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foBngrbHgsUrzam9fowxSVf7BaRlgayCBsRlSVfjqHldBsBYgry1goE1SVfjcIZAcV29foE7Ba80goEYgaZ9fowxSVfCgr9nzsyrgrN9foDlht29foEHgabCgaRCzZldz50HcilASVf2go9nBsR1BoUrSVfjqHldBo9Ygob1Br9lSVfjSVvl95RQSe29f50HcFvp9oe9Seldfi0KcF1yc5Ql9pldht29foEngr87gaRngrN9fowxSVfCgr9nzsyrgrN9foDCht29foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDCht29fofCBsMHgsf0gHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfrgsM1zay7gayYSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oy7grMHzay0BofHBaMnBt29foEYgr8YBZldzoM6grbCBsRnzsB7grB1BsR0Bd29foEYgr8YgpldzoM6gofrgsf0gaB7BoM7BsM2gd29foEYgr81gHldzoM6goRlzsylgaECzs8lBaRCgSHkht29foyHgabnBaR0gZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rzaMrzsf2zsBYzsUCgsMH4eldBs9Ygo9nSVfjBV1rzaMrzsf2zsBYzsUCgsMH4eldBs9YgoyYSVfjBV10BoEHgoynzsEYBrM7zsbrht2xSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oE1zafrgsB2Bo9lBafYBs8ASVf2gr9ngrO9foDl4oE1zafrgsB2Bo9lBafYBs8ASVf2gr9nzak9foDl4oUHzayCBrRnBs8nzaB0gIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoB0gayCBo8nSVfjqHldBo9Ygob1Br9lSVfjzP7ASVfCgsylgsMYBo87SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foBHBay1zaU7zak9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6zaMrzsf2goB0zsE0Boy24eldBs9Ygo9nSVfjBV1nBa91gaB2goMnBobCgrfH4eldBs9YgoyYSVfjBV1nBrbCBsRYBa9Ygry0BrMYhZHQ4eldzaR7zs8lgsbHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4of1gofYgaRCBoR7BobHBrRASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQ4PG9foEYgr8YBeldzoM6BrylBrbCBsbrgrb7BoRlgt29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoyCgrECBsy2Beldz50HcilASVfrBrUrgoMnBsN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBrRlzay1gaU1gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1YzsMrzsf0zsU1zaMngr8r4eldBs9Ygo9nSVfjBV1YzsMrzsf0zsU1zaMngr8r4eldBs9YgoyYSVfjBV1YzsMrzsf0zsU1zaMngr8rhZHQ4eldzaR7zs8lgsbHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4of1gofYgaRCBoR7BobHBrRASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQ4PG9foEYgr8YBeldzoM6BrylBoM1BrUrBo8YgaUlzV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foBHBay1zaU7zak9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gr87gabYBoylBsflzaU0gd29foEYgr8YgpldzoM6zaflzs8lgrMlgsE2zsBCgV29foEYgr81gHldzoM6go9lBrb2gab0zsbnBsyHBYHkht29foyHgabnBaR0gZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1HzaBrBrBrBsB7goR2Bsy74eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lht2xSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oRrBrBrBrBnBsE7zayrgafASVf2gr9ngrO9foDl4oRrBrBrBrBnBsE7zayrgafASVf2gr9nzak9foDl4oRrBrBrBrBnBsE7zayrgavQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foBYBay7gsy0zav9fowxSVfCgr9nzsyrgrN9foD2ht29foB1BoErgabYBse9fowxSVfCgr9nzsyrgrN9foDlht29foUCBsErgrMnzaO9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldzsfnBo80ga91SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBa8lzsBCgrm9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBay0Br8HBaB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgr9rgrb0BrRHSVfjqHldBo9Ygob1Br9lSVfjSVv9fI7ASVfrgryHzayrgo9nSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCzaM1grMlgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaUlBaM0Bs8rSVfjqHldBo9Ygob1Br9lSVfjgP7ASVf2gsUngaflgsy0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBo9HBs8CgaRCSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foECgs8HBr9HBrZ9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoM6BPHkht29foBrgafHgr9ngrp9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoM6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBof1zs8Cgo8rBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foDl4o91gaB2Br90grbHBa97ga8ASVf2gr9nzak9foDl4oUYBaR1zafngoy7zsR2gr3QSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofrgablgo8CBag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBr9CgaR7grf2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrB2gs8HgrblBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBrM2Boflzag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BoB2ga92zsy2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7Brf0goMrBok9fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldgrb0zsy0gse9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof2zafYgr9Ygsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4o9CzsfHgr87BrfCBoylzayASVf2gr9ngrO9foDl4o9CzsfHgr87BrfCBoylzayASVf2gr9nzak9foDl4o9CzsfHgr87BrfCBoylza3QSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB1BoErgabYBse9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHzs91gsBrzsN9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fob1BsR7BoBnBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDCht29fofrzsU1BofngpldzIG9fofYgr80zaBYBeldzomQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9fofYzs80BrU7zag9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6za9Ygrf0BoBYBa90goflgV29foEYgr8YgpldzoM6goR2BrRlgaB1gsb7zaE1Bt29foEYgr81gHldzoM6goBnBoRYzaynzayngsbngYHkht29foB2gs82goyYzae9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBryCBsB7zs92BZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldzs9CgrR1BrbCSVfjqHldBo9Ygob1Br9lSVfjgSHQhS7d4VfofHvWsHmhUHmhmiZ58SZAkVfjf50Hcild4VfofHvWsHmhUHmhmPZoXnp6OCfjf50Hcild4VfofHvWsHmhUHmhmIvpOSg78F0bXF0IfoDdcIZAcVfAfdBoRbQWZeQaZeQvcdNNXSfdzdv6kF2AfdldfCgts7QRS7gRS7p6fEew9dM5fEmH8nAdzdv6kF2AfdldfCgts7QRS7gRS7Q6feNpOFAdzdv6kF2AfdldfCgts7QRS7gRSHvHc50wc59dzdv6kF2AfdldfCgts7QRS7gRSHgAcYkY8F2TXF0IfoDdcIZAcVfAfdBoRbQWZeQaZeQsc5Z3Xnp6OCfjf50Hcild4VfofHvWsHmhUHmhRYm3c5mwc59dzdv6kF2AfdldfCgts7QRSHmhmiZ58SZAkVfjf50Hcild4VfofHvWsHmhZeQEkFgTXF0IfoDdcIZAcVfAfdBoRbQWZeQRS7OCOFZrkie6Oip6OCfjf50Hcild4VfofHvWsHmhZeQvcdNNXSfdzdv6kF2AfdldfCgts7QRSHmhtF1yUFpCfV8ymPZoXCfjf50Hcild4VfofHvWsHmhZeQWcdNUOFZTfoDdcIZAcVfAfdBoRbQWZeQRSHvHc50wc59dzdv6kF2AfdldfCgts7QRSHmhRn2KkYk3ciGwc59dzdv6kF2AfdldfCgts7QRSHmhRn0p8FGwc59dzdv6kF2AfdldfCgts7QRSHmhRYm3c5mwc59dzdv6kF2AfdldfCgFtZgZUR2sfoDdqHldBsB1Ba9nBayCzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foB2grMrzsEYzag9fowxSVfCgsRngoy1Bam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rgsf0gaE2zaRCBrR0gr9C4eldBs9Ygo9nSVfjBV1rgsf0gaE2zaRCBrR0gr9C4eldBs9YgoyYSVfjBV10goMYzaUrgrRngo9HgrvQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofYgr80zaBYBeldzImCkFZQ4eldBrRYBryCgrErgHldzIG9fofHgs8nzaylgeldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foDl4oRlzsylBrbHBa91goR0Ba8ASVf2gr9nzak9foDl4oRlzsylBrbHBa91goR0BaOQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofYgr80zaBYBeldzImCkFZQhS7ASVf2gaBCBaEHBsBCSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2Ba8Yzay2BsMrSVfjcIZAcV29fof7goU2zaMCBak9fow6kF2A4eldBrU7BoU2BaRnSVfjcIZAcV29foBYzayYgaUYgrO9fowxSVfCgr9nzsyrgrN9foD2BoZQ4eldgaB0zs9lgrE1SVfjcIZAcPHQ4eldBsRYgrMlgaEYBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEHga82BsRYzag9fowxSVfCgr9nzsyrgrN9foDCBaUYht29foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgaflgsyYgo9rBeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsyYgrRYgs8HgHldzIG9fofYgr80zaBYBeldzoNQ4eldBoErBoUngsbngHldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foflzablgoRngs39fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6BV29foEYgr8YBZldzoM6gsy7BrErgrRlBo8YBaf1zV29foEYgr8YgpldzoM6gsy7BrErgrRlBo8YBaf1zV29foEYgr81gHldzoM6gsy7BrErgrRlBo8YBaf1zPHkht29foflzabrgab0gov9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gsf1Bry7Bo81BoyrzaU74eldBs9Ygo9nSVfjBV1HBoyrzaUCgoyCzaB1gaUASVf2gr9nzak9foDl4oRCzaB1gafnzaf1Bry7gPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrU2Ba9lzs8nzeldzIG9fofYgr80zaBYBeldzoE0BY7ASVf0grfYgsyrzsv9fowxSVfCgr9nzsyrgrN9foD1hSHQ4eldgo81gsf1BsylSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2gr9ngoe9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBs9Ygo8CSVfjqHldBo9Ygob1Br9lSVfj4sElBP7ASVf2gr9ngog9fowxSVfCgr9nzsyrgrN9foDCBaNQ4eldBsbrgaRHzsflSVfjqHldBo9Ygob1Br9lSVfjgoRlBP7ASVfrgsErBo80Bay1SVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQhS7dhU==_'
    ))

    add_to_pinned(create_preset(
        'density', 'Snappy2', -1, 'qCfof7ezm72eRHQaZeQEOFO3kF27foDdqHldBo9nBa87gs9lBpldzIG9fofYgr80zaBYBeldzoNQ4eldBrR7gaM0Bry1zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1gaUYBrE0zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8rzafYzaRrgHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezm72eRHQaZeQEkFgTXF0IfoDdqHldBsfnBsfrBrU2gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUnht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CzS7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfHht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBskQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoE7ht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsvQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoRlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldzImCkFZQhS7ASVf2grfYBsbHgrk9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDHzP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrB1Br8lBaR1BpldzIG9fofYgr80zaBYBeldzoNQ4eldgaEngrM7za9nzeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzoOQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoE0ht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhmIvpOSg78F0bXF0IfoDdqHldBoBCBoUrBsU1gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBI7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBobHgrBCgrRYzZldzIG9fofYgr80zaBYBeldzoNQ4eldBr91gsElBrRngpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBryHgoE7Bo97BZldzIG9fofYgr80zaBYBeldzoUASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzomQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzd7Yht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDGBs3Q4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQaZeQvcdNNXSfdzdvxSVfCzsfrBrEnzsBHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzo3Q4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzoOQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzoOQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBlza87gsfYBok9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foD2ht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDrzS7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBsmQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgI7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzogQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzomQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoB7ht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foD2ht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldzImCkFZQhS7ASVfrgs87zsR0BrElSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foD2BP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr8YBsBnzab1BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7gRS7p6fEew9dM5fEmH8nAdzdvxSVfCzaR2BsUngsyYSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGzP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfj4sE2ht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCBS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBCgsRlBs9rBsg9fowxSVfCgr9nzsyrgrN9foDlht29foBYgryCzafYBom9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDrht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foD2BP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjgP7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgaNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoZQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sfHht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoOQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzogQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoUCht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgsMnzaRrzaECSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzobHht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDHzP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDHzP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzokQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzokQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQaZeQWcdNUOFZTfoDdcIZAcVfAfdBoUR0PsEZsS7gRSHvHc50wc59dzdvxSVf2BayngsR7zsM2SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgsZQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgsZQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzokQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzovQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof2grRlgoyYgae9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDrht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDrgI7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBokQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgY7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDrht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDrzS7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fof7goynBsN9fowxSVfCgr9nzsyrgrN9foDlht29fo91gsb2go90gpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzof1ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foD2BP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzd72gP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfj4sEYht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhRn2KkYk3ciGwc59dzdvxSVf2gr91zaf1BrR1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsf7zsRngsB7SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDnht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBoRnBsy1gaflgZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzd72zaNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoeQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9lgoMlBoM0zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7gRSHg6OFeTXF0IfoDdqHldBsblza8HBs90gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzogQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUCht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72zS7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfHht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjgaZQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzogQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBCBo9CzsEHBaZ9fowxSVfCgr9nzsyrgrN9foDlht29foBrBsECgr91gok9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDnht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDlht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrUYgaBrgaU7SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQaZeQskie6Oip6OCfjfIG9fofCgaUYzayHgop9fowxSVfCgr9nzsyrgrN9foDlht29fofrBoyYgrU0Bre9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd7Hht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoR0zabYzaM7SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobCgoE7zaynBeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzomQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBY7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfrht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoUHht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foD2ht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDrht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0PsEZsSHmhmiZ58SZAkVfjfIG9foBlBs92Bo92gs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB2zaMCgof0gsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrgoR1gr80gsBrSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9ngsEYzsflBHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHmhmPZoXnp6OCfjfIG9foBngaMlzaflBr39fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDHzP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrylBrf2gryrBeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUnht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CzS7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfHht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBskQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoE7ht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsvQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoRlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldzImCkFZQhS7ASVf7Boy2grf7gaErSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjgI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzd72gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBspQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobrBs8ngryYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghZeQi95Zp9Ym3c5mwc59dzdvxSVf2BryYgrbnzsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaBngrblzsN9fowxSVfCgr9nzsyrgrN9foD74eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foD7ht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDlht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGgY7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfj4sE1ht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgrRHgsblgsB0SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BsM2grE1grEHSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sfCht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgNsbkBmZghZeQvcdNNXSfdzdvxSVf2BrU2Br9HBoflSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBS7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBrpQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sE7ht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDGBoOQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDrgP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBof7grU1gsB1BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzoR1ht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzoR1ht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDHzP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzoR1ht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD1ht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDnht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foDnht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgs92goR1za8HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1BrRCgrBrBog9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoElht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghZeQvcdNNXSfyvdNEkFgTfoDdqHldBoBngsf2zsErgHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzogQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoElht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foD7ht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjgS7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBoZQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CBI7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7A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zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd72gY7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoUR0PsEZsSHmhRn2KkYk3ciGwc59dzdvxSVf2grMnBsyCgrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBo8nBs87gok9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzoOQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfCzs9rBaEYgrMnSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfj4sE1BP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBsylht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf1go81zaMrgsZ9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQRSHg6OFeTXF0IfoDdqHldBoM2grEHza8YBeldzIG9fofYgr80zaBYBeldzoNQ4eldBoylBa8lgoyHgpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzoOQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfj4sEnht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBsM2BoU7zs82SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2zabYgsy1Bae9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDrht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BI7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBspQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgS7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoUHht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDrht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldzImCkFZQhSHQfdldfCgNsbkBmZghZeQskie6Oip6OCfjfIG9foElBrUngsRYBrm9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bsy2BaB0BoN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd7Hht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsE1grUCBafHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBCBa9CgsR1goZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foD7ht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBogQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CBY7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foD7gS7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpNtRHhR7ZRZEpzmHBdzdvxSVf2gr91zaUnzay7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsU7goM7gaR2gpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1gsEYBaU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBo8HgablBaB1BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgrE0BrR2grk9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBo9YBsbrgsEYzeldzIG9fofYgr80zaBYBeldzoElBP7ASVfCzay2gaf0Baf7SVfjqHldBo9Ygob1Br9lSVfjBsMlhSHQ4eldgsf1Bs80gaylSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsblBsMlgoEHgZldzIG9fofYgr80zaBYBeldzogQ4eldBoBngaRngsRrBeldzIG9fofYgr80zaBYBeldzomQhS7ASVfYBsb0grflgsv9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBry2grMHzs90SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBr91grbYgr81SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldga9HzsRYBaMlSVfjqHldBo9Ygob1Br9lSVfjBoMlhSHQhtfAfdBoUR0RtRevsZQsmZmRtR0PRHQeFemtUtfjfIG9foE7gsb7za91BsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrgoE1ga82Bog9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBoyCgsM2BrfYBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBHzsflzsyHzsN9fowxSVfCgr9nzsyrgrN9foD1hSHQ4eldBrUCBaBHBs8YgHldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foDngC29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzobl4eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCBoRlgrE0Ba8YSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaMlgsErBa87BHldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgob1zayrgZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgaf7Ba82grM2geldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjO5eA9nRASVf2zsf1Bof0goe9fow79IZp4eldBsbrgabnzs97SVfjgt29foflzsMHBsRlBs39foD24eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQSt29fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEYgoMCgoECBog9fowxSVfCgr9nzsyrgrN9foDlht29fofCgsMYBsblgok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaMHBsBlgoUrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfHBoUYBafrBrg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCzaf0Ba9HBaRrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgNspmvURpgSHgRUZmefoDdqHldBsBCgoRlBs97zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBsUlzsEHzaB2gHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs97BrMHBry0BeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9nBaBlgoBYgpldzIG9fofYgr80zaBYBeldzokQ4eldBsyYgoErgoy7BeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoE1BoBHBrUHgZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrzsEngoECgsg9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofHBsMngoEngaN9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1zab0go9rgsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBlzaEHzaU0Brp9fowxSVfCgr9nzsyrgrN9foDYht29foB2za80BrUrgrm9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBrBoRHgrfHBoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBryrgsRlzaUlSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf7BaR1BrMlBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf7Ba9Czs80goMYSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf7Bo80BrBCBsfCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf1gsfnzsB0ga39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1zayCBaM2gsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29fob7BoB1BsEYgZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fobnzsbHBoRlzeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRvtZZmeS7gRS7mpO5eH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SVfCgr9nzsyrgrN9foD0ht29foE1zsB1Bsb7Bsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrM2BaRHgaBYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgEmROespgvZbZhUHmhmiZ58SZAkVfjfIG9foE2BaM1ga82Bom9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoBHBaBCBo90BeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBo8Hzs80Bs8HBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBobrBaB1BaBHBZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafY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Br9lSVfjBYHQht29foBHgsBrBrRCBre9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUlBoUnBoy2Bsk9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foUlzaB7BsBlBrg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf0gs90Bs92gaN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQaZeQi95Zp9Ym3c5mwc59dzdvxSVfCBsUCBsUrgab1SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCgs8HzaRCBoyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCzaE0goB0gsUYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfrga8CBsM1Boy0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgoU0gaU2gs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfYgobnBaBYBpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRS7p6fEew9dfjfIG9foEYBryHBr82zsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDCBI7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fof2Brb7zs90geldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoBYgsMlgrf2BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof7BabHBab2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCgaU0grEYBrMnSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjgapQhS7ASVfrBo81gayrBrylSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzomQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfHgoy0gof1Brp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhtF1yUFpCfV8ymPZoXCfjfIG9fof2BoBYga87BsO9fowxSVfCgr9nzsyrgrN9foD74eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBsNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCgobCBs90zsb7SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjzapQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBo9rBob2BsRHzZldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzofChSHQ4eldBrMlgofYzsRHBHldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfrBof2BoB7gaMlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVf7BsBngs8lgoU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgaf0BoBlzsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRS7Q6feNpOFAdzdvxSVfCBoRCBrUrBaN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsMngo9rgop9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrb7BaE7gaMrgZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldgaf7zsR2Boy0zeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldgobngsfYBsynSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfYgsRrBsf2Bav9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhRIZ6c5p6OCfjfIG9foEYBoflBrfHzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyYBs9HBoUngeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBo8rgr8rgoBCzeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzayYBsECzsb7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf7Bsbngay2zaRYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfngaB7zs82gaZ9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fo9lBof1BsMnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQaZeQsciQYkneAXnp6OCfjfIG9fofrzsfnBrB0grN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fofHBab0gaU1Brm9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBrBHzaU2grE0gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzd71zS7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBr9rzaU1gsk9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyr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zaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foE0BoB1goMYgam9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foBCBayCgrfCga39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29foBrBaR0gr9rgag9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrRHBsMnga80BeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrylBs82Br8lgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrynBr9nBobYBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQRS7mpO5eHcPUdzdvxSVf2Bs90BaRrBsm9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29foE1Brfrga87Bs39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fof7goy1Bs97BrO9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgaBHBo9HBop9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrMYgr8lBaEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBr8CBobrgoMrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfngofYgrBlgov9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBSHQhS7d4Vfof7membZzR7pFmZQRS7mH8nGwc59dzdvxSVf2BoyHgrfYzsUCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoUHgsBlBsf0zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBrM0Bs9YBoB2gpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEngoU1BoUlzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsyHBoU1gayrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfYgaM1goM2zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fobrBa92gay0gHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHmhmIvpOSg78F0bXF0IfoDdqHldBsM7Baf2BoM1BZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsb2grB0grE0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCBaB7Br9YBoUlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfCBrE7BsUYBaB1SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1gaB0BoR0grp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfYgaUCzayHgZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQhtfAfdBomEZimR0stZOeSHmhtF1yUFpCfoDdqHldBsMnBs9YzsEHzZldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBY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ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQhS7d4Vfof7membZzR7pFmZQRS7p6fEew9dM5fEmH8nAdzdvxSVf2BsbYgaylBog9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foD1zS7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2BoM0gaU2BaM7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsy7zsB2BsU0SVfjqHldBo9Ygob1Br9lSVfjgV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgapQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoElht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBo8lza8rzsbrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBoynBoUCgrE0zeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfrgsM7zabHzsUlSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBovQhS7ASVfrzaMYgrB2zaM0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHmhsn1yRiZpXCfjfIG9foEYBa9YBo8Hgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fofCgsfHzsUrBak9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgafCBs8Ygo8rSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf7BaR1goB1goy2SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BsBrBrU1gr97SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8HgrE7grRHBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQhtfAfdBomEZimR0stZOeSHmhRIZ6c5p6OCfjfIG9foEngsUnzsRHBs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29foE1gaUHgsMCBoe9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof2zsbHgoBCgoO9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBr80BsBngofCSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf7BaMHgoMYgoUlSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BaylBrEYgrBrSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8lgaE2goR2BZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQhtfAfdBomEZimR0stZOeSHmhRn2KkYk3ciGwc59dzdvxSVf2Bay2BrfCgsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBsb0gaRHgabngpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoMngrMrgabYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfj4sy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0go91zay0Bse9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29foB1BrfYBs8CBse9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgsU7BoErBo39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foRYgoRngrEngpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHmhRn0p8FGwc59dzdvxSVf2goMnzaBHgrR1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf2zsEnBoM7gof2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCBsynzabrBrE0SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzd71zSHQht29fofngsy2za8CBaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foD2gsgQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBo92gobYBsECBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBHgrBHzsM0BpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzayngaUCgsf7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhZeQskie6Oip6OCfjfIG9foECBaUrzsMrzag9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrRnzaBCgop9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foEYBrU7goy2zaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzsMrzsB0gsy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgo80zafrgaRCSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8CgaBrBoyCBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldzsBrgrM2goyHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhSHQfdldfCgeFemtUtfjfIG9fof0zsE2gay1goe9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaUlgrBngay2SVfjqHldBo9Ygob1Br9lSVfjBsMlBS7ASVf2Ba80Br8HzaBHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs9rgsM7za9lSVfjqHldBo9Ygob1Br9lSVfjBrfHht29foEYgsylgaflzaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsEngrR1BaR1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBofHzaB0grb0gpldzIG9fofYgr80zaBYBeldzoBCgS7ASVfCBrBrBoRCgsMYSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgaMCgsEHBs97SVfjqHldBo9Ygob1Br9lSVfjgaZQ4eldBo9HzaECBoE1BHldzIG9fofYgr80zaBYBeldzoRlht29fof0goM7zaylzs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCzsbHBs82BsyYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrE2ga8rBrf2BZldzIG9fofYgr80zaBYBeldzovQ4eldBrf2Br8HgsB7BZldzIG9fofYgr80zaBYBeldzoRlht29foBCBoBYBrR1gsk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBoRlgrbrzsy1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrRYgsMYBoE0BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB1goRrgrylzaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHBaM2BaE2zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHzablgrBrzav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBoB2zs8nBsm9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7HvR7BdzdvxSVf2ga9lzsU7gr8CSVfjqHldgaMHBaU1BoEHBeldzIG9fobCBoMCBoyCBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaMCgrRHBr92SVfjqHldgaMHBaU1BoEHBeldzIG9foEHBrbYgsylgsO9fow6kF2A4eldBrEngaErBaU0SVfjcIZAcV29foBYgrBYzsbrgsZ9fowxSVfCgr9nzsyrgrN9fow9fGia78PUAgiV74xUGtaUKQV+74hUKGiM74omdkVHSVvQ4eldgoB7BrBYBrflSVfjcIZAcPHQ4eldBrE0ga87Bo9YSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldgo8CgsM2go9rSVfjqHldBo9Ygob1Br9lSVfjBsb1BY7ASVf1grblBsE1zsN9fowxSVfCgr9nzsyrgrN9foDrht29fobCgoM2zsyYSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foB7Bof0zsU2gsv9fowxSVf7BaRlgayCBsRlSVfjqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzoNQhS7ASVfnBsEYgoUrBav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf0BaR2zafYzZldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjO5eA9nRASVf2zsf1Bof0goe9fow79IZp4eldBsbrgabnzs97SVfjgryASVfCBablgsEHBaE1SVfjBV29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldzImCkFZQSt29fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEYBaRngsEnzsp9fowxSVfCgr9nzsyrgrN9foD0BPHQhS7d4Vfof7HWZbZgmR0RfoDdqHldBs91grE2BsB0gZldzIG9foUlgsM7zaf2gsN9fowxSVf2BayYBr9CBr91SVfjqHldBo9Ygob1Br9lSVfjgY7ASVfCzaM0BoUCBr82SVfjqHldBo9Ygob1Br9lSVfjBoZQ4eldBrM1gs9rBaUHgHldzIG9fofYgr80zaBYBeldzo9Cht29fobCBoMCBoyCBpldzIG9fofYgr80zaBYBeldzogQhS7ASVfCgaBlgaE1zaMrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfrgaBlgoU7BpldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoRbePmRvWZVfjfIG9foElgoBYBsBYzav9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2grRHBoErzsb1SVfjqHldBo9Ygob1Br9lSVfjBrpQ4eldBof1zafHgof2BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrgsE1gsErgre9fowxSVfCgr9nzsyrgrN9foD2ht29fofrgoUHgoRHBrN9fowxSVfCgr9nzsyrgrN9foDYht29fofYza8lzsBYzsk9fowxSVfCgr9nzsyrgrN9foDCzP7ASVfCzaUlBryngaMHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BV29foEYgr8YgpldzoM6BV29foEYgr81gHldzoM6gry7BrErgrbYzsRlgrU7gIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBr9Yzs8HBay0BZldzIG9fofYgr80zaBYBeldzofHht29foUHBr8ngsE2geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foblBsErBof2BpldzIG9fofYgr80zaBYBeldzoB2hSHQ4eldBsb0gayHBrM2zeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsMrgoRYBryYgeldzIG9fofYgr80zaBYBeldzofHht29foE7gs9HgsBYgav9fowxSVfCgr9nzsyrgrN9foDCht29fofCga90BaE2gsg9fowxSVfCgr9nzsyrgrN9foDlht29fofrgaBngaECgoN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgaBngoMHBog9fowxSVfCgr9nzsyrgrN9foDlht29foB2zaE2BrbCzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaElzsy2Brf1zZldzIG9fofYgr80zaBYBeldzoNQ4eldgaflgrR0zabnBpldzIG9fofYgr80zaBYBeldzof7hSHQ4eldBo90go81BoMrBpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsE2BaMnBrECzZldz50HcilASVf2gaE1gryrgaECSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foE0BrUHzab1gpldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV10BoR7zsMCgoM2BoUCBa8H4eldBs9Ygo9nSVfjBV1YgaRlzsylgsU7BablBo924eldBs9YgoyYSVfjBV1YBoR7zsMCBsf7gaM7zsMYhZHQ4eldBoM1zsBHzsMlzZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV10BoR7zsMCgoM2BoUCBa8H4eldBs9Ygo9nSVfjBV1YgaUCgaM2goUYgs8YgrU04eldBs9YgoyYSVfjBV1YBoR7zsM2gsf1BrR1gaOQSSHQ4eldBoM0BaR2gsM2zeldzoeQht29foE1goUCBryCgrp9fowxSVfCgr9nzsyrgrN9foDrht29fofrzsU1BofngpldzIG9fofYgr80zaBYBeldzogQ4eldBobHzsb2zsB1gZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVf2zsB7gsy0zaO9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6zabHBsbngabYgaUlBrB1Bt29foEYgr8YgpldzoM6gobYBobYBsRHzaRYBaynBd29foEYgr81gHldzoM6gs91gsR7zsf1BrMCgr87zSHkht29foflzabrgsblBap9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6zsM1BobnzsUCgrElza9ngt29foEYgr8YgpldzoM6go8rBr97BsfHzsRYgay04eldBs9YgoyYSVfjBV1nBa81gsB7BoRHBafYgr92hZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgaR7BsUngoRHSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfrgrM1gaR1zsyCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfYBoRYBo9nBrO9fowxSVfCgr9nzsyrgrN9fow9fINCWZ29SVvoXip68Z29SVfytip7WZ29SVvDXSm9Seldfimpcie0WZ29SVvbOF23qZ29SVfyfivCWtywfPNC8IfQJVby95m7fPvofiv38nG795eoXrH9SeldOiZA8Sp9Seldfi3wkigD8F0oOsH9SeldXig9SeldSVvQ4eldzs9CgrR1BrbCSVfjqHldBo9Ygob1Br9lSVfjBsMlhSHQ4eldBr91grElgsE1BZldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjO5eA9nRASVf2zsf1Bof0goe9fow79IZp4eldBsbrgabnzs97SVfjgrUASVfCBablgsEHBaE1SVfjBV29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldzImCkFZQSt29fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBrzaU2gofngr39fowxSVfCgr9nzsyrgrN9foDnht29foUCBsB7BsyHgHldzIG9fofYgr80zaBYBeldzoylht29foblBsErBof2BpldzIG9fofYgr80zaBYBeldzoEHhSHQ4eldBrbHgsR1Bo8CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsRCBr9rgsB0gHldzIG9fofYgr80zaBYBeldzd72ht29foEHBrMCBs92BeldzIG9fofYgr80zaBYBeldzd72ht29foflzabrgoRlBrm9fowxSVfCgr9nzsyrgrN9foD2ht29foRCzaB7gafCgpldzIG9fofYgr80zaBYBeldzogQhSHQfdldfCgtmR0EmZfdzdvxSVfCgsfnzsb7Bs92SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoE1Bo9Ygr9HgHldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBryCBsB7zs92BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrM7gaBHgsyCzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oyCzs80gaBrBa80Bof0BsBASVf2gr9ngrO9foDl4o8nBs8Ygs9HBsflzsfHzt29foEYgr81gHldzoM6goBYgo80BafnzaR2goR7hZHQht29foflzsMHBsRlBs39foDlhSHQht29foB2zsbrgaE2goN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2za9Ygs9HgoRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBo90grRHBaM2gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1YBaR1zafrgrM7grE0gsUr4eldBs9Ygo9nSVfjBV1nBo97gsElBafHzs91Bay14eldBs9YgoyYSVfjBV1ngo8ngo8nza8HBrU1zaEnhZHQ4eldBr82gs9YgrBrgpldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrgo90gsR7Bry7SVfjqHldgaMHBaU1BoEHBeldzIG9foErgr91za82zeldz50HcilASVf2gaMnzs82grUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsU0BoUHBop9fow6kF2A4eldBs8YgoEHzaf7BHldzIG9fofYgr80zaBYBeldzpld9PvpWZ29SVv6kFHdOSf2Se29fdN6cnH6fi0K9Pv9fI7ASVf2go9ngaUHgo9lSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2za9Ygs9HgoRYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBoElgsRCzsk9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBrRlzay1gaU1gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV11ga9lgsy1zsfCgsMlgoEASVf2gr9ngre9foDl4o90BoEHgobrga9rzaEHzsfASVf2gr9ngrO9foDl4o8CBrRCzsUrgaflgaElBs8ASVf2gr9nzak9foDl4o8HBab1BaU2BobnBaMHBoZQSS7ASVf1gsU0goMHzsZ9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BrylBrbCBsbrgrb7BoRlgt29foEYgr8YgpldzoM6BrylBrbCBsbrgrb7BoRlgt29foEYgr81gHldzoM6zsf2gs81gob2grBlgab0BY7AqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV12zayCBrRrBsfYBaMCgrEn4eldBs9Ygo9nSVfjBV12zayCBrRrBsfYBaMCgrEn4eldBs9YgoyYSVfjBV17gsy1BoBHgoEngoyrzsOQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofrzsU1BofngpldzIG9fofYgr80zaBYBeldzo3Q4eldBoR1BaRlgrfngeldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfrgsM1zay7gayYSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oylBrbCBs8rzsb2zsf1Bt29foEYgr8YgpldzoM6goMYzaUrBs8lgof0Bo9Cgt29foEYgr81gHldzoM6goB0BoEHgrMYgr91zsBlgYHkht29foyHgabnBaR0gZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1Cza8CgrUHBofHgaf0gsBH4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lht2xSVf2gr9ngrN9foDl4oB1BaB0BoE0Br90gafHBaRASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fof1Bo92BoE1BsN9fow6kF2A4eldBrB7Br8lgoElSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foBHBay1zaU7zak9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6grblBrbCzsb7zaylgo9nBC29foEYgr8YgpldzoM6grblBrbCzsb7zaylgo9nBC29foEYgr81gHldzoM6grblBrbCzsb7zaylgo9nBYHkht29foyHgabnBaR0gZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1Cza8CgrUHBofHgaf0gsBH4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lht2xSVf2gr9ngrN9foDl4oB1BaflzaB7BrfngrU7BayASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfrgsM1zay7gayYSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4o9ngaU0grf1BaECBay7zs8ASVf2gr9ngrO9foDl4oyCBabnBa9lBaR2BsbrBoUASVf2gr9nzak9foDl4o8YBaB0BsU0zsb0goE1gsgQSS7ASVf1gsU0goMHzsZ9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6gsyrBrBrBrErga8HBsE1gV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BP7AqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1HBrBrBrBrgoE2gay1BrUC4eldBs9Ygo9nSVfjBV1HBrBrBrBrgoE2gay1BrUC4eldBs9YgoyYSVfjBV1HBrBrBrBrgoE2gay1BrUChZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgrM1gaR1zsyCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BoE2Br9lgoynSVfjqHldBo9Ygob1Br9lSVfjBsMlht29fobCgofnzsUYzeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgrMnBabrBo97SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoM1zsBngsMrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBr9YBr90zsBHgZldzIG9fofYgr80zaBYBeldzpldSVvQ4eldBr91gsy1Br8YgpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7Boylza9lBa9nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM7BaMlzsEnBHldzIG9fofYgr80zaBYBeldzomQ4eldBsR7goUCBaR1zZldzIG9fofYgr80zaBYBeldzoNQ4eldBofYgsEnBoUHBpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVf2BoRngsBYgsBHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foDl4oNQSS7ASVfrBrUCgs9Ygo90SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foDl4oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofCzabnBo8nBrg9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9YgoyYSVfjBV17grMHzayCgo81gabHBs91hZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrU0Ba8nBoMrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBYBoUHga9CBZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foBrBsRngs90Bav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrBlBsfCBayrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgafrBsUYBsb1BZldzIG9fofYgr80zaBYBeldzovQ4eldgaBCzs8lBrfYSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29fo90zsb1zsR2SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVfCBsyCgr9YgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92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SVfjqHldBsMngry1BsElBHldz50HcilASVfCga87BsylBoMYSVfjcIZAcV29foB7gaf7BsMHgpldz50HcilASVfrgry1grU7gr9nSVfjqHldBo9Ygob1Br9lSVfjBsfHht29foUrzsbYBa92zeldz50Hci2Qht29foEHgr9lBaU2gre9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gsUnBsEHgryrSVfjqHldBo9Ygob1Br9lSVfjBoM7gY7ASVf2za9Ygs9HgoRYSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBaR1gr8YBrN9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDlht29fof2Brf7goR0gok9fowxSVfCgr9nzsyrgrN9foD2ht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfCBay0Ba8HgoR1SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oMASVf2gr9ngre9foDl4oR1gaB2Br9HBafngrMCzayASVf2gr9ngrO9foDl4oR1gaB2Br9HBafngrMCzayASVf2gr9nzak9foDl4oR1gaB2Br9HBafngrMCza3QSS7ASVfCBay0BrU0zs8CSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oRCzaB1gafnzaf1Bry7gV29foEYgr8YgpldzoM6gsf1Bry7Bo81BoyrzaU74eldBs9YgoyYSVfjBV1HBoyrzaUCgoyCzaB1gamQSSHQ4eldBoM0BaR2gsM2zeldzoeQht29foB7BsMYBabngo39fowxSVfCgr9nzsyrgrN9foD2zsgQ4eldzs9CgrR1BrbCSVfjqHldBo9Ygob1Br9lSVfjzPHQht29fo8nzaRCzaE1BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBs9Ygo82SVfjqHldBo9Ygob1Br9lSVfj4sECBP7ASVf2gr9ngov9fowxSVfCgr9nzsyrgrN9foDlht29foEYgr8nBHldzIG9fofYgr80zaBYBeldzoRlht29foE0BrUHgsbCBeldzIG9fofYgr80zaBYBeldzo8HBaNQ4eldBrR2BrfnzsM1zeldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtvQ_'
    ))

    add_to_pinned(create_preset(
        'density', 'Aggresive', -1, 'qCfof7ezm72eRHQaZeQEOFO3kF27foDdqHldBo9nBa87gs9lBpldzIG9fofYgr80zaBYBeldzoNQ4eldBrR7gaM0Bry1zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1gaUYBrE0zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfnBryCgryHBrk9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgNsbkBmZghUHmhmPZoXnp6OCfjfIG9foECgoECBrB7Bsk9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDHht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDrgY7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBreQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjzS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foEYBo92zsRYgHldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBryrgoMlgsyCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bs8YBaU1gr81SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjgI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfj4sEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2zS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoUR0PsEZsS7gRS7OCOFZrkie6Oip6OCfjfIG9fofrBof7BrE7zaO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDCzS7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sfCht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfCzsRYBrfYgs90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgryHBsMrgs8nSVfjqHldBo9Ygob1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gr9nzsyrgrN9foDGgI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBsNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd72gY7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr8YBsBnzab1BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7gRS7p6fEew9dM5fEmH8nAdzdvxSVfCzaR2BsUngsyYSVfjqHldBo9Ygob1Br9lSVfjzt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzd72BY7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBoZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoE2ht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foD2ht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDGBsgQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBCgsRlBs9rBsg9fowxSVfCgr9nzsyrgrN9foDlht29foBYgryCzafYBom9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foD7ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foD0ht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foD7ht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDYht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BI7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjgS7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBoNQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzogQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoOQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzomQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzoZQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzoZQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfHBa81gsB1Bsv9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foD7gP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjzP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzovQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzoE2ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhsn1yRiZpXCfjf50Hcild4Vfof7ezm72eRHQaZeQtkF06XF0IfoDdqHldBsM1goRHgablBZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBs9HBa81grU2SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBrkQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sBCht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfCga81goElSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzaR0Bs8YzsO9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDCzP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzd72gP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfj4sEYht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhRn2KkYk3ciGwc59dzdvxSVf2gr91zaf1BrR1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsf7zsRngsB7SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDnht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBoRnBsy1gaflgZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzd72zaNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoeQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9lgoMlBoM0zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7gRSHg6OFeTXF0IfoDdqHldBsblza8HBs90gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzokQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzomQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72zS7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrfCgrf0BsRlgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2BsfYgryngHldzIG9fofYgr80zaBYBeldzobASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoElht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDYht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foD1ht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfj4smQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB7grUrBrU7geldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhRYm3c5mwc59dzdvxSVfCBoU7gry1gs80SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrf1gr97zsB2SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoeQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBngsb1zs91Bam9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBsgQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobCgoE7zaynBeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUHht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBogQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8Y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grb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foBngsyYgobHBrg9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDlht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgr8HBs90BoMrSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghZeQEkFgTXF0IfoDdqHldBr87BaM1BoMrzeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzaMrBoEYzaBlSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjgS7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBrkQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sB2ht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzomQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzopQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoeQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzogQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7Boy2grf7gaErSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjgI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfj4sEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2zS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsB2go8Yzak9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQRS7OCOFZrkie6Oip6OCfjfIG9foErza9Yzs80zam9fowxSVfCgr9nzsyrgrN9foDlht29fof7Br8YzsM0BeldzIG9fofYgr80zaBYBeldzoUASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzomQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzd7Yht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDGBs3Q4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgsRHzsMHBrp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BaEYBsyYBsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDCzS7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sfCht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgNsbkBmZghZeQvcdNNXSfdzdvxSVf2BrU2Br9HBoflSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBY7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDnht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDrht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDrht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBof7grU1gsB1BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDnht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foDnht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgs92goR1za8HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1BrRCgrBrBog9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDGgI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBsNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd72gY7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoUR0PsEZsSHmhtF1yUFpCfV8ymPZoXCfjfIG9fofrgoRCBsb2Brk9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foD7ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foD0ht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foD7ht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDYht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BI7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjgS7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBoNQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzogQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoOQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzomQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzoZQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzoZQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBaMlBsEHBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzafYzab2BoEYSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgamQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzo3Q4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzoE2ht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDCht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD2BS7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBry0zabrBaB0BpldzIG9fofYgr80zaBYBeldzobASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzof1ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDGBsgQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzofHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2BS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfj4sErht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghZeQWcdNUOFZTfoDdcIZAcVfAfdBoUR0PsEZsSHmhRIZ6c5p6OCfjfIG9foElBa9lBaf2Bse9fowxSVfCgr9nzsyrgrN9foDlht29fofHzabHBaMngpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BoflzaR1gs39fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDrgY7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBrvQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7A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ht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDnht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBobYBrM2gr9lgpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzd72zaNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoeQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldza8nzaylBrRHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghZeQsc5Z3Xnp6OCfjfIG9foflBs92gsyngrN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaMnBa81gsO9fowxSVfCgr9nzsyrgrN9foD04eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foD2BP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjzP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfj4sEnht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoeQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd77ht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBsM2BoU7zs82SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2zabYgsy1Bae9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDYht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foD7ht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBspQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezm72eRHQRSHg78F0bXF0IfoDdqHldBsMrga8Hgs9rgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsy2zaElBrbCBeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfj4sfCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foD2ht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsE1grUCBafHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzoErht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBoMYBoRHza8HSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgaZQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBY7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDrht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foEYgry1ga81zam9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gaUnBaU7gsEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gayHBs9lgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoR7zsMlBrylSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo9YBsbrgsEYgHldzIG9fofYgr80zaBYBeldzoElBP7ASVfCgr92zsBHBs91SVfjqHldBo9Ygob1Br9lSVfjBsMlht29fof1zaE7BoblBom9fowxSVfCgr9nzsyrgrN9foD2BaNQhS7ASVfHBoy2gob7zaN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2zsM2BaMnBsRHSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCBr87gs8HgsBlSVfjqHldBo9Ygob1Br9lSVfjgPHQht29fo92zsbYBoMHBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fofrzaEYBaR0grp9fowxSVfCgr9nzsyrgrN9foDrht29foBrgryYzs9Ygo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7grR0gs9lBaN9fowxSVfCgr9nzsyrgrN9foDCBaNQhSHQfdldfCgNspmvURpgSHgeZemvsbksS7Z8ZevNfoDdqHldBsUHzsU1gry2gZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBnBsy7goECBHldzIG9fofYgr80zaBYBeldzogQhS7ASVfCzafHBaErBo92SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foD74eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow79IZphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrgsbCBab1gsblSVfjqHldBo9Ygob1Br9lSVfjzPHQht29foB7BoMrgsEngrk9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1BpldzoMASVf2zsf1Bof0goe9foD24eldBsbrgabnzs97SVfjgo9ASVfCBablgsEHBaE1SVfjBV29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldzImCkFZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzobl4eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow79IZphZ7ASVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofCgsMYBsblgok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaMHBsBlgoUrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsRnzsy1zaBHSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf7BoUlgoEYBaE7SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foDH4eldBoM0BaR2gsM2zeldzoEASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9nBafnBsfCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBofHBa92zsMngHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUlBaR2BrMngag9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRCga9lBoBrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fof1BoblgrRlgsg9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BrfngsM2grU0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaM0BsR1BrEYSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2grUrBaRrzablSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gr8lBrMnBr9nSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2za9nBsBnzaUlSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsyCBrRrgaRHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoB0Bs8nBsfHBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoR2Ba8nBs87BeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoy1zsbngrBHgpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrM1BsR1gabrzZldzIG9fofYgr80zaBYBeldzokQ4eldBrE1gobrgaBYgeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrBCgsRYBoRCgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaBHgsM1gaN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUlgsyrBaMrzae9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUlgrf0gobnBak9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUCgobrBrf2Bov9fowxSVfCgr9nzsyrgrN9fow79IZpht29foyHBo80Brb7zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy1zaflBaEH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SVf7BaRlgayCBsRlSVfjqHldBsMlga80BofYBpldzIG9fofYgr80zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpVRpZRmZQRS7mpO5eHcPUdzdvxSVfrBs8nzaUCBrMlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMlga80BofYBpldzIG9fofYgr80zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpVRpZRmZQRS7mH8nGwc59dzdvxSVfrgry0grbYBsylSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMlga80BofYBpldzIG9fofYgr80zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpVRpZRmZQRS7OCOFZrkie6Oip6OCfjf50Hcild4Vfof7ezZEpVRpZRmZQRS7p6fEew9dfjfIG9foEYBrE7BoM2BaO9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaM7gobCBo9CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Bab0Boy7goblSVfjqHldBo9Ygob1Br9lSVfjzS7ASVf2zabrzaE0gaEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBlBsMHgsUrgHldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0RtRvtZZmeSHmhtF1yUFpCfV8ymPZoXCfjfIG9foBCzsMlgo9Czak9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaM7gobCBo9CSVfjqHldBo9Ygob1Br9lSVfjBS7ASVf2Bab0Boy7goblSVfjqHldBo9Ygob1Br9lSVfjBrNQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpVRpZRmZQRS7Q6feNpOFAdzdv6kF2AfdldfCgNspmvUpvZZEZhZeQtkF06XF0IfoDdqHldgaM1go8HBoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMlga80BofYBpldzIG9fofYgr80zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpVRpZRmZQRSHgAcYkY8F2TXF0IfoDdqHldBsR7ga97go90BHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBaUnzsfCgrv9fowxSVfCgr9nzsyrgrN9foDlht29foElzsbCzaUnzsN9fowxSVfCgr9nzsyrgrN9foD0ht29foE1zsB1Bsb7Bsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrM2BaRHgaBYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgNspmvUpvZZEZhZeQsc5Z3Xnp6OCfjfIG9foBYga81gr9rgse9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaM7gobCBo9CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Bab0Boy7goblSVfjqHldBo9Ygob1Br9lSVfjzS7ASVf2zabrzaE0gaEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBlBsMHgsUrgHldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0RtRvtZZmeSHmhRYm3c5mwc59dzdvxSVfCgr87Br97gaEHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMlga80BofYBpldzIG9fofYgr80zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7membZzR7pFmZQaZeQEOFO3kF27foDdqHldBsElBay7goECgeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrRlBrfCgrblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfCgoR0gob2goRrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCzsBlBrylBrR2SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBrU0gofCgoN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB7BaEngrBCBrk9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foB7goM7gsy2gsg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhmPZoXnp6OCfjfIG9foEYBoB1BaElBam9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBobYBrfYgr8YBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBrf1Bo87goRrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBrRHBrBrgsfrBZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgaMCga8CzaE2gHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldgaM1BrU2BrMrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobHgrb2grE7BeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRS7OCOFZrkie6Oip6OCfjfIG9fof2gaf2gaB7zs39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fofHgoR1gsfCzav9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fof1BsbnBrbHgak9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foB7gof2BayCzap9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9ngab7gaEHzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo9nzs8lBr9CSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhtF1yUFpCfoDdqHldBs9rzaRrgoE0gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzofCht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBoErzsU0grb7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBr9HBaMYBoErSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfj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Bo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BobCBrM0zsb0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhsn1yRiZpXCfjfIG9fofCgsfrgaBlBeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBo80Ba8ngrBnzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsUlBsU7BaBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf7BoU0gsECzab1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfnzs8HBo92zaO9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fo9HgsB2BoElBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQaZeQtkF06XF0IfoDdqHldBs9CBoMrBoR0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2za92grRCga87SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoBY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gob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBrgrB1gayHgHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgr82gsMHzZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldgry1gafYgrErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVf1go92goBYzs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhRn0p8FGwc59dzdvxSVfCBrynBaMrBrN9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfj4sy0hSHQ4eldBoRYBsRrgrf0gHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBoblgoBnBr81BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoEHBY7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf7Bsblgr9HBsy7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVf7Boy1gaylBo90SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU1zsE7zsf7gHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgsR2Bob1goECSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRSHg78F0bXF0IfoDdqHldBsR1zsMrgaBnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBsbCBrynBa97geldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBrflzafYBof7zeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBrBlgsbYgrB7BHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgsR2Ba87goblSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzaM2goErgoMYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza8rgr8Czs9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHmhmiZ58SZAkVfjfIG9foE2grblgsB2geldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBsyrBoB7goU2zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBoUnzay2grUrgpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoR7BrRCgrRCzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBa9YgoMlBsk9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBr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fofYgr80zaBYBeldzogQhSHQfdldfCgEmROespgvZbZhZeQvcdNNXSfdzdvxSVf2Ba82gr90BsR0SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjgapQhS7ASVf2gsM1za9YgsRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVf2goRHgsB0BoflSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsb0gr87BrbCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foD7ht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBoBnBsMCBaUHzeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1gs9rgaM2gsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo9YzsbCgrEnzeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzofCht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQhtfAfdBomEZimR0stZOeSHmhtF1yUFpCfV8ymPZoXCfjfIG9foE2zs97zaMCBHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foECBab7gaElBam9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof2zaU0BrE2gap9fowxSVfCgr9nzsyrgrN9foD74eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBsNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCgoM1goB0zsBrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCza8CgafYBsb1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foBHBaU1zsR0gaN9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDCBIHQht29foB1Ba9YBrE1Bap9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhZeQWcdNUOFZTfoDdqHldBs9lgr9CgoRHzZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBofHBoR0gaBlgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB7Bof2go9ngog9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foUlgsynBrynzae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BrBrgayYgrm9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgoRYBsUYgsRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhSHQfdldfCgEmROespgvZbZhZeQtkF06XF0IfoDdqHldBs8Hga80gsR2zeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBsy7gaRHBafCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoE0zsRnBrfngpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBrgob2Br8nBov9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foUlBaRnBa9ngaN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUlzaMrBs9YBrg9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgoM7BsEngsE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhSHQfdldfCgEmROespgvZbZhZeQsciQYkneAXnp6OCfjfIG9foElzaErBofHgZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf2zsb7gsR7zs8nSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnBa8YBaB7zsk9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDGzapQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBobngry1zab2BZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBryrBo92gof2BZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foRHgaUCBsBCzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldgs9n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SVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrRYBrR0BabCSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1za87gafHBom9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQRSHg78F0bXF0IfoDdqHldBsflgaB0BaB1BHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs8Ygs81BrfnzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBs9rgaUnzaE1gZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BaB0BrbHza39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBngob1BoB7gsv9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgof7BrBCzafCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf0BrBYBaEnzaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQhS7d4Vfof7Z8ZevNfoDdqHldBob0BsE7zaynBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElgaMYBr87zae9fowxSVfCgr9nzsyrgrN9foD2BaM2ht29foElgobrgoR1BrZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grBHBaU1grN9fowxSVfCgr9nzsyrgrN9foDrBoZQ4eldBs9HzaM7BoM1BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE0Bs8Ygsylgs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBoR1BrbYzsbnSVfjqHldBo9Ygob1Br9lSVfjBrfHht29fofrBrBCgsfHBak9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof7BafHBsR2grm9fowxSVfCgr9nzsyrgrN9foD7gS7ASVfCgrR1BsfCBsyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobnBaU1zaM0zeldzIG9fofYgr80zaBYBeldzoRlht29fof0zsR2goE2zak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBsE7goBrBoE2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBoErgoRHBrU2SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrfCBr9rgsyHgHldzIG9fofYgr80zaBYBeldzoRlht29foBCgsMYzsB0za39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgs9HBa9CBsblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBryngsBYzaM1BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foRlBaElBsE0BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foR1zsMYBrB1BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9CBrE0go82geldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBosRpsUCfjfIG9foE7grM0gaUYgov9fowxSVf7BaRlgayCBsRlSVfjqHldzsfCBafCzafCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1BafYgsRrgre9fowxSVf7BaRlgayCBsRlSVfjqHldBsRrzs9HzaMHgpldz50HcilASVfrBs87BsBlgap9fow6kF2A4eldBr9YBr90zsBHgZldzIG9fofYgr80zaBYBeldzpld78WmykVl784UKGVHfgV/74xUGQV+78aU6giv74Z9fI7ASVfnBrUrBr9rBoN9fow6kF2AhS7ASVfrBsb7goUCgrk9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfngofHBaEngrg9fowxSVfCgr9nzsyrgrN9foD2zsyrht29foyYzsM2Bsy0BeldzIG9fofYgr80zaBYBeldzogQ4eldzsfnBaE0zak9fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBrUCBob0gaEHBpldzIG9foUlgsM7zaf2gsN9fowxSVf2gsUnBsRYgrU7SVfjqHldBo9Ygob1Br9lSVfjBYHQht29fo82Bs9ngaBlBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foblgsE1Bo90SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foDYzV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjkPvHOSHk4eldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9lgs8HBs80zZldzIG9fofYgr80zaBYBeldzoylhSHQhtfAfdBosRQFmRHespUdzdvxSVf2gryYBsE2BrbHSVfjqHldgaMHBaU1BoEHBeldzIG9foElza9rgrfrgr39fowxSVfCgr9nzsyrgrN9foDYht29fof1BabCgafrgoe9fowxSVfCgr9nzsyrgrN9foDCgS7ASVfrBayHgrBlgaRYSVfjqHldBo9Ygob1Br9lSVfjgrvQ4eldzsfCBafCzafCSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fof7BrM7Bsy1Bag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB7BrMngaUCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQfdldfCgtURkeUbQRfoDdqHldBsMnBr92Br91BpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEYgsRCBsB0zs39fowxSVfCgr9nzsyrgrN9foDrzS7ASVfCBoy1BoRnBoE2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR2zaR2Br92SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCBr87gs8HgsBlSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfCgrynBabrgrbYSVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldBoy7BaB1goUlgZldzIG9fofYgr80zaBYBeldzoflht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oMASVf2gr9ngrO9foDl4oMASVf2gr9nzak9foDl4o91gaB2Br90grbHBa97gaOQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foBYgrbngsM1zse9fowxSVfCgr9nzsyrgrN9foDCgS7ASVf7gsBngoR2Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf0BaE2BrfCBsv9fowxSVfCgr9nzsyrgrN9foDrBSHQht29foE0zsU1gsBlBs39fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElBr8HgrB1grm9fowxSVfCgr9nzsyrgrN9foDCgP7ASVf2gaRYgsRrgrUCSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCBoUYzsM2BsRrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUrgoU2Bo8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUrgo8lgsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsy2BsB0Bop9fowxSVfCgr9nzsyrgrN9foDlht29foU2Bab1BsBCzap9fowxSVfCgr9nzsyrgrN9foDlht29foUCBa9Hzsy0gov9fowxSVfCgr9nzsyrgrN9foDCgPHQht29fofYzs8nzaflBrv9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foE2BsMlgoB2Bop9fow6kF2A4eldBsU2za91BrU2BpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVf2zsB7gsy0zaO9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6zab7BsEYgrECzs97gsU1BC29foEYgr8YgpldzoM6gry1BoBHBr8nBrU7gaR2zt29foEYgr81gHldzoM6goR1zafrgsU0grUYga8YhZHQ4eldBoM1zsBHzsMlzZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1ngsy1BoBHgabYga97go9ASVf2gr9ngrO9foDl4o8HzayCBrR7zs97grUngC29foEYgr81gHldzoM6zablBsbnBsU7gsylzaU2BSHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBsyngafrzafYzZldzIG9fofYgr80zaBYBeldzogQ4eldBoB0gayCBo8nSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzsR0zsE0BryHSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foE0BrUHzab1gpldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rgrfHgablBo9CBaUHBsBHgt29foEYgr8YgpldzoM6grMHzayCBr9lga92zsR7BC29foEYgr81gHldzoM6gab1BaB0BoUHgoMHga81grZQSS7ASVfCBay0BrR0BaM0SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8rzsf2gs9lgr9YzabrBa9ASVf2gr9nzak9foDl4oR2gr87grM1grRYgaMlgseQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB7gsU2ga8ngsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrM1gaR1zsyCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYBoRYBo9nBrO9fowxSVfCgr9nzsyrgrN9fow9fINC8IfQJVp9fI7ASVf0grfYgsyrzsv9fowxSVfCgr9nzsyrgrN9foD1BPHQht29foBYza92BaR2zae9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo974eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow79IZphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBry7Bs8Cgo91SVfjqHldBo9Ygob1Br9lSVfjgI7ASVf7BoErgaE1gsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf0BaE2BrfCBsv9fowxSVfCgr9nzsyrgrN9foD2gSHQht29foB0gsRHzafnBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEHBoBYBrRrzsk9fowxSVfCgr9nzsyrgrN9foDGBS7ASVf2gsBlBoEYBsN9fowxSVfCgr9nzsyrgrN9foDGBS7ASVfCBay0Br8HBaB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBoyrgaUCBoO9fowxSVfCgr9nzsyrgrN9foDrhSHQhtfAfdBoRbZzmEZtfoDdqHldBoRCgob0gaEYBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fof2zafYgr9Ygsk9fowxSVfCgr9nzsyrgrN9foD2ht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB1BoErgabYBse9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foBlgaUrgsR1Bo39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9YgoyYSVfjBV17grMHzayCgo81gabHBs91hZHQht29foflzsMHBsRlBs39foDChSHQht29foB2zsbrgaE2goN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2za9Ygs9HgoRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBo90grRHBaM2gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1YBaR1zafrgrM7grE0gsUr4eldBs9Ygo9nSVfjBV1nBo97gsElBafHzs91Bay14eldBs9YgoyYSVfjBV1ngo8ngo8nza8HBrU1zaEnhZHQ4eldBr82gs9YgrBrgpldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrgo90gsR7Bry7SVfjqHldgaMHBaU1BoEHBeldzIG9foErgr91za82zeldz50HcilASVf2gaMnzs82grUHSVfjqHldBo9Ygob1Br9lSVfjBS7ASVf2gsU0BoUHBop9fow6kF2A4eldBs8YgoEHzaf7BHldzIG9fofYgr80zaBYBeldzpld9PvpWZ29SVvPtR0PmZvsmR0smt0sFZgRmRHsfeGiRbZNtHpkSe29fdMyc5Ql9dN6cnH6SVvQ4eldBs8YgoU7gs8YBeldzIG9fofYgr80zaBYBeldzovQ4eldBsyYgrRYgs8HgHldzIG9fofYgr80zaBYBeldzovQ4eldBof2BaRHBobYSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foBHBay1zaU7zak9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6zaUYBaR1zabCBoRlBa824eldBs9Ygo92SVfjBV1Yzsf2gs80BrUYBry2gsbC4eldBs9Ygo9nSVfjBV1nBoBHBob7BrUCBaU2BaEn4eldBs9YgoyYSVfjBV1ngsM0zaM7Bsf0goMlgsfHhZHQ4eldzaR7zs8lgsbHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oB1BaB0BoE0Br90gafHBaRASVf2gr9ngrO9foDl4oB1BaB0BoE0Br90gafHBaRASVf2gr9nzak9foDl4obCBsRnza80Bs9rBaU0zsgQ4PG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6Bsy1BoBHBrECgrMlBo92gd29foEYgr8YgpldzoM6Bsy1BoBHBrECgrMlBo92gd29foEYgr81gHldzoM6gaR1zafrgs82go81BrbnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrb7zafCgoO9fowxSVfCgr9nzsyrgrN9foD1ht29fofHzaMHBa9Cgom9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBrRlzay1gaU1gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1Hgo9nzaRnBaUlzsR7gsbASVf2gr9ngrO9foDl4oRngr81gs8lgaM0gsUHzt29foEYgr81gHldzoM6gs8YgoyHgoM7BabHgaR0hZHQ4eldzaR7zs8lgsbHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQ4PG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gsM2zs8lzaErzsb0Bs9n4eldBs9Ygo9nSVfjBV1HBaE0goM1BsB0zsb2gr8ASVf2gr9nzak9foDl4oRlBsbnBay2Brb0zsEYgIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoyCgrECBsy2Beldz50HcilASVfrBrUrgoMnBsN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBrRlzay1gaU1gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV10zafHBrfYBrbnBrbCzafC4eldBs9Ygo9nSVfjBV1nzaf2zsRCga8CBsbnBrRASVf2gr9nzak9foDl4o80BsR1BaEYgoBHBrUHgaOQSS7ASVf1gsU0goMHzsZ9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6goE2BrRrgobHBrbCgoM1gd29foEYgr8YgpldzoM6gaUlgabHBaE7Bsblgo9rzaBASVf2gr9nzak9foDl4oU7gsyrgaBnzaUngrBrBabrht2xSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoeQht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfrgsM1zay7gayYSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foDl4oy7za9HBoB2zsy2Bo9Yga9ASVf2gr9nzak9foDl4o9rgrb0BsfYBrUlBrEngrkQSS7ASVf1gsU0goMHzsZ9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6gsyrBrBrBrErga8HBsE1gV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BP7AqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1HBrBrBrBrgoE2gay1BrUC4eldBs9Ygo9nSVfjBV1HBrBrBrBrgoE2gay1BrUC4eldBs9YgoyYSVfjBV1HBrBrBrBrgoE2gay1BrUChZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgrM1gaR1zsyCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BoE2Br9lgoynSVfjqHldBo9Ygob1Br9lSVfjBsMlht29fobCgofnzsUYzeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgrMnBabrBo97SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoM1zsBngsMrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBr9YBr90zsBHgZldzIG9fofYgr80zaBYBeldzpldSVvQ4eldBr91gsy1Br8YgpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7Boylza9lBa9nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM7BaMlzsEnBHldzIG9fofYgr80zaBYBeldzomQ4eldBsR7goUCBaR1zZldzIG9fofYgr80zaBYBeldzoNQ4eldBofYgsEnBoUHBpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVf2BoRngsBYgsBHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foDl4oNQSS7ASVfrBrUCgs9Ygo90SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foDl4oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofCzabnBo8nBrg9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9YgoyYSVfjBV17grMHzayCgo81gabHBs91hZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrU0Ba8nBoMrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBYBoUHga9CBZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foBrBsRngs90Bav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrBlBsfCBayrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgafrBsUYBsb1BZldzIG9fofYgr80zaBYBeldzovQ4eldgaBCzs8lBrfYSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29fo90zsb1zsR2SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVfCBsyCgr9YgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1Hgo9nzaRnBaUlzsR7gsbASVf2gr9ngrO9foDl4oRngr81gs8lgaM0gsUHzt29foEYgr81gHldzoM6gs8YgoyHgoM7BabHgaR0hZHQht29foflzsMHBsRlBs39foDlhS7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsbYzaRrBrblSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29fob1BsR7BoBnBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foD2ht29fofrzsU1BofngpldzIG9fofYgr80zaBYBeldzomQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9fofYzs80BrU7zag9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6za9Ygrf0BoBYBa90goflgV29foEYgr8YgpldzoM6goR2BrRlgaB1gsb7zaE1Bt29foEYgr81gHldzoM6goBnBoRYzaynzayngsbngYHkht29foB2gs82goyYzae9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBryCBsB7zs92BZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldzs9CgrR1BrbCSVfjqHldBo9Ygob1Br9lSVfjBomQhSHQfdldfCgts7QRS7gRS7mpO5eHcPUdzdv6kF2AfdldfCgts7QRS7gRS7mH8nGwc59dzdv6kF2AfdldfCgts7QRS7gRS7OCOFZrkie6Oip6OCfjf50Hcild4VfofHvWsHmhUHmhtF1yUFpCfoDdcIZAcVfAfdBoRbQWZeQaZeQvcdNNXSfyvdNEkFgTfoDdcIZAcVfAfdBoRbQWZeQaZeQWcdNUOFZTfoDdcIZAcVfAfdBoRbQWZeQaZeQtkF06XF0IfoDdcIZAcVfAfdBoRbQWZeQaZeQsciQYkneAXnp6OCfjf50Hcild4VfofHvWsHmhUHmhRn0p8FGwc59dzdv6kF2AfdldfCgts7QRS7gRSHg78F0bXF0IfoDdcIZAcVfAfdBoRbQWZeQRS7mpO5eHcPUdzdv6kF2AfdldfCgts7QRSHmhmPZoXnp6OCfjf50Hcild4VfofHvWsHmhZeQi95Zp9Ym3c5mwc59dzdv6kF2AfdldfCgts7QRSHmhtF1yUFpCfoDdcIZAcVfAfdBoRbQWZeQRS7p6fEew9dM5fEmH8nAdzdv6kF2AfdldfCgts7QRSHmhsn1yRiZpXCfjf50Hcild4VfofHvWsHmhZeQtkF06XF0IfoDdcIZAcVfAfdBoRbQWZeQRSHgAcYkY8F2TXF0IfoDdcIZAcVfAfdBoRbQWZeQRSHg6OFeTXF0IfoDdcIZAcVfAfdBoRbQWZeQRSHg78F0bXF0IfoDdcIZAcVfAfdBoZbpsZReBRCfjfIG9foErzaMYgoM1Bo39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBs9lBrb2gryrSVfjqHldBoRHgo81zaM7SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BrRCzsU2BsyHBoBHzs9YBd29foEYgr8YgpldzoM6BrRCzsU2BsyHBoBHzs9YBd29foEYgr81gHldzoM6zs8lgry7Br9Hgo8Ygs9ChZHQht29foflzsMHBsRlBs39foDlhS7ASVfCgr9nzsyrgrN9fow79IZpht29foBHgrB1Bo92Brk9fowxSVfCgsRngoy1Bam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1HBab1BaB0gsMYza8HzsMn4eldBs9YgoyYSVfjBV1HBab1BaB0gsMYza8HzsMnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCgr9nzsyrgrN9fow79IZphSHQ4eldBsUrBoM2gsErBpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsMngry1BsElBHldz50HcilASVfCga87BsylBoMYSVfjcIZAcV29foB7gaf7BsMHgpldz50HcilASVfrgry1grU7gr9nSVfjqHldBo9Ygob1Br9lSVfjBsBlht29foUrzsbYBa92zeldz50Hci2Qht29foEHgr9lBaU2gre9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gsUnBsEHgryrSVfjqHldBo9Ygob1Br9lSVfjBoM7gY7ASVf2za9Ygs9HgoRYSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBaR1gr8YBrN9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDlht29fof2Brf7goR0gok9fowxSVfCgr9nzsyrgrN9foD2ht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfCBay0Ba8HgoR1SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSS7ASVfCBay0BrU0zs8CSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oRCzaB1gafnzaf1Bry7gV29foEYgr8YgpldzoM6gsf1Bry7Bo81BoyrzaU74eldBs9YgoyYSVfjBV1HBoyrzaUCgoyCzaB1gamQSSHQ4eldBoM0BaR2gsM2zeldzoeQht29foB7BsMYBabngo39fowxSVfCgr9nzsyrgrN9foD2zaZQ4eldzs9CgrR1BrbCSVfjqHldBo9Ygob1Br9lSVfjgIHQht29fo8nzaRCzaE1BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBs9Ygo82SVfjqHldBo9Ygob1Br9lSVfj4sE1BP7ASVf2gr9ngov9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBs9Ygo8rSVfjqHldBo9Ygob1Br9lSVfj4sElht29foE0BrUHgsbCBeldzIG9fofYgr80zaBYBeldzo8lBaNQ4eldBrR2BrfnzsM1zeldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtvQ_'
    ))

    update_preset_list()

    ref.list:update(get_render_list())
end

debug_point 'begin_antiaim'

local antiaim do
    antiaim = { }

    local inverts = 0
    local inverted = false

    local defensive_inverts = 0
    local defensive_inverted = false

    local skitter = {
        -1, 1, 0,
        -1, 1, 0,
        -1, 0, 1,
        -1, 0, 1
    }

    local default_delay = 0
    local defensive_delay = 0

    debug_point 'antiaim_buffer'

    local buffer = { } do
        local ref = software.antiaim.angles

        local Buffer = { } do
            Buffer.__index = Buffer

            function Buffer:clear()
                for k in pairs(self) do
                    self[k] = nil
                end
            end

            function Buffer:copy(target)
                for k, v in pairs(target) do
                    self[k] = v
                end
            end

            function Buffer:unset()
                ref.enabled:override()

                ref.pitch:override()

                ref.yaw[1]:override()
                ref.yaw[2]:override()
                ref.yaw[3]:override()
                ref.yaw[4]:override()
                ref.yaw[5]:override()

                ref.yaw_modifier[1]:override()
                ref.yaw_modifier[2]:override()

                ref.body_yaw[1]:override()
                ref.body_yaw[2]:override()
                ref.body_yaw[3]:override()
                ref.body_yaw[4]:override()
                ref.body_yaw[5]:override()
                ref.body_yaw[6]:override()

                ref.freestanding[1]:override()
                ref.freestanding[2]:override()
                ref.freestanding[3]:override()

                ref.extended_angles[1]:override()
                ref.extended_angles[2]:override()
                ref.extended_angles[3]:override()
            end

            function Buffer:set()
                ref.enabled:override(self.enabled)

                ref.pitch:override(self.pitch)

                ref.yaw[1]:override(self.yaw)
                ref.yaw[2]:override(self.yaw_base)
                ref.yaw[3]:override(self.yaw_offset)
                ref.yaw[4]:override(self.avoid_backstab)
                ref.yaw[5]:override(self.hidden)

                ref.yaw_modifier[1]:override(self.yaw_modifier)
                ref.yaw_modifier[2]:override(self.modifier_offset)

                ref.body_yaw[1]:override(self.body_yaw)
                ref.body_yaw[2]:override(self.inverter)
                ref.body_yaw[3]:override(self.left_limit)
                ref.body_yaw[4]:override(self.right_limit)
                ref.body_yaw[5]:override(self.options)
                ref.body_yaw[6]:override(self.freestanding_body_yaw)

                ref.freestanding[1]:override(self.freestanding)
                ref.freestanding[2]:override(self.freestanding_disable_yaw_modifiers)
                ref.freestanding[3]:override(self.freestanding_body_freestanding)

                ref.extended_angles[1]:override(self.extended_angles)
                ref.extended_angles[2]:override(self.extended_angles_pitch)
                ref.extended_angles[3]:override(self.extended_angles_roll)
            end
        end

        setmetatable(buffer, Buffer)
    end

    debug_point 'antiaim_defensive'

    local defensive = { } do
        local generated_pitch = 0
        local generated_yaw = 0

        local pitch_inverted = false
        local modifier_delay_ticks = 0

        local function should_update(items)
            if software.ragebot.main.double_tap[1]:get() then
                return items.exploits:get 'Double Tap'
            end

            if software.ragebot.main.hide_shots[1]:get() then
                return items.exploits:get 'Hide Shots'
            end

            return false
        end

        local function should_force_defensive()
            local me = entity.get_local_player()

            if me == nil then
                return false
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return false
            end

            local weapon_info = weapon:get_weapon_info()

            if weapon_info.weapon_type == 9 then
                return false
            end

            return true
        end

        local function update_pitch_inverter()
            pitch_inverted = not pitch_inverted
        end

        local function update_delay_ticks()
            modifier_delay_ticks = modifier_delay_ticks + 1
        end

        local function update_pitch(buffer, items)
            local value = items.pitch:get()

            if value == 'Off' then
                return
            end

            if value == 'Static' then
                buffer.pitch_offset = items.pitch_offset:get()

                return
            end

            if value == 'Jitter' then
                local offset = pitch_inverted
                    and items.pitch_offset_2:get()
                    or items.pitch_offset_1:get()

                buffer.pitch_offset = offset

                return
            end

            if value == 'Spin' then
                local time = globals.curtime
                time = time * (items.pitch_speed:get() * 0.1)

                local offset = aux.lerp(
                    items.pitch_offset_1:get(),
                    items.pitch_offset_2:get(),
                    time % 1
                )

                buffer.pitch_offset = offset

                return
            end

            if value == 'Random' then
                buffer.pitch_offset = utils.random_int(
                    items.pitch_offset_1:get(),
                    items.pitch_offset_2:get()
                )

                return
            end

            if value == 'Static Random' then
                local cur_ticks = exploit.defensive_ticks
                local max_ticks = exploit.max_defensive_ticks

                if cur_ticks == max_ticks then
                    generated_pitch = utils.random_int(
                        items.pitch_offset_1:get(),
                        items.pitch_offset_2:get()
                    )
                end

                buffer.pitch_offset = generated_pitch
            end
        end

        local function update_yaw_modifier(buffer, items)
            -- empty body
        end

        local function update_yaw(buffer, items)
            local value = items.yaw:get()

            if value == 'Off' then
                return
            end

            if value == 'Static' then
                buffer.yaw_offset = items.yaw_offset:get()
            end

            if value == 'Spin' then
                local time = globals.curtime * (items.yaw_speed:get() * 0.1)
                local offset = items.yaw_offset:get()

                offset = 180 + aux.lerp(
                    -offset, offset, time % 1
                )

                buffer.yaw_offset = -offset
            end

            if value == 'Random' then
                local offset = math.abs(
                    items.yaw_offset:get() * 0.5
                )

                offset = 180 + utils.random_int(
                    -offset, offset
                )

                buffer.yaw_offset = offset
            end

            if value == 'Left/Right' then
                buffer.yaw_offset = 0

                buffer.yaw_left = items.yaw_left:get()
                buffer.yaw_right = items.yaw_right:get()
            end

            if value == 'Static Random' then
                local cur_ticks = exploit.defensive_ticks
                local max_ticks = exploit.max_defensive_ticks

                if cur_ticks == max_ticks then
                    generated_yaw = utils.random_int(
                        items.yaw_left:get(),
                        items.yaw_right:get()
                    )
                end

                buffer.yaw_offset = generated_yaw
            end

            update_yaw_modifier(buffer, items)
        end

        local function update_delay(buffer, items)
            if not items.delay:get() then
                return
            end

            local mode = items.delay_mode:get()

            if mode == 'Default' then
                buffer.delay = items.delay_timing:get()
            end

            if mode == 'Random' then
                buffer.delay = utils.random_int(
                    items.delay_min_timing:get(),
                    items.delay_max_timing:get()
                )
            end

            if mode == 'Custom' then
                local count = items.delay_sliders:get()
                local index = math.random(1, count)

                local item = items['delay_' .. index]

                if item ~= nil then
                    buffer.delay = item:get()
                end
            end
        end

        function defensive:update(cmd)
            buffer.hidden = false

            software.ragebot.main.hide_shots[2]:override()
            software.ragebot.main.double_tap[2]:override()

            if cmd.choked_commands == 0 then
                update_pitch_inverter()
                update_delay_ticks()
            end
        end

        function defensive:apply(cmd, items)
            local break_lc = should_force_defensive()

            buffer.hidden = break_lc

            if items.force_defensive == nil or not items.force_defensive:get() then
                break_lc = false
            end

            software.ragebot.main.hide_shots[2]:override(break_lc and 'Break LC' or 'Favor Fire Rate')
            software.ragebot.main.double_tap[2]:override(break_lc and 'Always On' or 'On Peek')

            if break_lc and items.custom_defensive_ticks:get() then
                local mode = items.defensive_ticks_mode:get()

                local temp_choke = nil

                if mode == 'Default' then
                    temp_choke = items.defensive_ticks:get()
                end

                if mode == 'Random' then
                    temp_choke = utils.random_int(
                        items.min_defensive_ticks:get(),
                        items.max_defensive_ticks:get()
                    )
                end

                if mode == 'Custom' then
                    local count = items.defensive_ticks_sliders:get()
                    local index = math.random(1, count)

                    temp_choke = items['defensive_ticks_' .. index]:get()
                end

                if temp_choke ~= nil then
                    cmd.force_defensive = (cmd.command_number % temp_choke) == 0
                end
            end

            if items.enabled:get() and should_update(items) then
                local buffer_ctx = { }

                update_pitch(buffer_ctx, items)
                update_yaw(buffer_ctx, items)

                update_delay(buffer_ctx, items)

                buffer.defensive = buffer_ctx

                return true
            end

            return false
        end
    end

    debug_point 'antiaim_builder'

    local builder = { } do
        local ref = resource.antiaim.builder

        local BODY_YAW_FREESTANDING = {
            ['Off'] = 'Off',
            ['Default'] = 'Peek Fake',
            ['Reversed'] = 'Peek Real'
        }

        local old_items = nil

        local function update_yaw(items)
            local angles = items.angles

            local value = angles.yaw:get()

            local method = angles.yaw_method:get()
            local offset = angles.yaw_offset:get()

            buffer.yaw = 'Backward'
            buffer.yaw_offset = offset

            if value == '2-Way' then
                local yaw_left = angles.yaw_left:get()
                local yaw_right = angles.yaw_right:get()

                local random_left = angles.yaw_left_random:get()
                local random_right = angles.yaw_right_random:get()

                if angles.yaw_left_randomize:get() then
                    yaw_left = utils.random_int(
                        yaw_left, random_left
                    )
                end

                if angles.yaw_right_randomize:get() then
                    yaw_right = utils.random_int(
                        yaw_right, random_right
                    )
                end

                buffer.yaw_left = yaw_left
                buffer.yaw_right = yaw_right
            end

            if method == 'Wave' then
                local yaw = buffer.yaw_offset or 0

                local frequency = angles.yaw_frequency:get()
                local amplitude = angles.yaw_amplitude:get()

                buffer.yaw_offset = yaw + math.sin(globals.curtime * frequency) * amplitude
            end

            if method == 'Shake' then
                local yaw = buffer.yaw_offset or 0

                local min = angles.yaw_min:get()
                local max = angles.yaw_max:get()

                local scale = angles.yaw_scale:get()
                local value = globals.curtime * scale

                buffer.yaw_offset = yaw + utils.random_float(min, max) * math.sin(value) * math.cos(value * 2) * math.sin(value * 0.5)
            end
        end

        local function update_jitter(items)
            local angles = items.angles

            local value = angles.yaw_modifier:get()

            local mode = angles.modifier_mode:get()
            local offset = angles.modifier_offset:get()

            local switcher = angles.modifier_switcher:get()

            if switcher == 'Ticks' then
                local value = angles.modifier_ticks_value:get()

                if (globals.tickcount % value) <= 1 then
                    value = 'Off'
                end
            end

            if switcher == 'Random' then
                local value = angles.modifier_random_value:get()

                if utils.random_int(0, value) == value then
                    value = 'Off'
                end
            end

            if value == 'Off' then
                buffer.yaw_modifier = 'Disabled'
                buffer.modifier_offset = nil

                return
            end

            if value == 'Frostbomber' then
                mode = 'Random'
            end

            if mode == 'Random' then
                offset = utils.random_int(
                    angles.modifier_min_offset:get(),
                    angles.modifier_max_offset:get()
                )
            end

            if mode == 'Custom' then
                local count = angles.modifier_sliders:get()
                local index = (localplayer.sent_packets % count) + 1

                local item = angles['modifier_offset_' .. index]

                if item ~= nil then
                    offset = item:get()
                end
            end

            if mode == 'Default' or mode == 'Custom' then
                local random_offset = offset * (
                    angles.modifier_random:get() * 0.01
                )

                offset = offset + utils.random_int(
                    -random_offset, random_offset
                )
            end

            buffer.yaw_modifier = value
            buffer.modifier_offset = offset
        end

        local function update_body_yaw(items)
            local angles = items.angles

            local body_yaw = angles.body_yaw:get()
            local switcher = angles.body_yaw_type:get()

            if switcher == 'Ticks' then
                local value = angles.body_yaw_ticks_value:get()

                if (globals.tickcount % value) <= 1 then
                    body_yaw = false
                end
            end

            if switcher == 'Random' then
                local value = angles.body_yaw_random_value:get()

                if utils.random_int(0, value) == value then
                    body_yaw = false
                end
            end

            local options = { }

            if angles.body_yaw_jitter:get() then
                table.insert(options, 'Jitter')
            end

            local limit_type = angles.body_yaw_limit_type:get()

            local left_limit = angles.body_yaw_limit_left_value:get()
            local right_limit = angles.body_yaw_limit_right_value:get()

            local invert_chance = angles.body_yaw_invert_chance:get()
            local freestanding_body_yaw = BODY_YAW_FREESTANDING[angles.body_yaw_freestanding:get()] or 'Off'

            if limit_type == 'Random' then
                left_limit = utils.random_int(
                    angles.body_yaw_limit_min_value:get(),
                    angles.body_yaw_limit_max_value:get()
                )

                right_limit = utils.random_int(
                    angles.body_yaw_limit_min_value:get(),
                    angles.body_yaw_limit_max_value:get()
                )
            end

            if limit_type == 'Ticks' then
                local timing = angles.body_yaw_timing:get()

                local limit = globals.tickcount % (timing * 2) < timing
                    and angles.body_yaw_limit_min_value:get()
                    or angles.body_yaw_limit_max_value:get()

                left_limit = limit
                right_limit = limit
            end

            buffer.body_yaw = body_yaw

            buffer.left_limit = left_limit
            buffer.right_limit = right_limit

            buffer.options = options
            buffer.freestanding_body_yaw = freestanding_body_yaw

            buffer.invert_chance = invert_chance
        end

        local function update_delay(items)
            local angles = items.angles

            if angles.yaw:get() ~= '2-Way' then
                return
            end

            if not angles.delay:get() then
                return
            end

            local mode = angles.delay_mode:get()

            if mode == 'Default' then
                buffer.delay = angles.delay_timing:get()
            end

            if mode == 'Random' then
                buffer.delay = utils.random_int(
                    angles.delay_min_timing:get(),
                    angles.delay_max_timing:get()
                )
            end

            if mode == 'Custom' then
                local count = angles.delay_sliders:get()
                local index = math.random(1, count)

                local item = angles['delay_' .. index]

                if item ~= nil then
                    buffer.delay = item:get()
                end
            end

            if mode ~= 'Random' then
                local random = angles.delay_random:get()

                if random > 0 and buffer.delay ~= nil then
                    local random_value = random * 0.01

                    local generated_value = utils.random_float(
                        -random_value * 0.6, random_value * 0.6
                    )

                    buffer.delay = buffer.delay + math.floor(buffer.delay * generated_value)
                    buffer.delay = math.clamp(buffer.delay, 1, 22)
                end
            end
        end

        function builder:get(team, state)
            return ref[team][state]
        end

        function builder:is_active_ex(items)
            return items.enabled == nil
                or items.enabled:get()
        end

        function builder:is_active(team, state)
            local items = self:get(team, state)

            if items == nil then
                return false
            end

            return builder:is_active_ex(items)
        end

        function builder:get_old_items()
            return old_items
        end

        function builder:apply_ex(items)
            if items == nil then
                return false
            end

            if items.angles ~= nil then
                buffer.enabled = true

                buffer.pitch = 'Down'
                buffer.yaw_base = 'At Target'

                update_body_yaw(items)
                update_yaw(items)
                update_jitter(items)
                update_delay(items)
            end

            old_items = items

            return true
        end

        function builder:apply(team, state)
            local items = self:get(team, state)

            if items == nil then
                return nil
            end

            if not self:is_active_ex(items) then
                return nil
            end

            self:apply_ex(items)

            return items
        end

        function builder:update(cmd, team)
            if rage.exploit:get() ~= 1.0 then
                local items = self:apply(team, 'Fakelag')

                if items ~= nil then
                    return items
                end
            end

            local state = statement.get()
            local items = self:apply(team, state)

            if items ~= nil then
                return items
            end

            return self:apply(team, 'Default')
        end

        antiaim.builder = builder
    end

    debug_point 'antiaim_antibrute'

    local antibrute = { } do
        local shot_events = shot_system.get_event_bus()

        local alternative = { } do
            local stage = nil
            local end_time = nil

            local generated_delay = nil
            local generated_offset = nil
            local generated_modifier = nil

            local function get_offset_value(items)
                local value = 0

                if items.refresh_modifier:get() == 'Meta' then
                    value = value + (stage % 15 + 1) * 2 * (rage.antiaim:inverter() and 1 or -1)
                end

                if items.refresh_offset:get() then
                    value = value + math.random(-7, 13)
                end

                if value ~= 0 then
                    return value
                end

                return nil
            end

            local function get_modifier_value(items)
                local refresh_modifier = items.refresh_modifier:get()

                if refresh_modifier == 'Meta' then
                    return nil
                end

                if refresh_modifier == 'Increase' then
                    return math.random(0, 5)
                end

                if refresh_modifier == 'Decrease' then
                    return math.random(-5, 0)
                end

                return nil
            end

            local function reset_antibrute()
                stage = nil
                end_time = nil

                generated_delay = nil
                generated_offset = nil
                generated_modifier = nil
            end

            function alternative:update()
                if end_time ~= nil and globals.curtime > end_time then
                    reset_antibrute()
                    return false
                end

                if generated_delay ~= nil then
                    buffer.delay = generated_delay
                end

                if generated_offset ~= nil and buffer.yaw_offset ~= nil then
                    buffer.yaw_offset = buffer.yaw_offset + generated_offset
                end

                if generated_modifier ~= nil and buffer.modifier_offset ~= nil then
                    buffer.modifier_offset = buffer.modifier_offset + generated_modifier
                end

                return true
            end

            function alternative:enemy_shot(items)
                local duration = items.duration:get()

                if stage == nil then
                    stage = 1
                else
                    stage = stage + 1
                end

                end_time = duration ~= 9 and (globals.curtime + duration * 0.1) or nil

                if items.enforce_delay:get() then
                    generated_delay = math.random(1, 5)
                end

                generated_offset = get_offset_value(items)
                generated_modifier = get_modifier_value(items)
            end
        end

        function antibrute:update(cmd, state_items)
            local items = state_items.antibrute

            if items == nil or not items.enabled:get() then
                return false
            end

            alternative:update()

            return true
        end

        local function on_enemy_shot()
            local state_items = builder:get_old_items()

            if state_items == nil then
                return
            end

            alternative:enemy_shot(
                state_items.antibrute
            )
        end

        local callbacks do
            shot_events.enemy_shot:set(
                on_enemy_shot, value
            )
        end
    end

    debug_point 'antiaim_avoid_backstab'

    local avoid_backstab = { } do
        local ref = resource.antiaim.settings.avoid_backstab

        function avoid_backstab:update()
            buffer.avoid_backstab = ref.enabled:get()
        end
    end

    debug_point 'antiaim_force_lethal'

    local force_lethal do
        local ref = resource.ragebot.force_lethal
        local shared = session.force_lethal

        local ref_double_tap = ui.find(
            'Aimbot', 'Ragebot', 'Main', 'Double Tap'
        )

        local ragebot = { } do
            local function get_layout(weapon)
                local list = { }

                list.selection = {
                    min_damage = ui.find('Aimbot', 'Ragebot', 'Selection', weapon, 'Min. Damage'),
                    hit_chance = ui.find('Aimbot', 'Ragebot', 'Selection', weapon, 'Hit Chance')
                }

                list.safety = {
                    body_aim = ui.find('Aimbot', 'Ragebot', 'Safety', weapon, 'Body Aim')
                }

                return list
            end

            ragebot['Auto'] = get_layout 'AutoSnipers'
            ragebot['Deagle'] = get_layout 'Desert Eagle'
        end

        local function get_weapon_type(weapon)
            local weapon_info = weapon:get_weapon_info()

            if weapon_info == nil then
                return nil
            end

            local weapon_index = weapon:get_weapon_index()

            if weapon_index == 1 then
                return 'Deagle'
            end

            if weapon_index == 11 or weapon_index == 38 then
                return 'Auto'
            end

            return nil
        end

        local function restore_values()
            for _, v in pairs(ragebot) do
                v.selection.min_damage:override()
                v.selection.hit_chance:override()

                v.safety.body_aim:override()
            end
        end

        local function update_force_lethal()
            local me = entity.get_local_player()

            if me == nil then
                return false
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return false
            end

            local weapon_type = get_weapon_type(weapon)

            if weapon_type == nil then
                return false
            end

            if not ref.weapons:get(weapon_type) then
                return false
            end

            local mode = ref.mode:get()
            local items = ragebot[weapon_type]

            if items == nil then
                return false
            end

            local bind = binds_ctx.get(
                items.selection.min_damage
            )

            if bind ~= nil and bind.active then
                return false
            end

            local is_double_tap = (
                ref_double_tap:get()
                and rage.exploit:get() == 1.0
            )

            local should_hp_damage = (
                not is_double_tap and
                items.safety.body_aim:get() ~= 'Force'
            )

            if should_hp_damage then
                items.selection.min_damage:override(100)

                local ref_weapon = ref[weapon_type]

                if ref_weapon ~= nil and ref_weapon.hitchance ~= nil then
                    local value = ref_weapon.hitchance:get()

                    items.selection.hit_chance:override(
                        value ~= -1 and value or nil
                    )
                end

                shared.updated_division = false
                shared.updated_this_tick = true

                return true
            end

            if is_double_tap and mode == 'Damage = HP/2' then
                local threat = entity.get_threat()

                if threat == nil then
                    return
                end

                local health = threat.m_iHealth

                items.selection.min_damage:override(
                    math.ceil(health / 2)
                )

                shared.updated_division = true
                shared.updated_this_tick = true

                return true
            end

            return false
        end

        local function on_shutdown()
            restore_values()
        end

        local function on_createmove()
            local was_updated = shared.updated_this_tick

            shared.updated_division = false
            shared.updated_this_tick = false

            local is_updated = update_force_lethal()

            if was_updated and not is_updated then
                restore_values()
            end
        end

        on_shutdown = create_debug_callback('force_lethal.on_shutdown', on_shutdown)
        on_createmove = create_debug_callback('force_lethal.on_createmove', on_createmove)

        local callbacks do
            local function on_enabled(item)
                local value = item:get()

                if not value then
                    restore_values()
                end

                events.shutdown(on_shutdown, value)
                events.createmove(on_createmove, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'antiaim_auto_hide_shots'

    local auto_hide_shots do
        local ref = resource.ragebot.auto_hide_shots

        local WEAPONTYPE_PISTOL        = 1
        local WEAPONTYPE_SUBMACHINEGUN = 2
        local WEAPONTYPE_RIFLE         = 3
        local WEAPONTYPE_SNIPER_RIFLE  = 5

        local function get_state()
            if not localplayer.is_onground then
                if localplayer.is_crouched then
                    return 'In Air & Duck'
                end

                return 'In Air'
            end

            if localplayer.is_crouched then
                if localplayer.is_moving then
                    return 'Sneaking'
                end

                return 'Ducking'
            end

            if localplayer.is_moving then
                if software.antiaim.misc.slow_walk:get() then
                    return 'Slowwalking'
                end

                return 'Running'
            end

            return 'Standing'
        end

        local function get_weapon_type(weapon)
            local weapon_info = weapon:get_weapon_info()

            if weapon_info == nil then
                return nil
            end

            local weapon_type = weapon_info.weapon_type
            local weapon_index = weapon:get_weapon_index()

            if weapon_type == WEAPONTYPE_SUBMACHINEGUN then
                return 'SMG'
            end

            if weapon_type == WEAPONTYPE_RIFLE then
                return 'Rifles'
            end

            if weapon_type == WEAPONTYPE_PISTOL then
                if weapon_index == 1 then
                    return 'Desert Eagle'
                end

                if weapon_index == 64 then
                    return 'Revolver R8'
                end

                return 'Pistols'
            end

            if weapon_type == WEAPONTYPE_SNIPER_RIFLE then
                if weapon_index == 40 then
                    return 'Scout'
                end

                if weapon_index == 9 then
                    return 'AWP'
                end

                return 'Auto Snipers'
            end

            return nil
        end

        local function restore_values()
            software.ragebot.main.double_tap[1]:override()
            software.ragebot.main.hide_shots[1]:override()
        end

        local function update_values()
            software.ragebot.main.double_tap[1]:override(false)
            software.ragebot.main.hide_shots[1]:override(true)
        end

        local function should_update()
            if software.antiaim.misc.fake_duck:get() then
                return false
            end

            if software.ragebot.main.peek_assist[1]:get() then
                return false
            end

            if not software.ragebot.main.double_tap[1]:get() then
                return false
            end

            local me = entity.get_local_player()

            if me == nil then
                return false
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return false
            end

            local weapon_type = get_weapon_type(weapon)

            if weapon_type == nil or not ref.weapons:get(weapon_type) then
                return false
            end

            local items = ref[weapon_type]

            if items == nil then
                return false
            end

            local state = get_state()

            if not items.states:get(state) then
                return false
            end

            return true
        end

        local function on_shutdown()
            restore_values()
        end

        local function on_createmove()
            if should_update() then
                update_values()
            else
                restore_values()
            end
        end

        on_shutdown = create_debug_callback('auto_hide_shots.on_shutdown', on_shutdown)
        on_createmove = create_debug_callback('auto_hide_shots.on_createmove', on_createmove)

        local callbacks do
            local function on_enabled(item)
                local value = item:get()

                if not value then
                    restore_values()
                end

                events.shutdown(on_shutdown, value)
                events.createmove(on_createmove, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'antiaim_animations'

    local animations do
        local ref = resource.antiaim.settings.animations

        local ref_leg_movement = ui.find(
            'Aimbot', 'Anti Aim', 'Misc', 'Leg Movement'
        )

        local animlayer_t = ffi.typeof [[
            struct {
                float  m_flLayerAnimtime;
                float  m_flLayerFadeOuttime;

                // dispatch flags
                void  *m_pDispatchedStudioHdr;
                int    m_nDispatchedSrc;
                int    m_nDispatchedDst;

                int    m_nOrder;
                int    m_nSequence;
                float  m_flPrevCycle;
                float  m_flWeight;
                float  m_flWeightDeltaRate;

                // used for automatic crossfades between sequence changes;
                float  m_flPlaybackRate;
                float  m_flCycle;
                int    m_pOwner;
                int    m_nInvalidatePhysicsBits;
            } **
        ]]

        local function get_animation_layer(player)
            return ffi.cast(animlayer_t, ffi.cast('uintptr_t', player[0]) + 0x2990)[0]
        end

        local function update_air_legs(player, animlayers)
            local value = ref.air_legs:get()

            if value == 'Static' then
                player.m_flPoseParameter[6] = 0.5

                return
            end

            if value == 'Walking' then
                local layer = animlayers[6]

                layer.m_flWeight = 1.0
                layer.m_flCycle = (globals.curtime * 0.5) % 1

                return
            end
        end

        local function update_ground_legs(player)
            local value = ref.ground_legs:get()

            if value == 'Static' then
                player.m_flPoseParameter[0] = 1.0
                ref_leg_movement:override 'Sliding'

                return
            end

            if value == 'Jitter' then
                local tickcount = globals.tickcount

                local offset_1 = ref.legs_offset_1:get()
                local offset_2 = ref.legs_offset_2:get()

                local mul = 1.0 / (tickcount % 8 >= 4 and 200 or 400)
                local offset = tickcount % 4 >= 2 and offset_1 or offset_2

                ref_leg_movement:override 'Sliding'
                player.m_flPoseParameter[0] = offset * mul

                return
            end

            if value == 'Walking' then
                player.m_flPoseParameter[7] = 0.0
                ref_leg_movement:override 'Walking'

                return
            end

            if value == 'Earthquake' then
                player.m_flPoseParameter[3] = math.random()
                player.m_flPoseParameter[6] = math.random()
                player.m_flPoseParameter[7] = math.random()
            end

            ref_leg_movement:override()
        end

        local function update_pitch_on_land(player, animstate)
            if not ref.pitch_on_land:get() then
                return
            end

            if animstate.landing then
                player.m_flPoseParameter[12] = 0.5
            end
        end

        local function update_move_lean(animlayers)
            local value = ref.body_lean:get()

            if value == -1 or not localplayer.is_moving then
                return
            end

            animlayers[12].m_flWeight = value
        end

        local function on_post_update_clientside_animation(player)
            local me = entity.get_local_player()

            if player ~= me then
                return
            end

            local animstate = player:get_anim_state()

            if animstate == nil then
                return
            end

            local animlayers = get_animation_layer(player)

            if animlayers == nil then
                return
            end

            if localplayer.is_onground then
                update_ground_legs(player)
                update_pitch_on_land(player, animstate)
            else
                update_air_legs(player, animlayers)
            end

            update_move_lean(animlayers)
        end

        on_post_update_clientside_animation = create_debug_callback('animations.on_post_update_clientside_animation', on_post_update_clientside_animation)

        local callbacks do
            local function on_enabled(item)
                local value = item:get()

                if not value then
                    ref_leg_movement:override()
                end

                events.post_update_clientside_animation(
                    on_post_update_clientside_animation, value
                )
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'antiaim_disablers'

    local disablers = { } do
        local ref = resource.antiaim.settings.disablers

        local ref_fake_lag = ui.find(
            'Aimbot', 'Anti Aim', 'Fake Lag', 'Enabled'
        )

        local function are_enemies_dead()
            local me = entity.get_local_player()

            if me == nil then
                return false
            end

            local my_team = me.m_iTeamNum

            local player_resource = entity.get_player_resource()

            for i = 1, globals.max_players do
                if not player_resource.m_bConnected[i] then
                    goto continue
                end

                local player_team = player_resource.m_iTeam[i]

                if me == i or player_team == my_team then
                    goto continue
                end

                if player_resource.m_bAlive[i] then
                    return false
                end

                ::continue::
            end

            return true
        end

        local function should_update()
            local game_rules = entity.get_game_rules()

            if game_rules == nil then
                return false
            end

            if ref.select:get 'Warmup' then
                if game_rules.m_bWarmupPeriod then
                    return true
                end
            end

            if ref.select:get 'No Enemies' then
                if are_enemies_dead() then
                    return true
                end
            end

            return false
        end

        function disablers:update(cmd)
            ref_fake_lag:override()

            if not ref.enabled:get() then
                return false
            end

            if not should_update() then
                return false
            end

            local time = globals.curtime * 2.4

            buffer.enabled = true

            buffer.pitch = 'Disabled'

            buffer.yaw = 'Backward'
            buffer.yaw_offset = (time % 1.0) * 360

            buffer.yaw_modifier = 'Disabled'
            buffer.modifier_offset = 0

            buffer.body_yaw = true
            buffer.inverter = false
            buffer.left_limit = 60
            buffer.right_limit = 60
            buffer.options = { }
            buffer.freestanding_body_yaw = 'Off'

            buffer.freestanding = false

            buffer.defensive = nil

            ref_fake_lag:override(false)

            return true
        end
    end

    debug_point 'antiaim_air_lag'

    local air_lag = { } do
        local ref = resource.antiaim.settings.air_lag

        local ref_fake_duck = ui.find(
            'Aimbot', 'Anti Aim', 'Misc', 'Fake Duck'
        )

        local elapsed_ticks = 0

        local function on_shutdown()
            elapsed_ticks = 0
            ref_fake_duck:override()
        end

        local function on_createmove()
            ref_fake_duck:override()

            if rage.exploit:get() ~= 1.0 then
                return
            end

            if localplayer.is_onground then
                return
            end

            elapsed_ticks = elapsed_ticks + 1

            if elapsed_ticks >= ref.ticks:get() then
                elapsed_ticks = 0

                ref_fake_duck:override(true)
            end
        end

        on_createmove = create_debug_callback('antiaim_air_lag.on_createmove', on_createmove)
        on_shutdown = create_debug_callback('antiaim_air_lag.on_shutdown', on_shutdown)

        local callbacks do
            local function on_enabled(item)
                local value = item:get()

                if not value then
                    ref_fake_duck:override()
                end

                events.shutdown(on_shutdown, value)
                events.createmove(on_createmove, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'antiaim_defensive_flick'

    local defensive_flick = { } do
        local packets = 0

        local function should_update()
            if rage.exploit:get() ~= 1.0 then
                return false
            end

            local me = entity.get_local_player()

            if me == nil then
                return false
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return false
            end

            local weapon_info = weapon:get_weapon_info()

            if weapon_info == nil or weapon_info.is_revolver then
                return false
            end

            return true
        end

        function defensive_flick:apply(cmd, items)
            if items == nil or not items.enabled:get() then
                return false
            end

            if not should_update() then
                return false
            end

            if cmd.choked_commands == 0 then
                packets = packets + 1
            end

            cmd.force_defensive = cmd.command_number % 7 == 0

            software.ragebot.main.hide_shots[2]:override('Break LC')
            software.ragebot.main.double_tap[2]:override('Always On')

            if exploit.defensive_ticks > 0 then
                local speed, speed_mode = 0, items.speed_mode:get()

                if speed_mode == 'Default' then
                    speed = items.speed_default:get()
                end

                if speed_mode == 'Random' then
                    speed = utils.random_int(
                        items.speed_min:get(),
                        items.speed_max:get()
                    )
                end

                local delta = exploit.defensive_ticks - exploit.max_defensive_ticks

                if delta > speed then
                    return
                end
            end

            local limit = items.limit:get()

            buffer.yaw = 'Backward'
            buffer.yaw_offset = 0

            buffer.yaw_left = 0
            buffer.yaw_right = 0

            buffer.hidden = true

            buffer.yaw_modifier = 'Disabled'
            buffer.modifier_offset = 0

            buffer.body_yaw = true
            buffer.inverter = false

            buffer.left_limit = limit
            buffer.right_limit = limit

            buffer.options = { }

            local buffer_ctx = { } do
                buffer_ctx.pitch_offset = items.pitch:get()
                buffer_ctx.yaw_offset = items.yaw:get()
            end

            local inverter = items.inverter:get()

            if items.jitter:get() then
                if bit.band(packets, 1) ~= 0 then
                    inverter = not inverter
                end
            end

            if inverter then
                buffer_ctx.yaw_offset = -buffer_ctx.yaw_offset
            end

            buffer.defensive = buffer_ctx

            return true
        end
    end

    debug_point 'antiaim_manual_yaw'

    local manual_yaw = { } do
        local ref = resource.antiaim.settings.manual_yaw

        local values = {
            ['Left']     = -90,
            ['Right']    =  90,
            ['Backward'] =  0,
            ['Forward']  =  180
        }

        local function get_manual_yaw()
            return values[ref.select:get()]
        end

        function manual_yaw:update(cmd)
            local value = get_manual_yaw()

            if value == nil then
                return false
            end

            local yaw = buffer.yaw_offset or 0

            buffer.enabled = true

            buffer.yaw_offset = yaw + value

            buffer.freestanding = false

            if ref.disable_yaw_modifiers:get() then
                buffer.yaw_offset = yaw + value

                buffer.yaw_left = 0
                buffer.yaw_right = 0

                buffer.yaw_modifier = 'Disabled'
                buffer.modifier_offset = 0
            end

            if ref.body_freestanding:get() then
                buffer.body_yaw = true

                buffer.left_limit = 60
                buffer.right_limit = 60

                buffer.options = { }
                buffer.freestanding_body_yaw = 'Peek Fake'
            end

            buffer.yaw_base = 'Local View'

            return true
        end
    end

    debug_point 'antiaim_freestanding'

    local freestanding = { } do
        local ref = resource.antiaim.settings.freestanding

        local function get_disabled_state()
            if not localplayer.is_onground then
                if localplayer.is_crouched then
                    return 'In Air & Duck'
                end

                return 'In Air'
            end

            if localplayer.is_crouched then
                return 'Ducking'
            end

            if localplayer.is_moving then
                if software.antiaim.misc.slow_walk:get() then
                    return 'Slowwalking'
                end

                return 'Running'
            end

            return 'Standing'
        end

        local function is_disabled()
            return ref.disablers:get(
                get_disabled_state()
            )
        end

        local function is_enabled()
            return ref.enabled:get()
                and not is_disabled()
       end


       local function get_freestand_angle()
            local target_yaw = rage.antiaim:get_target(false)
            local freestanding_yaw = rage.antiaim:get_target(true)

            if target_yaw == nil or freestanding_yaw == nil then
                return nil
            end

            return freestanding_yaw - target_yaw
        end

        local function update_values(cmd, team)
            local angle = get_freestand_angle()

            if angle == nil then
                return
            end

            local items = builder:apply(
                team, 'Freestanding'
            )

            if items == nil then
                buffer.freestanding = true

                buffer.freestanding_disable_yaw_modifiers = ref.disable_yaw_modifiers:get()
                buffer.freestanding_body_freestanding = ref.body_freestanding:get()

                return
            end

            buffer.yaw_offset = buffer.yaw_offset + angle

            if items.defensive ~= nil then
                local is_defensive = (
                    defensive_flick:apply(cmd, items.flick)
                    or defensive:apply(cmd, items.defensive)
                )

                if is_defensive then
                    local yaw_offset = buffer.defensive.yaw_offset

                    if yaw_offset ~= nil then
                        buffer.defensive.yaw_offset = yaw_offset + angle
                    end
                end
            end

            buffer.freestanding = false
        end

        function freestanding:update(cmd, team)
            if not is_enabled() then
                buffer.freestanding = false
                return false
            end

            update_values(cmd, team)

            return true
        end
    end

    debug_point 'antiaim_edge_yaw'

    local edge_yaw = { } do
        local ref = resource.antiaim.settings.edge_yaw

        local ref_fake_duck = ui.find(
            'Aimbot', 'Anti Aim', 'Misc', 'Fake Duck'
        )

        -- enq's method
        local function get_angle(cmd)
            local me = entity.get_local_player()

            if me == nil then
                return nil
            end

            local eye_pos = me:get_eye_position()

            if eye_pos == nil then
                return nil
            end

            local count = 0
            local angles = { }

            for i = -180, 180, 360 / 8 do
                local forward = vector():angles(vector(0, i, 0))
                local point = eye_pos + forward * 25

                local tr = utils.trace_line(
                    eye_pos, point, me, 0xFFFFFFFF
                )

                if tr.fraction < 1 then
                    count = count + 1
                    angles[count] = i
                end
            end

            if count < 2 then
                return nil
            end

            local wall_angle = math.normalize_yaw(
                aux.lerp(angles[1], angles[count], 0.5)
            )

            local delta_angle = math.normalize_yaw(
                cmd.view_angles.y - wall_angle
            )

            if math.abs(delta_angle) > 90 then
                return nil
            end

            return math.normalize_yaw(
                2 * (wall_angle - cmd.view_angles.y) - 180
            )
        end

        local function should_update()
            if not ref.enabled:get() then
                return false
            end

            if ref.only_on_fake_duck:get() and not ref_fake_duck:get() then
                return false
            end

            return true
        end

        function edge_yaw:update(cmd)
            if not should_update() then
                return false
            end

            local angle = get_angle(cmd)

            if angle == nil then
                return false
            end

            local yaw = buffer.yaw_offset or 0
            buffer.yaw_offset = yaw + angle

            return true
        end
    end

    debug_point 'antiaim_safe_head'

    local safe_head = { } do
        local ref = resource.antiaim.settings.safe_head

        local WEAPONTYPE_KNIFE = 0
        local FAR_DISTANCE_SQR = 1200 * 1200

        local function is_weapon_taser(weapon)
            return weapon:get_weapon_index() == 31
        end

        local function is_weapon_knife(weapon)
            if is_weapon_taser(weapon) then
                return false
            end

            local weapon_info = weapon:get_weapon_info()

            if weapon_info == nil then
                return false
            end

            return weapon_info.weapon_type == WEAPONTYPE_KNIFE
        end

        local function get_state()
            local me = entity.get_local_player()

            if me == nil then
                return nil
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return nil
            end

            local threat = entity.get_threat()

            if threat == nil then
                return nil
            end

            local is_knife = is_weapon_knife(weapon)
            local is_taser = is_weapon_taser(weapon)

            local in_air = not localplayer.is_onground
            local is_moving = localplayer.is_moving
            local is_crouched = localplayer.is_crouched
            local is_onground = localplayer.is_onground

            local my_origin = me:get_origin()
            local threat_origin = threat:get_origin()

            local delta = my_origin - threat_origin
            local lengthsqr = delta:lengthsqr()

            local target_height = ref.target_height:get()

            if delta.z >= target_height and is_knife and in_air and is_crouched and ref.select:get 'Air Crouch Knife' then
                return 'Air Crouch Knife'
            end

            if delta.z >= target_height and is_taser and in_air and is_crouched and ref.select:get 'Air Crouch Taser' then
                return 'Air Crouch Taser'
            end

            if delta.z >= 50 and (is_onground and not is_moving or is_crouched) and ref.select:get 'Height Advantage' then
                return 'Height Advantage'
            end

            if lengthsqr > FAR_DISTANCE_SQR and (not is_moving and is_crouched) and ref.select:get 'Crouch' then
                return 'Crouch'
            end

            return nil
        end

        local function update_values(cmd, state)
            -- there you can make state
            -- presets, if you want it

            buffer.pitch = 'Down'
            buffer.yaw_base = 'At Target'

            buffer.yaw = 'Backward'
            buffer.yaw_offset = 22

            buffer.yaw_left = 0
            buffer.yaw_right = 0

            buffer.yaw_modifier = 'Off'
            buffer.modifier_offset = 0

            buffer.body_yaw = true
            buffer.inverter = false
            buffer.left_limit = 60
            buffer.right_limit = 60
            buffer.options = { }
            buffer.freestanding_body_yaw = 'Off'

            buffer.delay = nil

            if ref.e_spam_while_safe_head:get() then
                local buffer_ctx = { }

                buffer.hidden = true

                buffer_ctx.pitch_offset = 0
                buffer_ctx.yaw_offset = 180

                software.ragebot.main.hide_shots[2]:override('Break LC')
                software.ragebot.main.double_tap[2]:override('Always On')

                buffer.defensive = buffer_ctx
            end
        end

        function safe_head:update(cmd)
            if not ref.enabled:get() then
                return false
            end

            local state = get_state()

            if state == nil then
                return false
            end

            update_values(cmd, state)
            return true
        end
    end

    debug_point 'antiaim_auto_teleport'

    local auto_teleport = { } do
        local ref = resource.antiaim.settings.auto_teleport

        local WEAPONTYPE_PISTOL        = 1
        local WEAPONTYPE_SUBMACHINEGUN = 2
        local WEAPONTYPE_RIFLE         = 3
        local WEAPONTYPE_SNIPER_RIFLE  = 5

        local already_teleported = false

        local function get_state()
            if not localplayer.is_onground then
                if localplayer.is_crouched then
                    return 'In Air & Duck'
                end

                return 'In Air'
            end

            return nil
        end

        local function get_weapon_type(weapon)
            local weapon_info = weapon:get_weapon_info()

            if weapon_info == nil then
                return nil
            end

            local weapon_type = weapon_info.weapon_type
            local weapon_index = weapon:get_weapon_index()

            if weapon_type == WEAPONTYPE_SUBMACHINEGUN then
                return 'SMG'
            end

            if weapon_type == WEAPONTYPE_RIFLE then
                return 'Rifles'
            end

            if weapon_type == WEAPONTYPE_PISTOL then
                if weapon_index == 1 then
                    return 'Desert Eagle'
                end

                if weapon_index == 64 then
                    return 'Revolver R8'
                end

                return 'Pistols'
            end

            if weapon_type == WEAPONTYPE_SNIPER_RIFLE then
                if weapon_index == 40 then
                    return 'Scout'
                end

                if weapon_index == 9 then
                    return 'AWP'
                end

                return 'Auto Snipers'
            end

            return nil
        end

        local function is_vulnerable()
            return entity.get_threat(true) ~= nil
        end

        local function should_teleport(cmd, player, weapon)
            if rage.exploit:get() ~= 1.0 then
                return false
            end

            local weapon_type = get_weapon_type(weapon)

            if weapon_type == nil then
                return false
            end

            if not ref.weapons:get(weapon_type) then
                return false
            end

            local state = get_state()

            if not ref.select:get(state) then
                return false
            end

            return true
        end

        local function on_createmove(cmd)
            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return
            end

            if is_vulnerable() then
                if should_teleport(cmd, me, weapon) then
                    if not already_teleported then
                        already_teleported = true

                        rage.exploit:force_teleport()
                    end
                end

                return
            end

            already_teleported = false
        end

        on_createmove = create_debug_callback('auto_teleport.on_createmove', on_createmove)

        local callbacks do
            local function on_enabled(item)
                events.createmove(on_createmove, item:get())
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    local function get_player_team()
        if localplayer.team_num == 2 then
            return 'T'
        end

        if localplayer.team_num == 3 then
            return 'CT'
        end

        return nil
    end

    local function get_exploits_value(offset, id)
        local list = {
            [1] = -offset,
            [2] = -offset / 2,
            [3] = -offset / 3,
            [4] = offset / 3,
            [5] = offset / 2,
            [6] = offset
        }

        return list[id]
    end

    local function update_inverter(cmd)
        if cmd.choked_commands ~= 0 then
            return
        end

        if rage.exploit:get() == 1.0 then
            local delay = math.max(
                1, buffer.delay or 1
            )

            default_delay = default_delay + 1

            if default_delay < delay then
                return
            end
        end

        local should_invert = true

        if buffer.invert_chance ~= nil then
            should_invert = false

            if buffer.invert_chance >= utils.random_int(1, 100) then
                should_invert = true
            end
        end

        inverts = inverts + 1

        if should_invert then
            inverted = not inverted
        end

        default_delay = 0
    end

    local function update_defensive_inverter()
        local hidden = buffer.defensive

        local delay = 1

        if hidden ~= nil and hidden.delay ~= nil then
            delay = math.max(1, hidden.delay)
        end

        defensive_delay = defensive_delay + 1

        if defensive_delay < delay then
            return
        end

        defensive_inverts = defensive_inverts + 1
        defensive_inverted = not defensive_inverted

        defensive_delay = 0
    end

    local function update_defensive()
        local hidden = buffer.defensive

        if hidden == nil then
            return
        end

        if hidden.pitch_offset ~= nil then
            rage.antiaim:override_hidden_pitch(hidden.pitch_offset)
        end

        if hidden.yaw_offset ~= nil then
            local yaw = hidden.yaw_offset

            if buffer.yaw_offset ~= nil then
                yaw = yaw - buffer.yaw_offset
            end

            if hidden.yaw_left ~= nil and defensive_inverted == true then
                yaw = yaw + hidden.yaw_left
            end

            if hidden.yaw_right ~= nil and defensive_inverted == false then
                yaw = yaw + hidden.yaw_right
            end

            if hidden.yaw_modifier == 'Offset' then
                local offset = hidden.modifier_offset

                if not defensive_inverted then
                    offset = 0
                end

                yaw = yaw + offset
            end

            if hidden.yaw_modifier == 'Center' then
                local offset = hidden.modifier_offset * 0.5

                if not defensive_inverted then
                    offset = -offset
                end

                yaw = yaw + offset
            end

            if hidden.yaw_modifier == 'Skitter' then
                local offset = hidden.modifier_offset

                local index = defensive_inverts % #skitter
                local multiplier = skitter[index + 1]

                yaw = yaw + offset * multiplier
            end

            rage.antiaim:override_hidden_yaw_offset(-yaw)
        end
    end

    local function update_yaw_offset()
        if buffer.yaw_left ~= nil and buffer.yaw_right ~= nil then
            local yaw = buffer.yaw_offset or 0

            if buffer.inverter == true then
                buffer.yaw_offset = yaw + buffer.yaw_left
            end

            if buffer.inverter == false then
                buffer.yaw_offset = yaw + buffer.yaw_right
            end

            return
        end
    end

    local function update_yaw_modifier()
        if buffer.yaw_modifier == 'Offset' then
            local yaw = buffer.yaw_offset or 0
            local offset = buffer.modifier_offset

            buffer.yaw_modifier = 'Disabled'
            buffer.modifier_offset = 0

            buffer.yaw_offset = yaw + (inverted and offset or 0)

            return
        end

        if buffer.yaw_modifier == 'Center' then
            local yaw = buffer.yaw_offset or 0
            local offset = -buffer.modifier_offset

            if not inverted then
                offset = -offset
            end

            buffer.yaw_modifier = 'Disabled'
            buffer.modifier_offset = 0

            buffer.yaw_offset = yaw + offset / 2

            return
        end

        if buffer.yaw_modifier == 'Skitter' then
            local index = inverts % #skitter
            local multiplier = skitter[index + 1]

            local yaw = buffer.yaw_offset or 0
            local offset = buffer.modifier_offset

            buffer.yaw_modifier = 'Disabled'
            buffer.modifier_offset = 0

            buffer.yaw_offset = yaw + (offset * multiplier)

            return
        end

        if buffer.yaw_modifier == 'Spin' then
            local time = globals.curtime * 3

            local yaw = buffer.yaw_offset or 0
            local offset = buffer.modifier_offset

            buffer.yaw_modifier = 'Disabled'
            buffer.modifier_offset = 0

            buffer.yaw_offset = yaw + aux.lerp(
                -offset, offset, time % 1
            )

            return
        end

        if buffer.yaw_modifier == 'Random' then
            local yaw = buffer.yaw_offset or 0
            local offset = buffer.modifier_offset

            buffer.yaw_modifier = 'Disabled'
            buffer.modifier_offset = 0

            buffer.yaw_offset = yaw + utils.random_int(
                -offset, offset
            )

            return
        end

        if buffer.yaw_modifier == '3-Way' then
            local yaw = buffer.yaw_offset or 0
            local offset = buffer.modifier_offset

            local pattern = { -1.0, 0.0, 1.0 }
            local index = localplayer.sent_packets % #pattern

            local multiplier = pattern[index + 1]

            buffer.yaw_modifier = 'Disabled'
            buffer.modifier_offset = 0

            buffer.yaw_offset = yaw + offset * multiplier

            return
        end

        if buffer.yaw_modifier == '5-Way' then
            local yaw = buffer.yaw_offset or 0
            local offset = buffer.modifier_offset

            local pattern = { -1.0, -0.5, 0.0, 0.5, 1.0 }
            local index = localplayer.sent_packets % #pattern

            local multiplier = pattern[index + 1]

            buffer.yaw_modifier = 'Disabled'
            buffer.modifier_offset = 0

            buffer.yaw_offset = yaw + offset * multiplier

            return
        end

        if buffer.yaw_modifier == 'Frost' then
            local offset = buffer.modifier_offset

            local index = (localplayer.sent_packets % 6) + 1
            local value = get_exploits_value(offset, index)

            buffer.yaw_modifier = '3-Way'
            buffer.modifier_offset = value
        end

        if buffer.yaw_modifier == 'Frostbomber' then
            local modifier_value = '3-Way'

            if localplayer.sent_packets % math.random(3, 4) == 0 then
                local random = math.random(0, 6)

                if random == 0 then
                    modifier_value = '5-way'
                else
                    modifier_value = 'Random'
                end
            end

            buffer.yaw_modifier = modifier_value
        end
    end

    local function update_body_yaw()
        if buffer.options == nil then
            return
        end

        local is_jitter = false
        local new_options = { }

        for i = 1, #buffer.options do
            local option = buffer.options[i]

            if option == 'Jitter' then
                is_jitter = true
                goto continue
            end

            if option == 'Randomize Jitter' then
                goto continue
            end

            table.insert(new_options, option)
            ::continue::
        end

        if is_jitter then
            buffer.inverter = inverted
        end

        buffer.options = new_options
    end

    local function update_antiaim(cmd)
        local team = get_player_team()

        if team == nil then
            return
        end

        avoid_backstab:update()
        defensive:update(cmd)

        local items = builder:update(cmd, team) do
            antibrute:update(cmd, items)
        end

        local on_peek_items = builder:get(team, 'On Peek')

        if manual_yaw:update(cmd) then
            return
        end

        if freestanding:update(cmd, team) then
            return
        end

        if safe_head:update(cmd) then
            return
        end

        if edge_yaw:update(cmd) then
            return
        end

        if items ~= nil and items.defensive ~= nil then
            if not defensive_flick:apply(cmd, items.flick) then
                defensive:apply(cmd, items.defensive)
            end
        end

        if on_peek_items ~= nil and builder:is_active_ex(on_peek_items) then
            if entity.get_threat(true) then
                defensive:apply(cmd, on_peek_items.defensive)
            end
        end

        disablers:update(cmd)
    end

    local function update_buffer(cmd)
        rage.antiaim:override_hidden_yaw_offset(0)

        update_inverter(cmd)

        if cmd.choked_commands == 0 then
            update_defensive_inverter()
        end

        update_body_yaw()
        update_yaw_modifier()
        update_yaw_offset()
        update_defensive()
    end

    local function on_shutdown()
        buffer:unset()
    end

    local function on_createmove(cmd)
        buffer:clear()
        buffer:unset()

        update_antiaim(cmd)
        update_buffer(cmd)

        buffer:set()
    end

    on_shutdown = create_debug_callback('antiaim.on_shutdown', on_shutdown)
    on_createmove = create_debug_callback('antiaim.on_createmove', on_createmove)

    events.shutdown(on_shutdown)
    events.createmove(on_createmove)
end

debug_point 'begin_ragebot'

local ragebot do
    debug_point 'ragebot_smart_peek'

    local smart_peek do
        local ref = resource.ragebot.smart_peek

        local FL_ONGROUND = bit.lshift(1, 0)

        local HITGROUP_GENERIC  = 0
        local HITGROUP_HEAD     = 1
        local HITGROUP_CHEST    = 2
        local HITGROUP_STOMACH  = 3
        local HITGROUP_LEFTARM  = 4
        local HITGROUP_RIGHTARM	= 5
        local HITGROUP_LEFTLEG  = 6
        local HITGROUP_RIGHTLEG	= 7
        local HITGROUP_GEAR     = 10

        local HITBOX_HEAD            = 0
        local HITBOX_NECK            = 1
        local HITBOX_PELVIS          = 2
        local HITBOX_STOMACH         = 3
        local HITBOX_LOWER_CHEST     = 4
        local HITBOX_CHEST           = 5
        local HITBOX_UPPER_CHEST     = 6
        local HITBOX_RIGHT_THIGH     = 7
        local HITBOX_LEFT_THIGH      = 8
        local HITBOX_RIGHT_CALF      = 9
        local HITBOX_LEFT_CALF       = 10
        local HITBOX_RIGHT_FOOT      = 11
        local HITBOX_LEFT_FOOT       = 12
        local HITBOX_RIGHT_HAND      = 13
        local HITBOX_LEFT_HAND       = 14
        local HITBOX_RIGHT_UPPER_ARM = 15
        local HITBOX_RIGHT_FOREARM   = 16
        local HITBOX_LEFT_UPPER_ARM  = 17
        local HITBOX_LEFT_FOREARM    = 18

        local to_hitgroups = {
            [HITBOX_HEAD] = HITGROUP_HEAD,

            [HITBOX_CHEST] = HITGROUP_CHEST,
            [HITBOX_STOMACH] = HITGROUP_STOMACH,

            [HITBOX_LEFT_THIGH] = HITGROUP_LEFTLEG,
            [HITBOX_RIGHT_THIGH] = HITGROUP_RIGHTLEG,

            [HITBOX_LEFT_FOOT] = HITGROUP_LEFTLEG,
            [HITBOX_RIGHT_FOOT] = HITGROUP_RIGHTLEG,

            [HITBOX_LEFT_UPPER_ARM] = HITGROUP_LEFTARM,
            [HITBOX_RIGHT_UPPER_ARM] = HITGROUP_RIGHTARM
        }

        local data = nil

        local rate_time = 0
        local retreat_pos = nil

        local ragebot = { } do
            local function get_layout(weapon)
                local list = { }

                list.selection = {
                    head_scale = ui.find('Aimbot', 'Ragebot', 'Selection', weapon, 'Multipoint', 'Head Scale'),
                    body_scale = ui.find('Aimbot', 'Ragebot', 'Selection', weapon, 'Multipoint', 'Body Scale'),

                    min_damage = ui.find('Aimbot', 'Ragebot', 'Selection', weapon, 'Min. Damage'),
                    hit_chance = ui.find('Aimbot', 'Ragebot', 'Selection', weapon, 'Hit Chance')
                }

                list.safety = {
                    body_aim = ui.find('Aimbot', 'Ragebot', 'Safety', weapon, 'Body Aim'),
                    safe_points = ui.find('Aimbot', 'Ragebot', 'Safety', weapon, 'Safe Points'),
                    ensure_hitbox_safety = ui.find('Aimbot', 'Ragebot', 'Safety', weapon, 'Ensure Hitbox Safety')
                }

                return list
            end

            ragebot['SSG-08'] = get_layout 'SSG-08'
            ragebot['Deagle'] = get_layout 'Desert Eagle'
            ragebot['Pistols'] = get_layout 'Pistols'
        end

        local function clear_data()
            data = nil
            rate_time = 0
            retreat_pos = nil
        end

        local function reset_peek()
            software.ragebot.main.double_tap[1]:override()
            software.ragebot.main.peek_assist[4]:override()

            for _, v in pairs(ragebot) do
                v.selection.head_scale:override()
                v.selection.body_scale:override()

                v.selection.hit_chance:override()

                v.safety.body_aim:override()
                v.safety.safe_points:override()
                v.safety.ensure_hitbox_safety:override()
            end
        end

        local function prepare_extra_features()
            local hitchance = ref.hit_chance:get()
            local unsafe_mode = ref.unsafety:get()

            software.ragebot.main.peek_assist[4]:override('On Shot')

            for _, v in pairs(ragebot) do
                v.selection.head_scale:override(100)
                v.selection.body_scale:override(100)

                if hitchance ~= -1 then
                    v.selection.hit_chance:override(hitchance)
                end

                if unsafe_mode then
                    v.safety.body_aim:override('Default')
                    v.safety.safe_points:override('Default')
                    v.safety.ensure_hitbox_safety:override({ })
                end
            end
        end

        local function get_hitbox_damage_mult(hitgroup)
            if hitgroup == HITGROUP_HEAD then
                return 4.0
            end

            if hitgroup == HITGROUP_STOMACH then
                return 1.25
            end

            if hitgroup == HITGROUP_LEFTLEG then
                return 0.75
            end

            if hitgroup == HITGROUP_RIGHTLEG then
                return 0.75
            end

            return 1.0
        end

        local function scale_damage(enemy, damage, hitgroup, weapon_armor_ratio)
            damage = damage * get_hitbox_damage_mult(hitgroup)

            if enemy.m_ArmorValue > 0 then
                if hitgroup == HITGROUP_HEAD then
                    if enemy.m_bHasHelmet then
                        damage = damage * (weapon_armor_ratio * 0.5)
                    end
                else
                    damage = damage * (weapon_armor_ratio * 0.5)
                end
            end

            return damage
        end

        local function simulate_damage(start_pos, end_pos, enemy, hitgroup, data)
            local delta = end_pos - start_pos

            local damage = data.damage
            local armor_ratio = data.armor_ratio

            local range = data.range
            local range_modifier = data.range_modifier

            local length = math.min(range, delta:length())

            damage = damage * math.pow(range_modifier, length * 0.002)
            damage = scale_damage(enemy, damage, hitgroup, armor_ratio)

            return damage
        end

        local function get_simulation_time()
            return ref.simulation:get() * 0.01
        end

        local function get_rate_limit()
            return ref.rate_limit:get() * 0.01
        end

        local function get_wish_damage()
            return software.ragebot.selection.min_damage:get()
        end

        local function get_range()
            return ref.dev_mode:get()
                and ref.range:get() or 20
        end

        local function get_retreat()
            return ref.dev_mode:get()
                and ref.retreat:get() or 25
        end

        local function get_hitbox_list()
            local list = { }

            if ref.hitboxes:get 'Head' then
                table.insert(list, HITBOX_HEAD)
            end

            if ref.hitboxes:get 'Chest' then
                table.insert(list, HITBOX_CHEST)
            end

            if ref.hitboxes:get 'Stomach' then
                table.insert(list, HITBOX_STOMACH)
            end

            if ref.hitboxes:get 'Arms' then
                table.insert(list, HITBOX_LEFT_UPPER_ARM)
                table.insert(list, HITBOX_RIGHT_UPPER_ARM)
            end

            if ref.hitboxes:get 'Legs' then
                table.insert(list, HITBOX_LEFT_THIGH)
                table.insert(list, HITBOX_RIGHT_THIGH)

                table.insert(list, HITBOX_LEFT_CALF)
                table.insert(list, HITBOX_RIGHT_CALF)
            end

            return list
        end

        local function get_hitgroup(hitbox)
            return to_hitgroups[hitbox]
                or HITGROUP_GENERIC
        end

        local function get_entity_ptr(entity)
            return entity[0]
        end

        local function get_weapon_type(weapon, weapon_info)
            local weapon_index = weapon:get_weapon_index()
            local weapon_type = weapon_info.weapon_type

            if weapon_index == 1 then
                return 'Deagle'
            end

            if weapon_index == 64 then
                return 'Revolver'
            end

            if weapon_index == 40 then
                return 'SSG-08'
            end

            if weapon_type == 1 then
                return 'Pistols'
            end

            return nil
        end

        local function get_wish_hitboxes(list, player, weapon, target, wish_damage)
            local hitboxes = { }

            local eye_pos = player:get_eye_position()
            local weapon_info = weapon:get_weapon_info()

            local target_health = target.m_iHealth

            for i = 1, #list do
                local hitbox = list[i]
                local hitgroup = get_hitgroup(hitbox)

                local pos = target:get_hitbox_position(hitbox)
                local damage = simulate_damage(eye_pos, pos, target, hitgroup, weapon_info)

                local cant_hit = damage < wish_damage
                local cant_kill = damage < target_health

                if cant_hit and cant_kill then
                    goto continue
                end

                table.insert(hitboxes, {
                    index = i,
                    pos = pos
                })

                ::continue::
            end

            return hitboxes
        end

        local function is_valid_player(player)
            if player == nil then
                return false
            end

            local ok, result = pcall(get_entity_ptr, player)

            if not ok or result == nil then
                return false
            end

            return true
        end

        local function is_valid_data(data)
            return is_valid_player(data.target)
        end

        local function is_key_released(cmd)
            return not cmd.in_forward
                and not cmd.in_back
                and not cmd.in_moveleft
                and not cmd.in_moveright
        end

        local function is_allowed_weapon(weapon)
            -- Here you can make check
            -- like if you wearing ssg08

            return ref.weapons:get(weapon)
        end

        local function is_player_ready(player, weapon, weapon_info)
            if player == nil or weapon == nil then
                return false
            end

            -- if weapon can't shot at all
            if weapon_info.max_clip1 == 0 or weapon.m_iClip1 == 0 then
                return false
            end

            if globals.curtime < player.m_flNextAttack then
                return false
            end

            if globals.curtime < weapon.m_flNextPrimaryAttack then
                return false
            end

            return true
        end

        local function should_update_data()
            -- Here you can add check
            -- like 'Only with DT'

            return true
        end

        local function create_data(ctx, target)
            local data = { }

            data.ctx = ctx
            data.target = target

            data.simtime = 0
            data.retreat = -1

            data.teleport = 0

            return data
        end

        local function create_sim_movement(player)
            return player:simulate_movement(
                nil, vector(), 0x01
            )
        end

        local function trace_bullet(from_player, from, to)
            local damage, tr = utils.trace_bullet(
                from_player, from, to, function(ent)
                    return ent ~= from_player
                        and ent:is_enemy()
                end
            )

            return damage, tr
        end

        local function get_trace_damage(player, target, eye_pos, hitboxes, wish_damage)
            local health = target.m_iHealth

            for i = 1, #hitboxes do
                local hitbox = hitboxes[i]

                local damage, tr = trace_bullet(
                    player, eye_pos, hitbox.pos
                )

                local can_hit = damage >= wish_damage
                local can_kill = damage >= health

                if can_hit or can_kill then
                    return true
                end
            end

            return false
        end

        local function update_sim_hitscan(ctx, player, target, hitboxes, wish_damage)
            local eye_pos = ctx.origin +
                vector(0, 0, ctx.view_offset)

            return ctx, get_trace_damage(
                player, target, eye_pos, hitboxes, wish_damage
            )
        end

        local function update_simulation(cmd, player, target, ctx, angle, hitboxes, wish_damage)
            cmd.view_angles.y = angle
            ctx:think(1)

            if bit.band(ctx.flags, FL_ONGROUND) == 0 then
                return nil, false
            end

            local _, found_damage = update_sim_hitscan(
                ctx, player, target, hitboxes, wish_damage
            )

            if found_damage then
                ctx:think(1)
            end

            return ctx, found_damage
        end

        local function update_peek_data(cmd, player, weapon)
            if not should_update_data() then
                return false
            end

            local dt = globals.frametime

            local rate_limit = get_rate_limit()
            local wish_damage = get_wish_damage()

            local hitbox_list = get_hitbox_list()

            if data ~= nil and is_valid_data(data) then
                local ctx = data.ctx
                local target = data.target

                local health = target.m_iHealth

                if wish_damage >= 100 then
                    wish_damage = wish_damage + health - 100
                end

                local hitboxes = get_wish_hitboxes(
                    hitbox_list, player, weapon, target, wish_damage
                )

                local _, found_damage = update_sim_hitscan(
                    ctx, player, target, hitboxes, wish_damage
                )

                if found_damage then
                    data.simtime = 0
                end

                data.simtime = data.simtime + dt
                return true
            end

            if rate_limit > 0 then
                if rate_time > 0 then
                    rate_time = rate_time - dt
                    return false
                end

                rate_time = rate_limit
            end

            -- skip if not planning to stay
            if not is_key_released(cmd) then
                return false
            end

            -- skip if player is in air
            local m_fFlags = player.m_fFlags

            if bit.band(m_fFlags, FL_ONGROUND) == 0 then
                return false
            end

            -- skip if speed 2d > 80
            local velocity = player.m_vecVelocity

            if velocity:length2dsqr() > (80 * 80) then
                return false
            end

            -- make new target
            local threat = entity.get_threat()

            if threat == nil or threat:is_dormant() then
                return false
            end

            local health = threat.m_iHealth

            if wish_damage >= 100 then
                wish_damage = wish_damage + health - 100
            end

            local hitboxes = get_wish_hitboxes(
                hitbox_list, player, weapon, threat, wish_damage
            )

            local is_hittable = get_trace_damage(
                player, threat, player:get_eye_position(), hitboxes, wish_damage
            )

            if is_hittable then
                return false
            end

            local left_angle, right_angle do
                local player_origin = player:get_origin()
                local threat_origin = threat:get_origin()

                local delta = threat_origin - player_origin
                local angles = delta:angles()

                local yaw = angles.y + 180

                left_angle = yaw - 90
                right_angle = yaw + 90
            end

            -- backup usercmd
            local old_viewangles = cmd.view_angles:clone()

            local old_forwardmove = cmd.forwardmove
            local old_sidemove = cmd.sidemove

            local old_in_duck = cmd.in_duck
            local old_in_jump = cmd.in_jump
            local old_in_speed = cmd.in_speed

            -- setting up usercmd
            cmd.forwardmove = 450
            cmd.sidemove = 0

            cmd.in_duck = false
            cmd.in_jump = false
            cmd.in_speed = false

            -- creating context
            local left_ctx = create_sim_movement(player)
            local right_ctx = create_sim_movement(player)

            local left_step = 0
            local right_step = 0

            for i = 1, get_range() do
                if left_step ~= -1 then
                    left_step = i

                    local ctx, found_damage = update_simulation(
                        cmd, player, threat, left_ctx, left_angle, hitboxes, wish_damage
                    )

                    if ctx == nil then
                        left_step = -1
                    end

                    if found_damage then
                        data = create_data(
                            ctx, threat
                        )

                        break
                    end
                end

                if right_step ~= -1 then
                    right_step = i

                    local ctx, found = update_simulation(
                        cmd, player, threat, right_ctx, right_angle, hitboxes, wish_damage
                    )

                    if ctx == nil then
                        right_step = -1
                    end

                    if found then
                        data = create_data(
                            ctx, threat
                        )

                        break
                    end
                end
            end

            -- restore usercmd
            cmd.view_angles.y = old_viewangles.y

            cmd.forwardmove = old_forwardmove
            cmd.sidemove = old_sidemove

            cmd.in_duck = old_in_duck
            cmd.in_jump = old_in_jump
            cmd.in_speed = old_in_speed

            return data ~= nil
        end

        local function update_movement(cmd, player, dest)
            local origin = player:get_origin()
            local delta = dest - origin

            local lengthsqr = delta:length2dsqr()

            if lengthsqr < (5.0 * 5.0) then
                local velocity = player.m_vecVelocity

                local speed = velocity:length()
                local angles = velocity:angles()

                cmd.move_yaw = angles.y

                cmd.forwardmove = -speed
                cmd.sidemove = 0

                return true, lengthsqr
            end

            local angles = delta:angles()

            cmd.move_yaw = angles.y

            cmd.forwardmove = 450
            cmd.sidemove = 0

            return false, lengthsqr
        end

        local function block_movement_keys(cmd)
            cmd.in_duck = false
            cmd.in_jump = false
            cmd.in_speed = false

            cmd.in_forward = true
            cmd.in_back = false
            cmd.in_moveleft = false
            cmd.in_moveright = false
        end

        local function update_smart_peek(cmd, player, weapon, weapon_info)
            local is_ready = is_player_ready(
                player, weapon, weapon_info
            )

            local is_updated = update_peek_data(
                cmd, player, weapon
            )

            if data == nil then
                return
            end

            local simtime = get_simulation_time()

            if data.simtime > simtime then
                is_updated = false
            end

            if weapon_info.weapon_type == 5 and not player.m_bIsScoped then
                is_updated = false
            end

            if data.retreat <= 0 then
                if is_updated then
                    local ctx = data.ctx

                    if retreat_pos == nil then
                        local origin = player:get_origin()
                        local dir = ctx.origin - origin

                        dir:normalize()

                        local position = ctx.origin - dir * get_retreat()

                        local tr = utils.trace_hull(
                            origin,
                            position,
                            ctx.obb_mins,
                            ctx.obb_maxs,
                            player,
                            0x201400B,
                            0
                        )

                        retreat_pos = tr.end_pos
                    end

                    local is_quick_stop, lengthsqr = update_movement(
                        cmd, player, ctx.origin
                    )

                    local box_color = ref.color:get()

                    block_movement_keys(cmd)
                    prepare_extra_features()

                    data.retreat = 0

                    if is_quick_stop then
                        data.retreat = 1
                    end

                    debug_overlay.box_new(
                        ctx.origin,
                        ctx.obb_mins,
                        ctx.obb_maxs,
                        vector(),
                        color(0, 0, 0, 0),
                        box_color,
                        globals.tickinterval * 2
                    )

                    return
                end
            end

            if not is_ready then
                clear_data()
                return
            end

            local ctx = data.ctx

            if ctx == nil or data.retreat == -1 then
                return
            end

            data.retreat = data.retreat + 1

            local is_quick_stop, lengthsqr = update_movement(
                cmd, player, retreat_pos
            )

            local origin = player:get_origin()
            local velocity = player.m_vecVelocity

            local delta = retreat_pos - origin
            local angles = delta:angles() - velocity:angles()

            local speedsqr = velocity:length2dsqr()

            block_movement_keys(cmd)
            prepare_extra_features()

            local should_teleport = true
                and speedsqr > (40 * 40)
                and math.abs(angles.y) < 20

            if should_teleport then
                rage.exploit:force_teleport()
                software.ragebot.main.double_tap[1]:override(false)
            end

            if is_ready and is_quick_stop then
                clear_data()
                reset_peek()
            end
        end

        local function on_createmove(cmd)
            if not software.ragebot.main.peek_assist[1]:get() then
                clear_data()
                reset_peek()

                return
            end

            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return
            end

            local weapon_info = weapon:get_weapon_info()

            if weapon_info == nil then
                return
            end

            local weapon_type = get_weapon_type(
                weapon, weapon_info
            )

            if not is_allowed_weapon(weapon_type) then
                clear_data()
                reset_peek()

                return
            end

            update_smart_peek(cmd, me, weapon, weapon_info)
        end

        local function on_aim_fire()
            if data == nil then
                return nil
            end

            clear_data()
        end

        on_aim_fire = create_debug_callback('smart_peek.on_aim_fire', on_aim_fire)
        on_createmove = create_debug_callback('smart_peek.on_createmove', on_createmove)

        local callbacks do
            local function on_enabled(item)
                local value = item:get()

                if not value then
                    clear_data()
                    reset_peek()
                end

                events.aim_fire(on_aim_fire, value)
                events.createmove(on_createmove, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'ragebot_dormant_aimbot'

    local dormant_aimbot do
        local ref = resource.ragebot.dormant_aimbot

        local ref_dormant_aimbot = ui.find(
            'Aimbot', 'Ragebot', 'Main', 'Enabled', 'Dormant Aimbot'
        )

        local WEAPONTYPE_SNIPER_RIFLE = 5

        local aim_target
        local aim_point
        local aim_hitbox
        local aim_damage
        local aim_accuracy

        local is_hit = false
        local is_shot = false

        local target_index = 1
        local round_started = 0.0

        local e_hitbox = {
            [0]  = 'Generic',
            [1]  = 'Head',
            [2]  = 'Chest',
            [3]  = 'Stomach',
            [4]  = 'Chest',
            [5]  = 'Chest',
            [6]  = 'Legs',
            [7]  = 'Legs',
            [8]  = 'Head',
            [10] = 'Gear'
        }

        local hitbox_indexes = {
            ['Head'] = 1,
            ['Chest'] = 2,
            ['Stomach'] = 3,
            ['Legs'] = 4
        }

        local hitbox_points = {
            {
                scale = 5,
                hitbox = 'Stomach',
                vec = vector(0, 0, 40)
            },

            {
                scale = 6,
                hitbox = 'Chest',
                vec = vector(0, 0, 50)
            },

            {
                scale = 3,
                hitbox = 'Head',
                vec = vector(0, 0, 58)
            },

            {
                scale = 4,
                hitbox = 'Legs',
                vec = vector(0, 0, 20)
            }
        }

        local function contains(list, value)
            for i = 1, #list do
                if list[i] == value then
                    return true
                end
            end

            return false
        end

        local function is_weapon_gun(type)
            return type >= 1 and type <= 6
        end

        local function get_aimbot_targets()
            local list = { }

            local player_resource = entity.get_player_resource()

            for i = 1, globals.max_players do
                local player = entity.get(i)

                if player == nil then
                    goto continue
                end

                local is_target_valid = player_resource.m_bConnected[i]
                    and player:is_enemy() and player:is_dormant()

                if not is_target_valid then
                    goto continue
                end

                table.insert(list, player)
                ::continue::
            end

            return list
        end

        local function create_multipoints(from, to, radius)

            local angles = from:to(to):angles()
            local radian = math.rad(angles.y + 90)

            local forward = vector(math.cos(radian), math.sin(radian), 0)
            local direction = forward * radius

            return {
                {
                    text = 'Middle',
                    vec = to
                },

                {
                    text = 'Left',
                    vec = to + direction
                },

                {
                    text = 'Right',
                    vec = to - direction
                }
            }
        end

        local function trace_bullet(player, start_pos, end_pos, skip)
            local damage, trace = utils.trace_bullet(player, start_pos, end_pos, skip)

            if trace ~= nil then
                local ent = trace.entity

                if ent == nil then
                    return 0, trace
                end

                if ent:is_player() and not ent:is_enemy() then
                    return 0, trace
                end
            end

            return damage, trace
        end

        local function on_createmove(e)
            ref_dormant_aimbot:override(false)

            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return
            end

            local weapon_info = weapon:get_weapon_info()

            if weapon_info == nil then
                return
            end

            local inaccuracy = weapon:get_inaccuracy()

            if inaccuracy == nil then
                return
            end

            local tickcount = globals.tickcount

            local eye_pos = me:get_eye_position()
            local simtime = me:get_simulation_time().current

            local onground = bit.band(me.m_fFlags, bit.lshift(1, 0)) ~= 0

            if tickcount < round_started then
                return
            end

            if e.in_jump and not onground then
                return
            end

            local weapon_type = weapon_info.weapon_type

            if not is_weapon_gun(weapon_type) or weapon.m_iClip1 <= 0 then
                return false
            end

            local targets = get_aimbot_targets()
            local hitboxes = ref.hitboxes:get()

            if tickcount % #targets ~= 0 then
                target_index = target_index + 1
            else
                target_index = 1
            end

            local target = targets[target_index]

            if target == nil then
                return
            end

            local bbox = target:get_bbox()
            local origin = target:get_origin()

            local duck_amount = target.m_flDuckAmount

            local hitchance = ref.alpha_modifier:get()
            local desired_damage = ref.minimum_damage:get()

            if desired_damage == 0 then
                desired_damage = software.ragebot.selection.min_damage:get()
            end

            if desired_damage >= 100 then
                desired_damage = desired_damage - 100 + target.m_iHealth
            end

            local points = { }

            for i = 1, #hitbox_points do
                local data = hitbox_points[i]

                local vec = data.vec
                local scale = data.scale
                local hitbox = data.hitbox

                if hitbox == 'Head' then
                    vec = vec - vector(0, 0, 10 * duck_amount)
                end

                if hitbox == 'Chest' then
                    vec = vec - vector(0, 0, 4 * duck_amount)
                end

                if #hitboxes ~= 0 then
                    local index = hitbox_indexes[hitbox]

                    if contains(hitboxes, index) then
                        table.insert(points, {
                            vec = vec,
                            scale = scale,
                            hitbox = hitbox
                        })
                    end
                else
                    table.insert(points, 1, {
                        vec = vec,
                        scale = scale,
                        hitbox = hitbox
                    })
                end
            end

            local is_available_to_shoot = weapon_info.is_revolver and weapon.m_flNextPrimaryAttack < simtime
                or math.max(me.m_flNextAttack, weapon.m_flNextPrimaryAttack, weapon.m_flNextSecondaryAttack) < simtime

            if not is_available_to_shoot then
                return
            end

            local found_pos
            local found_damage

            if hitchance >= math.floor(bbox.alpha * 100) + 5 then
                return
            end

            for j = 1, #points do
                local point = points[j]
                local multipoints = create_multipoints(eye_pos, origin + point.vec, point.scale)

                for k = 1, #multipoints do
                    local multipoint = multipoints[k]
                    local aimpoint = multipoint.vec

                    local damage, tr = trace_bullet(me, eye_pos, aimpoint, function(ent)
                        return ent == target
                    end)

                    if tr ~= nil and tr:is_visible() then
                        goto continue
                    end

                    if damage ~= 0 and desired_damage < damage then
                        found_pos = aimpoint
                        found_damage = damage

                        aim_target = target
                        aim_hitbox = point.hitbox
                        aim_damage = damage
                        aim_point = multipoint.text
                        aim_accuracy = bbox.alpha

                        break
                    end

                    ::continue::
                end

                if found_pos and found_damage then
                    break
                end
            end

            if not found_pos or not found_damage then
                return
            end

            local angles = eye_pos:to(found_pos):angles()

            e.block_movement = 1

            if true then
                local is_onground = not e.in_jump and onground

                local is_scoped = me.m_bIsScoped or me.m_bResumeZoom
                local is_sniper = weapon_info.weapon_type == WEAPONTYPE_SNIPER_RIFLE

                if not is_scoped and is_sniper and is_onground then
                    e.in_attack2 = true
                end
            end

            if inaccuracy < 0.01 then
                e.view_angles = angles
                e.in_attack = true

                is_shot = true
            end
        end

        local function on_weapon_fire(e)
            utils.execute_after(0.03, function()
                if entity.get(e.userid, true) == entity.get_local_player() then
                    if is_shot and not is_hit then
                        events['dormant_miss']:call {
                            userid = aim_target,
                            aim_hitbox = aim_hitbox,
                            aim_damage = aim_damage,
                            aim_point = aim_point,
                            accuracy = aim_accuracy
                        }
                    end

                    is_hit = false
                    is_shot = false

                    aim_target = nil
                    aim_hitbox = nil
                    aim_damage = nil
                    aim_point = nil
                    aim_accuracy = nil
                end
            end)
        end

        local function on_player_hurt(e)
            local me = entity.get_local_player()

            local userid = entity.get(e.userid, true)
            local attacker = entity.get(e.attacker, true)

            if userid == nil or attacker ~= me then
                return
            end

            local bbox = userid:get_bbox()

            if bbox == nil then
                return
            end

            if userid:is_dormant() and is_shot == true then
                is_hit = true

                events['dormant_hit']:call {
                    userid = userid,
                    attacker = attacker,
                    health = e.health,
                    armor = e.armor,
                    weapon = e.weapon,
                    dmg_health = e.dmg_health,
                    dmg_armor = e.dmg_armor,
                    hitgroup = e.hitgroup,
                    accuracy = bbox.alpha,
                    hitbox = e_hitbox[e.hitgroup],
                    aim_point = aim_point,
                    aim_hitbox = aim_hitbox,
                    aim_damage = aim_damage
                }
            end
        end

        local function on_shutdown()
            ref_dormant_aimbot:override()
        end

        on_shutdown = create_debug_callback('dormant_aimbot.on_shutdown', on_shutdown)
        on_createmove = create_debug_callback('dormant_aimbot.on_createmove', on_createmove)

        on_weapon_fire = create_debug_callback('dormant_aimbot.on_weapon_fire', on_weapon_fire)
        on_player_hurt = create_debug_callback('dormant_aimbot.on_player_hurt', on_player_hurt)

        local callbacks do
            local function on_enabled(item)
                local value = item:get()

                if not value then
                    ref_dormant_aimbot:override()
                end

                events.shutdown(on_shutdown, value)
                events.createmove(on_createmove, value)

                events.weapon_fire(on_weapon_fire, value)
                events.player_hurt(on_player_hurt, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'ragebot_aimbot_logs'

    local aimbot_logs do
        local ref = resource.ragebot.aimbot_logs

        local MUSEO_500 = render.load_font('museo500', 16, 'a')

        local ACT = {
            ['hegrenade'] = 'Naded',
            ['inferno'] = 'Burned',
            ['knife'] = 'Knifed',
        }

        local e_hitgroup = {
            [0]  = 'generic',
            [1]  = 'head',
            [2]  = 'chest',
            [3]  = 'stomach',
            [4]  = 'left arm',
            [5]  = 'right arm',
            [6]  = 'left leg',
            [7]  = 'right leg',
            [8]  = 'neck',
            [10] = 'gear'
        }

        local render_queue = { }

        local function wrap_color(text, hex)
            return string.format(
                '\a%s%s\aDEFAULT',
                hex, text
            )
        end

        local function get_prefix(hex, info)
            local left_br = info.prefix_brackets:sub(1, 1)
            local right_br = info.prefix_brackets:sub(2, 2)

            local prefix = info.prefix

            if info.has_prefix_brackets then
                prefix = left_br .. prefix .. right_br
            end

            if info.has_prefix_color then
                prefix = wrap_color(prefix, hex)
            end

            return prefix
        end

        local function get_render_hit_color()
            if not ref.customize:get() then
                return color(168, 201, 228, 255)
            end

            return ref.render_colors:get 'Hit' [1]
        end

        local function get_render_miss_color()
            if not ref.customize:get() then
                return color(227, 168, 168, 255)
            end

            return ref.render_colors:get 'Miss' [1]
        end

        local function get_flag_list(value)
            local result = { }
            local buffer = { }

            local i, length = 1, #value
            local in_string = false

            while i <= length do
                local char = value:sub(i, i)

                if char == '"' then
                    in_string = not in_string
                end

                if char == '\x20' and not in_string then
                    if #buffer > 0 then
                        table.insert(result, table.concat(buffer, ''))

                        for j = 1, #buffer do
                            buffer[j] = nil
                        end
                    end

                    goto continue
                end

                table.insert(buffer, char)

                ::continue::
                i = i + 1
            end

            if next(buffer) ~= nil then
                table.insert(result, table.concat(buffer, ''))
            end

            return result
        end

        local function get_construct_info(value)
            local info = {
                prefix = 'frost',
                brackets = '()',
                prefix_brackets = '[]',
                hit_name = 'Hit',
                backtrack_name = 'backtrack',
                hitchance_name = 'hc',
                damage_limiter = ': ',
                hitchance_limiter = ': ',
                backtrack_limiter = ': ',
                spread_limiter = ': ',
                has_color = true,
                has_prefix = true,
                has_prefix_color = true,
                has_percentage = true,
                has_brackets = true,
                has_prefix_brackets = true,
                has_mismatch = true,
                has_history = true,
                has_hitchance = true,
                has_spread_in_events = false,
                has_color_in_hitchance = true,
                backtrack_ms = false
            }

            local flags = get_flag_list(value)

            for i = 1, #flags do
                local flag = flags[i]

                local prefix_match = flag:match '^pr="([^"]+)"'
                local hit_match = flag:match '^hit="([^"]+)"'
                local backtrack_match = flag:match '^backtrack="([^"]+)"'
                local hitchance_match = flag:match '^hitchance="([^"]+)"'
                local limiter_match = flag:match '^limiter="([^"]+)"'

                if flag == 'prbr=()' then
                    info.prefix_brackets = '()'
                end

                if prefix_match ~= nil then
                    info.prefix = prefix_match
                end

                if hit_match ~= nil then
                    info.hit_name = hit_match
                end

                if backtrack_match ~= nil then
                    info.backtrack_name = backtrack_match
                end

                if hitchance_match ~= nil then
                    info.hitchance_name = hitchance_match
                end

                if limiter_match ~= nil then
                    info.damage_limiter = limiter_match
                    info.hitchance_limiter = limiter_match
                    info.backtrack_limiter = limiter_match
                    info.spread_limiter = limiter_match
                end

                if flag == 'rprc' then
                    info.has_prefix_color = false
                end

                if flag == 'rc' then
                    info.has_color = false
                end

                if flag == 'rp' then
                    info.has_prefix = false
                end

                if flag == 'rb' then
                    info.has_brackets = false
                end

                if flag == 'rpb' then
                    info.has_prefix_brackets = false
                end

                if flag == 'rm' then
                    info.has_mismatch = false
                end

                if flag == 'rch' then
                    info.has_color_in_hitchance = false
                end

                if flag == 'rhc' then
                    info.has_hitchance = false
                end

                if flag == 'rbt' then
                    info.has_history = false
                end

                if flag == 'btms' then
                    info.backtrack_ms = true
                end

                if flag == 'spr' then
                    info.has_spread_in_events = true
                end
            end

            return info
        end

        local function construct_hit_log(info, data, hex)
            local buffer = { }

            local left_bracket = ' '
            local right_bracket = ''

            local separator = ' '

            local target_str = data.name
            local damage_str = data.damage
            local hitgroup_str = data.hitgroup
            local hitchance_str = data.hitchance
            local backtrack_str = string.format('%d', data.backtrack)

            if info.backtrack_ms then
                backtrack_str = string.format('%dms', to_time(data.backtrack) * 1000)
            end

            if info.has_color then
                target_str = wrap_color(target_str, hex)
                damage_str = wrap_color(damage_str, hex)
                hitgroup_str = wrap_color(hitgroup_str, hex)

                if info.has_color_in_hitchance then
                    hitchance_str = wrap_color(hitchance_str, hex)
                end

                backtrack_str = wrap_color(backtrack_str, hex)

                separator = wrap_color(separator, hex)
            end

            if info.has_percentage then
                local percent = '%'

                if info.has_color then
                    percent = wrap_color(percent, hex)
                end

                hitchance_str = hitchance_str .. percent
            end

            if info.has_brackets and #info.brackets > 1 then
                left_bracket = info.brackets:sub(1, 1)
                right_bracket = info.brackets:sub(2, 2)
            end

            if info.has_mismatch then
                -- if data.damage ~= data.wanted_damage then
                --     local current = data.damage
                --     local wanted = data.wanted_damage

                --     if info.has_color then
                --         current = wrap_color(current, hex)
                --         wanted = wrap_color(wanted, hex)
                --     end

                --     damage_str = current .. left_bracket .. wanted .. right_bracket
                -- end

                if data.hitgroup ~= data.wanted_hitgroup then
                    local current = data.hitgroup
                    local wanted = data.wanted_hitgroup

                    if info.has_color then
                        current = wrap_color(current, hex)
                        wanted = wrap_color(wanted, hex)
                    end

                    hitgroup_str = current .. left_bracket .. wanted .. right_bracket
                end
            end

            table.insert(buffer, string.format(
                '%s %s in the %s',
                info.hit_name,
                target_str,
                hitgroup_str
            ))

            local backtrack_text = info.backtrack_name

            if info.has_hitchance then
                table.insert(buffer, string.format(
                    '(%s%s%s)',
                    info.hitchance_name,
                    info.hitchance_limiter,
                    hitchance_str
                ))
            end

            table.insert(buffer, string.format(
                '(%s%s%s)',
                'damage',
                info.damage_limiter,
                damage_str
            ))

            if info.has_history then
                table.insert(buffer, string.format(
                    '(%s%s%s)',
                    backtrack_text,
                    info.backtrack_limiter,
                    backtrack_str
                ))
            end

            if data.spread ~= nil then
                local spread_str = string.format(
                    '%.2f°', data.spread
                )

                if info.has_color then
                    spread_str = wrap_color(
                        spread_str, hex
                    )
                end

                table.insert(buffer, string.format(
                    '(spread%s%s)',
                    info.spread_limiter,
                    spread_str
                ))
            end

            local result = table.concat(
                buffer, separator
            )

            if info.has_prefix then
                local prefix = get_prefix(hex, info)

                result = string.format(
                    '%s %s', prefix, result
                )
            end

            return result
        end

        local function construct_miss_log(info, data, hex)
            local buffer = { }

            local left_bracket = ''
            local right_bracket = ''

            local separator = ' '

            local target_str = data.name
            local damage_str = data.damage
            local reason_str = data.reason
            local hitgroup_str = data.hitgroup
            local hitchance_str = data.hitchance
            local backtrack_str = string.format('%d', data.backtrack)

            if info.has_brackets and #info.brackets > 1 then
                left_bracket = info.brackets:sub(1, 1)
                right_bracket = info.brackets:sub(2, 2)
            end

            if info.backtrack_ms then
                backtrack_str = string.format('%dms', to_time(data.backtrack) * 1000)
            end

            if info.has_color then
                target_str = wrap_color(target_str, hex)
                damage_str = wrap_color(damage_str, hex)
                reason_str = wrap_color(reason_str, hex)
                hitgroup_str = wrap_color(hitgroup_str, hex)

                if info.has_color_in_hitchance then
                    hitchance_str = wrap_color(hitchance_str, hex)
                end

                backtrack_str = wrap_color(backtrack_str, hex)

                separator = wrap_color(separator, hex)
            end

            if info.has_percentage then
                local percent = '%'

                if info.has_color then
                    percent = wrap_color(percent, hex)
                end

                hitchance_str = hitchance_str .. percent
            end

            table.insert(buffer, string.format(
                'Missed %s in the %s due to %s',
                target_str,
                hitgroup_str,
                reason_str
            ))

            local backtrack_text = info.backtrack_name

            if info.has_hitchance then
                table.insert(buffer, string.format(
                    '(%s%s%s)',
                    info.hitchance_name,
                    info.hitchance_limiter,
                    hitchance_str
                ))
            end

            table.insert(buffer, string.format(
                '(%s%s%s)',
                'damage',
                info.damage_limiter,
                damage_str
            ))

            if info.has_history then
                table.insert(buffer, string.format(
                    '(%s%s%s)',
                    backtrack_text,
                    info.backtrack_limiter,
                    backtrack_str
                ))
            end

            if data.spread ~= nil then
                local spread_str = string.format(
                    '%.2f°', data.spread
                )

                if info.has_color then
                    spread_str = wrap_color(
                        spread_str, hex
                    )
                end

                table.insert(buffer, string.format(
                    '(%s%s%s)',
                    'spread',
                    info.spread_limiter,
                    spread_str
                ))
            end

            local result = table.concat(
                buffer, separator
            )

            if info.has_prefix then
                local prefix = get_prefix(hex, info)

                result = string.format(
                    '%s %s', prefix, result
                )
            end

            return result
        end

        local function construct_hurt_log(info, data, hex)
            local buffer = { }

            local separator = ' ~ '

            local target_str = data.name
            local damage_str = data.damage
            local action_str = data.action

            if info.has_color then
                target_str = wrap_color(target_str, hex)
                damage_str = wrap_color(damage_str, hex)

                separator = wrap_color(separator, hex)
            end

            table.insert(buffer, string.format(
                '%s %s for %s damage',
                action_str,
                target_str,
                damage_str
            ))

            local result = table.concat(
                buffer, separator
            )

            if info.has_prefix then
                local prefix = get_prefix(hex, info)

                result = string.format(
                    '%s %s', prefix, result
                )
            end

            return result
        end

        local function clear_render_logs()
            for i = 1, #render_queue do
                render_queue[i] = nil
            end
        end

        local function create_render_log(type, text, color)
            local data = { }

			data.type = type
            data.text = text
            data.color = color
            data.alpha = 0.0
            data.liferemaining = 4.0

            return data
        end

        local function add_render_log(type, text, color)
            local data = create_render_log(
                type, text, color
            )

            table.insert(render_queue, data)

            if #render_queue > 6 then
                table.remove(render_queue, 1)
            end
        end

        local function get_padding()
            if ref.customize:get() then
                return ref.padding:get()
            end

            return 6
        end

        local function get_box_radius(pos_a, pos_b)
            if ref.customize:get() then
                if ref.radius:get() == 'Semi-circle' then
                    return math.abs(pos_b.y - pos_a.y) / 2
                end
            end

            return get_padding() + 2
        end

        local function draw_box(pos_a, pos_b, col, alpha)
            local box_color = col:clone()
            local box_radius = get_box_radius(pos_a, pos_b)

            box_color.r = box_color.r * 0.1
            box_color.g = box_color.g * 0.1
            box_color.b = box_color.b * 0.1

            box_color.a = 80 * alpha

            render.blur(pos_a, pos_b, 1.8, alpha, box_radius)
            render.rect(pos_a, pos_b, box_color, box_radius)
        end

        local function on_render()
            local GAP_BETWEEN = 6

            local padding_h = get_padding() + 4
            local padding_v = get_padding()

            local font, flags = MUSEO_500, ''

            local dt = globals.frametime
            local screen_size = render.screen_size()

            local position = vector(
                screen_size.x * 0.5,

                aux.lerp(
                    screen_size.y * 0.5 + 50,
                    screen_size.y - 200,
                    ref.offset_y:get() * 0.01
                )
            )

            local draw_list = { }

            for i = #render_queue, 1, -1 do
                local data = render_queue[i]

                data.liferemaining = data.liferemaining - dt

                if data.liferemaining <= 0 then
                    data.alpha = motion.interp(
                        data.alpha, 0.0, 0.075
                    )

                    if data.alpha <= 0 then
                        table.remove(render_queue, i)
                    end
                else
                    data.alpha = motion.interp(
                        data.alpha, 1.0, 0.075
                    )
                end
            end

            for i = 1, #render_queue do
                table.insert(draw_list, render_queue[i])
            end

            local ui_alpha = ui.get_alpha()

            if ui_alpha > 0 and next(draw_list) == nil then
                local target_name = script.user

                local damage = 89
                local hitgroup = 'stomach'

                local wanted_damage = 285
                local wanted_hitgroup = 'head'

                local reason = 'spread'

                local hit_preview do
                    local hit_color = get_render_hit_color()

                    local mismatch_color = hit_color:clone()
                    mismatch_color.a = mismatch_color.a * 0.5

                    local hit_hex = hit_color:to_hex()
                    local mismatch_hex = mismatch_color:to_hex()

                    local target_str = wrap_color(target_name, hit_hex)
                    local damage_str = wrap_color(damage, hit_hex)
                    local hitgroup_str = wrap_color(hitgroup, hit_hex)

                    if damage ~= wanted_damage then
                        damage_str = string.format(
                            '%s(%s)',
                            wrap_color(damage, hit_hex),
                            wrap_color(wanted_damage, mismatch_hex)
                        )
                    end

                    if hitgroup ~= wanted_hitgroup then
                        hitgroup_str = string.format(
                            '%s(%s)',
                            wrap_color(hitgroup, hit_hex),
                            wrap_color(wanted_hitgroup, mismatch_hex)
                        )
                    end

                    local result = string.format(
                        '%s\'s %s for %s dmg',
                        target_str, hitgroup_str, damage_str
                    )

                    local data = create_render_log(
                        'hit', result, hit_color
                    )

                    data.alpha = ui_alpha

                    table.insert(draw_list, data)
                end

                local miss_preview do
                    local miss_color = get_render_miss_color()
                    local miss_hex = miss_color:to_hex()

                    local target_str = wrap_color(target_name, miss_hex)
                    local hitgroup_str = wrap_color(hitgroup, miss_hex)
                    local reason_str = wrap_color(reason, miss_hex)

                    local result = string.format(
                        '%s\'s %s due to %s',
                        target_str, hitgroup_str, reason_str
                    )

                    local data = create_render_log(
                        'miss', result, miss_color
                    )

                    data.alpha = ui_alpha

                    table.insert(draw_list, data)
                end
            end

            for i = 1, #draw_list do
                local data = draw_list[i]

                local text = data.text
                local col = data.color
                local alpha = data.alpha

                local log_type = data.type

                local type_size = render.measure_text(font, flags, log_type)
                local text_size = render.measure_text(font, flags, text)

                local max_size = vector(
                    type_size.x + GAP_BETWEEN + 1 + GAP_BETWEEN + text_size.x,
                    math.max(type_size.y, text_size.y)
                )

                local rect_size = max_size + vector(
                    padding_h * 2, padding_v * 2
                )

                local rect_pos = position - rect_size * 0.5

                local text_pos = rect_pos + vector(
                    padding_h, padding_v
                )

                local text_color = col:clone()
                text_color.a = text_color.a * alpha

                draw_box(rect_pos, rect_pos + rect_size, col, alpha)

                render.text(font, text_pos, text_color, flags, log_type)
                text_pos.x = text_pos.x + type_size.x + GAP_BETWEEN

                render.rect(text_pos, text_pos + vector(1, text_size.y), color(255, 255, 255, 50 * alpha))
                text_pos.x = text_pos.x + 1 + GAP_BETWEEN

                render.text(font, text_pos, color(255, 255, 255, 255 * alpha), flags, text)

                position.y = position.y - (rect_size.y + 8) * alpha
            end
        end

        local function on_aim_hit(e)
            local target = e.target

            if target == nil then
                return
            end

            local target_name = target:get_name()

            local hitchance = e.hitchance or 0
            local backtrack = e.backtrack or 0

            local damage = e.damage or 0
            local hitgroup = e_hitgroup[e.hitgroup] or '?'

            local wanted_damage = e.wanted_damage or 0
            local wanted_hitgroup = e_hitgroup[e.wanted_hitgroup] or '?'

            local text_color = ref.default_colors:get('Hit')[1]

            if ref.output:get 'Console' then
                local hex = text_color:to_hex()

                local result do
                    local data = { }

                    data.name = target_name
                    data.damage = damage
                    data.wanted_damage = wanted_damage
                    data.hitgroup = hitgroup
                    data.wanted_hitgroup = wanted_hitgroup
                    data.hitchance = hitchance
                    data.backtrack = backtrack

                    if e.spread ~= nil then
                        data.spread = e.spread
                    end

                    local info = get_construct_info(
                        ref.custom_prefix:get()
                    )

                    result = construct_hit_log(
                        info, data, hex
                    )
                end

                print_raw(result)
            end

            if ref.output:get 'Events' then
                local hex = text_color:to_hex()

                local result do
                    local data = { }

                    data.name = target_name
                    data.damage = damage
                    data.wanted_damage = wanted_damage
                    data.hitgroup = hitgroup
                    data.wanted_hitgroup = wanted_hitgroup
                    data.hitchance = hitchance
                    data.backtrack = backtrack

                    local info = get_construct_info(
                        ref.custom_prefix:get()
                    )

                    if info.has_spread_in_events then
                        if e.spread ~= nil then
                            data.spread = e.spread
                        end
                    end

                    result = construct_hit_log(
                        info, data, hex
                    )
                end

                print_dev(result)
            end

            if ref.output:get 'Render' then
                local hit_color = get_render_hit_color()

                local mismatch_color = hit_color:clone()
                mismatch_color.a = mismatch_color.a * 0.5

                local hit_hex = hit_color:to_hex()
                local mismatch_hex = mismatch_color:to_hex()

                local target_str = wrap_color(target_name, hit_hex)
                local damage_str = wrap_color(damage, hit_hex)
                local hitgroup_str = wrap_color(hitgroup, hit_hex)

                if damage ~= wanted_damage then
                    damage_str = string.format(
                        '%s(%s)',
                        wrap_color(damage, hit_hex),
                        wrap_color(wanted_damage, mismatch_hex)
                    )
                end

                if hitgroup ~= wanted_hitgroup then
                    hitgroup_str = string.format(
                        '%s(%s)',
                        wrap_color(hitgroup, hit_hex),
                        wrap_color(wanted_hitgroup, mismatch_hex)
                    )
                end

                local result = string.format(
                    '%s\'s %s for %s dmg',
                    target_str, hitgroup_str, damage_str
                )

                add_render_log('hit', result, hit_color)
            end
        end

        local function on_aim_miss(e)
            local target = e.target

            if target == nil then
                return
            end

            local target_name = target:get_name()

            local hitchance = e.hitchance or 0
            local backtrack = e.backtrack or 0

            local reason = e.state or '?'

            local damage = e.wanted_damage or 0
            local hitgroup = e_hitgroup[e.wanted_hitgroup] or '?'

            local text_color = ref.default_colors:get('Miss')[1]

            if ref.output:get 'Console' then
                local hex = text_color:to_hex()

                local result do
                    local data = { }

                    data.name = target_name
                    data.damage = damage
                    data.reason = reason
                    data.hitgroup = hitgroup
                    data.hitchance = hitchance
                    data.backtrack = backtrack

                    if e.spread ~= nil then
                        data.spread = e.spread
                    end

                    local info = get_construct_info(
                        ref.custom_prefix:get()
                    )

                    result = construct_miss_log(
                        info, data, hex
                    )
                end

                print_raw(result)
            end

            if ref.output:get 'Events' then
                local hex = text_color:to_hex()

                local result do
                    local data = { }

                    data.name = target_name
                    data.damage = damage
                    data.reason = reason
                    data.hitgroup = hitgroup
                    data.hitchance = hitchance
                    data.backtrack = backtrack

                    local info = get_construct_info(
                        ref.custom_prefix:get()
                    )

                    if info.has_spread_in_events then
                        if e.spread ~= nil then
                            data.spread = e.spread
                        end
                    end

                    result = construct_miss_log(
                        info, data, hex
                    )
                end

                print_dev(result)
            end

            if ref.output:get 'Render' then
                local miss_color = get_render_miss_color()
                local miss_hex = miss_color:to_hex()

                local target_str = wrap_color(target_name, miss_hex)
                local hitgroup_str = wrap_color(hitgroup, miss_hex)
                local reason_str = wrap_color(reason, miss_hex)

                local result = string.format(
                    '%s\'s %s due to %s',
                    target_str, hitgroup_str, reason_str
                )

                add_render_log('miss', result, miss_color)
            end
        end

        local function on_aim_ack(e)
            if e.state == nil then
                on_aim_hit(e)
            else
                on_aim_miss(e)
            end
        end

        local function on_player_hurt(e)
            local me = entity.get_local_player()

            local userid = entity.get(e.userid, true)
            local attacker = entity.get(e.attacker, true)

            if me == userid or me ~= attacker then
                return
            end

            local action = ACT[
                e.weapon
            ]

            if action == nil then
                return
            end

            local damage = e.dmg_health
            local target_name = userid:get_name()

            local hex = ref.default_colors:get('Hit')[1]:to_hex()

            if ref.output:get 'Console' then
                local data = { }

                data.name = target_name
                data.damage = damage
                data.action = action

                local info = get_construct_info(
                    ref.custom_prefix:get()
                )

                local text = construct_hurt_log(
                    info, data, hex
                )

                print_raw(text)
            end

            if ref.output:get 'Events' then
                local data = { }

                data.name = target_name
                data.damage = damage
                data.action = action

                local info = get_construct_info(
                    ref.custom_prefix:get()
                )

                local text = construct_hurt_log(
                    info, data, hex
                )

                print_dev(text)
            end

            if ref.output:get 'Render' then
                local hit_color = get_render_hit_color()
                local hit_hex = hit_color:to_hex()

                local target_str = wrap_color(target_name, hit_hex)
                local damage_str = wrap_color(damage, hit_hex)

                local result = string.format(
                    '%s %s for %s dmg',
                    action, target_str, damage_str
                )

                add_render_log('hit', result, hit_color)
            end
        end

        on_render = create_debug_callback('ragebot_hitchance_modifier.on_render', on_render)
        on_aim_ack = create_debug_callback('ragebot_hitchance_modifier.on_aim_ack', on_aim_ack)
        on_player_hurt = create_debug_callback('ragebot_hitchance_modifier.on_player_hurt', on_player_hurt)

        local callbacks do
            local function on_output(item)
                local is_render = item:get 'Render'

                if not is_render then
                    clear_render_logs()
                end

                events.render(on_render, is_render)
            end

            local function on_enabled(item)
                local value = item:get()

                if not value then
                    clear_render_logs()

                    events.render(on_render, false)
                end

                if value then
                    ref.output:set_callback(on_output, true)
                else
                    ref.output:unset_callback(on_output)
                end

                events.aim_ack(on_aim_ack, value)
                events.player_hurt(on_player_hurt, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'ragebot_hitchance_modifier'

    local hitchance_modifier do
        local ref = resource.ragebot.hitchance_modifier
        local shared = session.hitchance

        local WEAPONIDX_SSG08 = 40

        local hitchance_ref = ui.find(
            'Aimbot', 'Ragebot', 'Selection', 'Hit Chance'
        )

        local aimbot_refs = { } do
            for i = 1, #ref.list do
                local weapon = ref.list[i]

                aimbot_refs[weapon] = {
                    hitchance = ui.find('Aimbot', 'Ragebot', 'Selection', weapon, 'Hit Chance'),
                    auto_scope = ui.find('Aimbot', 'Ragebot', 'Accuracy', weapon, 'Auto Scope')
                }
            end
        end

        local function is_bind_applied()
            local binds = ui.get_binds(true)

            for i = 1, #binds do
                local bind = binds[i]

                local value = bind.value
                local reference = bind.reference

                if reference:get() ~= value then
                    goto continue
                end

                if reference:id() == hitchance_ref:id() then
                    return true
                end

                ::continue::
            end

            return false
        end

        local function is_should_no_scope(player, threat, max_distance)
            if player.m_bIsScoped or threat == nil then
                return false
            end

            if max_distance == 1001 then
                return true
            end

            local player_origin = player:get_origin()
            local threat_origin = threat:get_origin()

            local delta = threat_origin - player_origin
            local distance = aux.to_foot(delta:length())

            return distance <= max_distance * 0.1
        end

        local function get_weapon_type(weapon)
            local index = weapon:get_weapon_index()

            local weapon_info = weapon:get_weapon_info()
            local weapon_type = weapon_info.weapon_type

            if weapon_type == 1 then
                if index == 1 then
                    return 'Desert Eagle'
                end

                if index == 64 then
                    return 'R8 Revolver'
                end
            end

            if weapon_type == 5 then
                if index == 9 then
                    return 'AWP'
                end

                if index == 40 then
                    return 'SSG-08'
                end

                return 'AutoSnipers'
            end

            return nil
        end

        local function unset_override()
            for i = 1, #ref.list do
                local weapon = ref.list[i]
                local refs = aimbot_refs[weapon]

                if refs == nil then
                    goto continue
                end

                refs.hitchance:override()
                refs.auto_scope:override()

                ::continue::
            end
        end

        local function update_hitchance()
            if is_bind_applied() then
                return
            end

            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return
            end

            local weapon_type = get_weapon_type(weapon)

            if weapon_type == nil then
                return
            end

            local refs = aimbot_refs[weapon_type]

            if refs == nil then
                return
            end

            local items = ref[weapon_type]

            if items == nil then
                return
            end

            local hitchance = nil

            local items_in_air = items['In Air']
            local items_no_scope = items['No Scope']

            if items_in_air ~= nil and items_in_air.enabled:get() then
                local value = items_in_air.value:get()

                if value ~= -1 and not localplayer.is_onground then
                    hitchance = value
                end
            end

            if items_no_scope ~= nil and items_no_scope.enabled:get() then
                local threat = entity.get_threat()

                local value = items_no_scope.value:get()
                local distance = items_no_scope.distance:get()

                if value ~= -1 and is_should_no_scope(me, threat, distance) then
                    hitchance = value
                    refs.auto_scope:override(false)
                end
            end

            if hitchance ~= nil then
                refs.hitchance:override(hitchance)
                shared.updated_this_tick = true
            end
        end

        local function on_shutdown()
            unset_override()
        end

        local function on_createmove()
            shared.updated_this_tick = false

            unset_override()
            update_hitchance()
        end

        on_shutdown = create_debug_callback('ragebot_hitchance_modifier.on_shutdown', on_shutdown)
        on_createmove = create_debug_callback('ragebot_hitchance_modifier.on_createmove', on_createmove)

        local callbacks do
            local function on_enabled(item)
                local value = item:get()

                if not value then
                    unset_override()
                end

                events.shutdown(on_shutdown, value)
                events.createmove(on_createmove, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end
end

debug_point 'begin_visuals'

local visuals do
    debug_point 'visuals_watermark'

    local watermark do
        local ref = resource.visuals.watermark

        local function get_color()
            local col_type, col = ref.color:get()

            if type(col) ~= 'table' then
                col = { col }
            end

            for i = 1, #col do
                col[i].a = aux.lerp(50, 255, col[i].a / 255)
            end

            return col_type, col
        end

        local default = { } do
            local SCRIPT_NAME = string.format(
                '%s.lua', string.lower(script.name)
            )

            function default.on_render()
                local screen = render.screen_size()

                local position = vector(
                    screen.x * 0.5,
                    screen.y - 8
                )

                local font, flags = 1, ''
                local text = SCRIPT_NAME

                local col_type, col = get_color()

                if col_type == 'Gradient' then
                    local time = globals.realtime * (ref.speed:get() * 0.1)

                    text = text_anims.gradient(
                        text, time, col[1], col[2]
                    )
                end

                local text_size = render.measure_text(
                    font, flags, text
                )

                position.x = position.x - text_size.x / 2
                position.y = position.y - text_size.y

                render.text(font, position, col[1], flags, text)
            end
        end

        local alternative = { } do
            local SCRIPT_USER = common.get_username()

            local SCRIPT_NAME = string.lower(script.name)
            local SCRIPT_BUILD = string.lower(script.build)

            function alternative.on_render()
                local screen = render.screen_size()

                local position = vector(
                    screen.x - 8, 8
                )

                local font, flags = 1, ''

                local col_type, col = get_color()

                local list = { } do
                    local col_a = col[1] or color()
                    local col_b = col[2] or color()

                    local name = string.format(
                        '\a%s%s\a%s',
                        col_a:to_hex(),
                        SCRIPT_NAME,
                        col_b:to_hex()
                    )

                    table.insert(list, string.format(
                        '%s ~ %s : username: %s',
                        name, SCRIPT_BUILD, SCRIPT_USER
                    ))
                end

                for i = 1, #list do
                    local text = list[i]

                    local text_size = render.measure_text(
                        font, flags, text
                    )

                    local text_pos = vector(
                        position.x - text_size.x,
                        position.y
                    )

                    local gradient_background do
                        local gradient_pos = vector(
                            text_pos.x, text_pos.y + 1
                        )

                        local pos_a = gradient_pos + vector(-8, -2)
                        local pos_b = gradient_pos + text_size + vector(8, 2)

                        local center = (pos_a + pos_b) * 0.5

                        local col_begin  = color(0, 0, 0, 0)
                        local col_finish = color(0, 0, 0, 100)

                        render.gradient(pos_a, vector(center.x, pos_b.y), col_begin, col_finish, col_begin, col_finish)
                        render.gradient(pos_b, vector(center.x, pos_a.y), col_begin, col_finish, col_begin, col_finish)
                    end

                    render.text(font, text_pos, color(), flags, text)

                    position.y = position.y + text_size.y + 4
                end
            end
        end

        local new = { } do
            local GAP_BETWEEN = 8

            local SEPARATOR_GAP = 12

            local SEPARATOR_WIDTH = 1
            local SEPARATOR_HEIGHT = 14

            local FONT = render.load_font(
                'museo500', 16, 'a'
            )

            local SCRIPT_NAME = string.format(
                '%s.lua', script.name:lower()
            )

            local USER_NAME = common.get_username()

            local frametime_value = 1.0
            local frametime_timer = 0.0

            local avatar_size = vector(18, 18)

            local avatar_texture = nil do
                local link = string.format('https://en.neverlose.cc/static/avatars/%s.png', USER_NAME)

                local headers = { }

                local function callback(response)
                    if response == nil then
                        return
                    end

                    local texture = render.load_image(
                        response, avatar_size
                    )

                    if texture == nil then
                        return
                    end

                    avatar_texture = texture
                end

                network.get(link, headers, callback)
            end

            local widget_item = nil do
                local screen = render.screen_size()

                local initial_pos = vector()

                if screen.x ~= 0 and screen.y ~= 0 then
                    initial_pos.x = screen.x - 32
                    initial_pos.y = 32
                end

                local size = vector(0, 0)

                widget_item = widget.new(
                    'new_watermark', initial_pos, size, {
                        border = { vector(), screen }
                    }
                )
            end

            local function get_radius(box_size)
                local mode = ref.radius:get()

                if mode == 'Smooth' then
                    return ref.padding:get() + 2
                end

                return box_size.y / 2
            end

            local function get_fps_text()
                return string.format('%d', 1 / frametime_value)
            end

            local function get_time_text()
                local system_time = common.get_system_time()

                return string.format(
                    '%02d:%02d',
                    system_time.hours,
                    system_time.minutes
                )
            end

            local function update_frametime()
                local dt = globals.frametime

                frametime_timer = frametime_timer - dt

                if frametime_timer <= 0 then
                    frametime_timer = 1.0
                    frametime_value = dt
                end
            end

            local function draw_avatar(texture, pos, size)
                if texture ~= nil then
                    render.texture(texture, pos, size, color(), 'f')
                else
                    render.rect(pos, pos + size, color(20, 20, 20, 255), math.max(size.x, size.y) / 2)
                end
            end

            function new.on_render()
                local padding_v = ref.padding:get()
                local padding_h = ref.padding:get() + 4

                local position = widget_item:get_drag_position()

                local font, flags = FONT, ''

                local col_type, col = get_color()
                local box_color = col[1]:clone()

                box_color.r = box_color.r * 0.1
                box_color.g = box_color.g * 0.1
                box_color.b = box_color.b * 0.1

                box_color.a = 80

                local displays = { } do
                    if ref.display:get 'User' then
                        table.insert(displays, {
                            text = USER_NAME,
                            texture = avatar_texture
                        })
                    end

                    if ref.display:get 'FPS' then
                        update_frametime()

                        table.insert(displays, {
                            text = get_fps_text(),
                            icon = ui.get_icon 'layer-group'
                        })
                    end

                    if ref.display:get 'Time' then
                        table.insert(displays, {
                            text = get_time_text(),
                            icon = ui.get_icon 'clock'
                        })
                    end
                end

                local wish_size = vector()

                local script_panel do
                    local text = SCRIPT_NAME
                    local icon = ui.get_icon 'code'

                    local text_color = col[1]:clone()
                    text_color.a = 255

                    local icon_size = render.measure_text(font, flags, icon)
                    local text_size = render.measure_text(font, flags, text)

                    local max_size = vector(
                        icon_size.x + text_size.x + GAP_BETWEEN,
                        math.max(icon_size.y, text_size.y)
                    )

                    local rect_size = max_size + vector(
                        padding_h * 2, padding_v * 2
                    )

                    if col_type == 'Gradient' then
                        local col_a = col[1] or color()
                        local col_b = col[2] or color()

                        text = text_anims.gradient(text, globals.realtime, col_a, col_b)
                    end

                    local panel_pos = position:clone()
                    local box_radius = get_radius(rect_size)

                    render.blur(panel_pos, panel_pos + rect_size, 1.8, 1.0, box_radius)
                    render.rect(panel_pos, panel_pos + rect_size, box_color, box_radius)

                    local text_pos = panel_pos + vector(
                        padding_h, padding_v
                    )

                    render.text(font, text_pos, text_color, flags, icon)
                    text_pos.x = text_pos.x + icon_size.x + GAP_BETWEEN

                    render.text(font, text_pos, text_color, flags, text)

                    wish_size.x = wish_size.x + rect_size.x
                    wish_size.y = math.max(wish_size.y, rect_size.y)

                    position.x = position.x + rect_size.x
                end

                if next(displays) ~= nil then
                    position.x = position.x + 10
                    wish_size.x = wish_size.x + 10

                    local displayed_sizes = { } do
                        for i = 1, #displays do
                            local display = displays[i]

                            local result = { }

                            local text = display.text
                            local icon = display.icon
                            local texture = display.texture

                            if text ~= nil then
                                result.text_size = render.measure_text(font, flags, text)
                            end

                            if icon ~= nil then
                                result.icon_size = render.measure_text(font, flags, icon)
                            end

                            if texture ~= nil then
                                result.texture_size = vector(texture.width, texture.height)
                            end

                            displayed_sizes[i] = result
                        end
                    end

                    local text_color = color(255, 255, 255, 255)
                    local icon_color = color(255, 255, 255, 155)

                    local max_size = vector(0, FONT.height)

                    for i = 1, #displayed_sizes do
                        if i ~= 1 then
                            max_size.x = max_size.x + SEPARATOR_GAP + SEPARATOR_WIDTH + SEPARATOR_GAP
                        end

                        local count, display = 0, displayed_sizes[i]

                        if display.text_size ~= nil then
                            count = count + 1
                            max_size.x = max_size.x + display.text_size.x
                        end

                        if display.icon_size ~= nil then
                            count = count + 1
                            max_size.x = max_size.x + display.icon_size.x
                        end

                        if display.texture_size ~= nil then
                            count = count + 1
                            max_size.x = max_size.x + display.texture_size.x
                        end

                        max_size.x = max_size.x + (count - 1) * GAP_BETWEEN
                    end

                    local rect_size = max_size + vector(
                        padding_h * 2, padding_v * 2
                    )

                    local panel_pos = position:clone()
                    local box_radius = get_radius(rect_size)

                    render.blur(panel_pos, panel_pos + rect_size, 1.8, 1.0, box_radius)
                    render.rect(panel_pos, panel_pos + rect_size, box_color, box_radius)

                    local text_pos = panel_pos + vector(
                        padding_h, padding_v
                    )

                    for i = 1, #displays do
                        local display = displays[i]
                        local size = displayed_sizes[i]

                        if i ~= 1 then
                            text_pos.x = text_pos.x + SEPARATOR_GAP

                            local separator_pos = vector(text_pos.x, panel_pos.y + rect_size.y / 2 + 1)

                            render.rect(separator_pos + vector(0, -SEPARATOR_HEIGHT / 2), separator_pos + vector(SEPARATOR_WIDTH, SEPARATOR_HEIGHT / 2), icon_color)
                            text_pos.x = text_pos.x + SEPARATOR_WIDTH + SEPARATOR_GAP
                        end

                        if display.texture ~= nil then
                            local texture_pos = text_pos + vector(
                                0, (max_size.y - size.texture_size.y) / 2
                            )

                            draw_avatar(display.texture, texture_pos, size.texture_size)
                            text_pos.x = text_pos.x + size.texture_size.x + GAP_BETWEEN
                        end

                        if display.icon ~= nil then
                            render.text(font, text_pos, icon_color, flags, display.icon)
                            text_pos.x = text_pos.x + size.icon_size.x + GAP_BETWEEN
                        end

                        if display.text ~= nil then
                            render.text(font, text_pos, text_color, flags, display.text)
                            text_pos.x = text_pos.x + size.text_size.x
                        end
                    end

                    wish_size.x = wish_size.x + rect_size.x
                    wish_size.y = math.max(wish_size.y, rect_size.y)
                end

                widget_item.size = wish_size:clone()
                widget_item()
            end
        end

        local custom = { } do
            local fonts = {
                ['Default'] = 1,
                ['Pixel']   = 2,
                ['Console'] = 3,
                ['Bold']    = 4
            }

            local widget_item = nil do
                local screen = render.screen_size()
                local initial_pos = vector(screen.x, 0)

                if screen.x ~= 0 and screen.y ~= 0 then
                    initial_pos.x = initial_pos.x - 35
                    initial_pos.y = initial_pos.y + 10
                end

                local size = vector(0, 12)

                widget_item = widget.new(
                    'custom_watermark', initial_pos, size, {
                        border = { vector(), screen }
                    }
                )
            end

            local function encode_text(text, start)
                start = start or 0

                local should_encode = (
                    ref.animation:get() == 'Encoded'
                    and globals.realtime % 5.0 < 1.0
                )

                if should_encode then
                    local result = { }

                    for i = 1, #text do
                        if text:sub(i, i) == '\x20' then
                            table.insert(result, '\x20')
                        else
                            local index = math.floor(
                                globals.realtime * 24
                            )

                            table.insert(result, string.char(
                                0x31 + (start + i * 9 + index) % 60
                            ))
                        end
                    end

                    return table.concat(result, '')
                end

                return text
            end

            local function get_font()
                return fonts[ref.font:get()] or 1
            end

            local function get_colored_text(color_name, text)
                local color_type, col = ref.custom_colors[color_name]:get()

                if color_type == 'Single' then
                    text = string.format('\a%s%s', col:to_hex(), text)
                end

                if color_type == 'Gradient' then
                    text = text_anims.gradient(
                        text, -globals.realtime, col[1], col[2]
                    )
                end

                return text
            end

            local function get_position(window, width, height)
                local value = ref.position:get()

                if value == 'Custom' then
                    return window:get_drag_position(), true
                end

                local position = vector()
                local screen = render.screen_size()

                if value == 'Left' then
                    position.x = 8
                    position.y = (screen.y - height) / 2
                end

                if value == 'Bottom' then
                    position.x = (screen.x - width) / 2
                    position.y = screen.y - height - 8
                end

                if value == 'Right' then
                    position.x = screen.x - width - 8
                    position.y = (screen.y - height) / 2
                end

                return position, false
            end

            local function get_flag_list(value)
                local result = { }
                local buffer = { }

                local i, length = 1, #value
                local in_string = false

                while i <= length do
                    local char = value:sub(i, i)

                    if char == '"' then
                        in_string = not in_string
                    end

                    if char == '\x20' and not in_string then
                        if #buffer > 0 then
                            table.insert(result, table.concat(buffer, ''))

                            for j = 1, #buffer do
                                buffer[j] = nil
                            end
                        end

                        goto continue
                    end

                    table.insert(buffer, char)

                    ::continue::
                    i = i + 1
                end

                if next(buffer) ~= nil then
                    table.insert(result, table.concat(buffer, ''))
                end

                return result
            end

            local function get_construct_info(value)
                local info = {
                    has_brackets = true,
                    has_main = true,
                    has_prefix = true,

                    pre_icon = nil,
                    post_icon = nil,

                    pre = 'F R O S T',
                    main = 'L U A',
                    post = script.build:upper(),
                }

                local flags = get_flag_list(value)

                for i = 1, #flags do
                    local flag = flags[i]

                    local pre_match = flag:match '^pre="([^"]+)"'
                    local main_match = flag:match '^main="([^"]+)"'
                    local post_match = flag:match '^post="([^"]+)"'

                    local pre_icon_match = flag:match '^pre_icon="([^"]+)"'
                    local post_icon_match = flag:match '^post_icon="([^"]+)"'

                    if flag == 'nobr' then
                        info.has_brackets = false
                    end

                    if flag == 'nomn' then
                        info.has_main = false
                    end

                    if flag == 'nopr' then
                        info.has_prefix = false
                    end

                    if pre_match ~= nil then
                        info.pre = pre_match
                    end

                    if main_match ~= nil then
                        info.main = main_match
                    end

                    if post_match ~= nil then
                        info.post = post_match
                    end

                    if pre_icon_match ~= nil then
                        info.pre_icon = pre_icon_match
                    end

                    if post_icon_match ~= nil then
                        info.post_icon = post_icon_match
                    end
                end

                if info.has_main or info.has_prefix then
                    info.pre = info.pre .. '\x20'
                end

                return info
            end

            local function construct_text(info)
                local buffer = { }

                local pre_icon = info.pre_icon
                local post_icon = info.post_icon

                local pre = info.pre
                local main = info.main
                local post = info.post

                if pre_icon ~= nil then
                    local result = ui.get_icon(pre_icon)

                    if result ~= nil then
                        table.insert(buffer, '\aDEFAULT' .. result .. '\x20')
                    end
                end

                if pre ~= nil then
                    table.insert(buffer, get_colored_text('Pre', encode_text(pre)))
                end

                if main ~= nil and info.has_main then
                    table.insert(buffer, get_colored_text('Main', encode_text(main, 10)))
                end

                if post ~= nil and info.has_prefix then
                    if info.has_brackets then
                        post = '[' .. encode_text(post, 20) .. ']'
                    end

                    local result = get_colored_text('Post', post)

                    if info.has_main then
                        result = '\x20' .. result
                    end

                    table.insert(buffer, result)
                end

                if post_icon ~= nil then
                    local result = ui.get_icon(post_icon)

                    if result ~= nil then
                        table.insert(buffer, '\x20' .. '\aDEFAULT' .. result)
                    end
                end

                return table.concat(buffer, '')
            end

            function custom.on_render()
                local flags = ''

                local info = get_construct_info(ref.text:get())

                local text = construct_text(info)
                local font = get_font()

                if font == 2 then
                    text = text:upper()
                end

                local text_size = render.measure_text(font, flags, text)
                widget_item.size = text_size:clone()

                local position, unlocked = get_position(
                    widget_item, text_size.x, text_size.y
                )

                render.text(font, position, color(), flags, text)

                if not unlocked then
                    widget_item:set_position(
                        position.x, position.y
                    )
                end

                if unlocked then
                    widget_item()
                end
            end
        end

        default.on_render = create_debug_callback('watemark.default.on_render', default.on_render)
        alternative.on_render = create_debug_callback('watemark.alternative.on_render', alternative.on_render)
        new.on_render = create_debug_callback('watemark.new.on_render', new.on_render)
        custom.on_render = create_debug_callback('watemark.custom.on_render', custom.on_render)

        local callbacks do
            local function on_style(item)
                local value = item:get()

                events.render(default.on_render, value == 'Default')
                events.render(alternative.on_render, value == 'Alternative')
                events.render(new.on_render, value == 'New')
                events.render(custom.on_render, value == 'Custom')
            end

            ref.style:set_callback(
                on_style, true
            )
        end
    end

    debug_point 'visuals_screen_indicators'

    local screen_indicators do
        local ref = resource.visuals.screen_indicators

        local ref_double_tap = ui.find(
            'Aimbot', 'Ragebot', 'Main', 'Double Tap'
        )

        local ref_hide_shots = ui.find(
            'Aimbot', 'Ragebot', 'Main', 'Hide Shots'
        )

        local ref_body_aim = ui.find(
            'Aimbot', 'Ragebot', 'Safety', 'Body Aim'
        )

        local ref_min_damage = ui.find(
            'Aimbot', 'Ragebot', 'Selection', 'Min. Damage'
        )

        local ref_hit_chance = ui.find(
            'Aimbot', 'Ragebot', 'Selection', 'Hit Chance'
        )

        local ref_freestanding = ui.find(
            'Aimbot', 'Anti Aim', 'Angles', 'Freestanding'
        )

        local function get_item_value(item)
            local override = item:get_override()

            if override ~= nil then
                return override
            end

            return item:get()
        end

        local alternative = { } do
            local TITLE_NAME = string.format(
                '%s.%s', 'FROST', 'LUA'
            )

            local stars = {
                { '❅', -7, 6, 0.7 },
                { '❅', -2, 10, 0.5 },
                { '⋆', -4, 2, 0.2 },
                { '⋆', 0, 9, 0.2 },
                { '❆', -4, 5, 0.4 },
                { '❅', 0, 6, 0.7 },
                { '⋆', -2, 2, 0.3 },
                { '❆', -3, 8, 0.4 }
            }

            local alpha_value = smoothy.new(0.0)
            local align_value = smoothy.new(0.0)

            local baim_value = smoothy.new(0.0)
            local hc_value = smoothy.new(0.0)

            local dt_value = smoothy.new(0.0)
            local osaa_value = smoothy.new(0.0)

            local function is_grenade(weapon)
                local weapon_info = weapon:get_weapon_info()

                if weapon_info == nil then
                    return false
                end

                return weapon_info.weapon_type == 9
            end

            local function get_state()
                local manual_yaw = resource.antiaim.settings.manual_yaw.select:get()

                if manual_yaw ~= nil and manual_yaw ~= 'Off' then
                    local str = manual_yaw:upper()

                    return string.format(
                        'MANUAL %s', str
                    )
                end

                if get_item_value(ref_freestanding) then
                    if rage.antiaim:get_target(true) ~= nil then
                        return 'FREESTAND'
                    end
                end

                if not localplayer.is_onground then
                    if localplayer.is_crouched then
                        return 'AIR-CROUCH'
                    end

                    return 'AIR'
                end

                if localplayer.is_crouched then
                    if localplayer.is_moving then
                        return 'CROUCH-MOVE'
                    end

                    return 'CROUCH'
                end

                if localplayer.is_moving then
                    if software.antiaim.misc.slow_walk:get() then
                        return 'SLOWING'
                    end

                    return 'MOVING'
                end

                return 'STANDING'
            end

            local function draw_stars(position, col_a, col_b)
                local flags = ''

                local time = -globals.realtime
                local x, y = position.x + 4, position.y

                local sizes, len = { }, #stars
                local width, height = 0, 0

                for i = 1, len do
                    local data = stars[i]

                    local measure = render.measure_text(1, flags, data[1])

                    width = width + (measure.x + data[2])
                    height = math.max(height, measure.y + data[3])

                    sizes[i] = measure
                end

                x = round(x - (width * 0.5) * (1 - align_value.value))

                local pct = 0.0
                local div = 1 / (len - 1)

                for i = 1, len do
                    local star = stars[i]
                    local size = sizes[i]

                    local text = star[1]

                    local offset_x = star[2]
                    local offset_y = star[3]

                    local phase = star[4]

                    local phase_value = math.sin(time * phase) do
                        phase_value = phase_value * 0.5 + 0.5
                        phase_value = phase_value * 0.5 + 0.3
                    end

                    text = text_anims.gradient(
                        text, (time + pct) * 1.25, col_a, col_b
                    )

                    local text_pos = vector(
                        x + offset_x,
                        y + offset_y
                    )

                    local text_color = color(
                        200, 200, 200, col_a.a
                    )

                    text_color.a = text_color.a * phase_value
                    render.text(1, text_pos, text_color, flags, text)

                    x = x + size.x + offset_x
                    pct = pct + div
                end

                position.y = position.y + height * 0.75
            end

            local function draw_state(position, col, alpha)
                local font, flags, text = 2, '', get_state()
                local measure = render.measure_text(font, flags, text)

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                local text_color = col:clone()
                text_color.a = text_color.a * alpha

                render.text(font, text_pos, text_color, flags, text)

                position.y = position.y + (measure.y - 2)
            end

            local function draw_title(position, col_a, col_b)
                local should_animate = ref.animation:get()

                local font, flags, text = 2, '', TITLE_NAME
                local measure = render.measure_text(font, flags, text)

                local time = -globals.realtime

                if not should_animate then
                    text = string.format(
                        '\a%sFROST\aDEFAULT.LUA',
                        col_a:to_hex()
                    )
                end

                if should_animate then
                    text = text_anims.gradient(
                        text, time * 1.25, col_a, col_b
                    )
                end

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                render.text(font, text_pos, col_b, flags, text)

                position.y = position.y + round((measure.y - 2))
            end

            local function draw_double_tap(position, col, value, alpha)
                local font, flags, text = 2, '', 'DT'

                local measure = render.measure_text(font, flags, text)

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                local text_color = color(255, 0, 50, 255):lerp(col, rage.exploit:get())
                text_color.a = text_color.a * value * alpha

                render.text(font, text_pos, text_color, flags, text)

                position.y = position.y + round((measure.y - 2) * value)
            end

            local function draw_onshot_antiaim(position, col, value, alpha)
                local font, flags, text = 2, '', 'OSAA'

                local measure = render.measure_text(font, flags, text)

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                local text_color = col:clone()
                text_color.a = text_color.a * value * alpha

                render.text(font, text_pos, text_color, flags, text)

                position.y = position.y + round((measure.y - 2) * value)
            end

            local function draw_body_aim(position, col, value, alpha)
                local font, flags, text = 2, '', 'BODY'

                local measure = render.measure_text(font, flags, text)

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                local text_color = col:clone()
                text_color.a = text_color.a * value * alpha

                render.text(font, text_pos, text_color, flags, text)

                position.y = position.y + round((measure.y - 2) * value)
            end

            local function draw_hitchance(position, col, value, alpha)
                local font, flags, text = 2, '', 'HC'

                local measure = render.measure_text(font, flags, text)

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                local text_color = col:clone()
                text_color.a = text_color.a * value * alpha

                render.text(font, text_pos, text_color, flags, text)

                position.y = position.y + round((measure.y - 2) * value)
            end

            local function update_values(me)
                local is_alive = me:is_alive()
                local is_scoped = me.m_bIsScoped

                local is_double_tap = get_item_value(ref_double_tap)
                local is_onshot_aa = get_item_value(ref_hide_shots)

                local bind_hit_chance = binds_ctx.get(
                    ref_hit_chance
                )

                local is_hitchance_override = (
                    bind_hit_chance ~= nil
                    and bind_hit_chance.active
                )

                local is_force_baim_override = (
                    ref_body_aim:get() == 'Force'
                )

                local alpha_target = 0.0

                if is_alive then
                    alpha_target = 1.0

                    local weapon = me:get_player_weapon()

                    if is_scoped or (weapon ~= nil and is_grenade(weapon)) then
                        alpha_target = 0.5
                    end
                end

                alpha_value(0.05, alpha_target)
                align_value(0.05, is_scoped)

                baim_value(0.05, is_force_baim_override)
                hc_value(0.05, is_hitchance_override)

                dt_value(0.05, is_double_tap)
                osaa_value(0.05, is_onshot_aa)
            end

            local function draw_indicators()
                local screen = render.screen_size()
                local position = screen * 0.5

                local col_a = ref.color:get('Accent')[1]:clone()
                local col_b = ref.color:get('Secondary')[1]:clone()

                position.x = position.x + math.floor(0.5 + 10 * align_value.value)
                position.y = position.y + ref.offset:get()

                col_a.a = col_a.a * alpha_value.value
                col_b.a = col_b.a * alpha_value.value

                draw_stars(position, col_a, col_b)
                draw_title(position, col_a, col_b)

                draw_state(position, color(250, 250, 250, 125), alpha_value.value)

                draw_double_tap(position, color(250, 250, 250, 175), dt_value.value, alpha_value.value)
                draw_onshot_antiaim(position, color(250, 250, 250, 175), osaa_value.value, alpha_value.value)
                draw_body_aim(position, color(250, 250, 250, 175), baim_value.value, alpha_value.value)
                draw_hitchance(position, color(250, 250, 250, 175), hc_value.value, alpha_value.value)
            end

            function alternative.on_render()
                local me = entity.get_local_player()

                if me == nil then
                    return
                end

                update_values(me)

                if alpha_value.value > 0 then
                    draw_indicators()
                end
            end
        end

        local new = { } do
            local MUSEO_16 = render.load_font('museo500', 16, 'ad')
            local MUSEO_14 = render.load_font('museo500', 14, 'ad')

            local TITLE_NAME = string.format(
                '%s.%s', script.name:lower(), 'lua'
            )

            local stars = {
                { '❅', -7, 6, 0.7 },
                { '❅', -2, 10, 0.5 },
                { '⋆', -4, 2, 0.2 },
                { '⋆', 0, 9, 0.2 },
                { '❆', -4, 5, 0.4 },
                { '❅', 0, 6, 0.7 },
                { '⋆', -2, 2, 0.3 },
                { '❆', -3, 8, 0.4 }
            }

            local alpha_value = smoothy.new(0.0)
            local align_value = smoothy.new(0.0)

            local dmg_value = smoothy.new(0.0)

            local dt_value = smoothy.new(0.0)
            local osaa_value = smoothy.new(0.0)

            local function is_grenade(weapon)
                local weapon_info = weapon:get_weapon_info()

                if weapon_info == nil then
                    return false
                end

                return weapon_info.weapon_type == 9
            end

            local function get_state()
                if not localplayer.is_onground then
                    return 'air'
                end

                if localplayer.is_crouched then
                    return 'crouch'
                end

                if localplayer.is_moving then
                    if software.antiaim.misc.slow_walk:get() then
                        return 'slowing'
                    end

                    return 'moving'
                end

                return 'stand'
            end

            local function draw_stars(position, col_a, col_b)
                local flags = ''

                local time = -globals.realtime
                local x, y = position.x + 4, position.y

                local sizes, len = { }, #stars
                local width, height = 0, 0

                for i = 1, len do
                    local data = stars[i]

                    local measure = render.measure_text(1, flags, data[1])

                    width = width + (measure.x + data[2])
                    height = math.max(height, measure.y + data[3])

                    sizes[i] = measure
                end

                x = round(x - (width * 0.5) * (1 - align_value.value))

                local pct = 0.0
                local div = 1 / (len - 1)

                for i = 1, len do
                    local star = stars[i]
                    local size = sizes[i]

                    local text = star[1]

                    local offset_x = star[2]
                    local offset_y = star[3]

                    local phase = star[4]

                    local phase_value = math.sin(time * phase) do
                        phase_value = phase_value * 0.5 + 0.5
                        phase_value = phase_value * 0.5 + 0.3
                    end

                    text = text_anims.gradient(
                        text, (time + pct) * 1.25, col_a, col_b
                    )

                    local text_pos = vector(
                        x + offset_x,
                        y + offset_y
                    )

                    local text_color = color(
                        200, 200, 200, col_a.a
                    )

                    text_color.a = text_color.a * phase_value
                    render.text(1, text_pos, text_color, flags, text)

                    x = x + size.x + offset_x
                    pct = pct + div
                end

                position.y = position.y + height
            end

            local function draw_title(position, col_a, col_b, alpha)
                local font, flags, text = MUSEO_16, '', TITLE_NAME
                local measure = render.measure_text(font, flags, text)

                local rect_size = measure + vector(
                    ref.padding:get() + 6,
                    ref.padding:get()
                )

                local rect_pos = position:clone() do
                    rect_pos.x = round(rect_pos.x - (rect_size.x * 0.5) * (1 - align_value.value))
                end

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                local text_color = col_b:clone()

                if ref.animation:get() then
                    text = text_anims.gradient(text, -globals.realtime * 1.25, col_a, col_b)
                end

                local box_color = col_a:clone()
                local box_radius = 8

                box_color.r = box_color.r * 0.1
                box_color.g = box_color.g * 0.1
                box_color.b = box_color.b * 0.1
                box_color.a = 80 * alpha

                render.blur(rect_pos, rect_pos + rect_size, 1.8, alpha, box_radius)
                render.rect(rect_pos, rect_pos + rect_size, box_color, box_radius)

                render.text(font, rect_pos + (rect_size - measure) / 2, text_color, flags, text)

                position.y = position.y + round((rect_size.y - 1))
            end

            local function draw_state(position, col, alpha)
                local font, flags, text = MUSEO_14, '', get_state()
                local measure = render.measure_text(font, flags, text)

                local left_quarter = '◟'
                local right_quarter = '◞'

                local left_quarter_size = render.measure_text(font, flags, left_quarter)
                local right_quarter_size = render.measure_text(font, flags, right_quarter)

                local max_size = measure:clone()

                max_size.x = max_size.x + left_quarter_size.x
                max_size.x = max_size.x + right_quarter_size.x

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (max_size.x * 0.5) * (1 - align_value.value))
                end

                local text_color = col:clone()
                text_color.a = text_color.a * alpha

                render.text(font, text_pos + vector(0, -2), text_color, flags, left_quarter)
                text_pos.x = text_pos.x + left_quarter_size.x

                render.text(font, text_pos, text_color, flags, text)
                text_pos.x = text_pos.x + measure.x

                render.text(font, text_pos + vector(0, -2), text_color, flags, right_quarter)

                position.y = position.y + max_size.y + 2
            end

            local function draw_options(position, col, dmg, dt, hs, alpha)
                local font, flags, gap = MUSEO_14, '', 6

                local dmg_text = 'dmg'
                local dt_text = 'dt'
                local hs_text = 'hs'

                local dmg_size = render.measure_text(font, flags, dmg_text)

                local dt_size = render.measure_text(font, flags, dt_text)
                local hs_size = render.measure_text(font, flags, hs_text)

                local max_size = vector(
                    math.max(dmg_size.x + gap + dt_size.x, hs_size.x),
                    math.max(dmg_size.y, dt_size.y) + hs_size.y
                )

                local top_layer_pos = position:clone()
                local bottom_layer_pos = position:clone()

                top_layer_pos.x = round(top_layer_pos.x - (max_size.x * 0.5) * (1 - align_value.value))
                bottom_layer_pos.x = round(bottom_layer_pos.x - (hs_size.x * 0.5) * (1 - align_value.value))

                local dmg_color = color(250, 250, 250, 175)
                local dt_color = color(250, 250, 250, 175)
                local hs_color = color(250, 250, 250, 175)

                local charged_col = color(255, 0, 50, 255)
                    :lerp(col, rage.exploit:get())

                dmg_color = dmg_color:lerp(col, dmg)
                dt_color = dt_color:lerp(charged_col, dt)
                hs_color = hs_color:lerp(col, hs)

                dmg_color.a = dmg_color.a * alpha
                dt_color.a = dt_color.a * alpha
                hs_color.a = hs_color.a * alpha

                render.text(font, top_layer_pos, dmg_color, flags, dmg_text)
                top_layer_pos.x = top_layer_pos.x + dmg_size.x + gap

                render.text(font, top_layer_pos, dt_color, flags, dt_text)
                bottom_layer_pos.y = bottom_layer_pos.y + math.max(dmg_size.y, dt_size.y)

                render.text(font, bottom_layer_pos, hs_color, flags, hs_text)

                position.y = position.y + max_size.y
            end

            local function draw_minimum_damage(position, col, value, alpha)
                local font, flags, text = MUSEO_14, '', 'dmg'

                local measure = render.measure_text(font, flags, text)

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                local text_color = col:clone()
                text_color.a = text_color.a * value * alpha

                render.text(font, text_pos, text_color, flags, text)

                position.y = position.y + round((measure.y - 1) * value)
            end

            local function draw_double_tap(position, col, value, alpha)
                local font, flags, text = MUSEO_14, '', 'dt'

                local measure = render.measure_text(font, flags, text)

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                local text_color = color(255, 0, 50, 255):lerp(col, rage.exploit:get())
                text_color.a = text_color.a * value * alpha

                render.text(font, text_pos, text_color, flags, text)

                position.y = position.y + round((measure.y - 1) * value)
            end

            local function draw_onshot_antiaim(position, col, value, alpha)
                local font, flags, text = MUSEO_14, '', 'hs'

                local measure = render.measure_text(font, flags, text)

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                local text_color = col:clone()
                text_color.a = text_color.a * value * alpha

                render.text(font, text_pos, text_color, flags, text)

                position.y = position.y + round((measure.y - 1) * value)
            end

            local function update_values(me)
                local is_alive = me:is_alive()
                local is_scoped = me.m_bIsScoped

                local is_double_tap = get_item_value(ref_double_tap)
                local is_onshot_aa = get_item_value(ref_hide_shots)

                local bind_min_damage = binds_ctx.get(ref_min_damage)

                local is_dmg_override = (
                    bind_min_damage ~= nil
                    and bind_min_damage.active
                )

                local alpha_target = 0.0

                if is_alive then
                    alpha_target = 1.0

                    local weapon = me:get_player_weapon()

                    if is_scoped or (weapon ~= nil and is_grenade(weapon)) then
                        alpha_target = 0.5
                    end
                end

                alpha_value(0.05, alpha_target)
                align_value(0.05, is_scoped)

                dmg_value(0.05, is_dmg_override)

                dt_value(0.05, is_double_tap)
                osaa_value(0.05, is_onshot_aa)
            end

            local function draw_indicators()
                local screen = render.screen_size()
                local position = screen * 0.5

                local col_a = ref.color:get('Accent')[1]:clone()
                local col_b = ref.color:get('Secondary')[1]:clone()

                position.x = position.x + math.floor(0.5 + 10 * align_value.value)
                position.y = position.y + ref.offset:get()

                col_a.a = col_a.a * alpha_value.value
                col_b.a = col_b.a * alpha_value.value

                draw_stars(position, col_a, col_b)

                draw_title(position, col_a, col_b, alpha_value.value)
                draw_state(position, color(250, 250, 250, 125), alpha_value.value)

                draw_options(position, col_a, dmg_value.value, dt_value.value, osaa_value.value, alpha_value.value)
            end

            function new.on_render()
                local me = entity.get_local_player()

                if me == nil then
                    return
                end

                update_values(me)

                if alpha_value.value > 0 then
                    draw_indicators()
                end
            end
        end

        local modern = { } do
            local TITLE_NAME = string.format(
                '%s.%s', script.name:upper(), 'LUA'
            )

            local stars = {
                { '❅', -7, 6, 0.7 },
                { '❅', -2, 10, 0.5 },
                { '⋆', -4, 2, 0.2 },
                { '⋆', 0, 9, 0.2 },
                { '❆', -4, 5, 0.4 },
                { '❅', 0, 6, 0.7 },
                { '⋆', -2, 2, 0.3 },
                { '❆', -3, 8, 0.4 }
            }

            local alpha_value = smoothy.new(0.0)
            local align_value = smoothy.new(0.0)

            local dmg_value = smoothy.new(0.0)

            local dt_value = smoothy.new(0.0)
            local osaa_value = smoothy.new(0.0)

            local function is_grenade(weapon)
                local weapon_info = weapon:get_weapon_info()

                if weapon_info == nil then
                    return false
                end

                return weapon_info.weapon_type == 9
            end

            local function get_state()
                if not localplayer.is_onground then
                    return 'AIR'
                end

                if localplayer.is_crouched then
                    return 'CROUCH'
                end

                if localplayer.is_moving then
                    if software.antiaim.misc.slow_walk:get() then
                        return 'SLOWING'
                    end

                    return 'MOVING'
                end

                return 'STAND'
            end

            local function draw_stars(position, col_a, col_b)
                local flags = ''

                local time = -globals.realtime
                local x, y = position.x + 4, position.y

                local sizes, len = { }, #stars
                local width, height = 0, 0

                for i = 1, len do
                    local data = stars[i]

                    local measure = render.measure_text(1, flags, data[1])

                    width = width + (measure.x + data[2])
                    height = math.max(height, measure.y + data[3])

                    sizes[i] = measure
                end

                x = round(x - (width * 0.5) * (1 - align_value.value))

                local pct = 0.0
                local div = 1 / (len - 1)

                for i = 1, len do
                    local star = stars[i]
                    local size = sizes[i]

                    local text = star[1]

                    local offset_x = star[2]
                    local offset_y = star[3]

                    local phase = star[4]

                    local phase_value = math.sin(time * phase) do
                        phase_value = phase_value * 0.5 + 0.5
                        phase_value = phase_value * 0.5 + 0.3
                    end

                    text = text_anims.gradient(
                        text, (time + pct) * 1.25, col_a, col_b
                    )

                    local text_pos = vector(
                        x + offset_x,
                        y + offset_y
                    )

                    local text_color = color(
                        200, 200, 200, col_a.a
                    )

                    text_color.a = text_color.a * phase_value
                    render.text(1, text_pos, text_color, flags, text)

                    x = x + size.x + offset_x
                    pct = pct + div
                end

                position.y = position.y + height * 0.95
            end

            local function draw_title(position, col_a, col_b, alpha)
                local font, flags, text = 2, '', TITLE_NAME
                local measure = render.measure_text(font, flags, text)

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (measure.x * 0.5) * (1 - align_value.value))
                end

                local text_color = col_b:clone()

                if ref.animation:get() then
                    text = text_anims.gradient(text, -globals.realtime * 1.25, col_a, col_b)
                end

                render.text(font, text_pos, text_color, flags, text)

                position.y = position.y + round((measure.y - 1))
            end

            local function draw_state(position, col, alpha)
                local font, flags, text = 2, '', get_state()
                local measure = render.measure_text(font, flags, text)

                local left_quarter = '⌞'
                local right_quarter = '⌟'

                local left_quarter_size = render.measure_text(font, flags, left_quarter)
                local right_quarter_size = render.measure_text(font, flags, right_quarter)

                local max_size = measure:clone()

                max_size.x = max_size.x + left_quarter_size.x
                max_size.x = max_size.x + right_quarter_size.x

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (max_size.x * 0.5) * (1 - align_value.value))
                end

                local text_color = col:clone()
                text_color.a = text_color.a * alpha

                render.text(font, text_pos + vector(0, -1), text_color, flags, left_quarter)
                text_pos.x = text_pos.x + left_quarter_size.x

                render.text(font, text_pos, text_color, flags, text)
                text_pos.x = text_pos.x + measure.x

                render.text(font, text_pos + vector(0, -1), text_color, flags, right_quarter)

                position.y = position.y + max_size.y + 2
            end

            local function draw_options(position, col, dmg, dt, hs, alpha)
                local font, flags, gap = 2, '', 1

                local dmg_text = 'DMG'
                local dt_text = 'DT'
                local hs_text = 'HS'

                local dmg_size = render.measure_text(font, flags, dmg_text)
                local dt_size = render.measure_text(font, flags, dt_text)
                local hs_size = render.measure_text(font, flags, hs_text)

                local max_size = vector(
                    dmg_size.x + gap + dt_size.x + gap + hs_size.x,
                    math.max(dmg_size.y, dt_size.y, hs_size.y)
                )

                local text_pos = position:clone() do
                    text_pos.x = round(text_pos.x - (max_size.x * 0.5) * (1 - align_value.value))
                end

                local dmg_color = color(250, 250, 250, 175)
                local dt_color = color(250, 250, 250, 175)
                local hs_color = color(250, 250, 250, 175)

                local charged_col = color(255, 0, 50, 255)
                    :lerp(col, rage.exploit:get())

                dmg_color = dmg_color:lerp(col, dmg)
                dt_color = dt_color:lerp(charged_col, dt)
                hs_color = hs_color:lerp(col, hs)

                dmg_color.a = dmg_color.a * alpha
                dt_color.a = dt_color.a * alpha
                hs_color.a = hs_color.a * alpha

                render.text(font, text_pos, dmg_color, flags, dmg_text)
                text_pos.x = text_pos.x + dmg_size.x + gap

                render.text(font, text_pos, dt_color, flags, dt_text)
                text_pos.x = text_pos.x + dt_size.x + gap

                render.text(font, text_pos, hs_color, flags, hs_text)

                position.y = position.y + max_size.y
            end

            local function update_values(me)
                local is_alive = me:is_alive()
                local is_scoped = me.m_bIsScoped

                local is_double_tap = get_item_value(ref_double_tap)
                local is_onshot_aa = get_item_value(ref_hide_shots)

                local bind_min_damage = binds_ctx.get(ref_min_damage)

                local is_dmg_override = (
                    bind_min_damage ~= nil
                    and bind_min_damage.active
                )

                local alpha_target = 0.0

                if is_alive then
                    alpha_target = 1.0

                    local weapon = me:get_player_weapon()

                    if is_scoped or (weapon ~= nil and is_grenade(weapon)) then
                        alpha_target = 0.5
                    end
                end

                alpha_value(0.05, alpha_target)
                align_value(0.05, is_scoped)

                dmg_value(0.05, is_dmg_override)

                dt_value(0.05, is_double_tap)
                osaa_value(0.05, is_onshot_aa)
            end

            local function draw_indicators()
                local screen = render.screen_size()
                local position = screen * 0.5

                local col_a = ref.color:get('Accent')[1]:clone()
                local col_b = ref.color:get('Secondary')[1]:clone()

                position.x = position.x + math.floor(0.5 + 10 * align_value.value)
                position.y = position.y + ref.offset:get()

                col_a.a = col_a.a * alpha_value.value
                col_b.a = col_b.a * alpha_value.value

                draw_stars(position, col_a, col_b)

                draw_title(position, col_a, col_b, alpha_value.value)
                draw_state(position, color(250, 250, 250, 125), alpha_value.value)

                draw_options(position, col_a, dmg_value.value, dt_value.value, osaa_value.value, alpha_value.value)
            end

            function modern.on_render()
                local me = entity.get_local_player()

                if me == nil then
                    return
                end

                update_values(me)

                if alpha_value.value > 0 then
                    draw_indicators()
                end
            end
        end

        alternative.on_render = create_debug_callback('screen_indicators.alternative.on_render', alternative.on_render)

        new.on_render = create_debug_callback('screen_indicators.new.on_render', new.on_render)
        modern.on_render = create_debug_callback('screen_indicators.modern.on_render', modern.on_render)

        local function update_event_callbacks(value)
            events.render(alternative.on_render, value == 'Alternative')

            events.render(new.on_render, value == 'New')
            events.render(modern.on_render, value == 'Modern')
        end

        local callbacks do
            local function on_style(item)
                update_event_callbacks(item:get())
            end

            local function on_enabled(item)
                local value = item:get()

                if not value then
                    update_event_callbacks(nil)
                end

                if value then
                    ref.style:set_callback(on_style, true)
                else
                    ref.style:unset_callback(on_style)
                end
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'visuals_manual_arrows'

    local manual_arrows do
        local ref = resource.visuals.manual_arrows
        local ref_manual_yaw = resource.antiaim.settings.manual_yaw

        local OFFSET = 40

        local function get_pulse()
            return math.abs(globals.realtime % 2.0 - 1.0)
        end

        local function get_manual_value()
            return ref_manual_yaw.select:get()
        end

        local function get_active_color(have_animation)
            local col = ref.color:get 'Active' [1]

            if have_animation ~= false and ref.animation:get() then
                col.a = col.a * aux.lerp(0.33, 1.0, get_pulse())
            end

            return col
        end

        local function get_inactive_color()
            return ref.color:get 'Inactive' [1]
        end

        local classic = { } do
            local FONT = render.load_font('Verdana', 20, 'abd')

            function classic.render()
                local me = entity.get_local_player()

                if me == nil or not me:is_alive() then
                    return
                end

                local screen = render.screen_size()
                local value = get_manual_value()

                local active_color = get_active_color()
                local inactive_color = get_inactive_color()

                local left_manual do
                    local flags, text = 'r', '<'

                    local text_size = render.measure_text(FONT, flags, text)

                    local text_pos = vector(
                        screen.x * 0.5 - OFFSET + 1,
                        screen.y * 0.5 - text_size.y * 0.5 - 1
                    )

                    local text_color = value == 'Left'
                        and active_color or inactive_color

                    render.text(FONT, text_pos, text_color, flags, text)
                end

                local right_manual do
                    local flags, text = '', '>'

                    local text_size = render.measure_text(FONT, flags, text)

                    local text_pos = vector(
                        screen.x * 0.5 + OFFSET,
                        screen.y * 0.5 - text_size.y * 0.5 - 1
                    )

                    local text_color = value == 'Right'
                        and active_color or inactive_color

                    render.text(FONT, text_pos, text_color, flags, text)
                end
            end
        end

        local modern = { } do
            local FONT = render.load_font('Verdana', 27, 'ab')

            function modern.render()
                local me = entity.get_local_player()

                if me == nil or not me:is_alive() then
                    return
                end

                local screen = render.screen_size()
                local value = get_manual_value()

                local active_color = get_active_color()
                local inactive_color = get_inactive_color()

                local left_manual do
                    local flags, text = 'r', '⮜'

                    local shadow_size = FONT.height + 4
                    local text_size = render.measure_text(FONT, flags, text)

                    local text_pos = vector(
                        screen.x * 0.5 - OFFSET + 1,
                        screen.y * 0.5 - text_size.y * 0.5 - 1
                    )

                    local shadow_pos = vector(
                        text_pos.x - text_size.x * 0.5,
                        screen.y * 0.5
                    )

                    local text_color = value == 'Left'
                        and active_color or inactive_color

                    local shadow_color = value == 'Left'
                        and active_color or inactive_color

                    render.shadow(shadow_pos, shadow_pos, shadow_color, shadow_size)
                    render.text(FONT, text_pos, text_color, flags, text)
                end

                local right_manual do
                    local flags, text = '', '⮞'

                    local shadow_size = FONT.height + 4
                    local text_size = render.measure_text(FONT, flags, text)

                    local text_pos = vector(
                        screen.x * 0.5 + OFFSET,
                        screen.y * 0.5 - text_size.y * 0.5 - 1
                    )

                    local shadow_pos = vector(
                        text_pos.x + text_size.x * 0.5,
                        screen.y * 0.5
                    )

                    local text_color = value == 'Right'
                        and active_color or inactive_color

                    local shadow_color = value == 'Right'
                        and active_color or inactive_color

                    render.shadow(shadow_pos, shadow_pos, shadow_color, shadow_size)
                    render.text(FONT, text_pos, text_color, flags, text)
                end
            end
        end

        local triangle = { } do
            function triangle.render()
                local me = entity.get_local_player()

                if me == nil or not me:is_alive() then
                    return
                end

                local screen = render.screen_size()
                local value = get_manual_value()

                local active_color = get_active_color()
                local inactive_color = get_inactive_color()

                local left_manual do
                    local position = vector(
                        screen.x * 0.5 - OFFSET + 1,
                        screen.y * 0.5
                    )

                    local pos_1 = vector(position.x, position.y - 8)
                    local pos_2 = vector(position.x - 10, position.y)
                    local pos_3 = vector(position.x, position.y + 8)

                    local poly_color = value == 'Left'
                        and active_color or inactive_color

                    render.poly(poly_color, pos_1, pos_2, pos_3)
                end

                local right_manual do
                    local position = vector(
                        screen.x * 0.5 + OFFSET,
                        screen.y * 0.5
                    )

                    local pos_1 = vector(position.x, position.y - 8)
                    local pos_2 = vector(position.x + 10, position.y)
                    local pos_3 = vector(position.x, position.y + 8)

                    local poly_color = value == 'Right'
                        and active_color or inactive_color

                    render.poly(poly_color, pos_1, pos_2, pos_3)
                end
            end
        end

        classic.render = create_debug_callback('manual_arrows.classic.render', classic.render)
        modern.render = create_debug_callback('manual_arrows.modern.render', modern.render)
        triangle.render = create_debug_callback('manual_arrows.triangle.render', triangle.render)

        local function update_event_callbacks(value)
            events.render(classic.render, value == 'Classic')
            events.render(modern.render, value == 'Modern')
            events.render(triangle.render, value == 'Triangle')
        end

        local callbacks do
            local function on_style(item)
                update_event_callbacks(item:get())
            end

            local function on_enabled(item)
                local value = item:get()

                if not value then
                    update_event_callbacks(nil)
                end

                if value then
                    ref.style:set_callback(on_style, true)
                else
                    ref.style:unset_callback(on_style)
                end
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'visuals_damage_indicator'

    local damage_indicator do
        local ref = resource.visuals.damage_indicator

        local FONTS = {
            ['Default'] = 1,
            ['Pixel']   = 2,
            ['Bold']    = 4
        }

        local ref_min_damage = ui.find(
            'Aimbot', 'Ragebot', 'Selection', 'Min. Damage'
        )

        local alpha_value = 0.0
        local damage_value = ref_min_damage:get()

        local display_text = ''

        local widget_item = nil do
            local screen = render.screen_size()
            local center = screen * 0.5

            local size = vector(10, 10)
            local pos = center + vector(8, -8 - size.y)

            widget_item = widget.new(
                'damage_indicator', pos, size, {
                    border = {
                        vector(0, 0),
                        screen:clone()
                    }
                }
            )

            function widget_item:update()
                return alpha_value
            end
        end

        local function get_render_text()
            local value = ref_min_damage:get()

            if value == 0 then
                return 'AUTO'
            end

            if ref.animation:get() then
                damage_value = motion.interp(
                    damage_value, value, 0.035
                )

                value = round(damage_value)
            end

            if value > 100 then
                return string.format(
                    '+%d', value - 100
                )
            end

            return value
        end

        local function on_render()
            local me = entity.get_local_player()

            if me == nil or not me:is_alive() then
                return
            end

            local font = FONTS[
                ref.font:get()
            ]

            if font == nil then
                return
            end

            local text_color = ref.color:get()

            local should_render = true
            local should_update_text = true

            if ref.when_active:get() then
                local bind = binds_ctx.get(
                    ref_min_damage
                )

                should_render = bind ~= nil
                    and bind.active

                if not should_render then
                    should_update_text = false
                end
            end

            alpha_value = motion.interp(
                alpha_value, should_render, 0.05
            )

            if alpha_value <= 0.0 then
                return
            end

            text_color.a = text_color.a * alpha_value

            if should_update_text then
                display_text = get_render_text()
            end

            local position = widget_item:get_drag_position()

            local flags, text = '', display_text

            local text_size = render.measure_text(font, flags, text)
            render.text(font, position + vector(1, 0), text_color, flags, text)

            widget_item.size = text_size:clone()

            widget_item()
        end

        on_render = create_debug_callback('visuals_damage_indicator.on_render', on_render)

        local callbacks do
            local function on_enabled(item)
                events.render(on_render, item:get())
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'visuals_hitchance_indicator'

    local hitchance_indicator do
        local ref = resource.visuals.hitchance_indicator

        local FONTS = {
            ['Default'] = 1,
            ['Pixel']   = 2,
            ['Bold']    = 4
        }

        local ref_hit_chance = ui.find(
            'Aimbot', 'Ragebot', 'Selection', 'Hit Chance'
        )

        local chance_value = ref_hit_chance:get()

        local widget_item = nil do
            local screen = render.screen_size()
            local center = screen * 0.5

            local size = vector(10, 10)
            local pos = center + vector(-8 - size.x, -8 - size.y)

            widget_item = widget.new(
                'hitchance_indicator', pos, size, {
                    border = {
                        vector(0, 0),
                        screen:clone()
                    }
                }
            )
        end

        local function get_hitchance()
            local value = ref_hit_chance:get_override()

            if value == nil then
                value = ref_hit_chance:get()
            end

            return value
        end

        local function get_render_text()
            local value = get_hitchance()

            if ref.animation:get() then
                chance_value = motion.interp(
                    chance_value, value, 0.035
                )

                value = round(chance_value)
            end

            return value
        end

        local function on_render()
            local me = entity.get_local_player()

            if me == nil or not me:is_alive() then
                return
            end

            local font = FONTS[
                ref.font:get()
            ]

            if font == nil then
                return
            end

            local text_color = ref.color:get()

            local position = widget_item:get_drag_position()

            local flags, text = '', get_render_text()
            local text_size = render.measure_text(font, flags, text)

            render.text(font, position, text_color, flags, text)

            widget_item.size = text_size:clone()

            widget_item()
        end

        on_render = create_debug_callback('visuals_hitchance_indicator.on_render', on_render)

        local callbacks do
            local function on_enabled(item)
                events.render(on_render, item:get())
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'visuals_velocity_warning'

    local velocity_warning do
        local ref = resource.visuals.velocity_warning

        local window do
            local initial_pos = vector(0.5, 0.2)

            window = windows.new(
                'velocity_warning',
                initial_pos:unpack()
            )

            window:set_anchor(
                vector(0.5, 0.5)
            )
        end

        local function get_velocity_modifier(player)
            if player == nil or not player:is_alive() then
                return 1.0
            end

            return player.m_flVelocityModifier
        end

        local new = { } do
            local FONT = render.load_font(
                'museo500', 16, 'a'
            )

            local PADDING_H = 10
            local PADDING_V = 10

            local GAP_BETWEEN = 8

            local alpha_value = 0.0

            local function get_velocity_text(modifier)
                local plain_color = color()
                local value_color = ref.color:get()

                local plain_text = 'velocity'

                local value_text = string.format(
                    '%d%%', modifier * 100
                )

                local left_text = string.format(
                    '\a%s%s', plain_color:to_hex(), plain_text
                )

                local right_text = string.format(
                    '\a%s%s', value_color:to_hex(), value_text
                )

                return left_text .. '   ' .. right_text
            end

            local function get_icon_color(modifier)
                if modifier <= 0.33 then
                    return color(230, 127, 127, 255)
                end

                if modifier <= 0.5 then
                    return color(230, 170, 127, 255)
                end

                return color(255, 255, 255, 255)
            end

            function new.on_render()
                local me = entity.get_local_player()

                local pos = window.pos:clone()

                local modifier = get_velocity_modifier(me)
                local text = get_velocity_text(modifier)

                local should_draw = modifier < 1.0 or ui.get_alpha() > 0.0

                alpha_value = motion.interp(
                    alpha_value, should_draw, 0.05
                )

                if alpha_value <= 0.0 then
                    return
                end

                local icon = ui.get_icon 'triangle-exclamation'

                local icon_size = render.measure_text(FONT, nil, icon)
                local text_size = render.measure_text(FONT, nil, text)

                local icon_box_size = vector(36, 36)

                local text_box_size = vector(
                    text_size.x + PADDING_H * 2, 36
                )

                local max_box_size = vector(
                    icon_box_size.x + text_box_size.x + GAP_BETWEEN,
                    math.max(icon_box_size.y, text_box_size.y)
                )

                local box_radius = 10

                local box_color = ref.color:get()

                local icon_color = get_icon_color(modifier)
                local text_color = color(255, 255, 255, 255)

                box_color.r = box_color.r * 0.1
                box_color.g = box_color.g * 0.1
                box_color.b = box_color.b * 0.1
                box_color.a = 80 * alpha_value

                icon_color.a = icon_color.a * alpha_value
                text_color.a = text_color.a * alpha_value

                render.blur(pos, pos + icon_box_size, 1.8, alpha_value, box_radius)
                render.rect(pos, pos + icon_box_size, box_color, box_radius)

                render.text(FONT, pos + (icon_box_size - icon_size) / 2, icon_color, nil, icon)

                pos.x = pos.x + icon_box_size.x + GAP_BETWEEN

                render.blur(pos, pos + text_box_size, 1.8, alpha_value, box_radius)
                render.rect(pos, pos + text_box_size, box_color, box_radius)

                local progress_bar do
                    local bar_pos = pos:clone()

                    local bar_size = vector(
                        text_box_size.x, box_radius
                    )

                    bar_pos.y = bar_pos.y + text_box_size.y - bar_size.y

                    local bar_color = ref.color:get()
                    bar_color.a = bar_color.a * alpha_value

                    local clip_a = vector(bar_pos.x, bar_pos.y + bar_size.y - 3)
                    local clip_b = vector(bar_pos.x + bar_size.x * modifier, bar_pos.y + bar_size.y)

                    render.push_clip_rect(clip_a, clip_b)

                    render.rect(bar_pos, bar_pos + bar_size, bar_color, { 0, 0, box_radius, box_radius })

                    render.pop_clip_rect()
                end

                render.text(FONT, pos + (text_box_size - text_size) / 2, text_color, nil, text)

                window:set_size(max_box_size)
                window:update()
            end
        end

        new.on_render = create_debug_callback('visuals_velocity_warning.new.on_render', new.on_render)

        local callbacks do
            local function on_enabled(item)
                events.render(new.on_render, item:get())
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'visuals_aspect_ratio'

    local aspect_ratio do
        local ref = resource.visuals.aspect_ratio

        local r_aspectratio = cvar.r_aspectratio

        local function restore_value()
            r_aspectratio:float(tonumber(r_aspectratio:string()), true)
        end

        local function update_value(value)
            r_aspectratio:float(value, true)
        end

        local function on_shutdown()
            restore_value()
        end

        on_shutdown = create_debug_callback('visuals_aspect_ratio.on_shutdown', on_shutdown)

        local callbacks do
            local function on_value(item)
                update_value(item:get() * 0.01)
            end

            local function on_enabled(item)
                local value = item:get()

                if not value then
                    restore_value()
                end

                if value then
                    ref.value:set_callback(on_value, true)
                else
                    ref.value:unset_callback(on_value)
                end

                events.shutdown(on_shutdown, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'visuals_viewmodel'

    local viewmodel do
        local ref = resource.visuals.viewmodel

        local WEAPONTYPE_KNIFE = 0

        local cl_righthand = cvar.cl_righthand
        local viewmodel_fov = cvar.viewmodel_fov

        local viewmodel_offset_x = cvar.viewmodel_offset_x
        local viewmodel_offset_y = cvar.viewmodel_offset_y
        local viewmodel_offset_z = cvar.viewmodel_offset_z

        local old_weaponindex = nil

        local function get_original(convar)
            return tonumber(convar:string())
        end

        local function update_knife_hand(is_knife)
            local is_right = cl_righthand:string() == '1'

            if is_right then
                cl_righthand:int(is_knife and 0 or 1, true)
            else
                cl_righthand:int(is_knife and 1 or 0, true)
            end
        end

        local function shutdown_viewmodel()
            viewmodel_fov:float(get_original(viewmodel_fov), false)

            viewmodel_offset_x:float(get_original(viewmodel_offset_x), false)
            viewmodel_offset_y:float(get_original(viewmodel_offset_y), false)
            viewmodel_offset_z:float(get_original(viewmodel_offset_z), false)

            cl_righthand:int(cl_righthand:string() == '1' and 1 or 0, false)
        end

        local function on_shutdown()
            shutdown_viewmodel()
        end

        local function on_pre_render()
            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return
            end

            local weapon_index = weapon:get_weapon_index()

            if old_weaponindex ~= weapon_index then
                old_weaponindex = weapon_index

                local weapon_info = weapon:get_weapon_info()

                if weapon_info == nil then
                    return
                end

                local weapon_type = weapon_info.weapon_type
                local is_knife = weapon_type == WEAPONTYPE_KNIFE

                update_knife_hand(is_knife)
            end
        end

        on_pre_render = create_debug_callback('visuals_viewmodel.on_pre_render', on_pre_render)
        on_shutdown = create_debug_callback('visuals_viewmodel.on_shutdown', on_shutdown)

        local function update_event_callbacks(value)
            if not value then
                shutdown_viewmodel()
            end

            if not value then
                events.pre_render(on_pre_render, value)
            end

            events.shutdown(on_shutdown, value)
        end

        local callbacks do
            local function on_fov(item)
                viewmodel_fov:float(
                    item:get() * 0.01, true
                )
            end

            local function on_offset_x(item)
                viewmodel_offset_x:float(
                    item:get() * 0.01, true
                )
            end

            local function on_offset_y(item)
                viewmodel_offset_y:float(
                    item:get() * 0.01, true
                )
            end

            local function on_offset_z(item)
                viewmodel_offset_z:float(
                    item:get() * 0.01, true
                )
            end

            local function on_opposite_knife_hand(item)
                local value = item:get()

                if not value then
                    cl_righthand:int(cl_righthand:string() == '1' and 1 or 0, false)
                else
                    old_weaponindex = nil
                end

                events.pre_render(on_pre_render, value)
            end

            local function on_enabled(item)
                local value = item:get()

                if value then
                    ref.fov:set_callback(on_fov, true)
                    ref.offset_x:set_callback(on_offset_x, true)
                    ref.offset_y:set_callback(on_offset_y, true)
                    ref.offset_z:set_callback(on_offset_z, true)
                    ref.opposite_knife_hand:set_callback(on_opposite_knife_hand, true)
                else
                    ref.fov:unset_callback(on_fov)
                    ref.offset_x:unset_callback(on_offset_x)
                    ref.offset_y:unset_callback(on_offset_y)
                    ref.offset_z:unset_callback(on_offset_z)
                    ref.opposite_knife_hand:unset_callback(on_opposite_knife_hand)
                end

                update_event_callbacks(value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'visuals_custom_scope'

    local custom_scope do
        local ref = resource.visuals.custom_scope

        local RESOLUTION = 1 / 1080

        local ref_scope_overlay = ui.find(
            'Visuals', 'World', 'Main', 'Override Zoom', 'Scope Overlay'
        )

        local alpha = 0

        local function on_render()
            local me = entity.get_local_player()

            if me == nil or not me:is_alive() then
                return
            end

            alpha = motion.interp(
                alpha, me.m_bIsScoped, 0.05
            )

            if alpha == 0.0 then
                return
            end

            local screen = render.screen_size()
            local center = screen * 0.5

            local is_rotate_angle = ref.style:get() == 'Rotated'

            local offset = ref.offset:get() * screen.y * RESOLUTION
            local position = ref.position:get() * screen.y * RESOLUTION

            local thickness = ref.thickness:get()

            local color_a = ref.color:get 'Main' [1]
            local color_b = ref.color:get 'Edge' [1]

            offset = round(offset)
            position = round(position)

            color_a.a = color_a.a * alpha
            color_b.a = color_b.a * alpha

            if is_rotate_angle then
                render.push_rotation(45)
            end

            local top_line do
                local pos_a = vector(center.x + 0.5 - thickness * 0.5, center.y - offset + 1)
                local pos_b = vector(center.x + 0.5 + thickness * 0.5, center.y - position + 1)

                render.gradient(pos_a, pos_b, color_a, color_a, color_b, color_b)
            end

            local bottom_line do
                local pos_a = vector(center.x + 0.5 - thickness * 0.5, center.y + offset)
                local pos_b = vector(center.x + 0.5 + thickness * 0.5, center.y + position)

                render.gradient(pos_a, pos_b, color_a, color_a, color_b, color_b)
            end

            local left_line do
                local pos_a = vector(center.x - offset + 1, center.y + 0.5 - thickness * 0.5)
                local pos_b = vector(center.x - position + 1, center.y + 0.5 + thickness * 0.5)

                render.gradient(pos_a, pos_b, color_a, color_b, color_a, color_b)
            end

            local right_line do
                local pos_a = vector(center.x + offset, center.y + 0.5 - thickness * 0.5)
                local pos_b = vector(center.x + position, center.y + 0.5 + thickness * 0.5)

                render.gradient(pos_a, pos_b, color_a, color_b, color_a, color_b)
            end

            if is_rotate_angle then
                render.pop_rotation()
            end
        end

        on_render = create_debug_callback('visuals_custom_scope.on_render', on_render)
        on_shutdown = create_debug_callback('visuals_custom_scope.on_shutdown', on_shutdown)

        local function on_shutdown()
            ref_scope_overlay:override()
        end

        local function update_event_callbacks(value)
            if not value then
                ref_scope_overlay:override()
            end

            events.render(on_render, value)
            events.shutdown(on_shutdown, value)
        end

        local callbacks do
            local function on_enabled(item)
                local value = item:get()

                if value then
                    ref_scope_overlay:override('Remove All')
                end

                update_event_callbacks(value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'visuals_grenade_radius'

    local grenade_radius do
        local ref = resource.visuals.grenade_radius

        local smoke_data = { }
        local molotov_data = { }

        local function erase_data(data)
            for k in pairs(data) do
                data[k] = nil
            end
        end

        local function update_smoke_data()
            local entities = entity.get_entities(
                'CSmokeGrenadeProjectile'
            )

            local index_map = { }

            for i = 1, #entities do
                local ent = entities[i]

                if not ent.m_bDidSmokeEffect then
                    goto continue
                end

                local index = ent:get_index()

                if smoke_data[index] == nil then
                    local origin = ent:get_origin()

                    smoke_data[index] = {
                        index = index,
                        origin = origin,

                        alpha = 0.0,
                        radius = 125
                    }
                end

                index_map[index] = true

                ::continue::
            end

            for index in pairs(smoke_data) do
                if index_map[index] == nil then
                    smoke_data[index] = nil
                end
            end
        end

        local function update_molotov_data()
            local entities = entity.get_entities 'CInferno'

            local index_map = { }

            for i = 1, #entities do
                local ent = entities[i]

                local fire_count = ent.m_fireCount

                if fire_count == 0 then
                    goto continue
                end

                local index = ent:get_index()

                if molotov_data[index] == nil then
                    local origin = ent:get_origin()

                    molotov_data[index] = {
                        index = index,
                        origin = origin,

                        alpha = 0.0,
                        radius = 0,

                        fire_count = 0
                    }
                end

                local data = molotov_data[index]

                if data.fire_count < fire_count then
                    data.fire_count = fire_count

                    local max_distance_sqr = 0

                    local edge_a = nil
                    local edge_b = nil

                    local cells = { }
                    local cells_count = 0

                    for j = 0, fire_count - 1 do
                        if ent.m_bFireIsBurning[j] then
                            local fire_pos = vector(
                                ent.m_fireXDelta[j],
                                ent.m_fireYDelta[j],
                                ent.m_fireZDelta[j]
                            )

                            cells_count = cells_count + 1
                            cells[cells_count] = fire_pos
                        end
                    end

                    for j = 1, cells_count do
                        for k = 1, cells_count do
                            local pos_a = cells[j]
                            local pos_b = cells[k]

                            local delta = pos_b - pos_a
                            local distsqr = delta:lengthsqr()

                            if max_distance_sqr < distsqr then
                                max_distance_sqr = distsqr

                                edge_a = pos_a
                                edge_b = pos_b
                            end
                        end
                    end

                    if edge_a ~= nil and edge_b ~= nil then
                        data.radius = math.sqrt(max_distance_sqr) / 2 + 40
                    end
                end

                index_map[index] = true
                ::continue::
            end

            for index in pairs(molotov_data) do
                if index_map[index] == nil then
                    molotov_data[index] = nil
                end
            end
        end

        local function on_render()
            local dt = globals.frametime

            local smoke_color = ref.smoke_color:get()
            local molotov_color = ref.molotov_color:get()

            for _, v in pairs(smoke_data) do
                -- doing animation here to make it smoother
                v.alpha = math.min(v.alpha + dt * 4.0, 1.0)

                local radius = v.radius * v.alpha

                render.circle_3d_outline(
                    v.origin, smoke_color,
                    radius, 0.0, 1.0, 1
                )
            end

            for _, v in pairs(molotov_data) do
                -- doing animation here to make it smoother
                v.alpha = math.min(v.alpha + dt * 4.0, 1.0)

                local radius = v.radius * v.alpha

                render.circle_3d_outline(
                    v.origin, molotov_color,
                    radius, 0.0, 1.0, 1
                )
            end
        end

        update_smoke_data = create_debug_callback('visuals_grenade_radius.update_smoke_data', update_smoke_data)
        update_molotov_data = create_debug_callback('visuals_grenade_radius.update_molotov_data', update_molotov_data)
        on_render = create_debug_callback('visuals_grenade_radius.on_render', on_render)

        local callbacks do
            local function on_smoke(item)
                local value = item:get()

                if not value then
                    erase_data(smoke_data)
                end

                events.net_update_start(
                    update_smoke_data, value
                )
            end

            local function on_molotov(item)
                local value = item:get()

                if not value then
                    erase_data(molotov_data)
                end

                events.net_update_start(
                    update_molotov_data, value
                )
            end

            local function on_enabled(item)
                local value = item:get()

                if not value then
                    erase_data(smoke_data)
                    erase_data(molotov_data)

                    events.net_update_start(update_smoke_data, false)
                    events.net_update_start(update_molotov_data, false)
                end

                if value then
                    ref.smoke:set_callback(on_smoke, true)
                    ref.molotov:set_callback(on_molotov, true)
                else
                    ref.smoke:unset_callback(on_smoke)
                    ref.molotov:unset_callback(on_molotov)
                end

                events.render(on_render, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'misc_clantag'

    local clantag do
        local ref = resource.visuals.clantag

        local ref_clan_tag = ui.find(
            'Miscellaneous', 'Main', 'In-Game', 'Clan Tag'
        )

        local FROST_LIST = {
            '❄',
            '❄ f',
            '❄ fr',
            '❄ fro',
            '❄ fros',
            '❄ frost',
            '❄ frost.',
            '❄ frost.l',
            '❄ frost.lu',
            '❄ frost.lua',
            '❄ frost.lua',
            '❄ frost.lua',
            '❄ frost.lua',
            '❄ frost.lua',
            '❄ rost.lua',
            '❄ ost.lua',
            '❄ st.lua',
            '❄ t.lua',
            '❄ .lua',
            '❄ lua',
            '❄ ua',
            '❄ a',
            '❄'
		}

        local prev_text = nil
        local current_list = FROST_LIST

        local function generate_list(value)
            local list = { }

            table.insert(list, '')

            for i = 1, #value do
                table.insert(list, value:sub(1, i))
            end

            for _ = 1, 5 do
                table.insert(list, value)
            end

            for i = 1, #value do
                table.insert(list, value:sub(i, #value))
            end

            table.insert(list, '')

            return list
        end

        local function get_time()
            return round(globals.curtime * 2.4)
        end

        local function on_level_init()
            prev_text = nil
        end

        local function on_net_update_end()
			if not globals.is_in_game then
                return
            end

			local time = get_time()

			local index = time % #current_list + 1
            local text = current_list[index] or ''

			if prev_text ~= text then
                prev_text = text
                common.set_clan_tag(text)
            end
        end

        on_level_init = create_debug_callback('misc_clantag.on_level_init', on_level_init)
        on_net_update_end = create_debug_callback('misc_clantag.on_net_update_end', on_net_update_end)

        local callbacks do
            local function on_input_static(item)
                local value = item:get()

                if value ~= '' then
                    current_list = { value }
                else
                    current_list = FROST_LIST
                end
            end

            local function on_input_animated(item)
                local value = item:get()

                if value ~= '' then
                    current_list = generate_list(value)
                else
                    current_list = FROST_LIST
                end
            end

            local function on_style(item)
                local value = item:get()

                if value == 'Static' then
                    ref.input:unset_callback(on_input_animated)
                    ref.input:set_callback(on_input_static, true)
                end

                if value == 'Animated' then
                    ref.input:unset_callback(on_input_static)
                    ref.input:set_callback(on_input_animated, true)
                end
            end

            local function on_mode(item)
                local value = item:get()

                if value == 'Frost' then
                    current_list = FROST_LIST
                end

                if value == 'Custom' then
                    ref.style:set_callback(on_style, true)
                else
                    ref.style:unset_callback(on_style)

                    ref.input:unset_callback(on_input_static)
                    ref.input:unset_callback(on_input_animated)
                end
            end

            local function on_enabled(item)
                local value = item:get()

                if not value then
                    common.set_clan_tag ''
                end

                if value then
                    ref.mode:set_callback(on_mode, true)
                else
                    ref.mode:unset_callback(on_mode)
                    ref.style:unset_callback(on_style)
                    ref.input:unset_callback(on_input_static)
                    ref.input:unset_callback(on_input_animated)
                end

                ref_clan_tag:override(value and false or nil)

                events.level_init(on_level_init, value)
                events.net_update_end(on_net_update_end, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'visuals_hit_markers'

    local hit_markers do
        local ref = resource.visuals.hit_markers

        local kibit = { } do
            local queue = { }

            local function on_render()
                if not globals.is_in_game then
                    return
                end

                local time = globals.realtime

                local size = ref.kibit.size:get()
                local thickness = ref.kibit.thickness:get()

                local color_h = ref.kibit.color:get('Horizontal')[1]
                local color_v = ref.kibit.color:get('Vertical')[1]

                for i = #queue, 1, -1 do
                    local data = queue[i]

                    if time > data.time then
                        table.remove(queue, i)
                    end
                end

                for i = 1, #queue do
                    local data = queue[i]

                    local alpha = 1.0

                    local liferemaining = data.time - time

                    if liferemaining < 0.7 then
                        alpha = liferemaining / 0.7
                    end

                    local screen = render.world_to_screen(data.point)

                    if screen == nil then
                        goto continue
                    end

                    local thickness = thickness * 0.5
                    local size = size + thickness

                    local v_0 = vector(screen.x - thickness, screen.y - size)
                    local v_1 = vector(screen.x + thickness, screen.y + size)

                    local h_0 = vector(screen.x - size, screen.y - thickness)
                    local h_1 = vector(screen.x + size, screen.y + thickness)

                    local color_h = color_h:clone()
                    local color_v = color_v:clone()

                    color_h.a = color_h.a * alpha
                    color_v.a = color_v.a * alpha

                    render.rect(h_0, h_1, color_h)
                    render.rect(v_0, v_1, color_v)

                    ::continue::
                end
            end

            local function on_aim_ack(e)
                local time = globals.realtime + 3.0

                table.insert(queue, {
                    time = time,
                    point = e.aim
                })
            end

            on_render = create_debug_callback('visuals_hit_markers.kibit.on_render', on_render)
            on_aim_ack = create_debug_callback('visuals_hit_markers.kibit.on_aim_ack', on_aim_ack)

            function kibit.set(value)
                if not value then
                    for i = 1, #queue do
                        queue[i] = nil
                    end
                end

                events.render(on_render, value)
                events.aim_ack(on_aim_ack, value)
            end
        end

        local screen = { } do
            local hurt_time = 0.0

            local function on_render()
                if not globals.is_in_game or hurt_time <= 0 then
                    return
                end

                local alpha = 1.0

                if hurt_time < 0.25 then
                    alpha = hurt_time / 0.25
                end

                local col = ref.screen.color:get()

                local screen = render.screen_size()
                local center = screen / 2

                col.a = col.a * alpha

                render.line(vector(center.x - 10, center.y - 10), vector(center.x - 5, center.y - 5), col)
                render.line(vector(center.x + 10, center.y - 10), vector(center.x + 5, center.y - 5), col)
                render.line(vector(center.x + 10, center.y + 10), vector(center.x + 5, center.y + 5), col)
                render.line(vector(center.x - 10, center.y + 10), vector(center.x - 5, center.y + 5), col)

                hurt_time = math.max(hurt_time - globals.frametime, 0.0)
            end

            local function on_player_hurt(e)
                local me = entity.get_local_player()

                local userid = entity.get(e.userid, true)
                local attacker = entity.get(e.attacker, true)

                if userid == me or attacker ~= me then
                    return
                end

                hurt_time = 0.5
            end

            on_render = create_debug_callback('visuals_hit_markers.screen.on_render', on_render)
            on_player_hurt = create_debug_callback('visuals_hit_markers.screen.on_player_hurt', on_player_hurt)

            function screen.set(value)
                if not value then
                    hurt_time = 0.0
                end

                events.render(on_render, value)
                events.player_hurt(on_player_hurt, value)
            end
        end

        local world = { } do
            local queue = { }

            local function on_render()
                if not globals.is_in_game then
                    return
                end

                local time = globals.realtime

                local icon = ui.get_icon 'snowflake'

                local color = ref.world.color:get()
                local should_draw_glow = ref.world.add_glow:get()

                for i = #queue, 1, -1 do
                    local data = queue[i]

                    if time > data.time then
                        table.remove(queue, i)
                    end
                end

                for i = 1, #queue do
                    local data = queue[i]

                    local alpha = 1.0

                    local liferemaining = data.time - time

                    if liferemaining < 0.7 then
                        alpha = liferemaining / 0.7
                    end

                    local screen = render.world_to_screen(data.point)

                    if screen == nil then
                        goto continue
                    end

                    local text_color = color:clone()
                    text_color.a = text_color.a * alpha

                    if should_draw_glow then
                        render.shadow(screen, screen, text_color, 28)
                    end

                    render.text(1, screen, text_color, 'c', icon)

                    ::continue::
                end
            end

            local function on_aim_ack(e)
                local time = globals.realtime + 3.0

                table.insert(queue, {
                    time = time,
                    point = e.aim
                })
            end

            on_render = create_debug_callback('visuals_hit_markers.world.on_render', on_render)
            on_aim_ack = create_debug_callback('visuals_hit_markers.world.on_aim_ack', on_aim_ack)

            function world.set(value)
                if not value then
                    for i = 1, #queue do
                        queue[i] = nil
                    end
                end

                events.render(on_render, value)
                events.aim_ack(on_aim_ack, value)
            end
        end

        local callbacks do
            local function on_kibit(item)
                kibit.set(item:get())
            end

            local function on_screen(item)
                screen.set(item:get())
            end

            local function on_world(item)
                world.set(item:get())
            end

            local function on_enabled(item)
                local value = item:get()

                if not value then
                    kibit.set(false)
                    screen.set(false)
                    world.set(false)
                end

                if value then
                    ref.kibit.enabled:set_callback(on_kibit, true)
                    ref.screen.enabled:set_callback(on_screen, true)
                    ref.world.enabled:set_callback(on_world, true)
                else
                    ref.kibit.enabled:unset_callback(on_kibit)
                    ref.screen.enabled:unset_callback(on_screen)
                    ref.world.enabled:unset_callback(on_world)
                end
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'visuals_skeet_indicators'

    local skeet_indicators do
        local ref = resource.visuals.skeet_indicators

        local ZONE = 480
        local SPACING = 8

        local TEXT_OFFSET = 24

        local VERTICAL_PADDING = 4
        local HORIZONTAL_OFFSET = 3

        local FONT = render.load_font(
            'C:\\Windows\\Fonts\\calibrib.ttf',
            vector(25, 23.5, 0), 'a'
        )

        local ref_dormant_aimbot = ui.find(
            'Aimbot', 'Ragebot', 'Main', 'Enabled', 'Dormant Aimbot'
        )

        local ref_double_tap = ui.find(
            'Aimbot', 'Ragebot', 'Main', 'Double Tap'
        )

        local ref_hide_shots = ui.find(
            'Aimbot', 'Ragebot', 'Main', 'Hide Shots'
        )

        local ref_body_aim = ui.find(
            'Aimbot', 'Ragebot', 'Safety', 'Body Aim'
        )

        local ref_safe_points = ui.find(
            'Aimbot', 'Ragebot', 'Safety', 'Safe Points'
        )

        local ref_min_damage = ui.find(
            'Aimbot', 'Ragebot', 'Selection', 'Min. Damage'
        )

        local ref_fake_duck = ui.find(
            'Aimbot', 'Anti Aim', 'Misc', 'Fake Duck'
        )

        local ref_freestanding = ui.find(
            'Aimbot', 'Anti Aim', 'Angles', 'Freestanding'
        )

        local ref_fake_latancy = ui.find(
            'Miscellaneous', 'Main', 'Other', 'Fake Latency'
        )

        local shots, hit = 0, 0
        local hit_ratio = 100.0

        local DrawCmd = { } do
            DrawCmd.__index = DrawCmd

            function DrawCmd:new(id, size)
                return setmetatable({
                    id = id,
                    size = size
                }, self)
            end

            function DrawCmd:draw(pos, col, ...)
                render.texture(self.id, pos, self.size, col, ...)
            end
        end

        local textures = { } do
            textures.bomb_c4 = render.load_image_from_file(
                'materials\\panorama\\images\\icons\\ui\\bomb_c4.svg', vector(32, 32)
            )
        end

        local draw_commands = { } do
            draw_commands.bomb_c4 = DrawCmd:new(
                textures.bomb_c4, vector(32, 29)
            )
        end

        local function get_value(item)
            local override = item:get_override()

            if override ~= nil then
                return override
            end

            return item:get()
        end

        local function is_bind_active(item)
            local bind = binds_ctx.get(item)
            return bind ~= nil and bind.active
        end

        local function get_csgo_damage(damage, armor_value)
            local armor_ratio = 0.5
            local armor_bonus = 0.5

            if armor_value > 0 then
                local new = damage * armor_ratio
                local armor = (damage - new) * armor_bonus

                if armor > armor_value then
                    armor = armor_value * (1.0 / armor_bonus)
                    new = damage - armor
                end

                damage = new
            end

            return damage
        end

        local function get_bomb_damage(player, c4)
            local damage_percentage = 1.0

            local damage = 500
            local bomb_radius = damage * 3.5
            local distance_to_me = (c4:get_origin() - player:get_eye_position()):length()
            local sigma = bomb_radius / 3.0
            local gaussian_fallof = math.exp(-distance_to_me * distance_to_me / (2.0 * sigma * sigma))
            local adjusted_damage = damage * gaussian_fallof * damage_percentage

            return get_csgo_damage(adjusted_damage, player.m_ArmorValue)
        end

        local draw_queue = { }

        local ping_value = 0.0
        local hs_value = 0.0
        local dt_value = 0.0
        local da_value = 0.0
        local fd_value = 0.0
        local safe_value = 0.0
        local body_value = 0.0
        local dmg_value = 0.0
        local fs_value = 0.0
        local ratio_value = 0.0

        local function update_animation(value, target, t)
            if ref.style:get() == 'Old' then
                return target and 1.0 or 0.0
            end

            return motion.interp(value, target, t)
        end

        local function clear_draw_queue()
            for i = 1, #draw_queue do
                draw_queue[i] = nil
            end
        end

        local function add_indicator_ex(data)
            if ref.style:get() == 'Old' then
                data.icon = nil
            end

            if data.alpha == nil then
                data.alpha = 1.0
            end

            local text_size = render.measure_text(FONT, nil, data.text)
            local screen_size = render.screen_size()

            text_size.y = text_size.y + VERTICAL_PADDING * 2

            local prev = draw_queue[#draw_queue]

            local offset = prev == nil
                and screen_size.y - (screen_size.y - ZONE) / 2
                or prev.offset - (prev.text_size.y + SPACING) * prev.alpha

            -- offset = offset - ((text_size.y + SPACING) * data.alpha) * 2

            data.offset = offset
            data.text_size = text_size

            table.insert(draw_queue, data)

            return offset
        end

        local function add_indicator(col, icon, text, alpha)
            return add_indicator_ex {
                color = col,
                text = text,
                icon = icon,
                alpha = alpha
            }
        end

        local function update_local_indicators(player)
            -- update local indicators

            local is_new = ref.style:get() == 'New'

            local is_min_damage = is_bind_active(ref_min_damage)
            local is_fake_latency = get_value(ref_fake_latancy) > 0

            local is_fake_duck = get_value(ref_fake_duck)
            local is_freestanding = get_value(ref_freestanding)

            local is_body_aim = get_value(ref_body_aim) == 'Force'
            local is_safe_points = get_value(ref_safe_points) == 'Force'

            local is_double_tap = get_value(ref_double_tap) and not is_fake_duck
            local is_hide_shots = get_value(ref_hide_shots) and not is_fake_duck and not is_double_tap

            local is_dormant_aimbot = get_value(ref_dormant_aimbot)

            ping_value = update_animation(ping_value, is_fake_latency and ref.list:get 'Fake Latency', 0.05)
            hs_value = update_animation(hs_value, is_hide_shots and ref.list:get 'Hide Shots', 0.05)
            dt_value = update_animation(dt_value, is_double_tap and ref.list:get 'Double Tap', 0.05)
            da_value = update_animation(da_value, is_dormant_aimbot and ref.list:get 'Dormant Aimbot', 0.05)
            fd_value = update_animation(fd_value, is_fake_duck and ref.list:get 'Fake Duck', 0.05)
            safe_value = update_animation(safe_value, is_safe_points and ref.list:get 'Force Safe Points', 0.05)
            body_value = update_animation(body_value, is_body_aim and ref.list:get 'Force Body Aim', 0.05)
            dmg_value = update_animation(dmg_value, is_min_damage and ref.list:get 'Min. Damage', 0.05)
            fs_value = update_animation(fs_value, is_freestanding and ref.list:get 'Freestanding', 0.05)
            ratio_value = update_animation(ratio_value, ref.list:get 'Hit/Miss Ratio', 0.05)

            local default_color = color(
                255, 255, 255, 200
            )

            local uncharged_color = color(
                255, 0, 50, 255
            )

            if ping_value > 0 then
                local col = default_color:clone()
                local netchannel = utils.net_channel()

                if netchannel ~= nil then
                    local wish_latency = get_value(ref_fake_latancy)

                    local latency = math.clamp(netchannel.latency[0] + netchannel.latency[1], 0.001, 0.2)
                    local avg_latency = math.clamp((wish_latency * 0.001) + netchannel.avg_latency[1], 0.001, 0.2)

                    local pct = math.clamp(latency / avg_latency, 0.0, 1.0)

                    if pct < 0.5 then
                        col = color(250, 234, 232, 255)
                            :lerp(color(213, 197, 84, 255), pct * 2)
                    else
                        col = color(213, 197, 84, 255)
                            :lerp(color(143, 194, 21, 255), (pct - 0.5) * 2)
                    end
                end

                add_indicator(col, ui.get_icon 'sun', 'PING', ping_value)
            end

            if hs_value > 0.0 then
                add_indicator(default_color, ui.get_icon 'eye-slash', 'OSAA', hs_value)
            end

            if dt_value > 0.0 then
                local text_icon = ui.get_icon 'xmark'
                local text_color = uncharged_color:clone()

                if rage.exploit:get() == 1 then
                    text_icon = ui.get_icon 'arrows-cross'
                    text_color = default_color:clone()
                end

                add_indicator(text_color, text_icon, 'DT', dt_value)
            end

            if da_value > 0.0 then
                add_indicator(default_color, ui.get_icon 'eye', 'DA', da_value)
            end

            if fd_value > 0.0 then
                add_indicator(default_color, ui.get_icon 'wheelchair', 'DUCK', fd_value)
            end

            if safe_value > 0.0 then
                add_indicator(default_color, ui.get_icon 'shield', 'SAFE', safe_value)
            end

            if body_value > 0.0 then
                add_indicator(default_color, ui.get_icon 'bullseye-arrow', 'BODY', body_value)
            end

            if dmg_value > 0.0 then
                add_indicator(default_color, ui.get_icon 'dial-min', 'MD', dmg_value)
            end

            if fs_value > 0.0 then
                add_indicator(default_color, ui.get_icon 'arrows-turn-right', 'FS', fs_value)
            end

            if ratio_value > 0.0 then
                add_indicator(default_color, ui.get_icon 'wave-pulse', hit_ratio .. '%', ratio_value)
            end
        end

        local function update_player_bomb(player_resource, player)
            local weapon = player:get_player_weapon()

            if weapon == nil then
                return
            end

            local is_started_arming = weapon.m_bStartedArming

            if not is_started_arming then
                return
            end

            local armed_time = weapon.m_fArmedTime

            if armed_time == nil then
                return
            end

            local origin = player:get_origin()

            local bombsite_a = player_resource.m_bombsiteCenterA
            local bombsite_b = player_resource.m_bombsiteCenterB

            local distancesqr_a = origin:distsqr(bombsite_a)
            local distancesqr_b = origin:distsqr(bombsite_b)

            local bombsite = distancesqr_a < distancesqr_b and 'A' or 'B'

            local planting_time = armed_time - globals.curtime
            local progress_percent = planting_time / 3.0

            add_indicator_ex {
                text = bombsite,
                color = color(252, 243, 105, 255),

                progress = 1 - progress_percent,
                draw_cmd = draw_commands.bomb_c4
            }
        end

        local function update_planted_bomb(me, c4)
            local is_defused = c4.m_bBombDefused
            local is_bomb_ticking = c4.m_bBombTicking

            if not is_bomb_ticking or is_defused then
                return
            end

            local curtime = globals.curtime

            local blow_time = c4.m_flC4Blow
            local remaining_time = blow_time - curtime

            if remaining_time > 0 then
                local defuser = c4.m_hBombDefuser

                if defuser ~= nil then
                    local screen_size = render.screen_size()

                    local count_down = c4.m_flDefuseCountDown
                    local defuse_time = count_down - curtime

                    local progress_percent = defuse_time / 10

                    local col = blow_time < count_down
                        and color(235, 50, 75, 125)
                        or color(50, 235, 75, 125)

                    local height = (screen_size.y - 2) * (1 - progress_percent)

                    render.rect(vector(0, 0), vector(20, screen_size.y), color(0, 0, 0, 115))
                    render.rect(vector(1, 1 + height), vector(19, screen_size.y - 1), col)
                end

                local text = string.format(
                    '%s - %.1fs', c4.m_nBombSite == 1 and 'B' or 'A', remaining_time
                )

                add_indicator_ex {
                    text = text,
                    color = color(255, 255, 255, 200 ),

                    draw_cmd = draw_commands.bomb_c4
                }
            end

            local health = me.m_iHealth
            local damage = get_bomb_damage(me, c4)

            damage = math.floor(damage)

            if health <= damage then
                add_indicator(color(255, 0, 50, 255), nil, 'FATAL')
            elseif damage > 0 then
                add_indicator(color(252, 243, 105, 255), nil, string.format('-%d HP', damage))
            end
        end

        local function update_bomb_indicators(me)
            local game_rules = entity.get_game_rules()

            if game_rules == nil then
                return
            end

            local player_resource = entity.get_player_resource()

            if player_resource == nil then
                return
            end

            local is_planted = game_rules.m_bBombPlanted
            local player_c4 = player_resource.m_iPlayerC4

            if player_c4 ~= nil and player_c4 ~= 0 then
                local player = entity.get(player_c4)

                if player ~= nil then
                    update_player_bomb(player_resource, player)
                end
            end

            if is_planted then
                local planted_c4 = entity.get_entities 'CPlantedC4' [1]

                if planted_c4 ~= nil then
                    update_planted_bomb(me, planted_c4)
                end
            end
        end

        local function update_indicators()
            local me = entity.get_local_player()

            if me == nil then
                return
            end

            if me:is_alive() then
                update_local_indicators(me)
            end

            if ref.list:get 'Bomb Information' then
                update_bomb_indicators(me)
            end
        end

        local function draw_shadow(pos_a, pos_b, alpha)
            local center = (pos_a + pos_b) / 2

            local col_begin = color(0, 0, 0, 0 * alpha)
            local col_finish = color(0, 0, 0, 50 * alpha)

            render.gradient(pos_a, vector(center.x, pos_b.y), col_begin, col_finish, col_begin, col_finish)
            render.gradient(pos_b, vector(center.x, pos_a.y), col_begin, col_finish, col_begin, col_finish)
        end

        local function draw_gradient(pos_a, pos_b, alpha)
            local col_begin = color(0, 0, 0, 50 * alpha)
            local col_finish = color(0, 0, 0, 0 * alpha)

            render.gradient(pos_a, pos_b, col_begin, col_finish, col_begin, col_finish)
        end

        local function draw_progress_circle(pos, col, radius, start_degrees, percentage, thickness)
            render.circle_outline(pos, color(0, 0, 0, 255), radius, start_degrees, 1.0, thickness)
            render.circle_outline(pos, col, radius - 1, start_degrees, percentage, thickness - 2)
        end

        local function draw_indicators()
            local is_new = ref.style:get() == 'New'

            local horizontal_offset = is_new
                and 5 or HORIZONTAL_OFFSET

            local text_offset = is_new
                and 10 or TEXT_OFFSET

            for i = 1, #draw_queue do
                local data = draw_queue[i]

                if data.color == nil then
                    goto continue
                end

                local col = data.color

                local icon = data.icon
                local text = data.text

                local alpha = data.alpha

                local draw_cmd = data.draw_cmd
                local progress = data.progress

                local position = vector(horizontal_offset, data.offset)
                local text_pos = position + vector(text_offset, VERTICAL_PADDING)

                local text_size = data.text_size + vector(50)
                local icon_size = render.measure_text(FONT, '', icon)

                text_pos.y = text_pos.y + 2

                if draw_cmd ~= nil then
                    text_size.x = text_size.x + draw_cmd.size.x + 5
                end

                if icon ~= nil then
                    text_size.x = text_size.x + icon_size.x + 5
                end

                if progress ~= nil then
                    text_size.x = text_size.x + 30
                end

                local shadow_text = color(0, 0, 0, 128)
                local text_color = col:clone()

                shadow_text.a = shadow_text.a * alpha
                text_color.a = text_color.a * alpha

                -- if is_new then
                --     local rect_render do
                --         local pos = vector(position.x, position.y)
                --         local size = vector(5, text_size.y)

                --         render.rect(pos, pos + size, text_color)

                --         position.x = position.x + size.x
                --         text_pos.x = text_pos.x + size.x
                --     end

                --     draw_gradient(position, position + text_size, alpha)
                -- end

                draw_shadow(position, position + text_size, alpha)

                if draw_cmd ~= nil then
                    local texture_pos = text_pos:clone()

                    texture_pos.y = position.y + (text_size.y - draw_cmd.size.y) / 2

                    draw_cmd:draw(texture_pos, col, 'f')

                    text_pos.x = text_pos.x + draw_cmd.size.x + 5
                end

                if icon ~= nil then
                    render.text(FONT, text_pos + 1, shadow_text, '', icon)
                    render.text(FONT, text_pos, text_color, '', icon)

                    text_pos.x = text_pos.x + icon_size.x + 5
                end

                render.text(FONT, text_pos + 1, shadow_text, '', text)
                render.text(FONT, text_pos, text_color, '', text)

                text_pos.x = text_pos.x + data.text_size.x

                if progress ~= nil then
                    local radius = 10

                    local circle_x = text_pos.x + (radius / 2) + 12
                    local circle_y = position.y + text_size.y / 2

                    local circle_pos = vector(circle_x, circle_y)
                    local circle_col = color(255, 255, 255, 200)

                    circle_col.a = circle_col.a * alpha

                    draw_progress_circle(circle_pos, circle_col, 10, 0, progress, 5)
                end

                ::continue::
            end
        end

        function on_render()
            if globals.is_in_game then
                update_indicators()
                draw_indicators()
            end

            clear_draw_queue()
        end

        local function on_aim_ack(e)
            shots = shots + 1

            if e.state == nil then
                hit = hit + 1
            end

            hit_ratio = math.floor(hit / math.max(1, shots) * 100)
        end

        on_render = create_debug_callback('screen_indicators.on_render', on_render)
        on_aim_ack = create_debug_callback('screen_indicators.on_aim_ack', on_aim_ack)

        local function update_event_callbacks(value)
            events.render(on_render, value)
            events.aim_ack(on_aim_ack, value)
        end

        local callbacks do
            local function on_enabled(item)
                update_event_callbacks(item:get())
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end
end

debug_point 'begin_misc'

local misc do
    debug_point 'misc_super_toss'

    local super_toss do
        local ref = resource.misc.grenades

        local ref_weapon_actions = ui.find(
            'Miscellaneous', 'Main', 'Other', 'Weapon Actions'
        )

        local ref_air_strafe = ui.find(
            'Miscellaneous', 'Main', 'Movement', 'Air Strafe'
        )

        local ref_strafe_assist = ui.find(
            'Miscellaneous', 'Main', 'Movement', 'Strafe Assist'
        )

        local GRENADE_SECONDARY_DAMPENING = 0.3

        local function lerp(a, b, t)
            return a + t * (b - a)
        end

        local function resolve_grenade_throw(goal_angles, throw_velocity, throw_strength, abs_velocity)
            goal_angles.x = goal_angles.x - 10 + math.abs(goal_angles.x) / 9

            local goal_forward = vector():angles(goal_angles)
            local player_vel = abs_velocity * 1.25

            local vel = math.clamp(throw_velocity * 0.9, 15, 750)
            local clamped_throw_strength = math.clamp(throw_strength, 0, 1)

            vel = vel * lerp(GRENADE_SECONDARY_DAMPENING, 1.0, clamped_throw_strength)

            local new_forward = goal_forward

            for _ = 1, 8 do
                new_forward = (goal_forward * (new_forward * vel + player_vel):length() - player_vel) / vel
                new_forward:normalize()
            end

            local new_angles = new_forward:angles()

            if new_angles.x > -10 then
                new_angles.x = 0.9 * new_angles.x + 9
            else
                new_angles.x = 1.125 * new_angles.x + 11.25
            end

            return new_angles
        end

        local function on_grenade_override_view(e)
            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return
            end

            local weapon_info = weapon:get_weapon_info()

            if weapon_info == nil then
                return
            end

            local angles = resolve_grenade_throw(
                e.angles,
                weapon_info.throw_velocity,
                weapon.m_flThrowStrength,
                e.velocity
            )

            e.angles =angles
        end

        local function on_createmove(cmd)
            ref_air_strafe:override()
            ref_strafe_assist:override()
            ref_weapon_actions:override()

            if cmd.jitter_move ~= true then
                return
            end

            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return
            end

            local weapon_info = weapon:get_weapon_info()

            if weapon_info == nil or weapon_info.weapon_type ~= 9 then
                return
            end

            if weapon.m_fThrowTime < (globals.curtime - to_time(globals.clock_offset)) then
                return
            end

            cmd.in_speed = true

            local simulation_ctx = me:simulate_movement()
            simulation_ctx:think()

            local angles = resolve_grenade_throw(
                cmd.view_angles,
                weapon_info.throw_velocity,
                weapon.m_flThrowStrength,
                simulation_ctx.velocity
            )

            cmd.view_angles = angles

            ref_air_strafe:override(false)
            ref_strafe_assist:override(false)
            ref_weapon_actions:override('')
        end

        on_createmove = create_debug_callback('misc_super_toss.on_createmove', on_createmove)
        on_grenade_override_view = create_debug_callback('misc_super_toss.on_grenade_override_view', on_grenade_override_view)

        local callbacks do
            local function on_enabled(item)
                local value = item:get(1)

                events.createmove(on_createmove, value)
                events.grenade_override_view(on_grenade_override_view, value)
            end

            ref.select:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'misc_grenade_release'

    local grenade_release do
        local ref = resource.misc.grenades

        local damage = nil

        local function on_createmove(cmd)
            local me = entity.get_local_player()

			if me == nil then
				return
			end

			local weapon = me:get_player_weapon()

			if weapon == nil then
				return
			end

            local is_pin_pulled = (
                weapon.m_bPinPulled and
                weapon.m_flThrowStrength > 0
            )

            if not is_pin_pulled then
                return
            end

            local should_throw = (
                damage ~= nil and
                damage >= ref.release_damage:get()
            )

            if should_throw then
                cmd.in_attack = false
                cmd.in_attack2 = false
            end

			damage = nil
        end

        local function on_grenade_prediction(e)
            damage = e.damage
        end

        on_createmove = create_debug_callback('misc_grenade_release.on_createmove', on_createmove)
        on_grenade_prediction = create_debug_callback('misc_grenade_release.on_grenade_prediction', on_grenade_prediction)

        local callbacks do
            local function on_enabled(item)
                local value = item:get(2)

                events.createmove(on_createmove, value)
                events.grenade_prediction(on_grenade_prediction, value)
            end

            ref.select:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'misc_drop_nades'

    local drop_nades do
        local ref = resource.misc.grenades

        local queue = { }

        local throwing = false
        local old_state = nil

        local function is_allowed_class(console_name)
            if console_name == 'weapon_incgrenade' or console_name == 'weapon_molotov' then
                return ref.drop_nades_select:get(1)
            end

            if console_name == 'weapon_smokegrenade' then
                return ref.drop_nades_select:get(2)
            end

            if console_name == 'weapon_hegrenade' then
                return ref.drop_nades_select:get(3)
            end

            return false
        end

        local function is_weapon_allowed(weapon)
            local info = weapon:get_weapon_info()

            if info.weapon_type ~= 9 then
                return false
            end

            if not is_allowed_class(info.console_name) then
                return false
            end

            return true
        end

        local function clear_queue()
            for i = 1, #queue do
                queue[i] = nil
            end
        end

        local function update_queue(ent)
            local weapons = ent:get_player_weapon(true)

            for i = 1, #weapons do
                local weapon = weapons[i]

                if not is_weapon_allowed(weapon) then
                    goto continue
                end

                table.insert(queue, weapon)
                ::continue::
            end
        end

        local function on_createmove(cmd)
            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local weapon = me:get_player_weapon()

            if weapon == nil then
                return
            end

            local state = ref.drop_nades_bind:get()

            if old_state ~= state then
                old_state = state

                if state and not throwing then
                    clear_queue()
                    update_queue(me)

                    throwing = next(queue) ~= nil
                end
            end

            local nci = utils.net_channel()
            local latency = to_time(4)

            if nci ~= nil then
                latency = latency + nci.latency[1]
            end

            for i = 1, #queue do
                local grenade = queue[i]

                if grenade == nil then
                    goto continue
                end

                local weapon_info = grenade:get_weapon_info()

                if weapon_info == nil then
                    goto continue
                end

                local last = i == #queue

                utils.execute_after(latency * i, function()
                    utils.console_exec(string.format(
                        'use %s; drop', weapon_info.console_name
                    ))

                    if last then
                        utils.execute_after(0.1, function()
                            throwing = false
                        end)
                    end
                end)

                ::continue::
            end

            clear_queue()

            if throwing then
                cmd.in_use = true

                cmd.no_choke = true
                cmd.send_packet = true
            end
        end

        on_createmove = create_debug_callback('misc_drop_nades.on_createmove', on_createmove)

        local function update_event_callbacks(value)
            if not value then
                clear_queue()
            end

            events.createmove(on_createmove, value)
        end

        local callbacks do
            local function on_enabled(item)
                update_event_callbacks(item:get(3))
            end

            ref.select:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'misc_ping_spike'

    local ping_spike do
        local ref = resource.misc.ping_spike

        local ref_fake_latancy = ui.find(
            'Miscellaneous', 'Main', 'Other', 'Fake Latency'
        )

        local sv_maxunlag = cvar.sv_maxunlag

        local function restore_value()
            ref_fake_latancy:override()
            ref_fake_latancy:disabled(false)

            sv_maxunlag:float(tonumber(sv_maxunlag:string()), true)
        end

        local function update_value(value)
            ref_fake_latancy:override(value)
            ref_fake_latancy:disabled(true)

            sv_maxunlag:float(0.400, true)
        end

        local function on_shutdown()
            restore_value()
        end

        on_render = create_debug_callback('misc_ping_spike.on_render', on_render)
        on_shutdown = create_debug_callback('misc_ping_spike.on_shutdown', on_shutdown)

        local callbacks do
            local function on_value(item)
                update_value(item:get())
            end

            local function on_enabled(item)
                local value = item:get()

                if not value then
                    restore_value()
                end

                if value then
                    ref.value:set_callback(on_value, true)
                else
                    ref.value:unset_callback(on_value)
                end

                events.shutdown(on_shutdown, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'misc_unlock_fake_duck_speed'

    local unlock_fake_duck_speed do
        local ref = resource.misc.fake_duck

        local ref_fake_duck = ui.find(
            'Aimbot', 'Anti Aim', 'Misc', 'Fake Duck'
        )

        on_createmove = create_debug_callback('misc_unlock_fake_duck_speed.on_createmove', on_createmove)

        local function on_createmove_run(cmd)
            if not ref_fake_duck:get() then
                return
            end

            local move_vec = vector(cmd.forwardmove, cmd.sidemove)

            if move_vec:length() < 2 then
                return
            end

			move_vec:normalize()

			cmd.forwardmove = move_vec.x * 150
			cmd.sidemove = move_vec.y * 150
        end

        local callbacks do
            local function on_select(item)
                events.createmove_run(on_createmove_run, item:get(1))
            end

            ref.select:set_callback(
                on_select, true
            )
        end
    end

    debug_point 'misc_air_duck_collision'

    local air_duck_collision do
        local ref = resource.misc.air_duck_collision

        local function on_createmove(cmd)
            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local velocity = me.m_vecVelocity

            local sim_ctx = me:simulate_movement()
            sim_ctx:think()

            if velocity.x < 30 or velocity.z <= 0 then
                return
            end

            if not sim_ctx.did_hit_collision then
                return
            end

            cmd.in_duck = true
        end

        on_createmove = create_debug_callback('misc_air_duck_collision.on_createmove', on_createmove)

        local callbacks do
            local function on_enabled(item)
                events.createmove(on_createmove, item:get())
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'misc_freezetime_fake_duck'

    local freezetime_fake_duck do
        local ref = resource.misc.fake_duck

        local current_tick = 0

        local ref_hide_shots = ui.find(
            'Aimbot', 'Ragebot', 'Main', 'Hide Shots'
        )

        local ref_double_tap = ui.find(
            'Aimbot', 'Ragebot', 'Main', 'Double Tap'
        )

        local ref_fake_duck = ui.find(
            'Aimbot', 'Anti Aim', 'Misc', 'Fake Duck'
        )

        local function update_current_tick()
            if current_tick >= 14 then
                current_tick = 0
            end

            current_tick = current_tick + 1
        end

        local function on_shutdown()
            ref_hide_shots:override()
            ref_double_tap:override()
        end

        local function on_createmove(cmd)
            ref_hide_shots:override()
            ref_double_tap:override()

            if not ref_fake_duck:get() then
                return
            end

            local game_rules = entity.get_game_rules()

            if game_rules == nil then
                return
            end

            if not game_rules.m_bFreezePeriod then
                return
            end

            update_current_tick()

            local should_duck = current_tick > 7 do
                cmd.in_duck = should_duck
                cmd.send_packet = current_tick == 14
            end

            ref_hide_shots:override(false)
            ref_double_tap:override(false)
        end

        local function on_override_view(e)
            if not ref_fake_duck:get() then
                return
            end

            local game_rules = entity.get_game_rules()

            if game_rules == nil then
                return
            end

            if not game_rules.m_bFreezePeriod then
                return
            end

            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local origin = me:get_origin()

            e.camera.z = origin.z + 64
        end

        on_shutdown = create_debug_callback('misc_freezetime_fake_duck.on_shutdown', on_shutdown)
        on_createmove = create_debug_callback('misc_freezetime_fake_duck.on_createmove', on_createmove)
        on_override_view = create_debug_callback('misc_freezetime_fake_duck.on_override_view', on_override_view)

        local callbacks do
            local function on_select(item)
                local value = item:get(2)

                if not value then
                    ref_hide_shots:override()
                    ref_double_tap:override()
                end

                events.shutdown(on_shutdown, value)
                events.createmove(on_createmove, value)
                events.override_view(on_override_view, value)
            end

            ref.select:set_callback(
                on_select, true
            )
        end
    end

    debug_point 'misc_fps_optimize'

    local fps_optimize do
        local ref = resource.misc.fps_optimize

        local changed = false

        local tree = { } do
            local function wrap(convar, value)
                local item = { }

                item.convar = convar
                item.old_value = nil
                item.new_value = value

                return item
            end

            tree['Fog'] = {
				wrap(cvar.fog_enable, 0),
				wrap(cvar.fog_enable_water_fog, 0)
			}

			tree['Blood'] = {
				wrap(cvar.violence_hblood, 0)
			}

			tree['Bloom'] = {
				wrap(cvar.mat_disable_bloom, 1)
			}

			tree['Decals'] = {
				wrap(cvar.r_drawdecals, 0)
			}

			tree['Shadows'] = {
				wrap(cvar.r_shadows, 0),
				wrap(cvar.cl_csm_static_prop_shadows, 0),
				wrap(cvar.cl_csm_shadows, 0),
				wrap(cvar.cl_csm_world_shadows, 0),
				wrap(cvar.cl_foot_contact_shadows, 0),
				wrap(cvar.cl_csm_viewmodel_shadows, 0),
				wrap(cvar.cl_csm_rope_shadows, 0),
				wrap(cvar.cl_csm_sprite_shadows, 0),
				wrap(cvar.cl_csm_translucent_shadows, 0),
				wrap(cvar.cl_csm_entity_shadows, 0),
				wrap(cvar.cl_csm_world_shadows_in_viewmodelcascad, 0)
			}

			tree['Sprites'] = {
				wrap(cvar.r_drawsprites, 0)
			}

			tree['Particles'] = {
				wrap(cvar.r_drawparticles, 0)
			}

			tree['Ropes'] = {
				wrap(cvar.r_drawropes, 0)
			}

			tree['Dynamic lights'] = {
				wrap(cvar.mat_disable_fancy_blending, 1)
			}

			tree['Map details'] = {
				wrap(cvar.func_break_max_pieces, 0),
				wrap(cvar.props_break_max_pieces, 0)
			}

			tree['Weapon effects'] = {
				wrap(cvar.muzzleflash_light, 0),
				wrap(cvar.r_drawtracers_firstperson, 0)
			}
        end

        local function should_update()
            if ref.always_on:get() then
                return true
            end

            if localplayer.is_peeking and ref.detections:get 'Peeking' then
                return true
            end

            if localplayer.is_vulnerable and ref.detections:get 'Hit Flag' then
                return true
            end

            return false
        end

        local function restore_convars()
            if not changed then
                return
            end

            for _, v in pairs(tree) do
                for i = 1, #v do
                    local item = v[i]
                    local convar = item.convar

                    if item.old_value == nil then
                        goto continue
                    end

                    convar:int(item.old_value)
                    item.old_value = nil

                    ::continue::
                end
            end

            changed = false
        end

        local function update_convars()
            if changed then
                return
            end

            local values = ref.select:get()

            for i = 1, #values do
                local value = values[i]
                local items = tree[value]

                for j = 1, #items do
                    local item = items[j]
                    local convar = item.convar

                    if convar == nil or item.old_value ~= nil then
                        goto continue
                    end

                    item.old_value = convar:int()
                    convar:int(item.new_value)

                    ::continue::
                end
            end

            changed = true
        end

        local function on_shutdown()
            restore_convars()
        end

        local function on_net_update_end()
            if not should_update() then
                return restore_convars()
            end

            update_convars()
        end

        on_shutdown = create_debug_callback('misc_fps_optimize.on_shutdown', on_shutdown)
        on_net_update_end = create_debug_callback('misc_fps_optimize.on_net_update_end', on_net_update_end)

        local callbacks do
            local function on_list(item)
                restore_convars()
                update_convars()
            end

            local function on_enabled(item)
                local value = item:get()

                if value then
                    ref.select:set_callback(on_list, true)
                else
                    ref.select:unset_callback(on_list)
                end

                if not value then
                    restore_convars()
                end

                events.shutdown(on_shutdown, value)
                events.net_update_end(on_net_update_end, value)
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'misc_unmute_mute_silenced'

    local unmute_mute_silenced do
        local ref = resource.misc.unmute_mute_silenced

        local UnmutePlayer = utils.get_vfunc('client.dll', 'GameClientExports001', 3, 'void(__thiscall*)(void*, int)')

        local function update_unmute(mode)
            local players = entity.get_players()

            for i = 1, #players do
                local player = players[i]

                if mode == 'Enemies' and not player:is_enemy() then
                    goto continue
                end

                if mode == 'Teammates' and player:is_enemy() then
                    goto continue
                end

                UnmutePlayer(player:get_index())

                ::continue::
            end
        end

        local function on_player_connect_full(e)
            update_unmute(ref.mode:get())
        end

        on_player_connect_full = create_debug_callback('misc_unmute_mute_silenced.on_player_connect_full', on_player_connect_full)

        local callbacks do
            local function on_enabled(item)
                local value = item:get()

                local is_enabled = value ~= 'Disabled'

                if is_enabled then
                    update_unmute(value)
                end

                events.player_connect_full(on_player_connect_full, is_enabled)
            end

            ref.mode:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'misc_nickname_generator'

    local nickname_generator do
        local ref = resource.misc.nickname_generator

        local name = cvar.name

        local original_name = nil

        local list = {
'бля нормально наваху купил','я вейп купил','чд? кд?','якубовчи567','блек ангел убившка11','таракан динис','жульверик','яростный минерльный чеченец кажэуал','снеговой авпкингуля','mr геймер300',
			'хсаю вв с первой пу','куда в хуй','hasbik style KZ','60G AJlTaUcKuX 7oP','4е в Xyя7y','хсаю даже на тол4ке','OnlyBaim gang$','был выебан кизарухвх','9PoCtHblU KUnKoG','TTu3дoHюx','CTaPaя Ho OTTacHeHьKaя','я выезжаю носопырки',
			'✪FasTIK✪','ЂΣƊOŁ∆G∆','︻デ═一 ☭ sniper','ГуСеЙн ШоУ','oП Я кРуТоЙ А тЫ ХуЙ','хуяторубиватор6731','♕ａｒｔｅｍ １５４','срега мобилкин','матвей крабов','койфовая криветка ебланище','✧*:･ﾟ✧ 𝐅𝐔𝐂𝐊 𝐘𝐎𝐔 ✧*:･ﾟ✧','SPASIBO ZA SKEET',
			'𝐍𝐚𝐀𝐢𝐫𝐌𝐚𝐱','буйный славик газолир','лёва таракан-56','yKpoTuTeJlb_6a6yweK','anatoly fakeyaw','Валентин','Супер Снайпер228','Заказать педофuла','Рамзан Кадыров','проверка на читы','main nick sanyaKiller228','Борис Животное','bmw top',
			'Дима[RUS]2005','ислам магомедов','ТИМАТИХВХ','eldoradohvh','бультазар','я еблан бигити','pavlo.matvei98','www.CSGOSETTINGS.ru 111','мамкаеб2009','фугас тимоха','VLAD_ПУСТОЙ','Велимир (Not Cheater)','ОпА$нЫй мастер клатчей леха ебать',
			'KirillMachine','THIS IS OMLEEEEEEET (◣◢)','soldier (солдат)','-----= S.E.N.A.T.O.R =-----','*-КрYчE_Бога_u_ЦаРя-*','ᴛʜᴇʙᴇsᴛ','♥§₭îℒȴ⊕ᗩᙡǞℙℰℜ₳🎆','GloBal~BaNaN','Fucking.Ba[nn]Y...','d[oo]dLeZzzz...','VIP Sex Energy VIP','🥑𝕒𝕧𝕒𝕔𝕒𝕕𝕠🥑',
			'乂...𝔡.𝔦.𝔨.𝔦.y...乂','║☾ Ħ Ξ ∀ 千 Σ 尺║','彡[ᴅᴇᴀᴅ ᴋɪʟʟᴇʀ]彡','ʀᴇᴘ ɪɴsᴀɴᴇ ᴡɪᴛʜ ᴀᴡᴘ','Спуди Мун','ᗫტ₦ℋℱǾℜ','☢Ď₳ÑǤĒ℟☢','Ģŗąņď_₥ąﮐŧξŗ','F@$$$TiK...','...::::K[RAM]m[ER]::::...','опер окаянный','ДОНАТ С PAYPAL', 'shelzi228', 'фарш',
			'танцую лезгинку', 'OPERуполномоченный','2 охлажденных яйца','мазик окаянный', 'Ballin\' Maut', 'Balin`Shprot', 'MILLIONAR Balin', 'КРАШ ТЕСТ МАРК 2', '​HVH RACING','клубнично-вишневый слоняра','яблочный гипопотам','крол ржачный абрикосовый',
			'Агрессивный карбюратор','tw1x^zz1^aced1v1','s1mple','꧁ℳaⲦⱔɪ℣aẕⱔɪ✞꧂','•ᴮᴬᴰʙᴏʏツ','꧁ঔৣ☬✞𝓓𝖔𝖓✞☬ঔৣ꧂','∆♣️JOKER♥️∆','SpraY','꧁༺₦Ї₦ℑ₳༻꧂','➢ Iᴍᴍᴏʀᴛᴀʟ','╾━╤デ╦︻ ₳₭-❹❼ 𝓰𝓸𝓭','︻デ═一GOD_SK','🅼*🅰️*🆅*🅴*🆁*🅸*🅲*🅺','༺Leͥgeͣnͫd༻ᴳᵒᵈ','꧁✪♕BOT♕✪꧂',
			'🔥𝓖𝓡𝓐𝓢𝓤🔥','TØXIC','𝕵𝖆𝔳𝖎𝖎 ✪','🅴🆉🆉 🅽🅾️🅾️🅱️🆂','꧁༺J͓̽o͓̽s͓̽I͓̽༻꧂','♡ AWP – senpai ◕‿◕ [ツ]','ヅ [OnI-ChaN] FreSH[x]☪️','꧁ᴳᵒᵈSlayer꧂','༺Leͥgeͣnͫd༻',
			'✪₦Ї₦ℑ₳༻︻デ═一','.S!ckBoY^','𝕾𝖙𝖚𝖗𝖒𝕽𝖊𝖇𝖊𝖑𝖑','♥️𝓚𝓮𝓝𝓝𝔂𝓢♥️','Snax','꧁ঔৣ☬✞𝓵𝓮𝓰𝓮𝓷𝓭ˡᵒᵛᵉ ʸᵒᵘ✞☬ঔৣ꧂','♕ѕнє ¢αℓℓ мє нα¢','✪AnARcHY_','bl1tz','Carry Potter','✪TaCt1CaL','vk.com/vampire','ᗰEᗰE ᔕEᑎᔕE','”*°•.★..Angel_Of_The_Night..★.•°*”˜','ñƤüβ£ϯ ΨнӹƤь ϯ£ნя £ნ£ϯ j£§ɥ§',
			'ęβãł țýä √ řøţ','忍び 1 УПАЛ び忍','MaJIeHkuu_Ho_OnacHekuu','•۩۞۩[̲̅П̲̅о̲̅Л̲̅Ю̲̅б̲̅А̲̅С(ٿ)̲̅Ч̲̅и̅Т̲̲АК̲̅]۩۞۩•','YбИuЦа_КрИпЕrОв','Теперь я - Ютубер Омлет (◣◢)','ⒶaŴÞ ︻デ 一 PUTIN','VAAAAAAAC в чат!!! (づ ◕‿◕ )','づ 从闩从长丫 仨五闩人','+Yeb@shu_v_k@shu+',
			'£ნÿ ϯя','AHHAHAHHAHAHH LIFEHACK ♥️♥️♥️♥️♥️','ПуЛи_От_БаБуЛи','ПаРеНь БеЗ сТрАхА','Н.Е.С.О.К.Р.У.Ш.И.М.Ы.Й','KpyToI_4elOBeK','^^Stell^^::.[Pro_Game_Xom9k]','3Jlou_ЗAdrOT','ñüѫ¤Ƥ ñüƺѫå ϯÿƺ ɱ¤н¤ȹя','я ķ¤нɥåλ ϯβ¤£ü ɱåɱķ£ β Ƥ¤ϯ','ⒶaŴÞ ︻デ 一',
			'комсомольский цыган','носатый нос райзена','ашкудишка со вкусом уха','pepper roni (пицца) со вкусом сметаны','METAN HVH','ШВЕДСКИЙ СТОЛ ГРИГОРИЯ ЛЕПСА','ААААА КЫЗЛАР КУТАК БАС АШАЛАМАНААА БИЛЯЯЯ ЭУУУ','Z V','СЛЫШУ ZOV','ТЮФЯЯЯК (ПАТРИК)',
			'GuGu_Zha_IIIagu','GyGaBait','ebaWu_V_KaWu (Z)','МАМИНО ПРОТИВОРЕЧИЕ','Nellячка UwU','Фильм «Улыбка»','Котлетосы из zыра','Какао бобер','Фальшивая утка','Рыскание нижней части тела','гусейн газ','туалетный утюг','Газования на удачу',
			'спираль маны','Подкова сракотана','Дупло хомяка','Бельчий аул','ЯЗЫК ТЕЛА','тюльпановые горы радости','Сыр быб рыр','ШимпанZе (обидка)','Ложные отставания','Вбив / выбив зубов г.Урюпинск','Гусейн газуй нах','Зеница око','Zorix(csgo)',
			'Пидер пайдер','Зубы мудрости','Щекотное теребоньканье','ZELTR1X','ZOLDY1337','K1neXj.','Evolvex','ANGELS HVH','Шестая пятка','Мозолистый шалопай','тюремский узурпатор','Стояк пыхтун','Натоптыши','Набрал долгов','Забив кальянов',
			'Турничковая забивка','Тренировка под дождем','Дрочу стоя','Йожик жухлый','Ехидная харя','Кайфецкий кумарчик','КАРТОФЕЛЬ','SANCHEZJ X FIPP','ГЕОРГИЙ ФАМУТИЛОВ','АЗАЗАЗАЗА АЗЛАГОР','Ребенок подкидышь','ДЕТИ В ПОДВАЛЕ','СТИВАХА','Фрост снейк и парниша',
			'ТИМОФЕЙ И ЕГО ДРУГ ПЬЯНЫЙ ЕГОР','Заблокированный скайп','ДОКТОР БРАУН? слушаю.','АРОМАТ ЗИРАПТОРСА ССЫТ В РАКОВИНУ','СКАААЙ','Доктор бабун','нитрат фабурита','черноголовка))','Ссыканье в тазик','ликтофат натрия','Мытье в бидоне',
			'нипортам в раковине','выгуливать колбасу вместо собаки на балконе','Гиппопотам сырный','зупифальный назальный спрей для ногтей','Пидорские сырники','гоги на уроги','GoGiMan777','Карамельные ноготочки','деревянное яблоко','арбузные сланцы',
			'hey? MACARENAA','трицерапторс','Хорошая одежда','LXNER репир','Модный приговор','студент','Релиз sqwore','хайперпоп самара','18двадцетин','Цитрус от зуда','Цитриновый кашель','Тандум верде форте','ТАБУН ГОСТЕЙ','ОЛЕГ ТИНЬКОФФ',
			'SAILOR MOON РОБЕРТ С АРБУЗОМ','КОЗАХСТАН ЫЫЫЫЫААААААА','Велимир спиридонов','Вахид бабев','Сурикатный тушканчик','Азиз шавершян','вильветовый осьминог','колбаса с лысым мужиком','деньги и пахучие ноги','Карась со стразами','РЫБА МОЕЙ МЕЧТИ',
			'ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЗЬ','Тунец от халики','Камбала в ванне','кальянизация прошла успешно🌹','шишка в мышке','Плотное яблочко','лопасти микрофона','Кумарная сессия','клавиатура информатика','Пробирка биологички','зеленое небо в закате',
			'темное озарение тепла','пенящее счастье','со скитулькой в ммулю','богатые волосы киркорова','Играю как fifty','корова римзакса','Рамоны от сереги','путильфат гульзантия (привет)','рафы от Raffaello','красная машина с деревом от питольды',
			'Прикольный пудинг от пончика','кожаная стена','подстольные полупокеры','амстердам гильгона','Звонок на урок','Табурет очки усы','Читаю репчагу','ЧИПСИ ОТ РЕНЕГАТА ТАТАРСКОГО','ТАТАРСКИЙ MALIK163ONMYNECK','НОВЫЙ РЕПИР','ВУМПИР',
			'носатое уебище','шестое чувство','жопный предикт','ЧИТЕРЫ ИМЕЮТ 6 ЧУВТСВО','ТРЕТИЙ ГЛАЗ НА ПРАВОЙ ЩЕКЕ','ПОДБОРОДОК В РАЗВАЛ С НОСОРОГОМ','ГНИЛОЙ УТЮГ','ПЬЯНАЯ ДЫНЯ','БЕШЕНЫЙ КАРТОФЕЛЬ','Пьяный пылесос','UWU GANG','Йобнутий ежик',
			'Ежик в тумане','Манул в зоопарке','темный валет','нюхнул подмыхарик','ушасто большие брови','похожу на яндекс браузер','Слон на крокодиле','индюк в масле','бурдюк с приколом','киевская котлета','шило на мыло','Бабу на камень','цукерберг панзерфауст 1337',
			'запорожье 9000','Москвич 65','я что похож на абонента','Серега дурный','иван нави','Ответ на том конце','Свет в начале елки','сергей факел','хуйпастрипс','хуйпачипс','Хуйпасоль','Хуйпабургер','Рис с касымаком','Скаленаш мотыга','Скаленаш такыш',
			'чифирок с горящим котом','Она с Казахстана','Насвай не кидаем это харам харам','усатое позорище','Утренний намаз под канун нового года','мы не делаем трап мы делаем большие ногти','узбек русский','На носу героин','Зависимый самовар',
			'синие волосы покорили небо','ZV шмаль в плече','Дефектный перфоратор','самовыражающий никсвар','настоящий пубертант','Gloria damn','антология антона','gloria fuck','cocki яки','китайский реп','цуфанзю фамерге (хвх)','куталбык шурабзик',
			'тупой урод','сумка со вкусом витальки','черепа в афганистане пьют микрофон','пить еду есть воду','желтоволосый паспорт','пиздец меня расперло нахуй чел','Залог успехов','Рыба в кляре','Громофон','Шуба под селедкой','Мануал по манулам',
			'НИКОГДА НЕ ПРОИГРЫВАТЬ','Пятьдесят','семьсот десять','грям арбуса','вес хача','1хбет','yamete kudasai ^^','Приехала чихуахуа','чихнул без слез','альпенист в песке','Банановый рай','Желток на чилипиздрике','Говорящий портсигар',
			'Перевернутая канарейка','жесткий кинотеатр','Зимнее лето','третий подбородок','Лью лимонад мимо рта','Перезаряжаю кефир','кашляю хэшем','Молоко 2 литра','колбаса с капустой да еще и с печеньем','да и в прикуску cockа кола','Хитрый ксими',
			'Новомодный vertu','интернет кабель','Телефонный шнур','шнур для бритья','Барабашка без катушек','Мокрое белье','яйцо со стрипсом в ухе','мои мысле на мыле они so low','В ЧЕРНОМ СПИСКЕ','тики токи от бурмалды','ушастый шоколад','мышка логиYECH',
			'MinYEAT','МИНЬЕТ','Гарик до челюсти','Обидчевый школьник','ПАБАКА УЛЫБАКА','УХ-ТЫ-Ж-ЙО!','Етижи пассатижи','Шило в рыло','Лайф в кайф','КАЙФ ЛАЙФ','Zahar bobr','Вера в замая','15 год это важно','Коля хейтер','писюнистый факультет',
			'всем спать','вельветовый осьминог','мясной медвед','first day with neverlose.cc','https://vk.com/avtopodborkazahstan','Успешный автомобилист','автоподбор KZ','Базовая и полная','май алмайды!','Асты таза, стакандары сау'
        }

        local function restore_name()
            if original_name == nil then
                return
            end

            common.set_name(original_name)
            original_name = nil
        end

        local function on_shutdown()
            restore_name()
        end

        on_shutdown = create_debug_callback('misc_nickname.on_shutdown', on_shutdown)

        local callbacks do
            local function on_set()
                if original_name == nil then
                    original_name = name:string()
                end

                common.set_name(ref.input:get())
                events.shutdown(on_shutdown, true)
            end

            local function on_reset()
                restore_name()
                events.shutdown(on_shutdown, false)
            end

            local function on_generate()
                local nickname = list[
                    math.random(1, #list)
                ]

                if nickname ~= nil then
                    ref.input:set(nickname)
                end
            end

            ref.set_button:set_callback(on_set)
            ref.reset_button:set_callback(on_reset)
            ref.generate_button:set_callback(on_generate)
        end
    end

    debug_point 'misc_no_fall_damage'

    local no_fall_damage do
        local ref = resource.misc.no_fall_damage

        local triggered = false

        local function trace(player, length)
            local origin = player:get_origin()

			for rad = 0, math.pi * 2, math.pi * 2 / 8 do
                local sin = math.sin(rad)
                local cos = math.cos(rad)

                local point_a = origin + vector(
                    10 * cos, 10 * sin, 0
                )

                local point_b = point_a - vector(0, 0, length)

				local tr = utils.trace_line(
                    point_a, point_b, player
                )

				if tr.fraction ~= 1 then
					return true
				end
			end

			return false
        end

        local function on_createmove(cmd)
            local me = entity.get_local_player()

            if me == nil then
                return
            end

            if me.m_vecVelocity.z >= -500 then
				triggered = false
			else
				if trace(me, 15) then
					triggered = false
				elseif trace(me, 75) then
					triggered = true
				end
			end

			if me.m_vecVelocity.z < -500 then
                cmd.in_duck = triggered
			end
        end

        on_createmove = create_debug_callback('misc_no_fall_damage.on_createmove', on_createmove)

        local callbacks do
            local function on_enabled(item)
                events.createmove(on_createmove, item:get())
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end

    debug_point 'misc_fast_ladder'

    local fast_ladder do
        local ref = resource.misc.fast_ladder

        local MOVETYPE_LADDER = 9

        local function on_createmove(cmd)
            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local movetype = me.m_MoveType

            if movetype ~= MOVETYPE_LADDER then
                return
            end

            local angle = render.camera_angles()

            cmd.view_angles.y = round(
                cmd.view_angles.y
            )

            cmd.view_angles.z = 0

            if cmd.forwardmove > 0 and angle.x < 45 then
                cmd.view_angles.x = 89

                cmd.in_moveright = 1
                cmd.in_moveleft = 0
                cmd.in_forward = 0
                cmd.in_back = 1

                if cmd.sidemove == 0 then
                    cmd.view_angles.y = cmd.view_angles.y + 90
                end

                if cmd.sidemove < 0 then
                    cmd.view_angles.y = cmd.view_angles.y + 150
                end

                if cmd.sidemove > 0 then
                    cmd.view_angles.y = cmd.view_angles.y + 30
                end
            elseif cmd.forwardmove < 0 then
                cmd.view_angles.x = 89

                cmd.in_moveleft = 1
                cmd.in_moveright = 0
                cmd.in_forward = 1
                cmd.in_back = 0

                if cmd.sidemove == 0 then
                    cmd.view_angles.y = cmd.view_angles.y + 90
                end

                if cmd.sidemove > 0 then
                    cmd.view_angles.y = cmd.view_angles.y + 150
                end

                if cmd.sidemove < 0 then
                    cmd.view_angles.y = cmd.view_angles.y + 30
                end
            end
        end

        on_createmove = create_debug_callback('misc_fast_ladder.on_createmove', on_createmove)

        local callbacks do
            local function on_enabled(item)
                events.createmove(
                    on_createmove,
                    item:get()
                )
            end

            ref.enabled:set_callback(
                on_enabled, true
            )
        end
    end
end
