require("scripts/Cookie_Menu_globals")

-- Global / Multiple
    -- Cool
        You             = {"You","Toi"}
        Empty_Text      = {"Empty","Vide"}
        None_Text       = {"None","Aucun"}
        Set             = {"Set","Appliquer"}
        Notset          = {"Not set","Non appliqué"}
        Selected_Text   = {"Selected","Sélectioné"}
        Unselected_Text = {"Unselected","Non selectioné"}
        Notinheist      = {"Not in heist","Pas dans le braquage"}
        Half_Separator  = "_____________"
        Separator_Text  = Half_Separator..Half_Separator..Half_Separator..Half_Separator
        Arrow_down1     = Half_Separator.."↓ "
        Arrow_down2     = " ↓"..Separator_Text
        Arrow_right     = " →"
        Manual_Text     = {"Manual","Manuel"}
        White_space     = "      "
        You_Text        = You[Current_language]
        Empty_Text      = Empty_Text[Current_language]
        None_Text       = None_Text[Current_language]
        Set_Text        = Set[Current_language]..Arrow_right
        Notset_Text     = Notset[Current_language]
        Selected_Text   = Selected_Text[Current_language]
        Unselected_Text = Unselected_Text[Current_language]
        Notinheist_Text = Notinheist[Current_language]
        Manual_Text     = Arrow_down1..Manual_Text[Current_language]..Arrow_down2
    -- Cuts
        Cut_Player_List = {}
        Cut_Player_List[0] = {"Player","Joueur"}
        for i=1,4 do
            Cut_Player_List[i] = Cut_Player_List[0][Current_language].." "..i.." → "
        end
        Cut_slider         = {"One slider for all players","Gestion de tout les joueurs"}
        Cut_slider         = Cut_slider[Current_language]
        Cut_player         = {"Player cuts","Pourcentage joueur"}
        Cut_player         = Arrow_down1..Cut_player[Current_language]..Arrow_down2
        Cut_Crew1          = {"Crew cuts","Pourcentage equipe"}
        Cut_Crew1          = Arrow_down1..Cut_Crew1[Current_language]..Arrow_down2
        Cut_Crew2          = {"Apply during heist (Only you)","Appliquer pendant braquage (Toi seul)"}
        Cut_Crew2          = Cut_Crew2[Current_language]
        Cut_Crew3          = Separator_Text
    -- Mode
        Heist_difficulty_list = {}
        Heist_difficulty_list[1] = {"Normal","Normal"}
        Heist_difficulty_list[2] = {"Hard","Dur"}
        Heist_difficulty_list[1] = Heist_difficulty_list[1][Current_language]
        Heist_difficulty_list[2] = Heist_difficulty_list[2][Current_language]
    -- Other / Heist
        Extras_Submenu = {"During heist","Pendant braquage"}
        Extras_Submenu = Extras_Submenu[Current_language]
        Heist_Text     = {"Heist","Braquage"}
        Heist_Text     = White_space..Heist_Text[Current_language]
        Cooldown_skip  = {"Skip cooldown","Passer l'attente"}
        Cooldown_skip  = Cooldown_skip[Current_language]
        Settings_Submenu = {"Settings","Paramétre"}
        Settings_Submenu = Settings_Submenu[Current_language]
----



-- Casino
Casino_Submenu = {"Casino","Casino"}
Casino_Submenu = Casino_Submenu[Current_language]
-- Lists and Variables
    -- Casino_Setup_missions_List1
        Casino_Setup_missions_List1    = {}
        Casino_Setup_missions_List1[0] = {"Vault content","Contenu du coffre"}
        Casino_Setup_missions_List1[1] = {"Vault keycard","Carte du coffre"}
        Casino_Setup_missions_List1[2] = {"Weapons collected","Armes collectés"}
        Casino_Setup_missions_List1[3] = {"Vehicles collected","Vehicules collectés"}
        Casino_Setup_missions_List1[4] = {"Hacking device","Appareil de piratage"}
        Casino_Setup_missions_List1[5] = {"Nano drone","Nano drone"}
        Casino_Setup_missions_List1[6] = {"Vault laser","Laser pour coffre"}
        Casino_Setup_missions_List1[7] = {"Vault drills","Perceuse pour coffre"}
        Casino_Setup_missions_List1[8] = {"Vault explosives","Explosif pour Coffre"}
        Casino_Setup_missions_List1[9] = {"Breaching charges","Charges explosives"}
        Casino_Setup_missions_List1[0] = Casino_Setup_missions_List1[0][Current_language]..Arrow_right
        Casino_Setup_missions_List1[1] = Casino_Setup_missions_List1[1][Current_language]..Arrow_right
        Casino_Setup_missions_List1[2] = Casino_Setup_missions_List1[2][Current_language]..Arrow_right
        Casino_Setup_missions_List1[3] = Casino_Setup_missions_List1[3][Current_language]..Arrow_right
        Casino_Setup_missions_List1[4] = Casino_Setup_missions_List1[4][Current_language]..Arrow_right
        Casino_Setup_missions_List1[5] = Casino_Setup_missions_List1[5][Current_language]..Arrow_right
        Casino_Setup_missions_List1[6] = Casino_Setup_missions_List1[6][Current_language]..Arrow_right
        Casino_Setup_missions_List1[7] = Casino_Setup_missions_List1[7][Current_language]..Arrow_right
        Casino_Setup_missions_List1[8] = Casino_Setup_missions_List1[8][Current_language]..Arrow_right
        Casino_Setup_missions_List1[9] = Casino_Setup_missions_List1[9][Current_language]..Arrow_right
    -- Casino_Setup_missions_List0
        Casino_Setup_missions_List0     = {}
        Casino_Setup_missions_List0[1]  = {"Patrol routes         ","Routes de patrouille"}
        Casino_Setup_missions_List0[2]  = {"Duggan shipments      ","Chargemnts Dugans"}
        Casino_Setup_missions_List0[3]  = {"Infiltration suit     ","Tenues d'infiltrations"}
        Casino_Setup_missions_List0[4]  = {"Power drills          ","Perceuses"}
        Casino_Setup_missions_List0[5]  = {"EMP device            ","Appareil IEM"}
        Casino_Setup_missions_List0[6]  = {"Gunman decoy          ","Leure"}
        Casino_Setup_missions_List0[7]  = {"Clean vehicle         ","Vehicules propres"}
        Casino_Setup_missions_List0[8]  = {"Bugstars van          ","Van Bugstars"}
        Casino_Setup_missions_List0[9]  = {"Plant trash           ","Planter les poubelles"}
        Casino_Setup_missions_List0[10] = {"Maintainance gear     ","Déguisement de maintenance"}
        Casino_Setup_missions_List0[11] = {"Maintainance van      ","Van de maintenance"}
        Casino_Setup_missions_List0[12] = {"Grouppe Sechs van     ","Van de Grouppe"}
        Casino_Setup_missions_List0[13] = {"Grouppe Sechs gear    ","Déguisement de Grouppe"}
        Casino_Setup_missions_List0[14] = {"[!]Yung ancestors car ","Voiture de Yung"}
        Casino_Setup_missions_List0[15] = {"[!]Yung ancestors gear","Tenues de Yung"}
        Casino_Setup_missions_List0[16] = {"Noose gear            ","Déguisement du NOOSE"}
        Casino_Setup_missions_List0[17] = {"Fire fighter gear     ","Déguisement des pompiers"}
        Casino_Setup_missions_List0[19] = {"Boring machine        ","Machine de perçage"}
        Casino_Setup_missions_List0[20] = {"Reinforced armor      ","Armure réinforcé"}
        Casino_Setup_missions_List0[1]  = Casino_Setup_missions_List0[01][Current_language]
        Casino_Setup_missions_List0[2]  = Casino_Setup_missions_List0[02][Current_language]
        Casino_Setup_missions_List0[3]  = Casino_Setup_missions_List0[03][Current_language]
        Casino_Setup_missions_List0[4]  = Casino_Setup_missions_List0[04][Current_language]
        Casino_Setup_missions_List0[5]  = Casino_Setup_missions_List0[05][Current_language]
        Casino_Setup_missions_List0[6]  = Casino_Setup_missions_List0[06][Current_language]
        Casino_Setup_missions_List0[7]  = Casino_Setup_missions_List0[07][Current_language]
        Casino_Setup_missions_List0[8]  = Casino_Setup_missions_List0[08][Current_language]
        Casino_Setup_missions_List0[9]  = Casino_Setup_missions_List0[09][Current_language]
        Casino_Setup_missions_List0[10] = Casino_Setup_missions_List0[10][Current_language]
        Casino_Setup_missions_List0[11] = Casino_Setup_missions_List0[11][Current_language]
        Casino_Setup_missions_List0[12] = Casino_Setup_missions_List0[12][Current_language]
        Casino_Setup_missions_List0[13] = Casino_Setup_missions_List0[13][Current_language]
        Casino_Setup_missions_List0[14] = Casino_Setup_missions_List0[14][Current_language]
        Casino_Setup_missions_List0[15] = Casino_Setup_missions_List0[15][Current_language]
        Casino_Setup_missions_List0[16] = Casino_Setup_missions_List0[16][Current_language]
        Casino_Setup_missions_List0[17] = Casino_Setup_missions_List0[17][Current_language]
        Casino_Setup_missions_List0[19] = Casino_Setup_missions_List0[19][Current_language]
        Casino_Setup_missions_List0[20] = Casino_Setup_missions_List0[20][Current_language]
    -- Casino_Approach_List
        Casino_Approach_List     = {}
        Silentnsneaky            = {"Silent n Sneaky","Furtive"}
        Thebigcon                = {"The Big CON","Rusée"}
        Aggressive               = {"Aggressive","En force"}
        Silentnsneaky            = Silentnsneaky[Current_language]
        Thebigcon                = Thebigcon[Current_language]
        Aggressive               = Aggressive[Current_language]
        Casino_Approach_List[1]  = Silentnsneaky
        Casino_Approach_List[2]  = Thebigcon
        Casino_Approach_List[3]  = Aggressive
        Casino_Approach_List[-1] = Unselected_Text
    -- Casino_Target_List
        Casino_Target_List   = {}
        Casino_Target_List[0] = {"Cash","Argent"}
        Casino_Target_List[1] = {"Gold","Or"}
        Casino_Target_List[2] = {"Artwork","Peintures"}
        Casino_Target_List[3] = {"Diamonds","Diamands"}
        Casino_Target_List[0] = Casino_Target_List[0][Current_language]
        Casino_Target_List[1] = Casino_Target_List[1][Current_language]
        Casino_Target_List[2] = Casino_Target_List[2][Current_language]
        Casino_Target_List[3] = Casino_Target_List[3][Current_language]
        
    -- Misc
        Casino_Hacker_List    = {}
        Casino_Hacker_List[0] = Unselected_Text
        Casino_Mask_List      = {}
        Casino_Mask_List[0]   = Unselected_Text

