-- Common
    -- List and Variables
    Cut_percent={} Cut_percent[-1] = "0%" for i=2,39 do Cut_percent[i]=((i+1)*5).."%"end
    Cut_percent_Full={} Cut_percent_Full[0] = "0%" for i=1,100 do Cut_percent_Full[i]=i.."%"end
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
    --
    Menu_Languages={"EN_US","FR_FR"}
    Settings_JSON_Filename = "Cookie.json"

    Weapon_Hash = {}
    Weapon_Hash[1] = "weapon_railgun"
    Weapon_Hash[2] = "weapon_stungun"
    Weapon_Hash[3] = "weapon_stungun_mp"
    Weapon_Hash[4] = "weapon_raypistol"

    placeholder_list       = {"",""}
    placeholder            = placeholder_list[current_language]

    -- Functions
    function Save_settings(filename, list_settings)
        json.savefile(filename, list_settings)
    end
    function Text(text_shown, submenu_name)
        if submenu_name ~= nil then
            submenu_name:add_action(text_shown, function() end)
        else
            menu.add_action(text_shown, function() end)
        end
    end
    function null() end
    function mpx()return "MP"..stats.get_int("MPPLY_LAST_MP_CHAR").."_" end
    function HS() return script("fm_mission_controller") end
    function HS0()return script("fm_mission_controller_2020") end
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
    function get_max_cut(cut_offset)
        return math.max(
            globals.get_int(cut_offset+1),
            globals.get_int(cut_offset+2),
            globals.get_int(cut_offset+3),
            globals.get_int(cut_offset+4)
        )
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

--------

--[[
    Random Stuff:
        freemode
        tuneabales_processing
    Casino:
        fm_mission_controller -> locals for in heist + global for preps
        gb_casino_heist-planning -> cut for players
    Cayo:
        fm_mission_controller_2020 -> locals for in heist + global for preps
        heist_island_planning -> cut for players
    Doomsday:
        fm_mission controller -> locals for in heist + global for preps
        gb_gang_ops_plannning -> cut for players
    Appartements:
        fm_mission controller -> locals for in heist + global for preps
        fmmc_launcher ->  -> cut for players
]]--

-- Global
    Game_Build         = 3905
    Global_Offset      = 262145
    Heist_Max_Take_idx = {"casino" ,"cayo" }
    Heist_Max_Take     = {3600000  ,2500000}
-- Main
    -- Transaction Error
        Is_TransactionError_NotificationShown_1 = 4537356 --                                    V1.68
        Is_TransactionError_NotificationShown_2 = 4537357 --                                    V1.68
        TransactionError_BannerShown            = 4537358 --                                    V1.68
    -- Achivement      
        Achivement_Global = 4543283 + 1                   --                                    V1.68
    -- Interaction menu    
        Current_Interaction_MenuTab  = 2766622            --                                    V1.67
        Current_Interaction_MenuItem = 2766716 + 7729     --                                    V1.67

-- Shapeshift      
    Shapeshift_Trigger = 2640095+62                       --                                    V1.68  Trigger
    Shapeshift_Hash    = 2640095+49                       --                                    V1.68  Hash

-- Casino
    Casino_Cut_offset        = 1963945+1497+736+92         --  V1.68  (  __EntryFunction__()  )
    --  Global     
        Casino_Cut_Lester_offset    = Global_Offset+29068  --  V1.68  (  /* Tunable: CH_LESTER_CUT */  )
        Casino_Cut_Hacker_offset    = Global_Offset+29103  --  V1.68
        Casino_Cut_Driver_offset    = Global_Offset+29098  --  V1.68
        Casino_Cut_Gunman_offset    = Global_Offset+29093  --  V1.68
        Casino_Probability_Cash     = Global_Offset+29086  --  V1.68  (  /* Tunable: CH_VAULT_WEIGHTING_CASH */  )
    -- Local
        Casino_keypad            = 54047                   --  V1.68  (  .f_4 -  )
        Casino_fingerprint       = 52985                   --  V1.68
        Casino_drill_total       = 10107+37                --  V1.68  (  .f_7 == Local_  )
        Casino_drill_stat        = 10107+7                 --  V1.68  (  .f_7 == Local_  )
        Casino_real_take         = 19728+2686              --  V1.68  (  "MONEY_HELD"  )

-- Cayo
    Cayo_Cut_offset      = 1970744+831+56                  --  V1.68  (  __EntryFunction__()  +  [0] = 100  ) in "heist_island_planning"
    -- Global
        Cayo_Primary_target_value = Global_Offset+30259    --  V1.68  (  /* Tunable: IH_PRIMARY_TARGET_VALUE_TEQUILA */  )
        Cayo_Bag_offset           = Global_Offset+30009    --  V1.68  (  /* Tunable: 1859395035 */   )
        Cayo_Pavel_Cut            = Global_Offset+30269    --  V1.68  (  /* Tunable: -1135949374 */  )
        Cayo_Fenving_fee          = Global_Offset+30268    --  V1.68  (  /* Tunable: 902085532 */    )
        Cayo_Panther_Statement    = Global_Offset+30199    --  V1.68  | in "heist_island_planning"
        Cayo_Boost_Statement      = Global_Offset+30198    --  V1.68  | (  /* Tunable: H4_TARGET_WEIGHTING_POSIX_TIME */
        Cayo_BitTest_Statement    = 1974418+10             --  V1.68  | 
        Cayo_BitTest_Value        = 21                     --  V1.68  |
        Cayo_Weight_Base          = Global_Offset+30193    --  V1.68  | (  /* Tunable: H4_TARGET_WEIGHTING_TEQUILA */;  )
    -- Local
        Cayo_sewer                = 29118                  --  V1.68
        Cayo_fingerprint          = 24333                  --  V1.68
        Cayo_Cut_glass            = 30357+3                --  V1.68  (  "DLC_H4_anims_glass_cutter_Sounds"  )
        Cayo_Refresh_table        = 1544                   --  V1.68  in "heist_island_planning"

-- Dommsady / Appartements  
    -- Doomsday  
        Doomsday_Cut_offset     = 1959865+812+50           --  V1.68
    -- Appartements        
        Appartements_Cut_offset = 1930201+3008             --  V1.68  (  /* Tunable: MAX_HEIST_CUT_AMOUNT */)) *  )
--