require("scripts/Cookie_Menu_A_language")




Cookie_menu = menu.add_submenu("Cookie Script "..Script_Version)


Text(Separator_text, Cookie_menu)
Text(Heist_Text, Cookie_menu)

Casino_menu = Cookie_menu:add_submenu(Casino_Submenu)
Cayo_menu = Cookie_menu:add_submenu(Cayo_Submenu)
Doomsday_Menu     = Cookie_menu:add_submenu(Doomsday_Menu)
Appartements_menu = Cookie_menu:add_submenu(Appartements_Submenu)
Other_Heists_Menu = Cookie_menu:add_submenu(Other_Submenu)

Text(Separator_text, Cookie_menu)
Text(Miscellaneous_text, Cookie_menu)

Shapeshift_Menu   = Cookie_menu:add_submenu(Shapeshift_Submenu)
Main_menu         = Cookie_menu:add_submenu(Menu_Submenu)
Unlocks_menu      = Cookie_menu:add_submenu(Unlock_Tunable_Menu)
Settings_menu     = Cookie_menu:add_submenu(Settings_Submenu)






---- Variables and lists

local P = {}
local Player_Cut_Max

-- Casino
    local Weapon=0
    local Casino_Mask_List={"Geometric","Hunter","Christian Feltz","Oni Half Mask","Emoji","Ornate Skull","Lucky Fruit","Guerilla","Clown","Animal","Riot","Oni","Hockey"} Casino_Mask_List[0]=Unselected_text
    local Casino_Hacker_List={"Rickie Lukens","Christian Feltz","Yohan Blair","Avi Schwartzman","Paige Harris"}
    local Casino_cuts = nil
    local Casino_Cuts_List = {}
    local we = {}
    	for i = 1,5 do
    		we[i] = 0
    	end
    local Casino_Gunman=nil
    local KaAb, ChRe, PaMc, ChMc, GuMo={}, {}, {}, {}, {}
    local ca = {}
    	for i = 1,5 do
    		ca[i] = 3
    	end
    local Casino_Driver=nil
    local KaDe, ZaNe, TaMa, EdTo, CcMc={}, {}, {}, {}, {}

-- Cayo
    local Cayo_Disturbance_level = {"33%","66%","100%"} Cayo_Disturbance_level[0]="0%"
    local Cayo_Cuts_List = {}
    local Player_Max_autotake = 100
    local Max_option = 1
    if TTL then
    	TTL4l=7351544 TTL4h=7351544 TTL3h=7351542
    else
    	TTL4l=9439088 TTL4h=10470904 TTL3h=8059220
    end

-- Doom&apps
    local Player_List={}
    local Doomsday_Cuts_List = {}
    local Appartements_Cuts_List = {}

-- Shapeshift
    local idx_mp = settings.Gender
    local idx_animal = 1
    local idx_special = 1
    local idx_female = 1
    local idx_male = 1
    local idx_law_female = 1
    local idx_law_male = 1
    local idx_cs_female = 1
    local idx_cs_male = 1

-- Main
    local units_selection = settings.Numberplates.unit
    local units_text_short = {"km/h", "m/s", "mi/h", "ft/s"}
    local units_text_numberplate = {"kmh", "mps", "mph", "fps"}
    local units_value = {3.6, 1, 2.2369362921, 3.280839895}
    local numberplate_enabled = settings.Numberplates.enabled
    local numberplate_custom_enabled = settings.Numberplates.custom.enabled
    local Plate_Submenus = {}
    local Character_Plate_List = {}
    for i = 1,8 do
    	Character_Plate_List[i] = "Plate"
    end
    local Menu_Keybindings = {}
    	Menu_Keybindings[1] = config.Menu.KeyBindings.MenuToggle
    	Menu_Keybindings[2] = config.Menu.KeyBindings.SelectKey
    	Menu_Keybindings[3] = config.Menu.KeyBindings.BackKey
    	Menu_Keybindings[4] = config.Menu.KeyBindings.UpKey
    	Menu_Keybindings[5] = config.Menu.KeyBindings.DownKey
    	Menu_Keybindings[6] = config.Menu.KeyBindings.RightKey
    	Menu_Keybindings[7] = config.Menu.KeyBindings.LeftKey
    local Plate_text = ""
    local Vehicle_List_Adress = {}
    local Disabled_veh = {}
    local Removed_cars = settings.RemovedCars
    local No_Scratch_Enabled = false
    local up_hotkey
    local down_hotkey
    local forward_hotkey
    local backward_hotkey
    local turnleft_hotkey
    local turnright_hotkey
    local increasespeed_hotkey
    local decreasespeed_hotkey
    local Noclip_bind = {}
    	Noclip_bind[1] = settings.Noclip.up
    	Noclip_bind[2] = settings.Noclip.down
    	Noclip_bind[3] = settings.Noclip.foward
    	Noclip_bind[4] = settings.Noclip.backward
    	Noclip_bind[5] = settings.Noclip.turnleft
    	Noclip_bind[6] = settings.Noclip.turnright
    	Noclip_bind[7] = settings.Noclip.increasespeed
    	Noclip_bind[8] = settings.Noclip.decreasespeed
    	Noclip_bind[9] = settings.Noclip.toggle
    local default_ragdoll = localplayer:get_no_ragdoll()
    local default_292     = localplayer:get_config_flag(292)
    local enable = false
    local speed = 2
    local cars_data = {}
    local multiplier_percent = 100
    local boost_activate = true
    local enable_transaction_error = false
    local refill_key = settings.RefillKey
    local rainbow,random,strobelight = true, false, false
    local uniform = true
    local mul  = 5
    local affect_traffic = false
    local colorStyle = 1
    local Original_Color = {999,999,999,999,999,999}
    local uniformtoggle = false
    local is_dead = false
    local color_custom
    local Orignial_Plate = "________"
    if not localplayer then myplayer = nil else myplayer = localplayer end
    if not myplayer:is_in_vehicle() then vehicle = nil else vehicle = myplayer:get_current_vehicle() end
    local Rainbow_Activated = false
-- Global tester
    local tester_mode_list = {"Globals","Stats","Scripts"}
    local tester_mode = 1
    local type_mode_list = {"int","string","bool","float"}
    local type_mode = 1
    local scripts_thingy_list = {"fm_mission_controller","fm_mission_controller_2020","gb_gang_ops_planning","fmmc_launcher"}
    local scripts_thingy = 1
    local global_use = false
    local is_reading = false
    local global_max_lenght = 10
    local saved_globals_list = {}

    local current_global_list = {}
    for i = 1,global_max_lenght do
        current_global_list[i] = 0
    end
    local current_global = 0

    local current_setter_list = {}
    for i = 1,global_max_lenght do
        current_setter_list[i] = 0
    end
    local current_setter = 0
--


---- Functions

-- Casino
    local function Casino_Target_Stat() return stats.get_int(mpx().."H3OPT_TARGET") end
    local function H3Bit1(i,v)if v~=nil then stats.set_bool_masked(mpx().."H3OPT_BITSET1",v,i)else return stats.get_bool_masked(mpx().."H3OPT_BITSET1",i)end end
    local function H3Bit0(i,v)if v~=nil then stats.set_bool_masked(mpx().."H3OPT_BITSET0",v,i)else return stats.get_bool_masked(mpx().."H3OPT_BITSET0",i)end end

-- Cayo
    local function Cayo_Heist_Weapon(v)
    	if v~=nil then
    		stats.set_int(mpx().."H4CNF_WEAPONS",v)
    	else
    		return stats.get_int(mpx().."H4CNF_WEAPONS")
    	end
    end
    local function Cayo_Heist_Mission(i,v)
    	if v~=nil then
    		stats.set_bool_masked(mpx().."H4_MISSIONS",v,i)
    	else
    		return stats.get_bool_masked(mpx().."H4_MISSIONS",i)
    	end
    end
    local function Cayo_Heist_Generator(i,v)
    	if v~=nil then
    		stats.set_bool_masked(mpx().."H4CNF_BS_GEN",v,i)
    	else
    		return stats.get_bool_masked(mpx().."H4CNF_BS_GEN",i)
    	end
    end
    local function Cayo_Heist_Gold(i,v)
    	if v == nil then
            return stats.get_bool_masked(mpx().."H4LOOT_GOLD_C",i)
    	else
    		if v then
            	stats.set_bool_masked(mpx().."H4LOOT_CASH_C",false,i)
            	stats.set_bool_masked(mpx().."H4LOOT_CASH_C_SCOPED",false,i)
    		end
        end
        stats.set_bool_masked(mpx().."H4LOOT_GOLD_C",v,i)
        stats.set_bool_masked(mpx().."H4LOOT_GOLD_C_SCOPED",v,i)
    end
    local function Cayo_Heist_Cash(i,v)
    	if v == nil then
            return stats.get_bool_masked(mpx().."H4LOOT_CASH_C",i)
    	else
    		if v then
            	stats.set_bool_masked(mpx().."H4LOOT_GOLD_C",false,i)
            	stats.set_bool_masked(mpx().."H4LOOT_GOLD_C_SCOPED",false,i)
    		end
        end
        stats.set_bool_masked(mpx().."H4LOOT_CASH_C",v,i)
        stats.set_bool_masked(mpx().."H4LOOT_CASH_C_SCOPED",v,i)
    end
    local function Cayo_Heist_Painting(i,v)
    	if v==nil then
            return stats.get_bool_masked(mpx().."H4LOOT_PAINT",i)
    	else
            stats.set_bool_masked(mpx().."H4LOOT_PAINT",v,i)
            stats.set_bool_masked(mpx().."H4LOOT_PAINT_SCOPED",v,i)
        end
    end
    local function Cayo_Heist_Coke(i,v)
    	if v==nil then
            return stats.get_bool_masked(mpx().."H4LOOT_COKE_I",i)
    	else
    		if v then
            	stats.set_bool_masked(mpx().."H4LOOT_CASH_I",false,i)
    			stats.set_bool_masked(mpx().."H4LOOT_CASH_I_SCOPED",false,i)
    			stats.set_bool_masked(mpx().."H4LOOT_WEED_I",false,i)
    			stats.set_bool_masked(mpx().."H4LOOT_WEED_I_SCOPED",false,i)
    		end
    		stats.set_bool_masked(mpx().."H4LOOT_COKE_I",v,i)
            stats.set_bool_masked(mpx().."H4LOOT_COKE_I_SCOPED",v,i)
        end
    end
    local function Cayo_Heist_Cash_2(i,v)
    	if v==nil then
            return stats.get_bool_masked(mpx().."H4LOOT_CASH_I",i)
    	else
    		if v then
            	stats.set_bool_masked(mpx().."H4LOOT_COKE_I",false,i)
    			stats.set_bool_masked(mpx().."H4LOOT_COKE_I_SCOPED",false,i)
    			stats.set_bool_masked(mpx().."H4LOOT_WEED_I",false,i)
    			stats.set_bool_masked(mpx().."H4LOOT_WEED_I_SCOPED",false,i)
    		end
    		stats.set_bool_masked(mpx().."H4LOOT_CASH_I",v,i)
            stats.set_bool_masked(mpx().."H4LOOT_CASH_I_SCOPED",v,i)
        end
    end
    local function Cayo_Heist_Weed(i,v)
    	if v==nil then
            return stats.get_bool_masked(mpx().."H4LOOT_WEED_I",i)
    	else
    		if v then
            	stats.set_bool_masked(mpx().."H4LOOT_CASH_I",false,i)
    			stats.set_bool_masked(mpx().."H4LOOT_CASH_I_SCOPED",false,i)
    			stats.set_bool_masked(mpx().."H4LOOT_COKE_I",false,i)
    			stats.set_bool_masked(mpx().."H4LOOT_COKE_I_SCOPED",false,i)
    		end
    		stats.set_bool_masked(mpx().."H4LOOT_WEED_I",v,i)
            stats.set_bool_masked(mpx().."H4LOOT_WEED_I_SCOPED",v,i)
        end
    end

-- Doom&apps
    local function Doomsday_Preperation(i,v)
    	if v~=nil then
            if i>13 then
                stats.set_bool_masked(mpx().."GANGOPS_FM_MISSION_PROG",v,i)
                stats.set_bool_masked(mpx().."GANGOPS_FM_MISSION_PROG",v,i-14)
    		    if v then
                    stats.set_bool_masked(mpx().."GANGOPS_FM_MISSION_SKIP",false,i-14)
                end
            else
                stats.set_bool_masked(mpx().."GANGOPS_FM_MISSION_PROG",v,i)
    	    	if v then
                    stats.set_bool_masked(mpx().."GANGOPS_FM_MISSION_PROG",false,i+14)
                    stats.set_bool_masked(mpx().."GANGOPS_FM_MISSION_SKIP",false,i)
                end
            end
    	else
            return stats.get_bool_masked(mpx().."GANGOPS_FM_MISSION_PROG",i)
        end
    end
    local function Doomsday_Preperation_Skip(i,v)
    	if v~=nil then
            stats.set_bool_masked(mpx().."GANGOPS_FM_MISSION_SKIP",v,i)
            if v then
                stats.set_bool_masked(mpx().."GANGOPS_FM_MISSION_PROG",true,i)
    	        stats.set_bool_masked(mpx().."GANGOPS_FM_MISSION_PROG",false,i+14)
            end
        else
            return stats.get_bool_masked(mpx().."GANGOPS_FM_MISSION_SKIP",i)
        end
    end
    local function Doomsday_Missions(i,v)
    	if v~=nil then
            stats.set_bool_masked(mpx().."GANGOPS_FLOW_MISSION_PROG",v,i)
    	    if v then
                if i>-1 and i<3 or i>9 and i<14 then
                    if not Doomsday_Preperation(i) and not Doomsday_Preperation_Skip(i) then
                        Doomsday_Preperation(i,true)
                    end
                elseif i>3 and i<7 then
                    if not Doomsday_Preperation(i-1) and not Doomsday_Preperation_Skip(i-1) then
                        Doomsday_Preperation(i-1,true)
                    end
    		    elseif i==7 or i==9 then
                    if not Doomsday_Preperation(i) and not Doomsday_Preperation_Skip(i) and not Doomsday_Preperation(i-1) and not Doomsday_Preperation_Skip(i-1) then
                        Doomsday_Preperation(i,true)
                        Doomsday_Preperation(i-1,true)
                    end
                end
            end
    	else
            return stats.get_bool_masked(mpx().."GANGOPS_FLOW_MISSION_PROG",i)
        end
    end
    local function Heist_Player_List()
    	for i=0,3 do
            Player_List[i]=nil
            if player.get_player_ped(i) then
                if player.get_player_ped(i)==localplayer then
                    Player_List[i]=You_text
                else
    		        Player_List[i]=player.get_player_name(i)
                end
            end
        end
    end
    local function Appartements_Missions(i,v)
        i = i*3
    	if v~=nil then
            stats.set_bool_masked(mpx().."HEIST_PLANNING_STAGE",v,i)
        else
            return
            stats.get_bool_masked(mpx().."HEIST_PLANNING_STAGE",i)
        end
    end

-- Shapesift
    local function get_Delay()
    	delay, increase = 0, 0.01
    	globals.set_int(Shapeshift_Trigger, 1)
    	while(true) do
    		delay = delay + increase
    		sleep(increase)
    		if globals.get_int(Shapeshift_Trigger) == 0 then
    			return delay + increase
    		end
    	end
    end
    local function set_model_hash(h)
    	delay = get_Delay()
    	count = 0
    	while h ~= 0 do
    		myped = player.get_player_ped()
    		if not myped or myped:get_model_hash() == h or count == 10 then
    			return
    		end
    		globals.set_int(Shapeshift_Trigger, 1)
    		if h then
    			globals.set_int(Shapeshift_Hash,h)
    		end
    		sleep(delay)
    		globals.set_int(Shapeshift_Trigger,0)
    		globals.set_int(Shapeshift_Hash,0)
    		sleep(0.1)
    		count = count + 1
    	end
    end

