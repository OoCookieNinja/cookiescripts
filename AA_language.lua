require("scripts/globals")

----- Functions
local success, settings = pcall(json.loadfile, Settings_JSON_Filename)
if not success then
	settings = {}
    settings.Language = "EN_US"
    -- No clip
    settings.Noclip               = {}
    settings.Noclip.up            = 16
    settings.Noclip.down          = 17
    settings.Noclip.foward        = 38
    settings.Noclip.backward      = 40
    settings.Noclip.turnleft      = 37
    settings.Noclip.turnright     = 39
    settings.Noclip.increasespeed = 107
    settings.Noclip.decreasespeed = 109
    settings.Noclip.toggle        = 111
    -- Numberplates
    settings.Numberplates           = {}
    settings.Numberplates.enabled   = false
    settings.Numberplates.unit      = 1
    settings.Numberplates.mode      = 1
    settings.Numberplates.foward	= 90
    settings.Numberplates.backwards = 83
    settings.Numberplates.left		= 81
    settings.Numberplates.right		= 68    
end
json.savefile(Settings_JSON_Filename, settings)


pcall(json.loadfile, Settings_JSON_Filename)
current_language = nil
local function get_language()
    for i=1,2 do
        if settings.Language == Menu_Languages[i] then
            current_language = i
        end
    end
    if current_language == nil then
        current_language = 1
    end
end
get_language()


-- Global / Multiple
    -- Cool
        local You_List             = {"You","Toi"}
        local Empty_text_List      = {"Empty","Vide"}
        local Set_List             = {"Set →","Appliquer →"}
        local Notset_List          = {"Not Set","Non appliqué"}
        local Selected_text_List   = {"Selected","Sélectioné"}
        local Unselected_text_List = {"Unselected","Non selectioné"}
        local Notinheist_List      = {"Not in heist","Pas dans le braquage"}
        local Manual_text_List     = {"-----------------↓ Manual ↓---------------","----------------↓ A la main ↓---------------"}
        You_text                   = You_List[current_language]
        Empty_text                 = Empty_text_List[current_language]
        Set_text                   = Set_List[current_language]
        Notset_text                = Notset_List[current_language]
        Selected_text              = Selected_text_List[current_language]
        Unselected_text            = Unselected_text_List[current_language]
        Notinheist_text            = Notinheist_List[current_language]
        Manual_text                = Manual_text_List[current_language]
    -- Cuts
        local Cut_Player1_List = {"Player 1 → ","Joueur 1  → "}
        local Cut_Player2_List = {"Player 2 → ","Joueur 2  → "}
        local Cut_Player3_List = {"Player 3 → ","Joueur 3  → "}
        local Cut_Player4_List = {"Player 4 → ","Joueur 4  → "}
        Cut_Player1            = Cut_Player1_List[current_language]
        Cut_Player2            = Cut_Player2_List[current_language]
        Cut_Player3            = Cut_Player3_List[current_language]
        Cut_Player4            = Cut_Player4_List[current_language]
        Cut_Setter = {}
        local Cut_Setter_1 = Selected_text
        local Cut_Setter_2 = {"100% for everyone","100% pour tout le monde"}
        Cut_Setter[1]      = Cut_Setter_1[current_language]
        Cut_Setter[2]      = Cut_Setter_2[current_language]
    -- Mode
        Heist_difficulty_list = {}
        local Heist_difficulty_list_1 = {"Normal","Normal"}
        local Heist_difficulty_list_2 = {"Hard","Dur"}
        Heist_difficulty_list[1]      = Heist_difficulty_list_1[current_language]
        Heist_difficulty_list[2]      = Heist_difficulty_list_2[current_language]


----