-- Casino Setup
    Casino_Setup_Submenu       = {"Casino setup","Préparation pour le casino"}
    Casino_Setup_Submenu       = Casino_Setup_Submenu[Current_language]
    Casino_Setup_Mode          = {"Go to finale","Aller au braquage"}
    Casino_Setup_Mode          = Casino_Setup_Mode[Current_language]..Arrow_right
    Casino_Setup_target_choise = {"Choose target","Choisir la cible"}
    Casino_Setup_target_choise = Casino_Setup_target_choise[Current_language]..Arrow_right
-- Casino Approach
    Casino_Approach_setmode = {"Set mode","Mettre le mode"}
    Casino_Approach_setmode = Casino_Approach_setmode[Current_language]..Arrow_right
    Casino_Approach_choice  = {"Approach","Approache"}
    Casino_Approach_choice  = Casino_Approach_choice[Current_language]..Arrow_right
    -- Casino Approach Settings
        Casino_Approach_settings_silentnsneaky           = Settings_Submenu..": "..Silentnsneaky
        Casino_Approach_settings_thebigcon               = Settings_Submenu..": "..Thebigcon
        Casino_Approach_settings_aggressive              = Settings_Submenu..": "..Aggressive
        Casino_Approach_settings_thebigcon_entrydesguise = {"Entry disguise","Deguisement d'entrée"}
        Casino_Approach_settings_thebigcon_entrydesguise = Arrow_down1..Casino_Approach_settings_thebigcon_entrydesguise[Current_language]..Arrow_down2
        Casino_Approach_Settings_Thebigcon_exitdesguise  = {"Exit disguise","Deguisement de sortie"}
        Casino_Approach_Settings_Thebigcon_exitdesguise  = Arrow_down1..Casino_Approach_Settings_Thebigcon_exitdesguise[Current_language]..Arrow_down2
        Casino_Approach_Settings_Submenu                 = {"Approach settings","Paramétre d'approache"}
        Casino_Approach_Settings_Submenu                 = Casino_Approach_Settings_Submenu[Current_language]
-- Support Crew
    -- Hacker
        Casino_Crew_Hacker      = {"Choose hacker","Choisir hacker"}
        Casino_Crew_Hacker      = Casino_Crew_Hacker[Current_language]..Arrow_right
        Casino_Crew_Hacker_Only = {"Hacker","Hacker"}
        Casino_Crew_Hacker_Only = Casino_Crew_Hacker_Only[Current_language]
    -- Gunman
        Casino_Crew_Gunman_Submenu       = {"Gunman and weapon","Armurier et armes"}
        Casino_Crew_Gunman_Submenu       = Casino_Crew_Gunman_Submenu[Current_language]
        Casino_Crew_Gunman_Only          = {"Gunman","Armurier"}
        Casino_Crew_Gunman_Only          = Casino_Crew_Gunman_Only[Current_language]
        Casino_Crew_Gunman_choise        = {"Choose one","Choisis-en un"}
        Casino_Crew_Gunman_choise        = Casino_Crew_Gunman_choise[Current_language]
        Casino_Crew_Gunman_MicroSMG      = {"Micro SMG","Pistolet mitrailleur"}
        Casino_Crew_Gunman_MicroSMG      = Casino_Crew_Gunman_MicroSMG[Current_language]
        Casino_Crew_Gunman_Machinepistol = {"Machine pistol","Pistolet performant"}
        Casino_Crew_Gunman_Machinepistol = Casino_Crew_Gunman_Machinepistol[Current_language]
        Casino_Crew_Gunman_Shotgun       = {"Shotgun","Fusil a pompe"}
        Casino_Crew_Gunman_Shotgun       = Casino_Crew_Gunman_Shotgun[Current_language]
        Casino_Crew_Gunman_Rifle         = {"Rifle","Fusil d'assualt"}
        Casino_Crew_Gunman_Rifle         = Casino_Crew_Gunman_Rifle[Current_language]
        Casino_Crew_Gunman_ShotgunMKII   = {"MkII shotgun","Fusil a pompe MkII"}
        Casino_Crew_Gunman_ShotgunMKII   = Casino_Crew_Gunman_ShotgunMKII[Current_language]
        Casino_Crew_Gunman_RifleMKII     = {"MKII rifle","Fusil d'assault MkII"}
        Casino_Crew_Gunman_RifleMKII     = Casino_Crew_Gunman_RifleMKII[Current_language]
    -- Driver
        Casino_Crew_Driver_Submenu = {"Driver and car","Conducteur et voiture"}
        Casino_Crew_Driver_Submenu = Casino_Crew_Driver_Submenu[Current_language]
        Casino_Crew_Driver_Only    = {"Driver","Conducteur"}
        Casino_Crew_Driver_Only    = Casino_Crew_Driver_Only[Current_language]
        Casino_Crew_Driver_choise  = {"Choose one (with wanted vehicle)","Choisir un (avec le vehicule)"}
        Casino_Crew_Driver_choise  = Casino_Crew_Driver_choise[Current_language]
        Casino_Crew_Driver_Bikes   = {"(Bikes)","(Motos)"}
        Casino_Crew_Driver_Bikes   = White_space..Casino_Crew_Driver_Bikes[Current_language]
    -- Masks
        Casino_Crew_Mask = {"Choose mask","Choisir un masque"}
        Casino_Crew_Mask = Casino_Crew_Mask[Current_language]..Arrow_right
-- Common Missions
        Casino_Setup_common_Submenu    = {"Common missions","Missions communes"}
        Casino_Setup_common_Submenu    = Casino_Setup_common_Submenu[Current_language]
        Casino_Setup_common_pass_level = {"Security pass level","Niveau des pass de secutite"}
        Casino_Setup_common_pass_level = Casino_Setup_common_pass_level[Current_language]..Arrow_right
        Casino_Setup_common_shipment   = {"Shipment destroyed","Quantité détruit"}
        Casino_Setup_common_shipment   = White_space..Casino_Setup_common_shipment[Current_language]
-- Casino Cut
    Casino_Cut_Submenu = {"Casino cut","Pourcentage pour le casino"}
    Casino_Cut_Submenu = Casino_Cut_Submenu[Current_language]
-- Casino Extras
    Casino_Extras_keypad      = {"Complete keypad","Completer le clavier numérique"}
    Casino_Extras_keypad      = Casino_Extras_keypad[Current_language]
    Casino_Extras_fingerprint = {"Complete fingerprint","Completer l'empreinte"}
    Casino_Extras_fingerprint = Casino_Extras_fingerprint[Current_language]
    Casino_Extras_drill_door  = {"Drill vault door","Forer le coffre"}
    Casino_Extras_drill_door  = Casino_Extras_drill_door[Current_language]
----