-- Main
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
    local function get_vehicle_speed(veh)
    	if not veh then return 0 end
    	local velocity = veh:get_velocity()
    	return math.sqrt(velocity.x ^ 2 + velocity.y ^ 2 + velocity.z ^ 2)
    end
    local function Get_Disabled_vehs()
        local tested_list
        local tested_list_1
        local tested_list_2
        local tested_list_3
        local list_count = 1
        for i = 1, #Vehicle_List_Adress-1 do
            tested_list = Vehicle_List_Adress[i]
            tested_list_1 = tested_list[1]
            tested_list_2 = tested_list[2]
            tested_list_3 = tested_list[3]
            for j = 0, (tested_list_2 - tested_list_1)/tested_list_3 do
                if globals.get_bool(tested_list_1 + j*tested_list_3) == false then
                    Disabled_veh[list_count] = tested_list_1 + j*tested_list_3
                    list_count = list_count+1
                end
            end
        end
    end
    local function Switch_Veh_Unlock_State()
        for i = 1,#Disabled_veh do
            globals.set_bool(Disabled_veh[i], Removed_cars)
        end
    end
    Get_Disabled_vehs()
    Switch_Veh_Unlock_State()
    local function refillInventory()
    	stats.set_int(mpx().."NO_BOUGHT_YUM_SNACKS", 30)
    	stats.set_int(mpx().."NO_BOUGHT_HEALTH_SNACKS", 15)
    	stats.set_int(mpx().."NO_BOUGHT_EPIC_SNACKS", 5)
    	stats.set_int(mpx().."NUMBER_OF_ORANGE_BOUGHT", 10)
    	stats.set_int(mpx().."NUMBER_OF_BOURGE_BOUGHT", 10)
    	stats.set_int(mpx().."NUMBER_OF_CHAMP_BOUGHT", 5)
    	stats.set_int(mpx().."CIGARETTES_BOUGHT", 20)
    	for i = 1,5 do
    		stats.set_int(mpx().."MP_CHAR_ARMOUR_".. i .."_COUNT", 10)
    	end
    	stats.set_int(mpx().."BREATHING_APPAR_BOUGHT", 20)
    	if stats.get_int(mpx().."SR_INCREASE_THROW_CAP") then 
    		if localplayer:get_weapon_by_hash(joaat("slot_stickybomb")) then localplayer:get_weapon_by_hash(joaat("slot_stickybomb")):set_current_ammo(30) end
    		if localplayer:get_weapon_by_hash(joaat("slot_smokegrenade")) then localplayer:get_weapon_by_hash(joaat("slot_smokegrenade")):set_current_ammo(30) end
    		if localplayer:get_weapon_by_hash(joaat("slot_grenade")) then localplayer:get_weapon_by_hash(joaat("slot_grenade")):set_current_ammo(30) end
    		if localplayer:get_weapon_by_hash(joaat("slot_molotov")) then localplayer:get_weapon_by_hash(joaat("slot_molotov")):set_current_ammo(30) end
    		if localplayer:get_weapon_by_hash(joaat("slot_proxmine")) then localplayer:get_weapon_by_hash(joaat("slot_proxmine")):set_current_ammo(10) end
    		if localplayer:get_weapon_by_hash(joaat("slot_pipebomb")) then localplayer:get_weapon_by_hash(joaat("slot_pipebomb")):set_current_ammo(15) end
    	end
    end
    local function NoClip(e)
    	if not localplayer then return end
    	if e then 
    		localplayer:set_freeze_momentum(true) 
    		localplayer:set_no_ragdoll(true)
    		localplayer:set_config_flag(292,true)
    		up_hotkey = menu.register_hotkey(Noclip_bind[1], up)
    		down_hotkey = menu.register_hotkey(Noclip_bind[2], down)
    		forward_hotkey = menu.register_hotkey(Noclip_bind[3], forward)
    		backward_hotkey = menu.register_hotkey(Noclip_bind[4], backward)
    		turnleft_hotkey = menu.register_hotkey(Noclip_bind[5], turnleft)
    		turnright_hotkey = menu.register_hotkey(Noclip_bind[6], turnright)
    		increasespeed_hotkey = menu.register_hotkey(Noclip_bind[7], increasespeed)
    		decreasespeed_hotkey = menu.register_hotkey(Noclip_bind[8], decreasespeed)
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
    				Plate_Submenus[i]:add_action(Numberplate_Custom_Apply,function() veh:set_number_plate_text(settings.Numberplates.custom.platelist[i]) end)
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
    function randomColor(color_red, color_green, color_blue)
    	slp = 0.5
    	if affect_traffic then slp = 0.03 end
    	sleep(slp / mul)
    	return math.random(0,255), math.random(0,255), math.random(0,255)
    end 
    function strobeLight(color_red, color_green, color_blue)
    	local slp = 0.8
    	if affect_traffic then slp = 0.02 end
    	if color_red == 255 then
    		color_red, color_green, color_blue = 0, 0, 0
    	else
    		color_red, color_green, color_blue = 255, 255, 255
    	end
    	if not uniform and uniformtoggle then
    		uniformtoggle = not uniformtoggle
    	else 
    		sleep(slp / mul)
    		uniformtoggle = true
    	end
    	return color_red, color_green, color_blue
    end 
    function nextRainbowColor(color_red, color_green, color_blue)
    	if (color_red > 0 and color_blue == 0 and color_green == 0 and not (color_red >= 255)) then
    		color_red = color_red + 1 * mul
    	elseif (color_red > 0 and color_blue == 0) then
    		color_red = color_red - 1 * mul
    		color_green = color_green + 1 * mul
    	elseif (color_green > 0 and color_red == 0) then
    		color_green = color_green - 1 * mul
    		color_blue = color_blue + 1 * mul
    	elseif (color_blue > 0 and color_green == 0) then
    		color_red = color_red + 1 * mul
    		color_blue = color_blue - 1 * mul
    	else
    		color_red = color_red + 1 * mul
            color_green = color_green - 1 * mul
            color_blue = color_blue - 1 * mul
    	end
    
        -- Clamp the color values to the range of 0-255
        color_red = math.max(0, math.min(255, color_red))
        color_green = math.max(0, math.min(255, color_green))
        color_blue = math.max(0, math.min(255, color_blue))
    
    	return color_red, color_green, color_blue
    end 
    local function toggleColorFunction(colorFunc)
    	local rainbow_list_thingy = {false,false,true,false,false}
    	rainbow = rainbow_list_thingy[4-colorFunc]
    	strobelight = rainbow_list_thingy[5-colorFunc]
    	random = rainbow_list_thingy[6-colorFunc]
    end
    local function boostVehicle(vehicle_data, hash, vehicle, boost)
    	if boost then --boost mode
    		accel = vehicle_data[1] * (17 * (multiplier_percent / 100))
    		brake_force = vehicle_data[2] * (23 * (multiplier_percent / 100))
    		gravity = 19.7
    		handbrake_force = vehicle_data[4] * (14 * (multiplier_percent / 100))
    		initial_drive_force = vehicle_data[5] * (690 * (multiplier_percent / 100))   --nice
    		traction_min = 6 + (2 * (multiplier_percent / 100))   --very high traction. Used without roll_centre modification, the car will constantly flip
    		traction_max = vehicle_data[7] + (2 * (multiplier_percent / 100))
    		traction_bias_front = 0.420
    		up_shift = 10000  --huge shift values, causing cars to get stuck in gear and accelerate rapidly
    		down_shift = 10000
    		max_flat_vel = 10000
    		collision_dmg_multiplier = 0
    		engine_dmg_multiplier = 0
    		if multiplier_percent >= 100 then
    			--Dont increase the following roll_centre variables more than 100%. Makes things flip.
    			multiplier_percent = 100
    		end
    		roll_centre_front = vehicle_data[15] + (0.300 * (multiplier_percent / 100)) --these two stop the car from rolling even at high speeds, it rolls inwards instead
    		roll_centre_rear = vehicle_data[16] + (0.300 * (multiplier_percent	/ 100))
    		drive_bias = 0.5   --all wheel drive
    		traction_loss_mult = 1
    		initial_drag_coeff = 1  --no drag forces
    	else --restore mode
    		accel = vehicle_data[1]
    		brake_force = vehicle_data[2]
    		gravity = vehicle_data[3]
    		handbrake_force = vehicle_data[4]
    		initial_drive_force = vehicle_data[5]
    		traction_min = vehicle_data[6]
    		traction_max = vehicle_data[7]
    		traction_bias_front = vehicle_data[8]
    		up_shift = vehicle_data[9]
    		down_shift = vehicle_data[10]
    		max_flat_vel = vehicle_data[11]
    		--mass_offset = vehicle_data[12]
    		collision_dmg_multiplier = vehicle_data[13]
    		engine_dmg_multiplier = vehicle_data[14]
    		roll_centre_front = vehicle_data[15]
    		roll_centre_rear = vehicle_data[16]
    		drive_bias = vehicle_data[17]
    		traction_loss_mult = vehicle_data[18]
    		initial_drag_coeff = vehicle_data[19]
    	end
    
    	vehicle:set_acceleration(accel)
    	vehicle:set_brake_force(brake_force)
    	vehicle:set_gravity(gravity)
    	vehicle:set_handbrake_force(handbrake_force)
    	vehicle:set_initial_drive_force(initial_drive_force)
    	vehicle:set_traction_curve_min(traction_min)
    	vehicle:set_traction_curve_max(traction_max)
    	vehicle:set_traction_bias_front(traction_bias_front)
    	vehicle:set_up_shift(up_shift)
    	vehicle:set_down_shift(down_shift)
    	vehicle:set_initial_drive_max_flat_velocity(max_flat_vel)
    	vehicle:set_roll_centre_height_front(roll_centre_front)
    	vehicle:set_roll_centre_height_rear(roll_centre_rear)
    	vehicle:set_drive_bias_front(drive_bias)
    	vehicle:set_collision_damage_multiplier(collision_dmg_multiplier)
    	vehicle:set_engine_damage_multiplier(engine_dmg_multiplier)
    	vehicle:set_traction_loss_multiplier(traction_loss_mult)
    	vehicle:set_initial_drag_coeff(initial_drag_coeff)
    	vehicle:set_max_speed(10000)
    end
    local function reloadVehicle(vehicle)
    	if not vehicle then return end
    	--Check if car has been found in the table, then restore, otherwise exit
    	restore = cars_data[vehicle:get_model_hash()]
    	if restore then
    		boostVehicle(restore, vehicle:get_model_hash(), vehicle, false)
    	end
    end
    function carBoost()
    	if localplayer ~= nil and localplayer:is_in_vehicle() then 
    		current = localplayer:get_current_vehicle()
    		if current == nil then return end

    		current:set_boost_enabled(false)
    		sleep(0.1)
    		if current:get_gravity() ~= 19.7 and boost_activate and not current:get_boost_enabled() and current:get_acceleration() > 0 and current:get_acceleration() < 1 then
            
    			::retry::
    			--Save car data to map if its not in there already
    			if not cars_data[current:get_model_hash()] then
    				cars_data[current:get_model_hash()] = {
    					current:get_acceleration(),						--1
    					current:get_brake_force(),						--2
    					current:get_gravity(),							--3
    					current:get_handbrake_force(),					--4
    					current:get_initial_drive_force(),				--5
    					current:get_traction_curve_min(),				--6
    					current:get_traction_curve_max(),				--7
    					current:get_traction_bias_front(),				--8
    					current:get_up_shift(),							--9
    					current:get_down_shift(),						--10
    					current:get_initial_drive_max_flat_velocity(),	--11
    					current:get_centre_of_mass_offset(),			--12
    					current:get_collision_damage_multiplier(),		--13
    					current:get_engine_damage_multiplier(),			--14
    					current:get_roll_centre_height_front(),			--15	
    					current:get_roll_centre_height_rear(),			--16
    					current:get_drive_bias_front(),					--17
    					current:get_traction_loss_multiplier(),			--18
    					current:get_initial_drag_coeff(),				--19
    					}
    			end
            
    			--boost car if data has been read successfully
    			boostVehicle(cars_data[current:get_model_hash()], current:get_model_hash(), current, true)
            
    			--Check if the boost worked, else reload the vehicle object again and try once more
    			--This is usually necessary when changing to a new car of the same type, or when the old one gets destroyed and called back
    			if current:get_gravity() ~= 19.7 then
    				cars_data[current:get_model_hash()] = nil
    				goto retry
    			end
    		else
    			reloadVehicle(current)
    		end
    	end
    end
    local function changeVehicleColor(vehicle, colorFunc)
    	local red, green, blue = vehicle:get_custom_primary_colour()
    	local red2, green2, blue2 = vehicle:get_custom_secondary_colour()
    	red, green, blue = colorFunc(red, green, blue)
    	vehicle:set_custom_primary_colour(red, green, blue)
    	if uniform then
    		vehicle:set_custom_secondary_colour(red, green, blue)
    	else
    		red2, green2, blue2 = colorFunc(red2, green2, blue2)
    		--Make sure we actually produce non-uniform colors
    		if math.abs(red2 - red ) < 20 and math.abs(blue2 - blue) < 20 and math.abs(green2 - green) < 20 then
    			red2, blue2, green2 = 255, 0, 0
    		end
    		vehicle:set_custom_secondary_colour(red2, green2, blue2)
    	end
    end
-- Global tester
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
--



------------------------
-------- Casino --------

----    Setup
local Casino_Setup=Casino_menu:add_submenu(Casino_Setup_Submenu)


Casino_Setup:add_array_item(Casino_Setup_Mode, Heist_difficulty_list,
    function()
    	if stats.get_int(mpx().."H3_HARD_APPROACH") == stats.get_int(mpx().."H3OPT_APPROACH") then
    		return 2
    	end
    	return 1
    end,

    function(v)
		Approach_Mode = v
		if stats.get_int(mpx().."H3OPT_APPROACH") ~= 0 then
			AP = stats.get_int(mpx().."H3OPT_APPROACH")
		else
			AP = stats.get_int(mpx().."H3_LAST_APPROACH")
			stats.set_int(mpx().."H3OPT_APPROACH", AP)
		end

    	if AP == 1 then
    		H3Bit1(5,true)
			H3Bit1(6,true)
			H3Bit0(3,true)
			H3Bit0(5,true)
    	elseif AP == 2 then
    		H3Bit1(7,true)
			H3Bit0(12,true)
			H3Bit0(13,true)
			H3Bit0(16,true)
    	elseif AP == 3 then
    		H3Bit1(8,true)
			H3Bit1(9,true)
			H3Bit0(19,true)
			H3Bit0(20,true)
    	else
    		return
    	end

    	for i = 0,4 do
    		H3Bit1(i,true)
    	end

    	H3Bit0(1,true)
    	H3Bit0(2,true)
    	stats.set_int(mpx().."H3OPT_KEYLEVELS", 2)
		if not Is_IN(stats.get_int(mpx().."H3OPT_CREWHACKER"),{1,2,3,4,5}) then
    		stats.set_int(mpx().."H3OPT_CREWHACKER",4)
		end
		if not Is_IN(stats.get_int(mpx().."H3OPT_CREWWEAP"),{1,2,3,4}) then
    		stats.set_int(mpx().."H3OPT_CREWWEAP",1)
		end
		if not Is_IN(stats.get_int(mpx().."H3OPT_CREWDRIVER"),{1,2,3,4}) then
    		stats.set_int(mpx().."H3OPT_CREWDRIVER",1)
		end
    	stats.set_int(mpx().."H3OPT_WEAPS", 0)
    	stats.set_int(mpx().."H3OPT_VEHS", 0)
    	stats.set_int(mpx().."H3OPT_DISRUPTSHIP", 3)
    end
)


Text(Manual_text,Casino_Setup)


Casino_Setup:add_array_item(Casino_Setup_Targetchoise, Casino_Target_List, function() return Casino_Target_Stat() end, function(H3t) stats.set_int(mpx().."H3OPT_TARGET", H3t) end)

for i=0,1 do
	Casino_Setup:add_toggle(Casino_Setup_Missions_List_1[i], function() return H3Bit1(i) end,
	function()
		H3Bit1(i,not H3Bit1(i))
		if i==0 then
			if not H3Bit1(i) then
				stats.set_int(mpx().."H3OPT_BITSET1",0)
				stats.set_int(mpx().."H3OPT_BITSET0",0)
			end
		end
	end)
end


Casino_Setup:add_toggle(Casino_Setup_Missions_List_1[4], function() return H3Bit1(4) end, function() H3Bit1(4,not H3Bit1(4)) end)


Casino_Setup:add_array_item(Casino_Approach_Setmode, Heist_difficulty_list,
    	function()
    		if stats.get_int(mpx().."H3_HARD_APPROACH") == stats.get_int(mpx().."H3OPT_APPROACH") then
    			return 2
    		else
    			return 1
    		end
    	end,
    	function(H3lvl)
    		Casino_Last_Approach = stats.get_int(mpx().."H3_LAST_APPROACH")
    		Casino_Hard_Approach = stats.get_int(mpx().."H3_HARD_APPROACH")
    		if H3lvl==2 then
    			Casino_Approch = Casino_Hard_Approach
    		else
    			if Casino_Last_Approach ~= 1 and Casino_Hard_Approach ~= 1 then
    				Casino_Approch=1 Weapon = 1
    			elseif Casino_Last_Approach ~= 2 and Casino_Hard_Approach ~= 2 then
    				Casino_Approch=2 Weapon = 0
    			else
    				Casino_Approch=3 Weapon = 0
    			end
	    	end
	    	stats.set_int(mpx().."H3OPT_APPROACH", Casino_Approch)
	    end
	)
Casino_Setup:add_array_item(Casino_Approach_Choice, Casino_Approch_List,
	    function()
	    return 2*stats.get_int(mpx().."H3OPT_APPROACH")-1
	    end,
	    function(H3AO)
		    if H3AO==1 then
	    		Casino_Approch_Manual=1 Casino_Last_Approach_Manual=3 Casino_Hard_Approach_Manual=2
		    elseif H3AO==2 then
	    		Casino_Approch_Manual=1 Casino_Last_Approach_Manual=3 Casino_Hard_Approach_Manual=1
		    elseif H3AO==3 then
	    		Casino_Approch_Manual=2 Casino_Last_Approach_Manual=3 Casino_Hard_Approach_Manual=1
		    elseif H3AO==4 then
	    		Casino_Approch_Manual=2 Casino_Last_Approach_Manual=3 Casino_Hard_Approach_Manual=2
    	    elseif H3AO==5 then
    			Casino_Approch_Manual=3 Casino_Last_Approach_Manual=1 Casino_Hard_Approach_Manual=2
		    else
	    		Casino_Approch_Manual=3 Casino_Last_Approach_Manual=1 Casino_Hard_Approach_Manual=3
		    end

	    	stats.set_int(mpx().."H3_LAST_APPROACH", Casino_Last_Approach_Manual)
	    	stats.set_int(mpx().."H3_HARD_APPROACH", Casino_Hard_Approach_Manual)
	    	stats.set_int(mpx().."H3OPT_APPROACH", Casino_Approch_Manual)
    	end
)


local Casino_Approch_Settings=nil

local function CurAp()
	Casino_Approch_Settings:clear()
	-- Silent and Sneaky
	if stats.get_int(mpx().."H3OPT_APPROACH")==1 then
		Text(Casino_Approach_Settings_Silentnsneaky,Casino_Approch_Settings)
		Casino_Approch_Settings:add_toggle(Casino_Setup_Missions_List_0[5], function() return H3Bit0(5) end, function() H3Bit0(5,not H3Bit0(5)) end)
		Casino_Approch_Settings:add_toggle(Casino_Setup_Missions_List_0[3], function() return H3Bit0(3) end, function() H3Bit0(3,not H3Bit0(3)) end)
	-- The Big Con
	elseif stats.get_int(mpx().."H3OPT_APPROACH")==2 then
		Text(Casino_Approach_Settings_Thebigcon,Casino_Approch_Settings)
		Casino_Approch_Settings:add_toggle(Casino_Setup_Missions_List_1[7], function() return H3Bit1(7) end, function() H3Bit1(7,not H3Bit1(7)) end)
		Text(Casino_Approach_Settings_Thebigcon_entrydesguise,Casino_Approch_Settings)
		for i=8,15 do
			Casino_Approch_Settings:add_toggle(Casino_Setup_Missions_List_0[i], function() return H3Bit0(i) end,
			function()
				H3Bit0(i,not H3Bit0(i))
				if i%2~=0 then
					if H3Bit0(i)then
						H3Bit0(i-1,true)
					end
				end
			end)
		end
		Text(Casino_Approach_Settings_Thebigcon_exitdesguise,Casino_Approch_Settings)
		for i=16,17 do
			Casino_Approch_Settings:add_toggle(Casino_Setup_Missions_List_0[i], function() return H3Bit0(i) end, function() H3Bit0(i,not H3Bit0(i)) end)
		end
	-- Agressive
	elseif stats.get_int(mpx().."H3OPT_APPROACH")==3 then
		Text(Casino_Approach_Settings_Aggressive,Casino_Approch_Settings)
		for i=19,20 do
			Casino_Approch_Settings:add_toggle(Casino_Setup_Missions_List_0[i], function() return H3Bit0(i) end, function() H3Bit0(i,not H3Bit0(i)) end)
		end
	-- None Detected
	else
		Text("    No Approach detected",Casino_Approch_Settings)
		Text("Try going back to MainMenu once",Casino_Approch_Settings)
	end
end
Casino_Approch_Settings=Casino_Setup:add_submenu(Casino_Approach_Settings_Submenu,CurAp)




Casino_Setup:add_array_item(Casino_Crew_Hacker, Casino_Hacker_List, function() return stats.get_int(mpx().."H3OPT_CREWHACKER") end, function(Hkr) stats.set_int(mpx().."H3OPT_CREWHACKER", Hkr) end)

