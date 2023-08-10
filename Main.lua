require("scripts/globals")
require("scripts/AA_language")
local success, settings = pcall(json.loadfile, Settings_JSON_Filename)
local Settings_menu = menu.add_submenu(Settings_Submenu)

function Save_settings()
    json.savefile(Settings_JSON_Filename, settings)
end

Text(Settings_Reload,Settings_menu)
Text(Settings_Binds,Settings_menu)
Settings_menu:add_array_item(Settings_Language, Menu_Languages,
    function()
        return settings.Language
    end,
    function(l)
        settings.Language = Menu_Languages[l]
        Save_settings()
    end)


Settings_menu:add_toggle(Settings_Numberplates_enable,
    function()
        return settings.Numberplates.enabled
    end,
    function(n)
        settings.Numberplates.enabled = n
        Save_settings()
    end)

Settings_menu:add_array_item(Settings_Numberplates_unit,units_text,
    function()
        return units_text[settings.Numberplates.unit]
    end,
    function(u)
        settings.Numberplates.unit = u
        Save_settings()
    end
)

local Numberplates_Keymap = {"ZQSD","WASD"}
Settings_menu:add_array_item(Settings_Numberplates_Binds,Numberplates_Keymap,
	function()
		return Numberplates_Keymap[settings.Numberplates.mode]
	end,
	function(m)
		if m == 1 then
			settings.Numberplates.foward	= 90
			settings.Numberplates.backwards = 83
			settings.Numberplates.left		= 81
			settings.Numberplates.right		= 68
		else if m == 2 then
			settings.Numberplates.foward	= 87
			settings.Numberplates.backwards = 83
			settings.Numberplates.left		= 65
			settings.Numberplates.right		= 68
		end
		Save_settings()
	end
	Save_settings()
end
)

local Main_menu = menu.add_submenu(Menu_Submenu)

local enable_transaction_error = false

function loop_transaction_1()
	if enable_transaction_error then
		globals.set_int(Is_TransactionError_NotificationShown_1 ,0)
		globals.set_int(Is_TransactionError_NotificationShown_2 ,0)
		globals.set_int(TransactionError_BannerShown ,0)
		sleep(0.1)
		loop_transaction_2()
	end
end

function loop_transaction_2()
	loop_transaction_1()
end

Main_menu:add_toggle("Remove Transaction Error",
function()
	return enable_transaction_error
end,
function()
	enable_transaction_error = not enable_transaction_error
	loop_transaction_1()
end)


local enable_bike_sprint = false
function loop_bike_1()
	if enable_bike_sprint then
		menu.send_key_down(20)
		sleep(0.5)
		loop_bike_2()
	end
end
function loop_bike_2()
	menu.send_key_up(20)
	loop_bike_1()
end
Main_menu:add_toggle("Sprint bike",
function()
	return enable_bike_sprint
end,
function()
	enable_bike_sprint = not enable_bike_sprint
	loop_bike_1()
end)
--------------Noclip---------------

-- Variables--
    local up_hotkey
    local down_hotkey
    local forward_hotkey
    local backward_hotkey
    local turnleft_hotkey
    local turnright_hotkey
    local increasespeed_hotkey
    local decreasespeed_hotkey

	local bind = {settings.Noclip.up,			--1
				settings.Noclip.down,			--2
				settings.Noclip.foward,			--3
				settings.Noclip.backward,		--4
				settings.Noclip.turnleft,		--5
				settings.Noclip.turnright,		--6
				settings.Noclip.increasespeed,	--7
				settings.Noclip.decreasespeed,	--8
				settings.Noclip.toggle			--9
				}

    local default_ragdoll = localplayer:get_no_ragdoll()
    local default_292     = localplayer:get_config_flag(292)

    local enable = false
    local speed = 2
--------------

-- Movement Functions--
    local function up()
    	if not enable then return end
    	local newpos = localplayer:get_position() + vector3(0,0,speed)
    
    	if not localplayer:is_in_vehicle() then
    		localplayer:set_position(newpos)
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_position(newpos)
    	end
    end
    local function down()
    	if not enable then return end
    	local newpos = localplayer:get_position() + vector3(0,0,speed * -1)
    
    	if not localplayer:is_in_vehicle() then
    		localplayer:set_position(newpos)
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_position(newpos)
    	end
    end
    local function forward()
    	if not enable then return end
    	local dir = localplayer:get_heading()
    	local newpos = localplayer:get_position() + (dir * speed)
    
    	if not localplayer:is_in_vehicle() then
    		localplayer:set_position(newpos)
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_position(newpos)
    	end
    end
    local function backward()
    	if not enable then return end
    	local dir = localplayer:get_heading()
    	local newpos = localplayer:get_position() + (dir * speed * -1)
    
    	if not localplayer:is_in_vehicle() then
    		localplayer:set_position(newpos)
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_position(newpos)
    	end
    end
    local function turnleft()
    	if not enable then return end
    	local dir = localplayer:get_rotation()
    
    	if not localplayer:is_in_vehicle() then
    		localplayer:set_rotation(dir + vector3(0.25,0,0))
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_rotation(dir + vector3(0.25,0,0))
    	end
    end
    local function turnright()
    	if not enable then return end
    	local dir = localplayer:get_rotation()
    
    	if not localplayer:is_in_vehicle() then
    		localplayer:set_rotation(dir + vector3(0.25 * -1,0,0))
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_rotation(dir + vector3(0.25 * -1,0,0))
    	end
    end
    local function increasespeed()
    	if speed > 0 then 
    		speed = speed + 1
    	end
    end
    local function decreasespeed()
    	if speed > 1 then 
    		speed = speed - 1
    	end
    end