-- Cayo
Cayo_Submenu = {"Cayo perico","Cayo perico"}
Cayo_Submenu = Cayo_Submenu[Current_language]
-- Lists and Variables
    -- Global Cayo
        Cayo_NearMaindock  = {"Near Main dock","A coté du Dock Principal"}
        Cayo_Maindock      = {"Main dock","Dock Principal"}
        Cayo_InnerMaindock = {"Inner Main dock","Dock Principal interieur"}
        Cayo_Farmland      = {"Farmland","Champs"}
        Cayo_Northdock     = {"North dock","Dock nord"}
        Cayo_Airstrip      = {"Airstip","Piste d'atterisage"}
        Cayo_Lighthouse    = {"Lighthouse","Phare"}
        Cayo_NearMaindock  = Cayo_NearMaindock[Current_language]
        Cayo_Maindock      = Cayo_Maindock[Current_language]
        Cayo_InnerMaindock = Cayo_InnerMaindock[Current_language]
        Cayo_Farmland      = Cayo_Farmland[Current_language]
        Cayo_Northdock     = Cayo_Northdock[Current_language]
        Cayo_Airstrip      = Cayo_Airstrip[Current_language]
        Cayo_Lighthouse    = Cayo_Lighthouse[Current_language]
    -- Mission List & POI
        Cayo_Missions_List = {}
        Cayo_Missions_List[00] = {"Gather Intel*","Rassemlez des infos"}
        Cayo_Missions_List[01] = {"Kosatka Submarine","Sousmarin Kosatka"}
        Cayo_Missions_List[02] = {"RO-86 Alkonost","RO-86 Alkonost"}
        Cayo_Missions_List[03] = {"Velum 5-Seater","Velum 5-places"}
        Cayo_Missions_List[04] = {"Stealth Annihilator","Annihilator Furtif"}
        Cayo_Missions_List[05] = {"Kurtz Patrol Boat","Bateau de patrouille"}
        Cayo_Missions_List[06] = {"Longifin Boat","Bateau Longfin"}
        Cayo_Missions_List[07] = {"Pilot (Alkonost,Annihilator)","Pilote (Alkonost,Annihilator)"}
        Cayo_Missions_List[08] = {"Demolition Charges","Charges de démolition"}
        Cayo_Missions_List[09] = {"Cutting Torch*","Torche pour Découper*"}
        Cayo_Missions_List[10] = {"Plasma Cutter*","Découpeur plasma*"}
        Cayo_Missions_List[11] = {"Fingerprint Cloner*","Cloneur d'empreinte*"}
        Cayo_Missions_List[12] = {"Approach Weapon*","Amres pour Approache*"}
        Cayo_Missions_List[13] = {"Weapons Disruption","Armes perturb&"}
        Cayo_Missions_List[14] = {"Armor Disruption","Armure perturbé"}
        Cayo_Missions_List[15] = {"Air Support Disruption","Suppot Aérien perturbé"}
        Cayo_Missions_List[00] = Cayo_Missions_List[00][Current_language]..Arrow_right
        Cayo_Missions_List[01] = Cayo_Missions_List[01][Current_language]..Arrow_right
        Cayo_Missions_List[02] = Cayo_Missions_List[02][Current_language]..Arrow_right
        Cayo_Missions_List[03] = Cayo_Missions_List[03][Current_language]..Arrow_right
        Cayo_Missions_List[04] = Cayo_Missions_List[04][Current_language]..Arrow_right
        Cayo_Missions_List[05] = Cayo_Missions_List[05][Current_language]..Arrow_right
        Cayo_Missions_List[06] = Cayo_Missions_List[06][Current_language]..Arrow_right
        Cayo_Missions_List[07] = Cayo_Missions_List[07][Current_language]..Arrow_right
        Cayo_Missions_List[08] = Cayo_Missions_List[08][Current_language]..Arrow_right
        Cayo_Missions_List[09] = Cayo_Missions_List[09][Current_language]..Arrow_right
        Cayo_Missions_List[10] = Cayo_Missions_List[10][Current_language]..Arrow_right
        Cayo_Missions_List[11] = Cayo_Missions_List[11][Current_language]..Arrow_right
        Cayo_Missions_List[12] = Cayo_Missions_List[12][Current_language]..Arrow_right
        Cayo_Missions_List[13] = Cayo_Missions_List[13][Current_language]..Arrow_right
        Cayo_Missions_List[14] = Cayo_Missions_List[14][Current_language]..Arrow_right
        Cayo_Missions_List[15] = Cayo_Missions_List[15][Current_language]..Arrow_right
    -- Loots
        Cayo_set_loot_compound_table_List    = {}
        Cayo_Choose_Target                   = {}
        Cayo_set_loot_outside_table_List     = {}
        Cayo_set_loot_compound_table_List[1] = {"Gold","Or"}
        Cayo_set_loot_compound_table_List[2] = {"Cash","Argent"}
        Cayo_set_loot_outside_table_List[1]  = {"Cash","Argent"}
        Cayo_set_loot_outside_table_List[2]  = {"Weed","Weed"}
        Cayo_set_loot_outside_table_List[3]  = {"Coke","Cocaïne"}
        Cayo_Choose_Target[0]                = {"Sinsimito Tequila","Sinsimito Tequila"}
        Cayo_Choose_Target[1]                = {"Ruby Necklace","Colier de ruby"}
        Cayo_Choose_Target[2]                = {"Bearer Bonds","Les bons au porteur"}
        Cayo_Choose_Target[3]                = {"Pink Diamond","Diamant rose"}
        Cayo_Choose_Target[5]                = {"Panther Statue","Statue de la panthére"}
        Cayo_set_loot_compound_table_List[0] = Empty_Text
        Cayo_set_loot_compound_table_List[1] = Cayo_set_loot_compound_table_List[1][Current_language]
        Cayo_set_loot_compound_table_List[2] = Cayo_set_loot_compound_table_List[2][Current_language]
        Cayo_set_loot_outside_table_List[0]  = Empty_Text
        Cayo_set_loot_outside_table_List[1]  = Cayo_set_loot_outside_table_List[1][Current_language]
        Cayo_set_loot_outside_table_List[2]  = Cayo_set_loot_outside_table_List[2][Current_language]
        Cayo_set_loot_outside_table_List[3]  = Cayo_set_loot_outside_table_List[3][Current_language]
        Cayo_Choose_Target[-1]               = Notset_Text
        Cayo_Choose_Target[0]                = Cayo_Choose_Target[0][Current_language]
        Cayo_Choose_Target[1]                = Cayo_Choose_Target[1][Current_language]
        Cayo_Choose_Target[2]                = Cayo_Choose_Target[2][Current_language]
        Cayo_Choose_Target[3]                = Cayo_Choose_Target[3][Current_language]
        Cayo_Choose_Target[5]                = Cayo_Choose_Target[5][Current_language]
    -- Cayo_Loot_point
        Cayo_Setloot_table           = {}
        Cayo_Setloot_table[0]        = {"Table","Table"}
        for i = 1,3 do
            Cayo_Setloot_table[i]    = Cayo_Setloot_table[0][Current_language].." "..i..White_space..Arrow_right
        end
        Cayo_Setloot_painting        = {}
        Cayo_Setloot_painting[0]     = {"Painting","Tableau"}
        for i = 1,2 do
            Cayo_Setloot_painting[i] = Cayo_Setloot_painting[0][Current_language].." "..i..White_space..Arrow_right
        end
        Cayo_Loot_point = {}
        -- Table 1
            for i = 0,3 do
                Cayo_Loot_point[(i*2)+1] = Cayo_Setloot_table[1]
            end
            for i = 5,9 do
                Cayo_Loot_point[i*2] = Cayo_Setloot_table[1]
            end
            Cayo_Loot_point[21] = Cayo_Setloot_table[1]
            Cayo_Loot_point[23] = Cayo_Setloot_table[1]
        -- Table 2
            for i = 0,4 do
                Cayo_Loot_point[i*2] = Cayo_Setloot_table[2]
            end
            for i = 4,8 do
                Cayo_Loot_point[(i*2)+1] = Cayo_Setloot_table[2]
            end
            Cayo_Loot_point[20] = Cayo_Setloot_table[2]
            Cayo_Loot_point[22] = Cayo_Setloot_table[2]
        -- Table 3
            Cayo_Loot_point[8]  = Cayo_Setloot_table[3]
            Cayo_Loot_point[19] = Cayo_Setloot_table[3]
    -- Cayo_Point_of_interest_List
        Cayo_Point_of_interest_List    = {}
        Cayo_Point_of_interest_List[7]  = {"WatchTower Near Compound","Tour de garde a coté de la cour"}
        Cayo_Point_of_interest_List[12] = {"Weapon Suppressor","Silcencieux"}
        Cayo_Point_of_interest_List[13] = {"Cutting Powder","Poudre pour couper"}
        Cayo_Point_of_interest_List[14] = {"Power Station","Station éléctrique"}
        Cayo_Point_of_interest_List[15] = {"Supply Truck","Camion ravitailleur"}
        for i  =0,2 do
            Cayo_Point_of_interest_List[i*4+1] = Cayo_Northdock
        end
        for i = 0,2 do
            Cayo_Point_of_interest_List[i*4+2] = Cayo_Maindock
        end
        for i = 1,2 do
            Cayo_Point_of_interest_List[i*4] = Cayo_Airstrip
        end
        Cayo_Point_of_interest_List[0]  = Cayo_Airstrip
        Cayo_Point_of_interest_List[3]  = Cayo_Lighthouse
        Cayo_Point_of_interest_List[7]  = Cayo_Point_of_interest_List[7][Current_language]
        Cayo_Point_of_interest_List[11] = Cayo_Farmland
        Cayo_Point_of_interest_List[12] = White_space..Cayo_Point_of_interest_List[12][Current_language]
        Cayo_Point_of_interest_List[13] = Cayo_Point_of_interest_List[13][Current_language]
        Cayo_Point_of_interest_List[14] = Cayo_Point_of_interest_List[14][Current_language]
        Cayo_Point_of_interest_List[15] = Cayo_Point_of_interest_List[15][Current_language]
    -- Cayo_Interest_point
        Cayo_Interest_point    = {}
        Cayo_Interest_point[5] = {"Outside Compoud","Hors de la cour"}
        Cayo_Interest_point[0] = None_Text
        Cayo_Interest_point[1] = Cayo_Airstrip
        Cayo_Interest_point[2] = Cayo_Northdock
        Cayo_Interest_point[3] = Cayo_NearMaindock
        Cayo_Interest_point[4] = Cayo_Maindock
        Cayo_Interest_point[5] = Cayo_Interest_point[5][Current_language]

    -- Weapons
        Cayo_Choose_Weapon    = {}
        Cayo_Choose_Weapon[1] = {"Aggressor","Aggreseur"}
        Cayo_Choose_Weapon[2] = {"Conspirator","Conspirateur"}
        Cayo_Choose_Weapon[3] = {"Crackshot","Fine Gâchette"}
        Cayo_Choose_Weapon[4] = {"Saboteur","Saboteur"}
        Cayo_Choose_Weapon[5] = {"Marksman","Tireur d'élite"}
        Cayo_Choose_Weapon[0] = Notset_Text
        Cayo_Choose_Weapon[1] = Cayo_Choose_Weapon[1][Current_language]
        Cayo_Choose_Weapon[2] = Cayo_Choose_Weapon[2][Current_language]
        Cayo_Choose_Weapon[3] = Cayo_Choose_Weapon[3][Current_language]
        Cayo_Choose_Weapon[4] = Cayo_Choose_Weapon[4][Current_language]
        Cayo_Choose_Weapon[5] = Cayo_Choose_Weapon[5][Current_language]
-- Cayo Setup
    -- Auto
        Cayo_Instant_setup  = {"Instant Setup","Préparation Instant"}
        Cayo_Instant_setup  = Cayo_Instant_setup[Current_language]
        Cayo_Setup_Hardmode = {"Set heist into hard mode","Mettre le mode dur"}
        Cayo_Setup_Hardmode = Cayo_Setup_Hardmode[Current_language]
        Cayo_Setup_Maxing   = {"Max for (yourCut)","Max pour (ta part)"}
        Cayo_Setup_Maxing   = Cayo_Setup_Maxing[Current_language]..Arrow_right
    -- Manual
        Cayo_Setup_Target           = {"Primary Target","Cible Principale"}
        Cayo_Setup_Target           = Cayo_Setup_Target[Current_language]..Arrow_right
        Cayo_Setup_ChooseWeapon     = {"Choose Weapon*","Choisir Armes*"}
        Cayo_Setup_ChooseWeapon     = Cayo_Setup_ChooseWeapon[Current_language]..Arrow_right
        Cayo_Setup_Approach_Submenu = {"Approach Vehicle*","Vehicule d'approache*"}
        Cayo_Setup_Approach_Submenu = Cayo_Setup_Approach_Submenu[Current_language]..Arrow_right
        Cayo_Setup_Approach_Choose  = {"Choose at least one","Choisir Au moins un"}
        Cayo_Setup_Approach_Choose  = Half_Separator..Cayo_Setup_Approach_Choose[Current_language]..Separator_Text
        Refresh_Kosatka_Board       = {"Restart kosatka board","Redémarer le table du kosatka"}
        Refresh_Kosatka_Board       = Refresh_Kosatka_Board[Current_language]
    -- Disruption
        Cayo_Setup_MissionAndWeapons_Submenu             = {"Disruption And Weapons*","Armes et Pértubation"}
        Cayo_Setup_MissionAndWeapons_Submenu             = Cayo_Setup_MissionAndWeapons_Submenu[Current_language]
        Cayo_Setup_MissionAndWeapons_ChooseWeapon        = {"Choose Weapon","Choisir Arme"}
        Cayo_Setup_MissionAndWeapons_ChooseWeapon        = Cayo_Setup_MissionAndWeapons_ChooseWeapon[Current_language]..Arrow_right
        Cayo_Setup_MissionAndWeapons_PercetangeDestroyed = {"Quantity Destroyed","Quantité Détruite"}
        Cayo_Setup_MissionAndWeapons_PercetangeDestroyed = White_space..Cayo_Setup_MissionAndWeapons_PercetangeDestroyed[Current_language]
        Cayo_Setup_Submenu                               = {"Cayo Setup","Preparation de Cayo"}
        Cayo_Setup_Submenu                               = Cayo_Setup_Submenu[Current_language]
    -- POI Stuff
        Cayo_Point_of_interest_submenu              = {"Points of interests","Points d'interet"}
        Cayo_Point_of_interest_grappling_submenu    = {"Put Grappling Eq in/near","Grapin dans/a coté de"}
        Cayo_Point_of_interest_guardclothes_submenu = {"Put Guard Clothes in/near","Déguisement de guarde dans/a coté de"}
        Cayo_Point_of_interest_boltcutters_submenu  = {"Bolt Cutters in/near","Coupe-Grille dans/a coté de"}
        Cayo_Point_of_interest_submenu              = Cayo_Point_of_interest_submenu[Current_language]
        Cayo_Point_of_interest_grappling_submenu    = Cayo_Point_of_interest_grappling_submenu[Current_language].."..."
        Cayo_Point_of_interest_guardclothes_submenu = Cayo_Point_of_interest_guardclothes_submenu[Current_language].."..."
        Cayo_Point_of_interest_boltcutters_submenu  = Cayo_Point_of_interest_boltcutters_submenu[Current_language].."..."
        Cayo_Point_of_interest_supplytruck          = {"Supply truck in","Camion ravitailleur dans"}
        Cayo_Point_of_interest_scopeout             = {"ScopeOut POIs","Repérer les POIs"}
        Cayo_Point_of_interest_supplytruck          = Cayo_Point_of_interest_supplytruck[Current_language]
        Cayo_Point_of_interest_scopeout             = Cayo_Point_of_interest_scopeout[Current_language]
