require("scripts/Cookie_Menu_A_language")




Cookie_menu = menu.add_submenu("Cookie Script "..Script_version.." | GTA5 V"..Game_version)


Text(Separator_Text, Cookie_menu)
Text(Heist_Text, Cookie_menu)

Casino_menu       = Cookie_menu:add_submenu(Casino_Submenu)
Cayo_menu         = Cookie_menu:add_submenu(Cayo_Submenu)
Doomsday_menu     = Cookie_menu:add_submenu(Doomsday_Submenu)
Appartements_menu = Cookie_menu:add_submenu(Appartements_Submenu)
Other_Heists_menu = Cookie_menu:add_submenu(Other_Submenu)

Text(Separator_Text, Cookie_menu)
Text(Miscellaneous_Text, Cookie_menu)

Shapeshift_menu   = Cookie_menu:add_submenu(Shapeshift_Submenu)
Main_menu         = Cookie_menu:add_submenu(Menu_Submenu)
Unlocks_menu      = Cookie_menu:add_submenu(Unlock_Tunable_Submenu)
Settings_menu     = Cookie_menu:add_submenu(Settings_Submenu)

Text(Separator_Text, Cookie_menu)

Credits_Menu	  = Cookie_menu:add_submenu(Credits_Submenu)




---- Variables and lists

local P = {}
-- Casino
    local Weapon=0
	local Casino_Hard_mode
		if stats.get_int(mpx().."H3_HARD_APPROACH") == stats.get_int(mpx().."H3OPT_APPROACH") then
			Casino_Hard_mode = 2
		else
			Casino_Hard_mode = 1
		end
    Casino_Mask_List={"Geometric","Hunter","Christian Feltz","Oni Half Mask","Emoji","Ornate Skull","Lucky Fruit","Guerilla","Clown","Animal","Riot","Oni","Hockey"} Casino_Mask_List[0]=Unselected_Text
    Casino_Hacker_List = {"Rickie Lukens","Christian Feltz","Yohan Blair","Avi Schwartzman","Paige Harris"} Casino_Hacker_List[0]=Unselected_Text
	Casino_Gunman_List = {"Karl Abolaji","Gustavo Mota","Charlie Reed","Chester Mccoy","Patrick Mcreary"} Casino_Gunman_List[0]=Unselected_Text
	Casino_Driver_List = {"Karim Denz","Taliana Martinez","Eddie Toh","Zach Nelson","Chester Mccoy"} Casino_Driver_List[0]=Unselected_Text
    local we = {}
    	for i = 1,5 do
    		we[i] = 0
    	end
    local Casino_Gunman_menu=nil
    local ca = {}
    	for i = 1,5 do
    		ca[i] = 3
    	end
    local Casino_Driver_menu=nil
	Driver_Veh_List = {
		{"Issi Classic"  ,"ASBO"            ,"Kanjo"  ,"Sentinel Classic"},
		{"Manchez"       ,"Stryder"         ,"Defiler","Lectro"},
		{"Retinue MKII"  ,"Drift Yosemite"  ,"Sugoi"  ,"Jugular"},
		{"Sultan Classic","Gauntlet Classic","Elie"   ,"Komoda"},
		{"Zhaba"         ,"Vagrant"         ,"Outlaw" ,"Everon"}
	}
    local Casino_cuts = nil
	local Casino_Max_player_cut	
	local Casino_Current_choice = 1
    local Casino_Cut_List = {}
	Casino_Current_preset = 1
	Casino_Preset_Text = presets.Casino.Name
	Casino_Preset_List = {
		presets.Casino.Approach , -- 1
		presets.Casino.Mode     , -- 2
		presets.Casino.Target   , -- 3
		presets.Casino.Hacker   , -- 4
		presets.Casino.Gunman   , -- 5
		presets.Casino.Weapon   , -- 6
		presets.Casino.Driver   , -- 7
		presets.Casino.Car      , -- 8
		presets.Casino.Masks    , -- 9
		presets.Casino.Settings1, -- 10
		presets.Casino.Settings2, -- 11
		presets.Casino.Settings3  -- 12
	}
	Casino_Preset_base = {-1,1,3,4,1,1,1,1,1,{true,true},{false,false,true,false,true,false},{true,true}}

-- Cayo
    local Cayo_Disturbance_level = {"33%","66%","100%"} Cayo_Disturbance_level[0]="0%"
    local Cayo_Cuts_List = {}
	local Cayo_Player_cut_max
	Cayo_Heist_compound_table_List = {"H4LOOT_GOLD_C","H4LOOT_CASH_C","H4LOOT_PAINT"}
	Cayo_Heist_island_table_List   = {"H4LOOT_CASH_I","H4LOOT_WEED_I","H4LOOT_COKE_I"}

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
    local Numberplate_units_selection = settings.Numberplates.Unit
    Numberplate_units_Text_short = {"km/h", "m/s", "mi/h", "ft/s"}
    Numberplate_units_Text_numberplate = {"kmh", "mps", "mph", "fps"}
    Numberplate_units_value = {3.6, 1, 2.2369362921, 3.280839895}
    local Numberplate_speedometer_enabled = settings.Numberplates.Enabled
    local Numberplate_custom_enabled = settings.Numberplates.Custom.Enabled
    local Plate_menu = {}
    local Character_plate_List = {}
    for i = 1,8 do
    	Character_plate_List[i] = "Plate"
    end
    local Menu_keybindings = {}
    	Menu_keybindings[1] = config.Menu.KeyBindings.MenuToggle
    	Menu_keybindings[2] = config.Menu.KeyBindings.SelectKey
    	Menu_keybindings[3] = config.Menu.KeyBindings.BackKey
    	Menu_keybindings[4] = config.Menu.KeyBindings.UpKey
    	Menu_keybindings[5] = config.Menu.KeyBindings.DownKey
    	Menu_keybindings[6] = config.Menu.KeyBindings.RightKey
    	Menu_keybindings[7] = config.Menu.KeyBindings.LeftKey
    local Plate_Text = ""
    local Removed_cars = settings.RemovedCars
    local No_scratch_enabled = false
    local Noclip_up_hotkey
    local Noclip_down_hotkey
    local Noclip_forward_hotkey
    local Noclip_backward_hotkey
    local Noclip_turnleft_hotkey
    local Noclip_turnright_hotkey
    local Noclip_increasespeed_hotkey
    local Noclip_decreasespeed_hotkey
    local Noclip_bind = {}
    	Noclip_bind[1] = settings.Noclip.Up
    	Noclip_bind[2] = settings.Noclip.Down
    	Noclip_bind[3] = settings.Noclip.Forward
    	Noclip_bind[4] = settings.Noclip.Backward
    	Noclip_bind[5] = settings.Noclip.Turnleft
    	Noclip_bind[6] = settings.Noclip.Turnright
    	Noclip_bind[7] = settings.Noclip.Increasespeed
    	Noclip_bind[8] = settings.Noclip.Decreasespeed
    	Noclip_bind[9] = settings.Noclip.Toggle
    local Default_ragdoll = localplayer:get_no_ragdoll()
    local Default_292     = localplayer:get_config_flag(292)
    local Noclip_enabled = false
    local Noclip_Speed = 2
    local Boost_button_cars_data = {}
    local Boost_button_multiplier_percent = 100
    local Boost_button_boost_activate = true
    local Enable_transaction_error_bypass = false
    local Inventory_refill_hotkey = settings.RefillKey
    local Gay_car_Rainbow,Gay_car_Random,Gay_car_Strobelight = true, false, false
    local Gay_car_Is_Uniform = true
    local Gay_car_Multiplier  = 5
    local Gay_car_Affect_traffic = false
    local Cay_car_Color_style = 1
    local Gay_car_Vehicle_original_color = {999,999,999,999,999,999}
    local Gay_car_Uniform_toggle = false
    local Gay_car_Color_custom
    local Numberplate_orignial_plate = "________"
    local Rainbow_activated = false
	local Badsport_state = 1
	local Disable_autostop = false
-- Global tester
    local Global_tester_Mode_List = {"Globals","Stats","Scripts"}
    local Global_tester_Mode = 1
    local Global_tester_Type_List = {"int","string","bool","float"}
    local Global_tester_Type = 1
    local Global_tester_Scripts_List = {"fm_mission_controller","fm_mission_controller_2020","gb_gang_ops_planning","fmmc_launcher"}
    local Global_tester_Scripts = 1
    local Global_tester_Global_offset_use = false
    local Global_tester_Is_reading = false
    local Global_tester_Global_max_lenght = 10
    local Global_tester_Saved_globals_List = {}
    local Global_tester_Current_global = 0
    local Global_tester_current_global_List = {}
    for i = 1,Global_tester_Global_max_lenght do
        Global_tester_current_global_List[i] = 0
    end
    local Global_tester_Current_setter = 0
    local Global_tester_Current_setter_List = {}
    for i = 1,Global_tester_Global_max_lenght do
        Global_tester_Current_setter_List[i] = 0
    end
--


---- Functions

-- Casino
    local function Casino_H3Bit1(i,v) if v~=nil then stats.set_bool_masked(mpx().."H3OPT_BITSET1",v,i) else return stats.get_bool_masked(mpx().."H3OPT_BITSET1",i) end end
    local function Casino_H3Bit0(i,v) if v~=nil then stats.set_bool_masked(mpx().."H3OPT_BITSET0",v,i) else return stats.get_bool_masked(mpx().."H3OPT_BITSET0",i) end end
	local function Casino_Autotake_set(Cut)
		Player_max = Heist_max_take[1]
		if Casino_Current_choice == 1 then Player_max = Player_max-300000
		end

		if Cut == "NaN" then
			Player_max = math.floor(Player_max/(Casino_Max_player_cut/100))
		else
			Player_max = math.floor(Player_max/(((Cut+1)*5)/100))
		end

		Lst = globals.get_int(Casino_Cut_Lester_offset )
		Drv = globals.get_int(Casino_Cut_Driver_offset + stats.get_int(mpx().."H3OPT_CREWDRIVER"))
		Hck = globals.get_int(Casino_Cut_Hacker_offset + stats.get_int(mpx().."H3OPT_CREWHACKER"))
		Wep = globals.get_int(Casino_Cut_Gunman_offset + stats.get_int(mpx().."H3OPT_CREWWEAP"  ))

		Max_take = math.floor(Player_max/(1-((Lst+Drv+Hck+Wep))/100))

		if Max_take > 4438000 then Max_take = 4438000 end

		if HS():is_active() then
			HS():set_int(Casino_Real_take, Max_take)
		end
	end
	local function Casino_Approach_setup(AP)
		if AP == -1 or AP == 0 then
			AP = stats.get_int(mpx().."H3_LAST_APPROACH")
		end
		stats.set_int(mpx().."H3OPT_APPROACH", AP)
	
		if AP == 3 then
			Casino_last_approach = 2
		else
			Casino_last_approach = AP+1
		end
		stats.set_int(mpx().."H3_LAST_APPROACH", Casino_last_approach)
	
		if Casino_Hard_mode == 2 then
			stats.set_int(mpx().."H3_HARD_APPROACH", AP)
		else
			stats.set_int(mpx().."H3_HARD_APPROACH", Casino_last_approach)
		end
	end
	local function Casino_Setup_approach_H3Bit(AP)
		if AP == 1 then
			Casino_H3Bit1(5,true)
			Casino_H3Bit1(6,true)
			for i = 1,2 do
				Casino_H3Bit0((2*i)+1,Casino_Preset_List[9+AP][Casino_Current_preset][i])
			end
		elseif AP == 2 then
			Casino_H3Bit1(7,true)
			for i = 4,7 do -- Entry
				Casino_H3Bit0(2*i  ,Casino_Preset_List[9+AP][Casino_Current_preset][i-3])
				Casino_H3Bit0((2*i)+1,Casino_Preset_List[9+AP][Casino_Current_preset][i-3])
				end
			for i = 1,2 do -- Exit
				Casino_H3Bit0(15+i,Casino_Preset_List[9+AP][Casino_Current_preset][4+i])
			end
		elseif AP == 3 then
			Casino_H3Bit1(8,true)
			Casino_H3Bit1(9,true)
			for i = 1,2 do
				Casino_H3Bit0(18+i, Casino_Preset_List[9+AP][Casino_Current_preset][i])
			end
		else
			return false
		end
		return true
	end
	local function Casino_Get_weapon_list(AP)
		KaAb, ChRe, PaMc, ChMc, GuMo={}, {}, {}, {}, {}
		if AP == 1 then
			KaAb[0]=Casino_Crew_Gunman_MicroSMG 	 KaAb[1]=Casino_Crew_Gunman_Machinepistol
			ChRe[0]="SMG" 							 ChRe[1]=Casino_Crew_Gunman_Shotgun
			ChMc[0]=Casino_Crew_Gunman_MicroSMG 	 ChMc[1]=Casino_Crew_Gunman_Machinepistol
			PaMc[0]=Casino_Crew_Gunman_MicroSMG 	 PaMc[1]=Casino_Crew_Gunman_Machinepistol
		elseif AP == 2 then
			KaAb[0]=Casino_Crew_Gunman_MicroSMG 	 KaAb[1]=Casino_Crew_Gunman_Shotgun
			ChRe[0]=Casino_Crew_Gunman_Machinepistol ChRe[1]=Casino_Crew_Gunman_Shotgun
			ChMc[0]=Casino_Crew_Gunman_MicroSMG 	 ChMc[1]=Casino_Crew_Gunman_Shotgun
			PaMc[0]=Casino_Crew_Gunman_MicroSMG 	 PaMc[1]=Casino_Crew_Gunman_Shotgun
		elseif AP == 3 then
			KaAb[0]=Casino_Crew_Gunman_Shotgun	   	 KaAb[1]="Revolver"
			ChRe[0]="SMG" 						   	 ChRe[1]=Casino_Crew_Gunman_Shotgun
			ChMc[0]=Casino_Crew_Gunman_ShotgunMKII 	 ChMc[1]=Casino_Crew_Gunman_RifleMKII
			PaMc[0]=Casino_Crew_Gunman_Shotgun 	   	 PaMc[1]="Revolver"
		else
			KaAb[0],ChRe[0],ChMc[0],PaMc[0] = "Gun1","Gun1","Gun1","Gun1"
			KaAb[1],ChRe[1],ChMc[1],PaMc[1] = "Gun2","Gun2","Gun2","Gun2"
		end
		GuMo[0]=Casino_Crew_Gunman_Rifle GuMo[1]=Casino_Crew_Gunman_Shotgun
		return {KaAb,GuMo,ChRe,ChMc,PaMc}
	end

-- Cayo
    local function Cayo_Heist_weapon(v)
    	if v~=nil then
    		stats.set_int(mpx().."H4CNF_WEAPONS",v)
    	else
    		return stats.get_int(mpx().."H4CNF_WEAPONS")
    	end
    end
    local function Cayo_Heist_mission(i,v)
    	if v~=nil then
    		stats.set_bool_masked(mpx().."H4_MISSIONS",v,i)
    	else
    		return stats.get_bool_masked(mpx().."H4_MISSIONS",i)
    	end
    end
    local function Cayo_Heist_generator(i,v)
    	if v~=nil then
    		stats.set_bool_masked(mpx().."H4CNF_BS_GEN",v,i)
    	else
    		return stats.get_bool_masked(mpx().."H4CNF_BS_GEN",i)
    	end
    end


	local function Cayo_Heist_compound_table(i,select_loot_1,v)
		select_loot_2 = 2
		if select_loot_1 > 1 then select_loot_2 = select_loot_2 - 1 end

    	if v == nil then
			return stats.get_bool_masked(mpx()..Cayo_Heist_compound_table_List[select_loot_1],i)
    	else
    		if v and select_loot_1 <= 2 then
            	stats.set_bool_masked(mpx()..Cayo_Heist_compound_table_List[select_loot_2]           ,false,i)
            	stats.set_bool_masked(mpx()..Cayo_Heist_compound_table_List[select_loot_2].."_SCOPED",false,i)
    		end
        end
		stats.set_bool_masked(mpx()..Cayo_Heist_compound_table_List[select_loot_1]           ,v,i)
		stats.set_bool_masked(mpx()..Cayo_Heist_compound_table_List[select_loot_1].."_SCOPED",v,i)
	end
	local function Cayo_Heist_compound_table_set(n,v)
		if v==1 then
			Cayo_Heist_compound_table(n,1,true)
			Cayo_Heist_compound_table(n,2,false)
		elseif v==2 then
			Cayo_Heist_compound_table(n,1,false)
			Cayo_Heist_compound_table(n,2,true)
		else
			Cayo_Heist_compound_table(n,1,false)
			Cayo_Heist_compound_table(n,2,false)
		end
	end
	local function Cayo_Heist_compound_table_get(n)
		if Cayo_Heist_compound_table(n,1) then
			return 1
		elseif Cayo_Heist_compound_table(n,2) then
			return 2
		else
			return 0
		end
	end

	local function Cayo_Heist_island_table(i,select_loot,v)
		if v == nil then
			  return stats.set_bool_masked(mpx()..Cayo_Heist_island_table_List[select_loot],i)
		else
			if v then
				for j = 1,3 do
					if j ~= select_loot then
						stats.set_bool_masked(mpx()..Cayo_Heist_island_table_List[j]           ,false,i)
						stats.set_bool_masked(mpx()..Cayo_Heist_island_table_List[j].."_SCOPED",false,i)
					end
				end
			end
			stats.set_bool_masked(mpx()..Cayo_Heist_island_table_List[select_loot]           ,v,i)
			stats.set_bool_masked(mpx()..Cayo_Heist_island_table_List[select_loot].."_SCOPED",v,i)
		end
	end
	local function Cayo_Heist_island_table_set(n,v)
		if v~=nil then
			Cayo_Heist_island_table(n,v,true)
		else
			Cayo_Heist_island_table(n,1,false)
			Cayo_Heist_island_table(n,2,false)
			Cayo_Heist_island_table(n,3,false)
		end
	end
	local function Cayo_Heist_island_table_get(n)
		for i = 1,3 do
			if Cayo_Heist_island_table(n,i) then
				return i
			end
		end
		return 0
	end	

