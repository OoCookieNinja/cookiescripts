-- Common
    Cut_percent={} Cut_percent[-1]="0%" for i=2,39 do Cut_percent[i]=((i+1)*5).."%"end
    Cut_percent_Full={} Cut_percent_Full[0]="0%" for i=1,100 do Cut_percent_Full[i]=i.."%"end

    Menu_Languages={"EN_US","FR_FR"}
    local placeholder_list = {"",""}
    placeholder            = placeholder_list[current_language]

    function Text(text_shown, submenu_name)
        submenu_name:add_action(text_shown, function() end)
    end
    function null() end
    function mpx()return stats.get_int("MPPLY_LAST_MP_CHAR")end
    function HS()return script("fm_mission_controller")end
    function HS0()return script("fm_mission_controller_2020")end

    function create_variable(var, start, stop, default_value)
        for i = start, stop do
            if not default_value then
                default_value = i
            end
            rawset(_G, var .. i, default_value)
        end
    end



    Settings_JSON_Filename = "Cookie.json"

-- Global
    Game_Build = 2944
    Global_Offset = 262145
    Is_TransactionError_NotificationShown_1 = 4536678
    Is_TransactionError_NotificationShown_2 = 4536679
    TransactionError_BannerShown = 4536677
    Fast_Respawn_Timer = 2672524 + 1685 + 755
    Fast_Respawn = 2672524 + 1685 + 756
-- Shapeshift
    Gender  = 2             -- Default gender: Male=1/Female=2
    Shape_T = 2639889+61    -- Trigger
    Shape_H = 2639889+48    -- Hash
-- Casino
    Casino_Cut_offset        = 1971696+2325          -- Casino Player's Cut offset     V1.67
    -- /* Tunable: CH_LESTER_CUT */
    Casino_Cut_Lester_offset = Global_Offset+28998   -- Global_262145.f_28998
    Casino_Cut_Hacker_offset = Global_Offset+29033   -- Global_262145.f_29033 1->5
    Casino_Cut_Driver_offset = Global_Offset+29028   -- Global_262145.f_29028 1->5
    Casino_Cut_Gunman_offset = Global_Offset+29023   -- Global_262145.f_29023 1->5
    --
    Casino_keypad            = 54026                 -- Casino Keypad's offset         V1.67
    Casino_fingerprint       = 52964                 -- Casino Fingerprin's offset     V1.67
    Casino_drill_total       = 10101+37              -- Casino Vault/Drill Total       V1.67
    Casino_drill_stat        = 10101+7               -- Casino Vault/Drill Stat        V1.67
--Cayo
    Cayo_Primary_target  = 1
    Cayo_Cut_offset      = 1978495+825+56        -- Cayo Player's Cut offset           V1.67
    Cayo_Bag_offset      = Global_Offset+29939   -- Cayo Bag size mofifier             V1.67
    Cayo_Refresh_table   = 1526                  -- Cayo Refresh Kosatka's Table (2)
    Cayo_sewer           = 28446                 -- Cayo sewer's cut offset            V1.67
    Cayo_fingerprint     = 23669                 -- Cayo fingerprint's offset          V1.67
    Cayo_Cut_glass       = 29685+3               -- Cayo glass's offset                V1.67
    Cayo_Voltlab_Target  = 759                   -- Cayo Voltlab target                
    Cayo_Voltlab_Current = 760                   -- Cayo Voltlab stat                  
    Cayo_Pavel_Cut       = Global_Offset+30199   -- Cayo Pavel's Cut (0.0 or -0.1)     V1.67
    Cayo_Fenving_fee     = Global_Offset+30198   -- Cayo Fencing fee (0.0 or -0.02)    V1.67
-- Dommsady / Appartements
    -- Doomsday
    Doomsday_Cut_offset = 1967630+812+50 -- Doomsday Player's Cut offset
    Doomsday_Act_I_Hack_1 = 1540         -- Skip Server hack Next to (DLC_XM17_IAA_Hack_Minigame_Scene) in fm_mission_controller.c
    Doomsday_Act_I_Hack_2 = 1509         -- Skip Server hack Next to (DLC_XM17_IAA_Hack_Minigame_Scene) in fm_mission_controller.c
    -- Appartements
