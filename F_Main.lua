require("scripts/globals")
require("scripts/A_language")
local success, settings = pcall(json.loadfile, Settings_JSON_Filename)
local Main_menu = menu.add_submenu(Menu_Submenu)
local Unlocks_menu = menu.add_submenu("Unlocks/Tunable menu")
local Settings_menu = menu.add_submenu(Settings_Submenu)

function Save_settings()
    json.savefile(Settings_JSON_Filename, settings)
end

local units_selection = settings.Numberplates.unit
local units_text_short = {"km/h", "m/s", "mi/h", "ft/s"}
local units_text_numberplate = {"kmh", "mps", "mph", "fps"}
local units_value = {3.6, 1, 2.2369362921, 3.280839895}
local numberplate_enabled = settings.Numberplates.enabled
local numberplate_custom_enabled = settings.Numberplates.custom.enabled
local numberplate_key = {settings.Numberplates.foward,
						settings.Numberplates.left,
						settings.Numberplates.backwards,
						settings.Numberplates.right
						}
local numberplate_ref = {}
local Plate_Submenus = {}
local Numberplates_Keymap = {"Z/Q/S/D","W/A/S/D"}
local Plate_Character = {}
	Plate_Character[1]  = "A"
	Plate_Character[2]  = "B"
	Plate_Character[3]  = "C"
	Plate_Character[4]  = "D"
	Plate_Character[5]  = "E"
	Plate_Character[6]  = "F"
	Plate_Character[7]  = "G"
	Plate_Character[8]  = "H"
	Plate_Character[9]  = "I"
	Plate_Character[10] = "J"
	Plate_Character[11] = "K"
	Plate_Character[12] = "L"
	Plate_Character[13] = "M"
	Plate_Character[14] = "N"
	Plate_Character[15] = "O"
	Plate_Character[16] = "P"
	Plate_Character[17] = "Q"
	Plate_Character[18] = "R"
	Plate_Character[19] = "S"
	Plate_Character[20] = "T"
	Plate_Character[21] = "U"
	Plate_Character[22] = "V"
	Plate_Character[23] = "W"
	Plate_Character[24] = "X"
	Plate_Character[25] = "Y"
	Plate_Character[26] = "Z"
	for i = 0,9 do
		Plate_Character[27+i] = string.format(i)
	end
	Plate_Character[37] = " "
local Character_Plate_List = {}
for i = 1,8 do
	Character_Plate_List[i] = "Plate"
end
local Plate_text = ""
local Removed_cars = settings.RemovedCars
local No_Scratch_Enabled = false
local KeyCode = {}
	KeyCode[8]  = "Backspace"
	KeyCode[9]  = "Tab"
	KeyCode[13] = "Enter"
	KeyCode[16] = "Shift"
	KeyCode[17] = "Ctrl"
	KeyCode[18] = "Alt"
	KeyCode[20] = "Caps Lock"
	KeyCode[27] = "Esc"
	KeyCode[33] = "Page Up"
	KeyCode[34] = "Page Down"
	KeyCode[35] = "End"
	KeyCode[36] = "Home"
	KeyCode[37] = "Arrow Left"
	KeyCode[38] = "Arrow Up"
	KeyCode[39] = "Arrow Right"
	KeyCode[40] = "Arrow Down"
	KeyCode[45] = "Insert"
	KeyCode[46] = "Delete"
	for i = 0,9 do
		KeyCode[48+i] = string.format(i)
	end
	KeyCode[61] = "="
	KeyCode[65] = "a"
	KeyCode[66] = "b"
	KeyCode[67] = "c"
	KeyCode[68] = "d"
	KeyCode[69] = "e"
	KeyCode[70] = "f"
	KeyCode[71] = "g"
	KeyCode[72] = "h"
	KeyCode[73] = "i"
	KeyCode[74] = "j"
	KeyCode[75] = "k"
	KeyCode[76] = "l"
	KeyCode[77] = "m"
	KeyCode[78] = "n"
	KeyCode[79] = "o"
	KeyCode[80] = "p"
	KeyCode[81] = "q"
	KeyCode[82] = "r"
	KeyCode[83] = "s"
	KeyCode[84] = "t"
	KeyCode[85] = "u"
	KeyCode[86] = "v"
	KeyCode[87] = "w"
	KeyCode[88] = "x"
	KeyCode[89] = "y"
	KeyCode[90] = "z"
	KeyCode[91] = "Windows"
	KeyCode[93] = "Right Click"
	for i = 0,9 do
		KeyCode[96+i] = string.format(i).." (Numlock)"
	end
	KeyCode[106] = "* (Numlock)"
	KeyCode[107] = "+ (Numlock)"
	KeyCode[109] = "- (Numlock)"
	KeyCode[110] = ". (Numlock)"
	KeyCode[111] = "/ (Numlock)"
	for i = 1,12 do
		KeyCode[111+i] = "F"..i
	end
	KeyCode[144] = "Num Lock"
	KeyCode[145] = "Scroll Lock"
------------------


local Bindings_menu = Settings_menu:add_submenu(Settings_Binds_Menu)

local Noclip_Bindings = Bindings_menu:add_submenu(Menu_Noclip)
Noclip_Bindings:add_array_item(Menu_Noclip_Toggle,KeyCode,
	function()
		return settings.Noclip.toggle
	end,
	function(key)
		settings.Noclip.toggle = key
		Save_settings()
	end)
Noclip_Bindings:add_array_item(Mouvement_Foward,KeyCode,
	function()
		return settings.Noclip.foward
	end,
	function(key)
		settings.Noclip.foward = key
		Save_settings()
	end)
Noclip_Bindings:add_array_item(Mouvement_Backward,KeyCode,
	function()
		return settings.Noclip.backward
	end,
	function(key)
		settings.Noclip.backward = key
		Save_settings()
	end)
Noclip_Bindings:add_array_item(Mouvement_TurnRight,KeyCode,
	function()
		return settings.Noclip.turnright
	end,
	function(key)
		settings.Noclip.turnright = key
		Save_settings()
	end)
Noclip_Bindings:add_array_item(Mouvement_TrunLeft,KeyCode,
	function()
		return settings.Noclip.turnleft
	end,
	function(key)
		settings.Noclip.turnleft = key
		Save_settings()
	end)
Noclip_Bindings:add_array_item(Mouvement_IncreaseSpeed,KeyCode,
	function()
		return settings.Noclip.increasespeed
	end,
	function(key)
		settings.Noclip.increasespeed = key
		Save_settings()
	end)