-- Doomapps
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
    local function Doomsday_Preperation_skip(i,v)
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
                    if not Doomsday_Preperation(i) and not Doomsday_Preperation_skip(i) then
                        Doomsday_Preperation(i,true)
                    end
                elseif i>3 and i<7 then
                    if not Doomsday_Preperation(i-1) and not Doomsday_Preperation_skip(i-1) then
                        Doomsday_Preperation(i-1,true)
                    end
    		    elseif i==7 or i==9 then
                    if not Doomsday_Preperation(i) and not Doomsday_Preperation_skip(i) and not Doomsday_Preperation(i-1) and not Doomsday_Preperation_skip(i-1) then
                        Doomsday_Preperation(i,true)
                        Doomsday_Preperation(i-1,true)
                    end
                end
            end
    	else
            return stats.get_bool_masked(mpx().."GANGOPS_FLOW_MISSION_PROG",i)
        end
    end
    local function Get_doomsday_act()
        for i = 1,3 do
            if stats.get_int(mpx().."gangops_heist_status")%4 == i or stats.get_int(mpx().."gangops_heist_status")%11 == i then
                return i
            end
        end
        return 0
    end
    local function Appartements_Missions(i,v)
        i = i*3
    	if v~=nil then
            stats.set_bool_masked(mpx().."HEIST_PLANNING_STAGE",v,i)
        else
            return stats.get_bool_masked(mpx().."HEIST_PLANNING_STAGE",i)
        end
    end
	local function Appartements_Get_15mil_cut()
		return math.floor(100*Heist_max_take[3] / globals.get_int(Appartements_Payout+stats.get_int("MPPLY_AVAILABLE_HEIST_PLAN")))
	end
	local function Appartments_15mil_cut_handler()
		local Cut = Appartements_Cut_List
		local Players = 2
		if stats.get_int("MPPLY_AVAILABLE_HEIST_FINALE") ~= 1 then
			Players = Players + 2
		end
	
		globals.set_int(Appartements_Cut_offset+1, 100 - (Cut[1] * Players))
		globals.set_int(Appartements_Cut_offset+2, Cut[2])
		if Players ~= 2 then
			globals.set_int(Appartements_Cut_offset+3, Cut[3])
			globals.set_int(Appartements_Cut_offset+4, Cut[4])
		end
	
		sleep(1)
		menu.send_key_press(13)
		sleep(1)
		menu.send_key_press(27)
		sleep(1)
	
		globals.set_int(Appartements_Cut_offset_l+1, Cut[1])
	end

-- Shapesift
    local function Shapeshift_Get_delay()
    	Delay, Increase = 0, 0.01
    	globals.set_int(Shapeshift_Trigger, 1)
    	while(true) do
    		Delay = Delay + Increase
    		sleep(Increase)
    		if globals.get_int(Shapeshift_Trigger) == 0 then
    			return Delay + Increase
    		end
    	end
    end
    local function Shapeshift_Set_model_hash(h)
    	Delay = Shapeshift_Get_delay()
    	Count = 0
    	while h ~= 0 do
    		myped = player.get_player_ped()
    		if not myped or myped:get_model_hash() == h or Count == 10 then
    			return
    		end
    		globals.set_int(Shapeshift_Trigger, 1)
    		if h then
    			globals.set_int(Shapeshift_Hash,h)
    		end
    		sleep(Delay)
    		globals.set_int(Shapeshift_Trigger,0)
    		globals.set_int(Shapeshift_Hash,0)
    		sleep(0.1)
    		Count = Count + 1
    	end
    end

