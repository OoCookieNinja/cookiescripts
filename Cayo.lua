require("scripts/globals")
require("scripts/AA_language")
local success, settings = pcall(json.loadfile, "CookieScript.json")

-- Variables and lists

local Cayo_Disturbance_level = {"33%","66%","100%"} Cayo_Disturbance_level[0]="0%"
local Cayo_P1_Cut, Cayo_P2_Cut, Cayo_P3_Cut, Cayo_P4_Cut=0, 0, 0, 0
local Cayo_Maxout_Cut, Cayo_Maxout_Cut_List=1, {} Cayo_Maxout_Cut_List[1]="Everyone 100%" Cayo_Maxout_Cut_List[2]="2 Players (50%)" Cayo_Maxout_Cut_List[3]="2 Players (15%)" Cayo_Maxout_Cut_List[4]="3 Players (35%)" Cayo_Maxout_Cut_List[5]="3 Players (15%)" Cayo_Maxout_Cut_List[6]="4 Players (25%)" Cayo_Maxout_Cut_List[7]="4 Players (15%)" Cayo_Maxout_Cut_List[8]="Revert Prices"

if TTL then
	TTL4l=7351544 TTL4h=7351544 TTL3h=7351542
else
	TTL4l=9439088 TTL4h=10470904 TTL3h=8059220
end

-- Functions
local function Cayo_Heist_Weapon(v)
	if v~=nil then
		stats.set_int("MP"..mpx().."_H4CNF_WEAPONS",v)
	else
		return stats.get_int("MP"..mpx().."_H4CNF_WEAPONS")
	end
end
local function Cayo_Heist_Mission(i,v)
	if v~=nil then
		stats.set_bool_masked("MP"..mpx().."_H4_MISSIONS",v,i)
	else
		return stats.get_bool_masked("MP"..mpx().."_H4_MISSIONS",i)
	end
end
local function Cayo_Heist_Generator(i,v)
	if v~=nil then
		stats.set_bool_masked("MP"..mpx().."_H4CNF_BS_GEN",v,i)
	else
		return stats.get_bool_masked("MP"..mpx().."_H4CNF_BS_GEN",i)
	end
end
local function Cayo_Heist_Gold(i,v)
	if v == nil then
        return stats.get_bool_masked("MP"..mpx().."_H4LOOT_GOLD_C",i)
	else if v then
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_C",false,i)
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_C_SCOPED",false,i)end
    end
    stats.set_bool_masked("MP"..mpx().."_H4LOOT_GOLD_C",v,i)
    stats.set_bool_masked("MP"..mpx().."_H4LOOT_GOLD_C_SCOPED",v,i)
end
local function Cayo_Heist_Cash(i,v)
	if v == nil then
        return stats.get_bool_masked("MP"..mpx().."_H4LOOT_CASH_C",i)
	else if v then
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_GOLD_C",false,i)
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_GOLD_C_SCOPED",false,i)end
    end
    stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_C",v,i)
    stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_C_SCOPED",v,i)
end
local function Cayo_Heist_Painting(i,v)
	if v==nil then
        return stats.get_bool_masked("MP"..mpx().."_H4LOOT_PAINT",i)
	else
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_PAINT",v,i)
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_PAINT_SCOPED",v,i)
    end
end
local function Cayo_Heist_Coke(i,v)
	if v==nil then
        return stats.get_bool_masked("MP"..mpx().."_H4LOOT_COKE_I",i)
	else if v then
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I_SCOPED",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I_SCOPED",false,i)end
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I",v,i)
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I_SCOPED",v,i)
    end
end
local function Cayo_Heist_Cash_2(i,v)
	if v==nil then
        return stats.get_bool_masked("MP"..mpx().."_H4LOOT_CASH_I",i)
	else if v then
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I_SCOPED",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I_SCOPED",false,i)end
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I",v,i)
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I_SCOPED",v,i)
    end
end
local function Cayo_Heist_Weed(i,v)
	if v==nil then
        return stats.get_bool_masked("MP"..mpx().."_H4LOOT_WEED_I",i)
	else if v then
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_CASH_I_SCOPED",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I",false,i)
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_COKE_I_SCOPED",false,i)end
		stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I",v,i)
        stats.set_bool_masked("MP"..mpx().."_H4LOOT_WEED_I_SCOPED",v,i)
    end
end





-- Main