-- Cayo Set Loot
    Cayo_Setloot_Submenu = {"Set loot","Définir le loot"}
    Cayo_Setloot_Submenu = Cayo_Setloot_Submenu[Current_language]
    -- IN
        Cayo_Setloot_compound_in  = {"Inside Compound","L'interieur de la cour"}
        Cayo_Setloot_compound_in  = Arrow_down1..Cayo_Setloot_compound_in[Current_language]..Arrow_down2
        Cayo_Setloot_room         = {}
        Cayo_Setloot_room[1]      = {"Room 1 (North)","Piéce 1 (Nord)"}
        Cayo_Setloot_room[2]      = {"Room 2 (Center)","Piéce 2 (Centre)"}
        Cayo_Setloot_room[3]      = {"Room 3 (South)","Piéce 3 (Sud)"}
        Cayo_Setloot_basement     = {"Basement","Sous-Sol"}
        Cayo_Setloot_office       = {"Rubio's office","Bureau de Rubio"}
        Cayo_Setloot_room[1]      = Cayo_Setloot_room[1][Current_language]
        Cayo_Setloot_room[2]      = Cayo_Setloot_room[2][Current_language]
        Cayo_Setloot_room[3]      = Cayo_Setloot_room[3][Current_language]
        Cayo_Setloot_basement     = Cayo_Setloot_basement[Current_language]
        Cayo_Setloot_office       = Cayo_Setloot_office[Current_language]
    -- OUT
        Cayo_Setloot_Compound_out  = {"Outside Compound","L'extérieur de la cour"}
        Cayo_Setloot_Compound_out  = Arrow_down1..Cayo_Setloot_Compound_out[Current_language]..Arrow_down2
        Cayo_Setloot_Shed          = {"Shed","Barraque"}
        Cayo_Setloot_Shed2         = {"Shed 2","Barraque 2"}
        Cayo_Setloot_Lockup        = {"Lock up","Porte Vérouillée"}
        Cayo_Setloot_HangarTop     = {"Hangar Bottom","Bas du Hangar"}
        Cayo_Setloot_HangarBottom  = {"Hangar Top","Haut du Hangar"}
        Cayo_Setloot_Warehouse     = {"Warehouse","Entrepôt"}
        Cayo_Setloot_Shed          = Arrow_down1..Cayo_Setloot_Shed[Current_language]..Arrow_down2
        Cayo_Setloot_Shed2         = Arrow_down1..Cayo_Setloot_Shed2[Current_language]..Arrow_down2
        Cayo_Setloot_Lockup        = Arrow_down1..Cayo_Setloot_Lockup[Current_language]..Arrow_down2
        Cayo_Setloot_HangarTop     = Arrow_down1..Cayo_Setloot_HangarTop[Current_language]..Arrow_down2
        Cayo_Setloot_HangarBottom  = Arrow_down1..Cayo_Setloot_HangarBottom[Current_language]..Arrow_down2
        Cayo_Setloot_Warehouse     = Arrow_down1..Cayo_Setloot_Warehouse[Current_language]..Arrow_down2
-- Cayo Cut
    Cayo_Cut_Submenu = {"Cayo Cut","Pourcentage pour Cayo"}
    Cayo_Cut_Submenu = Cayo_Cut_Submenu[Current_language]
    Cayo_Cut_Pavel   = {"Remove Pavel's cut","Enlever La part dePavel"}
    Cayo_Cut_Pavel   = Cayo_Cut_Pavel[Current_language]
    Cayo_Fencing_Fee = {"Remove Fencing's fee","Enlever les Frais du porteur"}
    Cayo_Fencing_Fee = Cayo_Fencing_Fee[Current_language]
-- Cayo Extras
    Cayo_Extras_Sewer       = {"Cut Sewer Fence","Couper la grille des égôuts"}
    Cayo_Extras_Sewer       = Cayo_Extras_Sewer[Current_language]
    Cayo_Extras_Fingerprint = {"Clone Fingerprint","Cloner l'empreinte"}
    Cayo_Extras_Fingerprint = Cayo_Extras_Fingerprint[Current_language]
    Cayo_Extras_Cutglass    = {"Cut Glass","Couper le verre"}
    Cayo_Extras_Cutglass    = Cayo_Extras_Cutglass[Current_language]
    Cayo_Extras_Bag         = {"Bag Cap","Capacité du sac"}
    Cayo_Extras_Bag         = Cayo_Extras_Bag[Current_language]..Arrow_right
    Cayo_Cooldown_skip      = {}
    Cayo_Cooldown_skip[1]   = {" (1 Player)"," (1 Joueur)"}
    Cayo_Cooldown_skip[2]   = {" (2+ Player)"," (2+ Joueur)"}
    Cayo_Cooldown_skip[1]   = Cooldown_skip..Cayo_Cooldown_skip[1][Current_language]
    Cayo_Cooldown_skip[2]   = Cooldown_skip..Cayo_Cooldown_skip[2][Current_language]
----



-- Other Heists
-- Doomsday
    Doomsday_Submenu = {"Doomsday","Fin du monde"}
    Doomsday_Submenu = Doomsday_Submenu[Current_language]
    -- Lists and Variables
        Doomsday_Heist_prep_List = {}
        Doomsday_Heist_prep_List[00] = {"Paramedic Equipment","Equipement médical"}
        Doomsday_Heist_prep_List[01] = {"Deluxos","Deluxos"}
        Doomsday_Heist_prep_List[02] = {"Akula","Akula"}
        Doomsday_Heist_prep_List[03] = {"Key cards","Cartes d'accés"}
        Doomsday_Heist_prep_List[04] = {"ULP Intel","Information d'ULP"}
        Doomsday_Heist_prep_List[05] = {"Riot control van","Fourgon anit-émeute"}
        Doomsday_Heist_prep_List[06] = {"Stormbergs","Strombergs"}
        Doomsday_Heist_prep_List[07] = {"Torpedo ECH",""}
        Doomsday_Heist_prep_List[08] = {"Marked cash","Argent marqué"}
        Doomsday_Heist_prep_List[09] = {"Recon","Reconnaissance"}
        Doomsday_Heist_prep_List[10] = {"Chernobog","Chernobog"}
        Doomsday_Heist_prep_List[11] = {"Flight path","Chemin de vol"}
        Doomsday_Heist_prep_List[12] = {"Test site intel","Information sur le site de test"}
        Doomsday_Heist_prep_List[13] = {"Onboard computer","Ordinateur de bord"}
        Doomsday_Heist_prep_List[00] = Doomsday_Heist_prep_List[00][Current_language]
        Doomsday_Heist_prep_List[01] = Doomsday_Heist_prep_List[01][Current_language]
        Doomsday_Heist_prep_List[02] = Doomsday_Heist_prep_List[02][Current_language]
        Doomsday_Heist_prep_List[03] = Doomsday_Heist_prep_List[03][Current_language]
        Doomsday_Heist_prep_List[04] = Doomsday_Heist_prep_List[04][Current_language]
        Doomsday_Heist_prep_List[05] = Doomsday_Heist_prep_List[05][Current_language]
        Doomsday_Heist_prep_List[06] = Doomsday_Heist_prep_List[06][Current_language]
        Doomsday_Heist_prep_List[07] = Doomsday_Heist_prep_List[07][Current_language]
        Doomsday_Heist_prep_List[08] = Doomsday_Heist_prep_List[08][Current_language]
        Doomsday_Heist_prep_List[09] = Doomsday_Heist_prep_List[09][Current_language]
        Doomsday_Heist_prep_List[10] = Doomsday_Heist_prep_List[10][Current_language]
        Doomsday_Heist_prep_List[11] = Doomsday_Heist_prep_List[11][Current_language]
        Doomsday_Heist_prep_List[12] = Doomsday_Heist_prep_List[12][Current_language]
        Doomsday_Heist_prep_List[13] = Doomsday_Heist_prep_List[13][Current_language]
        Doomsday_Heist_missions_List = {}
        Doomsday_Heist_missions_List[00] = {"Dead Courier","Courier"}
        Doomsday_Heist_missions_List[01] = {"Signal Intercept","Interception du signal"}
        Doomsday_Heist_missions_List[02] = {"ServerFarm","Data-center"}
        Doomsday_Heist_missions_List[04] = {"Avenger","Avenger"}
        Doomsday_Heist_missions_List[05] = {"Rescue ULP","Sauver ULP"}
        Doomsday_Heist_missions_List[06] = {"Salvage Hard Drives","Recupérer les disque durs"}
        Doomsday_Heist_missions_List[07] = {"Submarine Recon","Reconnaissance du sousmarin"}
        Doomsday_Heist_missions_List[09] = {"Rescue Agent 14","Sauver Agent 14"}
        Doomsday_Heist_missions_List[10] = {"Rescue ULP","Sauver ULP"}
        Doomsday_Heist_missions_List[11] = {"Barrage","Barrage"}
        Doomsday_Heist_missions_List[12] = {"Khanjali","Khanjali"}
        Doomsday_Heist_missions_List[13] = {"Air Defences","Défense aérienne"}
        Doomsday_Heist_missions_List[00] = Doomsday_Heist_missions_List[00][Current_language]
        Doomsday_Heist_missions_List[01] = Doomsday_Heist_missions_List[01][Current_language]
        Doomsday_Heist_missions_List[02] = Doomsday_Heist_missions_List[02][Current_language]
        Doomsday_Heist_missions_List[04] = Doomsday_Heist_missions_List[04][Current_language]
        Doomsday_Heist_missions_List[05] = Doomsday_Heist_missions_List[05][Current_language]
        Doomsday_Heist_missions_List[06] = Doomsday_Heist_missions_List[06][Current_language]
        Doomsday_Heist_missions_List[07] = Doomsday_Heist_missions_List[07][Current_language]
        Doomsday_Heist_missions_List[09] = Doomsday_Heist_missions_List[09][Current_language]
        Doomsday_Heist_missions_List[10] = Doomsday_Heist_missions_List[10][Current_language]
        Doomsday_Heist_missions_List[11] = Doomsday_Heist_missions_List[11][Current_language]
        Doomsday_Heist_missions_List[12] = Doomsday_Heist_missions_List[12][Current_language]
        Doomsday_Heist_missions_List[13] = Doomsday_Heist_missions_List[13][Current_language]
        Doomsday_Heist_List = {}
        Doomsday_Heist_List[01] = {"Data Breaches","Bréche de donées"}
        Doomsday_Heist_List[02] = {"Bogdan Problem","Codename: Bogdan"}
        Doomsday_Heist_List[03] = {"Doomsday Scenario","Scénario de la fin du monde"}
        Doomsday_Heist_List[01] = Doomsday_Heist_List[01][Current_language]
        Doomsday_Heist_List[02] = Doomsday_Heist_List[02][Current_language]
        Doomsday_Heist_List[03] = Doomsday_Heist_List[03][Current_language]
        Doomsday_Missions_status = {}
        Doomsday_Missions_status[00] = {"Incomplete","Incompléte"}
        Doomsday_Missions_status[01] = {"Completed","Faite"}
        Doomsday_Missions_status[02] = {"Stolen","Volée"}
        Doomsday_Missions_status[03] = {"Skipped","Pasée"}
        Doomsday_Missions_status[00] = Doomsday_Missions_status[00][Current_language]
        Doomsday_Missions_status[01] = Doomsday_Missions_status[01][Current_language]
        Doomsday_Missions_status[02] = Doomsday_Missions_status[02][Current_language]
        Doomsday_Missions_status[03] = Doomsday_Missions_status[03][Current_language]
    -- Doomsday Setup
        Doomsday_Setup_Submenu = {"Doomsday setup","Préparation de fin du monde"}
        Doomsday_Setup_Submenu = Doomsday_Setup_Submenu[Current_language]
        Doomsday_Set_act       = {"Set dommsday act","Définir l'acte"}
        Doomsday_Set_act       = Doomsday_Set_act[Current_language]
        Doomsday_Instant_setup = {"Setup doomsday","Préparer fin du monde"}
        Doomsday_Instant_setup = Doomsday_Instant_setup[Current_language]
        Doomsday_Act_Name      = {"Act","Acte"}
        Doomsday_Act_Name      = Doomsday_Act_Name[Current_language]
        Doomsday_Prep          = {"Prep","Prép"}
        Doomsday_Prep          = Doomsday_Prep[Current_language]..Arrow_right
        Doomsday_Setup         = {"Status of ","Status de "}
        Doomsday_Setup         = White_space..Doomsday_Setup[Current_language]
    -- Doomsday Cuts
        Doomsday_Cuts_Submenu  = {"Doomsday cuts","Pourcentage pour fin du monde"}
        Doomsday_Cuts_Submenu  = Doomsday_Cuts_Submenu[Current_language]