-- Casino.lua
local Casino_Submenu_List = {"Casino Heist","Braquage du Casino"}
Casino_Submenu = Casino_Submenu_List[current_language]
-- Lists and Variables
    -- Casino_Setup_Missions_List_1
        Casino_Setup_Missions_List_1          = {}
        local Casino_Setup_Missions_List_1_0  = {"Vault content →","Contenu du coffre →"}
        local Casino_Setup_Missions_List_1_1  = {"Vault keycard →","Carte du coffre →"}
        local Casino_Setup_Missions_List_1_2  = {"Weapons Collected →","Armes Collectés →"}
        local Casino_Setup_Missions_List_1_3  = {"Vehicles Collected →","Vehicules Collectés →"}
        local Casino_Setup_Missions_List_1_4  = {"Hacking Device →","Appareil de piratage →"}
        local Casino_Setup_Missions_List_1_5  = {"Nano Drone →","Nano Drone →"}
        local Casino_Setup_Missions_List_1_6  = {"Vault Laser →","Laser pour Coffre →"}
        local Casino_Setup_Missions_List_1_7  = {"Vault Drills →","Perceuse pour Coffre →"}
        local Casino_Setup_Missions_List_1_8  = {"Vault Explosives →","Explosif pour Coffre →"}
        local Casino_Setup_Missions_List_1_9  = {"Breaching Charges →","Charges Explosives →"}
        Casino_Setup_Missions_List_1[0]       = Casino_Setup_Missions_List_1_0[current_language]
        Casino_Setup_Missions_List_1[1]       = Casino_Setup_Missions_List_1_1[current_language]
        Casino_Setup_Missions_List_1[2]       = Casino_Setup_Missions_List_1_2[current_language]
        Casino_Setup_Missions_List_1[3]       = Casino_Setup_Missions_List_1_3[current_language]
        Casino_Setup_Missions_List_1[4]       = Casino_Setup_Missions_List_1_4[current_language]
        Casino_Setup_Missions_List_1[5]       = Casino_Setup_Missions_List_1_5[current_language]
        Casino_Setup_Missions_List_1[6]       = Casino_Setup_Missions_List_1_6[current_language]
        Casino_Setup_Missions_List_1[7]       = Casino_Setup_Missions_List_1_7[current_language]
        Casino_Setup_Missions_List_1[8]       = Casino_Setup_Missions_List_1_8[current_language]
        Casino_Setup_Missions_List_1[9]       = Casino_Setup_Missions_List_1_9[current_language]
    -- Casino_Setup_Missions_List_0
        Casino_Setup_Missions_List_0          = {}
        local Casino_Setup_Missions_List_0_1  = {"Patrol Routes         ","Routes de patrouille"}
        local Casino_Setup_Missions_List_0_2  = {"Duggan Shipments      ","Chargemnts Dugans"}
        local Casino_Setup_Missions_List_0_3  = {"Infiltration Suit     ","Tenues d'infiltrations"}
        local Casino_Setup_Missions_List_0_4  = {"Power Drills          ","Perceuses"}
        local Casino_Setup_Missions_List_0_5  = {"EMP Device            ","Appareil IEM"}
        local Casino_Setup_Missions_List_0_6  = {"Gunman Decoy          ","Leure"}
        local Casino_Setup_Missions_List_0_7  = {"Clean Vehicle         ","Vehicules propres"}
        local Casino_Setup_Missions_List_0_8  = {"Bugstars Van          ","Van Bugstars"}
        local Casino_Setup_Missions_List_0_9  = {"Plant Trash           ","Planter les poubelles"}
        local Casino_Setup_Missions_List_0_10 = {"Maintainance Gear     ","Outilages de maintenance"}
        local Casino_Setup_Missions_List_0_11 = {"Maintainance Van      ","Van de maintenance"}
        local Casino_Setup_Missions_List_0_12 = {"Grouppe Sechs Van     ","Van de Grouppe"}
        local Casino_Setup_Missions_List_0_13 = {"Grouppe Sechs Gear    ","Outilages de Grouppe"}
        local Casino_Setup_Missions_List_0_14 = {"[!]Yung Ancestors Car ","Voiture de Yung"}
        local Casino_Setup_Missions_List_0_15 = {"[!]Yung Ancestors Gear","Outilages de Yung"}
        local Casino_Setup_Missions_List_0_16 = {"Noose Gear            ","Outilages du NOOSE"}
        local Casino_Setup_Missions_List_0_17 = {"Fire Fighter Gear     ","Outilages des pompiers"}
        local Casino_Setup_Missions_List_0_19 = {"Boring Machine        ","Machine de Perçage"}
        local Casino_Setup_Missions_List_0_20 = {"Reinforced Armor      ","Armure réinforcé"}
        Casino_Setup_Missions_List_0[1]       = Casino_Setup_Missions_List_0_1[current_language]
        Casino_Setup_Missions_List_0[2]       = Casino_Setup_Missions_List_0_2[current_language]
        Casino_Setup_Missions_List_0[3]       = Casino_Setup_Missions_List_0_3[current_language]
        Casino_Setup_Missions_List_0[4]       = Casino_Setup_Missions_List_0_4[current_language]
        Casino_Setup_Missions_List_0[5]       = Casino_Setup_Missions_List_0_5[current_language]
        Casino_Setup_Missions_List_0[6]       = Casino_Setup_Missions_List_0_6[current_language]
        Casino_Setup_Missions_List_0[7]       = Casino_Setup_Missions_List_0_7[current_language]
        Casino_Setup_Missions_List_0[8]       = Casino_Setup_Missions_List_0_8[current_language]
        Casino_Setup_Missions_List_0[9]       = Casino_Setup_Missions_List_0_9[current_language]
        Casino_Setup_Missions_List_0[10]      = Casino_Setup_Missions_List_0_10[current_language]
        Casino_Setup_Missions_List_0[11]      = Casino_Setup_Missions_List_0_11[current_language]
        Casino_Setup_Missions_List_0[12]      = Casino_Setup_Missions_List_0_12[current_language]
        Casino_Setup_Missions_List_0[13]      = Casino_Setup_Missions_List_0_13[current_language]
        Casino_Setup_Missions_List_0[14]      = Casino_Setup_Missions_List_0_14[current_language]
        Casino_Setup_Missions_List_0[15]      = Casino_Setup_Missions_List_0_15[current_language]
        Casino_Setup_Missions_List_0[16]      = Casino_Setup_Missions_List_0_16[current_language]
        Casino_Setup_Missions_List_0[17]      = Casino_Setup_Missions_List_0_17[current_language]
        Casino_Setup_Missions_List_0[19]      = Casino_Setup_Missions_List_0_19[current_language]
        Casino_Setup_Missions_List_0[20]      = Casino_Setup_Missions_List_0_20[current_language]
    -- Casino_Approch_List
        Casino_Approch_List = {}
        local Casino_Approch_List_1       = {"Silent n Sneaky","Furtive"}
        local Casino_Approch_List_2       = {"Silent n Sneaky-HARD","Furtive-HARD"}
        local Casino_Approch_List_3       = {"The Big CON","Rusée"}
        local Casino_Approch_List_4       = {"The Big CON-HARD","Rusée-HARD"}
        local Casino_Approch_List_5       = {"Aggressive","En force"}
        local Casino_Approch_List_6       = {"Aggressive-HARD","En force-HARD"}
        Casino_Approch_List[1]            = Casino_Approch_List_1[current_language]
        Casino_Approch_List[2]            = Casino_Approch_List_2[current_language]
        Casino_Approch_List[3]            = Casino_Approch_List_3[current_language]
        Casino_Approch_List[4]            = Casino_Approch_List_4[current_language]
        Casino_Approch_List[5]            = Casino_Approch_List_5[current_language]
        Casino_Approch_List[6]            = Casino_Approch_List_6[current_language]
        Casino_Approch_List[-1]           = Unselected_text
    -- Casino_Target_List
        Casino_Target_List = {}
        local Casino_Target_List_0 = {"Cash","Argent"}
        local Casino_Target_List_1 = {"Gold","Or"}
        local Casino_Target_List_2 = {"Artwork","Peintures"}
        local Casino_Target_List_3 = {"Diamonds","Diamands"}
        Casino_Target_List[0]      = Casino_Target_List_0[current_language]
        Casino_Target_List[1]      = Casino_Target_List_1[current_language]
        Casino_Target_List[2]      = Casino_Target_List_2[current_language]
        Casino_Target_List[3]      = Casino_Target_List_3[current_language]
        
    -- Misc
        Casino_Hacker_List    = {}
        Casino_Hacker_List[0] = Unselected_text
        Casino_Mask_List      = {}
        Casino_Mask_List[0]   = Unselected_text