local Cayo_menu=menu.add_submenu(Cayo_Submenu)




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
    	stats.set_int("MP"..mpx().."_H4CNF_WEAPONS", 1)
    	stats.set_int("MP"..mpx().."_H4LOOT_GOLD_C_SCOPED",stats.get_int("MP"..mpx().."_H4LOOT_GOLD_C"))
    	stats.set_int("MP"..mpx().."_H4LOOT_CASH_C_SCOPED",stats.get_int("MP"..mpx().."_H4LOOT_CASH_C"))
    	stats.set_int("MP"..mpx().."_H4LOOT_PAINT_SCOPED",stats.get_int("MP"..mpx().."_H4LOOT_PAINT"))
    end
)

Cayo_setup:add_action(Cayo_Setup_Hardmode, function() stats.set_int("MP"..mpx().."_H4_PROGRESS", 131055) end)

-- Max for ...
Cayo_setup:add_array_item(Cayo_Setup_Maxing, Cayo_Maxout_Cut_List,
	function()
		return Cayo_Maxout_Cut
	end,
	function(SHT)
		stats.set_int("MP"..mpx().."_H4_PROGRESS", 131055)
		Cayo_Maxout_Cut=SHT
		PTv=globals.get_int(CPTO+stats.get_int("MP"..mpx().."_H4CNF_TARGET"))*1.1
		if SHT==1 then
			CyPV=math.floor((2777726-PTv)/2) CyCV=math.floor((2777726-PTv)/4) CyGV=math.floor((2777726-PTv)/1.5)
		elseif SHT==2 then
			CyPV=math.floor((5675452-PTv)/4) CyCV=math.floor((5675452-PTv)/8) CyGV=math.floor((5675452-PTv)/3)
		elseif SHT==3 then
			CyPV=math.floor((3189088-PTv)/4) CyCV=math.floor((3189088-PTv)/8) CyGV=math.floor((3189088-PTv)/3)
		elseif SHT==4 then
			CyCV=math.floor((TTL3h-PTv)/12) CyPV=math.floor((TTL3h-PTv)/6) CyGV=math.floor((TTL3h-PTv)/4.5)
		elseif SHT==5 then
			CyCV=math.floor((6219390-PTv)/12) CyPV=math.floor((6219390-PTv)/6) CyGV=math.floor((6219390-PTv)/4.5)
		elseif SHT==6 then
			CyCV=math.floor((TTL4h-PTv)/16) CyPV=math.floor((TTL4h-PTv)/8) CyGV=math.floor((TTL4h-PTv)/6)
		elseif SHT==7 then
			CyCV=math.floor((TTL4l-PTv)/16) CyPV=math.floor((TTL4l-PTv)/8) CyGV=math.floor((TTL4l-PTv)/6)
		elseif SHT==8 then
			CyCV=91800 CyPV=191300 CyGV=330300
		end

		RV=math.random(1,4)
		if RV==1 then
			G=79 P=40 C=160
		elseif RV==2 then
			G=203 P=24 C=36
		elseif RV==3 then
			G=143 P=80 C=80
		else
			G=206 P=69 C=1
		end
		stats.set_int("MP"..mpx().."_H4LOOT_CASH_C", C)
		stats.set_int("MP"..mpx().."_H4LOOT_GOLD_C", G)
		if P then
			stats.set_int("MP"..mpx().."_H4LOOT_PAINT", P)
		end--false error prevension
		if CyCV then
			stats.set_int("MP"..mpx().."_H4LOOT_CASH_V", CyCV)
		end
		stats.set_int("MP"..mpx().."_H4LOOT_PAINT_V", CyPV)
		stats.set_int("MP"..mpx().."_H4LOOT_GOLD_V", CyGV)
	end
)

-- Manual Setup
Cayo_setup:add_action(Manual_text,function()end)
Cayo_setup:add_array_item(Cayo_Setup_Target, Cayo_Choose_Target,
	function()
		return stats.get_int("MP"..mpx().."_H4CNF_TARGET")
	end,
	function(CyT)
		if CyT then
			stats.set_int("MP"..mpx().."_H4CNF_TARGET", CyT)
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

Cayo_setup:add_toggle(Cayo_Missions_List[0] ,function() return Cayo_Heist_Mission(0) end,function()Cayo_Heist_Mission(0,not Cayo_Heist_Mission(0))if not Cayo_Heist_Mission(0) then stats.set_int("MP"..mpx().."_H4_MISSIONS",0)end end)

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
		if Cayo_Heist_Mission(12) and stats.get_int("MP"..mpx().."_H4CNF_WEAPONS")==0 then 
			stats.set_int("MP"..mpx().."_H4CNF_WEAPONS",1)
		elseif not Cayo_Heist_Mission(12) and stats.get_int("MP"..mpx().."_H4CNF_WEAPONS")>0 then
			stats.set_int("MP"..mpx().."_H4CNF_WEAPONS",0)
		end
	end
	)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_ChooseWeapon, Cayo_Choose_Weapon,
	function()
		return stats.get_int("MP"..mpx().."_H4CNF_WEAPONS")
	end,
	function(v)
		stats.set_int("MP"..mpx().."_H4CNF_WEAPONS", v)
		if v>0 and not Cayo_Heist_Mission(12) then
			Cayo_Heist_Mission(12,true)
		elseif v==0 and Cayo_Heist_Mission(12) then
			Cayo_Heist_Mission(12,false)
		end
	end
	)