local function WEAPON()
	Casino_Gunman:clear()
	Casino_Gunman:add_action(Casino_Crew_Gunman_Choise, function() end)
	WEP=stats.get_int(mpx().."H3OPT_CREWWEAP")
	APR=stats.get_int(mpx().."H3OPT_APPROACH")
	Wa=stats.get_int(mpx().."H3OPT_WEAPS")
	
	Abo, Mot, Ree, Mcc, Mcr = "", "", "", "", ""

	if WEP==1 then
		Abo="*" AB=Wa
	elseif WEP==2 then
		Mot="*" MO=Wa
	elseif WEP==3 then
		Ree="*" RE=Wa
	elseif WEP==4 then
		Mcc="*" MC=Wa
	elseif WEP==5 then
		Mcr="*" MR=Wa
	end

	if APR==1 then
		kaab=Casino_Crew_Gunman_MicroSMG kaaB=Casino_Crew_Gunman_Machinepistol
	elseif APR==2 then
		kaab=Casino_Crew_Gunman_MicroSMG kaaB=Casino_Crew_Gunman_Shotgun
	elseif APR==3 then
		kaab=Casino_Crew_Gunman_Shotgun kaaB="Revolver"
	else
		kaab="Gun1" kaaB="Gun2"
	end

	if APR==1 or APR==3 then
		chre="SMG" chrE=Casino_Crew_Gunman_Shotgun
	elseif APR==2 then
		chre=Casino_Crew_Gunman_Machinepistol chrE=Casino_Crew_Gunman_Shotgun
	else
		chre="Gun1" chrE="Gun2"
	end
	GuMo[0]=Casino_Crew_Gunman_Rifle GuMo[1]=Casino_Crew_Gunman_Shotgun

	if APR==1 then
		chmc=Casino_Crew_Gunman_MicroSMG chmC=Casino_Crew_Gunman_Machinepistol
	elseif APR==2 then
		chmc=Casino_Crew_Gunman_MicroSMG chmC=Casino_Crew_Gunman_Shotgun
	elseif APR==3 then
		chmc=Casino_Crew_Gunman_ShotgunMKII chmC=Casino_Crew_Gunman_RifleMKII
	else
		chmc="Gun1" chmC="Gun2"
	end

	if APR==1 then
		pamc=Casino_Crew_Gunman_MicroSMG pamC=Casino_Crew_Gunman_Machinepistol
	elseif APR==2 then
		pamc=Casino_Crew_Gunman_MicroSMG pamC=Casino_Crew_Gunman_Shotgun
	elseif APR==3 then
		pamc=Casino_Crew_Gunman_Shotgun pamC="Revolver"
	else
		pamc="Gun1" pamC="Gun2"
	end

	KaAb[0]=kaab
	KaAb[1]=kaaB
	ChRe[0]=chre
	ChRe[1]=chrE
	ChMc[0]=chmc
	ChMc[1]=chmC
	PaMc[0]=pamc
	PaMc[1]=pamC
	
	Casino_Gunman:add_array_item("Karl Abolaji"..Abo, KaAb,
		function()
			if not AB then
				return we[1]
			else
				return Wa
			end
		end,
		function(KaW)
			we[1]=KaW
			stats.set_int(mpx().."H3OPT_CREWWEAP", 1)
			stats.set_int(mpx().."H3OPT_WEAPS", KaW)
		end)
	
	Casino_Gunman:add_array_item("Charlie Reed"..Ree, ChRe,
		function()
			if not RE then
				return we[3]
			else
				return Wa
			end
		end,
		function(ChW)
			we[3]=ChW
			stats.set_int(mpx().."H3OPT_CREWWEAP", 3)
			stats.set_int(mpx().."H3OPT_WEAPS", ChW)
		end)
	
	Casino_Gunman:add_array_item("Patrick Mcreary"..Mcr, PaMc,
		function()
			if not MR then
				return we[5]
			else
				return Wa
			end
		end,
		function(PaW)
			we[5]=PaW
			stats.set_int(mpx().."H3OPT_CREWWEAP", 5)
			stats.set_int(mpx().."H3OPT_WEAPS", PaW)
		end)
	
	Casino_Gunman:add_array_item("Gustavo Mota"..Mot, GuMo,
		function()
			if not MO then
				return we[2]
			else return Wa
			end
		end,
		function(GuW)
			we[2]=GuW
			stats.set_int(mpx().."H3OPT_CREWWEAP", 2)
			stats.set_int(mpx().."H3OPT_WEAPS", GuW)
		end)
	Casino_Gunman:add_array_item("Chester Mccoy"..Mcc, ChMc,
		function()
			if not MC then
				return we[4]
			else
				return Wa
			end
		end,
		function(ChW)
			we[4]=ChW
			stats.set_int(mpx().."H3OPT_CREWWEAP", 4)
			stats.set_int(mpx().."H3OPT_WEAPS", ChW)
		end)
	Casino_Gunman:add_toggle(Casino_Setup_Missions_List_1[2],function()return H3Bit1(2)end,function()H3Bit1(2,not H3Bit1(2))end)
end
Casino_Gunman = Casino_Setup:add_submenu(Casino_Crew_Gunman_Submenu,WEAPON)

local function Driver()
	Casino_Driver:clear()
	Casino_Driver:add_action(Casino_Crew_Driver_Choise, function() end)

	Car=stats.get_int(mpx().."H3OPT_VEHS")
	drv=stats.get_int(mpx().."H3OPT_CREWDRIVER")
	den, mar, toh, nel, mcc="", "", "", "", ""

	if drv==1 then
		den="*" DE=Car
	elseif drv==2 then
		mar="*" MA=Car
	elseif drv==3 then
		toh="*" TO=Car
	elseif drv==4 then
		nel="*" NE=Car
	elseif drv==5 then
		mcc="*" MR=Car
	end

	KaDe[0]="Issi Classic" KaDe[1]="ASBO" KaDe[2]="Kanjo" KaDe[3]="Sentinel Classic"
	ZaNe[0]="Manchez" ZaNe[1]="Stryder" ZaNe[2]="Defiler" ZaNe[3]="Lectro"
	TaMa[0]="Retinue MKII" TaMa[1]="Drift Yosemite" TaMa[2]="Sugoi" TaMa[3]="Jugular"
	EdTo[0]="Sultan Classic" EdTo[1]="Gauntlet Classic" EdTo[2]="Elie" EdTo[3]="Komoda"
	CcMc[0]="Zhaba" CcMc[1]="Vagrant" CcMc[2]="Outlaw" CcMc[3]="Everon"
	
	Casino_Driver:add_array_item("Karim Denz"..den, KaDe,
		function()
			if not DE then
				return ca[1]
			else
				return Car
			end
		end,
		function(KaC)
			ca[1]=KaC stats.set_int(mpx().."H3OPT_CREWDRIVER", 1)
			stats.set_int(mpx().."H3OPT_VEHS", KaC)
		end)
	
    Casino_Driver:add_array_item("Zach Nelson"..Casino_Crew_Driver_Bikes..""..nel, ZaNe,
		function()
			if not NE then
				return ca[4]
			else
				return Car
			end
		end,
		function(ZaC)
			ca[4]=ZaC stats.set_int(mpx().."H3OPT_CREWDRIVER", 4)
			stats.set_int(mpx().."H3OPT_VEHS", ZaC)
		end)
    Casino_Driver:add_array_item("Taliana Martinez"..mar, TaMa,
		function()
			if not MA then
				return ca[2]
			else
				return Car
			end
		end,
		function(TaC)
			ca[2]=TaC stats.set_int(mpx().."H3OPT_CREWDRIVER", 2)
			stats.set_int(mpx().."H3OPT_VEHS", TaC) 
		end)
    Casino_Driver:add_array_item("Eddie Toh"..toh, EdTo, 
		function()
			if not TO then
				return ca[3]
			else
				return Car
			end
		end,
		function(EdC)
			ca[3]=EdC stats.set_int(mpx().."H3OPT_CREWDRIVER", 3)
			stats.set_int(mpx().."H3OPT_VEHS", EdC)
		end)
    Casino_Driver:add_array_item("Chester Mccoy"..mcc, CcMc,
		function()
			if not MR then
				return ca[5]
			else
				return Car
			end
		end,
		function(ChC)
			ca[5]=ChC stats.set_int(mpx().."H3OPT_CREWDRIVER", 5)
			stats.set_int(mpx().."H3OPT_WEAPS", ChC)
		end)
    Casino_Driver:add_toggle(Casino_Setup_Missions_List_1[3],function()return H3Bit1(3)end,function()H3Bit1(3,not H3Bit1(3))end)
end
Casino_Driver=Casino_Setup:add_submenu(Casino_Crew_Driver_Submenu,Driver)

Casino_Setup:add_array_item(Casino_Crew_Mask, Casino_Mask_List,
	function()
		M=stats.get_int(mpx().."H3OPT_MASKS")
		if M<1 or M>13 or M==nil then
			return 0
		end
		return stats.get_int(mpx().."H3OPT_MASKS")
	end,
	function(H3Msk)
		stats.set_int(mpx().."H3OPT_MASKS", H3Msk)
	end
	)

--



local Casino_Common=Casino_Setup:add_submenu(Casino_Setup_Common_Submenu)

Casino_Common:add_array_item(Casino_Setup_Common_Passlevel, { None_text, "Lv.1", "Lv.2" }, function() return stats.get_int(mpx().."H3OPT_KEYLEVELS")+1 end, function(SPss) stats.set_int(mpx().."H3OPT_KEYLEVELS", SPss-1) end)
for i=1,2 do
	Casino_Common:add_toggle(Casino_Setup_Missions_List_0[i], function() return H3Bit0(i) end, function() H3Bit0(i,not H3Bit0(i)) end)
end
Casino_Common:add_array_item(Casino_Setup_Common_Shipment, {"0%","33%","66%","100%"}, function() return stats.get_int(mpx().."H3OPT_DISRUPTSHIP")+1 end,
		function(DugS)
		    if DugS>1 then
	    		DuSh=4
				stats.set_int(mpx().."H3OPT_DISRUPTSHIP",DugS-1)
		    	H3Bit0(2,true)
			else
				DuSh=0
				stats.set_int(mpx().."H3OPT_DISRUPTSHIP", 0)
			end
		end
	)

Casino_Common:add_toggle(Casino_Setup_Missions_List_0[4], function() return H3Bit0(4) end, function() return H3Bit0(4,not H3Bit0(4)) end)
for i=6,7 do
	Casino_Common:add_toggle(Casino_Setup_Missions_List_0[i], function() return H3Bit0(i) end, function() H3Bit0(i,not H3Bit0(i)) end)
end




----    Cuts
local function Casino_Cuts()
    Casino_cuts_menu:clear()
	P = {}
	Casino_Cuts_List = {}
	P[1],P[2] = Notinheist_text, nil
    if globals.get_int(Casino_Cut_offset+1) <= 1000 and globals.get_int(Casino_Cut_offset+1) >= 0 then
		for i = 1,4 do
			if globals.get_int(Casino_Cut_offset+i)>=15 then if player.get_player_ped(i-1)==localplayer then P[i]=You_text else P[i]=player.get_player_name(i-1) end end
		end

		Text(Cut_Player,Casino_cuts_menu)
		for i = 1,4 do
        	if P[i] then
				Casino_Cuts_List[i] = globals.get_int(Casino_Cut_offset+i)
        	    Casino_cuts_menu:add_array_item(Cut_Player_List[i]..""..P[i], Cut_percent, function() return math.floor(Casino_Cuts_List[i]/5-1) end, function(p) Casino_Cuts_List[i] = (p+1)*5 end)
        	end
		end
		Casino_cuts_menu:add_array_item(Cut_Slider, Cut_percent,
			function()
				if P[1] then
					Player_Cut_Max = globals.get_int(Casino_Cut_offset+1)
					for i = 2,4 do
						if P[i] and globals.get_int(Casino_Cut_offset+i) >= 15 then
				    	    Player_Cut_Max = math.max(Player_Cut_Max, globals.get_int(Casino_Cut_offset+i))
						end
					end
                else
                    return 2
				end
				return Player_Cut_Max
			end,
			function(p)
				Casino_Cuts_List[1] = (p+1)*5
				for i = 2,4 do
					if P[i] then
						Casino_Cuts_List[i] = (p+1)*5
					end
				end
			end)
		
        Casino_cuts_menu:add_array_item(Set_text, Cut_Setter, function() return 1 end,
			function(Casino_Cut_Sellector)
        	    if Casino_Cut_Sellector == 2 then
					for i =1,4 do
						if P[i] then
							Casino_Cuts_List[i] = 100
						end
					end
        	    end
				if P[1] then
					Player_Cut_Max = Casino_Cuts_List[1]
					globals.set_int(Casino_Cut_offset+1, Casino_Cuts_List[1])
					for i = 2,4 do
						if P[i] and Casino_Cuts_List[i] >= 15 then
        	    			globals.set_int(Casino_Cut_offset+i, Casino_Cuts_List[i])
							Player_Cut_Max = math.max(Player_Cut_Max, Casino_Cuts_List[i])
						end
        	    	end
				end
        	end
		)

		Text(Cut_Crew ,Casino_cuts_menu)
		Text(Cut_Crew2,Casino_cuts_menu)
		Text(Cut_Crew3,Casino_cuts_menu)

		drv = stats.get_int(mpx().."H3OPT_CREWDRIVER")
		hck = stats.get_int(mpx().."H3OPT_CREWHACKER")
		wep = stats.get_int(mpx().."H3OPT_CREWWEAP")

		Casino_cuts_menu:add_array_item("Lester", Cut_percent_Full , function() return globals.get_int(Casino_Cut_Lester_offset) end, function(p) globals.set_int(Casino_Cut_Lester_offset, p) end)
		Casino_cuts_menu:add_array_item(Casino_Crew_Driver_Only, Cut_percent_Full , function() return globals.get_int(Casino_Cut_Driver_offset+drv) end, function(q) globals.set_int(Casino_Cut_Driver_offset+drv, q) end)
		Casino_cuts_menu:add_array_item(Casino_Crew_Hacker_Only, Cut_percent_Full , function() return globals.get_int(Casino_Cut_Hacker_offset+hck) end, function(r) globals.set_int(Casino_Cut_Hacker_offset+hck, r) end)
		Casino_cuts_menu:add_array_item(Casino_Crew_Gunman_Only, Cut_percent_Full , function() return globals.get_int(Casino_Cut_Gunman_offset+wep) end, function(s) globals.set_int(Casino_Cut_Gunman_offset+wep, s) end)

    end
end
Casino_cuts_menu=Casino_menu:add_submenu(Casino_Cut_Submenu, Casino_Cuts)




----    Extras
local Casino_Choose_Max = {"Safe","Max"}


local function Casino_Heist()
	Casino_In_Heist:clear()

	Casino_In_Heist:add_action(Casino_Extras_Keypad,
			function()
    		    if HS():is_active() and HS():get_int(Casino_keypad)>=3 and HS():get_int(Casino_keypad)<100 then
    	        HS():set_int(Casino_keypad, 5)
    		    end
    		end
		)

	Casino_In_Heist:add_action(Casino_Extras_Fingerprint,
			function()
			    if HS():is_active() and HS():get_int(Casino_fingerprint)==3 or HS():get_int(Casino_fingerprint)==4 then
			    HS():set_int(Casino_fingerprint, 5)
	    	    end
	    	end
		)

	Casino_In_Heist:add_action(Casino_Extras_DrillVault,
			function()
			    if HS():is_active() and HS():get_int(Casino_drill_total)>=0 or HS():get_int(Casino_drill_total)<=100 then
	    		    HS():set_int(Casino_drill_stat, HS():get_int(Casino_drill_total))
	    	    end
	    	end
		)
	-------------------------------------------------------
	
	Text("WIP",Casino_In_Heist)

	if Player_Cut_Max ~= nil then
		local current_choice = 1
		Casino_In_Heist:add_array_item("Auto take with defined cuts", Casino_Choose_Max,
			function()
				return current_choice
			end,
			function(h)
				player_max = 3600000
				current_choice = h
				if h == 2 then player_max = player_max-300000 end
				player_max = math.floor(h/(Player_Cut_Max/100))

				lst = globals.get_int(Casino_Cut_Lester_offset )
				drv = globals.get_int(Casino_Cut_Driver_offset + stats.get_int(mpx().."H3OPT_CREWDRIVER"  ))
				hck = globals.get_int(Casino_Cut_Hacker_offset + stats.get_int(mpx().."H3OPT_CREWHACKER"  ))
				wep = globals.get_int(Casino_Cut_Gunman_offset + stats.get_int(mpx().."H3OPT_CREWWEAP"    ))

				Max_Take = math.floor(player_max/((100-(lst+drv+hck+wep))/100))

				if HS():is_active() then
					HS():set_int(Casino_real_take, Max_Take)
				end
			end
		)
	else
		local cut_take = (85/5)-1
		Casino_In_Heist:add_array_item("Auto take with max cuts →",Cut_percent,
			function()
				return cut_take
			end,
			function(h)
				cut_take = h
				player_max = math.floor(3600000/(((cut_take+1)*5)/100))

				lst = globals.get_int(Casino_Cut_Lester_offset )
				drv = globals.get_int(Casino_Cut_Driver_offset + stats.get_int(mpx().."H3OPT_CREWDRIVER"))
				hck = globals.get_int(Casino_Cut_Hacker_offset + stats.get_int(mpx().."H3OPT_CREWHACKER"))
				wep = globals.get_int(Casino_Cut_Gunman_offset + stats.get_int(mpx().."H3OPT_CREWWEAP"  ))

				Max_Take = math.floor(player_max/(1-((lst+drv+hck+wep))/100))

				if HS():is_active() then
					HS():set_int(Casino_real_take, Max_Take)
				end
			end
		)
	end
end

Casino_In_Heist=Casino_menu:add_submenu(Extars_Submenu,Casino_Heist)







------------------------
--------- Cayo ---------

-- Cayo Setup
local Cayo_setup=Cayo_menu:add_submenu(Cayo_Setup_Submenu)

-- Instant Setup / Hard mode
Cayo_setup:add_action(Cayo_Seup_Instant,
    function()
	    Cayo_Heist_Mission(0,true)
	    Cayo_Heist_Mission(1,true)
    	for i=9,12 do
	    	Cayo_Heist_Mission(i,true)
	    end
    	Cayo_Heist_Generator(12,true)
    	stats.set_int(mpx().."H4CNF_WEAPONS", 1)
    	stats.set_int(mpx().."H4LOOT_GOLD_C_SCOPED",stats.get_int(mpx().."H4LOOT_GOLD_C"))
    	stats.set_int(mpx().."H4LOOT_CASH_C_SCOPED",stats.get_int(mpx().."H4LOOT_CASH_C"))
    	stats.set_int(mpx().."H4LOOT_PAINT_SCOPED",stats.get_int(mpx().."H4LOOT_PAINT"))
    end
)

Cayo_setup:add_action(Cayo_Setup_Hardmode, function() stats.set_int(mpx().."H4_PROGRESS", 131055) end)


-- Manual Setup
Cayo_setup:add_action(Manual_text,function()end)
Cayo_setup:add_array_item(Cayo_Setup_Target, Cayo_Choose_Target,
	function()
		return stats.get_int(mpx().."H4CNF_TARGET")
	end,
	function(CyT)
		if CyT then
			stats.set_int(mpx().."H4CNF_TARGET", CyT)
		end
	end)

Cayo_setup:add_array_item(Cayo_Setup_ChooseWeapon, Cayo_Choose_Weapon,
	function()
		return Cayo_Heist_Weapon()
	end,
	function(v)
		Cayo_Heist_Weapon(v)
		if Cayo_Heist_Weapon()>0 then
			Cayo_Heist_Mission(12,true)
		else
			Cayo_Heist_Mission(12,false)
		end
	end)

Cayo_setup:add_toggle(Cayo_Missions_List[0] ,function() return Cayo_Heist_Mission(0) end,function()Cayo_Heist_Mission(0,not Cayo_Heist_Mission(0))if not Cayo_Heist_Mission(0) then stats.set_int(mpx().."H4_MISSIONS",0)end end)

-- Approach
local Cayo_Approach_vehicles=Cayo_setup:add_submenu(Cayo_Setup_Approach_Submenu)
Cayo_Approach_vehicles:add_action(Cayo_Setup_Approach_Choose, function() end)
for i=1,6 do
	Cayo_Approach_vehicles:add_toggle(Cayo_Missions_List[i],
		function()
			return Cayo_Heist_Mission(i)
		end,
		function()
			Cayo_Heist_Mission(i,not Cayo_Heist_Mission(i))
			if i==2 or i==4 then
				if not Cayo_Heist_Mission(2)and not Cayo_Heist_Mission(4) then
					Cayo_Heist_Mission(7,false)
				end
			end
		end
		)
end
Cayo_Approach_vehicles:add_toggle(Cayo_Missions_List[7],function()return Cayo_Heist_Mission(7)end,function()Cayo_Heist_Mission(7,not Cayo_Heist_Mission(7))if Cayo_Heist_Mission(7) and not Cayo_Heist_Mission(2) and not Cayo_Heist_Mission(4)then Cayo_Heist_Mission(4,true)end end)


--Disruption And Weapons
local Cayo_Disruption_Missions=Cayo_setup:add_submenu(Cayo_Setup_MissionAndWeapons_Submenu)
for i=8,11 do Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[i],function()return Cayo_Heist_Mission(i)end,function()Cayo_Heist_Mission(i,not Cayo_Heist_Mission(i))end)end
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[12],
	function()
		return Cayo_Heist_Mission(12)
	end,
	function()
		Cayo_Heist_Mission(12,not Cayo_Heist_Mission(12))
		if Cayo_Heist_Mission(12) and stats.get_int(mpx().."H4CNF_WEAPONS")==0 then 
			stats.set_int(mpx().."H4CNF_WEAPONS",1)
		elseif not Cayo_Heist_Mission(12) and stats.get_int(mpx().."H4CNF_WEAPONS")>0 then
			stats.set_int(mpx().."H4CNF_WEAPONS",0)
		end
	end
	)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_ChooseWeapon, Cayo_Choose_Weapon,
	function()
		return stats.get_int(mpx().."H4CNF_WEAPONS")
	end,
	function(v)
		stats.set_int(mpx().."H4CNF_WEAPONS", v)
		if v>0 and not Cayo_Heist_Mission(12) then
			Cayo_Heist_Mission(12,true)
		elseif v==0 and Cayo_Heist_Mission(12) then
			Cayo_Heist_Mission(12,false)
		end
	end
	)
