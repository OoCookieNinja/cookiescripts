require("scripts/globals")
require("scripts/A_language")
local success, settings = pcall(json.loadfile, Settings_JSON_Filename)

-- Variables and Lists
local Weapon=0
local Casino_Mask_List={"Geometric","Hunter","Christian Feltz","Oni Half Mask","Emoji","Ornate Skull","Lucky Fruit","Guerilla","Clown","Animal","Riot","Oni","Hockey"}Casino_Mask_List[0]="Unselected"
local Casino_Hacker_List={"Rickie Lukens","Christian Feltz","Yohan Blair","Avi Schwartzman","Paige Harris"}
local Casino_cuts = nil
local Casino_Cuts_List = {}
local P = {}
local Casino_Gunman=nil
local KaAb, ChRe, PaMc, ChMc, GuMo={}, {}, {}, {}, {}
create_variable("we",1,5,0)
local Casino_Driver=nil
local KaDe, ZaNe, TaMa, EdTo, CcMc={}, {}, {}, {}, {}
create_variable("ca",1,5,3)
local Player_Cut_Max

-- Functions
local function Casino_Target_Stat() return stats.get_int("MP"..mpx().."_H3OPT_TARGET") end
local function H3Bit1(i,v)if v~=nil then stats.set_bool_masked("MP"..mpx().."_H3OPT_BITSET1",v,i)else return stats.get_bool_masked("MP"..mpx().."_H3OPT_BITSET1",i)end end
local function H3Bit0(i,v)if v~=nil then stats.set_bool_masked("MP"..mpx().."_H3OPT_BITSET0",v,i)else return stats.get_bool_masked("MP"..mpx().."_H3OPT_BITSET0",i)end end




-- Main
local Casino_menu=menu.add_submenu(Casino_Submenu)



-- Casino Setup
local Casino_Setup=Casino_menu:add_submenu(Casino_Setup_Submenu)

Text(stats.get_int("MP"..mpx().."_H3OPT_APPROACH"),Casino_Setup)

-- Casino All-in-one Setup button
Casino_Setup:add_array_item(Casino_Setup_Mode, Heist_difficulty_list,
    function()
    	if stats.get_int("MP"..mpx().."_H3_HARD_APPROACH") == stats.get_int("MP"..mpx().."_H3OPT_APPROACH") then
    		return 2
    	end
    	return 1
    end,

    function(v)
		Approach_Mode = v
		if stats.get_int("MP"..mpx().."_H3OPT_APPROACH") ~= 0 then
			AP = stats.get_int("MP"..mpx().."_H3OPT_APPROACH")
		else
			AP = stats.get_int("MP"..mpx().."_H3_LAST_APPROACH")
			stats.set_int("MP"..mpx().."_H3OPT_APPROACH", AP)
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
    	stats.set_int("MP"..mpx().."_H3OPT_KEYLEVELS", 2)
		if not Is_IN(stats.get_int("MP"..mpx().."_H3OPT_CREWHACKER"),{1,2,3,4,5}) then
    		stats.set_int("MP"..mpx().."_H3OPT_CREWHACKER",4)
		end
		if not Is_IN(stats.get_int("MP"..mpx().."_H3OPT_CREWWEAP"),{1,2,3,4}) then
    		stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP",1)
		end
		if not Is_IN(stats.get_int("MP"..mpx().."_H3OPT_CREWDRIVER"),{1,2,3,4}) then
    		stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER",1)
		end
    	stats.set_int("MP"..mpx().."_H3OPT_WEAPS", 0)
    	stats.set_int("MP"..mpx().."_H3OPT_VEHS", 0)
    	stats.set_int("MP"..mpx().."_H3OPT_DISRUPTSHIP", 3)
    end
)

--Casino Manual Setup menu
Text(Manual_text,Casino_Setup)

-- Casino Target
Casino_Setup:add_array_item(Casino_Setup_Targetchoise, Casino_Target_List, function() return Casino_Target_Stat() end, function(H3t) stats.set_int("MP"..mpx().."_H3OPT_TARGET", H3t) end)