-- Appartement
    Appartements_Submenu = {"Appartement","Appartements"}
    Appartements_Submenu = Appartements_Submenu[Current_language]
    -- Lists and Variables
        Appartements_Fleeca_preps      = {}
        Appartements_Prison_preps      = {}
        Appartements_Humane_preps      = {}
        Appartements_SeriesA_preps     = {}
        Appartements_Pacific_preps     = {}
        ---- Fleeca
            Appartements_Fleeca_preps[1]   = {"Scope out","Repérage"}
            Appartements_Fleeca_preps[2]   = {"Kuruma","Kuruma"}
            Appartements_Fleeca_preps[1]   = Appartements_Fleeca_preps[1][Current_language]
            Appartements_Fleeca_preps[2]   = Appartements_Fleeca_preps[2][Current_language]
        ---- Prison Break
            Appartements_Prison_preps[1]   = {"Plane","Avion"}
            Appartements_Prison_preps[2]   = {"Bus","Bus"}
            Appartements_Prison_preps[3]   = {"Station","Staion"}
            Appartements_Prison_preps[4]   = {"Wet work","Sale boulot"}
            Appartements_Prison_preps[1]   = Appartements_Prison_preps[1][Current_language]
            Appartements_Prison_preps[2]   = Appartements_Prison_preps[2][Current_language]
            Appartements_Prison_preps[3]   = Appartements_Prison_preps[3][Current_language]
            Appartements_Prison_preps[4]   = Appartements_Prison_preps[4][Current_language]
        ---- Humane labs
            Appartements_Humane_preps[1]   = {"Key codes","Codes d'accées"}
            Appartements_Humane_preps[2]   = {"Insurgents","Insurgents"}
            Appartements_Humane_preps[3]   = {"EMP","IEM"}
            Appartements_Humane_preps[4]   = {"Valkyrie","Valkyrie"}
            Appartements_Humane_preps[5]   = {"Deliver EMP","Livrer l'IEM"}
            Appartements_Humane_preps[1]   = Appartements_Humane_preps[1][Current_language]
            Appartements_Humane_preps[2]   = Appartements_Humane_preps[2][Current_language]
            Appartements_Humane_preps[3]   = Appartements_Humane_preps[3][Current_language]
            Appartements_Humane_preps[4]   = Appartements_Humane_preps[4][Current_language]
            Appartements_Humane_preps[5]   = Appartements_Humane_preps[5][Current_language]
        ---- Series A
            Appartements_SeriesA_preps[1]  = {"Coke","Cocaîne"}
            Appartements_SeriesA_preps[2]  = {"Trash truck","Poubelle"}
            Appartements_SeriesA_preps[3]  = {"Bikers","Motards"}
            Appartements_SeriesA_preps[4]  = {"Weed","Weed"}
            Appartements_SeriesA_preps[5]  = {"Steal meth","Voler la méth"}
            Appartements_SeriesA_preps[1]  = Appartements_SeriesA_preps[1][Current_language]
            Appartements_SeriesA_preps[2]  = Appartements_SeriesA_preps[2][Current_language]
            Appartements_SeriesA_preps[3]  = Appartements_SeriesA_preps[3][Current_language]
            Appartements_SeriesA_preps[4]  = Appartements_SeriesA_preps[4][Current_language]
            Appartements_SeriesA_preps[5]  = Appartements_SeriesA_preps[5][Current_language]
        ---- Pacific Standard
            Appartements_SeriesA_preps[1]  = {"Vans","Vans"}
            Appartements_SeriesA_preps[2]  = {"Signal","Signal"}
            Appartements_SeriesA_preps[3]  = {"Hack","Hack"}
            Appartements_SeriesA_preps[4]  = {"Convoy","Convoi"}
            Appartements_SeriesA_preps[5]  = {"Bikes","Motos"}
            Appartements_Pacific_preps[1]  = Appartements_SeriesA_preps[1][Current_language]
            Appartements_Pacific_preps[2]  = Appartements_SeriesA_preps[2][Current_language]
            Appartements_Pacific_preps[3]  = Appartements_SeriesA_preps[3][Current_language]
            Appartements_Pacific_preps[4]  = Appartements_SeriesA_preps[4][Current_language]
            Appartements_Pacific_preps[5]  = Appartements_SeriesA_preps[5][Current_language]
    -- Setup
        Appartements_Setup_menu_Submenu = {"Appartements Setup","Préparation pour appartements"}
        Appartements_Setup_menu_Submenu = Appartements_Setup_menu_Submenu[Current_language]
    -- Cuts
        Appartements_Cut_Submenu = {"Appartements Cuts","Pourcentage des appartements"}
        Appartements_Cut_Submenu = Appartements_Cut_Submenu[Current_language]
    -- Extras
        Appartements_Fleeca_drill_bypass = {"Bypass Fleeca Drill","Passer le percage"}
        Appartements_Fleeca_drill_bypass = Appartements_Fleeca_drill_bypass[Current_language]
        Appartements_Fleeca_heist_bypass = {"Bypass Fleeca Hack","Passer le hack"}
        Appartements_Fleeca_heist_bypass = Appartements_Fleeca_heist_bypass[Current_language]
-- Autoshop
    Other_Submenu          = {"Other","Autre"}
    Other_Submenu          = Other_Submenu[Current_language]
    Current_Heist_Selected = {"Current Heist"}
    Current_Heist_Selected = Current_Heist_Selected[Current_language]
    Skip_Preperation = {"Skip preperation","Passer les preparation"}
    Skip_Preperation = Skip_Preperation[Current_language]
----



-- Presets
Presets_Submenu = {"Preset editor","Editeur de presets"}
Presets_Submenu = Presets_Submenu[Current_language]
-- Common
    Presets_Common_utility = {"Utility","Utilitaire"}
    Presets_Common_utility = Arrow_down1..Presets_Common_utility[Current_language]..Arrow_down2
    Presets_Common_preset  = {"Preset","Preset"}
    Presets_Common_preset  = Presets_Common_preset[Current_language]
    Presets_Common_presets = {"Presets","Presets"}
    Presets_Common_presets = Arrow_down1..Presets_Common_presets[Current_language]..Arrow_down2
    Presets_Common_create  = {"Create new preset","Creer un preset"}
    Presets_Common_create  = Presets_Common_create[Current_language]
    Presets_Common_delete  = {"Delete Preset","Supprimer un preset"}
    Presets_Common_delete  = Presets_Common_delete[Current_language]
    Presets_Common_edit    = {"Edit Name","Modifier le nom"}
    Presets_Common_edit    = Presets_Common_edit[Current_language]
    Presets_Common_save    = {"Save","Sauveguarder"}
    Presets_Common_save    = Presets_Common_save[Current_language]
-- Casino
    Presets_Casino_approach = {"Approach","Approche"}
    Presets_Casino_approach = Presets_Casino_approach[Current_language]
    Presets_Casino_mode     = {"Mode","Mode"}
    Presets_Casino_mode     = Presets_Casino_mode[Current_language]
    Presets_Casino_target   = {"Target","Cible"}
    Presets_Casino_target   = Presets_Casino_target[Current_language]
----



-- Shapeshift
Shapeshift_Submenu = {"Shapeshift","Changeur d'apparence"}
Shapeshift_Submenu = Shapeshift_Submenu[Current_language]
-- Text
    Miscellaneous_Text         = {"Miscellaneous","Divers"}
    Miscellaneous_options      = {"Misc options","Options diverse"}
    Shapeshift_Normal_option   = {"Normal","Normal"}
    Shapeshift_Law_option      = {"Cops","Policier"}
    Shapeshift_Cutscene_option = {"Cutscene","Cinématique"}
    Miscellaneous_Text         = White_space..Miscellaneous_Text[Current_language]
    Miscellaneous_options      = White_space.."-  "..Miscellaneous_options[Current_language]
    Shapeshift_Normal_option   = White_space.."-  "..Shapeshift_Normal_option[Current_language]
    Shapeshift_Law_option      = White_space.."-  "..Shapeshift_Law_option[Current_language]
    Shapeshift_Cutscene_option = White_space.."-  "..Shapeshift_Cutscene_option[Current_language]
-- Options
    Shapeshift_Tiny_option             = {"Tiny Player","Petit joueur"}
    Shapeshift_Gender_option           = {"Allow Gender Change","Possibilite de changer de genre"}
    Shapeshift_Multiplayer_option      = {"Turn Back Into","Retourner en"}
    Shapeshift_Animal_option           = {"Animals","Animaux"}
    Shapeshift_Female_character_option = {"Female Ped","Femme"}
    Shapeshift_Male_character_option   = {"Male Ped","Homme"}
    Shapeshift_Special_option          = {"Special","Special"}
    Shapeshift_Tiny_option             = Shapeshift_Tiny_option[Current_language]
    Shapeshift_Gender_option           = Shapeshift_Gender_option[Current_language]
    Shapeshift_Multiplayer_option      = Shapeshift_Multiplayer_option[Current_language]..Arrow_right
    Shapeshift_Animal_option           = Shapeshift_Animal_option[Current_language]..Arrow_right
    Shapeshift_Female_character_option = Shapeshift_Female_character_option[Current_language]..Arrow_right
    Shapeshift_Male_character_option   = Shapeshift_Male_character_option[Current_language]..Arrow_right
    Shapeshift_Special_option          = Shapeshift_Special_option[Current_language]..Arrow_right
