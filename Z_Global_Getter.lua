require("scripts/A_language")

-- Varaiables
local tester_mode_list = {"Globals","Stats","Scripts"}
local tester_mode = 1
local type_mode_list = {"int","string","bool","float"}
local type_mode = 1
local scripts_thingy_list = {"fm_mission_controller","fm_mission_controller_2020","gb_gang_ops_planning","fmmc_launcher"}
local scripts_thingy = 1
local global_use = false
local is_reading = false

local saved_globals_list = {}
local saved_globals = 1

local current_global_list = {}
for i = 1,10 do
    current_global_list[i] = 0
end
local current_global = 0

local current_setter_list = {}
for i = 1,10 do
    current_setter_list[i] = 0
end
local current_setter = 0

-- Functions
local function get_global(global, mode)
    if mode == type_mode_list[1] then
        return globals.get_int(global)
    elseif mode == type_mode_list[2] then
        return globals.get_string(global)
    elseif mode == type_mode_list[3] then
        return globals.get_bool(global)
    elseif mode == type_mode_list[4] then
        return globals.get_float(global)
    end
end
local function set_global(global, value, mode)
    if mode == type_mode_list[1] then
        return globals.set_int(global, value)
    elseif mode == type_mode_list[2] then
        return globals.set_string(global, value)
    elseif mode == type_mode_list[3] then
        return globals.set_bool(global, value)
    elseif mode == type_mode_list[4] then
        return globals.set_float(global, value)
    end
end

local function get_stat(stat, mode)
    if mode == type_mode_list[1] then
        return stats.get_int(stat)
    elseif mode == type_mode_list[2] then
        return stats.get_string(stat)
    elseif mode == type_mode_list[3] then
        return stats.get_bool(stat)
    elseif mode == type_mode_list[4] then
        return stats.get_float(stat)
    end
end
local function set_stat(stat, value, mode)
    if mode == type_mode_list[1] then
        return stats.set_int(stat, value)
    elseif mode == type_mode_list[2] then
        return stats.set_string(stat, value)
    elseif mode == type_mode_list[3] then
        return stats.set_bool(stat, value)
    elseif mode == type_mode_list[4] then
        return stats.set_float(stat, value)
    end
end

local function get_script(stat, mode)
    local current_script = script(scripts_thingy_list[scripts_thingy])
    if mode == type_mode_list[1] then
        return current_script:get_int(stat)
    elseif mode == type_mode_list[2] then
        return current_script:get_string(stat)
    elseif mode == type_mode_list[3] then
        return current_script:get_bool(stat)
    elseif mode == type_mode_list[4] then
        return current_script:get_float(stat)
    end
end
local function set_script(global, value, mode)
    local current_script = script(scripts_thingy_list[scripts_thingy])
    if mode == type_mode_list[1] then
        return current_script:set_int(global, value)
    elseif mode == type_mode_list[2] then
        return current_script:set_string(global, value)
    elseif mode == type_mode_list[3] then
        return current_script:set_bool(global, value)
    elseif mode == type_mode_list[4] then
        return current_script:set_float(global, value)
    end
end


function Global_Tester_9000()
    Global_Tester:clear()

    Global_Tester:add_array_item("Mode →",tester_mode_list, function() return tester_mode end, function(a) tester_mode = a end)
    Global_Tester:add_array_item("Type →",type_mode_list, function() return type_mode end, function(a) type_mode = a end)

    
    Text(Separator_text,Global_Tester)

    for i = 1,#current_global_list do
        Global_Tester:add_array_item("Character n°" .. #current_global_list-i+1, {0,1,2,3,4,5,6,7,8,9}, function() return current_global_list[#current_global_list-i+1]+1 end, function(g) current_global_list[#current_global_list-i+1] = g-1 end)
    end

    Global_Tester:add_toggle("Global Offset? ", function() return global_use end, function(e) global_use = e end)
    Global_Tester:add_array_item("Script →",scripts_thingy_list, function() return scripts_thingy end, function(a) scripts_thingy = a end)

    Global_Tester:add_bare_item("",
        function()
            current_global = current_global_list[1]
            for i = 2,#current_global_list do
                current_global = current_global + current_global_list[i]*10^(i-1)
            end

            if global_use then return "Current Global → " .. Global_Offset .. "+" .. current_global else return "Current Global → " .. current_global end
        end,null,null,null
    )


    -- Write

    Text(Separator_text,Global_Tester)
    Text("----Write",Global_Tester)

    for i = 1,#current_setter_list do
        Global_Tester:add_array_item("Character n°" .. #current_setter_list-i+1, {0,1,2,3,4,5,6,7,8,9}, function() return current_setter_list[#current_setter_list-i+1]+1 end, function(g) current_setter_list[#current_setter_list-i+1] = g-1 end)
    end

    Global_Tester:add_action("Write",
        function()
            current_setter = current_setter_list[1]
            for i = 2,#current_setter_list do
                current_setter = current_setter + current_setter_list[i]*10^(i-1)
            end
            
            current_global = current_global_list[1]
            for i = 2,#current_global_list do
                current_global = current_global + current_global_list[i]*10^(i-1)
            end

            if global_use then current_global = Global_Offset+current_global end
            
            if tester_mode == 1 then set_global(current_global, current_setter, type_mode_list[type_mode])
            elseif tester_mode == 2 then set_stat(current_global, current_setter, type_mode_list[type_mode])
            elseif tester_mode == 3 then set_script(current_global, current_setter, type_mode_list[type_mode])
            end
        end
    )


    -- Read

    Text(Separator_text,Global_Tester)
    Text("----Read",Global_Tester)

    Global_Tester:add_toggle("Reading?", function() return is_reading end, function(e) is_reading = e end)
    Global_Tester:add_bare_item("",
        function()
            current_global = current_global_list[1]
            for i = 2,#current_global_list do
                current_global = current_global + current_global_list[i]*10^(i-1)
            end

            if global_use then current_global = Global_Offset+current_global end

            if is_reading then
                if tester_mode == 1 then return "Value → "..get_global(current_global, type_mode_list[type_mode])
                elseif tester_mode == 2 then return "Value → "..get_stat(current_global, type_mode_list[type_mode])
                elseif tester_mode == 3 then return "Value → "..get_script(current_global, type_mode_list[type_mode])
                end
            else return "Value → ".."NaN"
            end
        end,null,null,null
    )


    local function create_global_listing()
        saved_globals_list[saved_globals] = {current_global, type_mode_list[type_mode], tester_mode}
        saved_globals = saved_globals+1
        
        Global_Tester:add_bare_item("",
            function()
                local current_thing_read = saved_globals_list[saved_globals-1]
                if is_reading then
                    if current_thing_read[3] == 1 then return current_thing_read[1].." → "..get_global(current_thing_read[1], current_thing_read[2])
                    elseif current_thing_read[3] == 2 then return current_thing_read[1].." → "..get_stat(current_thing_read[1], current_thing_read[2])
                    end
                end
            end,null,null,null
        )
    end
    Global_Tester:add_action("Add in list",function() create_global_listing() end)


end
Global_Tester = menu.add_submenu("Global Tester",Global_Tester_9000)
