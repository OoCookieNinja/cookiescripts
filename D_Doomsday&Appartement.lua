require("scripts/globals")
require("scripts/A_language")
local success, settings = pcall(json.loadfile, Settings_JSON_Filename)

-- Lists and Variables
local Player_List={}
local Doomsday_P1_Cut,Doomsday_P2_Cut,Doomsday_P3_Cut,Doomsday_P4_Cut = 0,0,0,0
local Appartements_P1_Cut,Appartements_P2_Cut,Appartements_P3_Cut,Appartements_P4_Cut = 0,0,0,0
local Doomsday_Cuts_List = {}
local Appartements_Cuts_List = {}
local P = {}
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
local function Appartements_Missions(i,v)
    i = i*3
	if v~=nil then
        stats.set_bool_masked("MP"..mpx().."_HEIST_PLANNING_STAGE",v,i)
    else
        return
        stats.get_bool_masked("MP"..mpx().."_HEIST_PLANNING_STAGE",i)
    end
end

------------------------
------- Dommsday -------

local Doomsday_Menu = menu.add_submenu(Doomsday_Menu)

-- Dommsday Setup
local Doomsday_Setup_Menu=nil
local function Doomsday_Setup_Function()
	Doomsday_Setup_Menu:clear()
	Heist_Player_List()
    local Current_Dommsday_act = 0
    function Get_Doomsday_Act()
        for i = 1,3 do
            if stats.get_int("mp"..mpx().."_gangops_heist_status")%4 == i then
                return i
            end
        end
        return 0
    end
    Text(round(stats.get_int("mp"..mpx().."_gangops_heist_status")        ),Doomsday_Setup_Menu)
    Text(round(stats.get_int("mp"..mpx().."_gangops_heist_status")%4),Doomsday_Setup_Menu)
    Text(round(stats.get_int("mp"..mpx().."_gangops_heist_status")%8),Doomsday_Setup_Menu)
    Get_Doomsday_Act()
	Doomsday_Setup_Menu:add_array_item(Doomsday_Set_Act,Doomsday_Heist_List,
        function()
            return Get_Doomsday_Act()
        end,
        function(Act_Num)
            stats.set_int("mp"..mpx().."_gangops_heist_status",Act_Num)
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
	    	stats.set_int("MP"..mpx().."_GANGOPS_FLOW_MISSION_PROG", Doomsday_Progression)
	    	stats.set_int("MP"..mpx().."_GANGOPS_FM_MISSION_PROG", Doomsday_Progression2)
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
        -- Get names for cuts
		for i = 1,4 do
			if globals.get_int(Doomsday_Cut_offset+i)>=15 then if player.get_player_ped(i-1)==localplayer then P[i]=You_text else P[i]=player.get_player_name(i-1) end end
		end

		Text(Cut_Player,Doomsday_cuts_menu)
        -- Cut selector
        Doomsday_cuts_menu:add_array_item(Cut_Player_List[1]..P[1], Cut_percent, function() return math.floor(globals.get_int(Doomsday_Cut_offset+1)/5-1) end, function(p) Doomsday_Cuts_List[1] = (p+1)*5 end)
		for i = 2,3 do
        	if P[i] then
        	    Doomsday_cuts_menu:add_array_item(Cut_Player_List[i]..P[i], Cut_percent, function() return math.floor(globals.get_int(Doomsday_Cut_offset+i)/5-1) end, function(p) Doomsday_Cuts_List[i] = (p+1)*5 end)
        	end
		end
		Doomsday_cuts_menu:add_array_item("Slider for evey player", Cut_percent,
			function()
                if P[1] then
                    Player_Cut_Max = Doomsday_Cuts_List[1]
				    for i = 1,4 do
                        if P[i] then
                            Player_Cut_Max = math.max(Player_Cut_Max, Doomsday_Cuts_List[i])
				    	    if Player_Cut_Max == globals.get_int(Doomsday_Cut_offset+i) and globals.get_int(Doomsday_Cut_offset+i) >= 15 then
				    	    	return math.floor(globals.get_int(Doomsday_Cut_offset+i)/5-1)
				    	    end
                        end
				    end
                else
                    return 0
                end
			end,
			function(p)
				Doomsday_Cuts_List[1] = (p+1)*5
				for i = 2,4 do
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
local Appartements_menu = menu.add_submenu(Appartements_Submenu)


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
        -- Get names for cuts
		for i = 1,4 do
			if globals.get_int(Appartements_Cut_offset+i)>=15 then if player.get_player_ped(i-1)==localplayer then P[i]=You_text else P[i]=player.get_player_name(i-1) end end
		end

		Text(Cut_Player,Appartements_cuts_menu)
        -- Cut selector
        Appartements_cuts_menu:add_array_item(Cut_Player_List[1]..P[1], Cut_percent, function() return math.floor(globals.get_int(Appartements_Cut_offset+1)/5-1) end, function(p) Appartements_Cuts_List[1] = (p+1)*5 end)
		for i = 2,3 do
        	if P[i] then
        	    Appartements_cuts_menu:add_array_item(Cut_Player_List[i]..P[i], Cut_percent, function() return math.floor(globals.get_int(Appartements_Cut_offset+i)/5-1) end, function(p) Appartements_Cuts_List[i] = (p+1)*5 end)
        	end
		end
		Appartements_cuts_menu:add_array_item("Slider for evey player", Cut_percent,
			function()
                if P[1] then
                    Player_Cut_Max = Appartements_Cuts_List[1]
				    for i = 1,4 do
                        if P[i] then
                            Player_Cut_Max = math.max(Player_Cut_Max,Appartements_Cuts_List[i])
                            if Player_Cut_Max == globals.get_int(Appartements_Cut_offset+i) and globals.get_int(Appartements_Cut_offset+i) >= 15 then
                                return math.floor(globals.get_int(Appartements_Cut_offset+i)/5-1)
                            end
                        end
				    end
                else
                    return 0
                end
			end,
			function(p)
				Appartements_Cuts_List[1] = (p+1)*5
				for i = 2,4 do
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

-- Other Heists

menu.add_array_item("Auto Shop Heist →", { "Unselected", "Union Depository", "Superdollar Deal", "Bank Contract", "ECU Job", "Prison Contract", "Agency Deal", "LOST Contract", "Data Contract" },
function()
    return stats.get_int("MP"..mpx().."_TUNER_CURRENT")+2
end,
function(v)
    stats.set_int("MP"..mpx().."_TUNER_CURRENT", v-2)
    -- stats.set_int("MP"..mpx().."_TUNER_GEN_BS", 12543)
end)