-- Casino Setup
    local Casino_Setup_Submenu_List        = {"Casino Setup","Préparation pour le Casino"}
    Casino_Setup_Submenu                   = Casino_Setup_Submenu_List[current_language]
    local Casino_Setup_Mode_List           = {"Go to Finale →","Aller au braquage →"}
    Casino_Setup_Mode                      = Casino_Setup_Mode_List[current_language]
    local Casino_Setup_Targetchoise_list   = {"Choose Target →","Choisir la cible →"}
    Casino_Setup_Targetchoise              = Casino_Setup_Targetchoise_list[current_language]
-- Casino Approach
    local Casino_Approach_Setmode_list = {"Set mode →","Mettre le mode →"}
    Casino_Approach_Setmode            = Casino_Approach_Setmode_list[current_language]
    local Casino_Approach_Choise_list  = {"Approach →","Approche →"}
    Casino_Approach_Choice             = Casino_Approach_Choise_list[current_language]
    -- Casino Approach Settings
        local Casino_Approach_Settings_Silentnsneaky_list           = {"Silent and Sneaky Settings","Paramétre: Furtive"}
        Casino_Approach_Settings_Silentnsneaky                      = Casino_Approach_Settings_Silentnsneaky_list[current_language]
        local Casino_Approach_Settings_Thebigcon_list               = {"The big con Settings","Paramétre: Rusée"}
        Casino_Approach_Settings_Thebigcon                          = Casino_Approach_Settings_Thebigcon_list[current_language]
        local Casino_Approach_Settings_Thebigcon_entrydesguise_list = {"↓ Entry Disguise ↓","↓ Deguisement d'entrée ↓"}
        Casino_Approach_Settings_Thebigcon_entrydesguise            = Casino_Approach_Settings_Thebigcon_entrydesguise_list[current_language]
        local Casino_Approach_Settings_Thebigcon_exitdesguise_list  = {"↓ Exit Disguise ↓","↓ Deguisement de sortie ↓"}
        Casino_Approach_Settings_Thebigcon_exitdesguise             = Casino_Approach_Settings_Thebigcon_exitdesguise_list[current_language]
        local Casino_Approach_Settings_Aggresive_list               = {"Aggresive Settings","Paramétre: En force"}
        Casino_Approach_Settings_Aggresive                          = Casino_Approach_Settings_Aggresive_list[current_language]
        local Casino_Approach_Settings_Submenu_list                 = {"Approach Settings","Paramétre d'approche"}
        Casino_Approach_Settings_Submenu                            = Casino_Approach_Settings_Submenu_list[current_language]