Cayo_Disruption_Missions:add_toggle(Cayo_Point_of_interest_List[12],function()return Cayo_Heist_Generator(12)end,function()Cayo_Heist_Generator(12,not Cayo_Heist_Generator(12))end)
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[13],function()return Cayo_Heist_Mission(13)end,function()Cayo_Heist_Mission(13,not Cayo_Heist_Mission(13))if not Cayo_Heist_Mission(13)then stats.set_int(mpx().."H4CNF_WEP_DISRP", 0)end end)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_PercetangeDestroyed,Cayo_Disturbance_level,
	function()
		return stats.get_int(mpx().."H4CNF_WEP_DISRP")
	end,
	function(v)
		stats.set_int(mpx().."H4CNF_WEP_DISRP",v)
		if v>0 then
			Cayo_Heist_Mission(13,true)
		end
	end
	)
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[14],function()return Cayo_Heist_Mission(14)end,function()Cayo_Heist_Mission(14,not Cayo_Heist_Mission(14))if not Cayo_Heist_Mission(14)then stats.set_int(mpx().."H4CNF_ARM_DISRP", 0)end end)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_PercetangeDestroyed,Cayo_Disturbance_level,
	function()
		return stats.get_int(mpx().."H4CNF_ARM_DISRP")
	end,
	function(v)
		stats.set_int(mpx().."H4CNF_ARM_DISRP",v)
		if v>0 then
			Cayo_Heist_Mission(14,true)
		end
	end
	)
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[15],function()return Cayo_Heist_Mission(15)end,function()Cayo_Heist_Mission(15,not Cayo_Heist_Mission(15))if not Cayo_Heist_Mission(15)then stats.set_int(mpx().."H4CNF_HEL_DISRP", 0)end end)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_PercetangeDestroyed,Cayo_Disturbance_level,
	function()
		return stats.get_int(mpx().."H4CNF_HEL_DISRP")
	end,
	function(v)
		stats.set_int(mpx().."H4CNF_HEL_DISRP",v)
		if v>0 then
			Cayo_Heist_Mission(15,true)
		end
	end
)


-- POIs
local Cayo_Point_of_interest=Cayo_setup:add_submenu(Cayo_Point_of_interest_submenu)
local Cayo_Point_of_interest_grappling = Cayo_Point_of_interest:add_submenu(Cayo_Point_of_interest_grappling_submenu)
	for i=0,2 do
		Cayo_Point_of_interest_grappling:add_toggle(Cayo_Point_of_interest_List[i],
			function()
				return Cayo_Heist_Generator(i)
			end,
			function()
				Cayo_Heist_Generator(i,not Cayo_Heist_Generator(i))
			end)
	end
	Cayo_Point_of_interest_grappling:add_toggle(Cayo_Point_of_interest_List[3],
		function()
			return Cayo_Heist_Generator(3)
		end,
		function()
			Cayo_Heist_Generator(3,not Cayo_Heist_Generator(3))
			if Cayo_Heist_Generator(3) then
				v=5156
			else
				v=0
			end
			stats.set_int(mpx().."H4CNF_GRAPPEL",v)
		end)
local Cayo_Point_of_interest_guardclothes = Cayo_Point_of_interest:add_submenu(Cayo_Point_of_interest_guardclothes_submenu)
	for i=4,7 do
		Cayo_Point_of_interest_guardclothes:add_toggle(Cayo_Point_of_interest_List[i],
			function()
				return Cayo_Heist_Generator(i)
			end,
			function()
				Cayo_Heist_Generator(i,not Cayo_Heist_Generator(i))
				if not Cayo_Heist_Generator(4) and not Cayo_Heist_Generator(5) and not Cayo_Heist_Generator(6) and not Cayo_Heist_Generator(7) then
					v=5256
				else
					v=0
				end
				stats.set_int(mpx().."H4CNF_UNIFORM",v)
			end)
	end
local Cayo_Point_of_interest_boltcutters = Cayo_Point_of_interest:add_submenu(Cayo_Point_of_interest_boltcutters_submenu)
	for i=8,11 do
		Cayo_Point_of_interest_boltcutters:add_toggle(Cayo_Point_of_interest_List[i],
			function()
				return Cayo_Heist_Generator(i)
			end,
			function()
				Cayo_Heist_Generator(i,not Cayo_Heist_Generator(i))
				if not Cayo_Heist_Generator(8)and not Cayo_Heist_Generator(9) and not Cayo_Heist_Generator(10)and not Cayo_Heist_Generator(11) then
					v=4424
				else
					v=0
				end
				stats.set_int(mpx().."H4CNF_BOLTCUT", v)
			end)
		end
	for i=13,14 do
		Cayo_Point_of_interest:add_toggle(Cayo_Point_of_interest_List[i],
		function()
			return Cayo_Heist_Generator(i)
		end,
		function()
			Cayo_Heist_Generator(i,not Cayo_Heist_Generator(i))
		end)
	end
--
Cayo_Point_of_interest:add_array_item(Cayo_Point_of_interest_supplytruck, Cayo_Interest_point,
	function()
		return stats.get_int(mpx().."H4CNF_TROJAN")
	end,
	function(SpTr)
		if SpTr>0 then
			Cayo_Heist_Generator(15,true)
		else
			Cayo_Heist_Generator(15,false)
		end
		stats.set_int(mpx().."H4CNF_TROJAN", SpTr)
	end)

Cayo_setup:add_action(Cayo_Point_of_interest_scopeout,function() stats.set_int(mpx().."H4CNF_BS_GEN", 131071) end)


-- Set Loot
local Cayo_set_loot=Cayo_setup:add_submenu(Cayo_Setloot_Submenu)

-- Inside Compound
	Cayo_set_loot:add_action(Cayo_Setloot_Compound_in,function()end)

	-- Room 1 (North)
		local Cayo_set_loot_Room1=Cayo_set_loot:add_submenu(Cayo_Setloot_Room1)
		Cayo_set_loot_Room1:add_array_item(Cayo_Setloot_Table1, Cayo_set_loot_compound_table_list,
			function()
				if Cayo_Heist_Gold(0) then
					return 1
				elseif Cayo_Heist_Cash(0) then
					return 2
				else
					return 0
				end
			end,
			function(v)
				if v==1 then
					Cayo_Heist_Gold(0,true)
					Cayo_Heist_Cash(0,false)
				elseif v==2 then
					Cayo_Heist_Gold(0,false)
					Cayo_Heist_Cash(0,true)
				else
					Cayo_Heist_Gold(0,false)
					Cayo_Heist_Cash(0,false)
				end
			end)

		Cayo_set_loot_Room1:add_array_item(Cayo_Setloot_Table2, Cayo_set_loot_compound_table_list,
			function()
				if Cayo_Heist_Gold(1) then
					return 1
				elseif Cayo_Heist_Cash(1) then
					return 2
				else
					return 0
				end
			end,
			function(v)
				if v==1 then
					Cayo_Heist_Gold(1,true)
					Cayo_Heist_Cash(1,false)
				elseif v==2 then
					Cayo_Heist_Gold(1,false)
					Cayo_Heist_Cash(1,true)
				else
					Cayo_Heist_Gold(1,false)
					Cayo_Heist_Cash(1,false)
				end
			end)

		Cayo_set_loot_Room1:add_toggle(Cayo_Setloot_Painting1, function() return Cayo_Heist_Painting(0) end, function() Cayo_Heist_Painting(0, not Cayo_Heist_Painting(0) ) end)

	-- Room 2 (Center)
		local Cayo_set_loot_Room2=Cayo_set_loot:add_submenu(Cayo_Setloot_Room2)
		Cayo_set_loot_Room2:add_array_item(Cayo_Setloot_Table1, Cayo_set_loot_compound_table_list,
			function()
				if Cayo_Heist_Gold(2) then
					return 1
				elseif Cayo_Heist_Cash(2) then
					return 2
				else
					return 0
				end
			end,
			function(v)
				if v==1 then
					Cayo_Heist_Gold(2,true)
					Cayo_Heist_Cash(2,false)
				elseif v==2 then
					Cayo_Heist_Gold(2,false)
					Cayo_Heist_Cash(2,true)
				else
					Cayo_Heist_Gold(2,false)
					Cayo_Heist_Cash(2,false) end
			end)

		Cayo_set_loot_Room2:add_array_item(Cayo_Setloot_Table2, Cayo_set_loot_compound_table_list,
			function()
				if Cayo_Heist_Gold(3) then
					return 1
				elseif Cayo_Heist_Cash(3) then
					return 2
				else
					return 0
				end
			end,
			function(v)
				if v==1 then
					Cayo_Heist_Gold(3,true)
					Cayo_Heist_Cash(3,false)
				elseif v==2 then
					Cayo_Heist_Gold(3,false)
					Cayo_Heist_Cash(3,true)
				else
					Cayo_Heist_Gold(3,false)
					Cayo_Heist_Cash(3,false)
				end
			end)

		Cayo_set_loot_Room2:add_toggle(Cayo_Setloot_Painting1, function() return Cayo_Heist_Painting(1) end, function() Cayo_Heist_Painting(1, not Cayo_Heist_Painting(1) ) end)

	-- Room 3 (South)
		local Cayo_set_loot_Room3=Cayo_set_loot:add_submenu(Cayo_Setloot_Room3)
		Cayo_set_loot_Room3:add_array_item(Cayo_Setloot_Table1, Cayo_set_loot_compound_table_list,
			function()
				if Cayo_Heist_Gold(4) then
					return 1
				elseif Cayo_Heist_Cash(4) then
					return 2
				else
					return 0
				end
			end,
			function(v)
				if v==1 then
					Cayo_Heist_Gold(4,true)
					Cayo_Heist_Cash(4,false)
				elseif v==2 then
					Cayo_Heist_Gold(4,false)
					Cayo_Heist_Cash(4,true)
				else
					Cayo_Heist_Gold(4,false)
					Cayo_Heist_Cash(4,false)
				end
			end)

		Cayo_set_loot_Room3:add_array_item(Cayo_Setloot_Table2, Cayo_set_loot_compound_table_list,
			function()
				if Cayo_Heist_Gold(5) then
					return 1
				elseif Cayo_Heist_Cash(5) then
					return 2
				else
					return 0
				end
			end,
			function(v)
				if v==1 then
					Cayo_Heist_Gold(5,true)
					Cayo_Heist_Cash(5,false)
				elseif v==2 then
					Cayo_Heist_Gold(5,false)
					Cayo_Heist_Cash(5,true)
				else
					Cayo_Heist_Gold(5,false)
					Cayo_Heist_Cash(5,false)
				end
			end)

		Cayo_set_loot_Room3:add_toggle(Cayo_Setloot_Painting1,function() return Cayo_Heist_Painting(2) end, function() Cayo_Heist_Painting(2,not Cayo_Heist_Painting(2) ) end)

	-- Basement
		local Cayo_set_loot_basement=Cayo_set_loot:add_submenu(Cayo_Setloot_Basement)
		Cayo_set_loot_basement:add_array_item(Cayo_Setloot_Table1, Cayo_set_loot_compound_table_list,
			function()
				if Cayo_Heist_Gold(6) then
					return 1
				elseif Cayo_Heist_Cash(6) then
					return 2
				else
					return 0
				end
			end,
			function(v)
				if v==1 then
					Cayo_Heist_Gold(6,true)
					Cayo_Heist_Cash(6,false)
				elseif v==2 then
					Cayo_Heist_Gold(6,false)
					Cayo_Heist_Cash(6,true)
				else
					Cayo_Heist_Gold(6,false)
					Cayo_Heist_Cash(6,false)
				end
			end)
		Cayo_set_loot_basement:add_array_item(Cayo_Setloot_Table2, Cayo_set_loot_compound_table_list,
			function()
				if Cayo_Heist_Gold(7) then
					return 1
				elseif Cayo_Heist_Cash(7) then
					return 2
				else
					return 0
				end
			end,
			function(v)
				if v==1 then
					Cayo_Heist_Gold(7,true)
					Cayo_Heist_Cash(7,false)
				elseif v==2 then
					Cayo_Heist_Gold(7,false)
					Cayo_Heist_Cash(7,true)
				else
					Cayo_Heist_Gold(7,false)
					Cayo_Heist_Cash(7,false)
				end
			end)
		Cayo_set_loot_basement:add_toggle(Cayo_Setloot_Painting1,function() return Cayo_Heist_Painting(5) end, function() Cayo_Heist_Painting(5, not Cayo_Heist_Painting(5) ) end)
		Cayo_set_loot_basement:add_toggle(Cayo_Setloot_Painting2,function() return Cayo_Heist_Painting(6) end, function() Cayo_Heist_Painting(6, not Cayo_Heist_Painting(6) ) end)

	-- Office
		local Cayo_set_loot_office=Cayo_set_loot:add_submenu(Cayo_Setloot_Office)
		Cayo_set_loot_office:add_toggle(Cayo_Setloot_Painting1,function() return Cayo_Heist_Painting(3) end,function() Cayo_Heist_Painting(3, not Cayo_Heist_Painting(3) ) end)
		Cayo_set_loot_office:add_toggle(Cayo_Setloot_Painting2,function() return Cayo_Heist_Painting(4) end,function() Cayo_Heist_Painting(4, not Cayo_Heist_Painting(4) ) end)

-- Outside Compoud
	Cayo_set_loot:add_action(Cayo_Setloot_Compound_out,function() end)
	Cayo_set_loot_maindock = Cayo_set_loot:add_submenu(Cayo_Maindock)
		Text(Cayo_Setloot_Shed,Cayo_set_loot_maindock)
			for i=23,22,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
		Text(Cayo_Setloot_Shed2,Cayo_set_loot_maindock)
			for i=18,17,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
		Text(Cayo_Setloot_Lockup,Cayo_set_loot_maindock)
			for i=21,19,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
	Cayo_set_loot_innermaindock = Cayo_set_loot:add_submenu(Cayo_InnerMaindock)
		Text(Cayo_Setloot_Shed,Cayo_set_loot_innermaindock)
			for i=16,15,-1 do
				Cayo_set_loot_innermaindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
	Cayo_set_loot_farmland = Cayo_set_loot:add_submenu(Cayo_Farmland)
		Text(Cayo_Setloot_Shed,Cayo_set_loot_farmland)
			for i=14,13,-1 do
				Cayo_set_loot_farmland:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
	Cayo_set_loot_northdock = Cayo_set_loot:add_submenu(Cayo_Northdock)
		Text(Cayo_Setloot_Shed,Cayo_set_loot_northdock)
			for i=12,11,-1 do
				Cayo_set_loot_northdock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
		Text(Cayo_Setloot_Lockup,Cayo_set_loot_northdock)
			for i=10,8,-1 do
				Cayo_set_loot_northdock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
		Text(Cayo_Setloot_Warehouse,Cayo_set_loot_northdock)
			for i=7,6,-1 do
				Cayo_set_loot_northdock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
	Cayo_set_loot_airstrip = Cayo_set_loot:add_submenu(Cayo_Airstrip)
		Text(Cayo_Setloot_Shed,Cayo_set_loot_airstrip)
			for i=5,4,-1 do
				Cayo_set_loot_airstrip:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
		Text(Cayo_Setloot_HangarBottom,Cayo_set_loot_airstrip)
			for i=3,2,-1 do
				Cayo_set_loot_airstrip:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
		Text(Cayo_Setloot_HangarTop,Cayo_set_loot_airstrip)
			for i=1,0,-1 do
				Cayo_set_loot_airstrip:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_list,
					function()
						if Cayo_Heist_Coke(i) then
							return 1
						elseif Cayo_Heist_Cash_2(i) then
							return 2
						elseif Cayo_Heist_Weed(i) then
							return 3
						else
							return 0
						end
					end,
					function(v)
						if v==1 then
						    Cayo_Heist_Coke(i,true)
						elseif v==2 then
						    Cayo_Heist_Cash_2(i,true)
						elseif v==3 then
						    Cayo_Heist_Weed(i,true)
						else
						    Cayo_Heist_Coke(i,false)
						    Cayo_Heist_Cash_2(i,false)
						    Cayo_Heist_Weed(i,false)
						end
					end)
			end
--

Cayo_setup:add_action(Refresh_Kosatka_Board, function()
	if script("heist_island_planning"):is_active() then
		script("heist_island_planning"):set_int(Cayo_Refresh_table, 2)
	end
end)


-- Cayo Player Cuts

local function Cayo_Cuts()
	Cayo_cut_menu:clear()
	P = {}
	P[1] = Notinheist

	if globals.get_int(Cayo_Cut_offset+1)<1000 and globals.get_int(Cayo_Cut_offset+1)>-1 then
		for i = 1,4 do
			if globals.get_int(Cayo_Cut_offset+i)>=15 then if player.get_player_ped(i-1) == localplayer then P[i] = You_text else P[i] = player.get_player_name(i-1) end end
		end

		Text(Cut_Player,Cayo_cut_menu)

		for i = 1,4 do
			if P[i] then
				Cayo_Cuts_List[i] = globals.get_int(Cayo_Cut_offset+i)
				Cayo_cut_menu:add_array_item(Cut_Player_List[i]..P[i],Cut_percent,function() return math.floor(Cayo_Cuts_List[i]/5-1) end, function(p) Cayo_Cuts_List[i] = (p+1)*5 end)
			end
		end
		Cayo_cut_menu:add_array_item(Cut_Slider, Cut_percent,
			function()
				if P[1] then
					Player_Cut_Max = globals.get_int(Cayo_Cut_offset+1)
					for i = 2,4 do
						if P[i] and globals.get_int(Cayo_Cut_offset+i) >= 15 then
				    	    Player_Cut_Max = globals.get_int(Cayo_Cut_offset+i)
						end
					end
                else
                    return 2
				end
				return Player_Cut_Max
			end,
			function(p)
				for i = 1,4 do
					if p[i] then
						Cayo_Cuts_List[i] = (p+1)*5
						Player_Max_autotake = get_max_cut(Cayo_Cut_offset)
					end
				end
			end)

		Cayo_cut_menu:add_array_item(Set_text, Cut_Setter, function() return 1 end,
			function(CyC)
				if CyC==2 then
					for i = 1,4 do
						Cayo_Cuts_List[i] = 100
					end
				end
				for i = 1,4 do
					if P[i] and Cayo_Cuts_List[i] >= 15 then
						globals.set_int(Cayo_Cut_offset+i, Cayo_Cuts_List[i])
						Player_Max_autotake = get_max_cut(Cayo_Cut_offset)
					end
				end
			end
		)

		Text(Cut_Crew ,Cayo_cut_menu)
		Text(Cut_Crew2,Cayo_cut_menu)
		Text(Cut_Crew3,Cayo_cut_menu)

		Cayo_cut_menu:add_action(Cayo_Cut_Pavel,function() globals.set_int(Cayo_Pavel_Cut, 0) end)
		Cayo_cut_menu:add_action(Cayo_Fencing_Fee,function() globals.set_int(Cayo_Fenving_fee, 0) end)
	end
end

Cayo_cut_menu=Cayo_menu:add_submenu(Cayo_Cut_Submenu, Cayo_Cuts)


-- Cayo Extras

local Cayo_extras=Cayo_menu:add_submenu(Extars_Submenu)
Cayo_extras:add_action(Cayo_Extras_Sewer,
	function()
		if HS0():is_active() and HS0():get_int(Cayo_sewer)>=3 and HS0():get_int(Cayo_sewer)<6 then
			HS0():set_int(Cayo_sewer, 6)
		end
	end)

Cayo_extras:add_action(Cayo_Extras_Fingerprint,
	function()
		if HS0():is_active() and HS0():get_int(Cayo_fingerprint)>=2 and HS0():get_int(Cayo_fingerprint)<10 then
			HS0():set_int(Cayo_fingerprint, 5)
		end
	end)

Cayo_extras:add_action(Cayo_Extras_Cutglass,
	function()
		if HS0():is_active() and HS0():get_float(Cayo_Cut_glass)>=0.00 and HS0():get_float(Cayo_Cut_glass)<100 then
			HS0():set_float(Cayo_Cut_glass, 100)
		end
	end)

