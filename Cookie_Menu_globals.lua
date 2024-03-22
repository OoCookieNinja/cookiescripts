-- Common
    -- List and Variables
    Cut_percent={} Cut_percent[-1] = "0%" for i=2,39 do Cut_percent[i]=((i+1)*5).."%"end Cut_percent[-2] = "MAX"
    Cut_percent_Full={} Cut_percent_Full[0] = "0%" for i=1,100 do Cut_percent_Full[i]=i.."%"end
    Current_language     = nil
    Global_offset        = 262145
    Heist_max_take_idx   = {"casino","cayo" ,"apartement"}
    Heist_max_take       = {3600000 ,2500000,15000000    }
    RP_untill_lvl_100 = {
        0, 800, 2100, 3800, 6100, 9500, 12500, 16000, 19800, 24000,
        28500, 33400, 38700, 44200, 50200, 56400, 3000, 69900, 77100, 84700,
        92500, 100700, 109200, 118000, 127100, 136500, 146200, 156200, 166500, 177100,
        188000, 199200, 210700, 222400, 234500, 246800, 259400, 272300, 285500, 299000,
        312700, 326800, 341000, 355600, 370500, 385600, 401000, 416600, 432600, 448800,
        465200, 482000, 499000, 516300,	533800, 551600, 569600, 588000, 606500, 625400,
        644500, 663800, 683400, 703300, 723400, 743800, 764500, 785400, 806500, 827900,
        849600, 871500, 893600, 916000, 938700, 961600, 984700, 1008100, 1031800, 1055700,
        1079800, 1104200, 1128800, 1153700, 1178800, 1204200, 1229800, 1255600, 1281700, 1308100,
        1334600, 1361400, 1388500, 1415800, 1443300, 1471100, 1499100, 1527300, 1555800, 1584350
        }
    Alphabet_lowercase = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}
    Alphabet_uppercase = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
    Numbers = {"1","2","3","4","5","6","7","8","9"}
    Numbers[0] = "0"
    All_characters_List = {}
	for i = 1,(#Alphabet_lowercase+#Alphabet_uppercase+#Numbers+1) do
		if i >= 1 and i <= #Alphabet_lowercase+#Alphabet_uppercase then
			if i%2 == 1 then
				All_characters_List[i] = Alphabet_lowercase[(i+1)/2]
			else
				All_characters_List[i] = Alphabet_uppercase[i/2]
			end
		elseif i <= #Alphabet_lowercase+#Alphabet_uppercase+#Numbers then
			All_characters_List[i] = Numbers[i-(#Alphabet_lowercase+#Alphabet_uppercase)]
		else
			All_characters_List[i] = " "
			All_characters_List[0] = ""
		end
	end
    KeyCode = {}
        KeyCode[8]  = "Backspace"
        KeyCode[9]  = "Tab"
        KeyCode[13] = "Enter"
        KeyCode[16]  = "L Shift"
        KeyCode[161] = "R Shift"
        KeyCode[17]  = "L Ctrl"
        KeyCode[163]  = "R Ctrl"
        KeyCode[18]  = "L Alt"
        KeyCode[165] = "R Alt"
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
        for i = 1,26 do
            KeyCode[64+i] = Alphabet_lowercase[i]
        end
        KeyCode[91] = "L Windows"
        KeyCode[92] = "R Windows"
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
        KeyCode[222] = "²"
    Plate_Character = {}
        for i = 1,26 do
            Plate_Character[i] = Alphabet_uppercase[i]
        end
	    for i = 0,9 do
	    	Plate_Character[27+i] = tostring(i)
	    end
	    Plate_Character[0] = " "
    --

    Menu_languages={"EN_US","FR_FR"}
    Settings_JSON_filename = "Cookie_settings.json"
    Presets_JSON_filename = "Cookie_presets.json"
    Script_version = "24w12a" --year.week.version just like minecraft
    Game_version   = "1.68"
    Game_build     = 3905

    Weapon_hash = {}
    Weapon_hash[1] = "weapon_railgun"
    Weapon_hash[2] = "weapon_stungun"
    Weapon_hash[3] = "weapon_stungun_mp"
    Weapon_hash[4] = "weapon_raypistol"
    Heist_cut_selector_Text = {}
    Heist_cut_selector_list = {
		{},
		{100,100,100,100},
		{40,20,20,20}
	}
    Vehicle_adresses_List = {}
    Disabled_vehicle_List = {}
	-- Exeptions
	Vehicle_adresses_List[00] = {Global_offset+36290,Global_offset+36294,Global_offset+33462}
	-- Vehicle_adresses_List[i] = {start, end, step}
		Vehicle_adresses_List[01] = {Global_offset+26039, Global_offset+26070, 1}
		Vehicle_adresses_List[02] = {Global_offset+27026, Global_offset+27027, 1}
		Vehicle_adresses_List[03] = {Global_offset+28890, Global_offset+28910, 1}
		Vehicle_adresses_List[04] = {Global_offset+28933, Global_offset+28936, 3}
		Vehicle_adresses_List[05] = {Global_offset+28941, Global_offset+28943, 1}
		Vehicle_adresses_List[06] = {Global_offset+29953, Global_offset+29959, 1}
		Vehicle_adresses_List[07] = {Global_offset+29604, Global_offset+29611, 1}
		Vehicle_adresses_List[08] = {Global_offset+30418, Global_offset+30434, 1}
		Vehicle_adresses_List[09] = {Global_offset+31291, Global_offset+31306, 1}
		Vehicle_adresses_List[10] = {Global_offset+32214, Global_offset+32228, 1}
		Vehicle_adresses_List[11] = {Global_offset+33446, Global_offset+33481, 1}
		Vehicle_adresses_List[12] = {Global_offset+35402, Global_offset+35678, 2}
		Vehicle_adresses_List[13] = {Global_offset+35697, Global_offset+35709, 1}
		Vehicle_adresses_List[14] = {Global_offset+36285, Global_offset+36304, 1}
	-----

    -- Functions
    function null() end
    function Save_settings(filename, list_settings)
        json.savefile(filename, list_settings)
    end
    function Text(text_shown, submenu_name)
        if submenu_name ~= nil then
            submenu_name:add_action(tostring(text_shown), null)
        else
            menu.add_action(tostring(text_shown), null)
        end
    end
    function mpx()  return "MP"..stats.get_int("MPPLY_LAST_MP_CHAR").."_" end
    function HS()   return script("fm_mission_controller") end
    function HS0()  return script("fm_mission_controller_2020") end
    function FMMC() return script("fmmc_launcher") end
    function Get_char_pos(Variable,List)
        for i, v in ipairs(List) do
            if v == Variable then
                return i
            end
        end
        return 0
    end
    function List_to_string(list,n_char)
        temp = ""
        for i = 1,n_char do
            temp = temp..list[i]
        end
        return temp
    end
    function Half_Separator_Function(string)
        return Half_Separator.." "..string.." "..Half_Separator..Half_Separator
    end
    function Is_IN(Varaiable,List)
        for i = 1,#List do
            if Varaiable == List[i] then
                return true
            end
        end
        return false
    end
    function round(value, dec)
        dec = dec or 0
        return tonumber(string.format("%." .. dec .. "f", value))
    end
    function dec_to_bin(dec)
        t = 0
        size_bit = 0
        while dec/(2^size_bit) > 0 do
            size_bit = size_bit + 1
        end

        size_bit_max = size_bit - 1
        
        while dec % 2^size_bit ~= 0 do
            size_bit = size_bit - 1
            if dec >= 2^size_bit then
                t = t + 1*10^(size_bit-1)
                dec = dec % 2^size_bit
            end
        end
        return math.floor(t*10)
    end
    function BitTest(expression, bit)
        bin_tested = dec_to_bin(expression)
        bin_tested = string.reverse( tostring(  math.floor(bin_tested/(10^(bit))) ) )
        return math.floor( tonumber( bin_tested ) / 10^(#bin_tested-1) )
    end
	function Get_player_vehicle(Player)
		if Player:is_in_vehicle() then
			if Player:get_current_vehicle() ~= nil then
				return Player:get_current_vehicle()
			end
		end
		return false
	end
    function Get_vehicle_speed(Vehicle)
    	if not Vehicle then return 0 end
    	local Velocity = Vehicle:get_velocity()
    	return math.sqrt(Velocity.x ^ 2 + Velocity.y ^ 2 + Velocity.z ^ 2)
    end
    function Get_disabled_vehicle_List()
        local Disabled_globel_start
        local Disabled_global_end
        local Disabled_step
        for i = 1, #Vehicle_adresses_List-1 do
            Disabled_globel_start = Vehicle_adresses_List[i][1]
            Disabled_global_end = Vehicle_adresses_List[i][2]
            Disabled_step = Vehicle_adresses_List[i][3]

            for j = 0, (Disabled_global_end - Disabled_globel_start)/Disabled_step do
                if globals.get_bool(Disabled_globel_start + j*Disabled_step) == false then
                    Disabled_vehicle_List[#Disabled_vehicle_List+1] = Disabled_globel_start + j*Disabled_step
                end
            end
        end
    end
	function Heist_Selector_setup()
		Heist_cut_selector_Text[1] = Selected_Text
		for i = 2,#Heist_cut_selector_list do
			local final_txt = ""
			for j = 1,4 do
				final_txt = final_txt..tostring(Heist_cut_selector_list[i][j])
				if j ~= 4 then final_txt = final_txt.."/" end
			end
			Heist_cut_selector_Text[i] = final_txt
		end
	end
	function Heist_Get_max_cut(player_list, player_cut_list)
		max = 15
		if player_list ~= {} then
			max = player_cut_list[1]
			for i = 2,4 do
				if player_list[i] ~= nil then
					max = math.max(max, player_cut_list[i])
				else
					return max
				end
			end
		end
		return max
	end
    function Rank_to_RP(rank)
		if rank <= 99 then
			return RP_untill_lvl_100[rank]
		else
			return ((25 * (rank^2)) + (23575 * rank) - 1023150) + 100
		end
	end
    function Session_changer(session)
		globals.set_int(Change_session_type, session)
		if session == -1 then
			globals.set_int(Change_session_suit, -1)
		end
		sleep(0.5)
		globals.set_int(Change_session_switch, 1)
		sleep(0.5)
		globals.set_int(Change_session_switch, 0)
	end
--------

-- Config files / Heist presets
success, settings = pcall(json.loadfile, Settings_JSON_filename)
success_2, presets = pcall(json.loadfile, Presets_JSON_filename)
success_3, config = pcall(json.loadfile, "config.json")
if not success then
	settings = {}
    settings.Language = "EN_US"
    settings.Gender = 2
    settings.RemovedCars = false
    settings.RefillKey = 46
    settings.GlobalTester = false
    -- No clip
        settings.Noclip               = {}
        settings.Noclip.Up            = 16
        settings.Noclip.Down          = 17
        settings.Noclip.Forward       = 38
        settings.Noclip.Backward      = 40
        settings.Noclip.Turnleft      = 37
        settings.Noclip.Turnright     = 39
        settings.Noclip.Increasespeed = 107
        settings.Noclip.Decreasespeed = 109
        settings.Noclip.Toggle        = 111
    -- Numberplates
        settings.Numberplates           = {}
        settings.Numberplates.Enabled   = false
        settings.Numberplates.Unit      = 1
    -- Custom
        settings.Numberplates.Custom              = {}
        settings.Numberplates.Custom.Enabled      = false
        settings.Numberplates.Custom.Platelist    = {}
        settings.Numberplates.Custom.Platedefault = 0
    -- Boost button
        settings.BoostButton = {}
        settings.BoostButton.Enable = true
        settings.BoostButton.Key    = 45
        
end
if not success_2 then
    presets = {}
    presets = {}
    presets.Casino = {}
    presets.Cayo   = {}
    -- Casino
        presets.Casino.Name      = {"Easy","Hard"}
        presets.Casino.Approach  = {-1,-1}
        presets.Casino.Mode      = {1 ,2}
        presets.Casino.Target    = {3 ,3}
        presets.Casino.Hacker    = {4 ,4}
        presets.Casino.Gunman    = {1 ,1}
        presets.Casino.Weapon    = {1 ,1}
        presets.Casino.Driver    = {1 ,1}
        presets.Casino.Car       = {1 ,1}
        presets.Casino.Masks     = {1 ,1}
        presets.Casino.Settings1 = {
            {true,true},
            {true,true}
        }
        presets.Casino.Settings2 = {
            {false,false,true,false,true,false},
            {false,false,true,false,true,false}
        }
        presets.Casino.Settings3 = {
            {true,true},
            {true,true}
        }
    -- Cayo
end

function get_language()
    for i=1,#Menu_languages do
        if settings.Language == Menu_languages[i] then
            Current_language = i
        end
    end
    if Current_language == nil then
        Current_language = 1
    end
end
get_language()

json.savefile(Settings_JSON_filename, settings)
json.savefile(Presets_JSON_filename, presets)

pcall(json.loadfile, Settings_JSON_filename)
pcall(json.loadfile, Presets_JSON_filename)


-- Main
    Is_transaction_error_notification_shown_1 = 4537356     --   V1.68
    Is_transaction_error_notification_shown_2 = 4537357     --   V1.68
    Is_transaction_error_banner_shown         = 4537358     --   V1.68
    Achivement_global                         = 4543283 + 1 --   V1.68
    Change_session_type                       = 1575032     --   V1.68
    Change_session_switch                     = 1574589     --   V1.68
    Change_session_suit                       = 1574589 + 2 --   V1.68
-- Shapeshift        
    Shapeshift_Trigger = 2640095+62                          --  V1.68  Trigger
    Shapeshift_Hash    = 2640095+49                          --  V1.68  Hash
  
-- Casino  
    Casino_Cut_offset        = 1963945+1497+736+92           --  V1.68  (  __EntryFunction__()  )
    --  Global       
        Casino_Cut_Lester_offset    = Global_offset+29068    --  V1.68  (  /* Tunable: CH_LESTER_CUT */  )
        Casino_Cut_Hacker_offset    = Global_offset+29103    --  V1.68
        Casino_Cut_Driver_offset    = Global_offset+29098    --  V1.68
        Casino_Cut_Gunman_offset    = Global_offset+29093    --  V1.68
        Casino_Probability_Cash     = Global_offset+29086    --  V1.68  (  /* Tunable: CH_VAULT_WEIGHTING_CASH */  )
    -- Local  
        Casino_Keypad            = 54047                     --  V1.68  (  .f_4 -  )
        Casino_Fingerprint       = 52985                     --  V1.68
        Casino_Drill_total       = 10107+37                  --  V1.68  (  .f_7 == Local_  )
        Casino_Drill_stat        = 10107+7                   --  V1.68  (  .f_7 == Local_  )
        Casino_Real_take         = 19728+2686                --  V1.68  (  "MONEY_HELD"  )
  
-- Cayo  
    Cayo_Cut_offset      = 1970744+831+56                    --  V1.68  (  __EntryFunction__()  +  [0] = 100  ) in "heist_island_planning"
    -- Global  
        Cayo_Primary_target_value = Global_offset+30259      --  V1.68  (  /* Tunable: IH_PRIMARY_TARGET_VALUE_TEQUILA */  )
        Cayo_Bag_offset           = Global_offset+30009      --  V1.68  (  /* Tunable: 1859395035 */   )
        Cayo_Pavel_Cut            = Global_offset+30269      --  V1.68  (  /* Tunable: -1135949374 */  )
        Cayo_Fenving_fee          = Global_offset+30268      --  V1.68  (  /* Tunable: 902085532 */    )
    -- Local  
        Cayo_Sewer                = 29118                    --  V1.68
        Cayo_Fingerprint          = 24333                    --  V1.68
        Cayo_Cut_glass            = 30357+3                  --  V1.68  (  "DLC_H4_anims_glass_cutter_Sounds"  )
        Cayo_Refresh_table        = 1544                     --  V1.68  in "heist_island_planning"

-- Dommsady / Appartements  
    -- Doomsday  
        Doomsday_Cut_offset     = 1959865+812+50             --  V1.68
    -- Appartements
        Appartements_Cut_offset   = 1928233+1                --  V1.68
        Appartements_Cut_offset_l = 1930201+3008             --  V1.68  (  /* Tunable: MAX_HEIST_CUT_AMOUNT */)) *  )
        Appartements_Payout       = Global_offset+9313       --  V1.68  (  /* Tunable: HEIST_FLEECA_JOB_CASH_REWARD */  )
        Appartements_Fleeca_hack  = 11776 + 24               --  V1.68
        Appartements_Fleeca_drill = 10067 + 11               --  V1.68
--