----



-- Main
Menu_Submenu     = {"Main menu","Menu principal"}
Menu_Submenu     = Menu_Submenu[Current_language]
-- List and Variables
    units_Text    = {}
    units_Text[1] = {"kilometres per hour","Kilométres par heures"}
    units_Text[2] = {"metres per second","métres par secondes"}
    units_Text[3] = {"miles per hour","miles par heures"}
    units_Text[4] = {"feet per second","pieds par secondes"}
    units_Text[1] = units_Text[1][Current_language]
    units_Text[2] = units_Text[2][Current_language]
    units_Text[3] = units_Text[3][Current_language]
    units_Text[4] = units_Text[4][Current_language]
    Gender        = {}
    Gender[1]     = {"Male","Homme"}
    Gender[2]     = {"Female","Femme"}
    Gender[1]     = Gender[1][Current_language]
    Gender[2]     = Gender[2][Current_language]
    Achivement_List = {}
        Achivement_List[01] =  {"Welcome to Los Santos"       ,"Bienvenue à Los Santos"}
        Achivement_List[02] =  {"A Friendship Resurrected"    ,"Amitié ressuscitée"}
        Achivement_List[03] =  {"A Fair Day's Pay"            ,"Salaire honnête"}
        Achivement_List[04] =  {"The Moment of Truth"         ,"Moment de vérité"}
        Achivement_List[05] =  {"To Live or Die in Los Santos","Vivre ou mourir à Los Santos"}
        Achivement_List[06] =  {"Diamond Hard"                ,"Dur comme le diamant"}
        Achivement_List[07] =  {"Subversive"                  ,"Subversion"}
        Achivement_List[08] =  {"Blitzed"                     ,"Rentre-dedans"}
        Achivement_List[09] =  {"Small Town, Big Job"         ,"Trouble-fête"}
        Achivement_List[10] =  {"The Government Gimps"        ,"Larbins du gouvernement"}
        Achivement_List[11] =  {"The Big One!"                ,"Le coup du siècle"}
        Achivement_List[12] =  {"Solid Gold, Baby!"           ,"Cousu d'or"}
        Achivement_List[13] =  {"Career Criminal"             ,"Criminel de carrière"}
        Achivement_List[14] =  {"San Andreas Sightseer"       ,"Visite (pas) guidée"}
        Achivement_List[15] =  {"All's Fare in Love and War"  ,"Résultat des courses"}
        Achivement_List[16] =  {"TP Industries Arms Race"     ,"Armé jusqu'aux dents"}
        Achivement_List[17] =  {"Multi-Disciplined"           ,"Touche-à-tout"}
        Achivement_List[18] =  {"From Beyond the Stars"       ,"Aux 50 coins de la galaxie"}
        Achivement_List[19] =  {"A Mystery, Solved"           ,"Affaire classée"}
        Achivement_List[20] =  {"Waste Management"            ,"Gestion des déchets"}
        Achivement_List[21] =  {"Red Mist"                    ,"Folie furieuse"}
        Achivement_List[22] =  {"Show Off"                    ,"Frimeur"}
        Achivement_List[23] =  {"Kifflom!"                    ,"Kifflom!"}
        Achivement_List[24] =  {"Three Man Army"              ,"Trio de choc"}
        Achivement_List[25] =  {"Out of Your Depth"           ,"Hors de la zone de baignade"}
        Achivement_List[26] =  {"Altruist Acolyte"       	  ,"Acolyte des Altruistes"}
        Achivement_List[27] =  {"A Lot of Cheddar"       	  ,"Panier percé"}
        Achivement_List[28] =  {"Trading Pure Alpha"     	  ,"Homme d'actions"}
        Achivement_List[29] =  {"Pimp My Sidearm"        	  ,"Tuning d'arme"}
        Achivement_List[30] =  {"Wanted: Alive Or Alive" 	  ,"Recherché vif ou vif"}
        Achivement_List[31] =  {"Los Santos Customs"     	  ,"Los Santos Customs"}
        Achivement_List[32] =  {"Close Shave"            	  ,"Haute voltige"}
        Achivement_List[33] =  {"Off the Plane"          	  ,"Premiers pas"}
        Achivement_List[34] =  {"Three-Bit Gangster"     	  ,"Gangster en herbe"}
        Achivement_List[35] =  {"Making Moves"           	  ,"En progrès"}
        Achivement_List[36] =  {"Above the Law"          	  ,"Au-dessus des lois"}
        Achivement_List[37] =  {"Numero Uno"             	  ,"Numero uno"}
        Achivement_List[38] =  {"The Midnight Club"      	  ,"Midnight Club LS"}
        Achivement_List[39] =  {"Unnatural Selection"    	  ,"La loi du plus fort"}
        Achivement_List[40] =  {"Backseat Driver"        	  ,"Coopération victorieuse"}
        Achivement_List[41] =  {"Run Like The Wind"      	  ,"Chasse à l'homme"}
        Achivement_List[42] =  {"Clean Sweep"            	  ,"Table rase"}
        Achivement_List[43] =  {"Decorated"              	  ,"Champion en ligne"}
        Achivement_List[44] =  {"Stick Up Kid"           	  ,"Expert cambrioleur"}
        Achivement_List[45] =  {"Enjoy Your Stay"        	  ,"Bon séjour !"}
        Achivement_List[46] =  {"Crew Cut"               	  ,"Gagner sa crewte"}
        Achivement_List[47] =  {"Full Refund"            	  ,"Vengeance"}
        Achivement_List[48] =  {"Dialling Digits"        	  ,"3615 à l'aide"}
        Achivement_List[49] =  {"American Dream"         	  ,"Le rêve américain"}
        Achivement_List[50] =  {"A New Perspective"      	  ,"Un point de vue différent"}
        Achivement_List[51] =  {"Be Prepared"            	  ,"Préparateur"}
        Achivement_List[52] =  {"In the Name of Science" 	  ,"Pour la science"}
        Achivement_List[53] =  {"Dead Presidents"        	  ,"Retrait en liquide"}
        Achivement_List[54] =  {"Parole Day"             	  ,"Liberté inconditionnelle"}
        Achivement_List[55] =  {"Shot Caller"            	  ,"Placement à risque"}
        Achivement_List[56] =  {"Four Way"               	  ,"Équité totale"}
        Achivement_List[57] =  {"Live a Little"          	  ,"On ne vit qu'une fois"}
        Achivement_List[58] =  {"Can't Touch This"       	  ,"Intouchable"}
        Achivement_List[59] =  {"Mastermind"             	  ,"Génie du crime"}
        Achivement_List[60] =  {"Vinewood Visionary"     	  ,"Visionnaire de Vinewood"}
        Achivement_List[61] =  {"Majestic"               	  ,"Réalisateur prolifique"}
        Achivement_List[62] =  {"Humans of Los Santos"   	  ,"Les cassos de Los Santos"}
        Achivement_List[63] =  {"First Time Director"    	  ,"Jeune premier"}
        Achivement_List[64] =  {"Animal Lover"           	  ,"La bête m'habite"}
        Achivement_List[65] =  {"Ensemble Piece"         	  ,"Film choral"}
        Achivement_List[66] =  {"Cult Movie"             	  ,"Film (de) culte"}
        Achivement_List[67] =  {"Location Scout"         	  ,"Changement de décor"}
        Achivement_List[68] =  {"Method Actor"           	  ,"Un rôle sur mesure"}
        Achivement_List[69] =  {"Cryptozoologist"        	  ,"Cryptozoologue"}
        Achivement_List[70] =  {"Getting Started"        	  ,"On se prépare"}
        Achivement_List[71] =  {"The Data Breaches"      	  ,"Fuites de données"}
        Achivement_List[72] =  {"The Bogdan Problem"     	  ,"Nom de code : Bogdan"}
        Achivement_List[73] =  {"The Doomsday Scenario"  	  ,"Un scénario de fin du monde"}
        Achivement_List[74] =  {"A World Worth Saving"   	  ,"Un monde qui mérite d'être sauvé"}
        Achivement_List[75] =  {"Orbital Obliteration"   	  ,"Atomisation orbitale"}
        Achivement_List[76] =  {"Elitist"                	  ,"Élitiste"}
        Achivement_List[77] =  {"Masterminds"            	  ,"Génies du crime"}
        Achivement_List[01] = Achivement_List[01][Current_language]
        Achivement_List[02] = Achivement_List[02][Current_language]
        Achivement_List[03] = Achivement_List[03][Current_language]
        Achivement_List[04] = Achivement_List[04][Current_language]
        Achivement_List[05] = Achivement_List[05][Current_language]
        Achivement_List[06] = Achivement_List[06][Current_language]
        Achivement_List[07] = Achivement_List[07][Current_language]
        Achivement_List[08] = Achivement_List[08][Current_language]
        Achivement_List[09] = Achivement_List[09][Current_language]
        Achivement_List[10] = Achivement_List[10][Current_language]
        Achivement_List[11] = Achivement_List[11][Current_language]
        Achivement_List[12] = Achivement_List[12][Current_language]
        Achivement_List[13] = Achivement_List[13][Current_language]
        Achivement_List[14] = Achivement_List[14][Current_language]
        Achivement_List[15] = Achivement_List[15][Current_language]
        Achivement_List[16] = Achivement_List[16][Current_language]
        Achivement_List[17] = Achivement_List[17][Current_language]
        Achivement_List[18] = Achivement_List[18][Current_language]
        Achivement_List[19] = Achivement_List[19][Current_language]
        Achivement_List[20] = Achivement_List[20][Current_language]
        Achivement_List[21] = Achivement_List[21][Current_language]
        Achivement_List[22] = Achivement_List[22][Current_language]
        Achivement_List[23] = Achivement_List[23][Current_language]
        Achivement_List[24] = Achivement_List[24][Current_language]
        Achivement_List[25] = Achivement_List[25][Current_language]
        Achivement_List[26] = Achivement_List[26][Current_language]
        Achivement_List[27] = Achivement_List[27][Current_language]
        Achivement_List[28] = Achivement_List[28][Current_language]
        Achivement_List[29] = Achivement_List[29][Current_language]
        Achivement_List[30] = Achivement_List[30][Current_language]
        Achivement_List[31] = Achivement_List[31][Current_language]
        Achivement_List[32] = Achivement_List[32][Current_language]
        Achivement_List[33] = Achivement_List[33][Current_language]
        Achivement_List[34] = Achivement_List[34][Current_language]
        Achivement_List[35] = Achivement_List[35][Current_language]
        Achivement_List[36] = Achivement_List[36][Current_language]
        Achivement_List[37] = Achivement_List[37][Current_language]
        Achivement_List[38] = Achivement_List[38][Current_language]
        Achivement_List[39] = Achivement_List[39][Current_language]
        Achivement_List[40] = Achivement_List[40][Current_language]
        Achivement_List[41] = Achivement_List[41][Current_language]
        Achivement_List[42] = Achivement_List[42][Current_language]
        Achivement_List[43] = Achivement_List[43][Current_language]
        Achivement_List[44] = Achivement_List[44][Current_language]
        Achivement_List[45] = Achivement_List[45][Current_language]
        Achivement_List[46] = Achivement_List[46][Current_language]
        Achivement_List[47] = Achivement_List[47][Current_language]
        Achivement_List[48] = Achivement_List[48][Current_language]
        Achivement_List[49] = Achivement_List[49][Current_language]
        Achivement_List[50] = Achivement_List[50][Current_language]
        Achivement_List[51] = Achivement_List[51][Current_language]
        Achivement_List[52] = Achivement_List[52][Current_language]
        Achivement_List[53] = Achivement_List[53][Current_language]
        Achivement_List[54] = Achivement_List[54][Current_language]
        Achivement_List[55] = Achivement_List[55][Current_language]
        Achivement_List[56] = Achivement_List[56][Current_language]
        Achivement_List[57] = Achivement_List[57][Current_language]
        Achivement_List[58] = Achivement_List[58][Current_language]
        Achivement_List[59] = Achivement_List[59][Current_language]
        Achivement_List[60] = Achivement_List[60][Current_language]
        Achivement_List[61] = Achivement_List[61][Current_language]
        Achivement_List[62] = Achivement_List[62][Current_language]
        Achivement_List[63] = Achivement_List[63][Current_language]
        Achivement_List[64] = Achivement_List[64][Current_language]
        Achivement_List[65] = Achivement_List[65][Current_language]
        Achivement_List[66] = Achivement_List[66][Current_language]
        Achivement_List[67] = Achivement_List[67][Current_language]
        Achivement_List[68] = Achivement_List[68][Current_language]
        Achivement_List[69] = Achivement_List[69][Current_language]
        Achivement_List[70] = Achivement_List[70][Current_language]
        Achivement_List[71] = Achivement_List[71][Current_language]
        Achivement_List[72] = Achivement_List[72][Current_language]
        Achivement_List[73] = Achivement_List[73][Current_language]
        Achivement_List[74] = Achivement_List[74][Current_language]
        Achivement_List[75] = Achivement_List[75][Current_language]
        Achivement_List[76] = Achivement_List[76][Current_language]
        Achivement_List[77] = Achivement_List[77][Current_language]