-- Main
    local function Noclip_Up()
    	if not Noclip_enabled then return end
    	local New_pos = localplayer:get_position() + vector3(0,0,Noclip_Speed)

    	if not localplayer:is_in_vehicle() then
    		localplayer:set_position(New_pos)
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_position(New_pos)
    	end
    end
    local function Noclip_Down()
    	if not Noclip_enabled then return end
    	local New_pos = localplayer:get_position() + vector3(0,0,Noclip_Speed * -1)

    	if not localplayer:is_in_vehicle() then
    		localplayer:set_position(New_pos)
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_position(New_pos)
    	end
    end
    local function Noclip_Forwards()
    	if not Noclip_enabled then return end
    	local Direction = localplayer:get_heading()
    	local New_pos = localplayer:get_position() + (Direction * Noclip_Speed)

    	if not localplayer:is_in_vehicle() then
    		localplayer:set_position(New_pos)
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_position(New_pos)
    	end
    end
    local function Noclip_Backwards()
    	if not Noclip_enabled then return end
    	local Direction = localplayer:get_heading()
    	local New_pos = localplayer:get_position() + (Direction * Noclip_Speed * -1)

    	if not localplayer:is_in_vehicle() then
    		localplayer:set_position(New_pos)
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_position(New_pos)
    	end
    end
    local function Noclip_Turn_left()
    	if not Noclip_enabled then return end
    	local Direction = localplayer:get_rotation()

    	if not localplayer:is_in_vehicle() then
    		localplayer:set_rotation(Direction + vector3(0.25,0,0))
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_rotation(Direction + vector3(0.25,0,0))
    	end
    end
    local function Noclip_Turn_right()
    	if not Noclip_enabled then return end
    	local Direction = localplayer:get_rotation()

    	if not localplayer:is_in_vehicle() then
    		localplayer:set_rotation(Direction + vector3(0.25 * -1,0,0))
    	else
    		vehicle=localplayer:get_current_vehicle()
    		vehicle:set_rotation(Direction + vector3(0.25 * -1,0,0))
    	end
    end
    local function Noclip_Increase_speed()
    	if Noclip_Speed > 0 then 
    		Noclip_Speed = Noclip_Speed + 1
    	end
    end
    local function Noclip_Decrease_speed()
    	if Noclip_Speed > 1 then 
    		Noclip_Speed = Noclip_Speed - 1
    	end
    end
    local function Switch_vehicle_enabled_state()
        for i = 1,#Disabled_vehicle_List do
            globals.set_bool(Disabled_vehicle_List[i], Removed_cars)
        end
    end
    local function Refill_inventory()
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
    local function Noclip(e)
    	if not localplayer then return end
    	if e then 
    		localplayer:set_freeze_momentum(true) 
    		localplayer:set_no_ragdoll(true)
    		localplayer:set_config_flag(292,true)
    		Noclip_up_hotkey            = menu.register_hotkey(Noclip_bind[1], Noclip_Up)
    		Noclip_down_hotkey          = menu.register_hotkey(Noclip_bind[2], Noclip_Down)
    		Noclip_forward_hotkey       = menu.register_hotkey(Noclip_bind[3], Noclip_Forwards)
    		Noclip_backward_hotkey      = menu.register_hotkey(Noclip_bind[4], Noclip_Backwards)
    		Noclip_turnleft_hotkey      = menu.register_hotkey(Noclip_bind[5], Noclip_Turn_left)
    		Noclip_turnright_hotkey     = menu.register_hotkey(Noclip_bind[6], Noclip_Turn_right)
    		Noclip_increasespeed_hotkey = menu.register_hotkey(Noclip_bind[7], Noclip_Increase_speed)
    		Noclip_decreasespeed_hotkey = menu.register_hotkey(Noclip_bind[8], Noclip_Decrease_speed)
    	else
    		localplayer:set_freeze_momentum(false)
    		localplayer:set_no_ragdoll(Default_ragdoll)
    		localplayer:set_config_flag(292,Default_292)
    		menu.remove_hotkey(Noclip_up_hotkey)
    		menu.remove_hotkey(Noclip_down_hotkey)
    		menu.remove_hotkey(Noclip_forward_hotkey)
    		menu.remove_hotkey(Noclip_backward_hotkey)
    		menu.remove_hotkey(Noclip_turnleft_hotkey)
    		menu.remove_hotkey(Noclip_turnright_hotkey)
    		menu.remove_hotkey(Noclip_increasespeed_hotkey)
    		menu.remove_hotkey(Noclip_decreasespeed_hotkey)
    	end
    end
    local function Custom_plates()
    	Custom_plates_manager_menu:clear()
    	if settings.Numberplates.Custom.Platelist ~= nil then
    		for i = 1,#settings.Numberplates.Custom.Platelist do
    			if i == settings.Numberplates.Custom.Platedefault then
    				plt = "*"
    			else
    				plt = "_"
    			end
    			Plate_menu[i] = Custom_plates_manager_menu:add_submenu(settings.Numberplates.Custom.Platelist[i] .. plt)
    			Text("_________________" .. settings.Numberplates.Custom.Platelist[i] .. plt .. "_______________",Plate_menu[i])
    			-- Choose by default
    			if plt == "_" then
    				Plate_menu[i]:add_action(Numberplate_Custom_Choose,function() settings.Numberplates.Custom.Platedefault = i Save_settings() end)
    			end
    			-- Apply
    			if Get_player_vehicle(localplayer) then
					Vehicle = Get_player_vehicle(localplayer)
    				Plate_menu[i]:add_action(Numberplate_Custom_Apply,function() Vehicle:set_number_plate_text(settings.Numberplates.Custom.Platelist[i]) end)
    			end
    			-- Delete
    			Plate_menu[i]:add_action(Numberplate_Custom_Delete,
    			function()
    				if #settings.Numberplates.Custom.Platelist ~= 1 then
    					for j = i,#settings.Numberplates.Custom.Platelist-1 do
    						settings.Numberplates.Custom.Platelist[j] = settings.Numberplates.Custom.Platelist[j+1]
    					end
    				else
    					settings.Numberplates.Custom.Platelist = {}
    				end
    				Save_settings()
    			end)
    		end
    	end
    end
    local function Gay_car_Random_color(Color_red, Color_green, Color_blue)
    	slp = 0.5
    	if Gay_car_Affect_traffic then slp = 0.03 end
    	sleep(slp / Gay_car_Multiplier)
    	return math.random(0,255), math.random(0,255), math.random(0,255)
    end 
    local function Gay_car_Strobelight(Color_red, Color_green, Color_blue)
    	local slp = 0.8
    	if Gay_car_Affect_traffic then slp = 0.02 end
    	if Color_red == 255 then
    		Color_red, Color_green, Color_blue = 0, 0, 0
    	else
    		Color_red, Color_green, Color_blue = 255, 255, 255
    	end
    	if not Gay_car_Is_Uniform and Gay_car_Uniform_toggle then
    		Gay_car_Uniform_toggle = not Gay_car_Uniform_toggle
    	else 
    		sleep(slp / Gay_car_Multiplier)
    		Gay_car_Uniform_toggle = true
    	end
    	return Color_red, Color_green, Color_blue
    end 
    local function Gay_car_Next_color(Color_red, Color_green, Color_blue)
    	if (Color_red > 0 and Color_blue == 0 and Color_green == 0 and not (Color_red >= 255)) then
    		Color_red = Color_red + 1 * Gay_car_Multiplier
    	elseif (Color_red > 0 and Color_blue == 0) then
    		Color_red = Color_red - 1 * Gay_car_Multiplier
    		Color_green = Color_green + 1 * Gay_car_Multiplier
    	elseif (Color_green > 0 and Color_red == 0) then
    		Color_green = Color_green - 1 * Gay_car_Multiplier
    		Color_blue = Color_blue + 1 * Gay_car_Multiplier
    	elseif (Color_blue > 0 and Color_green == 0) then
    		Color_red = Color_red + 1 * Gay_car_Multiplier
    		Color_blue = Color_blue - 1 * Gay_car_Multiplier
    	else
    		Color_red = Color_red + 1 * Gay_car_Multiplier
            Color_green = Color_green - 1 * Gay_car_Multiplier
            Color_blue = Color_blue - 1 * Gay_car_Multiplier
    	end
    
        -- Clamp the color values to the range of 0-255
        Color_red   = math.max(0, math.min(255, Color_red))
        Color_green = math.max(0, math.min(255, Color_green))
        Color_blue  = math.max(0, math.min(255, Color_blue))
    
    	return Color_red, Color_green, Color_blue
    end 
    local function Gay_car_Toggle_color_function(colorFunc)
    	local Rainbow_thingy_List = {false,false,true,false,false}
    	Gay_car_Rainbow = Rainbow_thingy_List[4-colorFunc]
    	Gay_car_Strobelight = Rainbow_thingy_List[5-colorFunc]
    	Gay_car_Random = Rainbow_thingy_List[6-colorFunc]
    end
    local function Gay_car_Change_vehicle_color(vehicle, colorFunc)
    	local red, green, blue = vehicle:get_custom_primary_colour()
    	local red2, green2, blue2 = vehicle:get_custom_secondary_colour()
    	red, green, blue = colorFunc(red, green, blue)
    	vehicle:set_custom_primary_colour(red, green, blue)
    	if Gay_car_Is_Uniform then
    		vehicle:set_custom_secondary_colour(red, green, blue)
    	else
    		red2, green2, blue2 = colorFunc(red2, green2, blue2)
    		--Make sure we actually produce non-Gay_car_Is_Uniform colors
    		if math.abs(red2 - red ) < 20 and math.abs(blue2 - blue) < 20 and math.abs(green2 - green) < 20 then
    			red2, blue2, green2 = 255, 0, 0
    		end
    		vehicle:set_custom_secondary_colour(red2, green2, blue2)
    	end
    end
    local function Boost_button_Boost_vehicle(Vehicle_data, hash, vehicle, boost)
    	if boost then --boost mode
    		accel = Vehicle_data[1] * (17 * (Boost_button_multiplier_percent / 100))
    		brake_force = Vehicle_data[2] * (23 * (Boost_button_multiplier_percent / 100))
    		gravity = 19.7
    		handbrake_force = Vehicle_data[4] * (14 * (Boost_button_multiplier_percent / 100))
    		initial_drive_force = Vehicle_data[5] * (690 * (Boost_button_multiplier_percent / 100))   --nice
    		traction_min = 6 + (2 * (Boost_button_multiplier_percent / 100))   --very high traction. Used without roll_centre modification, the car will constantly flip
    		traction_max = Vehicle_data[7] + (2 * (Boost_button_multiplier_percent / 100))
    		traction_bias_front = 0.420
    		up_shift = 10000  --huge shift values, causing cars to get stuck in gear and accelerate rapidly
    		down_shift = 10000
    		max_flat_vel = 10000
    		collision_dmg_multiplier = 0
    		engine_dmg_multiplier = 0
    		if Boost_button_multiplier_percent >= 100 then
    			--Dont Increase the following roll_centre variables more than 100%. Makes things flip.
    			Boost_button_multiplier_percent = 100
    		end
    		roll_centre_front = Vehicle_data[15] + (0.300 * (Boost_button_multiplier_percent / 100)) --these two stop the car from rolling even at high speeds, it rolls inwards instead
    		roll_centre_rear = Vehicle_data[16] + (0.300 * (Boost_button_multiplier_percent	/ 100))
    		drive_bias = 0.5   --all wheel drive
    		traction_loss_mult = 1
    		initial_drag_coeff = 1  --no drag forces
    	else --restore mode
    		accel = Vehicle_data[1]
    		brake_force = Vehicle_data[2]
    		gravity = Vehicle_data[3]
    		handbrake_force = Vehicle_data[4]
    		initial_drive_force = Vehicle_data[5]
    		traction_min = Vehicle_data[6]
    		traction_max = Vehicle_data[7]
    		traction_bias_front = Vehicle_data[8]
    		up_shift = Vehicle_data[9]
    		down_shift = Vehicle_data[10]
    		max_flat_vel = Vehicle_data[11]
    		--mass_offset = Vehicle_data[12]
    		collision_dmg_multiplier = Vehicle_data[13]
    		engine_dmg_multiplier = Vehicle_data[14]
    		roll_centre_front = Vehicle_data[15]
    		roll_centre_rear = Vehicle_data[16]
    		drive_bias = Vehicle_data[17]
    		traction_loss_mult = Vehicle_data[18]
    		initial_drag_coeff = Vehicle_data[19]
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
    local function Boost_button_Reload_vehicle(vehicle)
    	if not vehicle then return end
    	--Check if car has been found in the table, then restore, otherwise exit
    	restore = Boost_button_cars_data[vehicle:get_model_hash()]
    	if restore then
    		Boost_button_Boost_vehicle(restore, vehicle:get_model_hash(), vehicle, false)
    	end
    end
    local function Boost_button_Car_boost()
    	if Get_player_vehicle(localplayer) then 
    		current = Get_player_vehicle(localplayer)
    		if current == nil then return end

    		current:set_boost_enabled(false)
    		sleep(0.1)
    		if current:get_gravity() ~= 19.7 and Boost_button_boost_activate and not current:get_boost_enabled() and current:get_acceleration() > 0 and current:get_acceleration() < 1 then
            
    			::retry::
    			--Save car data to map if its not in there already
    			if not Boost_button_cars_data[current:get_model_hash()] then
    				Boost_button_cars_data[current:get_model_hash()] = {
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
    			Boost_button_Boost_vehicle(Boost_button_cars_data[current:get_model_hash()], current:get_model_hash(), current, true)
            
    			--Check if the boost worked, else reload the vehicle object again and try once more
    			--This is usually necessary when changing to a new car of the same type, or when the old one gets destroyed and called back
    			if current:get_gravity() ~= 19.7 then
    				Boost_button_cars_data[current:get_model_hash()] = nil
    				goto retry
    			end
    		else
    			Boost_button_Reload_vehicle(current)
    		end
    	end
    end
-- Global tester
    local function Global_Tester_Get_global(global, mode)
        if mode == Global_tester_Type_List[1] then
            return tostring(globals.get_int(global))
        elseif mode == Global_tester_Type_List[2] then
            return globals.get_string(global)
        elseif mode == Global_tester_Type_List[3] then
            return tostring(globals.get_bool(global))
        elseif mode == Global_tester_Type_List[4] then
            return tostring(globals.get_float(global))
        end
    end
    local function Global_Tester_Set_global(global, value, mode)
        if mode == Global_tester_Type_List[1] then
            return globals.set_int(global, value)
        elseif mode == Global_tester_Type_List[2] then
            return globals.set_string(global, value)
        elseif mode == Global_tester_Type_List[3] then
            return globals.set_bool(global, value)
        elseif mode == Global_tester_Type_List[4] then
            return globals.set_float(global, value)
        end
    end
    
    local function Global_Tester_Get_stat(stat, mode)
        if mode == Global_tester_Type_List[1] then
            return stats.get_int(stat)
        elseif mode == Global_tester_Type_List[2] then
            return stats.get_string(stat)
        elseif mode == Global_tester_Type_List[3] then
            return stats.get_bool(stat)
        elseif mode == Global_tester_Type_List[4] then
            return stats.get_float(stat)
        end
    end
    local function Global_Tester_Set_stat(stat, value, mode)
        if mode == Global_tester_Type_List[1] then
            return stats.set_int(stat, value)
        elseif mode == Global_tester_Type_List[2] then
            return stats.set_string(stat, value)
        elseif mode == Global_tester_Type_List[3] then
            return stats.set_bool(stat, value)
        elseif mode == Global_tester_Type_List[4] then
            return stats.set_float(stat, value)
        end
    end
    
    local function Global_Tester_Get_script(stat, mode)
        local Current_script = script(Global_tester_Scripts_List[Global_tester_Scripts])
        if mode == Global_tester_Type_List[1] then
            return Current_script:get_int(stat)
        elseif mode == Global_tester_Type_List[2] then
            return Current_script:get_string(stat)
        elseif mode == Global_tester_Type_List[3] then
            return Current_script:get_bool(stat)
        elseif mode == Global_tester_Type_List[4] then
            return Current_script:get_float(stat)
        end
    end
    local function Global_Tester_Set_script(global, value, mode)
        local Current_script = script(Global_tester_Scripts_List[Global_tester_Scripts])
        if mode == Global_tester_Type_List[1] then
            return Current_script:set_int(global, value)
        elseif mode == Global_tester_Type_List[2] then
            return Current_script:set_string(global, value)
        elseif mode == Global_tester_Type_List[3] then
            return Current_script:set_bool(global, value)
        elseif mode == Global_tester_Type_List[4] then
            return Current_script:set_float(global, value)
        end
    end
--


Get_disabled_vehicle_List()
Switch_vehicle_enabled_state()
Heist_Selector_setup()


------------------------
-------- Casino --------

----    Setup
local Casino_Setup_menu=Casino_menu:add_submenu(Casino_Setup_Submenu)


Casino_Setup_menu:add_array_item(Casino_Setup_Mode, Casino_Preset_Text,
    function()
		return Casino_Current_preset
    end,
    function(v)
		Casino_Current_preset = v
		Casino_Hard_mode = Casino_Preset_List[2][Casino_Current_preset]

		AP = Casino_Preset_List[1][Casino_Current_preset]
		if AP == -1 then
			AP = stats.get_int(mpx().."H3_LAST_APPROACH")
		end

		Casino_Approach_setup(AP)
		Casino_Setup_approach_H3Bit(AP)
		stats.set_int(mpx().."H3OPT_TARGET", Casino_Preset_List[3][Casino_Current_preset])

    	for i = 0,4 do
    		Casino_H3Bit1(i,true)
    	end
    	Casino_H3Bit0(1,true)
    	Casino_H3Bit0(2,true)
    	stats.set_int(mpx().."H3OPT_KEYLEVELS", 2)

		if stats.get_int(mpx().."H3OPT_CREWHACKER") < 1 or stats.get_int(mpx().."H3OPT_CREWHACKER") > 5 then
    		stats.set_int(mpx().."H3OPT_CREWHACKER",Casino_Preset_List[4][Casino_Current_preset])
		end
		if stats.get_int(mpx().."H3OPT_CREWWEAP") < 1 or stats.get_int(mpx().."H3OPT_CREWWEAP") > 4 then
    		stats.set_int(mpx().."H3OPT_CREWWEAP",Casino_Preset_List[5][Casino_Current_preset])
		end
		if stats.get_int(mpx().."H3OPT_CREWDRIVER") < 1 or stats.get_int(mpx().."H3OPT_CREWDRIVER") > 4 then
    		stats.set_int(mpx().."H3OPT_CREWDRIVER",Casino_Preset_List[7][Casino_Current_preset])
		end
		if stats.get_int(mpx().."H3OPT_MASKS") < 1 or stats.get_int(mpx().."H3OPT_MASKS") > 13 then
			stats.set_int(mpx().."H3OPT_MASKS", Casino_Preset_List[9][Casino_Current_preset])
		end

    	stats.set_int(mpx().."H3OPT_WEAPS", Casino_Preset_List[6][Casino_Current_preset])
    	stats.set_int(mpx().."H3OPT_VEHS", Casino_Preset_List[8][Casino_Current_preset])
    	stats.set_int(mpx().."H3OPT_DISRUPTSHIP", 3)
    end
)

Text(Manual_Text,Casino_Setup_menu)


-- Approach
Casino_Setup_menu:add_array_item(Casino_Approach_choice,  Casino_Approach_List , function() return stats.get_int(mpx().."H3OPT_APPROACH") end,	function(AP) Casino_Approach_setup(AP) end)
Casino_Setup_menu:add_array_item(Casino_Approach_setmode, Heist_difficulty_list, function() return Casino_Hard_mode end,
	function(mode)
		Casino_Hard_mode = mode
		Casino_Approach_setup(stats.get_int(mpx().."H3OPT_APPROACH"))
	end
	)

Casino_Setup_menu:add_array_item(Casino_Setup_target_choise, Casino_Target_List, function() return stats.get_int(mpx().."H3OPT_TARGET") end, function(t) stats.set_int(mpx().."H3OPT_TARGET", t) end)


-- Main
for i=0,1 do
	Casino_Setup_menu:add_toggle(Casino_Setup_missions_List1[i], function() return Casino_H3Bit1(i) end,
		function()
			Casino_H3Bit1(i,not Casino_H3Bit1(i))
			if i == 0 then
				if not Casino_H3Bit1(i) then
					stats.set_int("MP"..mpx().."_H3OPT_BITSET1",0)
					stats.set_int(mpx().."H3OPT_BITSET0",0)
				end
			end
		end)
end
Casino_Setup_menu:add_toggle(Casino_Setup_missions_List1[4], function() return Casino_H3Bit1(4) end, function() Casino_H3Bit1(4,not Casino_H3Bit1(4)) end)

local Casino_Approach_settings_menu=nil
local function Casino_Current_AP_settings()
	Casino_Approach_settings_menu:clear()

	-- Silent and Sneaky
	if stats.get_int(mpx().."H3OPT_APPROACH")==1 then
		Text(Casino_Approach_settings_silentnsneaky,Casino_Approach_settings_menu)
		Casino_Approach_settings_menu:add_toggle(Casino_Setup_missions_List0[5], function() return Casino_H3Bit0(5) end, function() Casino_H3Bit0(5,not Casino_H3Bit0(5)) end)
		Casino_Approach_settings_menu:add_toggle(Casino_Setup_missions_List0[3], function() return Casino_H3Bit0(3) end, function() Casino_H3Bit0(3,not Casino_H3Bit0(3)) end)
	
	-- The Big Con
	elseif stats.get_int(mpx().."H3OPT_APPROACH")==2 then
		Text(Casino_Approach_settings_thebigcon,Casino_Approach_settings_menu)
		Casino_Approach_settings_menu:add_toggle(Casino_Setup_missions_List1[7], function() return Casino_H3Bit1(7) end, function() Casino_H3Bit1(7,not Casino_H3Bit1(7)) end)
		Text(Casino_Approach_settings_thebigcon_entrydesguise,Casino_Approach_settings_menu)
		for i=8,15 do
			Casino_Approach_settings_menu:add_toggle(Casino_Setup_missions_List0[i], function() return Casino_H3Bit0(i) end,
				function()
					Casino_H3Bit0(i,not Casino_H3Bit0(i))
					if i%2~=0 then
						if Casino_H3Bit0(i)then
							Casino_H3Bit0(i-1,true)
						end
					end
				end
			)
		end
		Text(Casino_Approach_Settings_Thebigcon_exitdesguise,Casino_Approach_settings_menu)
		for i=16,17 do
			Casino_Approach_settings_menu:add_toggle(Casino_Setup_missions_List0[i], function() return Casino_H3Bit0(i) end, function() Casino_H3Bit0(i,not Casino_H3Bit0(i)) end)
		end

	-- Agressive
	elseif stats.get_int(mpx().."H3OPT_APPROACH")==3 then
		Text(Casino_Approach_settings_aggressive,Casino_Approach_settings_menu)
		for i=19,20 do
			Casino_Approach_settings_menu:add_toggle(Casino_Setup_missions_List0[i], function() return Casino_H3Bit0(i) end, function() Casino_H3Bit0(i,not Casino_H3Bit0(i)) end)
		end

	-- None Detected
	else
		Text("    No Approach detected",Casino_Approach_settings_menu)
		Text("Try going back to MainMenu once",Casino_Approach_settings_menu)
	end
end
Casino_Approach_settings_menu=Casino_Setup_menu:add_submenu(Casino_Approach_Settings_Submenu,Casino_Current_AP_settings)


-- Crew+Masks
Casino_Setup_menu:add_array_item(Casino_Crew_Hacker, Casino_Hacker_List, function() return stats.get_int(mpx().."H3OPT_CREWHACKER") end, function(Hkr) stats.set_int(mpx().."H3OPT_CREWHACKER", Hkr) end)

local function Casino_Weapon_Menu()
	Casino_Gunman_menu:clear()
	Text(Casino_Crew_Gunman_choise, Casino_Gunman_menu)

	WEP=stats.get_int(mpx().."H3OPT_CREWWEAP")
	AP=stats.get_int(mpx().."H3OPT_APPROACH")
	Wa=stats.get_int(mpx().."H3OPT_WEAPS")
	Casino_Gunman_select_star = {"", "", "", "", ""}

	if WEP>=1 and WEP <= 5 then
		Casino_Gunman_select_star[WEP] = "*"
	end

	Casino_Gunman_gun_List = Casino_Get_weapon_list(AP)

	for i = 1,5 do
		Casino_Gunman_menu:add_array_item(Casino_Gunman_List[i]..Casino_Gunman_select_star[i], Casino_Gunman_gun_List[i],
			function()
				if WEP ~= i then
					return we[i]
				else
					return Wa
				end
			end,
			function(w)
				we[i]=w
				stats.set_int(mpx().."H3OPT_CREWWEAP", i)
				stats.set_int(mpx().."H3OPT_WEAPS", we[i])
			end
		)
	end
	Casino_Gunman_menu:add_toggle(Casino_Setup_missions_List1[2],function()return Casino_H3Bit1(2)end,function()Casino_H3Bit1(2,not Casino_H3Bit1(2))end)
end
Casino_Gunman_menu = Casino_Setup_menu:add_submenu(Casino_Crew_Gunman_Submenu,Casino_Weapon_Menu)

local function Casino_Vehicle_Menu()
	Casino_Driver_menu:clear()
	Casino_Driver_menu:add_action(Casino_Crew_Driver_choise, function() end)

	CAR=stats.get_int(mpx().."H3OPT_VEHS")+1
	Drv=stats.get_int(mpx().."H3OPT_CREWDRIVER")
	Casino_Driver_select_star = {"", "", "", "", ""}

	if CAR >=1 and CAR <= 5 then
		Casino_Driver_select_star[CAR] = "*"
	end
	
	for i = 1,5 do
		Casino_Driver_menu:add_array_item(Casino_Driver_List[i]..Casino_Driver_select_star[i], Driver_Veh_List[i],
			function()
				if not CAR then
					return ca[i]
				else
					return CAR
				end
			end,
			function(v)
				ca[i] = v
				stats.set_int(mpx().."H3OPT_CREWDRIVER", i)
				stats.set_int(mpx().."H3OPT_VEHS", ca[i])
			end
		)
	end
    Casino_Driver_menu:add_toggle(Casino_Setup_missions_List1[3],function()return Casino_H3Bit1(3)end,function()Casino_H3Bit1(3,not Casino_H3Bit1(3))end)
end
Casino_Driver_menu=Casino_Setup_menu:add_submenu(Casino_Crew_Driver_Submenu,Casino_Vehicle_Menu)

Casino_Setup_menu:add_array_item(Casino_Crew_Mask, Casino_Mask_List,
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




Casino_Common_menu=Casino_Setup_menu:add_submenu(Casino_Setup_common_Submenu)

Casino_Common_menu:add_array_item(Casino_Setup_common_pass_level, { None_Text, "Lv.1", "Lv.2" }, function() return stats.get_int(mpx().."H3OPT_KEYLEVELS")+1 end, function(SPss) stats.set_int(mpx().."H3OPT_KEYLEVELS", SPss-1) end)
for i=1,2 do
	Casino_Common_menu:add_toggle(Casino_Setup_missions_List0[i], function() return Casino_H3Bit0(i) end, function() Casino_H3Bit0(i,not Casino_H3Bit0(i)) end)
	end
Casino_Common_menu:add_array_item(Casino_Setup_common_shipment, {"0%","33%","66%","100%"}, function() return stats.get_int(mpx().."H3OPT_DISRUPTSHIP")+1 end,
		function(DugS)
		    if DugS>1 then
	    		DuSh=4
				stats.set_int(mpx().."H3OPT_DISRUPTSHIP",DugS-1)
		    	Casino_H3Bit0(2,true)
			else
				DuSh=0
				stats.set_int(mpx().."H3OPT_DISRUPTSHIP", 0)
			end
		end
	)

Casino_Common_menu:add_toggle(Casino_Setup_missions_List0[4], function() return Casino_H3Bit0(4) end, function() return Casino_H3Bit0(4,not Casino_H3Bit0(4)) end)
for i=6,7 do
	Casino_Common_menu:add_toggle(Casino_Setup_missions_List0[i], function() return Casino_H3Bit0(i) end, function() Casino_H3Bit0(i,not Casino_H3Bit0(i)) end)
end


----    Cuts
local function Casino_Cut_Menu()
    Casino_Cut_menu:clear()
	P = {}
	Casino_Cut_List = {}
	temp = 3
	P[1],P[2],P[3],P[4] = Notinheist_Text,nil,nil,nil
    
	for i = 1,4 do
		if globals.get_int(Casino_Cut_offset+i)>=0 then if player.get_player_ped(i-1)==localplayer then P[i]=You_Text else P[i]=player.get_player_name(i-1) end end
	end

	Text(Cut_player,Casino_Cut_menu)

	for i = 1,4 do
    	if P[i] then
			Casino_Cut_List[i] = globals.get_int(Casino_Cut_offset+i)
    	    Casino_Cut_menu:add_array_item(Cut_Player_List[i]..""..P[i], Cut_percent, function() return math.floor(Casino_Cut_List[i]/5-1) end, function(p) Casino_Cut_List[i] = (p+1)*5 end)
    	end
	end

	Casino_Cut_menu:add_array_item(Cut_slider, Cut_percent,
		function()
			Casino_Max_player_cut = Heist_Get_max_cut(P, Casino_Cut_List)
			return math.floor(Casino_Max_player_cut/5)-1
		end,
		function(p)
			for i = 1,4 do
				Casino_Cut_List[i] = (p+1)*5
			end
		end)
	
    Casino_Cut_menu:add_array_item(Set_Text, Heist_cut_selector_Text, function() return 1 end,
		function(Casino_Cut_selector)
    	    if Casino_Cut_selector ~= 1 then
				Casino_Cut_List[i] = Heist_cut_selector_list[Casino_Cut_selector]
    	    end
			Casino_Max_player_cut = Heist_Get_max_cut(P, Casino_Cut_List)
			for i =1,4 do
				if P[i] then
					globals.set_int(Casino_Cut_offset+i, Casino_Cut_List[i])
				end
			end
    	end
	)

	Text(Cut_Crew1,Casino_Cut_menu)
	Text(Cut_Crew2,Casino_Cut_menu)
	Text(Cut_Crew3,Casino_Cut_menu)

	Drv = stats.get_int(mpx().."H3OPT_CREWDRIVER")
	Hck = stats.get_int(mpx().."H3OPT_CREWHACKER")
	Wep = stats.get_int(mpx().."H3OPT_CREWWEAP")

	Casino_Cut_menu:add_array_item("Lester"               , Cut_percent_Full , function() return globals.get_int(Casino_Cut_Lester_offset)     end, function(p) globals.set_int(Casino_Cut_Lester_offset    , p) end)
	Casino_Cut_menu:add_array_item(Casino_Crew_Driver_Only, Cut_percent_Full , function() return globals.get_int(Casino_Cut_Driver_offset+Drv) end, function(q) globals.set_int(Casino_Cut_Driver_offset+Drv, q) end)
	Casino_Cut_menu:add_array_item(Casino_Crew_Hacker_Only, Cut_percent_Full , function() return globals.get_int(Casino_Cut_Hacker_offset+Hck) end, function(r) globals.set_int(Casino_Cut_Hacker_offset+Hck, r) end)
	Casino_Cut_menu:add_array_item(Casino_Crew_Gunman_Only, Cut_percent_Full , function() return globals.get_int(Casino_Cut_Gunman_offset+Wep) end, function(s) globals.set_int(Casino_Cut_Gunman_offset+Wep, s) end)
end
Casino_Cut_menu=Casino_menu:add_submenu(Casino_Cut_Submenu, Casino_Cut_Menu)


----    Extras
local Casino_Choose_autotake = {"Safe","Max"}


local function Casino_Heist_Menu()
	Casino_In_heist_menu:clear()

	Casino_In_heist_menu:add_action(Casino_Extras_keypad,
			function()
    		    if HS():is_active() and HS():get_int(Casino_Keypad)>=3 and HS():get_int(Casino_Keypad)<100 then
    	        HS():set_int(Casino_Keypad, 5)
    		    end
    		end
		)

	Casino_In_heist_menu:add_action(Casino_Extras_fingerprint,
			function()
			    if HS():is_active() and HS():get_int(Casino_Fingerprint)==3 or HS():get_int(Casino_Fingerprint)==4 then
			    HS():set_int(Casino_Fingerprint, 5)
	    	    end
	    	end
		)

	Casino_In_heist_menu:add_action(Casino_Extras_drill_door,
			function()
			    if HS():is_active() and HS():get_int(Casino_Drill_total)>=0 or HS():get_int(Casino_Drill_total)<=100 then
	    		    HS():set_int(Casino_Drill_stat, HS():get_int(Casino_Drill_total))
	    	    end
	    	end
		)
	-------------------------------------------------------
	
	Casino_In_heist_menu:add_array_item("Risk →", Casino_Choose_autotake, function() return Casino_Current_choice end, function(h) Casino_Current_choice = h end)
	if Casino_Max_player_cut ~= nil then
		Casino_In_heist_menu:add_action("Auto take with defined cuts",
			function()
				Casino_Autotake_set("NaN")
			end
		)
	else
		local Cut_take = (85/5)-1
		Casino_In_heist_menu:add_array_item("Auto take with max cuts →",Cut_percent,
			function()
				return Cut_take
			end,
			function(h)
				Cut_take = h
				Casino_Autotake_set(Cut_take)
			end
		)
	end
end

Casino_In_heist_menu=Casino_menu:add_submenu(Extras_Submenu,Casino_Heist_Menu)

Casino_menu:add_action(Cooldown_skip,
	function()
		stats.set_int(mpx() .. "H3_COMPLETEDPOSIX", -1)
		stats.set_int("MPPLY_H3_COOLDOWN", -1)
	end
)


-- Preset Editor
local function Casino_Preset_editor_Menu()
	Casino_Preset_editor_menu:clear()
	Text(Presets_Common_utility,Casino_Preset_editor_menu)
	Casino_Preset_editor_menu:add_action(Presets_Common_create,
		function()
			for i = 1,#Casino_Preset_List do
				Casino_Preset_List[i][#Casino_Preset_List[i]+1] = Casino_Preset_base[i]
			end
			Casino_Preset_Text[#Casino_Preset_Text+1] = Presets_Common_preset..tostring(#Casino_Preset_Text+1)

			presets.Casino.Name      = Casino_Preset_Text
			presets.Casino.Approach  = Casino_Preset_List[01]
			presets.Casino.Mode      = Casino_Preset_List[02]
			presets.Casino.Target    = Casino_Preset_List[03]
			presets.Casino.Hacker    = Casino_Preset_List[04]
			presets.Casino.Gunman    = Casino_Preset_List[05]
			presets.Casino.Weapon    = Casino_Preset_List[06]
			presets.Casino.Driver    = Casino_Preset_List[07]
			presets.Casino.Car       = Casino_Preset_List[08]
			presets.Casino.Masks     = Casino_Preset_List[09]
			presets.Casino.Settings1 = Casino_Preset_List[10]
			presets.Casino.Settings2 = Casino_Preset_List[11]
			presets.Casino.Settings3 = Casino_Preset_List[12]
			Save_settings(Settings_JSON_filename,settings)
		end
	)
	Casino_Preset_editor_menu:add_array_item(Presets_Common_delete,Casino_Preset_Text,function() return 1 end,
		function(a)
			if a ~= #Casino_Preset_Text then
				for i = a,#Casino_Preset_Text do
					Casino_Preset_Text    [i] = Casino_Preset_Text    [i+1]
					Casino_Preset_List[01][i] = Casino_Preset_List[01][i+1]
					Casino_Preset_List[02][i] = Casino_Preset_List[02][i+1]
					Casino_Preset_List[03][i] = Casino_Preset_List[03][i+1]
					Casino_Preset_List[04][i] = Casino_Preset_List[04][i+1]
					Casino_Preset_List[05][i] = Casino_Preset_List[05][i+1]
					Casino_Preset_List[06][i] = Casino_Preset_List[06][i+1]
					Casino_Preset_List[07][i] = Casino_Preset_List[07][i+1]
					Casino_Preset_List[08][i] = Casino_Preset_List[08][i+1]
					Casino_Preset_List[09][i] = Casino_Preset_List[09][i+1]
					Casino_Preset_List[10][i] = Casino_Preset_List[10][i+1]
					Casino_Preset_List[11][i] = Casino_Preset_List[11][i+1]
					Casino_Preset_List[12][i] = Casino_Preset_List[12][i+1]
				end
			end
			table.remove(Casino_Preset_Text    ,#Casino_Preset_Text)
			table.remove(Casino_Preset_List[01],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[02],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[03],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[04],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[05],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[06],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[07],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[08],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[09],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[10],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[11],#Casino_Preset_Text)
			table.remove(Casino_Preset_List[12],#Casino_Preset_Text)
			presets.Casino.Name      = Casino_Preset_Text    
			presets.Casino.Approach  = Casino_Preset_List[01]
			presets.Casino.Mode      = Casino_Preset_List[02]
			presets.Casino.Target    = Casino_Preset_List[03]
			presets.Casino.Hacker    = Casino_Preset_List[04]
			presets.Casino.Gunman    = Casino_Preset_List[05]
			presets.Casino.Weapon    = Casino_Preset_List[06]
			presets.Casino.Driver    = Casino_Preset_List[07]
			presets.Casino.Car       = Casino_Preset_List[08]
			presets.Casino.Masks     = Casino_Preset_List[09]
			presets.Casino.Settings1 = Casino_Preset_List[10]
			presets.Casino.Settings2 = Casino_Preset_List[11]
			presets.Casino.Settings3 = Casino_Preset_List[12]
			Save_settings(Presets_JSON_filename,presets)
		end
	)
	
	Text(Presets_Common_presets,Casino_Preset_editor_menu)

	Casino_Presets_menu_List = {}
	Casino_Presets_name_menu_List = {}
	Casino_Presets_crew_menu_List = {}
	Casino_Presets_AP_menu_List = {}
	casino_Presets_characters_List = {}
	Casino_Presets_number_characters = 15
	
	for i = 1,#Casino_Preset_Text do
		Casino_Presets_crew_menu_List[i] = {}
		casino_Presets_characters_List[i] = {}
		for j = 1,Casino_Presets_number_characters do
			casino_Presets_characters_List[i][j] = ""
		end
		Casino_Presets_menu_List[i] = Casino_Preset_editor_menu:add_submenu(Casino_Preset_Text[i])

		
		Casino_Presets_name_menu_List[i] = Casino_Presets_menu_List[i]:add_submenu(Presets_Common_edit)
		for j = 1,Casino_Presets_number_characters do
			if string.len(Casino_Preset_Text[i]) >= j then
				casino_Presets_characters_List[i][Casino_Presets_number_characters-string.len(Casino_Preset_Text[i])+j] = Casino_Preset_Text[i]:sub(j,j)
			end
			
			Casino_Presets_name_menu_List[i]:add_array_item(Numberplate_Custom_character..j,All_characters_List,
				function()
					return Get_char_pos(casino_Presets_characters_List[i][j],All_characters_List)
				end,
				function(c)
					casino_Presets_characters_List[i][j] = All_characters_List[c]
				end
			)
		end
		Text(Numberplate_Custom_preview,Casino_Presets_name_menu_List[i])
		Casino_Presets_name_menu_List[i]:add_bare_item("",
			function()
				return List_to_string(casino_Presets_characters_List[i],Casino_Presets_number_characters)
			end,
			null,
			null,
			null
		)
		Casino_Presets_name_menu_List[i]:add_action(Presets_Common_save,
			function()
				Casino_Preset_Text[i] = ""
				for j = 1,Casino_Presets_number_characters do
					Casino_Preset_Text[i] = Casino_Preset_Text[i]..casino_Presets_characters_List[i][j]
				end
				presets.Casino.Name = Casino_Preset_Text				
				Save_settings(Presets_JSON_filename,presets)
			end
		)


		Casino_Presets_menu_List[i]:add_array_item(Presets_Casino_approach,Casino_Approach_List, function() return Casino_Preset_List[1][i] end, function(a) Casino_Preset_List[1][i] = a end)
		Casino_Presets_menu_List[i]:add_array_item(Presets_Casino_mode,Heist_difficulty_list, function() return Casino_Preset_List[2][i] end, function(a) Casino_Preset_List[2][i] = a end)
		Casino_Presets_menu_List[i]:add_array_item(Presets_Casino_target,Casino_Target_List, function() return Casino_Preset_List[3][i] end, function(a) Casino_Preset_List[3][i] = a end)


		Casino_Presets_menu_List[i]:add_array_item(Casino_Crew_Hacker, Casino_Hacker_List, function() return Casino_Preset_List[4][i] end, function(Hkr) Casino_Preset_List[4][i] = Hkr end)
		local function Casino_Preset_weapon_Menu()
			Casino_Presets_crew_menu_List[i][1]:clear()
			Text(Casino_Crew_Gunman_choise, Casino_Presets_crew_menu_List[i][1])

			WEP=Casino_Preset_List[5][i]
			Wa=Casino_Preset_List[6][i]
			AP=Casino_Preset_List[1][i]
			Casino_Gunman_select_star = {"", "", "", "", ""}

			if WEP>=1 and WEP <= 5 then
				Casino_Gunman_select_star[WEP] = "*"
			end

			Casino_Gunman_gun_List = Casino_Get_weapon_list(AP)

			for j = 1,5 do
				Casino_Presets_crew_menu_List[i][1]:add_array_item(Casino_Gunman_List[j]..Casino_Gunman_select_star[j], Casino_Gunman_gun_List[j],
					function()
						if WEP ~= j then
							return we[j]
						else
							return Wa
						end
					end,
					function(w)
						we[j]=w
						Casino_Preset_List[5][i] = j
						Casino_Preset_List[6][i] = we[j]
					end
				)
			end
		end
		Casino_Presets_crew_menu_List[i][1] = {}
		Casino_Presets_crew_menu_List[i][1] = Casino_Presets_menu_List[i]:add_submenu(Casino_Crew_Gunman_Submenu,Casino_Preset_weapon_Menu)

		local function Casino_Preset_vehicle_Menu()
			Casino_Presets_crew_menu_List[i][2]:clear()
			Text(Casino_Crew_Driver_choise, Casino_Presets_crew_menu_List[i][2])

			Drv=Casino_Preset_List[7][i]
			CAR=Casino_Preset_List[8][i]
			Casino_Driver_select_star = {"", "", "", "", ""}

			if CAR >=1 and CAR <= 5 then
				Casino_Driver_select_star[CAR] = "*"
			end

			for j = 1,5 do
				Casino_Presets_crew_menu_List[i][2]:add_array_item(Casino_Driver_List[j]..Casino_Driver_select_star[j], Driver_Veh_List[j],
					function()
						if not CAR then
							return ca[j]
						else
							return CAR
						end
					end,
					function(v)
						ca[j] = v
						Casino_Preset_List[7][i] = j
						Casino_Preset_List[8][i] = ca[j]
					end
				)
			end
		end
		Casino_Presets_crew_menu_List[i][2] = {}
		Casino_Presets_crew_menu_List[i][2]=Casino_Presets_menu_List[i]:add_submenu(Casino_Crew_Driver_Submenu,Casino_Preset_vehicle_Menu)

		Casino_Presets_menu_List[i]:add_array_item(Casino_Crew_Mask, Casino_Mask_List,
			function()
				M=Casino_Preset_List[9][i]
				if M<1 or M>13 or M==nil then
					return 0
				end
				return Casino_Preset_List[9][i]
			end,
			function(H3Msk)
				Casino_Preset_List[9][i] = H3Msk
			end
		)

		local function Casino_Preset_Current_AP_settings()
			Casino_Presets_AP_menu_List[i]:clear()
		
			-- Silent and Sneaky
			Text(Casino_Approach_settings_silentnsneaky,Casino_Presets_AP_menu_List[i])
			Casino_Presets_AP_menu_List[i]:add_toggle(Casino_Setup_missions_List0[3], function() return Casino_Preset_List[10][i][1] end, function() Casino_Preset_List[10][i][1] = not Casino_Preset_List[10][i][1] end)
			Casino_Presets_AP_menu_List[i]:add_toggle(Casino_Setup_missions_List0[5], function() return Casino_Preset_List[10][i][2] end, function() Casino_Preset_List[10][i][2] = not Casino_Preset_List[10][i][2] end)
			
			Text("",Casino_Presets_AP_menu_List[i])
			-- The Big Con
			Text(Casino_Approach_settings_thebigcon,Casino_Presets_AP_menu_List[i])
			Text(Casino_Approach_settings_thebigcon_entrydesguise,Casino_Presets_AP_menu_List[i])
			for j=1,4 do
				if j <= 2 then
					idx = 6+2*j
				else
					idx = 11+2*(j-2)
				end
				Casino_Presets_AP_menu_List[i]:add_toggle(Casino_Setup_missions_List0[idx], function() return Casino_Preset_List[11][i][j] end,
					function()
						Casino_Preset_List[11][i][j] = not Casino_Preset_List[11][i][j]
					end
				)
			end
			Text(Casino_Approach_Settings_Thebigcon_exitdesguise,Casino_Presets_AP_menu_List[i])
			for j=16,17 do
				Casino_Presets_AP_menu_List[i]:add_toggle(Casino_Setup_missions_List0[j], function() return Casino_Preset_List[11][i][j-11] end, function() Casino_Preset_List[11][i][j-11] = not Casino_Preset_List[11][i][j-11] end)
			end
		
			Text("",Casino_Presets_AP_menu_List[i])
			-- Agressive
			Text(Casino_Approach_settings_aggressive,Casino_Presets_AP_menu_List[i])
			for j=19,20 do
				Casino_Presets_AP_menu_List[i]:add_toggle(Casino_Setup_missions_List0[j], function() return Casino_Preset_List[12][i][j-18] end, function() Casino_Preset_List[12][i][j-18] = not Casino_Preset_List[12][i][j-18] end)
			end
		end
		Casino_Presets_AP_menu_List[i]=Casino_Presets_menu_List[i]:add_submenu(Casino_Approach_Settings_Submenu,Casino_Preset_Current_AP_settings)


		-- Save
		Text(Separator_Text,Casino_Presets_menu_List[i])
		Casino_Presets_menu_List[i]:add_action(Presets_Common_save,
			function()
				presets.Casino.Approach  = Casino_Preset_List[01]
				presets.Casino.Mode      = Casino_Preset_List[02]
				presets.Casino.Target    = Casino_Preset_List[03]
				presets.Casino.Hacker    = Casino_Preset_List[04]
				presets.Casino.Gunman    = Casino_Preset_List[05]
				presets.Casino.Weapon    = Casino_Preset_List[06]
				presets.Casino.Driver    = Casino_Preset_List[07]
				presets.Casino.Car       = Casino_Preset_List[08]
				presets.Casino.Masks     = Casino_Preset_List[09]
				presets.Casino.Settings1 = Casino_Preset_List[10]
				presets.Casino.Settings2 = Casino_Preset_List[11]
				presets.Casino.Settings3 = Casino_Preset_List[12]
				Save_settings(Presets_JSON_filename,presets)
			end
		)
	end
end
Casino_Preset_editor_menu=Casino_menu:add_submenu(Presets_Submenu,Casino_Preset_editor_Menu)


------------------------
--------- Cayo ---------

-- Cayo Setup
local Cayo_setup_menu=Cayo_menu:add_submenu(Cayo_Setup_Submenu)

-- Instant Setup / Hard mode
Cayo_setup_menu:add_action(Cayo_Instant_setup,
    function()
	    Cayo_Heist_mission(0,true)
	    Cayo_Heist_mission(1,true)
    	for i=9,12 do
	    	Cayo_Heist_mission(i,true)
	    end
    	Cayo_Heist_generator(12,true)
    	stats.set_int(mpx().."H4CNF_WEAPONS", 1)
    	stats.set_int(mpx().."H4LOOT_GOLD_C_SCOPED",stats.get_int(mpx().."H4LOOT_GOLD_C"))
    	stats.set_int(mpx().."H4LOOT_CASH_C_SCOPED",stats.get_int(mpx().."H4LOOT_CASH_C"))
    	stats.set_int(mpx().."H4LOOT_PAINT_SCOPED",stats.get_int(mpx().."H4LOOT_PAINT"))
    end
)

Cayo_setup_menu:add_action(Cayo_Setup_Hardmode, function() stats.set_int(mpx().."H4_PROGRESS", 131055) end)


-- Manual Setup
Cayo_setup_menu:add_action(Manual_Text,function()end)
Cayo_setup_menu:add_array_item(Cayo_Setup_Target, Cayo_Choose_Target,
	function()
		return stats.get_int(mpx().."H4CNF_TARGET")
	end,
	function(CyT)
		if CyT then
			stats.set_int(mpx().."H4CNF_TARGET", CyT)
		end
	end)

Cayo_setup_menu:add_array_item(Cayo_Setup_ChooseWeapon, Cayo_Choose_Weapon,
	function()
		return Cayo_Heist_weapon()
	end,
	function(v)
		Cayo_Heist_weapon(v)
		if Cayo_Heist_weapon()>0 then
			Cayo_Heist_mission(12,true)
		else
			Cayo_Heist_mission(12,false)
		end
	end)

Cayo_setup_menu:add_toggle(Cayo_Missions_List[0] ,function() return Cayo_Heist_mission(0) end,function()Cayo_Heist_mission(0,not Cayo_Heist_mission(0))if not Cayo_Heist_mission(0) then stats.set_int(mpx().."H4_MISSIONS",0)end end)

-- Approach
local Cayo_Approach_vehicles=Cayo_setup_menu:add_submenu(Cayo_Setup_Approach_Submenu)
Cayo_Approach_vehicles:add_action(Cayo_Setup_Approach_Choose, function() end)
for i=1,6 do
	Cayo_Approach_vehicles:add_toggle(Cayo_Missions_List[i],
		function()
			return Cayo_Heist_mission(i)
		end,
		function()
			Cayo_Heist_mission(i,not Cayo_Heist_mission(i))
			if i==2 or i==4 then
				if not Cayo_Heist_mission(2)and not Cayo_Heist_mission(4) then
					Cayo_Heist_mission(7,false)
				end
			end
		end
		)
end
Cayo_Approach_vehicles:add_toggle(Cayo_Missions_List[7],function()return Cayo_Heist_mission(7)end,function()Cayo_Heist_mission(7,not Cayo_Heist_mission(7))if Cayo_Heist_mission(7) and not Cayo_Heist_mission(2) and not Cayo_Heist_mission(4)then Cayo_Heist_mission(4,true)end end)


-- Disruption And Weapons
local Cayo_Disruption_Missions=Cayo_setup_menu:add_submenu(Cayo_Setup_MissionAndWeapons_Submenu)
for i=8,11 do Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[i],function()return Cayo_Heist_mission(i)end,function()Cayo_Heist_mission(i,not Cayo_Heist_mission(i))end)end
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[12],
	function()
		return Cayo_Heist_mission(12)
	end,
	function()
		Cayo_Heist_mission(12,not Cayo_Heist_mission(12))
		if Cayo_Heist_mission(12) and stats.get_int(mpx().."H4CNF_WEAPONS")==0 then 
			stats.set_int(mpx().."H4CNF_WEAPONS",1)
		elseif not Cayo_Heist_mission(12) and stats.get_int(mpx().."H4CNF_WEAPONS")>0 then
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
		if v>0 and not Cayo_Heist_mission(12) then
			Cayo_Heist_mission(12,true)
		elseif v==0 and Cayo_Heist_mission(12) then
			Cayo_Heist_mission(12,false)
		end
	end
	)
Cayo_Disruption_Missions:add_toggle(Cayo_Point_of_interest_List[12],function()return Cayo_Heist_generator(12)end,function()Cayo_Heist_generator(12,not Cayo_Heist_generator(12))end)
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[13],function()return Cayo_Heist_mission(13)end,function()Cayo_Heist_mission(13,not Cayo_Heist_mission(13))if not Cayo_Heist_mission(13)then stats.set_int(mpx().."H4CNF_WEP_DISRP", 0)end end)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_PercetangeDestroyed,Cayo_Disturbance_level,
	function()
		return stats.get_int(mpx().."H4CNF_WEP_DISRP")
	end,
	function(v)
		stats.set_int(mpx().."H4CNF_WEP_DISRP",v)
		if v>0 then
			Cayo_Heist_mission(13,true)
		end
	end
	)
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[14],function()return Cayo_Heist_mission(14)end,function()Cayo_Heist_mission(14,not Cayo_Heist_mission(14))if not Cayo_Heist_mission(14)then stats.set_int(mpx().."H4CNF_ARM_DISRP", 0)end end)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_PercetangeDestroyed,Cayo_Disturbance_level,
	function()
		return stats.get_int(mpx().."H4CNF_ARM_DISRP")
	end,
	function(v)
		stats.set_int(mpx().."H4CNF_ARM_DISRP",v)
		if v>0 then
			Cayo_Heist_mission(14,true)
		end
	end
	)
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[15],function()return Cayo_Heist_mission(15)end,function()Cayo_Heist_mission(15,not Cayo_Heist_mission(15))if not Cayo_Heist_mission(15)then stats.set_int(mpx().."H4CNF_HEL_DISRP", 0)end end)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_PercetangeDestroyed,Cayo_Disturbance_level,
	function()
		return stats.get_int(mpx().."H4CNF_HEL_DISRP")
	end,
	function(v)
		stats.set_int(mpx().."H4CNF_HEL_DISRP",v)
		if v>0 then
			Cayo_Heist_mission(15,true)
		end
	end
)


