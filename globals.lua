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

--------

--[[
"MONEY_HELD"
]]--

-- Global
    Game_Build = 2944
    Global_Offset = 262145
-- Main
    -- Transaction Error
        Is_TransactionError_NotificationShown_1 = 4536678
        Is_TransactionError_NotificationShown_2 = 4536679
        TransactionError_BannerShown            = 4536677
    -- Achivement
        Achivement_Global = 4542602 + 1
    -- Interaction menu
        Current_Interaction_MenuTab  = 2766622
        Current_Interaction_MenuItem = 2766716 + 7729
    -- Heists
        Rp_Cap = Global_Offset+23463 -- H2_JOB_RP_CAP in fm_mission_controller
-- Shapeshift
    Shapeshift_Trigger = 2639889+61    -- Trigger
    Shapeshift_Hash    = 2639889+48    -- Hash
-- Casino -- fm_mission_controller.c
    Casino_Cut_offset        = 1971696+2325          -- Casino Player's Cut offset     V1.67
    -- /* Tunable: CH_LESTER_CUT */
    Casino_Cut_Lester_offset = Global_Offset+28998   -- Global_262145.f_28998
    Casino_Cut_Hacker_offset = Global_Offset+29033   -- Global_262145.f_29033 1->5
    Casino_Cut_Driver_offset = Global_Offset+29028   -- Global_262145.f_29028 1->5
    Casino_Cut_Gunman_offset = Global_Offset+29023   -- Global_262145.f_29023 1->5
    -- Local
    Casino_keypad            = 54026                 -- 
    Casino_fingerprint       = 52964                 -- 
    Casino_drill_total       = 10101+37              -- 
    Casino_drill_stat        = 10101+7               -- 
    Casino_real_take         = 19710+2686            -- "MONEY_HELD"

-- Cayo
    Cayo_Primary_target  = 1
    Cayo_Cut_offset      = 1978495+825+56        -- Cayo Player's Cut offset           V1.67
    Cayo_Bag_offset      = Global_Offset+29939   -- Cayo Bag size mofifier             V1.67
    Cayo_Refresh_table   = 1526                  -- Cayo Refresh Kosatka's Table (2)
    Cayo_sewer           = 28446                 -- Cayo sewer's cut offset            V1.67
    Cayo_fingerprint     = 23669                 -- Cayo fingerprint's offset          V1.67
    Cayo_Cut_glass       = 29685+3               -- Cayo glass's offset                V1.67
    Cayo_Voltlab_Target  = 759                   -- Cayo Voltlab target                
    Cayo_Voltlab_Current = 760                   -- Cayo Voltlab stat                  
    Cayo_Pavel_Cut       = Global_Offset+30199   -- Cayo Pavel's Cut                   V1.67
    Cayo_Fenving_fee     = Global_Offset+30198   -- Cayo Fencing fee                   V1.67
-- Dommsady / Appartements
    -- Doomsday
        Doomsday_Cut_offset   = 1967630+812+50 -- Doomsday Player's Cut offset
    -- Appartements
        Appartements_Cut_offset = 1938365+3008 -- Appartements player's Cut offset
    -- Autoshop
        Auto_Shop_Contract_Setup = Global_Offset+31888
        Auto_Shop_Contract_Finale = Global_Offset+31889

        Auto_Shop_Car_Delivery = Global_Offset+31890
        Exotic_Export_Delivery = Global_Offset+31891

        Auto_Shop_Total_Ammount = Global_Offset+31249
--