-- Casino Missions
for i=0,1 do
	Casino_Setup:add_toggle(Casino_Setup_Missions_List_1[i], function() return H3Bit1(i) end,
	function()
		H3Bit1(i,not H3Bit1(i))
		if i==0 then
			if not H3Bit1(i) then
				stats.set_int("MP"..mpx().."_H3OPT_BITSET1",0)
				stats.set_int("MP"..mpx().."_H3OPT_BITSET0",0)
			end
		end
	end)
end

-- Hacking Device
Casino_Setup:add_toggle(Casino_Setup_Missions_List_1[4], function() return H3Bit1(4) end, function() H3Bit1(4,not H3Bit1(4)) end)

-- Casino Approach
Casino_Setup:add_array_item(Casino_Approach_Setmode, Heist_difficulty_list,
    	function()
    		if stats.get_int("MP"..mpx().."_H3_HARD_APPROACH") == stats.get_int("MP"..mpx().."_H3OPT_APPROACH") then
    			return 2
    		else
    			return 1
    		end
    	end,
    	function(H3lvl)
    		Casino_Last_Approach = stats.get_int("MP"..mpx().."_H3_LAST_APPROACH")
    		Casino_Hard_Approach = stats.get_int("MP"..mpx().."_H3_HARD_APPROACH")
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
	    	stats.set_int("MP"..mpx().."_H3OPT_APPROACH", Casino_Approch)
	    end
	)
Casino_Setup:add_array_item(Casino_Approach_Choice, Casino_Approch_List,
	    function()
	    return 2*stats.get_int("MP"..mpx().."_H3OPT_APPROACH")-1
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

	    	stats.set_int("MP"..mpx().."_H3_LAST_APPROACH", Casino_Last_Approach_Manual)
	    	stats.set_int("MP"..mpx().."_H3_HARD_APPROACH", Casino_Hard_Approach_Manual)
	    	stats.set_int("MP"..mpx().."_H3OPT_APPROACH", Casino_Approch_Manual)
    	end
)

-- Approach Settings
local Casino_Approch_Settings=nil

local function CurAp()
	Casino_Approch_Settings:clear()
	-- Silent and Sneaky
	if stats.get_int("MP"..mpx().."_H3OPT_APPROACH")==1 then
		Text(Casino_Approach_Settings_Silentnsneaky,Casino_Approch_Settings)
		Casino_Approch_Settings:add_toggle(Casino_Setup_Missions_List_0[5], function() return H3Bit0(5) end, function() H3Bit0(5,not H3Bit0(5)) end)
		Casino_Approch_Settings:add_toggle(Casino_Setup_Missions_List_0[3], function() return H3Bit0(3) end, function() H3Bit0(3,not H3Bit0(3)) end)
	-- The Big Con
	elseif stats.get_int("MP"..mpx().."_H3OPT_APPROACH")==2 then
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
	elseif stats.get_int("MP"..mpx().."_H3OPT_APPROACH")==3 then
		Text(Casino_Approach_Settings_Aggresive,Casino_Approch_Settings)
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



-- Hacker
Casino_Setup:add_array_item(Casino_Crew_Hacker, Casino_Hacker_List, function() return stats.get_int("MP"..mpx().."_H3OPT_CREWHACKER") end, function(Hkr) stats.set_int("MP"..mpx().."_H3OPT_CREWHACKER", Hkr) end)

