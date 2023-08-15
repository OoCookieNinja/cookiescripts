require("scripts/globals")
require("scripts/A_language")
local success, settings = pcall(json.loadfile, Settings_JSON_Filename)
local Main_menu = menu.add_submenu(Menu_Submenu)
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
local function round(value, dec)
	dec = dec or 0
	return tonumber(string.format("%." .. dec .. "f", value))
end
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
menu.register_callback("OnVehicleChanged",On_Vehicle_Changed)

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
--

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