-- POIs
local Cayo_Point_of_interest=Cayo_setup_menu:add_submenu(Cayo_Point_of_interest_submenu)
local Cayo_Point_of_interest_grappling = Cayo_Point_of_interest:add_submenu(Cayo_Point_of_interest_grappling_submenu)
	for i=0,2 do
		Cayo_Point_of_interest_grappling:add_toggle(Cayo_Point_of_interest_List[i],
			function()
				return Cayo_Heist_generator(i)
			end,
			function()
				Cayo_Heist_generator(i,not Cayo_Heist_generator(i))
			end)
	end
	Cayo_Point_of_interest_grappling:add_toggle(Cayo_Point_of_interest_List[3],
		function()
			return Cayo_Heist_generator(3)
		end,
		function()
			Cayo_Heist_generator(3,not Cayo_Heist_generator(3))
			if Cayo_Heist_generator(3) then
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
				return Cayo_Heist_generator(i)
			end,
			function()
				Cayo_Heist_generator(i,not Cayo_Heist_generator(i))
				if not Cayo_Heist_generator(4) and not Cayo_Heist_generator(5) and not Cayo_Heist_generator(6) and not Cayo_Heist_generator(7) then
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
				return Cayo_Heist_generator(i)
			end,
			function()
				Cayo_Heist_generator(i,not Cayo_Heist_generator(i))
				if not Cayo_Heist_generator(8)and not Cayo_Heist_generator(9) and not Cayo_Heist_generator(10)and not Cayo_Heist_generator(11) then
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
			return Cayo_Heist_generator(i)
		end,
		function()
			Cayo_Heist_generator(i,not Cayo_Heist_generator(i))
		end)
	end