-- Gunman
local function WEAPON()
	Casino_Gunman:clear()
	Casino_Gunman:add_action(Casino_Crew_Gunman_Choise, function() end)
	WEP=stats.get_int("MP"..mpx().."_H3OPT_CREWWEAP")
	APR=stats.get_int("MP"..mpx().."_H3OPT_APPROACH")
	Wa=stats.get_int("MP"..mpx().."_H3OPT_WEAPS")
	
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
				return we1
			else
				return Wa
			end
		end,
		function(KaW)
			we1=KaW
			stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP", 1)
			stats.set_int("MP"..mpx().."_H3OPT_WEAPS", KaW)
		end)
	
	Casino_Gunman:add_array_item("Charlie Reed"..Ree, ChRe,
		function()
			if not RE then
				return we3
			else
				return Wa
			end
		end,
		function(ChW)
			we3=ChW
			stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP", 3)
			stats.set_int("MP"..mpx().."_H3OPT_WEAPS", ChW)
		end)
	
	Casino_Gunman:add_array_item("Patrick Mcreary"..Mcr, PaMc,
		function()
			if not MR then
				return we5
			else
				return Wa
			end
		end,
		function(PaW)
			we5=PaW
			stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP", 5)
			stats.set_int("MP"..mpx().."_H3OPT_WEAPS", PaW)
		end)
	
	Casino_Gunman:add_array_item("Gustavo Mota"..Mot, GuMo,
		function()
			if not MO then
				return we2
			else return Wa
			end
		end,
		function(GuW)
			we2=GuW
			stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP", 2)
			stats.set_int("MP"..mpx().."_H3OPT_WEAPS", GuW)
		end)
	Casino_Gunman:add_array_item("Chester Mccoy"..Mcc, ChMc,
		function()
			if not MC then
				return we4
			else
				return Wa
			end
		end,
		function(ChW)
			we4=ChW
			stats.set_int("MP"..mpx().."_H3OPT_CREWWEAP", 4)
			stats.set_int("MP"..mpx().."_H3OPT_WEAPS", ChW)
		end)
	Casino_Gunman:add_toggle(Casino_Setup_Missions_List_1[2],function()return H3Bit1(2)end,function()H3Bit1(2,not H3Bit1(2))end)
end
Casino_Gunman = Casino_Setup:add_submenu(Casino_Crew_Gunman_Submenu,WEAPON)

-- Driver

local function Driver()
	Casino_Driver:clear()
	Casino_Driver:add_action(Casino_Crew_Driver_Choise, function() end)

	Ca=stats.get_int("MP"..mpx().."_H3OPT_VEHS")
	drv=stats.get_int("MP"..mpx().."_H3OPT_CREWDRIVER")
	den, mar, toh, nel, mcc="", "", "", "", ""

	if drv==1 then
		den="*" DE=Ca
	elseif drv==2 then
		mar="*" MA=Ca
	elseif drv==3 then
		toh="*" TO=Ca 
	elseif drv==4 then
		nel="*" NE=Ca
	elseif drv==5 then
		mcc="*" MR=Ca
	end

	KaDe[0]="Issi Classic" KaDe[1]="ASBO" KaDe[2]="Kanjo" KaDe[3]="Sentinel Classic"
	ZaNe[0]="Manchez" ZaNe[1]="Stryder" ZaNe[2]="Defiler" ZaNe[3]="Lectro"
	TaMa[0]="Retinue MKII" TaMa[1]="Drift Yosemite" TaMa[2]="Sugoi" TaMa[3]="Jugular"
	EdTo[0]="Sultan Classic" EdTo[1]="Gauntlet Classic" EdTo[2]="Elie" EdTo[3]="Komoda"
	CcMc[0]="Zhaba" CcMc[1]="Vagrant" CcMc[2]="Outlaw" CcMc[3]="Everon"
	
	Casino_Driver:add_array_item("Karim Denz"..den, KaDe,
		function()
			if not DE then
				return ca1
			else
				return Ca
			end
		end,
		function(KaC)
			ca1=KaC stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER", 1)
			stats.set_int("MP"..mpx().."_H3OPT_VEHS", KaC)
		end)
	
    Casino_Driver:add_array_item("Zach Nelson"..Casino_Crew_Driver_Bikes..""..nel, ZaNe,
		function()
			if not NE then
				return ca4
			else
				return Ca
			end
		end,
		function(ZaC)
			ca4=ZaC stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER", 4)
			stats.set_int("MP"..mpx().."_H3OPT_VEHS", ZaC)
		end)
    Casino_Driver:add_array_item("Taliana Martinez"..mar, TaMa,
		function()
			if not MA then
				return ca2
			else
				return Ca
			end
		end,
		function(TaC)
			ca2=TaC stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER", 2)
			stats.set_int("MP"..mpx().."_H3OPT_VEHS", TaC) 
		end)
    Casino_Driver:add_array_item("Eddie Toh"..toh, EdTo, 
		function()
			if not TO then
				return ca3
			else
				return Ca
			end
		end,
		function(EdC)
			ca3=EdC stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER", 3)
			stats.set_int("MP"..mpx().."_H3OPT_VEHS", EdC)
		end)
    Casino_Driver:add_array_item("Chester Mccoy"..mcc, CcMc,
		function()
			if not MR then
				return ca5
			else
				return Ca
			end
		end,
		function(ChC)
			ca5=ChC stats.set_int("MP"..mpx().."_H3OPT_CREWDRIVER", 5)
			stats.set_int("MP"..mpx().."_H3OPT_WEAPS", ChC)
		end)
    Casino_Driver:add_toggle(Casino_Setup_Missions_List_1[3],function()return H3Bit1(3)end,function()H3Bit1(3,not H3Bit1(3))end)
