require("scripts/globals")
require("scripts/AA_language")
local success, settings = pcall(json.loadfile, Settings_JSON_Filename)

-- List and Variables

local Player_List={}

local Doomsday_Heist_Prep_List={"Deluxos",
    "Akula",
    "Key Cards",
    "ULP Intel",
    "Riot Control van",
    "Stormbergs",
    "Torpedo ECH",
    "Markd Cash",
    "Recon",
    "Chernobog",
    "Flight Path",
    "Test Site Intel",
    "Onboard Compputer"}
    Doomsday_Heist_Prep_List[0]="Paramedic Equipment"
local Doomsday_Heist_Missions_List={"Signal Intercept",
    "ServerFarm",
    "Unknown",
    "Avenger",
    "Rescue ULP",
    "Salvage Hard Drives",
    "Submarine Recon",
    "Unknown",
    "Rescue Agent14",
    "Rescue ULP",
    "Barrage",
    "Khanjali",
    "Air Defences"}
    Doomsday_Heist_Missions_List[0]="Dead Courier"
local Doomsday_Heist_List={ "Data Breaches", "Bogdan Problem", "Doomsday Scenario"}
local Doomsday_Missions_Status={"Completed","Stolen","Skipped"} Doomsday_Missions_Status[0]="Incomplete"

-- Functions

local function Doomsday_Preperation(i,v)
	if v~=nil then
        if i>13 then
            stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",v,i)
            stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",v,i-14)
		    if v then
                stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_SKIP",false,i-14)
            end
        else
            stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",v,i)
	    	if v then
                stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",false,i+14)
                stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_SKIP",false,i)
            end
        end
	else
        return stats.get_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",i)
    end
end
local function Doomsday_Preperation_Skip(i,v)
	if v~=nil then
        stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_SKIP",v,i)
        if v then
            stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",true,i)
	        stats.set_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_PROG",false,i+14)
        end
    else
        return stats.get_bool_masked("MP"..mpx().."_GANGOPS_FM_MISSION_SKIP",i)
    end
end
local function Doomsday_Missions(i,v)
	if v~=nil then
        stats.set_bool_masked("MP"..mpx().."_GANGOPS_FLOW_MISSION_PROG",v,i)
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
        return stats.get_bool_masked("MP"..mpx().."_GANGOPS_FLOW_MISSION_PROG",i)
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



-- Dommsday

Doomsday_Menu = menu.add_submenu("Doomsday")

-- Dommsday Setup

local Doomsday_Setup_Menu=nil