Cayo_extras:add_int_range(Cayo_Extras_Bag,500.0,1800,10000,
	function()
		if localplayer then
			return globals.get_int(Cayo_Bag_offset)
		end
	end,
	function(value)
		globals.set_int(Cayo_Bag_offset, value)
	end)
--






------------------------
------- Dommsday -------

-- Dommsday Setup
local Doomsday_Setup_Menu=nil
local function Doomsday_Setup_Function()
	Doomsday_Setup_Menu:clear()
	Heist_Player_List()
    local Current_Dommsday_act = 0
    function Get_Doomsday_Act()
        for i = 1,3 do
            if stats.get_int(mpx().."gangops_heist_status")%4 == i or stats.get_int(mpx().."gangops_heist_status")%11 == i then
                return i
            end
        end
        return 0
    end
    Text(round(stats.get_int(mpx().."gangops_heist_status")        ),Doomsday_Setup_Menu)
    Text(round(stats.get_int(mpx().."gangops_heist_status")%4),Doomsday_Setup_Menu)
    Text(round(stats.get_int(mpx().."gangops_heist_status")%8),Doomsday_Setup_Menu)
    Get_Doomsday_Act()
	Doomsday_Setup_Menu:add_array_item(Doomsday_Set_Act,Doomsday_Heist_List,
        function()
            return Get_Doomsday_Act()
        end,
        function(Act_Num)
            stats.set_int(mpx().."gangops_heist_status",Act_Num)
            Current_Dommsday_act = Act_Num
        end)
    Doomsday_Setup_Menu:add_action(Doomsday_Instant_Setup,
	    function()
            Current_Dommsday_act = Get_Doomsday_Act()
	    	if Current_Dommsday_act == 1 then
	    		Doomsday_Progression=7
	    		Doomsday_Progression2=7
	    	elseif Current_Dommsday_act == 2 then
	    		Doomsday_Progression=240
	    		Doomsday_Progression2=248
	    	else
	    		Doomsday_Progression=15872
	    		Doomsday_Progression2=16128
	    	end 
	    	stats.set_int(mpx().."GANGOPS_FLOW_MISSION_PROG", Doomsday_Progression)
	    	stats.set_int(mpx().."GANGOPS_FM_MISSION_PROG", Doomsday_Progression2)
	    end)
	Text(Manual_text,Doomsday_Setup_Menu)
    local N_i_for_act = ""
    for i = 1,Get_Doomsday_Act() do
        N_i_for_act = N_i_for_act.."I"
    end

    Text("               ["..Doomsday_Act_Name.."-"..N_i_for_act..": "..Doomsday_Heist_List[Get_Doomsday_Act()].."]",Doomsday_Setup_Menu)
    Current_Dommsday_act = Get_Doomsday_Act()
    if Current_Dommsday_act == 1 then
	    for i=0,2 do
            Doomsday_Setup_Menu:add_array_item(Doomsday_Prep..Doomsday_Heist_Prep_List[i] , Doomsday_Missions_Status,
                function()
                    if Doomsday_Preperation(i+14) then
                        return 2
                    elseif Doomsday_Preperation_Skip(i) then
                        return 3
                    elseif Doomsday_Preperation(i) then
                        return 1
                    end
                    return 0
                end,
                function(o)
	    	        if o==1 then
                        Doomsday_Preperation(i,true)
                    elseif o==2 then
                        Doomsday_Preperation(i+14,true)
                    elseif o==3 then
                        Doomsday_Preperation_Skip(i,true)
                    else
                        Doomsday_Preperation(i+14,false)
                        Doomsday_Preperation_Skip(i,false)
                    end
                end)
	    	Doomsday_Setup_Menu:add_toggle(Doomsday_Setup..Doomsday_Heist_Missions_List[i], function() return Doomsday_Missions(i) end, function() Doomsday_Missions(i,not Doomsday_Missions(i)) end)
        end
    elseif Current_Dommsday_act == 2 then
	    for i=4,7 do
            Doomsday_Setup_Menu:add_array_item(Doomsday_Prep..Doomsday_Heist_Prep_List[i-1], Doomsday_Missions_Status,
                function()
                    if Doomsday_Preperation(i-1+14) then
                        return 2
                    elseif Doomsday_Preperation_Skip(i-1) then
                        return 3
                    elseif Doomsday_Preperation(i-1) then
                        return 1
                    end
                    return 0
                end,
                function(o)
	    	        if o==1 then
                        Doomsday_Preperation(i-1,true)
                    elseif o==2 then
                        Doomsday_Preperation(i-1+14,true)
                    elseif o==3 then
                        Doomsday_Preperation_Skip(i-1,true)
                    else
                        Doomsday_Preperation(i-1+14,false)
                        Doomsday_Preperation_Skip(i-1,false)
                    end 
                end)
	    	if i==7 then
                Doomsday_Setup_Menu:add_array_item(Doomsday_Prep..Doomsday_Heist_Prep_List[i] , Doomsday_Missions_Status,
                    function()
	    		        if Doomsday_Preperation(i+14)then
                            return 2
                        elseif Doomsday_Preperation_Skip(i) then
                            return 3
                        elseif Doomsday_Preperation(i) then
                            return 1
                        end
                        return 0
                    end,
                    function(o)
	    		    	if o==1 then
                            Doomsday_Preperation(i,true)
                        elseif o==2 then
                            Doomsday_Preperation(i+14,true)
                        elseif o==3 then
                            Doomsday_Preperation_Skip(i,true)
                        else
                            Doomsday_Preperation(i+14,false)
                            Doomsday_Preperation_Skip(i,false)
                        end
                    end)
            end
	    	Doomsday_Setup_Menu:add_toggle(Doomsday_Setup..Doomsday_Heist_Missions_List[i], function() return Doomsday_Missions(i) end, function() Doomsday_Missions(i,not Doomsday_Missions(i)) end)
        end
    elseif Current_Dommsday_act == 3 then
        for i = 8,13 do
	        Doomsday_Setup_Menu:add_array_item(Doomsday_Prep..Doomsday_Heist_Prep_List[i] , Doomsday_Missions_Status,
	    	    function()
	    	    	if Doomsday_Preperation(i+14)then
	    	    		return 2
	    	    	elseif Doomsday_Preperation_Skip(i) then
	    	    		return 3
	    	    	elseif Doomsday_Preperation(i) then
	    	    		return 1
	    	    	end
	    	    	return 0
	    	    end,
	    	    function(o)
	    	    	if o==1 then
	    	    		Doomsday_Preperation(i,true)
	    	    	elseif o==2 then
	    	    		Doomsday_Preperation(i+14,true)
	    	    	elseif o==3 then
	    	    		Doomsday_Preperation_Skip(i,true)
	    	    	else
	    	    		Doomsday_Preperation(i+14,false)
	    	    		Doomsday_Preperation_Skip(i,false)
	    	    	end
	    	    end)
            if i ~= 8 then
                Doomsday_Setup_Menu:add_toggle(Doomsday_Setup..Doomsday_Heist_Missions_List[i] , function() return Doomsday_Missions(i) end, function() Doomsday_Missions(i,not Doomsday_Missions(i)) end)
            end
        end
    end
end
Doomsday_Setup_Menu=Doomsday_Menu:add_submenu(Doomsday_Setup_Submenu,Doomsday_Setup_Function)

-- Doomsday Cuts
local function Doomsday_Cuts()
    Doomsday_cuts_menu:clear()
	P = {}
    Doomsday_Cuts_List = {}
	P[1],P[2] = Notinheist_text, nil
    if globals.get_int(Doomsday_Cut_offset+1) <= 1000 and globals.get_int(Doomsday_Cut_offset+1) >= 0 then
		for i = 1,4 do
			if globals.get_int(Doomsday_Cut_offset+i)>=15 then if player.get_player_ped(i-1)==localplayer then P[i]=You_text else P[i]=player.get_player_name(i-1) end end
		end

		Text(Cut_Player,Doomsday_cuts_menu)
		for i = 1,4 do
        	if P[i] then
                Doomsday_Cuts_List[i] = globals.get_int(Doomsday_Cut_offset+i)
        	    Doomsday_cuts_menu:add_array_item(Cut_Player_List[i]..P[i], Cut_percent, function() return math.floor(Doomsday_Cuts_List[i]/5-1) end, function(p) Doomsday_Cuts_List[i] = (p+1)*5 end)
        	end
		end
		Doomsday_cuts_menu:add_array_item(Cut_Slider, Cut_percent,
			function()
                if P[1] then
                    Player_Cut_Max = globals.get_int(Doomsday_Cut_offset+1)
				    for i = 2,4 do
                        if P[i] then
				    	    if globals.get_int(Doomsday_Cut_offset+i) >= 15 then
				    	    	Player_Cut_Max = math.max(Player_Cut_Max, globals.get_int(Doomsday_Cut_offset+i))
				    	    end
                        end
				    end
                    return Player_Cut_Max
                else
                    return 0
                end
			end,
			function(p)
				for i = 1,4 do
					if p[i] then
						Doomsday_Cuts_List[i] = (p+1)*5
					end
				end
			end)

        -- Cut setter
        Doomsday_cuts_menu:add_array_item(Set_text, Cut_Setter, function() return 1 end, function(Doomsday_Cut_Sellector)
            if Doomsday_Cut_Sellector == 2 then
				for i =1,4 do
					Doomsday_Cuts_List[i] = 100
				end
            end

			for i = 1,4 do
            	if Doomsday_Cuts_List[i] >= 15 then
            	    globals.set_int(Doomsday_Cut_offset+i, Doomsday_Cuts_List[i])
            	end
            end
        end)
    end
end
Doomsday_cuts_menu=Doomsday_Menu:add_submenu(Doomsday_Cuts_Submenu, Doomsday_Cuts)




------------------------
----- Appartements -----

-- Appartements Setup
function Appartements_Setup_Function()
    Appartements_Setup:clear()
    local Current_Heist = stats.get_int("MPPLY_AVAILABLE_HEIST_FINALE")
    if Current_Heist == 1 then
        for i = 1,2 do
            Appartements_Setup:add_toggle(Appartements_Fleeca_Preps[i],function() return Appartements_Missions(i) end,function() Appartements_Missions(i,not Appartements_Missions(i)) end)
        end
    elseif Current_Heist == 2 then
        for i = 1,4 do
            Appartements_Setup:add_toggle(Appartements_Prison_Preps[i],function() return Appartements_Missions(i) end,function() Appartements_Missions(i,not Appartements_Missions(i)) end)
        end
    elseif Current_Heist == 3 then
        for i = 1,5 do
            Appartements_Setup:add_toggle(Appartements_Humane_Preps[i],function() return Appartements_Missions(i) end,function() Appartements_Missions(i,not Appartements_Missions(i)) end)
        end
    elseif Current_Heist == 4 then
        for i = 1,5 do
            Appartements_Setup:add_toggle(Appartements_SeriesA_Preps[i],function() return Appartements_Missions(i) end,function() Appartements_Missions(i,not Appartements_Missions(i)) end)
        end
    elseif Current_Heist == 5 then
        for i = 1,5 do
            Appartements_Setup:add_toggle(Appartements_Pacific_Preps[i],function() return Appartements_Missions(i) end,function() Appartements_Missions(i,not Appartements_Missions(i)) end)
        end
    end
end
local Appartements_Setup=Appartements_menu:add_submenu(Appartements_Setup_Submenu,Appartements_Setup_Function)



-- Appartements Cuts
local function Appartements_Cuts()
    Appartements_cuts_menu:clear()
	P = {}
    Appartements_Cuts_List = {}
	P[1],P[2] = Notinheist_text, nil
    if globals.get_int(Appartements_Cut_offset+1) <= 1000 and globals.get_int(Appartements_Cut_offset+1) >= 0 then
		for i = 1,4 do
			if globals.get_int(Appartements_Cut_offset+i)>=15 then if player.get_player_ped(i-1)==localplayer then P[i]=You_text else P[i]=player.get_player_name(i-1) end end
		end

		Text(Cut_Player,Appartements_cuts_menu)
        -- Cut selector
		for i = 1,4 do
        	if P[i] then
                Appartements_Cuts_List[i] = globals.get_int(Appartements_Cut_offset+i)
        	    Appartements_cuts_menu:add_array_item(Cut_Player_List[i]..P[i], Cut_percent, function() return math.floor(Appartements_Cuts_List[i]/5-1) end, function(p) Appartements_Cuts_List[i] = (p+1)*5 end)
        	end
		end
		Appartements_cuts_menu:add_array_item(Cut_Slider, Cut_percent,
			function()
                if P[1] then
                    Player_Cut_Max = globals.get_int(Appartements_Cut_offset+1)
				    for i = 2,4 do
                        if P[i] then
                            if globals.get_int(Appartements_Cut_offset+i) >= 15 then
                                Player_Cut_Max = math.max(Player_Cut_Max,globals.get_int(Appartements_Cut_offset+i))
                            end
                        end
				    end
                    return Player_Cut_Max
                else
                    return 0
                end
			end,
			function(p)
				for i = 1,4 do
					if p[i] then
						Appartements_Cuts_List[i] = (p+1)*5
					end
				end
			end)

        -- Cut setter
        Appartements_cuts_menu:add_array_item(Set_text, Cut_Setter, function() return 1 end, function(Appartements_Cut_Sellector)
            if Appartements_Cut_Sellector == 2 then
				for i =1,4 do
					Appartements_Cuts_List[i] = 100
				end
            end

			for i = 1,4 do
            	if Appartements_Cuts_List[i] >= 15 then
            	    globals.set_int(Appartements_Cut_offset+i, Appartements_Cuts_List[i])
            	end
            end

			Player_Cut_Max = math.max(Appartements_Cuts_List[1], Appartements_Cuts_List[2], Appartements_Cuts_List[3], Appartements_Cuts_List[3])
        end)
    end
end
Appartements_cuts_menu=Appartements_menu:add_submenu(Appartements_Cut_Submenu, Appartements_Cuts)

------------------------
-------- Others --------

local Autoshop_Heist = {"The Union Depository", "The Superdollar Deal", "The Bank Contract", "The ECU Job", "The Prison Contract", "The Agency Deal", "The Lost Contract", "The Data Contract"}

Other_Heists_Menu:add_array_item(Current_Heist_Selected,Autoshop_Heist,
    function()
        return stats.get_int(mpx().."TUNER_CURRENT")+1
    end,
    function(value)
        current_autoshop_heist = value-1
        stats.set_int(mpx().."TUNER_CURRENT", current_autoshop_heist)
    end
)

Other_Heists_Menu:add_action(Skip_Preperation,
    function()
        value = stats.get_int(mpx().."TUNER_CURRENT")
        if Is_IN(value,{0,2,3,4,5,6,7}) then
            stats.set_int(mpx().."TUNER_GEN_BS", 12543)
        elseif value == 1 then
            stats.set_int(mpx().."TUNER_GEN_BS", 4351)
        end
    end
)







------------------------
------ Shapeshift ------


--------- Character List ---------

local Ped_Female = {
    "S_F_Y_Cop_01",
    "A_F_M_Beach_01",
    "A_F_M_BevHills_01",
    "A_F_M_BevHills_02",
    "A_F_M_BodyBuild_01",
    "A_F_M_Business_02",
    "A_F_M_Downtown_01",
    "A_F_M_EastSA_01",
    "A_F_M_EastSA_02",
    "A_F_M_FatBla_01",
    "A_F_M_FatCult_01",
    "A_F_M_FatWhite_01",
    "A_F_M_GenBiker_01",
    "A_F_M_GenStreet_01",
    "A_F_M_KTown_01",
    "A_F_M_KTown_02",
    "A_F_M_ProlHost_01",
    "A_F_M_Salton_01",
    "A_F_M_SkidRow_01",
    "A_F_M_SouCent_01",
    "A_F_M_SouCent_02",
    "A_F_M_SouCentMC_01",
    "A_F_M_Tourist_01",
    "A_F_M_Tramp_01",
    "A_F_M_TrampBeac_01",
    "A_F_O_GenStreet_01",
    "A_F_O_Indian_01",
    "A_F_O_KTown_01",
    "A_F_O_Salton_01",
    "A_F_O_SouCent_01",
    "A_F_O_SouCent_02",
    "A_F_Y_Beach_01",
    "A_F_Y_Beach_02",
    "A_F_Y_BevHills_01",
    "A_F_Y_BevHills_02",
    "A_F_Y_BevHills_03",
    "A_F_Y_BevHills_04",
    "A_F_Y_Bevhills_05",
    "A_F_Y_Business_01",
    "A_F_Y_Business_02",
    "A_F_Y_Business_03",
    "A_F_Y_Business_04",
    "A_F_Y_CarClub_01",
    "A_F_Y_ClubCust_01",
    "A_F_Y_ClubCust_02",
    "A_F_Y_ClubCust_03",
    "A_F_Y_ClubCust_04",
    "A_F_Y_EastSA_01",
    "A_F_Y_EastSA_02",
    "A_F_Y_EastSA_03",
    "A_F_Y_Epsilon_01",
    "A_F_Y_FemaleAgent",
    "A_F_Y_Fitness_01",
    "A_F_Y_Fitness_02",
    "A_F_Y_GenCasPat_01",
    "A_F_Y_GenHot_01",
    "A_F_Y_Golfer_01",
    "A_F_Y_Hiker_01",
    "A_F_Y_Hippie_01",
    "A_F_Y_Hipster_01",
    "A_F_Y_Hipster_02",
    "A_F_Y_Hipster_03",
    "A_F_Y_Hipster_04",
    "A_F_Y_Indian_01",
    "A_F_Y_Juggalo_01",
    "A_F_Y_Runner_01",
    "A_F_Y_RurMeth_01",
    "A_F_Y_SCDressy_01",
    "A_F_Y_Skater_01",
    "A_F_Y_SmartCasPat_01",
    "A_F_Y_SouCent_01",
    "A_F_Y_SouCent_02",
    "A_F_Y_SouCent_03",
    "A_F_Y_StudioParty_01",
    "A_F_Y_StudioParty_02",
    "A_F_Y_Tennis_01",
    "A_F_Y_Topless_01",
    "A_F_Y_Tourist_01",
    "A_F_Y_Tourist_02",
    "A_F_Y_Vinewood_01",
    "A_F_Y_Vinewood_02",
    "A_F_Y_Vinewood_03",
    "A_F_Y_Vinewood_04",
    "A_F_Y_Yoga_01",
    "CS_AmandaTownley",
    "cs_ashley",
    "cs_debra",
    "cs_denise",
    "CS_Guadalope",
    "cs_gurk",
    "CS_Janet",
    "CS_JewelAss",
    "CS_Karen_Daniels",
    "CS_Magenta",
    "CS_Marnie",
    "CS_MaryAnn",
    "CS_Michelle",
    "CS_Molly",
    "CS_MovPremF_01",
    "CS_MRS_Thornhill",
    "CS_MrsPhillips",
    "CS_Natalia",
    "CS_Patricia",
    "CS_Patricia_02",
    "CS_Tanisha",
    "CS_TracyDiSanto",
    "CSB_Abigail",
    "CSB_Agatha",
    "CSB_Alan",
    "CSB_Anita",
    "CSB_Bride",
    "CSB_Bryony",
    "CSB_CallGirl_01",
    "CSB_CallGirl_02",
    "CSB_Denise_friend",
    "CSB_DJBlaMadon",
    "CSB_GeorginaCheng",
    "CSB_Golfer_B",
    "CSB_Imani",
    "CSB_Imran",
    "CSB_JIO",
    "CSB_JIO_02",
    "CSB_Luchadora",
    "CSB_Maude",
    "CSB_Mimi",
    "CSB_Mrs_R",
    "CSB_Musician_00",
    "CSB_Paige",
    "CSB_Screen_Writer",
    "CSB_Sessanta",
    "CSB_SoundEng_00",
    "CSB_SSS",
    "CSB_Stripper_01",
    "CSB_Stripper_02",
    "CSB_Tonya",
    "CSB_Wendy",
    "G_F_ImportExport_01",
    "G_F_M_Fooliganz_01",
    "G_F_Y_ballas_01",
    "G_F_Y_Families_01",
    "G_F_Y_Lost_01",
    "G_F_Y_Vagos_01",
    "IG_Abigail",
    "IG_Agatha",
    "IG_AmandaTownley",
    "IG_Ashley",
    "IG_Avery",
    "IG_Bride",
    "IG_CallGirl_01",
    "IG_CallGirl_02",
    "IG_Denise",
    "IG_DJBlaMadon",
    "IG_DJTalAurelia",
    "IG_Entourage_A",
    "IG_Entourage_B",
    "IG_Fooliganz_01",
    "IG_Fooliganz_02",
    "IG_GeorginaCheng",
    "IG_Golfer_B",
    "IG_Imani",
    "IG_ISLDJ_04_D_01",
    "IG_ISLDJ_04_D_02",
    "IG_ISLDJ_04_E_01",
    "IG_Jackie",
    "IG_Janet",
    "IG_JewelAss",
    "IG_Karen_Daniels",
    "IG_Kaylee",
    "IG_KerryMcIntosh",
    "IG_KerryMcIntosh_02",
    "IG_Lacey_Jones_02",
    "IG_Luchadora",
    "IG_Magenta",
    "IG_Marnie",
    "IG_MaryAnn",
    "IG_Maude",
    "IG_Michelle",
    "IG_Mimi",
    "IG_Molly",
    "IG_MRS_Thornhill",
    "IG_MrsPhillips",
    "IG_Musician_00",
    "IG_Natalia",
    "IG_Paige",
    "IG_Patricia",
    "IG_Patricia_02",
    "IG_Screen_Writer",
    "IG_Sessanta",
    "IG_SoundEng_00",
    "IG_SSS",
    "IG_Tanisha",
    "IG_Tonya",
    "IG_TracyDiSanto",
    "IG_WarehouseBoss",
    "IG_Wendy",
    "MP_F_BennyMech_01",
    "MP_F_BoatStaff_01",
    "MP_F_CarDesign_01",
    "MP_F_CHBar_01",
    "MP_F_Cocaine_01",
    "MP_F_Counterfeit_01",
    "MP_F_DeadHooker",
    "MP_F_ExecPA_01",
    "MP_F_ExecPA_02",
    "MP_F_Forgery_01",
    "MP_F_HeliStaff_01",
    "MP_F_Meth_01",
    "MP_F_Misty_01",
    "MP_F_StripperLite",
    "MP_F_Weed_01",
    "S_F_M_Autoshop_01",
    "S_F_M_Fembarber",
    "S_F_M_Maid_01",
    "S_F_M_RetailStaff_01",
    "S_F_M_Shop_HIGH",
    "S_F_M_StudioAssist_01",
    "S_F_M_SweatShop_01",
    "S_F_M_Warehouse_01",
    "S_F_Y_AirHostess_01",
    "S_F_Y_Bartender_01",
    "S_F_Y_Baywatch_01",
    "S_F_Y_BeachBarStaff_01",
    "S_F_Y_Casino_01",
    "S_F_Y_ClubBar_01",
    "S_F_Y_ClubBar_02",
    "S_F_Y_Factory_01",
    "S_F_Y_Hooker_01",
    "S_F_Y_Hooker_02",
    "S_F_Y_Hooker_03",
    "S_F_Y_Migrant_01",
    "S_F_Y_MovPrem_01",
    "S_F_Y_Ranger_01",
    "S_F_Y_Scrubs_01",
    "S_F_Y_Sheriff_01",
    "S_F_Y_Shop_LOW",
    "S_F_Y_Shop_MID",
    "S_F_Y_Stripper_01",
    "S_F_Y_Stripper_02",
    "S_F_Y_StripperLite",
    "S_F_Y_SweatShop_01",
    "U_F_M_CasinoCash_01",
    "U_F_M_CasinoShop_01",
    "U_F_M_Corpse_01",
    "U_F_M_Debbie_01",
    "U_F_M_Drowned_01",
    "U_F_M_Miranda",
    "U_F_M_Miranda_02",
    "U_F_M_ProMourn_01",
    "U_F_O_Carol",
    "U_F_O_Eileen",
    "U_F_O_MovieStar",
    "U_F_O_ProlHost_01",
    "U_F_Y_Beth",
    "U_F_Y_BikerChic",
    "U_F_Y_COMJane",
    "U_F_Y_corpse_01",
    "U_F_Y_corpse_02",
    "U_F_Y_DanceBurl_01",
    "U_F_Y_DanceLthr_01",
    "U_F_Y_DanceRave_01",
    "U_F_Y_HotPosh_01",
    "U_F_Y_JewelAss_01",
    "U_F_Y_Lauren",
    "U_F_Y_Mistress",
    "U_F_Y_PoppyMich",
    "U_F_Y_PoppyMich_02",
    "U_F_Y_Princess",
    "U_F_Y_SpyActress",
    "U_F_Y_Taylor"
}