Cayo_Disruption_Missions:add_toggle(Cayo_Point_of_interest_List[12],function()return Cayo_Heist_Generator(12)end,function()Cayo_Heist_Generator(12,not Cayo_Heist_Generator(12))end)
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[13],function()return Cayo_Heist_Mission(13)end,function()Cayo_Heist_Mission(13,not Cayo_Heist_Mission(13))if not Cayo_Heist_Mission(13)then stats.set_int("MP"..mpx().."_H4CNF_WEP_DISRP", 0)end end)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_PercetangeDestroyed,Cayo_Disturbance_level,
	function()
		return stats.get_int("MP"..mpx().."_H4CNF_WEP_DISRP")
	end,
	function(v)
		stats.set_int("MP"..mpx().."_H4CNF_WEP_DISRP",v)
		if v>0 then
			Cayo_Heist_Mission(13,true)
		end
	end
	)
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[14],function()return Cayo_Heist_Mission(14)end,function()Cayo_Heist_Mission(14,not Cayo_Heist_Mission(14))if not Cayo_Heist_Mission(14)then stats.set_int("MP"..mpx().."_H4CNF_ARM_DISRP", 0)end end)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_PercetangeDestroyed,Cayo_Disturbance_level,
	function()
		return stats.get_int("MP"..mpx().."_H4CNF_ARM_DISRP")
	end,
	function(v)
		stats.set_int("MP"..mpx().."_H4CNF_ARM_DISRP",v)
		if v>0 then
			Cayo_Heist_Mission(14,true)
		end
	end
	)
Cayo_Disruption_Missions:add_toggle(Cayo_Missions_List[15],function()return Cayo_Heist_Mission(15)end,function()Cayo_Heist_Mission(15,not Cayo_Heist_Mission(15))if not Cayo_Heist_Mission(15)then stats.set_int("MP"..mpx().."_H4CNF_HEL_DISRP", 0)end end)
Cayo_Disruption_Missions:add_array_item(Cayo_Setup_MissionAndWeapons_PercetangeDestroyed,Cayo_Disturbance_level,
	function()
		return stats.get_int("MP"..mpx().."_H4CNF_HEL_DISRP")
	end,
	function(v)
		stats.set_int("MP"..mpx().."_H4CNF_HEL_DISRP",v)
		if v>0 then
			Cayo_Heist_Mission(15,true)
		end
	end
)


-- POIs
local Cayo_Point_of_interest=Cayo_setup:add_submenu(Cayo_Point_of_interest_submenu)
Cayo_Point_of_interest_grappling = Cayo_Point_of_interest:add_submenu(Cayo_Point_of_interest_grappling_submenu)
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
			stats.set_int("MP"..mpx().."_H4CNF_GRAPPEL",v)
		end)
Cayo_Point_of_interest_guardclothes = Cayo_Point_of_interest:add_submenu(Cayo_Point_of_interest_guardclothes_submenu)
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
				stats.set_int("MP"..mpx().."_H4CNF_UNIFORM",v)
			end)
	end
Cayo_Point_of_interest_boltcutters = Cayo_Point_of_interest:add_submenu(Cayo_Point_of_interest_boltcutters_submenu)
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
				stats.set_int("MP"..mpx().."_H4CNF_BOLTCUT", v)
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
		return stats.get_int("MP"..mpx().."_H4CNF_TROJAN")
	end,
	function(SpTr)
		if SpTr>0 then
			Cayo_Heist_Generator(15,true)
		else
			Cayo_Heist_Generator(15,false)
		end
		stats.set_int("MP"..mpx().."_H4CNF_TROJAN", SpTr)
	end)