--
Cayo_Point_of_interest:add_array_item(Cayo_Point_of_interest_supplytruck, Cayo_Interest_point,
	function()
		return stats.get_int(mpx().."H4CNF_TROJAN")
	end,
	function(SpTr)
		if SpTr>0 then
			Cayo_Heist_generator(15,true)
		else
			Cayo_Heist_generator(15,false)
		end
		stats.set_int(mpx().."H4CNF_TROJAN", SpTr)
	end)

Cayo_setup_menu:add_action(Cayo_Point_of_interest_scopeout,function() stats.set_int(mpx().."H4CNF_BS_GEN", 131071) end)


-- Set Loot
local Cayo_set_loot=Cayo_setup_menu:add_submenu(Cayo_Setloot_Submenu)

-- Inside Compound
	Text(Cayo_Setloot_compound_in,Cayo_set_loot)

	Cayo_set_loot_room = {}
	for j = 0,2 do
		Cayo_set_loot_room[j+1] = Cayo_set_loot:add_submenu(Cayo_Setloot_room[j+1])
		for k = 0,1 do
			Cayo_set_loot_room[j+1]:add_array_item(Cayo_Setloot_table[k+1], Cayo_set_loot_compound_table_List,
				function()
					return Cayo_Heist_compound_table_get(j*2+k)
				end,
				function(v)
					Cayo_Heist_compound_table_set(j*2+k,v)
				end
			)
		end

		Cayo_set_loot_room[j+1]:add_toggle(Cayo_Setloot_painting[1], function() return Cayo_Heist_compound_table(j*2,2) end, function() Cayo_Heist_compound_table(j*2,2, not Cayo_Heist_compound_table(j*2,2) ) end)
	end

	-- Basement
		local Cayo_set_loot_basement=Cayo_set_loot:add_submenu(Cayo_Setloot_basement)
		for k = 0,1 do
			Cayo_set_loot_basement:add_array_item(Cayo_Setloot_table[k+1], Cayo_set_loot_compound_table_List,
				function()
					return Cayo_Heist_compound_table_get(6+k)
				end,
				function(v)
					Cayo_Heist_compound_table_set(6+k,v)
				end
			)
		end

		Cayo_set_loot_basement:add_toggle(Cayo_Setloot_painting[1],function() return Cayo_Heist_compound_table(5,2) end, function() Cayo_Heist_compound_table(5,2, not Cayo_Heist_compound_table(5,2) ) end)
		Cayo_set_loot_basement:add_toggle(Cayo_Setloot_painting[2],function() return Cayo_Heist_compound_table(6,2) end, function() Cayo_Heist_compound_table(6,2, not Cayo_Heist_compound_table(6,2) ) end)

	-- Office
		local Cayo_set_loot_office=Cayo_set_loot:add_submenu(Cayo_Setloot_office)
		Cayo_set_loot_office:add_toggle(Cayo_Setloot_painting[1],function() return Cayo_Heist_compound_table(3,2) end,function() Cayo_Heist_compound_table(3,2, not Cayo_Heist_compound_table(3,2) ) end)
		Cayo_set_loot_office:add_toggle(Cayo_Setloot_painting[2],function() return Cayo_Heist_compound_table(4,2) end,function() Cayo_Heist_compound_table(4,2, not Cayo_Heist_compound_table(4,2) ) end)

-- Outside Compoud
	Cayo_set_loot:add_action(Cayo_Setloot_Compound_out,function() end)
	Cayo_set_loot_maindock      = Cayo_set_loot:add_submenu(Cayo_Maindock)
		Text(Cayo_Setloot_Shed,Cayo_set_loot_maindock)
			for i=23,22,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
		Text(Cayo_Setloot_Shed2,Cayo_set_loot_maindock)
			for i=18,17,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
		Text(Cayo_Setloot_Lockup,Cayo_set_loot_maindock)
			for i=21,19,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
	Cayo_set_loot_innermaindock = Cayo_set_loot:add_submenu(Cayo_InnerMaindock)
		Text(Cayo_Setloot_Shed,Cayo_set_loot_innermaindock)
			for i=16,15,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
	Cayo_set_loot_farmland      = Cayo_set_loot:add_submenu(Cayo_Farmland)
		Text(Cayo_Setloot_Shed,Cayo_set_loot_farmland)
			for i=14,13,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
	Cayo_set_loot_northdock     = Cayo_set_loot:add_submenu(Cayo_Northdock)
		Text(Cayo_Setloot_Shed,Cayo_set_loot_northdock)
			for i=12,11,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
		Text(Cayo_Setloot_Lockup,Cayo_set_loot_northdock)
			for i=10,8,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
		Text(Cayo_Setloot_Warehouse,Cayo_set_loot_northdock)
			for i=7,6,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
	Cayo_set_loot_airstrip      = Cayo_set_loot:add_submenu(Cayo_Airstrip)
		Text(Cayo_Setloot_Shed,Cayo_set_loot_airstrip)
			for i=5,4,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
		Text(Cayo_Setloot_HangarBottom,Cayo_set_loot_airstrip)
			for i=3,2,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
		Text(Cayo_Setloot_HangarTop,Cayo_set_loot_airstrip)
			for i=1,0,-1 do
				Cayo_set_loot_maindock:add_array_item(Cayo_Loot_point[i],Cayo_set_loot_outside_table_List,
					function()
						Cayo_Heist_island_table_get(i)
					end,
					function(v)
						Cayo_Heist_island_table_set(i,v)
					end)
			end
--

Cayo_setup_menu:add_action(Refresh_Kosatka_Board,
	function()
		if script("heist_island_planning"):is_active() then
			script("heist_island_planning"):set_int(Cayo_Refresh_table, 2)
		end
	end
)


-- Cayo Player Cuts
local function Cayo_Cuts()
	Cayo_cut_menu:clear()
	P = {}
	P[1],P[2],P[3],P[4] = Notinheist_Text,nil,nil,nil
	Cayo_Cut_List = {}

	
	for i = 1,4 do
		if globals.get_int(Cayo_Cut_offset+i)>=0 then if player.get_player_ped(i-1) == localplayer then P[i] = You_Text else P[i] = player.get_player_name(i-1) end end
	end

	Text(Cut_player,Cayo_cut_menu)

	for i = 1,4 do
		if P[i] then
			Cayo_Cut_List[i] = globals.get_int(Cayo_Cut_offset+i)
			Cayo_cut_menu:add_array_item(Cut_Player_List[i]..P[i],Cut_percent,function() return math.floor(Cayo_Cut_List[i]/5-1) end, function(p) Cayo_Cut_List[i] = (p+1)*5 end)
		end
	end

	Cayo_cut_menu:add_array_item(Cut_slider, Cut_percent,
		function()
			Cayo_Player_cut_max = Heist_Get_max_cut(P, Cayo_Cut_List)
			return math.floor(Cayo_Player_cut_max/5)-1
		end,
		function(p)
			for i = 1,4 do
				if P[i] then
					Cayo_Cut_List[i] = (p+1)*5
				end
			end
			Cayo_Player_cut_max = (p+1)*5
		end)
	Cayo_cut_menu:add_array_item(Set_Text, Heist_cut_selector_Text, function() return 1 end,
		function(Cayo_Cut_Selector)
			if Cayo_Cut_Selector ~= 1 then
				Cayo_Cut_List = Heist_cut_selector_list[Cayo_Cut_Selector]
			end
			Cayo_Player_cut_max = Heist_Get_max_cut(P, Cayo_Cut_List)
			for i = 1,4 do
				if P[i] then
					globals.set_int(Cayo_Cut_offset+i, Cayo_Cut_List[i])
				end
			end
		end
	)

	Text(Cut_Crew1,Cayo_cut_menu)
	Text(Cut_Crew2,Cayo_cut_menu)
	Text(Cut_Crew3,Cayo_cut_menu)

	Cayo_cut_menu:add_action(Cayo_Cut_Pavel,function() globals.set_int(Cayo_Pavel_Cut, 0) end)
	Cayo_cut_menu:add_action(Cayo_Fencing_Fee,function() globals.set_int(Cayo_Fenving_fee, 0) end)
end

Cayo_cut_menu=Cayo_menu:add_submenu(Cayo_Cut_Submenu, Cayo_Cuts)


-- Cayo Extras
local Cayo_extras=Cayo_menu:add_submenu(Extras_Submenu)
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
Cayo_menu:add_action(Cayo_Cooldown_skip[1],
	function()
		stats.set_int(mpx() .. "H4_TARGET_POSIX", 1659643454)
		stats.set_int(mpx() .. "H4_COOLDOWN", 0)
		stats.set_int(mpx() .. "H4_COOLDOWN_HARD", 0)
	end)

Cayo_menu:add_action(Cayo_Cooldown_skip[2],
	function()
		stats.set_int(mpx() .. "H4_TARGET_POSIX", 1659429119)
		stats.set_int(mpx() .. "H4_COOLDOWN", 0)
		stats.set_int(mpx() .. "H4_COOLDOWN_HARD", 0)
	end
)




------------------------
------- Dommsday -------