Noclip_Bindings:add_array_item(Mouvement_DecreaseSpeed,KeyCode,
	function()
		return settings.Noclip.decreasespeed
	end,
	function(key)
		settings.Noclip.decreasespeed = key
		Save_settings()
	end
)

local Speedometer_Bindings = Bindings_menu:add_submenu(Menu_Speedometer_Bindings)

Speedometer_Bindings:add_array_item(Mouvement_Foward,KeyCode,
	function()
		return settings.Numberplates.foward
	end,
	function(key)
		settings.Numberplates.foward = key
		Save_settings()
	end)
Speedometer_Bindings:add_array_item(Mouvement_Backward,KeyCode,
	function()
		return settings.Numberplates.backwards
	end,
	function(key)
		settings.Numberplates.backwards = key
		Save_settings()
	end)
Speedometer_Bindings:add_array_item(Mouvement_Left,KeyCode,
	function()
		return settings.Numberplates.left
	end,
	function(key)
		settings.Numberplates.left = key
		Save_settings()
	end)
Speedometer_Bindings:add_array_item(Mouvement_Right,KeyCode,
	function()
		return settings.Numberplates.right
	end,
	function(key)
		settings.Numberplates.right = key
		Save_settings()
	end
)
Speedometer_Bindings:add_array_item(Settings_Numberplates_Binds,Numberplates_Keymap,
	function()
		return settings.Numberplates.mode
	end,
	function(m)
		if m == 1 then
			settings.Numberplates.foward	= 90
			settings.Numberplates.backwards = 83
			settings.Numberplates.left		= 81
			settings.Numberplates.right		= 68
			Save_settings()
		else if m == 2 then
			settings.Numberplates.foward	= 87
			settings.Numberplates.backwards = 83
			settings.Numberplates.left		= 65
			settings.Numberplates.right		= 68
			Save_settings()
		end
	end
end)


Text(Settings_Reload,Settings_menu)
Settings_menu:add_array_item(Settings_Language, Menu_Languages,
    function()
		for i = 0,#Menu_Languages do
			if settings.Language == Menu_Languages[i] then
				return i
			end
		end
    end,
    function(l)
        settings.Language = Menu_Languages[l]
        Save_settings()
    end)
--

local Numberplates_Settings = Settings_menu:add_submenu(Menu_Numberplates)
Numberplates_Settings:add_toggle(Settings_Numberplates_enable,
    function()
        return settings.Numberplates.enabled
    end,
    function(n)
        settings.Numberplates.enabled = n
        Save_settings()
    end)

Numberplates_Settings:add_array_item(Settings_Numberplates_unit,units_text,
    function()
        return settings.Numberplates.unit
    end,
    function(u)
        settings.Numberplates.unit = u
        Save_settings()
    end)
Numberplates_Settings:add_toggle(Custom_Numberplates,
    function()
        return settings.Numberplates.custom.enabled
    end,
    function(n)
        settings.Numberplates.custom.enabled = n
        Save_settings()
    end
)

Settings_menu:add_array_item(Shapeshift_Gender,Gender,
	function()
		return settings.Gender
	end,
	function(gen)
		settings.Gender = gen
		Save_settings()
	end
)

Settings_menu:add_toggle(Removed_Cars_Default,
	function()
		return settings.RemovedCars
	end,
	function(rc)
		settings.RemovedCars = rc
		Save_settings()
	end
)




---------------Main----------------

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
Main_menu:add_toggle(Manu_TransactionError,
	function()
		return enable_transaction_error
	end,
	function()
		enable_transaction_error = not enable_transaction_error
		loop_transaction_1()
	end
)


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


----------Numberplate stuff--------
local Numberplates_Menu = Main_menu:add_submenu(Menu_Numberplates)
local function get_vehicle_speed(veh)
	if not veh then return 0 end
	local velocity = veh:get_velocity()
	return math.sqrt(velocity.x ^ 2 + velocity.y ^ 2 + velocity.z ^ 2)