Cayo_setup:add_action(Cayo_Point_of_interest_scopeout,function() stats.set_int("MP"..mpx().."_H4CNF_BS_GEN", 131071) end)


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


-- Cayo Player Cuts

local Cayo_cut_menu=nil
local function Cayo_Cuts()
	Cayo_cut_menu:clear()
	P1 = Notinheist
	for i=0,3 do
		if player.get_player_ped(i) == localplayer then
			freem=false
		else
			freem=true
		end
	end

	if globals.get_int(Cayo_Cut_offset+1)<1000 and globals.get_int(Cayo_Cut_offset+1)>-1 then
		if globals.get_int(Cayo_Cut_offset+1)>=15 then if player.get_player_ped(0)==localplayer or freem then P1=Cut_You else P1=player.get_player_name(0) end
		if globals.get_int(Cayo_Cut_offset+2)>=15 then if player.get_player_ped(1)==localplayer then P2=Cut_You else P2=player.get_player_name(1) end
		if globals.get_int(Cayo_Cut_offset+3)>=15 then if player.get_player_ped(2)==localplayer then P3=Cut_You else P3=player.get_player_name(2) end
		if globals.get_int(Cayo_Cut_offset+4)>=15 then if player.get_player_ped(3)==localplayer then P4=Cut_You else P4=player.get_player_name(3) end
		end end end end

		if not P1 then
			Text("No heist detected",Cayo_cut_menu)
		end
		if P1 then
			Cayo_cut_menu:add_array_item(Cut_Player1..""..P1, Cut_percent, function() return math.floor(globals.get_int(Cayo_Cut_offset+1)/5-1) end, function(p) Cayo_P1_Cut=(p+1)*5 end)
		end
		if P2 then
			Cayo_cut_menu:add_array_item(Cut_Player2..""..P2, Cut_percent, function() return math.floor(globals.get_int(Cayo_Cut_offset+2)/5-1) end, function(p) Cayo_P2_Cut=(p+1)*5 end)
		end
		if P3 then
			Cayo_cut_menu:add_array_item(Cut_Player3..""..P3, Cut_percent, function() return math.floor(globals.get_int(Cayo_Cut_offset+3)/5-1) end, function(p) Cayo_P3_Cut=(p+1)*5 end)
		end
		if P4 then
			Cayo_cut_menu:add_array_item(Cut_Player4..""..P4, Cut_percent, function() return math.floor(globals.get_int(Cayo_Cut_offset+4)/5-1) end, function(p) Cayo_P4_Cut=(p+1)*5 end)
		end

		if P1 then Cayo_cut_menu:add_array_item(Cut_Set, Cut_Setter, function() return 1 end,
			function(CyC)
				if CyC==2 then
					Cayo_P1_Cut, Cayo_P2_Cut, Cayo_P3_Cut, Cayo_P4_Cut=100, 100, 100, 100
				end
				if Cayo_P1_Cut >= 15 then
					globals.set_int(Cayo_Cut_offset+1, Cayo_P1_Cut)
					if globals.get_int(Cayo_Cut_offset+2) ~= nil and globals.get_int(Cayo_Cut_offset+2)>=15 and Cayo_P2_Cut>=15 then
						globals.set_int(Cayo_Cut_offset+2, Cayo_P2_Cut)
						if globals.get_int(Cayo_Cut_offset+3) ~= nil and globals.get_int(Cayo_Cut_offset+3)>=15 and Cayo_P3_Cut>=15 then
							globals.set_int(Cayo_Cut_offset+3, Cayo_P3_Cut)
							if globals.get_int(Cayo_Cut_offset+4) ~= nil and globals.get_int(Cayo_Cut_offset+4)>=15 and Cayo_P4_Cut>=15 then
								globals.set_int(Cayo_Cut_offset+4, Cayo_P4_Cut)
							end
						end
					end
				end
			end)
		end
		if P1 then
			Cayo_cut_menu:add_action("Remove Pavel's Cut",function() globals.set_int(Cayo_Pavel_Cut, 0.0) end)
			Cayo_cut_menu:add_action("Remove fencing Fee",function() globals.set_int(Cayo_Fenving_fee, 0.0) end)
		end
	end
end
Cayo_cut_menu=Cayo_menu:add_submenu(Cayo_Cut_Submenu, Cayo_Cuts)


-- Cayo Extras

local Cayo_extras=Cayo_menu:add_submenu("Extras")

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
		if HS0():is_active() and HS0():get_float(Cayo_Cut_glass)>0.00 and HS0():get_float(Cayo_Cut_glass)<100 then
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