local function Doomsday_Setup_Function()
	Doomsday_Setup_Menu:clear()
	Heist_Player_List()

	Doomsday_Setup_Menu:add_array_item("Setup D'Day", Doomsday_Heist_List,
	    function()
	    	return 3
	    end,
	    function(ActNum)
	    	if ActNum==1 then
	    		Doomsday_Progression=7
	    		Doomsday_Progression2=7
	    	elseif ActNum==2 then
	    		Doomsday_Progression=240
	    		Doomsday_Progression2=248
	    	else
	    		Doomsday_Progression=15872
	    		Doomsday_Progression2=16128
	    	end 
	    	stats.set_int("MP"..mpx().."_GANGOPS_FLOW_MISSION_PROG", Doomsday_Progression)
	    	stats.set_int("MP"..mpx().."_GANGOPS_FM_MISSION_PROG", Doomsday_Progression2)
	    end)

	Doomsday_Custom_Setup_Menu=Doomsday_Setup_Menu:add_submenu("Custom Setup (Toggle requried Only!)")

	Text("---------------[ACT-I: Data Breaches]",Doomsday_Custom_Setup_Menu)
	    for i=0,2 do
            Doomsday_Custom_Setup_Menu:add_array_item("Prep- "..Doomsday_Heist_Prep_List[i] , Doomsday_Missions_Status,
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
	    	Doomsday_Custom_Setup_Menu:add_toggle("      Setup"..Doomsday_Heist_Missions_List[i], function() return Doomsday_Missions(i) end, function() Doomsday_Missions(i,not Doomsday_Missions(i)) end)
        end
	    Doomsday_Custom_Setup_Menu:add_toggle(Doomsday_Heist_Missions_List[3], function() return Doomsday_Missions(3) end, function() end)

	Text("---------------[ACT-II: Bogdan Problem]",Doomsday_Custom_Setup_Menu)
	    for i=4,7 do
            Doomsday_Custom_Setup_Menu:add_array_item("Prep- "..Doomsday_Heist_Prep_List[i-1], Doomsday_Missions_Status,
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
                Doomsday_Custom_Setup_Menu:add_array_item("Prep- "..Doomsday_Heist_Prep_List[i] , Doomsday_Missions_Status,
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
	    	Doomsday_Custom_Setup_Menu:add_toggle("      Setup"..Doomsday_Heist_Missions_List[i], function() return Doomsday_Missions(i) end, function() Doomsday_Missions(i,not Doomsday_Missions(i)) end)
        end
	    Doomsday_Custom_Setup_Menu:add_toggle(Doomsday_Heist_Missions_List[8],function()return Doomsday_Missions(8)end,function()Doomsday_Missions(8,not Doomsday_Missions(8))end)

	Text("---------------[ACT-III: Doomsday Scenario]",Doomsday_Custom_Setup_Menu)

	    Doomsday_Custom_Setup_Menu:add_array_item("Prep- "..Doomsday_Heist_Prep_List[8] , Doomsday_Missions_Status,
	    	function()
	    		if Doomsday_Preperation(8+14)then
	    			return 2
	    		elseif Doomsday_Preperation_Skip(8) then
	    			return 3
	    		elseif Doomsday_Preperation(8) then
	    			return 1
	    		end
	    		return 0
	    	end,
	    	function(o)
	    		if o==1 then
	    			Doomsday_Preperation(8,true)
	    		elseif o==2 then
	    			Doomsday_Preperation(8+14,true)
	    		elseif o==3 then
	    			Doomsday_Preperation_Skip(8,true)
	    		else
	    			Doomsday_Preperation(8+14,false)
	    			Doomsday_Preperation_Skip(8,false)
	    		end
	    	end)

	    Doomsday_Custom_Setup_Menu:add_array_item("Prep- "..Doomsday_Heist_Prep_List[9] , Doomsday_Missions_Status,
	    	function()
	    		if Doomsday_Preperation(9+14) then
	    			return 2
	    		elseif Doomsday_Preperation_Skip(9) then
	    			return 3
	    		elseif Doomsday_Preperation(9) then
	    			return 1
	    		end
	    		return 0
	    	end,
	    	function(o)
	    		if o==1 then
	    			Doomsday_Preperation(9,true)
	    		elseif o==2 then
	    			Doomsday_Preperation(9+14,true)
	    		elseif o==3 then
	    			Doomsday_Preperation_Skip(9,true)
	    		else
	    			Doomsday_Preperation(9+14,false)
	    			Doomsday_Preperation_Skip(9,false)
	    		end
	    	end)

	    Doomsday_Custom_Setup_Menu:add_toggle("      Setup"..Doomsday_Heist_Missions_List[9] , function() return Doomsday_Missions(9) end, function() Doomsday_Missions(9,not Doomsday_Missions(9)) end) 

	    for i=10,13 do
	    	Doomsday_Custom_Setup_Menu:add_array_item("Prep- "..Doomsday_Heist_Prep_List[i] , Doomsday_Missions_Status,
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
	    	Doomsday_Custom_Setup_Menu:add_toggle("      Setup"..Doomsday_Heist_Missions_List[i] , function() return Doomsday_Missions(i) end, function() Doomsday_Missions(i,not Doomsday_Missions(i)) end)
	    end
    Text("Current Act? "..globals.get_int(1967630+812+78),Doomsday_Setup_Menu)
end
Doomsday_Setup_Menu=Doomsday_Menu:add_submenu("Doomsday Setup",Doomsday_Setup_Function)



-- Doomsday Cuts

local function Doomsday_Cuts()
    Doomsday_cuts_menu:clear()
	P1,P2 = Notinheist_text, nil
    if globals.get_int(Doomsday_Cut_offset+1) <= 1000 and globals.get_int(Doomsday_Cut_offset+1) >= 0 then
        -- Get names for cuts
        if globals.get_int(Doomsday_Cut_offset+1)>=15 then if player.get_player_ped(0)==localplayer then P1=You_text else P1=player.get_player_name(0)end
		if globals.get_int(Doomsday_Cut_offset+2)>=15 then if player.get_player_ped(1)==localplayer then P2=You_text else P2=player.get_player_name(1)end
		if globals.get_int(Doomsday_Cut_offset+3)>=15 then if player.get_player_ped(2)==localplayer then P3=You_text else P3=player.get_player_name(2)end
		if globals.get_int(Doomsday_Cut_offset+4)>=15 then if player.get_player_ped(3)==localplayer then P4=You_text else P4=player.get_player_name(3)end
        end end end end

		Text("---------↓ Player Cuts ↓---------",Doomsday_cuts_menu)

        -- Cut selector
        Doomsday_cuts_menu:add_array_item(Cut_Player1..""..P1, Cut_percent, function() return math.floor(globals.get_int(Doomsday_Cut_offset+1)/5-1) end, function(p) Doomsday_P1_Cut = (p+1)*5 end)
        if P2 then
            Doomsday_cuts_menu:add_array_item(Cut_Player2..""..P2, Cut_percent, function() return math.floor(globals.get_int(Doomsday_Cut_offset+2)/5-1) end, function(p) Doomsday_P2_Cut = (p+1)*5 end)
        end
        if P3 then
            Doomsday_cuts_menu:add_array_item(Cut_Player3..""..P3, Cut_percent, function() return math.floor(globals.get_int(Doomsday_Cut_offset+3)/5-1) end, function(p) Doomsday_P3_Cut = (p+1)*5 end)
        end
        if P4 then
            Doomsday_cuts_menu:add_array_item(Cut_Player4..""..P4, Cut_percent, function() return math.floor(globals.get_int(Doomsday_Cut_offset+4)/5-1) end, function(p) Doomsday_P4_Cut = (p+1)*5 end)
        end

        -- Cut setter
        Doomsday_cuts_menu:add_array_item(Set_text, Cut_Setter, function() return 1 end, function(Casino_Cut_Sellector)
            if Casino_Cut_Sellector == 2 then
                Doomsday_P1_Cut, Doomsday_P2_Cut, Doomsday_P3_Cut, Doomsday_P4_Cut = 100, 100, 100, 100
            end

            if Doomsday_P1_Cut >= 15 and Doomsday_P1_Cut then
                globals.set_int(Doomsday_Cut_offset+1, Doomsday_P1_Cut)
            end
            if Doomsday_P2_Cut >= 15 and Doomsday_P2_Cut then
                globals.set_int(Doomsday_Cut_offset+2, Doomsday_P2_Cut)
            end
            if Doomsday_P3_Cut >= 15 and Doomsday_P3_Cut then
                globals.set_int(Doomsday_Cut_offset+3, Doomsday_P3_Cut)
            end
            if Doomsday_P4_Cut >= 15 and Doomsday_P4_Cut then
                globals.set_int(Doomsday_Cut_offset+4, Doomsday_P4_Cut)
            end
        end)
    end
end
Doomsday_cuts_menu=Doomsday_Menu:add_submenu("Doomsday Cuts", Doomsday_Cuts)

-- Appartements