-- Support Crew
    -- Hacker
        local Casino_Crew_Hacker_list = {"Choose Hacker →","Choisir Hacker →"}
        Casino_Crew_Hacker            = Casino_Crew_Hacker_list[current_language]
    -- Gunman
        local Casino_Crew_Gunman_Submenu_list       = {"Gunman and Weapon","Armurier et Armes"}
        Casino_Crew_Gunman_Submenu                  = Casino_Crew_Gunman_Submenu_list[current_language]
        local Casino_Crew_Gunman_Choise_list        = {"Choose one","Choisis-en un"}
        Casino_Crew_Gunman_Choise                   = Casino_Crew_Gunman_Choise_list[current_language]
        local Casino_Crew_Gunman_MicroSMG_list      = {"Micro SMG","Pistolet Mitrailleur"}
        Casino_Crew_Gunman_MicroSMG                 = Casino_Crew_Gunman_MicroSMG_list[current_language]
        local Casino_Crew_Gunman_Machinepistol_list = {"Machine Pistol","Pistolet Performant"}
        Casino_Crew_Gunman_Machinepistol            = Casino_Crew_Gunman_Machinepistol_list[current_language]
        local Casino_Crew_Gunman_Shotgun_list       = {"Shotgun","Fusil a pompe"}
        Casino_Crew_Gunman_Shotgun                  = Casino_Crew_Gunman_Shotgun_list[current_language]
        local Casino_Crew_Gunman_Rifle_list         = {"Rifle","Fusil d'assualt"}
        Casino_Crew_Gunman_Rifle                    = Casino_Crew_Gunman_Rifle_list[current_language]
        local Casino_Crew_Gunman_ShotgunMKII_list   = {"MkII Shotgun","Fusil a pompe MkII"}
        Casino_Crew_Gunman_ShotgunMKII              = Casino_Crew_Gunman_ShotgunMKII_list[current_language]
        local Casino_Crew_Gunman_RifleMKII_list     = {"MKII Rifle","Fusil d'assault MkII"}
        Casino_Crew_Gunman_RifleMKII                = Casino_Crew_Gunman_RifleMKII_list[current_language]
    -- Driver
        local Casino_Crew_Driver_Submenu_list = {"Driver and Car","Conducteur et Voiture"}
        Casino_Crew_Driver_Submenu            = Casino_Crew_Driver_Submenu_list[current_language]
        local Casino_Crew_Driver_Choise_list  = {"Choose one (with wanted vehicle)","Choisir un (avec le vehicule)"}
        Casino_Crew_Driver_Choise             = Casino_Crew_Driver_Choise_list[current_language]
        local Casino_Crew_Driver_Bikes_list   = {" (Bikes)"," (Motos)"}
        Casino_Crew_Driver_Bikes              = Casino_Crew_Driver_Bikes_list[current_language]
    -- Masks
        local Casino_Crew_Mask_list = {"Choose Mask →","Choisir un masque →"}
        Casino_Crew_Mask            = Casino_Crew_Mask_list[current_language]
-- Common Missions
        local Casino_Setup_Common_Submenu_List   = {"Common Missions","Missions communes"}
        Casino_Setup_Common_Submenu              = Casino_Setup_Common_Submenu_List[current_language]
        local Casino_Setup_Common_Passlevel_List = {"Security Pass Level →","Niveau des pass de secutite →"}
        Casino_Setup_Common_Passlevel            = Casino_Setup_Common_Passlevel_List[current_language]
        Casino_Setup_Common_Shipment = ""
        local Casino_Setup_Common_Shipment_list = {"   Shipment destroyed","   Quantité détruit"}
        Casino_Setup_Common_Shipment            = Casino_Setup_Common_Shipment_list[current_language]
-- Casino Cut
    local Casino_Cut_Submenu_List    = {"Casino Cut","Pourcentage pour le Casino"}
    Casino_Cut_Submenu               = Casino_Cut_Submenu_List[current_language]
-- Casino Extras
    local Casino_Extras_Keypad_List      = {"Complete Keypad","Completer le clavier numérique"}
    Casino_Extras_Keypad                 = Casino_Extras_Keypad_List[current_language]
    local Casino_Extras_Fingerprint_List = {"Complete Fingerprint","Completer l'empreinte"}
    Casino_Extras_Fingerprint            = Casino_Extras_Fingerprint_List[current_language]
    local Casino_Extras_DrillVault_List  = {"Drill Vault Door","Forer Le Coffre"}
    Casino_Extras_DrillVault             = Casino_Extras_DrillVault_List[current_language]
----