-- Dommsday Setup
local Doomsday_Setup_menu=nil
local function Doomsday_Setup_Menu()
	Doomsday_Setup_menu:clear()
    local Current_Dommsday_act = 0
    Get_doomsday_act()
	Doomsday_Setup_menu:add_array_item(Doomsday_Set_act,Doomsday_Heist_List,
        function()
            return Get_doomsday_act()
        end,
        function(Act_Num)
            stats.set_int(mpx().."gangops_heist_status",Act_Num)
            Current_Dommsday_act = Act_Num
        end)
    Doomsday_Setup_menu:add_action(Doomsday_Instant_setup,
	    function()
            Current_Dommsday_act = Get_doomsday_act()
	    	if Current_Dommsday_act == 1 then
	    		Doomsday_Progression1=7
	    		Doomsday_Progression2=7
	    	elseif Current_Dommsday_act == 2 then
	    		Doomsday_Progression1=240
	    		Doomsday_Progression2=248
	    	else
	    		Doomsday_Progression1=15872
	    		Doomsday_Progression2=16128
	    	end 
	    	stats.set_int(mpx().."GANGOPS_FLOW_MISSION_PROG", Doomsday_Progression1)
	    	stats.set_int(mpx().."GANGOPS_FM_MISSION_PROG"  , Doomsday_Progression2)
	    end)
	Text(Manual_Text,Doomsday_Setup_menu)
    local N_I_for_act = ""
    for i = 1,Get_doomsday_act() do
        N_I_for_act = N_I_for_act.."I"
    end

    Text(White_space.."["..Doomsday_Act_Name.."-"..N_I_for_act..": "..Doomsday_Heist_List[Get_doomsday_act()].."]",Doomsday_Setup_menu)
    Current_Dommsday_act = Get_doomsday_act()
    if Current_Dommsday_act == 1 then
	    for i=0,2 do
            Doomsday_Setup_menu:add_array_item(Doomsday_Prep..Doomsday_Heist_prep_List[i] , Doomsday_Missions_status,
                function()
                    if Doomsday_Preperation(i+14) then
                        return 2
                    elseif Doomsday_Preperation_skip(i) then
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
                        Doomsday_Preperation_skip(i,true)
                    else
                        Doomsday_Preperation(i+14,false)
                        Doomsday_Preperation_skip(i,false)
                    end
                end)
	    	Doomsday_Setup_menu:add_toggle(Doomsday_Setup..Doomsday_Heist_missions_List[i], function() return Doomsday_Missions(i) end, function() Doomsday_Missions(i,not Doomsday_Missions(i)) end)
        end
    elseif Current_Dommsday_act == 2 then
	    for i=4,7 do
            Doomsday_Setup_menu:add_array_item(Doomsday_Prep..Doomsday_Heist_prep_List[i-1], Doomsday_Missions_status,
                function()
                    if Doomsday_Preperation(i-1+14) then
                        return 2
                    elseif Doomsday_Preperation_skip(i-1) then
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
                        Doomsday_Preperation_skip(i-1,true)
                    else
                        Doomsday_Preperation(i-1+14,false)
                        Doomsday_Preperation_skip(i-1,false)
                    end 
                end)
	    	if i==7 then
                Doomsday_Setup_menu:add_array_item(Doomsday_Prep..Doomsday_Heist_prep_List[i] , Doomsday_Missions_status,
                    function()
	    		        if Doomsday_Preperation(i+14)then
                            return 2
                        elseif Doomsday_Preperation_skip(i) then
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
                            Doomsday_Preperation_skip(i,true)
                        else
                            Doomsday_Preperation(i+14,false)
                            Doomsday_Preperation_skip(i,false)
                        end
                    end)
            end
	    	Doomsday_Setup_menu:add_toggle(Doomsday_Setup..Doomsday_Heist_missions_List[i], function() return Doomsday_Missions(i) end, function() Doomsday_Missions(i,not Doomsday_Missions(i)) end)
        end
    elseif Current_Dommsday_act == 3 then
        for i = 8,13 do
	        Doomsday_Setup_menu:add_array_item(Doomsday_Prep..Doomsday_Heist_prep_List[i] , Doomsday_Missions_status,
	    	    function()
	    	    	if Doomsday_Preperation(i+14)then
	    	    		return 2
	    	    	elseif Doomsday_Preperation_skip(i) then
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
	    	    		Doomsday_Preperation_skip(i,true)
	    	    	else
	    	    		Doomsday_Preperation(i+14,false)
	    	    		Doomsday_Preperation_skip(i,false)
	    	    	end
	    	    end)
            if i ~= 8 then
                Doomsday_Setup_menu:add_toggle(Doomsday_Setup..Doomsday_Heist_missions_List[i] , function() return Doomsday_Missions(i) end, function() Doomsday_Missions(i,not Doomsday_Missions(i)) end)
            end
        end
    end
end
Doomsday_Setup_menu=Doomsday_menu:add_submenu(Doomsday_Setup_Submenu,Doomsday_Setup_Menu)

-- Doomsday Cuts
local function Doomsday_Cuts_Menu()
    Doomsday_cuts_menu:clear()
	P = {}
    Doomsday_Cut_List = {}
	P[1],P[2],P[3],P[4] = Notinheist_Text,nil,nil,nil

	for i = 1,4 do
		if globals.get_int(Doomsday_Cut_offset+i)>=0 then if player.get_player_ped(i-1)==localplayer then P[i]=You_Text else P[i]=player.get_player_name(i-1) end end
	end

	Text(Cut_player,Doomsday_cuts_menu)
	for i = 1,4 do
    	if P[i] then
            Doomsday_Cut_List[i] = globals.get_int(Doomsday_Cut_offset+i)
    	    Doomsday_cuts_menu:add_array_item(Cut_Player_List[i]..P[i], Cut_percent, function() return math.floor(Doomsday_Cut_List[i]/5-1) end, function(p) Doomsday_Cut_List[i] = (p+1)*5 end)
    	end
	end
	Doomsday_cuts_menu:add_array_item(Cut_slider, Cut_percent,
		function()
			Doomsday_Max_player_cut = Heist_Get_max_cut(P, Doomsday_Cut_List)
			return math.floor(Doomsday_Max_player_cut/5)-1
		end,
		function(p)
			for i = 1,4 do
				Doomsday_Cut_List[i] = (p+1)*5
			end
		end)
	
    Doomsday_cuts_menu:add_array_item(Set_Text, Heist_cut_selector_Text, function() return 1 end, function(Doomsday_Cut_selector)
        if Doomsday_Cut_selector ~= 1 then
			Doomsday_Cut_List = Heist_cut_selector_list[Doomsday_Cut_selector]
        end
		Doomsday_Max_player_cut = Heist_Get_max_cut(P, Doomsday_Cut_List)
		for i = 1,4 do
        	globals.set_int(Doomsday_Cut_offset+i, Doomsday_Cut_List[i])
        end
    end)
end
Doomsday_cuts_menu=Doomsday_menu:add_submenu(Doomsday_Cuts_Submenu, Doomsday_Cuts_Menu)


--  "MP_ACT_HEIST" /* Tunable: HEIST_MONEY_GRAB_CASH_DROP_THRESHOLD_LOW */  /* Tunable: CASINO_HEIST_MAX_DAILY_CASH_REWARD */   /* Tunable: CASINO_HEIST_MAX_DAILY_CASH_REWARD */   "MPPLY_AVAILABLE_HEIST_PLAN"

------------------------
----- Appartements -----

-- Appartements Setup
function Appartements_Setup_Menu()
    Appartements_Setup_menu:clear()
	Appartements_Setup_menu:add_array_item("Current Heist", {"Fleeca","Prison","Human Labs","Series A","Pacific"}, function() return stats.get_int("MPPLY_AVAILABLE_HEIST_PLAN") end,
		function(h)
			stats.set_int("MPPLY_AVAILABLE_HEIST_PLAN", h)
		end
	)
    local Current_heist = stats.get_int("MPPLY_AVAILABLE_HEIST_PLAN")
    if Current_heist == 1 then
        for i = 1,2 do
            Appartements_Setup_menu:add_toggle(Appartements_Fleeca_preps[i],function() return Appartements_Missions(i-1) end,function() Appartements_Missions(i-1,not Appartements_Missions(i-1)) end)
        end
    elseif Current_heist == 2 then
        for i = 1,4 do
            Appartements_Setup_menu:add_toggle(Appartements_Prison_preps[i],function() return Appartements_Missions(i-1) end,function() Appartements_Missions(i-1,not Appartements_Missions(i-1)) end)
        end
    elseif Current_heist == 3 then
        for i = 1,5 do
            Appartements_Setup_menu:add_toggle(Appartements_Humane_preps[i],function() return Appartements_Missions(i-1) end,function() Appartements_Missions(i-1,not Appartements_Missions(i-1)) end)
        end
    elseif Current_heist == 4 then
        for i = 1,5 do
            Appartements_Setup_menu:add_toggle(Appartements_SeriesA_preps[i],function() return Appartements_Missions(i-1) end,function() Appartements_Missions(i-1,not Appartements_Missions(i-1)) end)
        end
    elseif Current_heist == 5 then
        for i = 1,5 do
            Appartements_Setup_menu:add_toggle(Appartements_Pacific_preps[i],function() return Appartements_Missions(i-1) end,function() Appartements_Missions(i-1,not Appartements_Missions(i-1)) end)
        end
    end
end
Appartements_Setup_menu=Appartements_menu:add_submenu(Appartements_Setup_menu_Submenu,Appartements_Setup_Menu)



-- Appartements Cuts
local function Appartements_Cut_Menu()
    Appartements_Cut_menu:clear()
	P = {}
    Appartements_Cut_List = {}
	P[1],P[2],P[3],P[4] = Notinheist_Text,nil,nil,nil

	for i = 1,4 do
		if globals.get_int(Appartements_Cut_offset+i)>=0 then if player.get_player_ped(i-1)==localplayer then P[i]=You_Text else P[i]=player.get_player_name(i-1) end end
	end
	
	Text(Cut_player,Appartements_Cut_menu)
    -- Cut selector
	for i = 1,4 do
    	if P[i] then
            Appartements_Cut_List[i] = globals.get_int(Appartements_Cut_offset+i)
    	    Appartements_Cut_menu:add_array_item(Cut_Player_List[i]..P[i], Cut_percent,
				function()
					if Appartements_Cut_List[i] == Appartements_Get_15mil_cut() then return -2 end
					return math.floor(Appartements_Cut_List[i]/5-1)
				end,
				function(p)
					Appartements_Cut_List[i] = (p+1)*5
				end
			)
    	end
	end
	Appartements_Cut_menu:add_array_item(Cut_slider, Cut_percent,
		function()
            Appartements_Max_player_cut = Heist_Get_max_cut(P, Appartements_Cut_List)
			if Appartements_Max_player_cut == Appartements_Get_15mil_cut() then return -2 end
			return math.floor(Appartements_Max_player_cut/5)-1
		end,
		function(p)
			for i = 1,4 do
				Appartements_Cut_List[i] = (p+1)*5
			end
		end)
    Appartements_Cut_menu:add_array_item(Set_Text, Heist_cut_selector_Text, function() return 1 end,
		function(Appartements_Cut_selector)
    	    if Appartements_Cut_selector ~= 1 then
				Appartements_Cut_List = Heist_cut_selector_list[Appartements_Cut_selector]
    	    end
			Appartements_Max_player_cut = Heist_Get_max_cut(P, Appartements_Cut_List)
			if Appartements_Max_player_cut == Appartements_Get_15mil_cut() then
				Appartments_15mil_cut_handler()
			else
				for i = 1,4 do
					globals.set_int(Appartements_Cut_offset+i, Appartements_Cut_List[i])
				end
			end
    	end)
	Appartements_Cut_menu:add_action("Modify cuts for max payout",
		function()
			local Cut_for_max = Appartements_Get_15mil_cut()
			for i = 1,4 do
				Appartements_Cut_List[i] = Cut_for_max
			end
		end
	)
end
Appartements_Cut_menu=Appartements_menu:add_submenu(Appartements_Cut_Submenu, Appartements_Cut_Menu)


-- Appartements Extras
Appartements_Extras_menu = Appartements_menu:add_submenu(Extras_Submenu)
Appartements_Extras_menu:add_action(Appartements_Fleeca_heist_bypass, function() HS():set_int(Appartements_Fleeca_hack, 7) end)
Appartements_Extras_menu:add_action(Appartements_Fleeca_drill_bypass, function() HS():set_float(Appartements_Fleeca_drill, 100) end)


------------------------
-------- Others --------

Text(Half_Separator_Function("Autoshop"),Other_Heists_menu)

local Autoshop_Heist = {"The Union Depository", "The Superdollar Deal", "The Bank Contract", "The ECU Job", "The Prison Contract", "The Agency Deal", "The Lost Contract", "The Data Contract"}

Other_Heists_menu:add_array_item(Current_Heist_Selected,Autoshop_Heist,
    function()
        return stats.get_int(mpx().."TUNER_CURRENT")+1
    end,
    function(value)
        current_autoshop_heist = value-1
        stats.set_int(mpx().."TUNER_CURRENT", current_autoshop_heist)
    end
)