-- Settings
    Settings_Menu_Language        = {"Language","Langue"}
    Settings_Language             = Settings_Menu_Language[Current_language]
    Settings_Reload               = {"Reload Menu after changes","Recharger le menu aprés changements"}
    Settings_Reload               = Settings_Reload[Current_language]
    Settings_Binds_Submenu        = {"See/Modify bindings","Voir/Modifier les raccourcis"}
    Settings_Binds_Submenu        = Settings_Binds_Submenu[Current_language]
    Settings_Shapeshift_gender    = {"Default gender for character","Genre du personnage par default"}
    Settings_Shapeshift_gender    = Settings_Shapeshift_gender[Current_language]
    Settings_Removed_cars_default = {"Activate removed cars by default?","Activer les voitures enlever par default"}
    Settings_Removed_cars_default = Settings_Removed_cars_default[Current_language]
    Boost_button_key              = {"Boost key","Bouton de Boost"}
    Boost_button_key              = Boost_button_key[Current_language]
    Settings_Boost_button_default = {"Enable boost button by default?","Activer le Bouton de Boost"}
    Settings_Boost_button_default = Settings_Boost_button_default[Current_language]
    Inventory_refill_Key          = {"Refill Inventory","Remplir l'inventaire"}
    Inventory_refill_Key          = Inventory_refill_Key[Current_language]
    -- Numberplates
        Settings_Numberplates_enable = {"Show speedometer on numberplates","Activer la vitesse sur les plaques"}
        Settings_Numberplates_enable = Settings_Numberplates_enable[Current_language]
        Settings_Numberplates_unit   = {"Speedometer unit","Unité de vitesse"}
        Settings_Numberplates_unit   = Settings_Numberplates_unit[Current_language]
        Settings_Numberplates_Binds  = {"Quick setup","Assignement rapide"}
        Settings_Numberplates_Binds  = Settings_Numberplates_Binds[Current_language]
        Settings_Numberplates_custom = {"Custom numberplates by default?","Plasques customs par default?"}
        Settings_Numberplates_custom = Settings_Numberplates_custom[Current_language]
    -- Menu thigies
        Menu_Bindings        = {"Menu","Menu"}
        Menu_Bindings        = Menu_Bindings[Current_language]
        Menu_Bindings_toggle = {"Show/Hide","Montrer/Cahcer"}
        Menu_Bindings_select = {"Select"   ,"Selectioner"}
        Menu_Bindings_back   = {"Back"     ,"Retour"}
        Menu_Bindings_up     = {"Up"       ,"Haut"}
        Menu_Bindings_down   = {"Down"     ,"Bas"}
        Menu_Bindings_right  = {"Right"    ,"Droite"}
        Menu_Bindings_left   = {"Left"     ,"Gauche"}
        Menu_Bindings_toggle = Menu_Bindings_toggle[Current_language]
        Menu_Bindings_select = Menu_Bindings_select[Current_language]
        Menu_Bindings_back   = Menu_Bindings_back[Current_language]
        Menu_Bindings_up     = Menu_Bindings_up[Current_language]
        Menu_Bindings_down   = Menu_Bindings_down[Current_language]
        Menu_Bindings_right  = Menu_Bindings_right[Current_language]
        Menu_Bindings_left   = Menu_Bindings_left[Current_language]