-- Cayo.lua
local Cayo_Submenu_list = {"Cayo Perico Heist","Braquage de Cayo Perico"}
Cayo_Submenu            = Cayo_Submenu_list[current_language]
-- Lists and Variables
    -- Global Cayo
        local Cayo_Maindock_list      = {"Main dock","Dock Principal"}
        local Cayo_NearMaindock_list  = {"Near Main dock","A coté du Dock Principal"}
        local Cayo_InnerMaindock_list = {"Inner Main dock","Dock Principal interieur"}
        local Cayo_Farmland_list      = {"Farmland","Champs"}
        local Cayo_Northdock_list     = {"North dock","Dock nord"}
        local Cayo_Airstrip_list      = {"Airstip","Piste d'atterisage"}
        local Cayo_Lighthouse_list    = {"Lighthouse","Phare"}
        Cayo_NearMaindock             = Cayo_NearMaindock_list[current_language]
        Cayo_Maindock                 = Cayo_Maindock_list[current_language]
        Cayo_InnerMaindock            = Cayo_InnerMaindock_list[current_language]
        Cayo_Farmland                 = Cayo_Farmland_list[current_language]
        Cayo_Northdock                = Cayo_Northdock_list[current_language]
        Cayo_Airstrip                 = Cayo_Airstrip_list[current_language]
        Cayo_Lighthouse               = Cayo_Lighthouse_list[current_language]
    -- Mission List & POI
        Cayo_Missions_List = {}
        local Cayo_Missions_List_0  = {"Gather Intel*","Rassemlez des infos"}
        local Cayo_Missions_List_1  = {"Kosatka Submarine →","Sousmarin Kosatka →"}
        local Cayo_Missions_List_2  = {"RO-86 Alkonost →","RO-86 Alkonost →"}
        local Cayo_Missions_List_3  = {"Velum 5-Seater →","Velum 5-places →"}
        local Cayo_Missions_List_4  = {"Stealth Annihilator →","Annihilator Furtif →"}
        local Cayo_Missions_List_5  = {"Kurtz Patrol Boat →","Bateau de patrouille →"}
        local Cayo_Missions_List_6  = {"Longifin Boat →","Bateau Longfin →"}
        local Cayo_Missions_List_7  = {"Pilot (Alkonost,Annihilator) →","Pilote (Alkonost,Annihilator) →"}
        local Cayo_Missions_List_8  = {"Demolition Charges →","Charges de démolition →"}
        local Cayo_Missions_List_9  = {"Cutting Torch* →","Torche pour Découper* →"}
        local Cayo_Missions_List_10 = {"Plasma Cutter* →","Découpeur plasma* →"}
        local Cayo_Missions_List_11 = {"Fingerprint Cloner* →","Cloneur d'empreinte* →"}
        local Cayo_Missions_List_12 = {"Approach Weapon* →","Amres pour Approche* →"}
        local Cayo_Missions_List_13 = {"Weapons Disruption →","Armes perturb&"}
        local Cayo_Missions_List_14 = {"Armor Disruption →","Armure perturbé"}
        local Cayo_Missions_List_15 = {"Air Support Disruption →","Suppot Aérien perturbé"}
        Cayo_Missions_List[0]       = Cayo_Missions_List_0[current_language]
        Cayo_Missions_List[1]       = Cayo_Missions_List_1[current_language]
        Cayo_Missions_List[2]       = Cayo_Missions_List_2[current_language]
        Cayo_Missions_List[3]       = Cayo_Missions_List_3[current_language]
        Cayo_Missions_List[4]       = Cayo_Missions_List_4[current_language]
        Cayo_Missions_List[5]       = Cayo_Missions_List_5[current_language]
        Cayo_Missions_List[6]       = Cayo_Missions_List_6[current_language]
        Cayo_Missions_List[7]       = Cayo_Missions_List_7[current_language]
        Cayo_Missions_List[8]       = Cayo_Missions_List_8[current_language]
        Cayo_Missions_List[9]       = Cayo_Missions_List_9[current_language]
        Cayo_Missions_List[10]      = Cayo_Missions_List_10[current_language]
        Cayo_Missions_List[11]      = Cayo_Missions_List_11[current_language]
        Cayo_Missions_List[12]      = Cayo_Missions_List_12[current_language]
        Cayo_Missions_List[13]      = Cayo_Missions_List_13[current_language]
        Cayo_Missions_List[14]      = Cayo_Missions_List_14[current_language]
        Cayo_Missions_List[15]      = Cayo_Missions_List_15[current_language]
    -- Loots
        Cayo_set_loot_compound_table_list = {}
        Cayo_Choose_Target = {}
        Cayo_set_loot_outside_table_list = {}
        local Cayo_set_loot_compound_table_list_2 = {"Cash","Argent"}
        local Cayo_set_loot_compound_table_list_1 = {"Gold","Or"}
        local Cayo_set_loot_outside_table_list_2  = {"Cash","Argent"}
        local Cayo_set_loot_outside_table_list_1  = {"Coke","Cocaïne"}
        local Cayo_Choose_Target_0                = {"Sinsimito Tequila","Sinsimito Tequila"}
        local Cayo_set_loot_outside_table_list_3  = {"Weed","Weed"}
        local Cayo_Choose_Target_1                = {"Ruby Necklace","Colier de ruby"}
        local Cayo_Choose_Target_2                = {"Bearer Bonds","Les bons au porteur"}
        local Cayo_Choose_Target_3                = {"Pink Diamond","Diamant rose"}
        local Cayo_Choose_Target_5                = {"Panther Statue","Statue de la panthére"}
        Cayo_set_loot_compound_table_list[0]      = Empty_text
        Cayo_set_loot_compound_table_list[1]      = Cayo_set_loot_compound_table_list_1[current_language]
        Cayo_set_loot_compound_table_list[2]      = Cayo_set_loot_compound_table_list_2[current_language]
        Cayo_set_loot_outside_table_list[0]       = Empty_text
        Cayo_set_loot_outside_table_list[1]       = Cayo_set_loot_outside_table_list_1[current_language]
        Cayo_set_loot_outside_table_list[2]       = Cayo_set_loot_outside_table_list_2[current_language]
        Cayo_set_loot_outside_table_list[3]       = Cayo_set_loot_outside_table_list_3[current_language]
        Cayo_Choose_Target[-1]                    = Notset_text
        Cayo_Choose_Target[0]                     = Cayo_Choose_Target_0[current_language]
        Cayo_Choose_Target[1]                     = Cayo_Choose_Target_1[current_language]
        Cayo_Choose_Target[2]                     = Cayo_Choose_Target_2[current_language]
        Cayo_Choose_Target[3]                     = Cayo_Choose_Target_3[current_language]
        Cayo_Choose_Target[5]                     = Cayo_Choose_Target_5[current_language]
    -- Cayo_Loot_point
        local Cayo_Setloot_Table1_list       = {"Table 1     →","Table 1     →"}
        local Cayo_Setloot_Table2_list       = {"Table 2     →","Table 2     →"}
        local Cayo_Setloot_Table3_list       = {"Table 3     →","Table 3     →"}
        Cayo_Setloot_Table1                  = Cayo_Setloot_Table1_list[current_language]
        Cayo_Setloot_Table2                  = Cayo_Setloot_Table2_list[current_language]
        Cayo_Setloot_Table3                  = Cayo_Setloot_Table3_list[current_language]
        local Cayo_Setloot_Painting1_list    = {"Painting   →","Tableau    →"}
        local Cayo_Setloot_Painting2_list    = {"Painting 2 →","Tableau 2  →"}
        Cayo_Setloot_Painting1               = Cayo_Setloot_Painting1_list[current_language]
        Cayo_Setloot_Painting2               = Cayo_Setloot_Painting2_list[current_language]
        Cayo_Loot_point = {}
        -- Table 1
            for i = 0,3 do
                Cayo_Loot_point[(i*2)+1] = Cayo_Setloot_Table1
            end
            for i = 5,9 do
                Cayo_Loot_point[i*2] = Cayo_Setloot_Table1
            end
            Cayo_Loot_point[21] = Cayo_Setloot_Table1
            Cayo_Loot_point[23] = Cayo_Setloot_Table1
        -- Table 2
            for i = 0,4 do
                Cayo_Loot_point[i*2] = Cayo_Setloot_Table2
            end
            for i = 4,8 do
                Cayo_Loot_point[(i*2)+1] = Cayo_Setloot_Table2
            end
            Cayo_Loot_point[20] = Cayo_Setloot_Table2
            Cayo_Loot_point[22] = Cayo_Setloot_Table2
        -- Table 3
            Cayo_Loot_point[8]  = Cayo_Setloot_Table3
            Cayo_Loot_point[19] = Cayo_Setloot_Table3
    -- Cayo_Point_of_interest_List
        Cayo_Point_of_interest_List    = {}
        local Cayo_Point_of_interest_List_7  = {"WatchTower Near Compound","Tour de garde a coté de la cour"}
        local Cayo_Point_of_interest_List_12 = {"   Weapon Suppressor","   Silcencieux"}
        local Cayo_Point_of_interest_List_13 = {"Cutting Powder","Poudre pour couper"}
        local Cayo_Point_of_interest_List_14 = {"Power Station","Station éléctrique"}
        local Cayo_Point_of_interest_List_15 = {"Supply Truck","Camion ravitailleur"}
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
        Cayo_Point_of_interest_List[7]  = Cayo_Point_of_interest_List_7[current_language]
        Cayo_Point_of_interest_List[11] = Cayo_Farmland
        Cayo_Point_of_interest_List[12] = Cayo_Point_of_interest_List_12[current_language]
        Cayo_Point_of_interest_List[13] = Cayo_Point_of_interest_List_13[current_language]
        Cayo_Point_of_interest_List[14] = Cayo_Point_of_interest_List_14[current_language]
        Cayo_Point_of_interest_List[15] = Cayo_Point_of_interest_List_15[current_language]
    -- Cayo_Interest_point
        Cayo_Interest_point = {}
        Cayo_Interest_point_0 = {"None","Aucun"}
        Cayo_Interest_point_5 = {"Outside Compoud","Hors de la cour"}
        Cayo_Interest_point[0] = Cayo_Interest_point_0[current_language]
        Cayo_Interest_point[1] = Cayo_Airstrip
        Cayo_Interest_point[2] = Cayo_Northdock
        Cayo_Interest_point[3] = Cayo_NearMaindock
        Cayo_Interest_point[4] = Cayo_Maindock
        Cayo_Interest_point[5] = Cayo_Interest_point_5[current_language]

    -- Weapons
        Cayo_Choose_Weapon = {}
        local Cayo_Choose_Weapon_1                = {"Aggressor","Aggreseur"}
        local Cayo_Choose_Weapon_2                = {"Conspirator","Conspirateur"}
        local Cayo_Choose_Weapon_3                = {"Crackshot","Fine Gâchette"}
        local Cayo_Choose_Weapon_4                = {"Saboteur","Saboteur"}
        local Cayo_Choose_Weapon_5                = {"Marksman","Tireur d'élite"}
        Cayo_Choose_Weapon[0]                     = Notset_text
        Cayo_Choose_Weapon[1]                     = Cayo_Choose_Weapon_1[current_language]
        Cayo_Choose_Weapon[2]                     = Cayo_Choose_Weapon_2[current_language]
        Cayo_Choose_Weapon[3]                     = Cayo_Choose_Weapon_3[current_language]
        Cayo_Choose_Weapon[4]                     = Cayo_Choose_Weapon_4[current_language]
        Cayo_Choose_Weapon[5]                     = Cayo_Choose_Weapon_5[current_language]