local Ped_Male = {
    "CS_FBISuit_01",
    "CSB_Cop",
    "CSB_ProlSec",
    "IG_FBISuit_01",
    "IG_ProlSec_02",
    "IG_Vincent",
    "IG_Vincent_2",
    "IG_Vincent_3",
    "IG_Vincent_4",
    "S_M_M_Cop_01",
    "S_M_M_SnowCop_01",
    "S_M_Y_Cop_01",
    "S_M_Y_HwayCop_01",
    "S_M_Y_Swat_01",
    "A_M_M_ACult_01",
    "A_M_M_AfriAmer_01",
    "A_M_M_BankRobber_01",
    "A_M_M_Beach_01",
    "A_M_M_Beach_02",
    "A_M_M_BevHills_01",
    "A_M_M_BevHills_02",
    "A_M_M_Business_01",
    "A_M_M_EastSA_01",
    "A_M_M_EastSA_02",
    "A_M_M_Farmer_01",
    "A_M_M_FatLatin_01",
    "A_M_M_GenBiker_01",
    "A_M_M_GenFat_01",
    "A_M_M_GenFat_02",
    "A_M_M_Golfer_01",
    "A_M_M_HasJew_01",
    "A_M_M_Hillbilly_01",
    "A_M_M_Hillbilly_02",
    "A_M_M_Indian_01",
    "A_M_M_KTown_01",
    "A_M_M_Malibu_01",
    "A_M_M_MexCntry_01",
    "A_M_M_MexLabor_01",
    "A_M_M_MLCrisis_01",
    "A_M_M_OG_Boss_01",
    "A_M_M_Paparazzi_01",
    "A_M_M_Polynesian_01",
    "A_M_M_ProlHost_01",
    "A_M_M_RurMeth_01",
    "A_M_M_Salton_01",
    "A_M_M_Salton_02",
    "A_M_M_Salton_03",
    "A_M_M_Salton_04",
    "A_M_M_Skater_01",
    "A_M_M_Skidrow_01",
    "A_M_M_SoCenLat_01",
    "A_M_M_SouCent_01",
    "A_M_M_SouCent_02",
    "A_M_M_SouCent_03",
    "A_M_M_SouCent_04",
    "A_M_M_StLat_02",
    "A_M_M_StudioParty_01",
    "A_M_M_Tennis_01",
    "A_M_M_Tourist_01",
    "A_M_M_Tramp_01",
    "A_M_M_TrampBeac_01",
    "A_M_M_TranVest_01",
    "A_M_M_TranVest_02",
    "A_M_O_ACult_01",
    "A_M_O_ACult_02",
    "A_M_O_Beach_01",
    "A_M_O_Beach_02",
    "A_M_O_GenStreet_01",
    "A_M_O_KTown_01",
    "A_M_O_Salton_01",
    "A_M_O_SouCent_01",
    "A_M_O_SouCent_02",
    "A_M_O_SouCent_03",
    "A_M_O_Tramp_01",
    "A_M_Y_ACult_01",
    "A_M_Y_ACult_02",
    "A_M_Y_Beach_01",
    "A_M_Y_Beach_02",
    "A_M_Y_Beach_03",
    "A_M_Y_Beach_04",
    "A_M_Y_BeachVesp_01",
    "A_M_Y_BeachVesp_02",
    "A_M_Y_BevHills_01",
    "A_M_Y_BevHills_02",
    "A_M_Y_BreakDance_01",
    "A_M_Y_BusiCas_01",
    "A_M_Y_Business_01",
    "A_M_Y_Business_02",
    "A_M_Y_Business_03",
    "A_M_Y_CarClub_01",
    "A_M_Y_ClubCust_01",
    "A_M_Y_ClubCust_02",
    "A_M_Y_ClubCust_03",
    "A_M_Y_ClubCust_04",
    "A_M_Y_Cyclist_01",
    "A_M_Y_DHill_01",
    "A_M_Y_Downtown_01",
    "A_M_Y_EastSA_01",
    "A_M_Y_EastSA_02",
    "A_M_Y_Epsilon_01",
    "A_M_Y_Epsilon_02",
    "A_M_Y_Gay_01",
    "A_M_Y_Gay_02",
    "A_M_Y_GenCasPat_01",
    "A_M_Y_GenStreet_01",
    "A_M_Y_GenStreet_02",
    "A_M_Y_Golfer_01",
    "A_M_Y_HasJew_01",
    "A_M_Y_Hiker_01",
    "A_M_Y_Hippy_01",
    "A_M_Y_Hipster_01",
    "A_M_Y_Hipster_02",
    "A_M_Y_Hipster_03",
    "A_M_Y_Indian_01",
    "A_M_Y_Jetski_01",
    "A_M_Y_Juggalo_01",
    "A_M_Y_KTown_01",
    "A_M_Y_KTown_02",
    "A_M_Y_Latino_01",
    "A_M_Y_MethHead_01",
    "A_M_Y_MexThug_01",
    "A_M_Y_MotoX_01",
    "A_M_Y_MotoX_02",
    "A_M_Y_MusclBeac_01",
    "A_M_Y_MusclBeac_02",
    "A_M_Y_Polynesian_01",
    "A_M_Y_RoadCyc_01",
    "A_M_Y_Runner_01",
    "A_M_Y_Runner_02",
    "A_M_Y_Salton_01",
    "A_M_Y_Skater_01",
    "A_M_Y_Skater_02",
    "A_M_Y_SmartCasPat_01",
    "A_M_Y_SouCent_01",
    "A_M_Y_SouCent_02",
    "A_M_Y_SouCent_03",
    "A_M_Y_SouCent_04",
    "A_M_Y_StBla_01",
    "A_M_Y_StBla_02",
    "A_M_Y_StLat_01",
    "A_M_Y_StudioParty_01",
    "A_M_Y_StWhi_01",
    "A_M_Y_StWhi_02",
    "A_M_Y_Sunbathe_01",
    "A_M_Y_Surfer_01",
    "A_M_Y_TattooCust_01",
    "A_M_Y_VinDouche_01",
    "A_M_Y_Vinewood_01",
    "A_M_Y_Vinewood_02",
    "A_M_Y_Vinewood_03",
    "A_M_Y_Vinewood_04",
    "A_M_Y_Yoga_01",
    "CS_Andreas",
    "CS_Bankman",
    "CS_Barry",
    "CS_Beverly",
    "CS_Brad",
    "CS_BradCadaver",
    "CS_Carbuyer",
    "CS_Casey",
    "CS_ChengSr",
    "CS_ChrisFormage",
    "CS_Clay",
    "CS_Dale",
    "CS_DaveNorton",
    "CS_Devin",
    "CS_Dom",
    "CS_Dreyfuss",
    "CS_DrFriedlander",
    "CS_DrFriedlander_02",
    "CS_Fabien",
    "CS_Floyd",
    "CS_Hunter",
    "CS_JimmyBoston",
    "CS_JimmyDiSanto",
    "CS_JimmyDiSanto2",
    "CS_JoeMinuteMan",
    "CS_JohnnyKlebitz",
    "CS_Josef",
    "CS_Josh",
    "CS_LamarDavis",
    "CS_LamarDavis_02",
    "CS_Lazlow",
    "CS_Lazlow_2",
    "CS_LesterCrest",
    "CS_LesterCrest_2",
    "CS_LesterCrest_3",
    "CS_LifeInvad_01",
    "CS_Manuel",
    "CS_MartinMadrazo",
    "CS_Milton",
    "CS_MovPremMale",
    "CS_MRK",
    "CS_NervousRon",
    "CS_NervousRon_02",
    "CS_Nigel",
    "CS_Old_Man1A",
    "CS_Old_Man2",
    "CS_Omega",
    "CS_Paper",
    "CS_Priest",
    "CS_ProlSec_02",
    "CS_RussianDrunk",
    "CS_SiemonYetarian",
    "CS_Solomon",
    "CS_SteveHains",
    "CS_Stretch",
    "CS_TaoCheng",
    "CS_TaoCheng2",
    "CS_TaosTranslator",
    "CS_TaosTranslator2",
    "CS_TennisCoach",
    "CS_Terry",
    "CS_Tom",
    "CS_TomEpsilon",
    "CS_Wade",
    "CS_Zimbor",
    "CSB_Agent",
    "CSB_Anton",
    "CSB_ARY",
    "CSB_ARY_02",
    "CSB_Avery",
    "CSB_AviSchwartzman_02",
    "CSB_AviSchwartzman_03",
    "CSB_Avon",
    "CSB_Ballas_Leader",
    "CSB_BallasOG",
    "CSB_Billionaire",
    "CSB_Bogdan",
    "CSB_Brucie2",
    "CSB_BurgerDrug",
    "CSB_Car3guy1",
    "CSB_Car3guy2",
    "CSB_Celeb_01",
    "CSB_Charlie_Reed",
    "CSB_Chef",
    "CSB_Chef_03",
    "CSB_Chef2",
    "CSB_Chin_goon",
    "CSB_Cletus",
    "CSB_Customer",
    "CSB_Dax",
    "CSB_Dix",
    "CSB_DrugDealer",
    "CSB_EnglishDave",
    "CSB_EnglishDave_02",
    "CSB_FOS_rep",
    "CSB_G",
    "CSB_Golfer_A",
    "CSB_Groom",
    "CSB_Grove_str_dlr",
    "CSB_Gustavo",
    "CSB_Hao",
    "CSB_Hao_02",
    "CSB_HelmsmanPavel",
    "CSB_Huang",
    "CSB_Hugh",
    "CSB_IslDJ_00",
    "CSB_IslDJ_01",
    "CSB_ISLDJ_02",
    "CSB_IslDJ_03",
    "CSB_IslDJ_04",
    "CSB_JackHowitzer",
    "CSB_JamalAmir",
    "CSB_Janitor",
    "CSB_Johnny_Guns",
    "CSB_JuanStrickler",
    "CSB_Labrat",
    "CSB_MiguelMadrazo",
    "CSB_MJO",
    "CSB_MJO_02",
    "CSB_Money",
    "CSB_Moodyman_02",
    "CSB_MP_Agent14",
    "CSB_MWeather",
    "CSB_Ortega",
    "CSB_Oscar",
    "CSB_Party_Promo",
    "CSB_Popov",
    "CSB_PornDudes",
    "CSB_PrologueDriver",
    "CSB_Ramp_gang",
    "CSB_Ramp_hic",
    "CSB_Ramp_hipster",
    "CSB_Ramp_marine",
    "CSB_Ramp_mex",
    "CSB_Rashcosvki",
    "CSB_Reporter",
    "CSB_Req_Officer",
    "CSB_RoccoPelosi",
    "CSB_Security_A",
    "CSB_Sol",
    "CSB_TalCC",
    "CSB_TalMM",
    "CSB_Thornton",
    "CSB_TomCasino",
    "CSB_TonyPrince",
    "CSB_TrafficWarden",
    "CSB_Undercover",
    "CSB_Vagos_Leader",
    "CSB_VagSpeak",
    "CSB_Vernon",
    "CSB_Vincent",
    "CSB_Vincent_2",
    "CSB_Vincent_4",
    "CSB_YusufAmir",
    "G_M_ImportExport_01",
    "G_M_M_ArmBoss_01",
    "G_M_M_ArmGoon_01",
    "G_M_M_ArmLieut_01",
    "G_M_M_CartelGoons_01",
    "G_M_M_CartelGuards_01",
    "G_M_M_CartelGuards_02",
    "G_M_M_CasRN_01",
    "G_M_M_ChemWork_01",
    "G_M_M_ChiBoss_01",
    "G_M_M_ChiCold_01",
    "G_M_M_ChiGoon_01",
    "G_M_M_ChiGoon_02",
    "G_M_M_Fooliganz_01",
    "G_M_M_FriedlanderGoons_01",
    "G_M_M_GenThug_01",
    "G_M_M_Goons_01",
    "G_M_M_KorBoss_01",
    "G_M_M_MaraGrande_01",
    "G_M_M_MexBoss_01",
    "G_M_M_MexBoss_02",
    "G_M_M_Prisoners_01",
    "G_M_M_Slasher_01",
    "G_M_Y_ArmGoon_02",
    "G_M_Y_Azteca_01",
    "G_M_Y_BallaEast_01",
    "G_M_Y_BallaOrig_01",
    "G_M_Y_BallaSout_01",
    "G_M_Y_FamCA_01",
    "G_M_Y_FamDNF_01",
    "G_M_Y_FamFor_01",
    "G_M_Y_Korean_01",
    "G_M_Y_Korean_02",
    "G_M_Y_KorLieut_01",
    "G_M_Y_Lost_01",
    "G_M_Y_Lost_02",
    "G_M_Y_Lost_03",
    "G_M_Y_MexGang_01",
    "G_M_Y_MexGoon_01",
    "G_M_Y_MexGoon_02",
    "G_M_Y_MexGoon_03",
    "G_M_Y_PoloGoon_01",
    "G_M_Y_PoloGoon_02",
    "G_M_Y_SalvaBoss_01",
    "G_M_Y_SalvaGoon_01",
    "G_M_Y_SalvaGoon_02",
    "G_M_Y_SalvaGoon_03",
    "G_M_Y_StrPunk_01",
    "G_M_Y_StrPunk_02",
    "HC_Driver",
    "HC_Gunman",
    "HC_Hacker",
    "IG_AcidLabCook",
    "IG_Agent",
    "IG_Agent_02",
    "IG_AhronWard",
    "IG_Andreas",
    "IG_ARY",
    "IG_ARY_02",
    "IG_AviSchwartzman_02",
    "IG_AviSchwartzman_03",
    "IG_Avon",
    "IG_Ballas_Leader",
    "IG_BallasOG",
    "IG_Bankman",
    "IG_Barry",
    "IG_Benny",
    "IG_Benny_02",
    "IG_BestMen",
    "IG_Beverly",
    "IG_Brad",
    "IG_Brucie2",
    "IG_Car3guy1",
    "IG_Car3guy2",
    "IG_Casey",
    "IG_Celeb_01",
    "IG_Charlie_Reed",
    "IG_Chef",
    "IG_Chef_03",
    "IG_Chef2",
    "IG_ChengSr",
    "IG_ChrisFormage",
    "IG_Clay",
    "IG_ClayPain",
    "IG_Cletus",
    "IG_Dale",
    "IG_DaveNorton",
    "IG_Dax",
    "IG_Devin",
    "IG_Dix",
    "IG_DJBlamRupert",
    "IG_DJBlamRyanH",
    "IG_DJBlamRyanS",
    "IG_DJDixManager",
    "IG_DJGeneric_01",
    "IG_DJSolFotios",
    "IG_DJSolJakob",
    "IG_DJSolManager",
    "IG_DJSolMike",
    "IG_DJSolRobT",
    "IG_DJTalIgnazio",
    "IG_Dom",
    "IG_Dreyfuss",
    "IG_DrFriedlander",
    "IG_DrFriedlander_02",
    "IG_DrugDealer",
    "IG_EnglishDave",
    "IG_EnglishDave_02",
    "IG_Fabien",
    "IG_Floyd",
    "IG_Furry",
    "IG_G",
    "IG_Golfer_A",
    "IG_Groom",
    "IG_GunVanSeller",
    "IG_Gustavo",
    "IG_Hao",
    "IG_Hao_02",
    "IG_HelmsmanPavel",
    "IG_HippyLeader",
    "IG_Huang",
    "IG_Hunter",
    "IG_IslDJ_00",
    "IG_IslDJ_01",
    "IG_IslDJ_02",
    "IG_IslDJ_03",
    "IG_IslDJ_04",
    "IG_JamalAmir",
    "ig_JAY_Norris",
    "IG_Jaywalker",
    "IG_JimmyBoston",
    "IG_JimmyBoston_02",
    "IG_JimmyDiSanto",
    "IG_JimmyDiSanto2",
    "IG_JIO",
    "IG_JIO_02",
    "IG_JoeMinuteMan",
    "IG_Johnny_Guns",
    "ig_JohnnyKlebitz",
    "IG_Josef",
    "IG_Josh",
    "IG_JuanStrickler",
    "IG_Labrat",
    "IG_LamarDavis",
    "IG_LamarDavis_02",
    "IG_Lazlow",
    "IG_Lazlow_2",
    "IG_LesterCrest",
    "IG_LesterCrest_2",
    "IG_LesterCrest_3",
    "IG_LifeInvad_01",
    "IG_LifeInvad_02",
    "IG_LilDee",
    "IG_Malc",
    "IG_Manuel",
    "IG_Mason_Duggan",
    "IG_Mechanic_01",
    "IG_Mechanic_02",
    "IG_MiguelMadrazo",
    "IG_Milton",
    "IG_MJO",
    "IG_MJO_02",
    "IG_Money",
    "IG_Moodyman_02",
    "IG_MP_Agent14",
    "IG_MRK",
    "IG_NervousRon",
    "IG_NervousRon_02",
    "IG_Nigel",
    "IG_Old_Man1A",
    "IG_Old_Man2",
    "IG_OldRichGuy",
    "IG_Omega",
    "IG_ONeil",
    "IG_Ortega",
    "IG_Paper",
    "IG_Party_Promo",
    "IG_Pernell_Moss",
    "IG_Pilot",
    "IG_Pilot_02",
    "IG_Popov",
    "IG_Priest",
    "IG_Ramp_Gang",
    "IG_Ramp_Hic",
    "IG_Ramp_Hipster",
    "IG_Ramp_Mex",
    "IG_Rashcosvki",
    "IG_Req_Officer",
    "IG_RoccoPelosi",
    "IG_RoosterMcCraw",
    "IG_RussianDrunk",
    "IG_Sacha",
    "IG_Security_A",
    "IG_SiemonYetarian",
    "IG_Sol",
    "IG_Solomon",
    "IG_SteveHains",
    "IG_Stretch",
    "IG_SubCrewHead",
    "IG_TalCC",
    "IG_Talina",
    "IG_TalMM",
    "IG_TaoCheng",
    "IG_TaoCheng2",
    "IG_TaosTranslator",
    "IG_TaosTranslator2",
    "ig_TennisCoach",
    "IG_Terry",
    "IG_Thornton",
    "IG_TomCasino",
    "IG_TomEpsilon",
    "IG_TonyPrince",
    "IG_TrafficWarden",
    "IG_TylerDix",
    "IG_TylerDix_02",
    "IG_Vagos_Leader",
    "IG_VagSpeak",
    "IG_Vernon",
    "IG_Wade",
    "IG_YusufAmir",
    "IG_Zimbor",
    "MP_G_M_Pros_01",
    "MP_HeadTargets",
    "MP_M_AvonGoon",
    "MP_M_BoatStaff_01",
    "MP_M_BogdanGoon",
    "MP_M_Claude_01",
    "MP_M_Cocaine_01",
    "MP_M_Counterfeit_01",
    "MP_M_ExArmy_01",
    "MP_M_ExecPA_01",
    "MP_M_FamDD_01",
    "MP_M_FIBSec_01",
    "MP_M_Forgery_01",
    "MP_M_G_VagFun_01",
    "MP_M_Marston_01",
    "MP_M_Meth_01",
    "MP_M_Niko_01",
    "MP_M_SecuroGuard_01",
    "MP_M_ShopKeep_01",
    "MP_M_WareMech_01",
    "MP_M_WeapExp_01",
    "MP_M_WeapWork_01",
    "MP_M_Weed_01",
    "MP_S_M_Armoured_01",
    "P_Franklin_02",
    "Player_One",
    "Player_Two",
    "Player_Zero",
    "S_M_M_AmmuCountry",
    "S_M_M_Armoured_01",
    "S_M_M_Armoured_02",
    "S_M_M_AutoShop_01",
    "S_M_M_AutoShop_02",
    "S_M_M_Autoshop_03",
    "S_M_M_Bouncer_01",
    "S_M_M_Bouncer_02",
    "S_M_M_CCrew_01",
    "S_M_M_CCrew_02",
    "S_M_M_CCrew_03",
    "S_M_M_ChemSec_01",
    "S_M_M_CIASec_01",
    "S_M_M_CntryBar_01",
    "S_M_M_DockWork_01",
    "S_M_M_Doctor_01",
    "S_M_M_DrugProcess_01",
    "S_M_M_FIBOffice_01",
    "S_M_M_FIBOffice_02",
    "S_M_M_FIBSec_01",
    "S_M_M_FieldWorker_01",
    "S_M_M_Gaffer_01",
    "S_M_M_Gardener_01",
    "S_M_M_GenTransport",
    "S_M_M_HairDress_01",
    "S_M_M_HazmatWorker_01",
    "S_M_M_HighSec_01",
    "S_M_M_HighSec_02",
    "S_M_M_HighSec_03",
    "S_M_M_HighSec_04",
    "S_M_M_HighSec_05",
    "S_M_M_Janitor",
    "S_M_M_LatHandy_01",
    "S_M_M_LifeInvad_01",
    "S_M_M_Linecook",
    "S_M_M_LSMetro_01",
    "S_M_M_Mariachi_01",
    "S_M_M_Marine_01",
    "S_M_M_Marine_02",
    "S_M_M_Migrant_01",
    "S_M_M_MovAlien_01",
    "S_M_M_MovPrem_01",
    "S_M_M_MovSpace_01",
    "S_M_M_Paramedic_01",
    "S_M_M_Pilot_01",
    "S_M_M_Pilot_02",
    "S_M_M_Postal_01",
    "S_M_M_Postal_02",
    "S_M_M_PrisGuard_01",
    "S_M_M_RaceOrg_01",
    "S_M_M_Scientist_01",
    "S_M_M_Security_01",
    "S_M_M_StrPerf_01",
    "S_M_M_StrPreach_01",
    "S_M_M_StrVend_01",
    "S_M_M_StudioAssist_02",
    "S_M_M_StudioProd_01",
    "S_M_M_StudioSouEng_02",
    "S_M_M_SubCrew_01",
    "S_M_M_Tattoo_01",
    "S_M_M_Trucker_01",
    "S_M_M_UPS_01",
    "S_M_M_UPS_02",
    "S_M_M_Warehouse_01",
    "S_M_O_Busker_01",
    "S_M_Y_AirWorker",
    "S_M_Y_AmmuCity_01",
    "S_M_Y_ArmyMech_01",
    "S_M_Y_Autopsy_01",
    "S_M_Y_Barman_01",
    "S_M_Y_BayWatch_01",
    "S_M_Y_BlackOps_01",
    "S_M_Y_BlackOps_02",
    "S_M_Y_BlackOps_03",
    "S_M_Y_BusBoy_01",
    "S_M_Y_Casino_01",
    "S_M_Y_Chef_01",
    "S_M_Y_Clown_01",
    "S_M_Y_ClubBar_01",
    "S_M_Y_Construct_01",
    "S_M_Y_Construct_02",
    "S_M_Y_Dealer_01",
    "S_M_Y_DevinSec_01",
    "S_M_Y_DockWork_01",
    "S_M_Y_Doorman_01",
    "S_M_Y_DWService_01",
    "S_M_Y_DWService_02",
    "S_M_Y_Factory_01",
    "S_M_Y_Fireman_01",
    "S_M_Y_Garbage",
    "S_M_Y_Grip_01",
    "S_M_Y_Marine_01",
    "S_M_Y_Marine_02",
    "S_M_Y_Marine_03",
    "S_M_Y_Mime",
    "S_M_Y_PestCont_01",
    "S_M_Y_Pilot_01",
    "S_M_Y_PrisMuscl_01",
    "S_M_Y_Prisoner_01",
    "S_M_Y_Ranger_01",
    "S_M_Y_Robber_01",
    "S_M_Y_Sheriff_01",
    "S_M_Y_Shop_MASK",
    "S_M_Y_StrVend_01",
    "S_M_Y_USCG_01",
    "S_M_Y_Valet_01",
    "S_M_Y_Waiter_01",
    "S_M_Y_WareTech_01",
    "S_M_Y_WestSec_01",
    "S_M_Y_WestSec_02",
    "S_M_Y_WinClean_01",
    "S_M_Y_XMech_01",
    "S_M_Y_XMech_02",
    "S_M_Y_XMech_02_MP",
    "slod_human",
    "U_M_M_Aldinapoli",
    "U_M_M_BankMan",
    "U_M_M_BikeHire_01",
    "U_M_M_Blane",
    "U_M_M_Curtis",
    "U_M_M_DOA_01",
    "U_M_M_EdToh",
    "U_M_M_FIBArchitect",
    "U_M_M_FilmDirector",
    "U_M_M_GlenStank_01",
    "U_M_M_Griff_01",
    "U_M_M_JewelSec_01",
    "U_M_M_JewelThief",
    "U_M_M_Juggernaut_03",
    "U_M_M_MarkFost",
    "U_M_M_PartyTarget",
    "U_M_M_ProlSec_01",
    "U_M_M_ProMourn_01",
    "U_M_M_RivalPap",
    "U_M_M_SpyActor",
    "U_M_M_StreetArt_01",
    "U_M_M_Vince",
    "U_M_M_WillyFist",
    "U_M_M_YuleMonster",
    "U_M_O_Dean",
    "U_M_O_FilmNoir",
    "U_M_O_FinGuru_01",
    "U_M_O_TapHillBilly",
    "U_M_O_Tramp_01",
    "U_M_Y_Abner",
    "U_M_Y_AntonB",
    "U_M_Y_BabyD",
    "U_M_Y_Baygor",
    "U_M_Y_BurgerDrug_01",
    "U_M_Y_Caleb",
    "U_M_Y_Chip",
    "U_M_Y_Corpse_01",
    "U_M_Y_CroupThief_01",
    "U_M_Y_Cyclist_01",
    "U_M_Y_DanceBurl_01",
    "U_M_Y_DanceLthr_01",
    "U_M_Y_DanceRave_01",
    "U_M_Y_FIBMugger_01",
    "U_M_Y_Gabriel",
    "U_M_Y_Guido_01",
    "U_M_Y_GunVend_01",
    "U_M_Y_Hippie_01",
    "U_M_Y_ImpoRage",
    "U_M_Y_Juggernaut_01",
    "U_M_Y_Juggernaut_02",
    "U_M_Y_Justin",
    "U_M_Y_Mani",
    "U_M_Y_MilitaryBum",
    "U_M_Y_Paparazzi",
    "U_M_Y_Party_01",
    "U_M_Y_Pogo_01",
    "U_M_Y_Prisoner_01",
    "U_M_Y_ProlDriver_01",
    "U_M_Y_RSRanger_01",
    "U_M_Y_SBike",
    "U_M_Y_SmugMech_01",
    "U_M_Y_StagGrm_01",
    "U_M_Y_Tattoo_01",
    "U_M_Y_Ushi",
    "U_M_Y_Zombie_01"
}