end
Casino_Driver=Casino_Setup:add_submenu(Casino_Crew_Driver_Submenu,Driver)

-- Masks
Casino_Setup:add_array_item(Casino_Crew_Mask, Casino_Mask_List,
	function()
		M=stats.get_int("MP"..mpx().."_H3OPT_MASKS")
		if M<1 or M>13 or M==nil then
			return 0
		end
		return stats.get_int("MP"..mpx().."_H3OPT_MASKS")
	end,
	function(H3Msk)
		stats.set_int("MP"..mpx().."_H3OPT_MASKS", H3Msk)
	end
	)

-- Common Missions

local Casino_Common=Casino_Setup:add_submenu(Casino_Setup_Common_Submenu)

Casino_Common:add_array_item(Casino_Setup_Common_Passlevel, { None_text, "Lv.1", "Lv.2" }, function() return stats.get_int("MP"..mpx().."_H3OPT_KEYLEVELS")+1 end, function(SPss) stats.set_int("MP"..mpx().."_H3OPT_KEYLEVELS", SPss-1) end)
for i=1,2 do
	Casino_Common:add_toggle(Casino_Setup_Missions_List_0[i], function() return H3Bit0(i) end, function() H3Bit0(i,not H3Bit0(i)) end)
end
Casino_Common:add_array_item(Casino_Setup_Common_Shipment, {"0%","33%","66%","100%"}, function() return stats.get_int("MP"..mpx().."_H3OPT_DISRUPTSHIP")+1 end,
		function(DugS)
		    if DugS>1 then
	    		DuSh=4
				stats.set_int("MP"..mpx().."_H3OPT_DISRUPTSHIP",DugS-1)
		    	H3Bit0(2,true)
			else
				DuSh=0
				stats.set_int("MP"..mpx().."_H3OPT_DISRUPTSHIP", 0)
			end
		end
	)

Casino_Common:add_toggle(Casino_Setup_Missions_List_0[4], function() return H3Bit0(4) end, function() return H3Bit0(4,not H3Bit0(4)) end)
for i=6,7 do
	Casino_Common:add_toggle(Casino_Setup_Missions_List_0[i], function() return H3Bit0(i) end, function() H3Bit0(i,not H3Bit0(i)) end)
end