end
local function onoff_numberplate(value)
	if numberplate_enabled or numberplate_custom_enabled then
		for i = 1, #numberplate_key do
			numberplate_ref[i] = menu.register_hotkey(numberplate_key[i], function()
				if not localplayer:is_in_vehicle() then return end
				local veh = localplayer:get_current_vehicle()
				if not veh or veh == nil then return end
				local speed = round(get_vehicle_speed(veh) * units_value[units_selection], 0)
				if speed >= round(6*units_value[units_selection]) then
					if numberplate_enabled then
						veh:set_number_plate_text((speed < 10 and "   " or speed < 100 and "  " or speed < 1000 and " " or "") .. speed .. " " .. units_text_numberplate[units_selection])
					elseif numberplate_custom_enabled and settings.Numberplates.custom.platedefault ~= 0 then
						veh:set_number_plate_text(settings.Numberplates.custom.platelist[settings.Numberplates.custom.platedefault])
					end
				end
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
if numberplate_custom_enabled then
    onoff_numberplate(true)
end
Numberplates_Menu:add_toggle(Menu_Speedometer_Bindings,
    function()
    	return numberplate_enabled
    end,
    function(value)
		numberplate_enabled = value
    	onoff_numberplate(numberplate_enabled)
    end)

Numberplates_Menu:add_bare_item("Speed",
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
    null,
    null,
    null)
Numberplates_Menu:add_toggle(Numberplate_Custom_Toggle,
	function()
		return numberplate_custom_enabled
	end,
	function(value)
		numberplate_custom_enabled = value
		onoff_numberplate(numberplate_custom_enabled)
	end)
--
Text("_____________________________________________",Numberplates_Menu)

local function Custom_Plates()
	Custom_Plates_Manager:clear()
	if settings.Numberplates.custom.platelist ~= nil then
		for i = 1,#settings.Numberplates.custom.platelist do
			if i == settings.Numberplates.custom.platedefault then
				plt = "*"
			else
				plt = "_"
			end
			Plate_Submenus[i] = Custom_Plates_Manager:add_submenu(settings.Numberplates.custom.platelist[i] .. plt)
			Text("_________________" .. settings.Numberplates.custom.platelist[i] .. plt .. "_______________",Plate_Submenus[i])
			-- Choose by default
			if plt == "_" then
				Plate_Submenus[i]:add_action(Numberplate_Custom_Choose,function() settings.Numberplates.custom.platedefault = i Save_settings() end)
			end
			-- Apply
			if localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
				veh = localplayer:get_current_vehicle()
				Plate_Submenus[i]:add_action(Numberplate_Custom_Apply,function() veh:set_number_Plate_text(settings.Numberplates.custom.platelist[i]) end)
			end
			-- Delete
			Plate_Submenus[i]:add_action(Numberplate_Custom_Delete,
			function()
				if #settings.Numberplates.custom.platelist ~= 1 then
					for j = i,#settings.Numberplates.custom.platelist-1 do
						settings.Numberplates.custom.platelist[j] = settings.Numberplates.custom.platelist[j+1]
					end
				else
					settings.Numberplates.custom.platelist = {}
				end
				Save_settings()
			end)
		end
	end
end
Custom_Plates_Manager = Numberplates_Menu:add_submenu(Numberplate_Custom_Manage,Custom_Plates)



for i = 1,8 do
	Numberplates_Menu:add_array_item(Numberplate_Custom_Character..i,Plate_Character,
		function()
			if localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
				local veh = localplayer:get_current_vehicle()
				local not_found = true
				for j = 1,#Plate_Character do
					if string.sub(veh:get_number_plate_text(),i,i) == Plate_Character[j] then
						Character_Plate_List[i] = j
						not_found = false
					end
				end
				if not_found == true then Character_Plate_List[i] = 37 end
			else
				if Character_Plate_List[i] == "Plate" then
					Character_Plate_List[i] = 1
				end
			end
			return Character_Plate_List[i]
		end,
		function(k)
			if localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
				local veh = localplayer:get_current_vehicle()
				local plate = veh:get_number_plate_text()
				plate = string.sub(plate,0,i-1)..""..Plate_Character[k]..""..string.sub(plate,i+1)
				test = plate
				veh:set_number_plate_text(plate)
			else
				Character_Plate_List[i] = k
			end
		end)
end
Text(Numberplate_Custom_Preview,Numberplates_Menu)
Numberplates_Menu:add_bare_item("",
	function()
		if localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
			local veh = localplayer:get_current_vehicle()
			return veh:get_number_plate_text()
		else
			Plate_text = ""
			for i = 1,8 do
				Plate_text = Plate_text .. Plate_Character[Character_Plate_List[i]]
			end
			return Plate_text
		end
	end,
	null,
	null,
	null)
--

Numberplates_Menu:add_action(Numberplate_Custom_SavePlate,
function()
	local current_plate_tosave = ""
	if localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
		local veh = localplayer:get_current_vehicle()
		current_plate_tosave = veh:get_number_plate_text()
	else
		Plate_text = ""
		for i = 1,8 do
			Plate_text = Plate_text .. Plate_Character[Character_Plate_List[i]]
		end
		current_plate_tosave = Plate_text
	end
	if settings.Numberplates.custom.platelist == nil then
		settings.Numberplates.custom.platelist = {current_plate_tosave}
		Save_settings()
	else
		if Is_IN(current_plate_tosave, settings.Numberplates.custom.platelist) then
			return
		else
			settings.Numberplates.custom.platelist[#settings.Numberplates.custom.platelist+1] = current_plate_tosave
			Save_settings()
		end
	end
end)



function On_Vehicle_Changed()
	if No_Scratch_Enabled and localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
		veh = localplayer:get_current_vehicle()
		veh:set_can_be_visibly_damaged(false)
		veh:set_window_collisions_disabled(true)
	end
end
Main_menu:add_toggle(Menu_NoScratch,
	function()
		return No_Scratch_Enabled
	end,
	function()
		No_Scratch_Enabled = not No_Scratch_Enabled
		On_Vehicle_Changed()
	end)
Main_menu:add_toggle("Disable engine auto stop",
	function()
		if localplayer == nil then
			return nil
		end
		return localplayer:get_config_flag(241)
	end,
	function(value)
		localplayer:set_config_flag(241, value)
	end)
menu.register_callback("OnVehicleChanged",On_Vehicle_Changed)

Main_menu:add_action("Reset LSC vehicle sell limit", function() 
	stats.set_int("MPPLY_VEHICLE_SELL_TIME", 0)
	stats.set_int("MPPLY_NUM_CARS_SOLD_TODAY", 0)
end)

-----------------------------------

local Ragdoll_flags = {106,107,108,109,110,318}
CanFlyThruWindscreen = 32

local function better_teleport_to_waypoint()
	if localplayer ~= nil then
	
		if lastwaypointlocation == vector3(0, 0, 0) then
		    local currentlocationn = localplayer:get_position()
			menu:teleport_to_waypoint()
			if currentlocationn ~= localplayer:get_position() then
				lastwaypointlocation = localplayer:get_position()
			end
		else
			if Distance(lastwaypointlocation,localplayer:get_position()) > 1 then
				local currentlocationn = localplayer:get_position()
				menu:teleport_to_waypoint()
				if currentlocationn == localplayer:get_position() then
				-- begin
					
						
						if not localplayer:is_in_vehicle() then
                            -----------------------
                            ---- walking teleport needs a freeze to insta teleport ----
                            -----------------------
							
							for i=1,7 do 
									menu:teleport_to_waypoint()
									localplayer:set_position(lastwaypointlocation)
									menu:teleport_to_waypoint()
									sleep(0.2)
							end
                            -----------------------
						else
						
							
						
                            --##--##--##--##--##--##--##--##--##--##--##--##--##--##
							-- vehicle needs to standing still be level and not trying to drive --
							--##--##--##--##--##--##--##--##--##--##--##--##--##--##
							local v =  localplayer:get_current_vehicle()
							local carnow = v:get_position()
 
						--	v:set_position(lastwaypointlocation)	
								
							local gr_ = v:get_gravity()
							local gd_ = v:get_godmode()
							local cbv_ = v:get_can_be_visibly_damaged()
							local wic_ = v:get_window_collisions_disabled()
							local dl_ = v:get_dirt_level()
							local ms_ = v:get_max_speed()
							local wt_ = v:get_window_tint()
							local bt_ = v:get_bulletproof_tires()
							local gaa_ = v:get_acceleration()
							local cbt_ = v:get_can_be_targeted()
							local acc_ = v:get_acceleration()
							local getseatbelt_ = localplayer:get_seatbelt() 
 
 
							menu:level_current_vehicle()
						--	v:set_godmode(true)
							--menu:kill_current_vehicle()
							v:set_max_speed(5)
							--v:set_health(0)
							
							sleep (0.1)
							
							v:set_max_speed(1000)
		
							v:set_position(lastwaypointlocation)	
							sleep (0.1)
							--menu:heal_vehicle()
							--v:set_health(1000)
							--v:set_godmode(gd_)
							v:set_max_speed(1000)
							--v:set_engine_damage_multiplier(1000)
							localplayer:set_seatbelt(getseatbelt_) 
							menu:level_current_vehicle()
						
							
					     --##--##--##--##--##--##--##--##--##--##--##--##--##--##
							
							  
							
						--end of begin	
					   end 
				else
					lastwaypointlocation = localplayer:get_position()
				end
			else
				local currentlocationn = localplayer:get_position()
				menu:teleport_to_waypoint()
				if currentlocationn ~= localplayer:get_position() then
					lastwaypointlocation = localplayer:get_position()
				end
			end
			
		end
		
	else
	    menu:teleport_to_waypoint()
	end
 
end 

--[[
CSYONS2:add_action("Max all Stats", function() stats.set_int("MP" .. mpx() .. "SCRIPT_INCREASE_DRIV", 100) stats.set_int("MP" .. mpx() .. "SCRIPT_INCREASE_FLY", 100) stats.set_int("MP" .. mpx() .. "SCRIPT_INCREASE_LUNG", 100) stats.set_int("MP" .. mpx() .. "SCRIPT_INCREASE_SHO", 100) stats.set_int("MP" .. mpx() .. "SCRIPT_INCREASE_STAM", 100) stats.set_int("MP" .. mpx() .. "SCRIPT_INCREASE_STL", 100) stats.set_int("MP" .. mpx() .. "SCRIPT_INCREASE_STRN", 100) end)
CSYONS7d = CSYON7:add_submenu("Online Character Stats")
CSYONS7d:add_int_range("Increase Stamina", 1, 0, 100, function()
	return stats.get_int("MP"..MPX.."_script_increase_stam")
end, function(value)
	stats.set_int("MP"..MPX.."_script_increase_stam", value)
end)
 
CSYONS7d:add_int_range("Increase Strength", 1, 0, 100, function()
	return stats.get_int("MP"..MPX.."_script_increase_strn")
end, function(value)
	stats.set_int("MP"..MPX.."_script_increase_strn", value)
end)
 
CSYONS7d:add_int_range("Increase Lung capacity", 1, 0, 100, function()
	return stats.get_int("MP"..MPX.."_script_increase_lung")
end, function(value)
	stats.set_int("MP"..MPX.."_script_increase_lung", value)
end)
 
CSYONS7d:add_int_range("Increase Driving", 1, 0, 100, function()
	return stats.get_int("MP"..MPX.."_script_increase_driv")
end, function(value)
	stats.set_int("MP"..MPX.."_script_increase_driv", value)
end)
 
CSYONS7d:add_int_range("Increase Flying", 1, 0, 100, function()
	return stats.get_int("MP"..MPX.."_script_increase_fly")
end, function(value)
	stats.set_int("MP"..MPX.."_script_increase_fly", value)
end)
 
CSYONS7d:add_int_range("Increase Shooting", 1, 0, 100, function()
	return stats.get_int("MP"..MPX.."_script_increase_sho")
end, function(value)
	stats.set_int("MP"..MPX.."_script_increase_sho", value)
end)
 
CSYONS7d:add_int_range("Increase Stealth", 1, 0, 100, function()
	return stats.get_int("MP"..MPX.."_script_increase_stl")
end, function(value)
	stats.set_int("MP"..MPX.."_script_increase_stl", value)
end)
 
CSYONS7d:add_int_range("Increase Mechanic", 1, 0, 100,
function()
	return stats.get_int("MP"..MPX.."_script_increase_mech")
end,
function(value)
	stats.set_int("MP"..MPX.."_script_increase_mech", value)
end)
]]--

Achivement_List = {}
Achivement_List_01  =  "Welcome to Los Santos"       
Achivement_List_02  =  "A Friendship Resurrected"    
Achivement_List_03  =  "A Fair Day's Pay"            
Achivement_List_04  =  "The Moment of Truth"         
Achivement_List_05  =  "To Live or Die in Los Santos"
Achivement_List_06  =  "Diamond Hard"                
Achivement_List_07  =  "Subversive"                  
Achivement_List_08  =  "Blitzed"                     
Achivement_List_09  =  "Small Town, Big Job"         
Achivement_List_10  =  "The Government Gimps"        
Achivement_List_11  =  "The Big One!"                
Achivement_List_12  =  "Solid Gold, Baby!"           
Achivement_List_13  =  "Career Criminal"             
Achivement_List_14  =  "San Andreas Sightseer"       
Achivement_List_15  =  "All's Fare in Love and War"  
Achivement_List_16  =  "TP Industries Arms Race"     
Achivement_List_17  =  "Multi-Disciplined"           
Achivement_List_18  =  "From Beyond the Stars"       
Achivement_List_19  =  "A Mystery, Solved"           
Achivement_List_20  =  "Waste Management"            
Achivement_List_21  =  "Red Mist"                    
Achivement_List_22  =  "Show Off"                    
Achivement_List_23  =  "Kifflom!"                    
Achivement_List_24  =  "Three Man Army"              
Achivement_List_25  =  "Out of Your Depth"           
Achivement_List_26  =  "Altruist Acolyte"       	  
Achivement_List_27  =  "A Lot of Cheddar"       	  
Achivement_List_28  =  "Trading Pure Alpha"     	  
Achivement_List_29  =  "Pimp My Sidearm"        	  
Achivement_List_30  =  "Wanted: Alive Or Alive" 	  
Achivement_List_31  =  "Los Santos Customs"     	  
Achivement_List_32  =  "Close Shave"            	  
Achivement_List_33  =  "Off the Plane"          	  
Achivement_List_34  =  "Three-Bit Gangster"     	  
Achivement_List_35  =  "Making Moves"           	  
Achivement_List_36  =  "Above the Law"          	  
Achivement_List_37  =  "Numero Uno"             	  
Achivement_List_38  =  "The Midnight Club"      	  
Achivement_List_39  =  "Unnatural Selection"    	  
Achivement_List_40  =  "Backseat Driver"        	  
Achivement_List_41  =  "Run Like The Wind"      	  
Achivement_List_42  =  "Clean Sweep"            	  
Achivement_List_43  =  "Decorated"              	  
Achivement_List_44  =  "Stick Up Kid"           	  
Achivement_List_45  =  "Enjoy Your Stay"        	  
Achivement_List_46  =  "Crew Cut"               	  
Achivement_List_47  =  "Full Refund"            	  
Achivement_List_48  =  "Dialling Digits"        	  
Achivement_List_49  =  "American Dream"         	  
Achivement_List_50  =  "A New Perspective"      	  
Achivement_List_51  =  "Be Prepared"            	  
Achivement_List_52  =  "In the Name of Science" 	  
Achivement_List_53  =  "Dead Presidents"        	  
Achivement_List_54  =  "Parole Day"             	  
Achivement_List_55  =  "Shot Caller"            	  
Achivement_List_56  =  "Four Way"               	  
Achivement_List_57  =  "Live a Little"          	  
Achivement_List_58  =  "Can't Touch This"       	  
Achivement_List_59  =  "Mastermind"             	  
Achivement_List_60  =  "Vinewood Visionary"     	  
Achivement_List_61  =  "Majestic"               	  
Achivement_List_62  =  "Humans of Los Santos"   	  
Achivement_List_63  =  "First Time Director"    	  
Achivement_List_64  =  "Animal Lover"           	  
Achivement_List_65  =  "Ensemble Piece"         	  
Achivement_List_66  =  "Cult Movie"             	  
Achivement_List_67  =  "Location Scout"         	  
Achivement_List_68  =  "Method Actor"           	  
Achivement_List_69  =  "Cryptozoologist"        	  
Achivement_List_70  =  "Getting Started"        	  
Achivement_List_71  =  "The Data Breaches"      	  
Achivement_List_72  =  "The Bogdan Problem"     	  
Achivement_List_73  =  "The Doomsday Scenario"  	  
Achivement_List_74  =  "A World Worth Saving"   	  
Achivement_List_75  =  "Orbital Obliteration"   	  
Achivement_List_76  =  "Elitist"                	  
Achivement_List_77  =  "Masterminds"            	  
Achivement_List[01] = Achivement_List_01
Achivement_List[02] = Achivement_List_02
Achivement_List[03] = Achivement_List_03
Achivement_List[04] = Achivement_List_04
Achivement_List[05] = Achivement_List_05
Achivement_List[06] = Achivement_List_06
Achivement_List[07] = Achivement_List_07
Achivement_List[08] = Achivement_List_08
Achivement_List[09] = Achivement_List_09
Achivement_List[10] = Achivement_List_10
Achivement_List[11] = Achivement_List_11
Achivement_List[12] = Achivement_List_12
Achivement_List[13] = Achivement_List_13
Achivement_List[14] = Achivement_List_14
Achivement_List[15] = Achivement_List_15
Achivement_List[16] = Achivement_List_16
Achivement_List[17] = Achivement_List_17
Achivement_List[18] = Achivement_List_18
Achivement_List[19] = Achivement_List_19
Achivement_List[20] = Achivement_List_20
Achivement_List[21] = Achivement_List_21
Achivement_List[22] = Achivement_List_22
Achivement_List[23] = Achivement_List_23
Achivement_List[24] = Achivement_List_24
Achivement_List[25] = Achivement_List_25
Achivement_List[26] = Achivement_List_26
Achivement_List[27] = Achivement_List_27
Achivement_List[28] = Achivement_List_28
Achivement_List[29] = Achivement_List_29
Achivement_List[30] = Achivement_List_30
Achivement_List[31] = Achivement_List_31
Achivement_List[32] = Achivement_List_32
Achivement_List[33] = Achivement_List_33
Achivement_List[34] = Achivement_List_34
Achivement_List[35] = Achivement_List_35
Achivement_List[36] = Achivement_List_36
Achivement_List[37] = Achivement_List_37
Achivement_List[38] = Achivement_List_38
Achivement_List[39] = Achivement_List_39
Achivement_List[40] = Achivement_List_40
Achivement_List[41] = Achivement_List_41
Achivement_List[42] = Achivement_List_42
Achivement_List[43] = Achivement_List_43
Achivement_List[44] = Achivement_List_44
Achivement_List[45] = Achivement_List_45
Achivement_List[46] = Achivement_List_46
Achivement_List[47] = Achivement_List_47
Achivement_List[48] = Achivement_List_48
Achivement_List[49] = Achivement_List_49
Achivement_List[50] = Achivement_List_50
Achivement_List[51] = Achivement_List_51
Achivement_List[52] = Achivement_List_52
Achivement_List[53] = Achivement_List_53
Achivement_List[54] = Achivement_List_54
Achivement_List[55] = Achivement_List_55
Achivement_List[56] = Achivement_List_56
Achivement_List[57] = Achivement_List_57
Achivement_List[58] = Achivement_List_58
Achivement_List[59] = Achivement_List_59
Achivement_List[60] = Achivement_List_60
Achivement_List[61] = Achivement_List_61
Achivement_List[62] = Achivement_List_62
Achivement_List[63] = Achivement_List_63
Achivement_List[64] = Achivement_List_64
Achivement_List[65] = Achivement_List_65
Achivement_List[66] = Achivement_List_66
Achivement_List[67] = Achivement_List_67
Achivement_List[68] = Achivement_List_68
Achivement_List[69] = Achivement_List_69
Achivement_List[70] = Achivement_List_70
Achivement_List[71] = Achivement_List_71
Achivement_List[72] = Achivement_List_72
Achivement_List[73] = Achivement_List_73
Achivement_List[74] = Achivement_List_74
Achivement_List[75] = Achivement_List_75
Achivement_List[76] = Achivement_List_76
Achivement_List[77] = Achivement_List_77

local Achivement_menu = Unlocks_menu:add_submenu("Achievements") 
	Text("Choose what for achievement you are missing", Achivement_menu) 
	for i = 1,#Achivement_List do
		Achivement_menu:add_action(Achivement_List[i], function() globals.set_int(Achivement_Global, i) end)
	end
--

Unlocks_menu:add_action("Unlock Rare Parachutes",
	function()
		stats.set_bool_masked("MP" .. mpx() .. "TUNERPSTAT_BOOL1", true, 20)  --  Unlock for Sprunk Chute Bag*
		stats.set_bool_masked("MP" .. mpx() .. "TUNERPSTAT_BOOL1", true, 21)  --  Unlock for eCola Chute Bag*
		stats.set_bool_masked("MP" .. mpx() .. "TUNERPSTAT_BOOL1", true, 22)  --  Unlock for Halloween Chute Bag*
		stats.set_bool_masked("MP" .. mpx() .. "TUNERPSTAT_BOOL1", true, 23)  --  Unlock for Sprunk Chute
		stats.set_bool_masked("MP" .. mpx() .. "TUNERPSTAT_BOOL1", true, 24)  --  Unlock for eCola Chute
		stats.set_bool_masked("MP" .. mpx() .. "TUNERPSTAT_BOOL1", true, 25)  --  Unlock for Halloween Chute
	end)
 
Unlocks_menu:add_action("Unlock Rare Progress",
	function()
		stats.set_bool_masked("MP" .. mpx() .. "PSTAT_BOOL0", true, 31)  --  Unlock for Give cash to someone
	end)

Unlocks_menu:add_action('Unlock Vanilla Unicorn',
	function()
		stats.set_int("MP" .. mpx() .. 'LAP_DANCED_BOUGHT', 0)
		stats.set_int("MP" .. mpx() .. 'LAP_DANCED_BOUGHT', 5)
		stats.set_int("MP" .. mpx() .. 'LAP_DANCED_BOUGHT', 10)
		stats.set_int("MP" .. mpx() .. 'LAP_DANCED_BOUGHT', 15)
		stats.set_int("MP" .. mpx() .. 'LAP_DANCED_BOUGHT', 25)
		stats.set_int("MP" .. mpx() .. 'PROSTITUTES_FREQUENTED', 1000)
	end
)

-----------------------------------
Text(Menu_EnhancedOnline,Main_menu)


local function Activate_Locked_Vehicles(val)
	globals.set_bool(Karin_Z190                      ,val)
	globals.set_bool(Pfiste_811                      ,val)
	globals.set_bool(Obey_9F                         ,val)
	globals.set_bool(Obey_9F_Cabrio                  ,val)
	globals.set_bool(Avarus                          ,val)
	globals.set_bool(Karin_Asterope                  ,val)
	globals.set_bool(Declasse_Asea                   ,val)
	globals.set_bool(Albany_Alpha                    ,val)
	globals.set_bool(Dinka_Akuma                     ,val)
	globals.set_bool(Bagger                          ,val)
	globals.set_bool(Gallivanter_Baller              ,val)
	globals.set_bool(Gallivanter_Baller_2            ,val)
	globals.set_bool(Gallivanter_Baller_LE           ,val)
	globals.set_bool(Gallivanter_Baller_LE_Armored   ,val)
	globals.set_bool(Pegassi_Bati                    ,val)
	globals.set_bool(Karin_BeeJay_XL                 ,val)
	globals.set_bool(BF_Injection                    ,val)
	globals.set_bool(BF_Bifta                        ,val)
	globals.set_bool(Vapid_Blade                     ,val)
	globals.set_bool(Nagasaki_Blazer                 ,val)
	globals.set_bool(Nagasaki_Blazer_Lifguard        ,val)
	globals.set_bool(Canis_Bodhi                     ,val)
	globals.set_bool(Coli_Brawler                    ,val)
	globals.set_bool(Bravado_Buffalo                 ,val)
	globals.set_bool(Bravado_Buffalo_S               ,val)
	globals.set_bool(Vapid_Bullet                    ,val)
	globals.set_bool(Grotti_Carbonizzare             ,val)
	globals.set_bool(Albany_Cavalcade                ,val)
	globals.set_bool(Albany_Cavalcade_2              ,val)
	globals.set_bool(Rune_Cheburek                   ,val)
	globals.set_bool(Grotti_Cheetah                  ,val)
	globals.set_bool(Cliffhanger                     ,val)
	globals.set_bool(Vapid_Clique                    ,val)
	globals.set_bool(Enus_Cognoscenti                ,val)
	globals.set_bool(Enus_Cognoscenti_Armored        ,val)
	globals.set_bool(Enus_Cognoscenti_55             ,val)
	globals.set_bool(Enus_Cognoscenti_55_Armored     ,val)
	globals.set_bool(Enus_Cognoscenti_Cabrio         ,val)
	globals.set_bool(Pfister_Comet                   ,val)
	globals.set_bool(Pfister_Comet_Retro             ,val)
	globals.set_bool(Pfister_Comet_SR                ,val)
	globals.set_bool(Vapid_Contender                 ,val)
	globals.set_bool(Invetero_Coquette               ,val)
	globals.set_bool(Invetero_Coquette_Blackfin      ,val)
	globals.set_bool(Coli_Cyclone                    ,val)
	globals.set_bool(Schyster_Deviant                ,val)
	globals.set_bool(Karin_Dilettante                ,val)
	globals.set_bool(Dinka_DoubleT                   ,val)
	globals.set_bool(BF_Dune                         ,val)
	globals.set_bool(Weeny_Dynasty                   ,val)
	globals.set_bool(Dinka_Enduro                    ,val)
	globals.set_bool(Overflod_Entity_XF              ,val)
	globals.set_bool(Pegassi_Esskey                  ,val)
	globals.set_bool(Emperor_ETR1                    ,val)
	globals.set_bool(Dewbauchee_Examplar             ,val)
	globals.set_bool(Ocelot_F620                     ,val)
	globals.set_bool(Vulcar_fagaloa                  ,val)
	globals.set_bool(Principe_Faggio                 ,val)
	globals.set_bool(Principe_Faggio_Sport           ,val)
	globals.set_bool(Principe_Faggio_Mod             ,val)
	globals.set_bool(Lampadati_Fellon                ,val)
	globals.set_bool(Lampadati_Fellon_GT             ,val)
	globals.set_bool(Benefactor_Feltzer              ,val)
	globals.set_bool(Vapid_FMJ                       ,val)
	globals.set_bool(Fathom_FQ2                      ,val)
	globals.set_bool(Franken_Stange                  ,val)
	globals.set_bool(Cheval_Fugitive                 ,val)
	globals.set_bool(Lampadati_Furore_GT             ,val)
	globals.set_bool(Schyster_Fusilade               ,val)
	globals.set_bool(Karin_Futo                      ,val)
	globals.set_bool(Bravado_Gauntlet                ,val)
	globals.set_bool(Progen_GP1                      ,val)
	globals.set_bool(Declasse_Granger                ,val)
	globals.set_bool(Bravado_Gresley                 ,val)
	globals.set_bool(Grotti_GT500                    ,val)
	globals.set_bool(Emperor_Habanero                ,val)
	globals.set_bool(Shitzu_Hakuchou                 ,val)
	globals.set_bool(Annis_Hellion                   ,val)
	globals.set_bool(Albany_Hermes                   ,val)
	globals.set_bool(Hexer                           ,val)
	globals.set_bool(Nagasaki_Hot_Blazer             ,val)
	globals.set_bool(Vapid_Hustler                   ,val)
	globals.set_bool(Pegassi_Infernus                ,val)
	globals.set_bool(Vulcar_Ingot                    ,val)
	globals.set_bool(Innovation                      ,val)
	globals.set_bool(Karin_Intruder                  ,val)
	globals.set_bool(Weeny_Issi                      ,val)
	globals.set_bool(Weeny_Issi_Sport                ,val)
	globals.set_bool(Ocelot_Jackal                   ,val)
	globals.set_bool(Dewbauchee_JB700                ,val)
	globals.set_bool(Dinka_Jester                    ,val)
	globals.set_bool(Dinka_Jester_Racing             ,val)
	globals.set_bool(Canis_Kalahari                  ,val)
	globals.set_bool(Dundreary_LandStalker           ,val)
	globals.set_bool(Dundreary_LandStalker_Xl        ,val)
	globals.set_bool(Declasse_LifeGuard              ,val)
	globals.set_bool(Ocelot_Locust                   ,val)
	globals.set_bool(Ocelot_Lynx                     ,val)
	globals.set_bool(Dewbauchee_Massacro             ,val)
	globals.set_bool(Dewbauchee_Massacro_Racing      ,val)
	globals.set_bool(Canis_Mesa                      ,val)
	globals.set_bool(Lampadati_Michelli_GT           ,val)
	globals.set_bool(Vapid_Minivan                   ,val)
	globals.set_bool(Vulcar_Nebula                   ,val)
	globals.set_bool(Principe_Nemesis                ,val)
	globals.set_bool(Vysser_Neo                      ,val)
	globals.set_bool(Ubermacht_Oracle                ,val)
	globals.set_bool(Ubermacht_Oracle_XS             ,val)
	globals.set_bool(Enus_Paragon                    ,val)
	globals.set_bool(Mammoth_Patriot                 ,val)
	globals.set_bool(Shitzu_PCJ600                   ,val)
	globals.set_bool(Maibatsu_Penumbra               ,val)
	globals.set_bool(Vapid_Peyote_Grasser            ,val)
	globals.set_bool(Cheval_Picador                  ,val)
	globals.set_bool(Lampadati_Pigalle               ,val)
	globals.set_bool(Bollokan_Prairie                ,val)
	globals.set_bool(Declasse_Premier                ,val)
	globals.set_bool(Vapid_radi                      ,val)
	globals.set_bool(Declasse_Rancher_XL             ,val)
	globals.set_bool(Dewbauchee_Rapid_GT             ,val)
	globals.set_bool(Dewbauchee_Rapid_GT_Convertible ,val)
	globals.set_bool(Dewbauchee_Rapid_GT_Classic     ,val)
	globals.set_bool(BF_Raptor                       ,val)
	globals.set_bool(Rat_Bike                        ,val)
	globals.set_bool(Bravado_Rat_Loader              ,val)
	globals.set_bool(Annis_RE_7B                     ,val)
	globals.set_bool(Karin_Rebel                     ,val)
	globals.set_bool(Dundreary_Regina                ,val)
	globals.set_bool(Vapid_Retinue                   ,val)
	globals.set_bool(Ubermacht_Revolter              ,val)
	globals.set_bool(Vapid_Riata                     ,val)
	globals.set_bool(Obey_Rocoto                     ,val)
	globals.set_bool(Chariot_Romero_Hearse           ,val)
	globals.set_bool(Albany_Roosvelt                 ,val)
	globals.set_bool(Albany_Roosvelt_Valor           ,val)
	globals.set_bool(Pegassi_Ruffian                 ,val)
	globals.set_bool(Imponte_Ruiner                  ,val)
	globals.set_bool(Hijak_Ruston                    ,val)
	globals.set_bool(Karin_Rebel_Rusty               ,val)
	globals.set_bool(Annis_S80                       ,val)
	globals.set_bool(Maibatsu_Sanchez                ,val)
	globals.set_bool(Maibatsu_Sanchez_Livery         ,val)
	globals.set_bool(Sanctus                         ,val)
	globals.set_bool(Vapid_Sandking_SWB              ,val)
	globals.set_bool(Annis_Savestra                  ,val)
	globals.set_bool(Ubermacht_SC1                   ,val)
	globals.set_bool(Benefactor_Schafter             ,val)
	globals.set_bool(Benefactor_Schafter_LWB         ,val)
	globals.set_bool(Benefactor_Schafter_LWB_Armored ,val)
	globals.set_bool(Benefactor_Schwartzer           ,val)
	globals.set_bool(Canis_Saminole                  ,val)
	globals.set_bool(Canis_Saminole_Frontier         ,val)
	globals.set_bool(Ubermacht_Sentinel              ,val)
	globals.set_bool(Benefactor_Serrano              ,val)
	globals.set_bool(Dewbauchee_Seven_70             ,val)
	globals.set_bool(Sovereign                       ,val)
	globals.set_bool(Enus_Stafford                   ,val)
	globals.set_bool(Vapid_Stanier                   ,val)
	globals.set_bool(Grotti_Stinger                  ,val)
	globals.set_bool(Grotti_Stinger_GT               ,val)
	globals.set_bool(Benefactor_Stirling_GT          ,val)
	globals.set_bool(Zirconium_Stratum               ,val)
	globals.set_bool(Benefactor_Streiter             ,val)
	globals.set_bool(Enus_Super_Diamond              ,val)
	globals.set_bool(Benefactor_Surano               ,val)
	globals.set_bool(Cheval_Surge                    ,val)
	globals.set_bool(Ocelot_Swinger                  ,val)
	globals.set_bool(Obey_Tailgater                  ,val)
	globals.set_bool(Dinka_Thrust                    ,val)
	globals.set_bool(Lampadati_Tigon                 ,val)
	globals.set_bool(pegassi_Torero                  ,val)
	globals.set_bool(Declasse_Tornado_Rat_Rod        ,val)
	globals.set_bool(Declasse_Tulip                  ,val)
	globals.set_bool(Progen_Tyrus                    ,val)
	globals.set_bool(Pegassi_Vacca                   ,val)
	globals.set_bool(Shitzu_Vader                    ,val)
	globals.set_bool(Declasse_Vamos                  ,val)
	globals.set_bool(Bravado_Verlierer               ,val)
	globals.set_bool(Dinka_Verus                     ,val)
	globals.set_bool(Declasse_Vigero                 ,val)
	globals.set_bool(Lampadati_Viseris               ,val)
	globals.set_bool(Coil_Voltic                     ,val)
	globals.set_bool(Vulcar_Warrener                 ,val)
	globals.set_bool(Albany_Washington               ,val)
	globals.set_bool(Wolfsbane                       ,val)
	globals.set_bool(Ocelot_XA_21                    ,val)
	globals.set_bool(Benefactor_XLS                  ,val)
	globals.set_bool(Benefactor_XLS_Armored          ,val)
	globals.set_bool(Truffade_Z_Type                 ,val)
	globals.set_bool(Ubermacht_Zion                  ,val)
	globals.set_bool(Ubermacht_Zion_Cabrio           ,val)
	globals.set_bool(Ubermacht_Zion_Classic          ,val)
	globals.set_bool(Zomble_Bobber                   ,val)
	globals.set_bool(Pegassi_Zorusso                 ,val)
end
if Removed_cars == true then
	Activate_Locked_Vehicles(Removed_cars)
end
Main_menu:add_toggle(Menu_RemovedCars_Toggle,
	function()
		return Removed_cars
	end,
	function(val)
		Removed_cars = not Removed_cars
		Activate_Locked_Vehicles(val)
	end)
--

Main_menu:add_action("Remove the Stupid Orbital Cannon Cooldown", function() stats.set_int("MP" .. mpx() .. "ORBITAL_CANNON_COOLDOWN", 0) end)

Main_menu:add_action(Menu_Nightclub_Popular, function() stats.set_int("MP"..mpx().."_club_popularity", 1000) end)

Main_menu:add_int_range(Menu_Challenge, 1, 1, 100,
	function()
		if localplayer then
			if stats.get_bool("MP"..mpx().."_CARMEET_PV_CHLLGE_CMPLT") then
				return 1
			end
			return 0
		end
	end,
	function(ChCn)
		stats.set_bool("MP"..mpx().."_CARMEET_PV_CHLLGE_CMPLT", true) stats.set_int("MP"..mpx().."_CARMEET_PV_CHLLGE_PRGSS", ChCn)
	end)

Main_menu:add_action("Complete Daily Objectives",
	function()
		stats.set_int("MP" .. mpx() .. "COMPLETEDAILYOBJ", 100)
		stats.set_int("MP" .. mpx() .. "COMPLETEDAILYOBJTOTAL", 100)
		stats.set_int("MP" .. mpx() .. "TOTALDAYCOMPLETED", 100)
		stats.set_int("MP" .. mpx() .. "TOTALWEEKCOMPLETED", 400)
		stats.set_int("MP" .. mpx() .. "TOTALMONTHCOMPLETED", 1800)
		stats.set_int("MP" .. mpx() .. "CONSECUTIVEDAYCOMPLETED", 30)
		stats.set_int("MP" .. mpx() .. "CONSECUTIVEWEEKCOMPLETED", 4)
		stats.set_int("MP" .. mpx() .. "CONSECUTIVEMONTHCOMPLETE", 1)
		stats.set_int("MP" .. mpx() .. "COMPLETEDAILYOBJSA", 100)
		stats.set_int("MP" .. mpx() .. "COMPLETEDAILYOBJTOTALSA", 100)
		stats.set_int("MP" .. mpx() .. "TOTALDAYCOMPLETEDSA", 100)
		stats.set_int("MP" .. mpx() .. "TOTALWEEKCOMPLETEDSA", 400)
		stats.set_int("MP" .. mpx() .. "TOTALMONTHCOMPLETEDSA", 1800)
		stats.set_int("MP" .. mpx() .. "CONSECUTIVEDAYCOMPLETEDSA", 30)
		stats.set_int("MP" .. mpx() .. "CONSECUTIVEWEEKCOMPLETEDSA", 4)
		stats.set_int("MP" .. mpx() .. "CONSECUTIVEMONTHCOMPLETESA", 1)
		stats.set_int("MP" .. mpx() .. "AWD_DAILYOBJCOMPLETEDSA", 100)
		stats.set_int("MP" .. mpx() .. "AWD_DAILYOBJCOMPLETED", 100)
		stats.set_bool("MP" .. mpx() .. "AWD_DAILYOBJMONTHBONUS", true)
		stats.set_bool("MP" .. mpx() .. "AWD_DAILYOBJWEEKBONUS", true)
		stats.set_bool("MP" .. mpx() .. "AWD_DAILYOBJWEEKBONUSSA", true)
		stats.set_bool("MP" .. mpx() .. "AWD_DAILYOBJMONTHBONUSSA", true)
	end)
---

function Report()
	ReportsStats_submenu:clear()
	Text(Menu_Readonly,ReportsStats_submenu)
	Text(stats.get_int("MPPLY_GRIEFING")           .." ← "..Report_List[01], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_EXPLOITS")           .." ← "..Report_List[02], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_GAME_EXPLOITS")      .." ← "..Report_List[03], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_TC_ANNOYINGME")      .." ← "..Report_List[04], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_TC_HATE")            .." ← "..Report_List[05], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_VC_ANNOYINGME")      .." ← "..Report_List[06], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_VC_HATE")            .." ← "..Report_List[07], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_OFFENSIVE_LANGUAGE") .." ← "..Report_List[08], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_OFFENSIVE_TAGPLATE") .." ← "..Report_List[09], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_OFFENSIVE_UGC")      .." ← "..Report_List[10], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_BAD_CREW_NAME")      .." ← "..Report_List[11], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_BAD_CREW_MOTTO")     .." ← "..Report_List[12], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_BAD_CREW_STATUS")    .." ← "..Report_List[13], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_BAD_CREW_EMBLEM")    .." ← "..Report_List[14], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_FRIENDLY")           .." ← "..Report_List[15], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_HELPFUL")            .." ← "..Report_List[16], ReportsStats_submenu)
end
ReportsStats_submenu=Main_menu:add_submenu(Menu_Report_Menu,Report)