local Ped_Law = {
    "CS_FBISuit_01",
    "CSB_Cop",
    "CSB_ProlSec",
    "IG_FBISuit_01",
    "IG_ProlSec_02",
    "IG_Vincent",
    "IG_Vincent_2",
    "IG_Vincent_3",
    "IG_Vincent_4",
    "S_F_Y_Cop_01",
    "S_M_M_Cop_01",
    "S_M_M_SnowCop_01",
    "S_M_Y_Cop_01",
    "S_M_Y_HwayCop_01",
    "S_M_Y_Swat_01"
}

local Ped_Special = {
    "CS_Orleans",
    "IG_Orleans",
    "U_M_M_Jesus_01",
    "U_M_M_Yeti"
}

local Ped_Animals = {
    "A_C_Boar",
    "A_C_Boar_02",
    "A_C_Cat_01",
    "A_C_Chickenhawk",
    "A_C_Chimp",
    "A_C_Chimp_02",
    "A_C_Chop",
    "A_C_Chop_02",
    "A_C_Cormorant",
    "A_C_Cow",
    "A_C_Coyote",
    "A_C_Coyote_02",
    "A_C_Crow",
    "A_C_Deer",
    "A_C_Deer_02",
    "A_C_Dolphin",
    "A_C_Fish",
    "A_C_Hen",
    "A_C_HumpBack",
    "A_C_Husky",
    "A_C_KillerWhale",
    "A_C_MtLion",
    "A_C_MtLion_02",
    "A_C_Panther",
    "A_C_Pig",
    "A_C_Pigeon",
    "A_C_Poodle",
    "A_C_Pug",
    "A_C_Pug_02",
    "A_C_Rabbit_01",
    "A_C_Rabbit_02",
    "A_C_Rat",
    "A_C_Retriever",
    "A_C_Rhesus",
    "A_C_Rottweiler",
    "A_C_Seagull",
    "A_C_SharkHammer",
    "A_C_SharkTiger",
    "A_C_shepherd",
    "A_C_Stingray",
    "A_C_Westy",
    "slod_large_quadped",
    "slod_small_quadped"
}

local Ped_Multipayer = {
    "MP_M_Freemode_01",
    "MP_F_Freemode_01"
}

--------- Cross Ped List ---------

local female = {}
local male = {}
local law_female = {}
local law_male = {}
local cs_female = {}
local cs_male = {}