-- Casino Cuts

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
		Casino_cuts_menu:add_array_item("Slider for evey player", Cut_percent,
			function()
				if P[1] then
					Player_Cut_Max = globals.get_int(Casino_Cut_offset+1)
					for i = 2,4 do
						if P[i] then
				    	    if globals.get_int(Casino_Cut_offset+i) >= 15 then
				    	    	Player_Cut_Max = math.max(Player_Cut_Max, globals.get_int(Casino_Cut_offset+i))
				    	    end
						end
					end
					return Player_Cut_Max
                else
                    return 0
				end
			end,
			function(p)
				Casino_Cuts_List[1] = (p+1)*5
				for i = 2,4 do
					if P[i] then
						Casino_Cuts_List[i] = (p+1)*5
					end
				end
			end)
        Casino_cuts_menu:add_array_item(Set_text, Cut_Setter, function() return 1 end, function(Casino_Cut_Sellector)
            if Casino_Cut_Sellector == 2 then
				for i =1,4 do
					if P[i] then
						Casino_Cuts_List[i] = 100
					end
				end
            end

			for i = 1,4 do
				if P[i] then
            		if Casino_Cuts_List[i] >= 15 then
            		    globals.set_int(Casino_Cut_offset+i, Casino_Cuts_List[i])
            		end
				end
            end

			Player_Cut_Max = math.max(Casino_Cuts_List[1], Casino_Cuts_List[2], Casino_Cuts_List[3], Casino_Cuts_List[3])
        end)

		Text(Cut_Crew ,Casino_cuts_menu)
		Text(Cut_Crew2,Casino_cuts_menu)
		Text(Cut_Crew3,Casino_cuts_menu)

		drv = stats.get_int("MP"..mpx().."_H3OPT_CREWDRIVER")
		hck = stats.get_int("MP"..mpx().."_H3OPT_CREWHACKER")
		wep = stats.get_int("MP"..mpx().."_H3OPT_CREWWEAP")

		Casino_cuts_menu:add_array_item("Lester", Cut_percent_Full , function() return globals.get_int(Casino_Cut_Lester_offset) end, function(p) globals.set_int(Casino_Cut_Lester_offset, p) end)
		Casino_cuts_menu:add_array_item(Casino_Crew_Driver_Only, Cut_percent_Full , function() return globals.get_int(Casino_Cut_Driver_offset+drv) end, function(q) globals.set_int(Casino_Cut_Driver_offset+drv, q) end)
		Casino_cuts_menu:add_array_item(Casino_Crew_Hacker_Only, Cut_percent_Full , function() return globals.get_int(Casino_Cut_Hacker_offset+hck) end, function(r) globals.set_int(Casino_Cut_Hacker_offset+hck, r) end)
		Casino_cuts_menu:add_array_item(Casino_Crew_Gunman_Only, Cut_percent_Full , function() return globals.get_int(Casino_Cut_Gunman_offset+wep) end, function(s) globals.set_int(Casino_Cut_Gunman_offset+wep, s) end)

    end
end
Casino_cuts_menu=Casino_menu:add_submenu(Casino_Cut_Submenu, Casino_Cuts)




-- Casino Extras

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
		local current_choice = 250000
		Casino_In_Heist:add_int_range("Auto take with defined cuts",500000,250000,3600000,
		function()
			return current_choice
		end,
		function(h)
			current_choice = h
			player_max = math.floor(h/(Player_Cut_Max/100))
				
			lst = globals.get_int(  Casino_Cut_Lester_offset )
			drv = globals.get_int(  Casino_Cut_Driver_offset + stats.get_int("MP"..mpx().."_H3OPT_CREWDRIVER"  ))
			hck = globals.get_int(  Casino_Cut_Hacker_offset + stats.get_int("MP"..mpx().."_H3OPT_CREWHACKER"  ))
			wep = globals.get_int(  Casino_Cut_Gunman_offset + stats.get_int("MP"..mpx().."_H3OPT_CREWWEAP"    ))

			Max_Take = math.floor(player_max/((100-(lst+drv+hck+wep))/100))

			Text(Max_Take, Casino_In_Heist)
		end)
	else
		local cut_take = (85/5)-1
		Casino_In_Heist:add_array_item("Auto take with max cuts →",Cut_percent,
		function()
			return cut_take
		end,
		function(h)
			cut_take = h
			player_max = math.floor(3600000/(((cut_take+1)*5)/100))
				
			lst = globals.get_int(  Casino_Cut_Lester_offset )
			drv = globals.get_int(  Casino_Cut_Driver_offset + stats.get_int("MP"..mpx().."_H3OPT_CREWDRIVER"  ))
			hck = globals.get_int(  Casino_Cut_Hacker_offset + stats.get_int("MP"..mpx().."_H3OPT_CREWHACKER"  ))
			wep = globals.get_int(  Casino_Cut_Gunman_offset + stats.get_int("MP"..mpx().."_H3OPT_CREWWEAP"    ))

			Max_Take = math.floor(player_max/((100-(lst+drv+hck+wep))/100))

			Text(Max_Take, Casino_In_Heist)
		end)
	end
end

Casino_In_Heist=Casino_menu:add_submenu(Extars_Submenu,Casino_Heist)