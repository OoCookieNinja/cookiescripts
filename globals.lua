-- Common
    Cut_percent={} Cut_percent[-1]="0%" for i=2,39 do Cut_percent[i]=((i+1)*5).."%"end
    Cut_percent_Full={} Cut_percent_Full[0]="0%" for i=1,100 do Cut_percent_Full[i]=i.."%"end

    Menu_Languages={"EN_US","FR_FR"}
    placeholder_list       = {"",""}
    placeholder            = placeholder_list[current_language]

    function Text(text_shown, submenu_name)
        submenu_name:add_action(text_shown, function() end)
    end
    function null() end
    function mpx()return stats.get_int("MPPLY_LAST_MP_CHAR")end
    function HS()return script("fm_mission_controller")end
    function HS0()return script("fm_mission_controller_2020")end
    function Is_IN(Varaiable,List)
        for i = 1,#List do
            if Varaiable == List[i] then
                return true
            end
        end
        return false
    end
    function create_variable(var, start, stop, default_value)
        for i = start, stop do
            if not default_value then
                default_value = i
            end
            rawset(_G, var .. i, default_value)
        end
    end
    function round(value, dec)
        dec = dec or 0
        return tonumber(string.format("%." .. dec .. "f", value))
    end

    Settings_JSON_Filename = "Cookie.json"
--------

-- Global
    Game_Build = 2944
    Global_Offset = 262145
    Is_TransactionError_NotificationShown_1 = 4536678
    Is_TransactionError_NotificationShown_2 = 4536679
    TransactionError_BannerShown = 4536677
    Fast_Respawn_Timer = 2672524 + 1685 + 755
    Fast_Respawn = 2672524 + 1685 + 756
    Achivement_Global = 4542602 + 1