-----------------------

local function NoClip(e)
	if not localplayer then return end
	if e then 
		localplayer:set_freeze_momentum(true) 
		localplayer:set_no_ragdoll(true)
		localplayer:set_config_flag(292,true)
		up_hotkey = menu.register_hotkey(bind[1], up)
		down_hotkey = menu.register_hotkey(bind[2], down)
		forward_hotkey = menu.register_hotkey(bind[3], forward)
		backward_hotkey = menu.register_hotkey(bind[4], backward)
		turnleft_hotkey = menu.register_hotkey(bind[5], turnleft)
		turnright_hotkey = menu.register_hotkey(bind[6], turnright)
		increasespeed_hotkey = menu.register_hotkey(bind[7], increasespeed)
		decreasespeed_hotkey = menu.register_hotkey(bind[8], decreasespeed)
	else
		localplayer:set_freeze_momentum(false)
		localplayer:set_no_ragdoll(default_ragdoll)
		localplayer:set_config_flag(292,default_292)
		menu.remove_hotkey(up_hotkey)
		menu.remove_hotkey(down_hotkey)
		menu.remove_hotkey(forward_hotkey)
		menu.remove_hotkey(backward_hotkey)
		menu.remove_hotkey(turnleft_hotkey)
		menu.remove_hotkey(turnright_hotkey)
		menu.remove_hotkey(increasespeed_hotkey)
		menu.remove_hotkey(decreasespeed_hotkey)
	end
end

toggle_hotkey = menu.register_hotkey(bind[9],
    function()
    	enable = not enable 
    	NoClip(enable)
    end)

Main_menu:add_toggle(Menu_Noclip,
    function()
	    return enable
    end,
    function()
	    enable = not enable 
	    NoClip(enable)
    end)
 
Main_menu:add_int_range(Menu_Noclip_Speed, 1, 1, 10,
    function()
    	return speed
    end,
    function(i)
        speed = i
    end)
-----------------------------------


-------------Speedometer-----------
local units_selection = settings.Numberplates.unit
local units_text_short = {"km/h", "m/s", "mi/h", "ft/s"}
local units_text_numberplate = {"kmh", "mps", "mph", "fps"}
local units_value = {3.6, 1, 2.2369362921, 3.280839895}
local numberplate_enabled = settings.Numberplates.enabled
local numberplate_key = {settings.Numberplates.foward,
						settings.Numberplates.left,
						settings.Numberplates.backwards,
						settings.Numberplates.right
						}
local numberplate_ref = {}
 
local function round(value, dec)
	dec = dec or 0
	return tonumber(string.format("%." .. dec .. "f", value))
end

local function get_vehicle_speed(veh)
	if not veh then return 0 end
	local velocity = veh:get_velocity()
	return math.sqrt(velocity.x ^ 2 + velocity.y ^ 2 + velocity.z ^ 2)
end

function onoff_numberplate(value)
    numberplate_enabled = value
	if value then
		for i = 1, #numberplate_key do
			numberplate_ref[i] = menu.register_hotkey(numberplate_key[i], function()
				if not localplayer:is_in_vehicle() then return end
				local veh = localplayer:get_current_vehicle()
				if not veh then return end
				local speed = round(get_vehicle_speed(veh) * units_value[units_selection], 0)
				veh:set_number_plate_text((speed < 10 and "   " or speed < 100 and "  " or speed < 1000 and " " or "") .. speed .. " " .. units_text_numberplate[units_selection])
			end)
		end
	else
		for i = 1, #numberplate_ref do
			menu.remove_hotkey(numberplate_ref[i])
		end
	end
end

if numberplate_enabled then
    onoff_numberplate(true)
end

Main_menu:add_toggle(Menu_Numberplates_toggle,
    function()
    	return numberplate_enabled
    end,
    function(value)
    	onoff_numberplate(value)
    end)

Main_menu:add_bare_item("Speed",
    function()
    	if not localplayer:is_in_vehicle() then
            return Menu_Numberplates_Speed.." "..Menu_Numberplates_NotInVehicle
        end
    	local veh = localplayer:get_current_vehicle()
    	if not veh then
            return Menu_Numberplates_Speed.." "..Menu_Numberplates_InvalidVehicle
        end
    	local speed = round(get_vehicle_speed(veh) * units_value[units_selection], 1)
    	return Menu_Numberplates_Speed.." "..speed .. " " .. units_text_short[units_selection]
    end,
    function() end,
    function() end,
    function() end)
-----------------------------------