Other_Heists_menu:add_action(Skip_Preperation,
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

local Ped_female = {
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

local Ped_male = {
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

local Ped_law = {
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

local Ped_special = {
    "CS_Orleans",
    "IG_Orleans",
    "U_M_M_Jesus_01",
    "U_M_M_Yeti"
}

local Ped_animals = {
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

local Ped_multipayer = {
    "MP_M_Freemode_01",
    "MP_F_Freemode_01"
}

--------- Cross Ped List ---------

local Shapeshift_Female = {}
local Shapeshift_Male = {}
local Shapeshift_Law_female = {}
local Shapeshift_Law_male = {}
local Shapeshift_Cs_female = {}
local Shapeshift_Cs_male = {}

for idx = 1,#Ped_female do
    if Is_IN(Ped_female[idx],Ped_law) then
        Shapeshift_Law_female[#Shapeshift_Law_female+1] = Ped_female[idx]
    elseif string.sub(Ped_female[idx], 1, 2) == "CS" then
        Shapeshift_Cs_female[#Shapeshift_Cs_female+1] = Ped_female[idx]
    else
        Shapeshift_Female[#Shapeshift_Female+1] = Ped_female[idx]
    end
end

for idx = 1,#Ped_male do
    if Is_IN(Ped_male[idx],Ped_law) then
        Shapeshift_Law_male[#Shapeshift_Law_male+1] = Ped_male[idx]
    elseif string.sub(Ped_male[idx], 1, 2) == "CS" then
        Shapeshift_Cs_male[#Shapeshift_Cs_male+1] = Ped_male[idx]
    else
        Shapeshift_Male[#Shapeshift_Male+1] = Ped_male[idx]
    end
end

--------- Menu ---------


Text(Miscellaneous_options,Shapeshift_menu)
Shapeshift_menu:add_toggle(Shapeshift_Tiny_option,
    function()	
        if localplayer == nil then
        	return nil
    	end
    	return localplayer:get_config_flag(223)
    end,
    function(value)
        localplayer:set_config_flag(223, value)
    end)
Shapeshift_menu:add_action(Shapeshift_Gender_option, function() stats.set_int(mpx().."ALLOW_GENDER_CHANGE", 52) end)
Shapeshift_menu:add_array_item(Shapeshift_Multiplayer_option      , Ped_multipayer 			  ,function() return idx_mp         end,function(n) idx_mp         = n Shapeshift_Set_model_hash(joaat( Ped_multipayer[n] ))   localplayer:set_godmode(true)   end)
Shapeshift_menu:add_array_item(Shapeshift_Animal_option           , Ped_animals    			  ,function() return idx_animal     end,function(n) idx_animal     = n Shapeshift_Set_model_hash(joaat( Ped_animals[n]    ))   localplayer:set_godmode(true)   end)
Shapeshift_menu:add_array_item(Shapeshift_Special_option          , Ped_special    			  ,function() return idx_special    end,function(n) idx_special    = n Shapeshift_Set_model_hash(joaat( Ped_special[n]    ))   localplayer:set_godmode(true)   end)
Text(Shapeshift_Normal_option,Shapeshift_menu)
Shapeshift_menu:add_array_item(Shapeshift_Male_character_option   , Shapeshift_Male           ,function() return idx_male       end,function(n) idx_male       = n Shapeshift_Set_model_hash(joaat( Shapeshift_Male[n]           ))   localplayer:set_godmode(true)   end)
Shapeshift_menu:add_array_item(Shapeshift_Female_character_option , Shapeshift_Female         ,function() return idx_female     end,function(n) idx_female     = n Shapeshift_Set_model_hash(joaat( Shapeshift_Female[n]         ))   localplayer:set_godmode(true)   end)
Text(Shapeshift_Law_option,Shapeshift_menu)    
Shapeshift_menu:add_array_item(Shapeshift_Male_character_option   , Shapeshift_Law_male       ,function() return idx_law_male   end,function(n) idx_law_male   = n Shapeshift_Set_model_hash(joaat( Shapeshift_Law_male[n]       ))   localplayer:set_godmode(true)   end)
Shapeshift_menu:add_array_item(Shapeshift_Female_character_option , Shapeshift_Law_female     ,function() return idx_law_female end,function(n) idx_law_female = n Shapeshift_Set_model_hash(joaat( Shapeshift_Law_female[n]     ))   localplayer:set_godmode(true)   end)
Text(Shapeshift_Cutscene_option,Shapeshift_menu)    
Shapeshift_menu:add_array_item(Shapeshift_Male_character_option   , Shapeshift_Cs_male        ,function() return idx_cs_male    end,function(n) idx_cs_male    = n Shapeshift_Set_model_hash(joaat( Shapeshift_Cs_male[n]        ))   localplayer:set_godmode(true)   end)
Shapeshift_menu:add_array_item(Shapeshift_Female_character_option , Shapeshift_Cs_female      ,function() return idx_cs_female  end,function(n) idx_cs_female  = n Shapeshift_Set_model_hash(joaat( Shapeshift_Cs_female[n]      ))   localplayer:set_godmode(true)   end)







------------------------
------ Settings --------


local Bindings_menu = Settings_menu:add_submenu(Settings_Binds_Submenu)

local Noclip_Bindings = Bindings_menu:add_submenu(Noclip_Submenu)
Noclip_Bindings:add_array_item(Noclip_Toggle,KeyCode,
	function()
		return settings.Noclip.Toggle
	end,
	function(key)
		settings.Noclip.Toggle = key
		Save_settings(Settings_JSON_filename,settings)
	end)
Noclip_Bindings:add_array_item(Noclip_Mouvement_forward,KeyCode,
	function()
		return settings.Noclip.Forward
	end,
	function(key)
		settings.Noclip.Forward = key
		Save_settings(Settings_JSON_filename,settings)
	end)
Noclip_Bindings:add_array_item(Noclip_Mouvement_backward,KeyCode,
	function()
		return settings.Noclip.Backward
	end,
	function(key)
		settings.Noclip.Backward = key
		Save_settings(Settings_JSON_filename,settings)
	end)
Noclip_Bindings:add_array_item(Noclip_Mouvement_turn_right,KeyCode,
	function()
		return settings.Noclip.Turnright
	end,
	function(key)
		settings.Noclip.Turnright = key
		Save_settings(Settings_JSON_filename,settings)
	end)
Noclip_Bindings:add_array_item(Noclip_Mouvement_turn_left,KeyCode,
	function()
		return settings.Noclip.Turnleft
	end,
	function(key)
		settings.Noclip.Turnleft = key
		Save_settings(Settings_JSON_filename,settings)
	end)
Noclip_Bindings:add_array_item(Noclip_Mouvement_increase_speed,KeyCode,
	function()
		return settings.Noclip.Increasespeed
	end,
	function(key)
		settings.Noclip.Increasespeed = key
		Save_settings(Settings_JSON_filename,settings)
	end)
Noclip_Bindings:add_array_item(Noclip_Mouvement_decrease_speed,KeyCode,
	function()
		return settings.Noclip.Decreasespeed
	end,
	function(key)
		settings.Noclip.Decreasespeed = key
		Save_settings(Settings_JSON_filename,settings)
	end
	)
Noclip_Bindings:add_array_item(Noclip_Mouvement_up,KeyCode,
	function()
		return settings.Noclip.Up
	end,
	function(key)
		settings.Noclip.Up = key
		Save_settings(Settings_JSON_filename,settings)
	end
	)
Noclip_Bindings:add_array_item(Noclip_Mouvement_down,KeyCode,
	function()
		return settings.Noclip.Down
	end,
	function(key)
		settings.Noclip.Down = key
		Save_settings(Settings_JSON_filename,settings)
	end
)
local Menu_Bindings = Bindings_menu:add_submenu(Menu_Bindings)
Menu_Bindings:add_array_item(Menu_Bindings_toggle,KeyCode,
	function()
		return Menu_keybindings[1]	
	end,
	function(k)
		Menu_keybindings[1] = KeyCode[k]
		config.Menu.KeyBindings.MenuToggle = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_select,KeyCode,
	function()
		return Menu_keybindings[2]	
	end,
	function(k)
		Menu_keybindings[2] = KeyCode[k]
		config.Menu.KeyBindings.SelectKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_back  ,KeyCode,
	function()
		return Menu_keybindings[3]	
	end,
	function(k)
		Menu_keybindings[3] = KeyCode[k]
		config.Menu.KeyBindings.BackKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_up    ,KeyCode,
	function()
		return Menu_keybindings[4]	
	end,
	function(k)
		Menu_keybindings[4] = KeyCode[k]
		config.Menu.KeyBindings.UpKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_down  ,KeyCode,
	function()
		return Menu_keybindings[5]	
	end,
	function(k)
		Menu_keybindings[5] = KeyCode[k]
		config.Menu.KeyBindings.DownKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_right ,KeyCode,
	function()
		return Menu_keybindings[6]	
	end,
	function(k)
		Menu_keybindings[6] = KeyCode[k]
		config.Menu.KeyBindings.RightKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_left  ,KeyCode,
	function()
		return Menu_keybindings[7]	
	end,
	function(k)
		Menu_keybindings[7] = KeyCode[k]
		config.Menu.KeyBindings.LeftKey = KeyCode[k]
		Save_settings("config.json",config)
	end
)
Bindings_menu:add_array_item(Boost_button_key,KeyCode,
	function()
		return settings.BoostButton.Key
	end,
	function(key)
		settings.BoostButton.Key = key
		Save_settings(Settings_JSON_filename,settings)
	end
)
Bindings_menu:add_array_item(Inventory_refill_Key,KeyCode,
	function()
		return settings.RefillKey
	end,
	function(k)
		settings.RefillKey = k
		Save_settings(Settings_JSON_filename,settings)
	end
)


Text(Settings_Reload,Settings_menu)
Settings_menu:add_array_item(Settings_Language, Menu_languages,
    function()
		for i = 0,#Menu_languages do
			if settings.Language == Menu_languages[i] then
				return i
			end
		end
    end,
    function(l)
        settings.Language = Menu_languages[l]
        Save_settings(Settings_JSON_filename,settings)
    end)
--
local Numberplates_Settings = Settings_menu:add_submenu(Numberplate_Submenu)
Numberplates_Settings:add_toggle(Settings_Numberplates_enable,
    function()
        return settings.Numberplates.Enabled
    end,
    function(n)
        settings.Numberplates.Enabled = n
		if settings.Numberplates.Custom.Enabled then settings.Numberplates.Custom.Enabled = false end
        Save_settings(Settings_JSON_filename,settings)
    end)

Numberplates_Settings:add_array_item(Settings_Numberplates_unit,units_Text,
    function()
        return settings.Numberplates.Unit
    end,
    function(u)
        settings.Numberplates.Unit = u
        Save_settings(Settings_JSON_filename,settings)
    end)
Numberplates_Settings:add_toggle(Settings_Numberplates_custom,
    function()
        return settings.Numberplates.Custom.Enabled
    end,
    function(n)
        settings.Numberplates.Custom.Enabled = n
        if settings.Numberplates.Enabled then settings.Numberplates.Enabled = false end
        Save_settings(Settings_JSON_filename,settings)
    end
)
Settings_menu:add_array_item(Settings_Shapeshift_gender,Gender,
	function()
		return settings.Gender
	end,
	function(gen)
		settings.Gender = gen
		Save_settings(Settings_JSON_filename,settings)
	end
)
Settings_menu:add_toggle(Settings_Removed_cars_default,
	function()
		return settings.RemovedCars
	end,
	function(rc)
		settings.RemovedCars = rc
		Save_settings(Settings_JSON_filename,settings)
	end
)
Settings_menu:add_toggle(Settings_Boost_button_default,
	function()
		return settings.BoostButton.Enable
	end,
	function(bb)
		settings.BoostButton.Enable = bb
		Save_settings(Settings_JSON_filename,settings)
	end
)
Settings_menu:add_toggle(Global_test_Submenu,
	function()
		return settings.GlobalTester
	end,
	function(gt)
		settings.GlobalTester = gt
		Save_settings(Settings_JSON_filename,settings)
	end
)


------------------------
------ Main menu -------

Main_menu:add_toggle(Settings_Transactionerror_Submenu,
	function()
		return Enable_transaction_error_bypass
	end,
	function()
		Enable_transaction_error_bypass = not Enable_transaction_error_bypass
	end
)

local Noclip_Toggle_hotkey = menu.register_hotkey(Noclip_bind[9],
    function()
    	Noclip_enabled = not Noclip_enabled 
    	Noclip(Noclip_enabled)
    end)

Main_menu:add_toggle(Noclip_Submenu,
    function()
	    return Noclip_enabled
    end,
    function()
	    Noclip_enabled = not Noclip_enabled 
	    Noclip(Noclip_enabled)
    end)
 
Main_menu:add_int_range(Noclip_Speed_Menu, 1, 1, 10,
    function()
    	return Noclip_Speed
    end,
    function(i)
        Noclip_Speed = i
    end)
--

local Numberplates_menu = Main_menu:add_submenu(Numberplate_Submenu)
Numberplates_menu:add_toggle(Menu_Speedometer_Bindings,
    function()
    	return Numberplate_speedometer_enabled
    end,
    function(value)
		Numberplate_speedometer_enabled = value
		if Numberplate_custom_enabled then Numberplate_custom_enabled = false end
    end)

Numberplates_menu:add_bare_item("Speed",
    function()
    	if not localplayer:is_in_vehicle() then
            return Menu_Numberplates_speed.." "..Menu_Numberplates_not_in_vehicle
        end
    	local Vehicle = Get_player_vehicle(localplayer)
    	if not Vehicle then
            return Menu_Numberplates_speed.." "..Menu_Numberplates_invalid_vehicle
        end
    	local Vehicle_Speed = round(Get_vehicle_speed(Vehicle) * Numberplate_units_value[Numberplate_units_selection], 1)
    	return Menu_Numberplates_speed.." "..Vehicle_Speed .. " " .. Numberplate_units_Text_short[Numberplate_units_selection]
    end,
    null,
    null,
    null)
Numberplates_menu:add_toggle(Numberplate_Custom_toggle,
	function()
		return Numberplate_custom_enabled
	end,
	function(value)
		Numberplate_custom_enabled = value
		if Numberplate_speedometer_enabled then Numberplate_speedometer_enabled = false end
	end)
--

Text(Separator_Text,Numberplates_menu)

function apply_plate_perm(text)
	if text:len() > 8 then return end
	if Get_player_vehicle(localplayer) then
		vehicle = Get_player_vehicle(localplayer)
		local temp = 0
		while temp < 20 do
			vehicle = Get_player_vehicle(localplayer)
			vehicle:set_number_plate_text(text)
			menu.send_key_press(83)
			temp = temp + 1
			sleep(0.01)
		end
	end
end

Custom_plates_manager_menu = Numberplates_menu:add_submenu(Numberplate_Custom_manage,Custom_plates)
for i = 1,8 do
	Numberplates_menu:add_array_item(Numberplate_Custom_character..i,Plate_Character,
		function()
			if Get_player_vehicle(localplayer) then
				Character_plate_List[i] = Get_player_vehicle(localplayer):get_number_plate_text():sub(i,i)
			elseif Character_plate_List[i] == "Plate" then
				Character_plate_List[i] = Plate_Character[1]
			end
			return Get_char_pos(Character_plate_List[i],Plate_Character)
		end,
		function(k)
			if Get_player_vehicle(localplayer) then
				local vehicle = Get_player_vehicle(localplayer)
				local plate = vehicle:get_number_plate_text()
				plate = string.sub(plate,0,i-1)..""..Plate_Character[k]..""..string.sub(plate,i+1)
				vehicle:set_number_plate_text(plate)
			end
			Character_plate_List[i] = Plate_Character[k]
		end)
end
Text(Numberplate_Custom_preview,Numberplates_menu)
Numberplates_menu:add_bare_item("",
	function()
		if Get_player_vehicle(localplayer) then
			local Vehicle = Get_player_vehicle(localplayer)
			return Vehicle:get_number_plate_text()
		end
		return List_to_string(Character_plate_List,8)
	end,
	null,
	null,
	null)
Numberplates_menu:add_action("WIP - Apply plate (permanenet)",
	function()
		apply_plate_perm(List_to_string(Character_plate_List,8))
	end)
--

Numberplates_menu:add_action(Numberplate_Custom_save_plate,
	function()
		local Current_plate_tosave = ""
		if Get_player_vehicle(localplayer) then
			local Vehicle = Get_player_vehicle(localplayer)
			Current_plate_tosave = Vehicle:get_number_plate_text()
		else
			Plate_Text = ""
			for i = 1,8 do
				Plate_Text = Plate_Text .. Numbers[Character_plate_List[i]]
			end
			Current_plate_tosave = Plate_Text
		end
		if settings.Numberplates.Custom.Platelist == nil then
			settings.Numberplates.Custom.Platelist = {Current_plate_tosave}
			Save_settings()
		else
			if Is_IN(Current_plate_tosave, settings.Numberplates.Custom.Platelist) then
				return
			else
				settings.Numberplates.Custom.Platelist[#settings.Numberplates.Custom.Platelist+1] = Current_plate_tosave
				Save_settings()
			end
		end
	end
)



function On_Vehicle_Changed(oldVehicle, newVehicle)
	Vehicle = Get_player_vehicle(localplayer)

	if Numberplate_speedometer_enabled and not Numberplate_custom_enabled and oldVehicle ~= nil then
		oldVehicle:set_number_plate_text(Numberplate_orignial_plate)
	end

	if Get_player_vehicle(localplayer) then
		Vehicle:set_can_be_visibly_damaged(not No_scratch_enabled)
		Vehicle:set_window_collisions_disabled(No_scratch_enabled)
		localplayer:set_config_flag(241, Disable_autostop)
	end
end
Main_menu:add_toggle(Menu_NoScratch,
	function()
		return No_scratch_enabled
	end,
	function()
		No_scratch_enabled = not No_scratch_enabled
		On_Vehicle_Changed()
	end)
Main_menu:add_toggle(Menu_Disable_autostop,
	function()
		if localplayer == nil then
			return false
		end
		return Disable_autostop
	end,
	function(value)
		Disable_autostop = value
		On_Vehicle_Changed()
	end)
Main_menu:add_action(Menu_LSC_Reset, function() 
	stats.set_int("MPPLY_VEHICLE_SELL_TIME", 0)
	stats.set_int("MPPLY_NUM_CARS_SOLD_TODAY", 0)
	end)
menu.register_callback("OnVehicleChanged",On_Vehicle_Changed)

-----------------------------------------------
-- Rainbow Car and Boost Script by Quad_Plex -- Modified
-----------------------------------------------

local Boost_button_menu = Main_menu:add_submenu(Boost_button_Submenu)
menu.register_hotkey(settings.BoostButton.Key, Boost_button_Car_boost)
Boost_button_menu:add_toggle(Boost_Toggle,function() return Boost_button_boost_activate end,function(b) Boost_button_boost_activate = b end)
Boost_button_menu:add_int_range(Boost_Strength, 5, 0, 690, function() return Boost_button_multiplier_percent end, function(value) Boost_button_multiplier_percent = value end)

local Gay_car_menu = Main_menu:add_submenu(Gay_car_Submenu)
Gay_car_menu:add_toggle(Gay_car_Toggle,function() return Rainbow_activated end, function(a) Rainbow_activated = a end)
Gay_car_menu:add_array_item(Gay_car_Style, colorStyles, function() return Cay_car_Color_style end, function(value) Cay_car_Color_style = value Gay_car_Toggle_color_function(value) end)
Gay_car_menu:add_toggle(Gay_car_Uniform, function() return Gay_car_Is_Uniform end, function(value) Gay_car_Is_Uniform = value end)
Gay_car_menu:add_toggle(Gay_car_Traffic, function() return Gay_car_Affect_traffic end, function(value) Gay_car_Affect_traffic = value end)
Gay_car_menu:add_int_range(Gay_car_Multiplier, 1, 1, 69, function() return Gay_car_Multiplier end, function(value) Gay_car_Multiplier = value end)

-----------------------------------------------


local Online_stats_menu = Unlocks_menu:add_submenu(Online_stats_Submenu)
Online_stats_menu:add_int_range(Stats_Stamina , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_stam")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_stam", value)
	end)
 
Online_stats_menu:add_int_range(Stats_Strength, 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_strn")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_strn", value)
	end)
 
Online_stats_menu:add_int_range(Stats_Lung    , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_lung")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_lung", value)
	end)
 
Online_stats_menu:add_int_range(Stats_Driving , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_driv")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_driv", value)
	end)
 
Online_stats_menu:add_int_range(Stats_Flying  , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_fly")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_fly", value)
	end)
 
Online_stats_menu:add_int_range(Stats_Shooting, 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_sho")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_sho", value)
	end)
 
Online_stats_menu:add_int_range(Stats_Stealth , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_stl")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_stl", value)
	end)
 
Online_stats_menu:add_int_range(Stats_Mechanic, 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_mech")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_mech", value)
	end)
Online_stats_menu:add_int_range(Stats_Mental, 1, 0, 100,
	function()
		return math.floor(stats.get_float(mpx().."PLAYER_MENTAL_STATE"))
	end,
	function(state)
		stats.set_float(mpx().."PLAYER_MENTAL_STATE", state)
	end)
--

Normal_rank_Character = {}
Crew_rank_Character = {}

function RP_Editor_Menu()
	RP_editor_menu:clear()

	Rank_temp = stats.get_int(mpx().."CHAR_RANK_FM")
	Crew_rank_temp = stats.get_int("MPPLY_CURRENT_CREW_RANK")

	Text(Half_Separator_Function(RP_Rank),RP_editor_menu)
	for i = 1,4 do
		Normal_rank_Character[i] = math.floor(Rank_temp/(10^(4-i)))%10
		RP_editor_menu:add_array_item(Numberplate_Custom_character..i,Numbers,
			function()
				if Normal_rank_Character[i] == nil then
					Normal_rank_Character[i] = 0
				end
				if localplayer ~= nil then
					return Normal_rank_Character[i]
				end
			end,
			function(n)
				Normal_rank_Character[i] = n
			end
		)
	end
	Text(Separator_Text,RP_editor_menu)
	RP_editor_menu:add_bare_item("",
		function()
			if List_to_string(Normal_rank_Character,4) == tostring(Rank_temp) then
				return "Current Rank: "..tostring(Rank_temp)
			end
			return "Set Rank: "..List_to_string(Normal_rank_Character,4)
		end,
		function()
			if List_to_string(Normal_rank_Character,4) == tostring(Rank_temp) then return end
			new_rank = 0
			for i = 0,3 do
				new_rank = new_rank + Normal_rank_Character[4-i]*(10^i)
			end
			new_rank = math.floor(new_rank)
			if new_rank > 8000 then return end
			stats.set_int(mpx().."CHAR_SET_RP_GIFT_ADMIN", Rank_to_RP(new_rank))
			stats.set_int("MPPLY_GLOBALXP", Rank_to_RP(new_rank))
			sleep(1)
			Session_changer(8)
		end,
		null,
		null
	)

	Text(Half_Separator_Function(RP_Crew),RP_editor_menu)
	for i = 1,4 do
		Crew_rank_Character[i] = math.floor(Crew_rank_temp/(10^(4-i)))%10
		RP_editor_menu:add_array_item(Numberplate_Custom_character..i,Numbers,
			function()
				if Crew_rank_Character[i] == nil then
					Crew_rank_Character[i] = 0
				end
				if localplayer ~= nil then
					return Crew_rank_Character[i]
				end
			end,
			function(n)
				Crew_rank_Character[i] = n
			end
		)
	end
	Text(Separator_Text,RP_editor_menu)
	RP_editor_menu:add_bare_item("",
		function()
			if List_to_string(Crew_rank_Character,4) == tostring(Crew_rank_temp) then
				return "Current Rank: "..tostring(Crew_rank_temp)
			end
			return "Set Rank: "..List_to_string(Crew_rank_Character,4)
		end,
		function()
			if List_to_string(Crew_rank_Character,4) == tostring(Crew_rank_temp) then return end
			new_rank = 0
			for i = 0,3 do
				new_rank = new_rank + Crew_rank_Character[4-i]*(10^i)
			end
			new_rank = math.floor(new_rank)
			if new_rank > 8000 then return end
			for i = 0, 4 do
				stats.set_int("MPPLY_CREW_LOCAL_XP_"..i, Rank_to_RP(new_rank))
			end
		end,
		null,
		null
	)

	Text(Separator_Text,RP_editor_menu)

end
RP_editor_menu = Unlocks_menu:add_submenu(RP_Submenu,RP_Editor_Menu)


local Achivement_menu = Unlocks_menu:add_submenu(Achivement_Submenu) 
	Text(Achivement_Text, Achivement_menu)
	Text(Separator_Text, Achivement_menu)
	for i = 1,#Achivement_List do
		Achivement_menu:add_action(Achivement_List[i], function() globals.set_int(Achivement_global, i) end)
	end
--

Unlocks_menu:add_array_item(Unlocks_Badsport, Unlocks_Badsport_List,
	function()
		return Badsport_state
	end,
	function(label)
		Badsport_state = label
		if label == 2 then
			value1, value2, value3 = -1, 60000, true
		elseif label == 3 then
			value1, value2, value3 = 0, 0, false
		end
		stats.set_int("MPPLY_BADSPORT_MESSAGE", value1)
		stats.set_int("MPPLY_BECAME_BADSPORT_NUM", value1)
		stats.set_float("MPPLY_OVERALL_BADSPORT", value2)
		stats.set_bool("MPPLY_CHAR_IS_BADSPORT", value3)
	end)
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


Text(Menu_Enhanced_online,Main_menu)

Main_menu:add_toggle(Menu_RemovedCars_toggle,
    function()
        return Removed_cars
    end,
    function(k)
        Removed_cars = k
        Switch_vehicle_enabled_state()
    end
)

Main_menu:add_action(Menu_Casino_Bypass,
	function()
		stats.set_int("MPPLY_CASINO_CHIPS_WON_GD", 0)
		stats.set_int("MPPLY_CASINO_CHIPS_WONTIM", 0)
		stats.set_int("MPPLY_CASINO_GMBLNG_GD", 0)
		stats.set_int("MPPLY_CASINO_BAN_TIME", 0)
		stats.set_int("MPPLY_CASINO_CHIPS_PURTIM", 0)
		stats.set_int("MPPLY_CASINO_CHIPS_PUR_GD", 0)
	end)
Main_menu:add_action(Inventory_refill_Key,function() Refill_inventory() end)
Main_menu:add_action(Menu_Make_nightclub_popular, function() stats.set_int(mpx().."club_popularity", 1000) end)
Main_menu:add_action(Menu_Challenge,
	function()
		stats.set_bool(mpx().."CARMEET_PV_CHLLGE_CMPLT", true)
		stats.set_bool(mpx().."CARMEET_PV_CLMED", false)
	end)

menu.register_hotkey(Inventory_refill_hotkey, Refill_inventory)


local function Report_Menu()
	Report_stats_menu:clear()
	Text(Menu_Readonly,Report_stats_menu)
	Text(stats.get_int("MPPLY_GRIEFING")           .." ← "..Report_List[01], Report_stats_menu)
	Text(stats.get_int("MPPLY_EXPLOITS")           .." ← "..Report_List[02], Report_stats_menu)
	Text(stats.get_int("MPPLY_GAME_EXPLOITS")      .." ← "..Report_List[03], Report_stats_menu)
	Text(stats.get_int("MPPLY_TC_ANNOYINGME")      .." ← "..Report_List[04], Report_stats_menu)
	Text(stats.get_int("MPPLY_TC_HATE")            .." ← "..Report_List[05], Report_stats_menu)
	Text(stats.get_int("MPPLY_VC_ANNOYINGME")      .." ← "..Report_List[06], Report_stats_menu)
	Text(stats.get_int("MPPLY_VC_HATE")            .." ← "..Report_List[07], Report_stats_menu)
	Text(stats.get_int("MPPLY_OFFENSIVE_LANGUAGE") .." ← "..Report_List[08], Report_stats_menu)
	Text(stats.get_int("MPPLY_OFFENSIVE_TAGPLATE") .." ← "..Report_List[09], Report_stats_menu)
	Text(stats.get_int("MPPLY_OFFENSIVE_UGC")      .." ← "..Report_List[10], Report_stats_menu)
	Text(stats.get_int("MPPLY_BAD_CREW_NAME")      .." ← "..Report_List[11], Report_stats_menu)
	Text(stats.get_int("MPPLY_BAD_CREW_MOTTO")     .." ← "..Report_List[12], Report_stats_menu)
	Text(stats.get_int("MPPLY_BAD_CREW_STATUS")    .." ← "..Report_List[13], Report_stats_menu)
	Text(stats.get_int("MPPLY_BAD_CREW_EMBLEM")    .." ← "..Report_List[14], Report_stats_menu)
	Text(stats.get_int("MPPLY_FRIENDLY")           .." ← "..Report_List[15], Report_stats_menu)
	Text(stats.get_int("MPPLY_HELPFUL")            .." ← "..Report_List[16], Report_stats_menu)
end
Report_stats_menu=Main_menu:add_submenu(Menu_Report_Submenu,Report_Menu)

------------------------
----- Global Test ------

function Global_Tester_9000()
    Global_tester_menu:clear()

    Global_tester_menu:add_array_item(Global_Mode,Global_tester_Mode_List, function() return Global_tester_Mode end, function(a) Global_tester_Mode = a end)
    Global_tester_menu:add_array_item(Global_Type,Global_tester_Type_List, function() return Global_tester_Type end, function(a) Global_tester_Type = a end)
    Global_tester_menu:add_array_item("Script →",Global_tester_Scripts_List, function() return Global_tester_Scripts end, function(a) Global_tester_Scripts = a end)

    
    Text(Separator_Text,Global_tester_menu)
    Text(White_space.."Global/Stat",Global_tester_menu)

    for i = 1,#Global_tester_current_global_List do
        Global_tester_menu:add_array_item(Global_Character..#Global_tester_current_global_List-i+1, Numbers, function() return Global_tester_current_global_List[#Global_tester_current_global_List-i+1]+1 end, function(g) Global_tester_current_global_List[#Global_tester_current_global_List-i+1] = g-1 end)
    end

    Global_tester_menu:add_toggle(Global_Global, function() return Global_tester_Global_offset_use end, function(e) Global_tester_Global_offset_use = e end)

    Global_tester_menu:add_bare_item("",
        function()
            Global_tester_Current_global = Global_tester_current_global_List[1]
            for i = 2,#Global_tester_current_global_List do
                Global_tester_Current_global = Global_tester_Current_global + Global_tester_current_global_List[i]*10^(i-1)
            end

            if Global_tester_Global_offset_use then return Global_Current .. Global_Offset .. "+" .. Global_tester_Current_global else return Global_Current .. Global_tester_Current_global end
        end,null,null,null
    )


    -- Write

    Text(Separator_Text,Global_tester_menu)
    Text(White_space..Write_Global.." ("..Value_Global..")",Global_tester_menu)

    for i = 1,#Global_tester_Current_setter_List do
        Global_tester_menu:add_array_item(Global_Character..#Global_tester_Current_setter_List-i+1, Numbers, function() return Global_tester_Current_setter_List[#Global_tester_Current_setter_List-i+1]+1 end, function(g) Global_tester_Current_setter_List[#Global_tester_Current_setter_List-i+1] = g-1 end)
	end

   Global_tester_menu:add_action(Write_Global,
        function()
			Global_tester_Current_setter = Global_tester_Current_setter_List[1]
            for i = 2,#Global_tester_Current_setter_List do
                Global_Tester_Current_setter = Global_Tester_Current_setter + Global_tester_Current_setter_List[i]*10^(i-1)
			end

            Global_tester_Current_global = Global_tester_current_global_List[1]
            for i = 2,#Global_tester_current_global_List do
                Global_tester_Current_global = Global_tester_Current_global + Global_tester_current_global_List[i]*10^(i-1)
            end

            if Global_tester_Global_offset_use then Global_tester_Current_global = Global_Offset+Global_tester_Current_global end
            
            if Global_tester_Mode == 1 then Global_Tester_Set_global(Global_tester_Current_global, Global_tester_Current_setter, Global_tester_Type_List[Global_tester_Type])
            elseif Global_tester_Mode == 2 then Global_Tester_Set_stat(Global_tester_Current_global, Global_tester_Current_setter, Global_tester_Type_List[Global_tester_Type])
            elseif Global_tester_Mode == 3 then Global_Tester_Set_script(Global_tester_Current_global, Global_tester_Current_setter, Global_tester_Type_List[Global_tester_Type])
            end
        end
    )


    -- Read

    Text(Separator_Text,Global_tester_menu)
    Text(White_space..Read_Global,Global_tester_menu)

    Global_tester_menu:add_toggle(Reading_Global, function() return Global_tester_Is_reading end, function(e) Global_tester_Is_reading = e end)
    Global_tester_menu:add_bare_item("",
        function()
			Global_tester_Current_global = Global_tester_current_global_List[1]
            for i = 2,#Global_tester_current_global_List do
                Global_tester_Current_global = Global_tester_Current_global + Global_tester_current_global_List[i]*10^(i-1)
            end

            if Global_tester_Global_offset_use then Global_tester_Current_global = Global_Offset+Global_tester_Current_global end

            if Global_tester_Is_reading then
                if Global_tester_Mode == 1 then return Value_Global..Global_Tester_Get_global(Global_tester_Current_global, Global_tester_Type_List[Global_tester_Type])
                elseif Global_tester_Mode == 2 then return Value_Global..Global_Tester_Get_stat(Global_tester_Current_global, Global_tester_Type_List[Global_tester_Type])
                elseif Global_tester_Mode == 3 then return Value_Global..Global_Tester_Get_script(Global_tester_Current_global, Global_tester_Type_List[Global_tester_Type])
                end
            else return Value_Global.." NaN"
            end
        end,null,null,null
    )


    local function create_global_listing()
        Global_tester_Saved_globals_List[#Global_tester_Saved_globals_List+1] = {Global_tester_Current_global, Global_tester_Type_List[Global_tester_Type], Global_tester_Mode, Global_tester_Global_offset_use, }
        
        Global_tester_menu:add_bare_item("",
            function()
                local current_thing_read = Global_tester_Saved_globals_List[#Global_tester_Saved_globals_List]
                if Global_tester_Is_reading then
                    if current_thing_read[4] then
                        if current_thing_read[3] == 1 then return Global_Offset..current_thing_read[1].." → "..Global_Tester_Get_global(Global_Offset+current_thing_read[1], current_thing_read[2])
                        elseif current_thing_read[3] == 2 then return Global_Offset..current_thing_read[1].." → "..Global_Tester_Get_stat(Global_Offset+current_thing_read[1], current_thing_read[2])
                        elseif current_thing_read[3] == 3 then return Global_Offset..current_thing_read[1].." → "..Global_Tester_Get_script(Global_Offset+current_thing_read[1], current_thing_read[2])
                        end
                    else
                        if current_thing_read[3] == 1 then return current_thing_read[1].." → "..Global_Tester_Get_global(current_thing_read[1], current_thing_read[2])
                        elseif current_thing_read[3] == 2 then return current_thing_read[1].." → "..Global_Tester_Get_stat(current_thing_read[1], current_thing_read[2])
                        elseif current_thing_read[3] == 3 then return current_thing_read[1].." → "..Global_Tester_Get_script(current_thing_read[1], current_thing_read[2])
                        end
                    end
                else return Value_Global.." NaN"
                end
            end,null,null,null
        )
    end
    Global_tester_menu:add_action(Global_List,function() create_global_listing() end)
end

if settings.GlobalTester then
    Text(Separator_Text, Cookie_menu)
    Global_tester_menu = Cookie_menu:add_submenu(Global_test_Submenu, Global_Tester_9000)
end

Text(Separator_Text, Cookie_menu)

------------------------
------- Credits --------

Credits_Roy = Credits_Menu:add_submenu("Roy007")
	Text(White_space.."Base Script",Credits_Roy)
	Text("And the motivation",Credits_Roy)
	Text("to continue his work",Credits_Roy)

Credits_Quadplex = Credits_Menu:add_submenu("quadplex")
	Text("No clip",Credits_Quadplex)
	Text("One-Click-GO-QUICK™",Credits_Quadplex)
	Text(White_space.."(modified)",Credits_Quadplex)
	Text("Rainbow vehicles",Credits_Quadplex)

Credits_SilentHy6 = Credits_Menu:add_submenu("SilentHy6")
	Text("Enhancement from they're script",Credits_SilentHy6)
	Text(White_space.."Heists Presets Idea",Credits_SilentHy6)
	Text(White_space.."Skip Cooldown",Credits_SilentHy6)
	Text(White_space.."More Heists skips",Credits_SilentHy6)
	Text(White_space.."RP Editors",Credits_SilentHy6)

Credits_RandomAlt = Credits_Menu:add_submenu("randomAlt69420 (nice)")
	Text("Numberplate Speedometer",Credits_RandomAlt)

Credits_UnkownXit = Credits_Menu:add_submenu("Unkn0wnXit")
	Text("Autoshop Script",Credits_UnkownXit)
	Text(" (with WoTak)",Credits_UnkownXit)

Credits_Silentsalo = Credits_Menu:add_submenu("silentsalo (discord)")
	Text("Small Ideas",Credits_Silentsalo)
--


-- Th3 L0oP

function OnScriptsLoaded()
	while true do
		if Rainbow_activated then
			if Get_player_vehicle(localplayer) then
				vehicle = Get_player_vehicle(localplayer)
				if Is_IN(999,Gay_car_Vehicle_original_color) then
					Gay_car_Vehicle_original_color[1],Gay_car_Vehicle_original_color[2],Gay_car_Vehicle_original_color[3] = vehicle:get_custom_primary_colour()
					Gay_car_Vehicle_original_color[4],Gay_car_Vehicle_original_color[5],Gay_car_Vehicle_original_color[6] = vehicle:get_custom_secondary_colour()
				end

				local function applyColor(colorFunc)
					if Gay_car_Affect_traffic then
						for Vehicle in replayinterface.get_vehicles() do
							Gay_car_Change_vehicle_color(Vehicle, colorFunc)
						end
					elseif vehicle then
						Gay_car_Change_vehicle_color(vehicle, colorFunc)
					end

					sleep(0.04)

					if not Get_player_vehicle(localplayer) and not Gay_car_Affect_traffic then
						return false
					end
					return true
				end

				if Gay_car_Rainbow and applyColor(Gay_car_Next_color) then
				elseif Gay_car_Strobelight and applyColor(Gay_car_Strobelight) then
				elseif Gay_car_Random and applyColor(Gay_car_Random_color) then
				end
			end
		end
		if not Rainbow_activated then
			if Get_player_vehicle(localplayer) and not Is_IN(999,Gay_car_Vehicle_original_color) then
				vehicle:set_custom_primary_colour(Gay_car_Vehicle_original_color[1],Gay_car_Vehicle_original_color[2],Gay_car_Vehicle_original_color[3])
				vehicle:set_custom_secondary_colour(Gay_car_Vehicle_original_color[4],Gay_car_Vehicle_original_color[5],Gay_car_Vehicle_original_color[6])
				Gay_car_Vehicle_original_color = {999,999,999,999,999,999}
			end
		end

		if Enable_transaction_error_bypass then
			globals.set_int(Is_transaction_error_notification_shown_1 ,0)
			globals.set_int(Is_transaction_error_notification_shown_2 ,0)
			globals.set_int(Is_transaction_error_banner_shown ,0)
		end

		if Numberplate_speedometer_enabled or Numberplate_custom_enabled then
			if Get_player_vehicle(localplayer) then
				vehicle = Get_player_vehicle(localplayer)
				if Numberplate_orignial_plate == "________" then
					Numberplate_orignial_plate = vehicle:get_number_plate_text()
				end

				local Vehicle_Speed = round(Get_vehicle_speed(vehicle) * Numberplate_units_value[Numberplate_units_selection], 0)

				if Numberplate_speedometer_enabled and not Numberplate_custom_enabled and Vehicle_Speed ~= nil then
					if Vehicle_Speed >= round(7*Numberplate_units_value[Numberplate_units_selection]) then
						vehicle:set_number_plate_text((Vehicle_Speed < 10 and "   " or Vehicle_Speed < 100 and "  " or Vehicle_Speed < 1000 and " " or "") .. Vehicle_Speed .. " " .. Numberplate_units_Text_numberplate[Numberplate_units_selection])
					else
						vehicle:set_number_plate_text(Numberplate_orignial_plate)
						Numberplate_orignial_plate = "________"
					end
				elseif Numberplate_custom_enabled and not Numberplate_speedometer_enabled and settings.Numberplates.Custom.Platedefault ~= 0 then
					if Sup3r_2000 then
						vehicle:set_number_plate_text("K 2000")
					else
						vehicle:set_number_plate_text(settings.Numberplates.Custom.Platelist[settings.Numberplates.Custom.Platedefault])
					end
				end
			end
		end



		sleep(0.1)
	end
end

menu.register_callback('OnScriptsLoaded', OnScriptsLoaded)