-- Cayo Setup
    -- Auto
        local Cayo_Seup_Instant_list = {"Instant Setup","Préparation Instant"}
        Cayo_Seup_Instant            = Cayo_Seup_Instant_list[current_language]
        local Cayo_Setup_Hardmode_list = {"Set heist into hard mode","Mettre le mode dur"}
        Cayo_Setup_Hardmode            = Cayo_Setup_Hardmode_list[current_language]
        local Cayo_Setup_Maxing_list = {"Max for (yourCut)→","Max pour (ta part)→"}
        Cayo_Setup_Maxing            = Cayo_Setup_Maxing_list[current_language]
    -- Manual
        local Cayo_Setup_Target_list = {"Primary Target →","Cible Principale →"}
        Cayo_Setup_Target            = Cayo_Setup_Target_list[current_language]
        local Cayo_Setup_ChooseWeapon_list = {"Choose Weapon* →","Choisir Armes* →"}
        Cayo_Setup_ChooseWeapon            = Cayo_Setup_ChooseWeapon_list[current_language]
        local Cayo_Setup_Approach_Submenu_list = {"Approach Vehicle*","Vehicule d'approche* →"}
        Cayo_Setup_Approach_Submenu            = Cayo_Setup_Approach_Submenu_list[current_language]
        local Cayo_Setup_Approach_Choose_list = {"-----------Choose at least one--------","-----------Choisir Au moins un----------"}
        Cayo_Setup_Approach_Choose            = Cayo_Setup_Approach_Choose_list[current_language]
    -- Disruption
        local Cayo_Setup_MissionAndWeapons_Submenu_list             = {"Disruption And Weapons*","Armes et Pértubation"}
        Cayo_Setup_MissionAndWeapons_Submenu                        = Cayo_Setup_MissionAndWeapons_Submenu_list[current_language]
        local Cayo_Setup_MissionAndWeapons_ChooseWeapon_list        = {"Choose Weapon →","Choisir Arme →"}
        Cayo_Setup_MissionAndWeapons_ChooseWeapon                   = Cayo_Setup_MissionAndWeapons_ChooseWeapon_list[current_language]
        local Cayo_Setup_MissionAndWeapons_PercetangeDestroyed_list = {"   Quantity Destroyed","   Quantité Détruite"}
        Cayo_Setup_MissionAndWeapons_PercetangeDestroyed            = Cayo_Setup_MissionAndWeapons_PercetangeDestroyed_list[current_language]
    
    local Cayo_Setup_Submenu_list = {"Cayo Setup","Preparation de Cayo"}
    Cayo_Setup_Submenu            = Cayo_Setup_Submenu_list[current_language]
    -- POI Stuff
        local Cayo_Point_of_interest_submenu_list               = {"Points of interests","Points d'interet"}
        local Cayo_Point_of_interest_grappling_submenu_list     = {"Put Grappling Eq in/near...","Grapin dans/a coté de..."}
        local Cayo_Point_of_interest_guardclothes_submenu_list  = {"Put Guard Clothes in/near...","Déguisement de guarde dans/a coté de..."}
        local Cayo_Point_of_interest_boltcutters_submenu_list   = {"Bolt Cutters in/near...","Coupe-Grille dans/a coté de..."}
        Cayo_Point_of_interest_submenu                          = Cayo_Point_of_interest_submenu_list[current_language]
        Cayo_Point_of_interest_grappling_submenu                = Cayo_Point_of_interest_grappling_submenu_list[current_language]
        Cayo_Point_of_interest_guardclothes_submenu             = Cayo_Point_of_interest_guardclothes_submenu_list[current_language]
        Cayo_Point_of_interest_boltcutters_submenu              = Cayo_Point_of_interest_boltcutters_submenu_list[current_language]
        local Cayo_Point_of_interest_supplytruck_list           = {"Supply truck in","Camion ravitailleur dans"}
        local Cayo_Point_of_interest_scopeout_list              = {"ScopeOut POIs","Repérer les POIs"}
        Cayo_Point_of_interest_supplytruck                      = Cayo_Point_of_interest_supplytruck_list[current_language]
        Cayo_Point_of_interest_scopeout                         = Cayo_Point_of_interest_scopeout_list[current_language]