for idx = 1,#Ped_Female do
    if Is_IN(Ped_Female[idx],Ped_Law) then
        law_female[#law_female+1] = Ped_Female[idx]
    elseif string.sub(Ped_Female[idx], 1, 2) == "CS" then
        cs_female[#cs_female+1] = Ped_Female[idx]
    else
        female[#female+1] = Ped_Female[idx]
    end
end

for idx = 1,#Ped_Male do
    if Is_IN(Ped_Male[idx],Ped_Law) then
        law_male[#law_male+1] = Ped_Male[idx]
    elseif string.sub(Ped_Male[idx], 1, 2) == "CS" then
        cs_male[#cs_male+1] = Ped_Male[idx]
    else
        male[#male+1] = Ped_Male[idx]
    end
end

--------- Menu ---------


Text(Miscellaneous_Options,Shapeshift_Menu)
Shapeshift_Menu:add_toggle(Tiny_Option,
    function()	
        if localplayer == nil then
        	return nil
    	end
    	return localplayer:get_config_flag(223)
    end,
    function(value)
        localplayer:set_config_flag(223, value)
    end)
Shapeshift_Menu:add_action(Gender_option, function() stats.set_int(mpx().."ALLOW_GENDER_CHANGE", 52) end)
Shapeshift_Menu:add_array_item(Multiplayer_Option      , Ped_Multipayer ,function() return idx_mp         end,function(n) idx_mp         = n set_model_hash(joaat( Ped_Multipayer[n] ))   localplayer:set_godmode(true)   end)
Shapeshift_Menu:add_array_item(Animal_Option           , Ped_Animals    ,function() return idx_animal     end,function(n) idx_animal     = n set_model_hash(joaat( Ped_Animals[n]    ))   localplayer:set_godmode(true)   end)
Shapeshift_Menu:add_array_item(Special_Option          , Ped_Special    ,function() return idx_special    end,function(n) idx_special    = n set_model_hash(joaat( Ped_Special[n]    ))   localplayer:set_godmode(true)   end)
Text(Normal_Option,Shapeshift_Menu)
Shapeshift_Menu:add_array_item(Male_Character_Option   , male           ,function() return idx_male       end,function(n) idx_male       = n set_model_hash(joaat( male[n]           ))   localplayer:set_godmode(true)   end)
Shapeshift_Menu:add_array_item(Female_Character_Option , female         ,function() return idx_female     end,function(n) idx_female     = n set_model_hash(joaat( female[n]         ))   localplayer:set_godmode(true)   end)
Text(Law_Option,Shapeshift_Menu)    
Shapeshift_Menu:add_array_item(Male_Character_Option   , law_male       ,function() return idx_law_male   end,function(n) idx_law_male   = n set_model_hash(joaat( law_male[n]       ))   localplayer:set_godmode(true)   end)
Shapeshift_Menu:add_array_item(Female_Character_Option , law_female     ,function() return idx_law_female end,function(n) idx_law_female = n set_model_hash(joaat( law_female[n]     ))   localplayer:set_godmode(true)   end)
Text(Cutscene_Option,Shapeshift_Menu)    
Shapeshift_Menu:add_array_item(Male_Character_Option   , cs_male        ,function() return idx_cs_male    end,function(n) idx_cs_male    = n set_model_hash(joaat( cs_male[n]        ))   localplayer:set_godmode(true)   end)
Shapeshift_Menu:add_array_item(Female_Character_Option , cs_female      ,function() return idx_cs_female  end,function(n) idx_cs_female  = n set_model_hash(joaat( cs_female[n]      ))   localplayer:set_godmode(true)   end)







------------------------
------ Main menu -------


local Bindings_menu = Settings_menu:add_submenu(Settings_Binds_Menu)

local Noclip_Bindings = Bindings_menu:add_submenu(Menu_Noclip)
Noclip_Bindings:add_array_item(Menu_Noclip_Toggle,KeyCode,
	function()
		return settings.Noclip.toggle
	end,
	function(key)
		settings.Noclip.toggle = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_Foward,KeyCode,
	function()
		return settings.Noclip.foward
	end,
	function(key)
		settings.Noclip.foward = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_Backward,KeyCode,
	function()
		return settings.Noclip.backward
	end,
	function(key)
		settings.Noclip.backward = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_TurnRight,KeyCode,
	function()
		return settings.Noclip.turnright
	end,
	function(key)
		settings.Noclip.turnright = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_TrunLeft,KeyCode,
	function()
		return settings.Noclip.turnleft
	end,
	function(key)
		settings.Noclip.turnleft = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_IncreaseSpeed,KeyCode,
	function()
		return settings.Noclip.increasespeed
	end,
	function(key)
		settings.Noclip.increasespeed = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_DecreaseSpeed,KeyCode,
	function()
		return settings.Noclip.decreasespeed
	end,
	function(key)
		settings.Noclip.decreasespeed = key
		Save_settings(Settings_JSON_Filename,settings)
	end
)

local Menu_Bindings = Bindings_menu:add_submenu(Menu_Bindings)
Menu_Bindings:add_array_item(Menu_Bindings_Toggle,KeyCode,
	function()
		return Menu_Keybindings[1]	
	end,
	function(k)
		Menu_Keybindings[1] = KeyCode[k]
		config.Menu.KeyBindings.MenuToggle = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Select,KeyCode,
	function()
		return Menu_Keybindings[2]	
	end,
	function(k)
		Menu_Keybindings[2] = KeyCode[k]
		config.Menu.KeyBindings.SelectKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Back  ,KeyCode,
	function()
		return Menu_Keybindings[3]	
	end,
	function(k)
		Menu_Keybindings[3] = KeyCode[k]
		config.Menu.KeyBindings.BackKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Up    ,KeyCode,
	function()
		return Menu_Keybindings[4]	
	end,
	function(k)
		Menu_Keybindings[4] = KeyCode[k]
		config.Menu.KeyBindings.UpKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Down  ,KeyCode,
	function()
		return Menu_Keybindings[5]	
	end,
	function(k)
		Menu_Keybindings[5] = KeyCode[k]
		config.Menu.KeyBindings.DownKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Right ,KeyCode,
	function()
		return Menu_Keybindings[6]	
	end,
	function(k)
		Menu_Keybindings[6] = KeyCode[k]
		config.Menu.KeyBindings.RightKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Left  ,KeyCode,
	function()
		return Menu_Keybindings[7]	
	end,
	function(k)
		Menu_Keybindings[7] = KeyCode[k]
		config.Menu.KeyBindings.LeftKey = KeyCode[k]
		Save_settings("config.json",config)
	end
)

Bindings_menu:add_array_item(Boost_Key,KeyCode,
	function()
		return settings.BoostButton.key
	end,
	function(key)
		settings.BoostButton.key = key
		Save_settings(Settings_JSON_Filename,settings)
	end
)

Bindings_menu:add_array_item(Refill_Key,KeyCode,
	function()
		return settings.RefillKey
	end,
	function(k)
		settings.RefillKey = k
		Save_settings(Settings_JSON_Filename,settings)
	end
)


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
        Save_settings(Settings_JSON_Filename,settings)
    end)
--

local Numberplates_Settings = Settings_menu:add_submenu(Menu_Numberplates)
Numberplates_Settings:add_toggle(Settings_Numberplates_enable,
    function()
        return settings.Numberplates.enabled
    end,
    function(n)
        settings.Numberplates.enabled = n
		settings.Numberplates.custom.enabled = not n
        Save_settings(Settings_JSON_Filename,settings)
    end)

Numberplates_Settings:add_array_item(Settings_Numberplates_unit,units_text,
    function()
        return settings.Numberplates.unit
    end,
    function(u)
        settings.Numberplates.unit = u
        Save_settings(Settings_JSON_Filename,settings)
    end)
Numberplates_Settings:add_toggle(Custom_Numberplates,
    function()
        return settings.Numberplates.custom.enabled
    end,
    function(n)
        settings.Numberplates.custom.enabled = n
        settings.Numberplates.enabled = not n
        Save_settings(Settings_JSON_Filename,settings)
    end
)

Settings_menu:add_array_item(Shapeshift_Gender,Gender,
	function()
		return settings.Gender
	end,
	function(gen)
		settings.Gender = gen
		Save_settings(Settings_JSON_Filename,settings)
	end
)

Settings_menu:add_toggle(Removed_Cars_Default,
	function()
		return settings.RemovedCars
	end,
	function(rc)
		settings.RemovedCars = rc
		Save_settings(Settings_JSON_Filename,settings)
	end
)

Settings_menu:add_toggle(Settings_Boost_Default,
	function()
		return settings.BoostButton.enable
	end,
	function(bb)
		settings.BoostButton.enable = bb
		Save_settings(Settings_JSON_Filename,settings)
	end
)

Settings_menu:add_toggle(Global_Submenu,
	function()
		return settings.GlobalTester
	end,
	function(gt)
		settings.GlobalTester = gt
		Save_settings(Settings_JSON_Filename,settings)
	end
)



Main_menu:add_toggle(Manu_TransactionError,
	function()
		return enable_transaction_error
	end,
	function()
		enable_transaction_error = not enable_transaction_error
	end
)

local toggle_hotkey = menu.register_hotkey(Noclip_bind[9],
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
--

local Numberplates_Menu = Main_menu:add_submenu(Menu_Numberplates)
Numberplates_Menu:add_toggle(Menu_Speedometer_Bindings,
    function()
    	return numberplate_enabled
    end,
    function(value)
		numberplate_enabled = value
		numberplate_custom_enabled = not value
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
		numberplate_enabled = not value
	end)
--

Text(Separator_text,Numberplates_Menu)

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
	end
)



function On_Vehicle_Changed(oldVehicle, newVehicle)
	if localplayer then myplayer = localplayer end
	vehicle = newVehicle
	if oldVehicle then vehicle_old = oldVehicle end

	if numberplate_enabled and not numberplate_custom_enabled and oldVehicle ~= nil then
		oldVehicle:set_number_plate_text(Orignial_Plate)
	end

	if No_Scratch_Enabled and myplayer:is_in_vehicle() and myplayer:get_current_vehicle() ~= nil then
		vehicle:set_can_be_visibly_damaged(false)
		vehicle:set_window_collisions_disabled(true)
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
Main_menu:add_toggle(Menu_Disable_AutoStop,
	function()
		if localplayer == nil then
			return nil
		end
		return localplayer:get_config_flag(241)
	end,
	function(value)
		localplayer:set_config_flag(241, value)
	end)
Main_menu:add_action(Menu_LSC_Reset, function() 
	stats.set_int("MPPLY_VEHICLE_SELL_TIME", 0)
	stats.set_int("MPPLY_NUM_CARS_SOLD_TODAY", 0)
	end)
menu.register_callback("OnVehicleChanged",On_Vehicle_Changed)

-----------------------------------------------
-- Rainbow Car and Boost Script by Quad_Plex -- Modified
-----------------------------------------------

local Honk_Boost_menu = Main_menu:add_submenu(Boost_Menu)
menu.register_hotkey(settings.BoostButton.key, carBoost)
Honk_Boost_menu:add_toggle(Boost_Toggle,function() return boost_activate end,function(b) boost_activate = b end)
Honk_Boost_menu:add_int_range(Boost_Strength, 5, 0, 690, function() return multiplier_percent end, function(value) multiplier_percent = value end)

local Rainbow_Cars = Main_menu:add_submenu(Rainbow_Menu)
Rainbow_Cars:add_toggle(Rainbow_Toggle,function() return Rainbow_Activated end, function(a) Rainbow_Activated = a end)
Rainbow_Cars:add_array_item(Rainbow_Style, colorStyles, function() return colorStyle end, function(value) colorStyle = value toggleColorFunction(value) end)
Rainbow_Cars:add_toggle(Rainbow_Uniform, function() return uniform end, function(value) uniform = value end)
Rainbow_Cars:add_toggle(Rainbow_Traffic, function() return affect_traffic end, function(value) affect_traffic = value end)
Rainbow_Cars:add_int_range(Rainbow_Mul, 1, 1, 69, function() return mul end, function(value) mul = value end)

-----------------------------------------------


local Online_Stats_menu = Unlocks_menu:add_submenu(Stats_Menu)
Online_Stats_menu:add_int_range(Stats_Stamina , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_stam")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_stam", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Strength, 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_strn")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_strn", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Lung    , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_lung")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_lung", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Driving , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_driv")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_driv", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Flying  , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_fly")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_fly", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Shooting, 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_sho")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_sho", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Stealth , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_stl")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_stl", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Mechanic, 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_mech")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_mech", value)
	end)
--

local Achivement_menu = Unlocks_menu:add_submenu(Achivement_Menu) 
	Text(Achivement_Text, Achivement_menu)
	Text(Separator_text, Achivement_menu)
	for i = 1,#Achivement_List do
		Achivement_menu:add_action(Achivement_List[i], function() globals.set_int(Achivement_Global, i) end)
	end
--

Unlocks_menu:add_action(Unlocks_Daily,
	function()
		stats.set_int("MP" .. mpx() .. "_COMPLETEDAILYOBJ", 100)
		stats.set_int("MP" .. mpx() .. "_COMPLETEDAILYOBJTOTAL", 100)
		stats.set_int("MP" .. mpx() .. "_TOTALDAYCOMPLETED", 100)
		stats.set_int("MP" .. mpx() .. "_TOTALWEEKCOMPLETED", 400)
		stats.set_int("MP" .. mpx() .. "_TOTALMONTHCOMPLETED", 1800)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEDAYCOMPLETED", 30)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEWEEKCOMPLETED", 4)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEMONTHCOMPLETE", 1)
		stats.set_int("MP" .. mpx() .. "_COMPLETEDAILYOBJSA", 100)
		stats.set_int("MP" .. mpx() .. "_COMPLETEDAILYOBJTOTALSA", 100)
		stats.set_int("MP" .. mpx() .. "_TOTALDAYCOMPLETEDSA", 100)
		stats.set_int("MP" .. mpx() .. "_TOTALWEEKCOMPLETEDSA", 400)
		stats.set_int("MP" .. mpx() .. "_TOTALMONTHCOMPLETEDSA", 1800)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEDAYCOMPLETEDSA", 30)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEWEEKCOMPLETEDSA", 4)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEMONTHCOMPLETESA", 1)
		stats.set_int("MP" .. mpx() .. "_AWD_DAILYOBJCOMPLETEDSA", 100)
		stats.set_int("MP" .. mpx() .. "_AWD_DAILYOBJCOMPLETED", 100)
		stats.set_bool("MP" .. mpx() .. "_AWD_DAILYOBJMONTHBONUS", true)
		stats.set_bool("MP" .. mpx() .. "_AWD_DAILYOBJWEEKBONUS", true)
		stats.set_bool("MP" .. mpx() .. "_AWD_DAILYOBJWEEKBONUSSA", true)
		stats.set_bool("MP" .. mpx() .. "_AWD_DAILYOBJMONTHBONUSSA", true)
	end)
Unlocks_menu:add_action(Unlocks_Parachute,
	function()
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 20)
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 21)
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 22)
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 23)
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 24)
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 25)
	end)

Unlocks_menu:add_action(Unlocks_Unicorn,
	function()
		stats.set_int("MP" .. mpx() .. '_LAP_DANCED_BOUGHT', 0)
		stats.set_int("MP" .. mpx() .. '_LAP_DANCED_BOUGHT', 5)
		stats.set_int("MP" .. mpx() .. '_LAP_DANCED_BOUGHT', 10)
		stats.set_int("MP" .. mpx() .. '_LAP_DANCED_BOUGHT', 15)
		stats.set_int("MP" .. mpx() .. '_LAP_DANCED_BOUGHT', 25)
		stats.set_int("MP" .. mpx() .. '_PROSTITUTES_FREQUENTED', 1000)
	end)

Unlocks_menu:add_action(Unlocks_taxi,
	function()
		stats.set_int("MP"..mpx() .. "_AWD_TAXIDRIVER", 50)
		stats.set_masked_int("MP"..mpx() .. "_DLC22022PSTAT_INT536", 10, 16, 8)
	end)
Unlocks_menu:add_action(Unlocks_tatoos,
	function()
		stats.set_int(mpx().."TATTOO_FM_CURRENT_32", -1)
		for i = 0, 47 do
			stats.set_int(mpx().."TATTOO_FM_UNLOCKS_" .. i, -1)
		end
	end)
Unlocks_menu:add_action(Unlocks_flight,
	function()
		stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 100)
		for i = 0, 9 do
			stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_" .. i , -1)
			stats.set_int(mpx().."PILOT_SCHOOL_MEDAL_" .. i, -1)
			stats.set_bool(mpx().."PILOT_ASPASSEDLESSON_" .. i, true)
		end
	end)
Unlocks_menu:add_action(Unlocks_shooting,
	function()
		stats.set_int(mpx().."SR_HIGHSCORE_1", 690)
		stats.set_int(mpx().."SR_HIGHSCORE_2", 1860)
		stats.set_int(mpx().."SR_HIGHSCORE_3", 2690)
		stats.set_int(mpx().."SR_HIGHSCORE_4", 2660)
		stats.set_int(mpx().."SR_HIGHSCORE_5", 2650)
		stats.set_int(mpx().."SR_HIGHSCORE_6", 450)
		stats.set_int(mpx().."SR_TARGETS_HIT", 269)
		stats.set_int(mpx().."SR_WEAPON_BIT_SET", -1)
		stats.set_bool(mpx().."SR_TIER_1_REWARD", true)
		stats.set_bool(mpx().."SR_TIER_3_REWARD", true)
		stats.set_bool(mpx().."SR_INCREASE_THROW_CAP", true)
	end)
--
Text(Menu_EnhancedOnline,Main_menu)



-- Exeptions
Vehicle_List_Adress[00] = {Global_Offset+0}
-- Vehicle_List_Adress[i] = {start, end, step}
	Vehicle_List_Adress[01] = {Global_Offset+35402, Global_Offset+35678, 2}
	Vehicle_List_Adress[02] = {Global_Offset+14936, Global_Offset+14941, 1}
	Vehicle_List_Adress[02] = {Global_Offset+17682, Global_Offset+17703, 1}
	Vehicle_List_Adress[02] = {Global_Offset+21304, Global_Offset+22122, 1}
	Vehicle_List_Adress[02] = {Global_Offset+23071, Global_Offset+23098, 1}
	Vehicle_List_Adress[02] = {Global_Offset+24292, Global_Offset+24307, 1}
-----

Main_menu:add_toggle(Menu_RemovedCars_Toggle,
    function()
        return Removed_cars
    end,
    function(k)
        Removed_cars = k
        Switch_Veh_Unlock_State()
    end
)

Main_menu:add_action(Refill_Key,function() refillInventory() end)
Main_menu:add_action(Menu_Nightclub_Popular, function() stats.set_int(mpx().."club_popularity", 1000) end)
Main_menu:add_action(Menu_Challenge,
	function()
		stats.set_bool(mpx().."CARMEET_PV_CHLLGE_CMPLT", true)
		stats.set_bool(mpx().."CARMEET_PV_CLMED", false)
	end)

menu.register_hotkey(refill_key, refillInventory)


local function Report()
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

------------------------
----- Global Test ------

function Global_Tester_9000()
    Global_Tester:clear()

    Global_Tester:add_array_item(Global_Mode,tester_mode_list, function() return tester_mode end, function(a) tester_mode = a end)
    Global_Tester:add_array_item(Global_Type,type_mode_list, function() return type_mode end, function(a) type_mode = a end)
    Global_Tester:add_array_item("Script →",scripts_thingy_list, function() return scripts_thingy end, function(a) scripts_thingy = a end)

    
    Text(Separator_text,Global_Tester)
    Text(White_space.."Global/Stat",Global_Tester)

    for i = 1,#current_global_list do
        Global_Tester:add_array_item(Global_Character..#current_global_list-i+1, Numbers_single_digit, function() return current_global_list[#current_global_list-i+1]+1 end, function(g) current_global_list[#current_global_list-i+1] = g-1 end)
    end

    Global_Tester:add_toggle(Global_Global, function() return global_use end, function(e) global_use = e end)

    Global_Tester:add_bare_item("",
        function()
            current_global = current_global_list[1]
            for i = 2,#current_global_list do
                current_global = current_global + current_global_list[i]*10^(i-1)
            end

            if global_use then return Global_Current .. Global_Offset .. "+" .. current_global else return Global_Current .. current_global end
        end,null,null,null
    )


    -- Write

    Text(Separator_text,Global_Tester)
    Text(White_space..Write_Global.." ("..Value_Global..")",Global_Tester)

    for i = 1,#current_setter_list do
        Global_Tester:add_array_item(Global_Character..#current_setter_list-i+1, Numbers_single_digit, function() return current_setter_list[#current_setter_list-i+1]+1 end, function(g) current_setter_list[#current_setter_list-i+1] = g-1 end)
    end

    Global_Tester:add_action(Write_Global,
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
    Text(White_space..Read_Global,Global_Tester)

    Global_Tester:add_toggle(Reading_Global, function() return is_reading end, function(e) is_reading = e end)
    Global_Tester:add_bare_item("",
        function()
            current_global = current_global_list[1]
            for i = 2,#current_global_list do
                current_global = current_global + current_global_list[i]*10^(i-1)
            end

            if global_use then current_global = Global_Offset+current_global end

            if is_reading then
                if tester_mode == 1 then return Value_Global..get_global(current_global, type_mode_list[type_mode])
                elseif tester_mode == 2 then return Value_Global..get_stat(current_global, type_mode_list[type_mode])
                elseif tester_mode == 3 then return Value_Global..get_script(current_global, type_mode_list[type_mode])
                end
            else return Value_Global.." NaN"
            end
        end,null,null,null
    )


    local function create_global_listing()
        saved_globals_list[#saved_globals_list+1] = {current_global, type_mode_list[type_mode], tester_mode, global_use, }
        
        Global_Tester:add_bare_item("",
            function()
                local current_thing_read = saved_globals_list[#saved_globals_list]
                if is_reading then
                    if current_thing_read[4] then
                        if current_thing_read[3] == 1 then return Global_Offset..current_thing_read[1].." → "..get_global(Global_Offset+current_thing_read[1], current_thing_read[2])
                        elseif current_thing_read[3] == 2 then return Global_Offset..current_thing_read[1].." → "..get_stat(Global_Offset+current_thing_read[1], current_thing_read[2])
                        elseif current_thing_read[3] == 3 then return Global_Offset..current_thing_read[1].." → "..get_script(Global_Offset+current_thing_read[1], current_thing_read[2])
                        end
                    else
                        if current_thing_read[3] == 1 then return current_thing_read[1].." → "..get_global(current_thing_read[1], current_thing_read[2])
                        elseif current_thing_read[3] == 2 then return current_thing_read[1].." → "..get_stat(current_thing_read[1], current_thing_read[2])
                        elseif current_thing_read[3] == 3 then return current_thing_read[1].." → "..get_script(current_thing_read[1], current_thing_read[2])
                        end
                    end
                else return Value_Global.." NaN"
                end
            end,null,null,null
        )
    end
    Global_Tester:add_action(Global_List,function() create_global_listing() end)
end

if settings.GlobalTester then
    Text(Separator_text, Cookie_menu)
    Global_Tester = Cookie_menu:add_submenu(Global_Submenu, Global_Tester_9000)
end

Text(Separator_text, Cookie_menu)




-- Th3 L0oP

function OnScriptsLoaded()
	while true do
		if Rainbow_Activated then
			if myplayer and myplayer:is_in_vehicle() then
				On_Vehicle_Changed(nil, myplayer:get_current_vehicle())
				if vehicle ~= nil then
					if Is_IN(999,Original_Color) then
						Original_Color[1],Original_Color[2],Original_Color[3] = vehicle:get_custom_primary_colour()
						Original_Color[4],Original_Color[5],Original_Color[6] = vehicle:get_custom_secondary_colour()
					end

					local function applyColor(colorFunc)
						if affect_traffic then
							for veh in replayinterface.get_vehicles() do
								changeVehicleColor(veh, colorFunc)
							end
						elseif vehicle then
							changeVehicleColor(vehicle, colorFunc)
						end

						sleep(0.04)

						if not myplayer:is_in_vehicle() and not affect_traffic then
							return false
						end
						return true
					end

					if rainbow and applyColor(nextRainbowColor) then
					elseif strobelight and applyColor(strobeLight) then
					elseif random and applyColor(randomColor) then
					end
				end
			end
		end
		if not Rainbow_Activated then
			if myplayer and myplayer:is_in_vehicle() and not Is_IN(999,Original_Color) then
				vehicle:set_custom_primary_colour(Original_Color[1],Original_Color[2],Original_Color[3])
				vehicle:set_custom_secondary_colour(Original_Color[4],Original_Color[5],Original_Color[6])
				Original_Color = {999,999,999,999,999,999}
			end
		end

		if enable_transaction_error then
			globals.set_int(Is_TransactionError_NotificationShown_1 ,0)
			globals.set_int(Is_TransactionError_NotificationShown_2 ,0)
			globals.set_int(TransactionError_BannerShown ,0)
		end

		if numberplate_enabled or numberplate_custom_enabled then
			if vehicle ~= nil then
				if Orignial_Plate == "________" then
					Orignial_Plate = vehicle:get_number_plate_text()
				end

				local speed = round(get_vehicle_speed(vehicle) * units_value[units_selection], 0)

				if numberplate_enabled and not numberplate_custom_enabled and speed ~= nil then
					if speed >= round(7*units_value[units_selection]) then
						vehicle:set_number_plate_text((speed < 10 and "   " or speed < 100 and "  " or speed < 1000 and " " or "") .. speed .. " " .. units_text_numberplate[units_selection])
					else
						vehicle:set_number_plate_text(Orignial_Plate)
						Orignial_Plate = "________"
					end
				elseif numberplate_custom_enabled and not numberplate_enabled and settings.Numberplates.custom.platedefault ~= 0 then
					if Sup3r_2000 then
						vehicle:set_number_plate_text("K 2000")
					else
						vehicle:set_number_plate_text(settings.Numberplates.custom.platelist[settings.Numberplates.custom.platedefault])
					end
				end
			end
		end

		sleep(0.1)
	end
end

menu.register_callback('OnScriptsLoaded', OnScriptsLoaded)