-- Main menu
    -- Movement
        Noclip_Mouvement_forward        = {"Fowards","Avancer"}
        Noclip_Mouvement_backward       = {"Backwards","Desactiver"}
        Noclip_Mouvement_left           = {"Left","Gauche"}
        Noclip_Mouvement_right          = {"Right","Droite"}
        Noclip_Mouvement_turn_left      = {"Turn left","Tourner a gauche"}
        Noclip_Mouvement_turn_right     = {"Turn right","Tourner a droite"}
        Noclip_Mouvement_increase_speed = {"Increase speed","Augmenter la vitesse"}
        Noclip_Mouvement_decrease_speed = {"Decrease speed","Diminuer la vitesse"}
        Noclip_Mouvement_up             = {"Up","Monter"}
        Noclip_Mouvement_down           = {"Down","Descendre"}
        Noclip_Mouvement_forward        = Noclip_Mouvement_forward[Current_language]
        Noclip_Mouvement_backward       = Noclip_Mouvement_backward[Current_language]
        Noclip_Mouvement_left           = Noclip_Mouvement_left[Current_language]
        Noclip_Mouvement_right          = Noclip_Mouvement_right[Current_language]
        Noclip_Mouvement_turn_left      = Noclip_Mouvement_turn_left[Current_language]
        Noclip_Mouvement_turn_right     = Noclip_Mouvement_turn_right[Current_language]
        Noclip_Mouvement_increase_speed = Noclip_Mouvement_increase_speed[Current_language]
        Noclip_Mouvement_decrease_speed = Noclip_Mouvement_decrease_speed[Current_language]
        Noclip_Mouvement_up             = Noclip_Mouvement_up[Current_language]
        Noclip_Mouvement_down           = Noclip_Mouvement_down[Current_language]
    -- Noclip
        Noclip_Submenu    = {"Noclip","Noclip"}
        Noclip_Submenu    = Noclip_Submenu[Current_language]
        Noclip_Speed_Menu = {"Noclip Speed","Vitesse du noclip"}
        Noclip_Speed_Menu = White_space..Noclip_Speed_Menu[Current_language]
        Noclip_Toggle     = {"Toggle","Activer/Désactiver"}
        Noclip_Toggle     = Noclip_Toggle[Current_language]
    -- Numberplates / Speedometer
        -- Speedometer
            Numberplate_Submenu               = {"Numberplates / Speedometer","Compteur de vitesse / Plaques"}
            Numberplate_Submenu               = Numberplate_Submenu[Current_language]
            Menu_Speedometer_Bindings         = {"Speedometer","Compteur de vitesse"}
            Menu_Speedometer_Bindings         = Menu_Speedometer_Bindings[Current_language]
            Menu_Numberplates_speed           = {"Speed","Vitesse"}
            Menu_Numberplates_speed           = White_space..Menu_Numberplates_speed[Current_language]..": "
            Menu_Numberplates_not_in_vehicle  = {"Not in vehicle","Pas dans un vehicule"}
            Menu_Numberplates_not_in_vehicle  = Menu_Numberplates_not_in_vehicle[Current_language]
            Menu_Numberplates_invalid_vehicle = {"Invalid vehicle","Vehicule invalide"}
            Menu_Numberplates_invalid_vehicle = Menu_Numberplates_invalid_vehicle[Current_language]
        -- Numberplates
            Numberplate_Custom_manage     = {"Manage custom plates","Gerer les plaques customs"}
            Numberplate_Custom_manage     = Numberplate_Custom_manage[Current_language]
            Numberplate_Custom_Delete     = {"Delete","Suprimer"}
            Numberplate_Custom_Delete     = Numberplate_Custom_Delete[Current_language]
            Numberplate_Custom_Apply      = {"Apply","Appliquer"}
            Numberplate_Custom_Apply      = Numberplate_Custom_Apply[Current_language]
            Numberplate_Custom_Choose     = {"Choose this plate as default","Mettre cette plaque en default"}
            Numberplate_Custom_Choose     = Numberplate_Custom_Choose[Current_language]
            Numberplate_Custom_preview    = {"Preview","Apercu"}
            Numberplate_Custom_preview    = Arrow_down1..Numberplate_Custom_preview[Current_language]..Arrow_down2
            Numberplate_Custom_character  = {"Character n°","Charactere n°"}
            Numberplate_Custom_character  = Numberplate_Custom_character[Current_language]
            Numberplate_Custom_save_plate = {"Save","Sauvegarder"}
            Numberplate_Custom_save_plate = Numberplate_Custom_save_plate[Current_language]
            Numberplate_Custom_toggle     = {"Activate custom plates","Activer les plaques customs"}
            Numberplate_Custom_toggle     = Numberplate_Custom_toggle[Current_language]
    -- Other's cool ppl script (modified)
        colorStyles    = {}
        colorStyles[1] = {"Rainbow","Arc-en-ciel"}
        colorStyles[2] = {"Strobelight","Clignotement"}
        colorStyles[3] = {"Random","Aléatiore"}
        colorStyles[1] = colorStyles[1][Current_language]
        colorStyles[2] = colorStyles[2][Current_language]
        colorStyles[3] = colorStyles[3][Current_language]
        -- Boost Go Brrrrr
            Boost_button_Submenu = {"Boost menu","Boost de voiture (NOS)"}
            Boost_button_Submenu = Boost_button_Submenu[Current_language]
            Boost_Toggle         = {"Boost on press?","Booster avec une touche?"}
            Boost_Toggle         = Boost_Toggle[Current_language]
            Boost_Strength       = {"Car Boost strength","Force du Boost"}
            Boost_Strength       = Boost_Strength[Current_language]
        -- Gay Car
            Gay_car_Submenu    = {"Rainbow menu (You Only)","Couleur Voiture Custom (Seul Toi)"}
            Gay_car_Submenu    = Gay_car_Submenu[Current_language]
            Gay_car_Toggle     = {"Activate Rainbow Car","Activer les effets"}
            Gay_car_Toggle     = Gay_car_Toggle[Current_language]
            Gay_car_Style      = {"Style","Style"}
            Gay_car_Style      = Gay_car_Style[Current_language]..Arrow_right
            Gay_car_Uniform    = {"Uniform color","Couleur uniforme"}
            Gay_car_Uniform    = Gay_car_Uniform[Current_language]
            Gay_car_Traffic    = {"Affect traffic","Affecter le traffic"}
            Gay_car_Traffic    = Gay_car_Traffic[Current_language]
            Gay_car_Multiplier = {"Rainbow Speed Multiplier","Multiplicateur de vitesse"}
            Gay_car_Multiplier = Gay_car_Multiplier[Current_language]
    -- Other
        Menu_NoScratch                    = {"No scratch","Pas d'égratinure"}
        Menu_NoScratch                    = Menu_NoScratch[Current_language]
        Menu_Disable_autostop             = {"Disable engine auto stop","Désactivez l'arret auto du moteur"}
        Menu_Disable_autostop             = Menu_Disable_autostop[Current_language]
        Menu_LSC_Reset                    = {"Reset LSC vehicle sell limit","Reinitialisez la limite de vente pour LSC"}
        Menu_LSC_Reset                    = Menu_LSC_Reset[Current_language]
        Menu_Casino_Bypass                = {"Bypass Casino Limits","Depasser la limite du Casino"}
        Menu_Casino_Bypass                = Menu_Casino_Bypass[Current_language]
        Menu_Enhanced_online              = {"Enhanced online services","Services en ligne augmenté"}
        Menu_Enhanced_online              = Half_Separator..Menu_Enhanced_online[Current_language]..Separator_Text
        Menu_RemovedCars_toggle           = {"Activate removed cars","Activer les voitures enlever"}
        Menu_RemovedCars_toggle           = Menu_RemovedCars_toggle[Current_language]
        Menu_Make_nightclub_popular       = {"Make nightclub popular","Maxer la popularité de la boite de nuit"}
        Menu_Make_nightclub_popular       = Menu_Make_nightclub_popular[Current_language]
        Menu_Challenge                    = {"N° of challengs for carmeet prize","N° de challenges pour le salon auto"}
        Menu_Challenge                    = Menu_Challenge[Current_language]
        Menu_Report_Submenu               = {"Report stats","Statistique de signalement"}
        Menu_Report_Submenu               = Menu_Report_Submenu[Current_language]
        Menu_Readonly                     = {"Read only","Lecture seule"}
        Menu_Readonly                     = Half_Separator..Menu_Readonly[Current_language]..Separator_Text
        Settings_Transactionerror_Submenu = {"Remove transaction error","Enlever l'erreur de transaction"}
        Settings_Transactionerror_Submenu = Settings_Transactionerror_Submenu[Current_language]
        -- Stat List / Unlocks / Tunable
            Unlock_Tunable_Submenu = {"Unlocks/Tunable menu","Menu de débloquage"}
            Unlock_Tunable_Submenu = Unlock_Tunable_Submenu[Current_language]
            Achivement_Submenu     = {"Achievements","Succés"}
            Achivement_Submenu     = Achivement_Submenu[Current_language]
            Achivement_Text        = {"Choose what for achievement you are missing","Choisir les succés manquants"}
            Achivement_Text        = Achivement_Text[Current_language]
            -- Unlocks
                Unlocks_Daily            = {"Unlock Daily Objectives Awards","Débloquer les recompenses des objectifs"}
                Unlocks_Daily            = Unlocks_Daily[Current_language]
                Unlocks_Parachute        = {"Unlock Rare Parachutes","Débloquer les parachutes"}
                Unlocks_Parachute        = Unlocks_Parachute[Current_language]
                Unlocks_Unicorn          = {"Unlock Vanilla Unicorn","Débloquer Vanilla Unicorn"}
                Unlocks_Unicorn          = Unlocks_Unicorn[Current_language]
                Unlocks_taxi             = {"Unlock Taxi Liverys","Débloquer les patterns taxis"}
                Unlocks_taxi             = Unlocks_taxi[Current_language]
                Unlocks_tatoos           = {"Unlock All Tattoos","Débloquer les tatoos"}
                Unlocks_tatoos           = Unlocks_tatoos[Current_language]
                Unlocks_flight           = {"Unlock Flight School Gold Medals","Débloquer les médailles de l'école"}
                Unlocks_flight           = Unlocks_flight[Current_language]
                Unlocks_shooting         = {"Unlock Shooting Range Rewards","Débloquer les recompenses de Amunation"}
                Unlocks_shooting         = Unlocks_shooting[Current_language]
                Unlocks_Badsport         = {"Badsport","Mauvais joueur"}
                Unlocks_Badsport         = Unlocks_Badsport[Current_language]
                Unlocks_Badsport_List    = {}
                Unlocks_Badsport_List[1] = Unselected_Text
                Unlocks_Badsport_List[2] = {"Add","Ajouter"}
                Unlocks_Badsport_List[3] = {"Remove","Enlever"}
                Unlocks_Badsport_List[2] = Unlocks_Badsport_List[2][Current_language]
                Unlocks_Badsport_List[3] = Unlocks_Badsport_List[3][Current_language]
            -- Stats
                Online_stats_Submenu = {"Online Character Stats","Performance du Personage Online"}
                Online_stats_Submenu = Online_stats_Submenu[Current_language]
                Stats_Stamina        = {"Stamina"      ,"Stamina"}
                Stats_Strength       = {"Strength"     ,"Force"}
                Stats_Lung           = {"Lung capacity","Respiration"}
                Stats_Driving        = {"Driving"      ,"Conduite"}
                Stats_Flying         = {"Flying"       ,"Vol"}
                Stats_Shooting       = {"Shooting"     ,"Tir"}
                Stats_Stealth        = {"Stealth"      ,"Discretion"}
                Stats_Mechanic       = {"Mechanic"     ,"Méchanique"}
                Stats_Mental         = {"Mental state" ,"Etat mental"}
                Stats_Stamina        = Stats_Stamina[Current_language]
                Stats_Strength       = Stats_Strength[Current_language]
                Stats_Lung           = Stats_Lung[Current_language]
                Stats_Driving        = Stats_Driving[Current_language]
                Stats_Flying         = Stats_Flying[Current_language]
                Stats_Shooting       = Stats_Shooting[Current_language]
                Stats_Stealth        = Stats_Stealth[Current_language]
                Stats_Mechanic       = Stats_Mechanic[Current_language]
                Stats_Mental         = Stats_Mental[Current_language]
            -- Report
                Report_List = {}
                Report_List[01] = {"Griefing","Griefing"}
                Report_List[02] = {"Exploits","Abus"}
                Report_List[03] = {"Bug exploits","Abus de bug"}
                Report_List[04] = {"Text chat: Annoying me","Chat Texte: M'agace"}
                Report_List[05] = {"Text chat: Using hate speech","Chat Texte: Discrimination"}
                Report_List[06] = {"Voice chat: Annoying me","Chat vocal: M'agace"}
                Report_List[07] = {"Voice chat: Using hate speech","Chat vocal: Discrimination"}
                Report_List[08] = {"Offensive language","Language offensif"}
                Report_List[09] = {"Offensive tagplate","Nom offensif"}
                Report_List[10] = {"Offensive content","Contenu offensif"}
                Report_List[11] = {"Bad crew name","Mauvais nom de crew"}
                Report_List[12] = {"Bad crew motto","Mauvais motto de crew"}
                Report_List[13] = {"Bad crew status","Mauvais status de crew"}
                Report_List[14] = {"Bad crew emblem","Mauvais embleme de crew"}
                Report_List[15] = {"Friendly","Bonne ambiance"}
                Report_List[16] = {"Helpful","Serviable"}
                Report_List[01] = Report_List[01][Current_language]
                Report_List[02] = Report_List[02][Current_language]
                Report_List[03] = Report_List[03][Current_language]
                Report_List[04] = Report_List[04][Current_language]
                Report_List[05] = Report_List[05][Current_language]
                Report_List[06] = Report_List[06][Current_language]
                Report_List[07] = Report_List[07][Current_language]
                Report_List[08] = Report_List[08][Current_language]
                Report_List[09] = Report_List[09][Current_language]
                Report_List[10] = Report_List[10][Current_language]
                Report_List[11] = Report_List[11][Current_language]
                Report_List[12] = Report_List[12][Current_language]
                Report_List[13] = Report_List[13][Current_language]
                Report_List[14] = Report_List[14][Current_language]
                Report_List[15] = Report_List[15][Current_language]
                Report_List[16] = Report_List[16][Current_language]
    -- Credits
        Credits_Submenu = {"Credits","Credits"}
        Credits_Submenu = Credits_Submenu[Current_language]
    -- RP Editor
        RP_Submenu = {"RP Editor","Editeur de RP"}
        RP_Submenu = RP_Submenu[Current_language]
        RP_Crew = {"Crew","Crew"}
        RP_Crew = RP_Crew[Current_language]
        RP_Rank = {"Rank","Niveau"}
        RP_Rank = RP_Rank[Current_language]
--



-- Global Tester
Global_test_Submenu = {"Global Tester","Testeur de globals"}
Global_test_Submenu = Global_test_Submenu[Current_language]
-- Main
    Global_Mode      = {"Mode","Mode"}
    Global_Mode      = Global_Mode[Current_language]..Arrow_right
    Global_Type      = {"Type","Type"}
    Global_Type      = Global_Type[Current_language]..Arrow_right
    Value_Global     = {"Value","Valeur"}
    Value_Global     = Value_Global[Current_language]..Arrow_right
    Write_Global     = {"Write","Ecriture"}
    Write_Global     = Write_Global[Current_language]
    Read_Global      = {"Read","Lecture"}
    Read_Global      = Read_Global[Current_language]
    Reading_Global   = {"Reading?","Lire?"}
    Reading_Global   = Reading_Global[Current_language]
    Global_Character = {"Character","Charactére"}
    Global_Character = Global_Character[Current_language].." n°"
    Global_Global    = {"Global Offset?","Offset global?"}
    Global_Global    = Global_Global[Current_language]
    Global_Current   = {"Current Global","Global Testé"}
    Global_Current   = Global_Current[Current_language]..Arrow_right
    Global_List      = {"Add in list","Ajouté a la liste"}
    Global_List      = Global_List[Current_language]
--