-- Cayo Set Loot
    local Cayo_Setloot_Submenu_list      = {"Set loot","Définir le loot"}
    Cayo_Setloot_Submenu                 = Cayo_Setloot_Submenu_list[current_language]
    -- IN
        local Cayo_Setloot_Compound_in_list  = {"---------↓ Inside Compound ↓---------","---------↓ L'interieur de la cour ↓---------"}
        Cayo_Setloot_Compound_in             = Cayo_Setloot_Compound_in_list[current_language]
        local Cayo_Setloot_Room1_list        = {"Room 1 (North)","Piéce 1 (Nord)"}
        local Cayo_Setloot_Room2_list        = {"Room 2 (Center)","Piéce 2 (Centre)"}
        local Cayo_Setloot_Room3_list        = {"Room 3 (South)","Piéce 3 (Sud)"}
        local Cayo_Setloot_Basement_list     = {"Basement","Sous-Sol"}
        local Cayo_Setloot_Office_list       = {"Rubio's office","Bureau de Rubio"}
        Cayo_Setloot_Room1                   = Cayo_Setloot_Room1_list[current_language]
        Cayo_Setloot_Room2                   = Cayo_Setloot_Room2_list[current_language]
        Cayo_Setloot_Room3                   = Cayo_Setloot_Room3_list[current_language]
        Cayo_Setloot_Basement                = Cayo_Setloot_Basement_list[current_language]
        Cayo_Setloot_Office                  = Cayo_Setloot_Office_list[current_language]
    -- OUT
        local Cayo_Setloot_Compound_out_list  = {"---------↓ Outside Compound ↓---------","---------↓ L'extérieur de la cour ↓---------"}
        Cayo_Setloot_Compound_out             = Cayo_Setloot_Compound_out_list[current_language]
        local Cayo_Setloot_Shed_list          = {"↓ Shed ↓","↓ Barraque ↓"}
        local Cayo_Setloot_Shed2_list         = {"↓ Shed 2 ↓","↓ Barraque 2 ↓"}
        local Cayo_Setloot_Lockup_list        = {"↓ Lock up ↓","↓ Porte Vérouillée ↓"}
        local Cayo_Setloot_HangarTop_list     = {"↓ Hangar Bottom ↓","↓ Bas du Hangar ↓"}
        local Cayo_Setloot_HangarBottom_list  = {"↓ Hangar Top ↓","↓ Haut du Hangar ↓"}
        local Cayo_Setloot_Warehouse_list     = {"↓ Warehouse ↓","↓ L'entrepôt ↓"}
        Cayo_Setloot_Shed                     = Cayo_Setloot_Shed_list[current_language]
        Cayo_Setloot_Shed2                    = Cayo_Setloot_Shed2_list[current_language]
        Cayo_Setloot_Lockup                   = Cayo_Setloot_Lockup_list[current_language]
        Cayo_Setloot_HangarTop                = Cayo_Setloot_HangarTop_list[current_language]
        Cayo_Setloot_HangarBottom             = Cayo_Setloot_HangarBottom_list[current_language]
        Cayo_Setloot_Warehouse                = Cayo_Setloot_Warehouse_list[current_language]