-- Cars
    -- Cars Hash
        Karin_Z190                      = Global_Offset+23066
        Pfiste_811                      = Global_Offset+14916
        Obey_9F                         = Global_Offset+35215
        Obey_9F_Cabrio                  = Global_Offset+35217
        Avarus                          = Global_Offset+17658
        Karin_Asterope                  = Global_Offset+35377
        Declasse_Asea                   = Global_Offset+35371
        Albany_Alpha                    = Global_Offset+35193
        Dinka_Akuma                     = Global_Offset+35295
        Bagger                          = Global_Offset+17674
        Gallivanter_Baller              = Global_Offset+35433
        Gallivanter_Baller_2            = Global_Offset+35257
        Gallivanter_Baller_LE           = Global_Offset+35259
        Gallivanter_Baller_LE_Armored   = Global_Offset+35261
        Pegassi_Bati                    = Global_Offset+35309
        Karin_BeeJay_XL                 = Global_Offset+35417
        BF_Injection                    = Global_Offset+35343
        BF_Bifta                        = Global_Offset+35339
        Vapid_Blade                     = Global_Offset+35337
        Nagasaki_Blazer                 = Global_Offset+35355
        Nagasaki_Blazer_Lifguard        = Global_Offset+28840
        Canis_Bodhi                     = Global_Offset+35345
        Coli_Brawler                    = Global_Offset+35177
        Bravado_Buffalo                 = Global_Offset+35395
        Bravado_Buffalo_S               = Global_Offset+35397
        Vapid_Bullet                    = Global_Offset+35253
        Grotti_Carbonizzare             = Global_Offset+35209
        Albany_Cavalcade                = Global_Offset+35413
        Albany_Cavalcade_2              = Global_Offset+35415
        Rune_Cheburek                   = Global_Offset+24273
        Grotti_Cheetah                  = Global_Offset+35245
        Cliffhanger                     = Global_Offset+17492
        Vapid_Clique                    = Global_Offset+25970
        Enus_Cognoscenti                = Global_Offset+35179
        Enus_Cognoscenti_Armored        = Global_Offset+35181
        Enus_Cognoscenti_55             = Global_Offset+35183
        Enus_Cognoscenti_55_Armored     = Global_Offset+35185
        Enus_Cognoscenti_Cabrio         = Global_Offset+35169
        Pfister_Comet                   = Global_Offset+19320
        Pfister_Comet_Retro             = Global_Offset+19321
        Pfister_Comet_SR                = Global_Offset+23065
        Vapid_Contender                 = Global_Offset+17491
        Invetero_Coquette               = Global_Offset+35175
        Invetero_Coquette_Blackfin      = Global_Offset+35211
        Coli_Cyclone                    = Global_Offset+22078
        Schyster_Deviant                = Global_Offset+25972
        Karin_Dilettante                = Global_Offset+35275
        Dinka_DoubleT                   = Global_Offset+35297
        BF_Dune                         = Global_Offset+35341
        Weeny_Dynasty                   = Global_Offset+25990
        Dinka_Enduro                    = Global_Offset+35299
        Overflod_Entity_XF              = Global_Offset+35247
        Pegassi_Esskey                  = Global_Offset+17657
        Emperor_ETR1                    = Global_Offset+35243
        Dewbauchee_Examplar             = Global_Offset+35167
        Ocelot_F620                     = Global_Offset+35281
        Vulcar_fagaloa                  = Global_Offset+24264
        Principe_Faggio                 = Global_Offset+35311   --
        Principe_Faggio_Sport           = Global_Offset+17660   -- Check
        Principe_Faggio_Mod             = Global_Offset+17672   --
        Lampadati_Fellon                = Global_Offset+35277
        Lampadati_Fellon_GT             = Global_Offset+35279
        Benefactor_Feltzer              = Global_Offset+35195
        Vapid_FMJ                       = Global_Offset+35255
        Fathom_FQ2                      = Global_Offset+35431 ----- 24373
        Franken_Stange                  = Global_Offset+35409
        Cheval_Fugitive                 = Global_Offset+35367
        Lampadati_Furore_GT             = Global_Offset+35213
        Schyster_Fusilade               = Global_Offset+35407
        Karin_Futo                      = Global_Offset+35403 ----- 24366
        Bravado_Gauntlet                = Global_Offset+35325
        Progen_GP1                      = Global_Offset+20392
        Declasse_Granger                = Global_Offset+35425
        Bravado_Gresley                 = Global_Offset+35421
        Grotti_GT500                    = Global_Offset+23057
        Emperor_Habanero                = Global_Offset+35429 ----- 24375
        Shitzu_Hakuchou                 = Global_Offset+35317
        Annis_Hellion                   = Global_Offset+25989
        Albany_Hermes                   = Global_Offset+23064
        Hexer                           = Global_Offset+35301
        Nagasaki_Hot_Blazer             = Global_Offset+35357
        Vapid_Hustler                   = Global_Offset+23058
        Pegassi_Infernus                = Global_Offset+35249
        Vulcar_Ingot                    = Global_Offset+35385
        Innovation                      = Global_Offset+35303
        Karin_Intruder                  = Global_Offset+35379
        Weeny_Issi                      = Global_Offset+35273
        Weeny_Issi_Sport                = Global_Offset+25986
        Ocelot_Jackal                   = Global_Offset+35283
        Dewbauchee_JB700                = Global_Offset+35231
        Dinka_Jester                    = Global_Offset+35205
        Dinka_Jester_Racing             = Global_Offset+35401
        Canis_Kalahari                  = Global_Offset+35347
        Dundreary_LandStalker           = Global_Offset+35427
        Dundreary_LandStalker_Xl        = Global_Offset+29536
        Declasse_LifeGuard              = Global_Offset+28839
        Ocelot_Locust                   = Global_Offset+25982
        Ocelot_Lynx                     = Global_Offset+17494
        Dewbauchee_Massacro             = Global_Offset+35197
        Dewbauchee_Massacro_Racing      = Global_Offset+35399
        Canis_Mesa                      = Global_Offset+35441
        Lampadati_Michelli_GT           = Global_Offset+24276
        Vapid_Minivan                   = Global_Offset+14911
        Vulcar_Nebula                   = Global_Offset+24988
        Principe_Nemesis                = Global_Offset+35315
        Vysser_Neo                      = Global_Offset+25999
        Ubermacht_Oracle                = Global_Offset+35285
        Ubermacht_Oracle_XS             = Global_Offset+35287
        Enus_Paragon                    = Global_Offset+26000
        Mammoth_Patriot                 = Global_Offset+35435 ----- 24374
        Shitzu_PCJ600                   = Global_Offset+35319
        Maibatsu_Penumbra               = Global_Offset+35405
        Vapid_Peyote_Grasser            = Global_Offset+25992
        Cheval_Picador                  = Global_Offset+35329
        Lampadati_Pigalle               = Global_Offset+35411
        Bollokan_Prairie                = Global_Offset+35271 ----- 24369
        Declasse_Premier                = Global_Offset+35373
        Vapid_radi                      = Global_Offset+35439
        Declasse_Rancher_XL             = Global_Offset+35349
        Dewbauchee_Rapid_GT             = Global_Offset+35199
        Dewbauchee_Rapid_GT_Convertible = Global_Offset+35201
        Dewbauchee_Rapid_GT_Classic     = Global_Offset+22082
        BF_Raptor                       = Global_Offset+17665
        Rat_Bike                        = Global_Offset+17675
        Bravado_Rat_Loader              = Global_Offset+35327
        Annis_RE_7B                     = Global_Offset+17485
        Karin_Rebel                     = Global_Offset+35351
        Dundreary_Regina                = Global_Offset+35375
        Vapid_Retinue                   = Global_Offset+22081
        Ubermacht_Revolter              = Global_Offset+23059
        Vapid_Riata                     = Global_Offset+23063
        Obey_Rocoto                     = Global_Offset+35437
        Chariot_Romero_Hearse           = Global_Offset+35365
        Albany_Roosvelt                 = Global_Offset+35221
        Albany_Roosvelt_Valor           = Global_Offset+35237
        Pegassi_Ruffian                 = Global_Offset+35313
        Imponte_Ruiner                  = Global_Offset+35333 ----- 24367
        Hijak_Ruston                    = Global_Offset+20394
        Karin_Rebel_Rusty               = Global_Offset+35353
        Annis_S80                       = Global_Offset+25996
        Maibatsu_Sanchez                = Global_Offset+35305
        Maibatsu_Sanchez_Livery         = Global_Offset+35307
        Sanctus                         = Global_Offset+17668
        Vapid_Sandking_SWB              = Global_Offset+35359
        Annis_Savestra                  = Global_Offset+23062
        Ubermacht_SC1                   = Global_Offset+23055
        Benefactor_Schafter             = Global_Offset+35363
        Benefactor_Schafter_LWB         = Global_Offset+35189
        Benefactor_Schafter_LWB_Armored = Global_Offset+35191
        Benefactor_Schwartzer           = Global_Offset+35391
        Canis_Saminole                  = Global_Offset+35423
        Canis_Saminole_Frontier         = Global_Offset+29537
        Ubermacht_Sentinel              = Global_Offset+35289
        Benefactor_Serrano              = Global_Offset+35419
        Dewbauchee_Seven_70             = Global_Offset+35203
        Sovereign                       = Global_Offset+35323
        Enus_Stafford                   = Global_Offset+24357
        Vapid_Stanier                   = Global_Offset+35383
        Grotti_Stinger                  = Global_Offset+35225
        Grotti_Stinger_GT               = Global_Offset+35227
        Benefactor_Stirling_GT          = Global_Offset+35223
        Zirconium_Stratum               = Global_Offset+35389
        Benefactor_Streiter             = Global_Offset+23052
        Enus_Super_Diamond              = Global_Offset+35187
        Benefactor_Surano               = Global_Offset+35393
        Cheval_Surge                    = Global_Offset+35369
        Ocelot_Swinger                  = Global_Offset+24356
        Obey_Tailgater                  = Global_Offset+35381
        Dinka_Thrust                    = Global_Offset+35171
        Lampadati_Tigon                 = Global_Offset+29883
        pegassi_Torero                  = Global_Offset+21276
        Declasse_Tornado_Rat_Rod        = Global_Offset+17673
        Declasse_Tulip                  = Global_Offset+25973
        Progen_Tyrus                    = Global_Offset+17483
        Pegassi_Vacca                   = Global_Offset+35251
        Shitzu_Vader                    = Global_Offset+35321
        Declasse_Vamos                  = Global_Offset+26957
        Bravado_Verlierer               = Global_Offset+35219
        Dinka_Verus                     = Global_Offset+30364
        Declasse_Vigero                 = Global_Offset+35331
        Lampadati_Viseris               = Global_Offset+23067
        Coil_Voltic                     = Global_Offset+35241
        Vulcar_Warrener                 = Global_Offset+35387
        Albany_Washington               = Global_Offset+35361
        Wolfsbane                       = Global_Offset+17671
        Ocelot_XA_21                    = Global_Offset+21274
        Benefactor_XLS                  = Global_Offset+35267
        Benefactor_XLS_Armored          = Global_Offset+35269
        Truffade_Z_Type                 = Global_Offset+35239
        Ubermacht_Zion                  = Global_Offset+35291
        Ubermacht_Zion_Cabrio           = Global_Offset+35293
        Ubermacht_Zion_Classic          = Global_Offset+35987
        Zomble_Bobber                   = Global_Offset+17656
        Pegassi_Zorusso                 = Global_Offset+25984
    -- LSCM
        Auto_Shop_Contract_Setup = Global_Offset+31888
        Auto_Shop_Contract_Finale = Global_Offset+31889

        Auto_Shop_Car_Delivery = Global_Offset+31890
        Exotic_Export_Delivery = Global_Offset+31891
-- Shapeshift
    Shapeshift_Trigger = 2639889+61    -- Trigger
    Shapeshift_Hash    = 2639889+48    -- Hash
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
    Doomsday_Act_I_Hack_1 = 1540           -- Skip Server hack Next to (DLC_XM17_IAA_Hack_Minigame_Scene) in fm_mission_controller.c
    Doomsday_Act_I_Hack_2 = 1509           -- Skip Server hack Next to (DLC_XM17_IAA_Hack_Minigame_Scene) in fm_mission_controller.c
    -- Appartements
    Appartements_Cut_offset = 1938365+3008 -- Appartements player's Cut offset