-- Cayo Cut
    local Cayo_Cut_Submenu_list = {"Cayo Cut","Pourcentage pour Cayo"}
    Cayo_Cut_Submenu            = Cayo_Cut_Submenu_list[current_language]
-- Cayo Extras
    local Cayo_Extras_Sewer_list       = {"Cut Sewer Fence","Couper la grille des égôuts"}
    Cayo_Extras_Sewer                  = Cayo_Extras_Sewer_list[current_language]
    local Cayo_Extras_Fingerprint_list = {"Clone Fingerprint","Cloner l'empreinte"}
    Cayo_Extras_Fingerprint            = Cayo_Extras_Fingerprint_list[current_language]
    local Cayo_Extras_Cutglass_list    = {"Cut Glass","Couper le verre"}
    Cayo_Extras_Cutglass               = Cayo_Extras_Cutglass_list[current_language]
    local Cayo_Extras_Bag_list         = {"Bag Cap →","Capacité du sac →"}
    Cayo_Extras_Bag                    = Cayo_Extras_Bag_list[current_language]
----


-- Main.lua
local Menu_Submenu_list = {"Main menu","Menu Principal"}
Menu_Submenu            = Menu_Submenu_list[current_language]
local Settings_Submenu_list             = {"Settings","Paramétre"}
Settings_Submenu                        = Settings_Submenu_list[current_language]
-- List and Variables
    units_text = {}
    local units_text_1 = {"kilometres per hour","Kilométres par heures"}
    local units_text_2 = {"metres per second","métres par secondes"}
    local units_text_3 = {"miles per hour","miles par heures"}
    local units_text_4 = {"feet per second","pieds par secondes"}
    units_text[1] = units_text_1[current_language]
    units_text[2] = units_text_2[current_language]
    units_text[3] = units_text_3[current_language]
    units_text[4] = units_text_4[current_language]
-- Settings
    local Settings_Menu_Language_List       = {"Language","Langue"}
    Settings_Language                       = Settings_Menu_Language_List[current_language]
    local Settings_Reload_list              = {"Reload scripts after changes","Recharger les scritps aprés changements"}
    Settings_Reload                         = Settings_Reload_list[current_language]
    local Settings_Binds_list               = {"Go to "..Settings_JSON_Filename.." To Modify Binds","Aller a "..Settings_JSON_Filename.." pour les Binds"}
    Settings_Binds                          = Settings_Binds_list[current_language]
    local Settings_Numberplates_enable_list = {"Show speedometer on Numberplates","Activer la vitesse sur les plaques"}
    Settings_Numberplates_enable            = Settings_Numberplates_enable_list[current_language]
    local Settings_Numberplates_unit_list   = {"Speedometer unit","Unité de vitesse"}
    Settings_Numberplates_unit              = Settings_Numberplates_unit_list[current_language]
    local Settings_Numberplates_Binds_list  = {"Nuberplates Keybinds","Styles de touches"}
    Settings_Numberplates_Binds             = Settings_Numberplates_Binds_list[current_language]
-- Main menu
    local Manu_TransactionError_list = {"Remove Transaction Error","Enlever l'erreur de transaction"}
    Manu_TransactionError            = Manu_TransactionError_list[current_language]
    -- Noclip
        local Menu_Noclip_list = {"Noclip","Noclip"}
        Menu_Noclip            = Menu_Noclip_list[current_language]
        local Menu_Noclip_Speed_list = {"  Noclip Spped","  Vitesse du Noclip"}
        Menu_Noclip_Speed            = Menu_Noclip_Speed_list[current_language]
    -- Numberplates Speedometer
        local Menu_Numberplates_toggle_list = {"Numberplates Speedometer","Compteur de vitesse sur plaque"}
        Menu_Numberplates_toggle            = Menu_Numberplates_toggle_list[current_language]
        local Menu_Numberplates_Speed_list = {"  Speed: ","  Vitesse:"}
        Menu_Numberplates_Speed            = Menu_Numberplates_Speed_list[current_language]
        local Menu_Numberplates_NotInVehicle_list = {"Not in vehicle","Pas dans un vehicule"}
        Menu_Numberplates_NotInVehicle            = Menu_Numberplates_NotInVehicle_list[current_language]
        local Menu_Numberplates_InvalidVehicle_list = {"Invalid vehicle","Vehicule Invalide"}
        Menu_Numberplates_InvalidVehicle            = Menu_Numberplates_InvalidVehicle_list[current_language]
----