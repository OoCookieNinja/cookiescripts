require("scripts/globals")

----- Functions
success, settings = pcall(json.loadfile, Settings_JSON_Filename)
success_2, config = pcall(json.loadfile, "config.json")
if not success then
	settings = {}
    settings.Language = "EN_US"
    settings.Gender = 2
    settings.RemovedCars = false
    settings.RefillKey = 46
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
    -- Custom
    settings.Numberplates.custom              = {}
    settings.Numberplates.custom.enabled      = false
    settings.Numberplates.custom.platelist    = {}
    settings.Numberplates.custom.platedefault = 0
    -- Boost button
    settings.BoostButton = {}
    settings.BoostButton.enable = true
    settings.BoostButton.key    = 45
end
json.savefile(Settings_JSON_Filename, settings)


pcall(json.loadfile, Settings_JSON_Filename)
current_language = nil
local function get_language()
    for i=1,#Menu_Languages do
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
        You_List             = {"You","Toi"}
        Empty_text_List      = {"Empty","Vide"}
        None_text_List       = {"None","Aucun"}
        Set_List             = {"Set →","Appliquer →"}
        Notset_List          = {"Not set","Non appliqué"}
        Selected_text_List   = {"Selected","Sélectioné"}
        Unselected_text_List = {"Unselected","Non selectioné"}
        Notinheist_List      = {"Not in heist","Pas dans le braquage"}
        Manual_text_List     = {"________________↓ Manual ↓________________","________________↓ Manuel ↓________________"}
        Separator_text_List  = {"__________________________________________","__________________________________________"}
        You_text             = You_List[current_language]
        Empty_text           = Empty_text_List[current_language]
        None_text            = None_text_List[current_language]
        Set_text             = Set_List[current_language]
        Notset_text          = Notset_List[current_language]
        Selected_text        = Selected_text_List[current_language]
        Unselected_text      = Unselected_text_List[current_language]
        Notinheist_text      = Notinheist_List[current_language]
        Manual_text          = Manual_text_List[current_language]
        Separator_text       = Separator_text_List[current_language]
    -- Cuts
        Cut_Player_List    ={}
        Cut_Player1_List   = {"Player 1 → ","Joueur 1  → "}
        Cut_Player2_List   = {"Player 2 → ","Joueur 2  → "}
        Cut_Player3_List   = {"Player 3 → ","Joueur 3  → "}
        Cut_Player4_List   = {"Player 4 → ","Joueur 4  → "}
        Cut_Player_List[1] = Cut_Player1_List[current_language]
        Cut_Player_List[2] = Cut_Player2_List[current_language]
        Cut_Player_List[3] = Cut_Player3_List[current_language]
        Cut_Player_List[4] = Cut_Player4_List[current_language]
        Cut_Setter         = {}
        Cut_Setter_2       = {"100% for everyone","100% pour tout le monde"}
        Cut_Setter[1]      = Selected_text
        Cut_Setter[2]      = Cut_Setter_2[current_language]
        Cut_Player_list    = {"______________↓ Player cuts ↓_______________","___________↓ Pourcentage joueur ↓___________"}
        Cut_Player         = Cut_Player_list[current_language]
        Cut_Crew_list      = {"_______________↓ Crew cuts ↓________________","___________↓ Pourcentage equipe ↓___________"}
        Cut_Crew           = Cut_Crew_list[current_language]
        Cut_Crew2_list     = {"Apply during heist (Only you)","Appliquer pendant braquage (Seul toi)"}
        Cut_Crew2          = Cut_Crew2_list[current_language]
        Cut_Crew3          = Separator_text
    -- Mode
        Heist_difficulty_list    = {}
        Heist_difficulty_list_1  = {"Normal","Normal"}
        Heist_difficulty_list_2  = {"Hard","Dur"}
        Heist_difficulty_list[1] = Heist_difficulty_list_1[current_language]
        Heist_difficulty_list[2] = Heist_difficulty_list_2[current_language]
    -- Other
        Extars_Submenu_list = {"During heist","Pendant braquage"}
        Extars_Submenu      = Extars_Submenu_list[current_language]
----



-- B_Casino.lua
Casino_Submenu_List = {"Casino heist","Braquage du casino"}
Casino_Submenu      = Casino_Submenu_List[current_language]
-- Lists and Variables
    -- Casino_Setup_Missions_List_1
        Casino_Setup_Missions_List_1    = {}
        Casino_Setup_Missions_List_1_0  = {"Vault content →","Contenu du coffre →"}
        Casino_Setup_Missions_List_1_1  = {"Vault keycard →","Carte du coffre →"}
        Casino_Setup_Missions_List_1_2  = {"Weapons collected →","Armes collectés →"}
        Casino_Setup_Missions_List_1_3  = {"Vehicles collected →","Vehicules collectés →"}
        Casino_Setup_Missions_List_1_4  = {"Hacking device →","Appareil de piratage →"}
        Casino_Setup_Missions_List_1_5  = {"Nano drone →","Nano drone →"}
        Casino_Setup_Missions_List_1_6  = {"Vault laser →","Laser pour coffre →"}
        Casino_Setup_Missions_List_1_7  = {"Vault drills →","Perceuse pour coffre →"}
        Casino_Setup_Missions_List_1_8  = {"Vault explosives →","Explosif pour Coffre →"}
        Casino_Setup_Missions_List_1_9  = {"Breaching charges →","Charges explosives →"}
        Casino_Setup_Missions_List_1[0] = Casino_Setup_Missions_List_1_0[current_language]
        Casino_Setup_Missions_List_1[1] = Casino_Setup_Missions_List_1_1[current_language]
        Casino_Setup_Missions_List_1[2] = Casino_Setup_Missions_List_1_2[current_language]
        Casino_Setup_Missions_List_1[3] = Casino_Setup_Missions_List_1_3[current_language]
        Casino_Setup_Missions_List_1[4] = Casino_Setup_Missions_List_1_4[current_language]
        Casino_Setup_Missions_List_1[5] = Casino_Setup_Missions_List_1_5[current_language]
        Casino_Setup_Missions_List_1[6] = Casino_Setup_Missions_List_1_6[current_language]
        Casino_Setup_Missions_List_1[7] = Casino_Setup_Missions_List_1_7[current_language]
        Casino_Setup_Missions_List_1[8] = Casino_Setup_Missions_List_1_8[current_language]
        Casino_Setup_Missions_List_1[9] = Casino_Setup_Missions_List_1_9[current_language]
    -- Casino_Setup_Missions_List_0
        Casino_Setup_Missions_List_0     = {}
        Casino_Setup_Missions_List_0_1   = {"Patrol routes         ","Routes de patrouille"}
        Casino_Setup_Missions_List_0_2   = {"Duggan shipments      ","Chargemnts Dugans"}
        Casino_Setup_Missions_List_0_3   = {"Infiltration suit     ","Tenues d'infiltrations"}
        Casino_Setup_Missions_List_0_4   = {"Power drills          ","Perceuses"}
        Casino_Setup_Missions_List_0_5   = {"EMP device            ","Appareil IEM"}
        Casino_Setup_Missions_List_0_6   = {"Gunman decoy          ","Leure"}
        Casino_Setup_Missions_List_0_7   = {"Clean vehicle         ","Vehicules propres"}
        Casino_Setup_Missions_List_0_8   = {"Bugstars van          ","Van Bugstars"}
        Casino_Setup_Missions_List_0_9   = {"Plant trash           ","Planter les poubelles"}
        Casino_Setup_Missions_List_0_10  = {"Maintainance gear     ","Outilages de maintenance"}
        Casino_Setup_Missions_List_0_11  = {"Maintainance van      ","Van de maintenance"}
        Casino_Setup_Missions_List_0_12  = {"Grouppe Sechs van     ","Van de Grouppe"}
        Casino_Setup_Missions_List_0_13  = {"Grouppe Sechs gear    ","Outilages de Grouppe"}
        Casino_Setup_Missions_List_0_14  = {"[!]Yung ancestors car ","Voiture de Yung"}
        Casino_Setup_Missions_List_0_15  = {"[!]Yung ancestors gear","Tenues de Yung"}
        Casino_Setup_Missions_List_0_16  = {"Noose gear            ","Déguisement du NOOSE"}
        Casino_Setup_Missions_List_0_17  = {"Fire fighter gear     ","Déguisement des pompiers"}
        Casino_Setup_Missions_List_0_19  = {"Boring machine        ","Machine de perçage"}
        Casino_Setup_Missions_List_0_20  = {"Reinforced armor      ","Armure réinforcé"}
        Casino_Setup_Missions_List_0[1]  = Casino_Setup_Missions_List_0_1[current_language]
        Casino_Setup_Missions_List_0[2]  = Casino_Setup_Missions_List_0_2[current_language]
        Casino_Setup_Missions_List_0[3]  = Casino_Setup_Missions_List_0_3[current_language]
        Casino_Setup_Missions_List_0[4]  = Casino_Setup_Missions_List_0_4[current_language]
        Casino_Setup_Missions_List_0[5]  = Casino_Setup_Missions_List_0_5[current_language]
        Casino_Setup_Missions_List_0[6]  = Casino_Setup_Missions_List_0_6[current_language]
        Casino_Setup_Missions_List_0[7]  = Casino_Setup_Missions_List_0_7[current_language]
        Casino_Setup_Missions_List_0[8]  = Casino_Setup_Missions_List_0_8[current_language]
        Casino_Setup_Missions_List_0[9]  = Casino_Setup_Missions_List_0_9[current_language]
        Casino_Setup_Missions_List_0[10] = Casino_Setup_Missions_List_0_10[current_language]
        Casino_Setup_Missions_List_0[11] = Casino_Setup_Missions_List_0_11[current_language]
        Casino_Setup_Missions_List_0[12] = Casino_Setup_Missions_List_0_12[current_language]
        Casino_Setup_Missions_List_0[13] = Casino_Setup_Missions_List_0_13[current_language]
        Casino_Setup_Missions_List_0[14] = Casino_Setup_Missions_List_0_14[current_language]
        Casino_Setup_Missions_List_0[15] = Casino_Setup_Missions_List_0_15[current_language]
        Casino_Setup_Missions_List_0[16] = Casino_Setup_Missions_List_0_16[current_language]
        Casino_Setup_Missions_List_0[17] = Casino_Setup_Missions_List_0_17[current_language]
        Casino_Setup_Missions_List_0[19] = Casino_Setup_Missions_List_0_19[current_language]
        Casino_Setup_Missions_List_0[20] = Casino_Setup_Missions_List_0_20[current_language]
    -- Casino_Approch_List
        Casino_Approch_List     = {}
        Casino_Approch_List_1   = {"Silent n Sneaky","Furtive"}
        Casino_Approch_List_2   = {"Silent n Sneaky-HARD","Furtive-HARD"}
        Casino_Approch_List_3   = {"The Big CON","Rusée"}
        Casino_Approch_List_4   = {"The Big CON-HARD","Rusée-HARD"}
        Casino_Approch_List_5   = {"Aggressive","En force"}
        Casino_Approch_List_6   = {"Aggressive-HARD","En force-HARD"}
        Casino_Approch_List[1]  = Casino_Approch_List_1[current_language]
        Casino_Approch_List[2]  = Casino_Approch_List_2[current_language]
        Casino_Approch_List[3]  = Casino_Approch_List_3[current_language]
        Casino_Approch_List[4]  = Casino_Approch_List_4[current_language]
        Casino_Approch_List[5]  = Casino_Approch_List_5[current_language]
        Casino_Approch_List[6]  = Casino_Approch_List_6[current_language]
        Casino_Approch_List[-1] = Unselected_text
    -- Casino_Target_List
        Casino_Target_List    = {}
        Casino_Target_List_0  = {"Cash","Argent"}
        Casino_Target_List_1  = {"Gold","Or"}
        Casino_Target_List_2  = {"Artwork","Peintures"}
        Casino_Target_List_3  = {"Diamonds","Diamands"}
        Casino_Target_List[0] = Casino_Target_List_0[current_language]
        Casino_Target_List[1] = Casino_Target_List_1[current_language]
        Casino_Target_List[2] = Casino_Target_List_2[current_language]
        Casino_Target_List[3] = Casino_Target_List_3[current_language]
        
    -- Misc
        Casino_Hacker_List    = {}
        Casino_Hacker_List[0] = Unselected_text
        Casino_Mask_List      = {}
        Casino_Mask_List[0]   = Unselected_text

-- Casino Setup
    Casino_Setup_Submenu_List      = {"Casino setup","Préparation pour le casino"}
    Casino_Setup_Submenu           = Casino_Setup_Submenu_List[current_language]
    Casino_Setup_Mode_List         = {"Go to finale →","Aller au braquage →"}
    Casino_Setup_Mode              = Casino_Setup_Mode_List[current_language]
    Casino_Setup_Targetchoise_list = {"Choose target →","Choisir la cible →"}
    Casino_Setup_Targetchoise      = Casino_Setup_Targetchoise_list[current_language]
-- Casino Approach
    Casino_Approach_Setmode_list = {"Set mode →","Mettre le mode →"}
    Casino_Approach_Setmode      = Casino_Approach_Setmode_list[current_language]
    Casino_Approach_Choise_list  = {"Approach →","Approche →"}
    Casino_Approach_Choice       = Casino_Approach_Choise_list[current_language]
    -- Casino Approach Settings
        Casino_Approach_Settings_Silentnsneaky_list           = {"Silent and Sneaky settings","Paramétre: Furtive"}
        Casino_Approach_Settings_Silentnsneaky                = Casino_Approach_Settings_Silentnsneaky_list[current_language]
        Casino_Approach_Settings_Thebigcon_list               = {"The big con settings","Paramétre: Rusée"}
        Casino_Approach_Settings_Thebigcon                    = Casino_Approach_Settings_Thebigcon_list[current_language]
        Casino_Approach_Settings_Thebigcon_entrydesguise_list = {"↓ Entry disguise ↓","↓ Deguisement d'entrée ↓"}
        Casino_Approach_Settings_Thebigcon_entrydesguise      = Casino_Approach_Settings_Thebigcon_entrydesguise_list[current_language]
        Casino_Approach_Settings_Thebigcon_exitdesguise_list  = {"↓ Exit disguise ↓","↓ Deguisement de sortie ↓"}
        Casino_Approach_Settings_Thebigcon_exitdesguise       = Casino_Approach_Settings_Thebigcon_exitdesguise_list[current_language]
        Casino_Approach_Settings_Aggresive_list               = {"Aggresive settings","Paramétre: En force"}
        Casino_Approach_Settings_Aggresive                    = Casino_Approach_Settings_Aggresive_list[current_language]
        Casino_Approach_Settings_Submenu_list                 = {"Approach settings","Paramétre d'approche"}
        Casino_Approach_Settings_Submenu                      = Casino_Approach_Settings_Submenu_list[current_language]
-- Support Crew
    -- Hacker
        Casino_Crew_Hacker_list      = {"Choose hacker →","Choisir hacker →"}
        Casino_Crew_Hacker           = Casino_Crew_Hacker_list[current_language]
        Casino_Crew_Hacker_Only_list = {"hacker","Hacker"}
        Casino_Crew_Hacker_Only      = Casino_Crew_Hacker_Only_list[current_language]
    -- Gunman
        Casino_Crew_Gunman_Submenu_list       = {"Gunman and weapon","Armurier et armes"}
        Casino_Crew_Gunman_Submenu            = Casino_Crew_Gunman_Submenu_list[current_language]
        Casino_Crew_Gunman_Only_list          = {"Gunman","Armurier"}
        Casino_Crew_Gunman_Only               = Casino_Crew_Gunman_Only_list[current_language]
        Casino_Crew_Gunman_Choise_list        = {"Choose one","Choisis-en un"}
        Casino_Crew_Gunman_Choise             = Casino_Crew_Gunman_Choise_list[current_language]
        Casino_Crew_Gunman_MicroSMG_list      = {"Micro SMG","Pistolet mitrailleur"}
        Casino_Crew_Gunman_MicroSMG           = Casino_Crew_Gunman_MicroSMG_list[current_language]
        Casino_Crew_Gunman_Machinepistol_list = {"Machine pistol","Pistolet performant"}
        Casino_Crew_Gunman_Machinepistol      = Casino_Crew_Gunman_Machinepistol_list[current_language]
        Casino_Crew_Gunman_Shotgun_list       = {"Shotgun","Fusil a pompe"}
        Casino_Crew_Gunman_Shotgun            = Casino_Crew_Gunman_Shotgun_list[current_language]
        Casino_Crew_Gunman_Rifle_list         = {"Rifle","Fusil d'assualt"}
        Casino_Crew_Gunman_Rifle              = Casino_Crew_Gunman_Rifle_list[current_language]
        Casino_Crew_Gunman_ShotgunMKII_list   = {"MkII shotgun","Fusil a pompe MkII"}
        Casino_Crew_Gunman_ShotgunMKII        = Casino_Crew_Gunman_ShotgunMKII_list[current_language]
        Casino_Crew_Gunman_RifleMKII_list     = {"MKII rifle","Fusil d'assault MkII"}
        Casino_Crew_Gunman_RifleMKII          = Casino_Crew_Gunman_RifleMKII_list[current_language]
    -- Driver
        Casino_Crew_Driver_Submenu_list = {"Driver and car","Conducteur et voiture"}
        Casino_Crew_Driver_Submenu      = Casino_Crew_Driver_Submenu_list[current_language]
        Casino_Crew_Driver_Only_list    = {"Driver","Conducteur"}
        Casino_Crew_Driver_Only         = Casino_Crew_Driver_Only_list[current_language]
        Casino_Crew_Driver_Choise_list  = {"Choose one (with wanted vehicle)","Choisir un (avec le vehicule)"}
        Casino_Crew_Driver_Choise       = Casino_Crew_Driver_Choise_list[current_language]
        Casino_Crew_Driver_Bikes_list   = {" (Bikes)"," (Motos)"}
        Casino_Crew_Driver_Bikes        = Casino_Crew_Driver_Bikes_list[current_language]
    -- Masks
        Casino_Crew_Mask_list = {"Choose mask →","Choisir un masque →"}
        Casino_Crew_Mask      = Casino_Crew_Mask_list[current_language]
-- Common Missions
        Casino_Setup_Common_Submenu_List   = {"Common missions","Missions communes"}
        Casino_Setup_Common_Submenu        = Casino_Setup_Common_Submenu_List[current_language]
        Casino_Setup_Common_Passlevel_List = {"Security pass level →","Niveau des pass de secutite →"}
        Casino_Setup_Common_Passlevel      = Casino_Setup_Common_Passlevel_List[current_language]
        Casino_Setup_Common_Shipment       = ""
        Casino_Setup_Common_Shipment_list  = {"   Shipment destroyed","   Quantité détruit"}
        Casino_Setup_Common_Shipment       = Casino_Setup_Common_Shipment_list[current_language]
-- Casino Cut
    Casino_Cut_Submenu_List = {"Casino cut","Pourcentage pour le casino"}
    Casino_Cut_Submenu      = Casino_Cut_Submenu_List[current_language]
-- Casino Extras
    Casino_Extras_Keypad_List      = {"Complete keypad","Completer le clavier numérique"}
    Casino_Extras_Keypad           = Casino_Extras_Keypad_List[current_language]
    Casino_Extras_Fingerprint_List = {"Complete fingerprint","Completer l'empreinte"}
    Casino_Extras_Fingerprint      = Casino_Extras_Fingerprint_List[current_language]
    Casino_Extras_DrillVault_List  = {"Drill vault door","Forer le coffre"}
    Casino_Extras_DrillVault       = Casino_Extras_DrillVault_List[current_language]
----



-- C_Cayo.lua
Cayo_Submenu_list = {"Cayo perico heist","Braquage de cayo perico"}
Cayo_Submenu      = Cayo_Submenu_list[current_language]
-- Lists and Variables
    -- Global Cayo
        Cayo_Maindock_list      = {"Main dock","Dock Principal"}
        Cayo_NearMaindock_list  = {"Near Main dock","A coté du Dock Principal"}
        Cayo_InnerMaindock_list = {"Inner Main dock","Dock Principal interieur"}
        Cayo_Farmland_list      = {"Farmland","Champs"}
        Cayo_Northdock_list     = {"North dock","Dock nord"}
        Cayo_Airstrip_list      = {"Airstip","Piste d'atterisage"}
        Cayo_Lighthouse_list    = {"Lighthouse","Phare"}
        Cayo_NearMaindock       = Cayo_NearMaindock_list[current_language]
        Cayo_Maindock           = Cayo_Maindock_list[current_language]
        Cayo_InnerMaindock      = Cayo_InnerMaindock_list[current_language]
        Cayo_Farmland           = Cayo_Farmland_list[current_language]
        Cayo_Northdock          = Cayo_Northdock_list[current_language]
        Cayo_Airstrip           = Cayo_Airstrip_list[current_language]
        Cayo_Lighthouse         = Cayo_Lighthouse_list[current_language]
    -- Mission List & POI
        Cayo_Missions_List     = {}
        Cayo_Missions_List_0   = {"Gather Intel*","Rassemlez des infos"}
        Cayo_Missions_List_1   = {"Kosatka Submarine →","Sousmarin Kosatka →"}
        Cayo_Missions_List_2   = {"RO-86 Alkonost →","RO-86 Alkonost →"}
        Cayo_Missions_List_3   = {"Velum 5-Seater →","Velum 5-places →"}
        Cayo_Missions_List_4   = {"Stealth Annihilator →","Annihilator Furtif →"}
        Cayo_Missions_List_5   = {"Kurtz Patrol Boat →","Bateau de patrouille →"}
        Cayo_Missions_List_6   = {"Longifin Boat →","Bateau Longfin →"}
        Cayo_Missions_List_7   = {"Pilot (Alkonost,Annihilator) →","Pilote (Alkonost,Annihilator) →"}
        Cayo_Missions_List_8   = {"Demolition Charges →","Charges de démolition →"}
        Cayo_Missions_List_9   = {"Cutting Torch* →","Torche pour Découper* →"}
        Cayo_Missions_List_10  = {"Plasma Cutter* →","Découpeur plasma* →"}
        Cayo_Missions_List_11  = {"Fingerprint Cloner* →","Cloneur d'empreinte* →"}
        Cayo_Missions_List_12  = {"Approach Weapon* →","Amres pour Approche* →"}
        Cayo_Missions_List_13  = {"Weapons Disruption →","Armes perturb&"}
        Cayo_Missions_List_14  = {"Armor Disruption →","Armure perturbé"}
        Cayo_Missions_List_15  = {"Air Support Disruption →","Suppot Aérien perturbé"}
        Cayo_Missions_List[0]  = Cayo_Missions_List_0[current_language]
        Cayo_Missions_List[1]  = Cayo_Missions_List_1[current_language]
        Cayo_Missions_List[2]  = Cayo_Missions_List_2[current_language]
        Cayo_Missions_List[3]  = Cayo_Missions_List_3[current_language]
        Cayo_Missions_List[4]  = Cayo_Missions_List_4[current_language]
        Cayo_Missions_List[5]  = Cayo_Missions_List_5[current_language]
        Cayo_Missions_List[6]  = Cayo_Missions_List_6[current_language]
        Cayo_Missions_List[7]  = Cayo_Missions_List_7[current_language]
        Cayo_Missions_List[8]  = Cayo_Missions_List_8[current_language]
        Cayo_Missions_List[9]  = Cayo_Missions_List_9[current_language]
        Cayo_Missions_List[10] = Cayo_Missions_List_10[current_language]
        Cayo_Missions_List[11] = Cayo_Missions_List_11[current_language]
        Cayo_Missions_List[12] = Cayo_Missions_List_12[current_language]
        Cayo_Missions_List[13] = Cayo_Missions_List_13[current_language]
        Cayo_Missions_List[14] = Cayo_Missions_List_14[current_language]
        Cayo_Missions_List[15] = Cayo_Missions_List_15[current_language]
    -- Loots
        Cayo_set_loot_compound_table_list    = {}
        Cayo_Choose_Target                   = {}
        Cayo_set_loot_outside_table_list     = {}
        Cayo_set_loot_compound_table_list_2  = {"Cash","Argent"}
        Cayo_set_loot_compound_table_list_1  = {"Gold","Or"}
        Cayo_set_loot_outside_table_list_2   = {"Cash","Argent"}
        Cayo_set_loot_outside_table_list_1   = {"Coke","Cocaïne"}
        Cayo_Choose_Target_0                 = {"Sinsimito Tequila","Sinsimito Tequila"}
        Cayo_set_loot_outside_table_list_3   = {"Weed","Weed"}
        Cayo_Choose_Target_1                 = {"Ruby Necklace","Colier de ruby"}
        Cayo_Choose_Target_2                 = {"Bearer Bonds","Les bons au porteur"}
        Cayo_Choose_Target_3                 = {"Pink Diamond","Diamant rose"}
        Cayo_Choose_Target_5                 = {"Panther Statue","Statue de la panthére"}
        Cayo_set_loot_compound_table_list[0] = Empty_text
        Cayo_set_loot_compound_table_list[1] = Cayo_set_loot_compound_table_list_1[current_language]
        Cayo_set_loot_compound_table_list[2] = Cayo_set_loot_compound_table_list_2[current_language]
        Cayo_set_loot_outside_table_list[0]  = Empty_text
        Cayo_set_loot_outside_table_list[1]  = Cayo_set_loot_outside_table_list_1[current_language]
        Cayo_set_loot_outside_table_list[2]  = Cayo_set_loot_outside_table_list_2[current_language]
        Cayo_set_loot_outside_table_list[3]  = Cayo_set_loot_outside_table_list_3[current_language]
        Cayo_Choose_Target[-1]               = Notset_text
        Cayo_Choose_Target[0]                = Cayo_Choose_Target_0[current_language]
        Cayo_Choose_Target[1]                = Cayo_Choose_Target_1[current_language]
        Cayo_Choose_Target[2]                = Cayo_Choose_Target_2[current_language]
        Cayo_Choose_Target[3]                = Cayo_Choose_Target_3[current_language]
        Cayo_Choose_Target[5]                = Cayo_Choose_Target_5[current_language]
    -- Cayo_Loot_point
        Cayo_Setloot_Table1_list    = {"Table 1     →","Table 1     →"}
        Cayo_Setloot_Table2_list    = {"Table 2     →","Table 2     →"}
        Cayo_Setloot_Table3_list    = {"Table 3     →","Table 3     →"}
        Cayo_Setloot_Table1         = Cayo_Setloot_Table1_list[current_language]
        Cayo_Setloot_Table2         = Cayo_Setloot_Table2_list[current_language]
        Cayo_Setloot_Table3         = Cayo_Setloot_Table3_list[current_language]
        Cayo_Setloot_Painting1_list = {"Painting   →","Tableau    →"}
        Cayo_Setloot_Painting2_list = {"Painting 2 →","Tableau 2  →"}
        Cayo_Setloot_Painting1      = Cayo_Setloot_Painting1_list[current_language]
        Cayo_Setloot_Painting2      = Cayo_Setloot_Painting2_list[current_language]
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
        Cayo_Point_of_interest_List     = {}
        Cayo_Point_of_interest_List_7   = {"WatchTower Near Compound","Tour de garde a coté de la cour"}
        Cayo_Point_of_interest_List_12  = {"   Weapon Suppressor","   Silcencieux"}
        Cayo_Point_of_interest_List_13  = {"Cutting Powder","Poudre pour couper"}
        Cayo_Point_of_interest_List_14  = {"Power Station","Station éléctrique"}
        Cayo_Point_of_interest_List_15  = {"Supply Truck","Camion ravitailleur"}
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
        Cayo_Interest_point    = {}
        Cayo_Interest_point_5  = {"Outside Compoud","Hors de la cour"}
        Cayo_Interest_point[0] = None_text
        Cayo_Interest_point[1] = Cayo_Airstrip
        Cayo_Interest_point[2] = Cayo_Northdock
        Cayo_Interest_point[3] = Cayo_NearMaindock
        Cayo_Interest_point[4] = Cayo_Maindock
        Cayo_Interest_point[5] = Cayo_Interest_point_5[current_language]

    -- Weapons
        Cayo_Choose_Weapon    = {}
        Cayo_Choose_Weapon_1  = {"Aggressor","Aggreseur"}
        Cayo_Choose_Weapon_2  = {"Conspirator","Conspirateur"}
        Cayo_Choose_Weapon_3  = {"Crackshot","Fine Gâchette"}
        Cayo_Choose_Weapon_4  = {"Saboteur","Saboteur"}
        Cayo_Choose_Weapon_5  = {"Marksman","Tireur d'élite"}
        Cayo_Choose_Weapon[0] = Notset_text
        Cayo_Choose_Weapon[1] = Cayo_Choose_Weapon_1[current_language]
        Cayo_Choose_Weapon[2] = Cayo_Choose_Weapon_2[current_language]
        Cayo_Choose_Weapon[3] = Cayo_Choose_Weapon_3[current_language]
        Cayo_Choose_Weapon[4] = Cayo_Choose_Weapon_4[current_language]
        Cayo_Choose_Weapon[5] = Cayo_Choose_Weapon_5[current_language]
-- Cayo Setup
    -- Auto
        Cayo_Seup_Instant_list   = {"Instant Setup","Préparation Instant"}
        Cayo_Seup_Instant        = Cayo_Seup_Instant_list[current_language]
        Cayo_Setup_Hardmode_list = {"Set heist into hard mode","Mettre le mode dur"}
        Cayo_Setup_Hardmode      = Cayo_Setup_Hardmode_list[current_language]
        Cayo_Setup_Maxing_list   = {"Max for (yourCut)→","Max pour (ta part)→"}
        Cayo_Setup_Maxing        = Cayo_Setup_Maxing_list[current_language]
    -- Manual
        Cayo_Setup_Target_list           = {"Primary Target →","Cible Principale →"}
        Cayo_Setup_Target                = Cayo_Setup_Target_list[current_language]
        Cayo_Setup_ChooseWeapon_list     = {"Choose Weapon* →","Choisir Armes* →"}
        Cayo_Setup_ChooseWeapon          = Cayo_Setup_ChooseWeapon_list[current_language]
        Cayo_Setup_Approach_Submenu_list = {"Approach Vehicle*","Vehicule d'approche* →"}
        Cayo_Setup_Approach_Submenu      = Cayo_Setup_Approach_Submenu_list[current_language]
        Cayo_Setup_Approach_Choose_list  = {"__________Choose at least one_________","___________Choisir Au moins un__________"}
        Cayo_Setup_Approach_Choose       = Cayo_Setup_Approach_Choose_list[current_language]
        Refresh_Kosatka_Board_list       = {"Restart kosatka board","Redémarer le table du kosatka"}
        Refresh_Kosatka_Board            = Refresh_Kosatka_Board_list[current_language]
    -- Disruption
        Cayo_Setup_MissionAndWeapons_Submenu_list             = {"Disruption And Weapons*","Armes et Pértubation"}
        Cayo_Setup_MissionAndWeapons_Submenu                  = Cayo_Setup_MissionAndWeapons_Submenu_list[current_language]
        Cayo_Setup_MissionAndWeapons_ChooseWeapon_list        = {"Choose Weapon →","Choisir Arme →"}
        Cayo_Setup_MissionAndWeapons_ChooseWeapon             = Cayo_Setup_MissionAndWeapons_ChooseWeapon_list[current_language]
        Cayo_Setup_MissionAndWeapons_PercetangeDestroyed_list = {"   Quantity Destroyed","   Quantité Détruite"}
        Cayo_Setup_MissionAndWeapons_PercetangeDestroyed      = Cayo_Setup_MissionAndWeapons_PercetangeDestroyed_list[current_language]
        Cayo_Setup_Submenu_list                               = {"Cayo Setup","Preparation de Cayo"}
        Cayo_Setup_Submenu                                    = Cayo_Setup_Submenu_list[current_language]
    -- POI Stuff
        Cayo_Point_of_interest_submenu_list              = {"Points of interests","Points d'interet"}
        Cayo_Point_of_interest_grappling_submenu_list    = {"Put Grappling Eq in/near...","Grapin dans/a coté de..."}
        Cayo_Point_of_interest_guardclothes_submenu_list = {"Put Guard Clothes in/near...","Déguisement de guarde dans/a coté de..."}
        Cayo_Point_of_interest_boltcutters_submenu_list  = {"Bolt Cutters in/near...","Coupe-Grille dans/a coté de..."}
        Cayo_Point_of_interest_submenu                   = Cayo_Point_of_interest_submenu_list[current_language]
        Cayo_Point_of_interest_grappling_submenu         = Cayo_Point_of_interest_grappling_submenu_list[current_language]
        Cayo_Point_of_interest_guardclothes_submenu      = Cayo_Point_of_interest_guardclothes_submenu_list[current_language]
        Cayo_Point_of_interest_boltcutters_submenu       = Cayo_Point_of_interest_boltcutters_submenu_list[current_language]
        Cayo_Point_of_interest_supplytruck_list          = {"Supply truck in","Camion ravitailleur dans"}
        Cayo_Point_of_interest_scopeout_list             = {"ScopeOut POIs","Repérer les POIs"}
        Cayo_Point_of_interest_supplytruck               = Cayo_Point_of_interest_supplytruck_list[current_language]
        Cayo_Point_of_interest_scopeout                  = Cayo_Point_of_interest_scopeout_list[current_language]
-- Cayo Set Loot
    Cayo_Setloot_Submenu_list = {"Set loot","Définir le loot"}
    Cayo_Setloot_Submenu      = Cayo_Setloot_Submenu_list[current_language]
    -- IN
        Cayo_Setloot_Compound_in_list  = {"_________↓ Inside Compound ↓_________","_________↓ L'interieur de la cour ↓_________"}
        Cayo_Setloot_Compound_in       = Cayo_Setloot_Compound_in_list[current_language]
        Cayo_Setloot_Room1_list        = {"Room 1 (North)","Piéce 1 (Nord)"}
        Cayo_Setloot_Room2_list        = {"Room 2 (Center)","Piéce 2 (Centre)"}
        Cayo_Setloot_Room3_list        = {"Room 3 (South)","Piéce 3 (Sud)"}
        Cayo_Setloot_Basement_list     = {"Basement","Sous-Sol"}
        Cayo_Setloot_Office_list       = {"Rubio's office","Bureau de Rubio"}
        Cayo_Setloot_Room1             = Cayo_Setloot_Room1_list[current_language]
        Cayo_Setloot_Room2             = Cayo_Setloot_Room2_list[current_language]
        Cayo_Setloot_Room3             = Cayo_Setloot_Room3_list[current_language]
        Cayo_Setloot_Basement          = Cayo_Setloot_Basement_list[current_language]
        Cayo_Setloot_Office            = Cayo_Setloot_Office_list[current_language]
    -- OUT
        Cayo_Setloot_Compound_out_list  = {"_________↓ Outside Compound ↓_________","_________↓ L'extérieur de la cour ↓_________"}
        Cayo_Setloot_Compound_out       = Cayo_Setloot_Compound_out_list[current_language]
        Cayo_Setloot_Shed_list          = {"↓ Shed ↓","↓ Barraque ↓"}
        Cayo_Setloot_Shed2_list         = {"↓ Shed 2 ↓","↓ Barraque 2 ↓"}
        Cayo_Setloot_Lockup_list        = {"↓ Lock up ↓","↓ Porte Vérouillée ↓"}
        Cayo_Setloot_HangarTop_list     = {"↓ Hangar Bottom ↓","↓ Bas du Hangar ↓"}
        Cayo_Setloot_HangarBottom_list  = {"↓ Hangar Top ↓","↓ Haut du Hangar ↓"}
        Cayo_Setloot_Warehouse_list     = {"↓ Warehouse ↓","↓ L'entrepôt ↓"}
        Cayo_Setloot_Shed               = Cayo_Setloot_Shed_list[current_language]
        Cayo_Setloot_Shed2              = Cayo_Setloot_Shed2_list[current_language]
        Cayo_Setloot_Lockup             = Cayo_Setloot_Lockup_list[current_language]
        Cayo_Setloot_HangarTop          = Cayo_Setloot_HangarTop_list[current_language]
        Cayo_Setloot_HangarBottom       = Cayo_Setloot_HangarBottom_list[current_language]
        Cayo_Setloot_Warehouse          = Cayo_Setloot_Warehouse_list[current_language]
-- Cayo Cut
    Cayo_Cut_Submenu_list = {"Cayo Cut","Pourcentage pour Cayo"}
    Cayo_Cut_Submenu      = Cayo_Cut_Submenu_list[current_language]
    Cayo_Cut_Pavel_list   = {"Pavel","Pavel"}
    Cayo_Cut_Pavel        = Cayo_Cut_Pavel_list[current_language]
    Cayo_Fencing_Fee_list = {"Fencing fee","Frais du porteur"}
    Cayo_Fencing_Fee      = Cayo_Fencing_Fee_list[current_language]
-- Cayo Extras
    Cayo_Extras_Sewer_list       = {"Cut Sewer Fence","Couper la grille des égôuts"}
    Cayo_Extras_Sewer            = Cayo_Extras_Sewer_list[current_language]
    Cayo_Extras_Fingerprint_list = {"Clone Fingerprint","Cloner l'empreinte"}
    Cayo_Extras_Fingerprint      = Cayo_Extras_Fingerprint_list[current_language]
    Cayo_Extras_Cutglass_list    = {"Cut Glass","Couper le verre"}
    Cayo_Extras_Cutglass         = Cayo_Extras_Cutglass_list[current_language]
    Cayo_Extras_Bag_list         = {"Bag Cap →","Capacité du sac →"}
    Cayo_Extras_Bag              = Cayo_Extras_Bag_list[current_language]
----



-- D_Doomsday&Appartement.lua
-- Doomsday
    Doomsday_Menu_list       = {"Doomsday","Fin du monde"}
    Doomsday_Menu            = Doomsday_Menu_list[current_language]
    -- Lists and Variables
        Doomsday_Heist_Prep_List     = {}
        Doomsday_Heist_Prep_List_00  = {"Paramedic Equipment","Equipement médical"}
        Doomsday_Heist_Prep_List_01  = {"Deluxos","Deluxos"}
        Doomsday_Heist_Prep_List_02  = {"Akula","Akula"}
        Doomsday_Heist_Prep_List_03  = {"Key cards","Cartes d'accés"}
        Doomsday_Heist_Prep_List_04  = {"ULP Intel","Information d'ULP"}
        Doomsday_Heist_Prep_List_05  = {"Riot control van","Fourgon anit-émeute"}
        Doomsday_Heist_Prep_List_06  = {"Stormbergs","Strombergs"}
        Doomsday_Heist_Prep_List_07  = {"Torpedo ECH",""}
        Doomsday_Heist_Prep_List_08  = {"Marked cash","Argent marqué"}
        Doomsday_Heist_Prep_List_09  = {"Recon","Reconnaissance"}
        Doomsday_Heist_Prep_List_10  = {"Chernobog","Chernobog"}
        Doomsday_Heist_Prep_List_11  = {"Flight path","Chemin de vol"}
        Doomsday_Heist_Prep_List_12  = {"Test site intel","Information sur le site de test"}
        Doomsday_Heist_Prep_List_13  = {"Onboard computer","Ordinateur de bord"}
        Doomsday_Heist_Prep_List[00] = Doomsday_Heist_Prep_List_00[current_language]
        Doomsday_Heist_Prep_List[01] = Doomsday_Heist_Prep_List_01[current_language]
        Doomsday_Heist_Prep_List[02] = Doomsday_Heist_Prep_List_02[current_language]
        Doomsday_Heist_Prep_List[03] = Doomsday_Heist_Prep_List_03[current_language]
        Doomsday_Heist_Prep_List[04] = Doomsday_Heist_Prep_List_04[current_language]
        Doomsday_Heist_Prep_List[05] = Doomsday_Heist_Prep_List_05[current_language]
        Doomsday_Heist_Prep_List[06] = Doomsday_Heist_Prep_List_06[current_language]
        Doomsday_Heist_Prep_List[07] = Doomsday_Heist_Prep_List_07[current_language]
        Doomsday_Heist_Prep_List[08] = Doomsday_Heist_Prep_List_08[current_language]
        Doomsday_Heist_Prep_List[09] = Doomsday_Heist_Prep_List_09[current_language]
        Doomsday_Heist_Prep_List[10] = Doomsday_Heist_Prep_List_10[current_language]
        Doomsday_Heist_Prep_List[11] = Doomsday_Heist_Prep_List_11[current_language]
        Doomsday_Heist_Prep_List[12] = Doomsday_Heist_Prep_List_12[current_language]
        Doomsday_Heist_Prep_List[13] = Doomsday_Heist_Prep_List_13[current_language]
        Doomsday_Heist_Missions_List     = {}
        Doomsday_Heist_Missions_List_00  = {"Dead Courier","Courier"}
        Doomsday_Heist_Missions_List_01  = {"Signal Intercept","Interception du signal"}
        Doomsday_Heist_Missions_List_02  = {"ServerFarm","Data-center"}
        Doomsday_Heist_Missions_List_04  = {"Avenger","Avenger"}
        Doomsday_Heist_Missions_List_05  = {"Rescue ULP","Sauver ULP"}
        Doomsday_Heist_Missions_List_06  = {"Salvage Hard Drives","Recupérer les disque durs"}
        Doomsday_Heist_Missions_List_07  = {"Submarine Recon","Reconnaissance du sousmarin"}
        Doomsday_Heist_Missions_List_09  = {"Rescue Agent 14","Sauver Agent 14"}
        Doomsday_Heist_Missions_List_10  = {"Rescue ULP","Sauver ULP"}
        Doomsday_Heist_Missions_List_11  = {"Barrage","Barrage"}
        Doomsday_Heist_Missions_List_12  = {"Khanjali","Khanjali"}
        Doomsday_Heist_Missions_List_13  = {"Air Defences","Défense aérienne"}
        Doomsday_Heist_Missions_List[00] = Doomsday_Heist_Missions_List_00[current_language]
        Doomsday_Heist_Missions_List[01] = Doomsday_Heist_Missions_List_01[current_language]
        Doomsday_Heist_Missions_List[02] = Doomsday_Heist_Missions_List_02[current_language]
        Doomsday_Heist_Missions_List[04] = Doomsday_Heist_Missions_List_04[current_language]
        Doomsday_Heist_Missions_List[05] = Doomsday_Heist_Missions_List_05[current_language]
        Doomsday_Heist_Missions_List[06] = Doomsday_Heist_Missions_List_06[current_language]
        Doomsday_Heist_Missions_List[07] = Doomsday_Heist_Missions_List_07[current_language]
        Doomsday_Heist_Missions_List[09] = Doomsday_Heist_Missions_List_09[current_language]
        Doomsday_Heist_Missions_List[10] = Doomsday_Heist_Missions_List_10[current_language]
        Doomsday_Heist_Missions_List[11] = Doomsday_Heist_Missions_List_11[current_language]
        Doomsday_Heist_Missions_List[12] = Doomsday_Heist_Missions_List_12[current_language]
        Doomsday_Heist_Missions_List[13] = Doomsday_Heist_Missions_List_13[current_language]
        Doomsday_Heist_List     = {}
        Doomsday_Heist_List_01  = {"Data Breaches","Bréche de donées"}
        Doomsday_Heist_List_02  = {"Bogdan Problem","Codename: Bogdan"}
        Doomsday_Heist_List_03  = {"Doomsday Scenario","Scénario de la fin du monde"}
        Doomsday_Heist_List[01] = Doomsday_Heist_List_01[current_language]
        Doomsday_Heist_List[02] = Doomsday_Heist_List_02[current_language]
        Doomsday_Heist_List[03] = Doomsday_Heist_List_03[current_language]
        Doomsday_Missions_Status     = {}
        Doomsday_Missions_Status_00  = {"Incomplete","Incompléte"}
        Doomsday_Missions_Status_01  = {"Completed","Faite"}
        Doomsday_Missions_Status_02  = {"Stolen","Volée"}
        Doomsday_Missions_Status_03  = {"Skipped","Pasée"}
        Doomsday_Missions_Status[00] = Doomsday_Missions_Status_00[current_language]
        Doomsday_Missions_Status[01] = Doomsday_Missions_Status_01[current_language]
        Doomsday_Missions_Status[02] = Doomsday_Missions_Status_02[current_language]
        Doomsday_Missions_Status[03] = Doomsday_Missions_Status_03[current_language]
    -- Doomsday Setup
        Doomsday_Setup_Submenu_list       = {"Doomsday setup","Préparation de fin du monde"}
        Doomsday_Setup_Submenu            = Doomsday_Setup_Submenu_list[current_language]
        Doomsday_Set_Act_list       = {"Set dommsday act","Définir l'acte"}
        Doomsday_Set_Act            = Doomsday_Set_Act_list[current_language]
        Doomsday_Instant_Setup_list       = {"Setup doomsday","Préparer fin du monde"}
        Doomsday_Instant_Setup            = Doomsday_Instant_Setup_list[current_language]
        Doomsday_Act_Name_list       = {"Act","Acte"}
        Doomsday_Act_Name            = Doomsday_Act_Name_list[current_language]
        Doomsday_Prep_list       = {"Prep → ","Prép → "}
        Doomsday_Prep            = Doomsday_Prep_list[current_language]
        Doomsday_Setup_list       = {"      Status of ","     Status de "}
        Doomsday_Setup            = Doomsday_Setup_list[current_language]
    -- Doomsday Cuts
        Doomsday_Cuts_Submenu_list       = {"Doomsday cuts","Pourcentage pour fin du monde"}
        Doomsday_Cuts_Submenu            = Doomsday_Cuts_Submenu_list[current_language]
-- Appartement
    Appartements_Submenu_list       = {"Appartement heists","Braquage des appartements"}
    Appartements_Submenu            = Appartements_Submenu_list[current_language]
    -- Lists and Variables
        Appartements_Fleeca_Preps      = {}
        Appartements_Prison_Preps      = {}
        Appartements_Humane_Preps      = {}
        Appartements_SeriesA_Preps     = {}
        Appartements_Pacific_Preps     = {}
        ---- Fleeca
            Appartements_Fleeca_Preps_1    = {"Scope out","Repérage"}
            Appartements_Fleeca_Preps_2    = {"Kuruma","Kuruma"}
            Appartements_Fleeca_Preps[1]   = Appartements_Fleeca_Preps_1[current_language]
            Appartements_Fleeca_Preps[2]   = Appartements_Fleeca_Preps_2[current_language]
        ---- Prison Break
            Appartements_Prison_Preps_1    = {"Plane","Avion"}
            Appartements_Prison_Preps_2    = {"Bus","Bus"}
            Appartements_Prison_Preps_3    = {"Station","Staion"}
            Appartements_Prison_Preps_4    = {"Wet work","Sale boulot"}
            Appartements_Prison_Preps[1]   = Appartements_Prison_Preps_1[current_language]
            Appartements_Prison_Preps[2]   = Appartements_Prison_Preps_2[current_language]
            Appartements_Prison_Preps[3]   = Appartements_Prison_Preps_3[current_language]
            Appartements_Prison_Preps[4]   = Appartements_Prison_Preps_4[current_language]
        ---- Humane labs
            Appartements_Humane_Preps_1    = {"Key codes","Codes d'accées"}
            Appartements_Humane_Preps_2    = {"Insurgents","Insurgents"}
            Appartements_Humane_Preps_3    = {"EMP","IEM"}
            Appartements_Humane_Preps_4    = {"Valkyrie","Valkyrie"}
            Appartements_Humane_Preps_5    = {"Deliver EMP","Livrer l'IEM"}
            Appartements_Humane_Preps[1]   = Appartements_Humane_Preps_1[current_language]
            Appartements_Humane_Preps[2]   = Appartements_Humane_Preps_2[current_language]
            Appartements_Humane_Preps[3]   = Appartements_Humane_Preps_3[current_language]
            Appartements_Humane_Preps[4]   = Appartements_Humane_Preps_4[current_language]
            Appartements_Humane_Preps[5]   = Appartements_Humane_Preps_5[current_language]
        ---- Series A
            Appartements_SeriesA_Preps_1   = {"Coke","Cocaîne"}
            Appartements_SeriesA_Preps_2   = {"Trash truck","Poubelle"}
            Appartements_SeriesA_Preps_3   = {"Bikers","Motards"}
            Appartements_SeriesA_Preps_4   = {"Weed","Weed"}
            Appartements_SeriesA_Preps_5   = {"Steal meth","Voler de la méth"}
            Appartements_SeriesA_Preps[1]  = Appartements_SeriesA_Preps_1[current_language]
            Appartements_SeriesA_Preps[2]  = Appartements_SeriesA_Preps_2[current_language]
            Appartements_SeriesA_Preps[3]  = Appartements_SeriesA_Preps_3[current_language]
            Appartements_SeriesA_Preps[4]  = Appartements_SeriesA_Preps_4[current_language]
            Appartements_SeriesA_Preps[5]  = Appartements_SeriesA_Preps_5[current_language]
        ---- Pacific Standard
            Appartements_Pacific_Preps_1   = {"Vans","Vans"}
            Appartements_Pacific_Preps_2   = {"Signal","Signal"}
            Appartements_Pacific_Preps_3   = {"Hack","Hack"}
            Appartements_Pacific_Preps_4   = {"Convoy","Convoi"}
            Appartements_Pacific_Preps_5   = {"Bikes","Motos"}
            Appartements_Pacific_Preps[1]  = Appartements_Pacific_Preps_1[current_language]
            Appartements_Pacific_Preps[2]  = Appartements_Pacific_Preps_2[current_language]
            Appartements_Pacific_Preps[3]  = Appartements_Pacific_Preps_3[current_language]
            Appartements_Pacific_Preps[4]  = Appartements_Pacific_Preps_4[current_language]
            Appartements_Pacific_Preps[5]  = Appartements_Pacific_Preps_5[current_language]
    -- Setup
        Appartements_Setup_Submenu_list       = {"Appartements Setup","Préparation pour appartements"}
        Appartements_Setup_Submenu            = Appartements_Setup_Submenu_list[current_language]
    -- Cuts
        Appartements_Cut_Submenu_list       = {"Appartements Cuts","Pourcentage des appartements"}
        Appartements_Cut_Submenu            = Appartements_Cut_Submenu_list[current_language]
----



-- E_Shapeshift.lua
Shapeshift_Submenu_list       = {"Shapeshift","Changeur d'apparence"}
Shapeshift_Submenu            = Shapeshift_Submenu_list[current_language]
-- Options
    Multiplayer_Option_List               = {"Turn Back Into →","Retourner en →"}
    Animal_Option_List                    = {"Animals →","Animaux →"}
    Cosplay_Option_List                   = {"Cosplay →","Cosplay →"}
    Birds_Option_List                     = {"Birds →","Oiseaux →"}
    Sea_Animals_Option_List               = {"Sea creature →","Animaux marins →"}
    Story_Female_Character_Option_List    = {"Story Female →","Histoire femme →"}
    Story_Male_Character_Option_List      = {"Story Male →","Histoire homme →"}
    Female_Character_Option_List          = {"Female Ped →","Femme →"}
    Male_Character_Option_List            = {"Male Ped →","Homme →"}
    Cutscene_Female_Character_Option_List = {"Cutscene Female →","Femme (Cinématique) →"}
    Cutscene_Male_Character_Option_List   = {"Cutscene Male →","Homme (Cinématique) →"}
    Gang_Female_Character_Option_List     = {"Gang Female →","Gang femme →"}
    Gang_Male_Character_Option_List       = {"Gang Male →","Gang homme →"}
    Law_Enforcer_Option_List              = {"Law enforcers →","Policier →"}
    Multiplayer_Option                    = Multiplayer_Option_List[current_language]
    Animal_Option                         = Animal_Option_List[current_language]
    Cosplay_Option                        = Cosplay_Option_List[current_language]
    Birds_Option                          = Birds_Option_List[current_language]
    Sea_Animals_Option                    = Sea_Animals_Option_List[current_language]
    Story_Female_Character_Option         = Story_Female_Character_Option_List[current_language]
    Story_Male_Character_Option           = Story_Male_Character_Option_List[current_language]
    Female_Character_Option               = Female_Character_Option_List[current_language]
    Male_Character_Option                 = Male_Character_Option_List[current_language]
    Cutscene_Female_Character_Option      = Cutscene_Female_Character_Option_List[current_language]
    Cutscene_Male_Character_Option        = Cutscene_Male_Character_Option_List[current_language]
    Gang_Female_Character_Option          = Gang_Female_Character_Option_List[current_language]
    Gang_Male_Character_Option            = Gang_Male_Character_Option_List[current_language]
    Law_Enforcer_Option                   = Law_Enforcer_Option_List[current_language]
----



-- F_Main.lua
Menu_Submenu_list     = {"Main menu","Menu principal"}
Menu_Submenu          = Menu_Submenu_list[current_language]
Settings_Submenu_list = {"Settings","Paramétre"}
Settings_Submenu      = Settings_Submenu_list[current_language]
-- List and Variables
    units_text    = {}
    units_text_1  = {"kilometres per hour","Kilométres par heures"}
    units_text_2  = {"metres per second","métres par secondes"}
    units_text_3  = {"miles per hour","miles par heures"}
    units_text_4  = {"feet per second","pieds par secondes"}
    units_text[1] = units_text_1[current_language]
    units_text[2] = units_text_2[current_language]
    units_text[3] = units_text_3[current_language]
    units_text[4] = units_text_4[current_language]
    Gender        = {}
    Gender_1      = {"Male","Homme"}
    Gender_2      = {"Female","Femme"}
    Gender[1]     = Gender_1[current_language]
    Gender[2]     = Gender_2[current_language]
    Achivement_List = {}
        Achivement_List_01  =  {"Welcome to Los Santos"       ,"Bienvenue à Los Santos"}
        Achivement_List_02  =  {"A Friendship Resurrected"    ,"Amitié ressuscitée"}
        Achivement_List_03  =  {"A Fair Day's Pay"            ,"Salaire honnête"}
        Achivement_List_04  =  {"The Moment of Truth"         ,"Moment de vérité"}
        Achivement_List_05  =  {"To Live or Die in Los Santos","Vivre ou mourir à Los Santos"}
        Achivement_List_06  =  {"Diamond Hard"                ,"Dur comme le diamant"}
        Achivement_List_07  =  {"Subversive"                  ,"Subversion"}
        Achivement_List_08  =  {"Blitzed"                     ,"Rentre-dedans"}
        Achivement_List_09  =  {"Small Town, Big Job"         ,"Trouble-fête"}
        Achivement_List_10  =  {"The Government Gimps"        ,"Larbins du gouvernement"}
        Achivement_List_11  =  {"The Big One!"                ,"Le coup du siècle"}
        Achivement_List_12  =  {"Solid Gold, Baby!"           ,"Cousu d'or"}
        Achivement_List_13  =  {"Career Criminal"             ,"Criminel de carrière"}
        Achivement_List_14  =  {"San Andreas Sightseer"       ,"Visite (pas) guidée"}
        Achivement_List_15  =  {"All's Fare in Love and War"  ,"Résultat des courses"}
        Achivement_List_16  =  {"TP Industries Arms Race"     ,"Armé jusqu'aux dents"}
        Achivement_List_17  =  {"Multi-Disciplined"           ,"Touche-à-tout"}
        Achivement_List_18  =  {"From Beyond the Stars"       ,"Aux 50 coins de la galaxie"}
        Achivement_List_19  =  {"A Mystery, Solved"           ,"Affaire classée"}
        Achivement_List_20  =  {"Waste Management"            ,"Gestion des déchets"}
        Achivement_List_21  =  {"Red Mist"                    ,"Folie furieuse"}
        Achivement_List_22  =  {"Show Off"                    ,"Frimeur"}
        Achivement_List_23  =  {"Kifflom!"                    ,"Kifflom!"}
        Achivement_List_24  =  {"Three Man Army"              ,"Trio de choc"}
        Achivement_List_25  =  {"Out of Your Depth"           ,"Hors de la zone de baignade"}
        Achivement_List_26  =  {"Altruist Acolyte"       	  ,"Acolyte des Altruistes"}
        Achivement_List_27  =  {"A Lot of Cheddar"       	  ,"Panier percé"}
        Achivement_List_28  =  {"Trading Pure Alpha"     	  ,"Homme d'actions"}
        Achivement_List_29  =  {"Pimp My Sidearm"        	  ,"Tuning d'arme"}
        Achivement_List_30  =  {"Wanted: Alive Or Alive" 	  ,"Recherché vif ou vif"}
        Achivement_List_31  =  {"Los Santos Customs"     	  ,"Los Santos Customs"}
        Achivement_List_32  =  {"Close Shave"            	  ,"Haute voltige"}
        Achivement_List_33  =  {"Off the Plane"          	  ,"Premiers pas"}
        Achivement_List_34  =  {"Three-Bit Gangster"     	  ,"Gangster en herbe"}
        Achivement_List_35  =  {"Making Moves"           	  ,"En progrès"}
        Achivement_List_36  =  {"Above the Law"          	  ,"Au-dessus des lois"}
        Achivement_List_37  =  {"Numero Uno"             	  ,"Numero uno"}
        Achivement_List_38  =  {"The Midnight Club"      	  ,"Midnight Club LS"}
        Achivement_List_39  =  {"Unnatural Selection"    	  ,"La loi du plus fort"}
        Achivement_List_40  =  {"Backseat Driver"        	  ,"Coopération victorieuse"}
        Achivement_List_41  =  {"Run Like The Wind"      	  ,"Chasse à l'homme"}
        Achivement_List_42  =  {"Clean Sweep"            	  ,"Table rase"}
        Achivement_List_43  =  {"Decorated"              	  ,"Champion en ligne"}
        Achivement_List_44  =  {"Stick Up Kid"           	  ,"Expert cambrioleur"}
        Achivement_List_45  =  {"Enjoy Your Stay"        	  ,"Bon séjour !"}
        Achivement_List_46  =  {"Crew Cut"               	  ,"Gagner sa crewte"}
        Achivement_List_47  =  {"Full Refund"            	  ,"Vengeance"}
        Achivement_List_48  =  {"Dialling Digits"        	  ,"3615 à l'aide"}
        Achivement_List_49  =  {"American Dream"         	  ,"Le rêve américain"}
        Achivement_List_50  =  {"A New Perspective"      	  ,"Un point de vue différent"}
        Achivement_List_51  =  {"Be Prepared"            	  ,"Préparateur"}
        Achivement_List_52  =  {"In the Name of Science" 	  ,"Pour la science"}
        Achivement_List_53  =  {"Dead Presidents"        	  ,"Retrait en liquide"}
        Achivement_List_54  =  {"Parole Day"             	  ,"Liberté inconditionnelle"}
        Achivement_List_55  =  {"Shot Caller"            	  ,"Placement à risque"}
        Achivement_List_56  =  {"Four Way"               	  ,"Équité totale"}
        Achivement_List_57  =  {"Live a Little"          	  ,"On ne vit qu'une fois"}
        Achivement_List_58  =  {"Can't Touch This"       	  ,"Intouchable"}
        Achivement_List_59  =  {"Mastermind"             	  ,"Génie du crime"}
        Achivement_List_60  =  {"Vinewood Visionary"     	  ,"Visionnaire de Vinewood"}
        Achivement_List_61  =  {"Majestic"               	  ,"Réalisateur prolifique"}
        Achivement_List_62  =  {"Humans of Los Santos"   	  ,"Les cassos de Los Santos"}
        Achivement_List_63  =  {"First Time Director"    	  ,"Jeune premier"}
        Achivement_List_64  =  {"Animal Lover"           	  ,"La bête m'habite"}
        Achivement_List_65  =  {"Ensemble Piece"         	  ,"Film choral"}
        Achivement_List_66  =  {"Cult Movie"             	  ,"Film (de) culte"}
        Achivement_List_67  =  {"Location Scout"         	  ,"Changement de décor"}
        Achivement_List_68  =  {"Method Actor"           	  ,"Un rôle sur mesure"}
        Achivement_List_69  =  {"Cryptozoologist"        	  ,"Cryptozoologue"}
        Achivement_List_70  =  {"Getting Started"        	  ,"On se prépare"}
        Achivement_List_71  =  {"The Data Breaches"      	  ,"Fuites de données"}
        Achivement_List_72  =  {"The Bogdan Problem"     	  ,"Nom de code : Bogdan"}
        Achivement_List_73  =  {"The Doomsday Scenario"  	  ,"Un scénario de fin du monde"}
        Achivement_List_74  =  {"A World Worth Saving"   	  ,"Un monde qui mérite d'être sauvé"}
        Achivement_List_75  =  {"Orbital Obliteration"   	  ,"Atomisation orbitale"}
        Achivement_List_76  =  {"Elitist"                	  ,"Élitiste"}
        Achivement_List_77  =  {"Masterminds"            	  ,"Génies du crime"}
        Achivement_List[01] = Achivement_List_01[current_language]
        Achivement_List[02] = Achivement_List_02[current_language]
        Achivement_List[03] = Achivement_List_03[current_language]
        Achivement_List[04] = Achivement_List_04[current_language]
        Achivement_List[05] = Achivement_List_05[current_language]
        Achivement_List[06] = Achivement_List_06[current_language]
        Achivement_List[07] = Achivement_List_07[current_language]
        Achivement_List[08] = Achivement_List_08[current_language]
        Achivement_List[09] = Achivement_List_09[current_language]
        Achivement_List[10] = Achivement_List_10[current_language]
        Achivement_List[11] = Achivement_List_11[current_language]
        Achivement_List[12] = Achivement_List_12[current_language]
        Achivement_List[13] = Achivement_List_13[current_language]
        Achivement_List[14] = Achivement_List_14[current_language]
        Achivement_List[15] = Achivement_List_15[current_language]
        Achivement_List[16] = Achivement_List_16[current_language]
        Achivement_List[17] = Achivement_List_17[current_language]
        Achivement_List[18] = Achivement_List_18[current_language]
        Achivement_List[19] = Achivement_List_19[current_language]
        Achivement_List[20] = Achivement_List_20[current_language]
        Achivement_List[21] = Achivement_List_21[current_language]
        Achivement_List[22] = Achivement_List_22[current_language]
        Achivement_List[23] = Achivement_List_23[current_language]
        Achivement_List[24] = Achivement_List_24[current_language]
        Achivement_List[25] = Achivement_List_25[current_language]
        Achivement_List[26] = Achivement_List_26[current_language]
        Achivement_List[27] = Achivement_List_27[current_language]
        Achivement_List[28] = Achivement_List_28[current_language]
        Achivement_List[29] = Achivement_List_29[current_language]
        Achivement_List[30] = Achivement_List_30[current_language]
        Achivement_List[31] = Achivement_List_31[current_language]
        Achivement_List[32] = Achivement_List_32[current_language]
        Achivement_List[33] = Achivement_List_33[current_language]
        Achivement_List[34] = Achivement_List_34[current_language]
        Achivement_List[35] = Achivement_List_35[current_language]
        Achivement_List[36] = Achivement_List_36[current_language]
        Achivement_List[37] = Achivement_List_37[current_language]
        Achivement_List[38] = Achivement_List_38[current_language]
        Achivement_List[39] = Achivement_List_39[current_language]
        Achivement_List[40] = Achivement_List_40[current_language]
        Achivement_List[41] = Achivement_List_41[current_language]
        Achivement_List[42] = Achivement_List_42[current_language]
        Achivement_List[43] = Achivement_List_43[current_language]
        Achivement_List[44] = Achivement_List_44[current_language]
        Achivement_List[45] = Achivement_List_45[current_language]
        Achivement_List[46] = Achivement_List_46[current_language]
        Achivement_List[47] = Achivement_List_47[current_language]
        Achivement_List[48] = Achivement_List_48[current_language]
        Achivement_List[49] = Achivement_List_49[current_language]
        Achivement_List[50] = Achivement_List_50[current_language]
        Achivement_List[51] = Achivement_List_51[current_language]
        Achivement_List[52] = Achivement_List_52[current_language]
        Achivement_List[53] = Achivement_List_53[current_language]
        Achivement_List[54] = Achivement_List_54[current_language]
        Achivement_List[55] = Achivement_List_55[current_language]
        Achivement_List[56] = Achivement_List_56[current_language]
        Achivement_List[57] = Achivement_List_57[current_language]
        Achivement_List[58] = Achivement_List_58[current_language]
        Achivement_List[59] = Achivement_List_59[current_language]
        Achivement_List[60] = Achivement_List_60[current_language]
        Achivement_List[61] = Achivement_List_61[current_language]
        Achivement_List[62] = Achivement_List_62[current_language]
        Achivement_List[63] = Achivement_List_63[current_language]
        Achivement_List[64] = Achivement_List_64[current_language]
        Achivement_List[65] = Achivement_List_65[current_language]
        Achivement_List[66] = Achivement_List_66[current_language]
        Achivement_List[67] = Achivement_List_67[current_language]
        Achivement_List[68] = Achivement_List_68[current_language]
        Achivement_List[69] = Achivement_List_69[current_language]
        Achivement_List[70] = Achivement_List_70[current_language]
        Achivement_List[71] = Achivement_List_71[current_language]
        Achivement_List[72] = Achivement_List_72[current_language]
        Achivement_List[73] = Achivement_List_73[current_language]
        Achivement_List[74] = Achivement_List_74[current_language]
        Achivement_List[75] = Achivement_List_75[current_language]
        Achivement_List[76] = Achivement_List_76[current_language]
        Achivement_List[77] = Achivement_List_77[current_language]
-- Settings
    Settings_Menu_Language_List       = {"Language","Langue"}
    Settings_Language                 = Settings_Menu_Language_List[current_language]
    Settings_Reload_list              = {"Reload Menu after changes","Recharger le menu aprés changements"}
    Settings_Reload                   = Settings_Reload_list[current_language]
    Settings_Binds_Menu_list          = {"See/Modify bindings","Voir/Modifier les raccourcis"}
    Settings_Binds_Menu               = Settings_Binds_Menu_list[current_language]
    Settings_Numberplates_enable_list = {"Show speedometer on numberplates","Activer la vitesse sur les plaques"}
    Settings_Numberplates_enable      = Settings_Numberplates_enable_list[current_language]
    Settings_Numberplates_unit_list   = {"Speedometer unit","Unité de vitesse"}
    Settings_Numberplates_unit        = Settings_Numberplates_unit_list[current_language]
    Settings_Numberplates_Binds_list  = {"Quick setup","Assignement rapide"}
    Settings_Numberplates_Binds       = Settings_Numberplates_Binds_list[current_language]
    Custom_Numberplates_list          = {"Custom numberplates by default?","Plasques customs par default?"}
    Custom_Numberplates               = Custom_Numberplates_list[current_language]
    Shapeshift_Gender_list            = {"Default gender for character","Genre du personnage par default"}
    Shapeshift_Gender                 = Shapeshift_Gender_list[current_language]
    Removed_Cars_Default_list         = {"Activate removed cars by default?","Activer les voitures enlever par default"}
    Removed_Cars_Default              = Removed_Cars_Default_list[current_language]
    -- Menu thigies
        Menu_Bindings_list        = {"Menu","Menu"}
        Menu_Bindings             = Menu_Bindings_list[current_language]
        Menu_Bindings_Toggle_list = {"Show/Hide","Montrer/Cahcer"}
        Menu_Bindings_Select_list = {"Select"   ,"Selectioner"}
        Menu_Bindings_Back_list   = {"Back"     ,"Retour"}
        Menu_Bindings_Up_list     = {"Up"       ,"Haut"}
        Menu_Bindings_Down_list   = {"Down"     ,"Bas"}
        Menu_Bindings_Right_list  = {"Right"    ,"Droite"}
        Menu_Bindings_Left_list   = {"Left"     ,"Gauche"}
        Menu_Bindings_Toggle      = Menu_Bindings_Toggle_list[current_language]
        Menu_Bindings_Select      = Menu_Bindings_Select_list[current_language]
        Menu_Bindings_Back        = Menu_Bindings_Back_list[current_language]
        Menu_Bindings_Up          = Menu_Bindings_Up_list[current_language]
        Menu_Bindings_Down        = Menu_Bindings_Down_list[current_language]
        Menu_Bindings_Right       = Menu_Bindings_Right_list[current_language]
        Menu_Bindings_Left        = Menu_Bindings_Left_list[current_language]
-- Main menu
    -- Movement
        Mouvement_Foward_List        = {"Fowards","Avancer"}
        Mouvement_Backward_List      = {"Backwards","Desactiver"}
        Mouvement_Left_List          = {"Left","Gauche"}
        Mouvement_Right_List         = {"Right","Droite"}
        Mouvement_TrunLeft_List      = {"Turn left","Tourner a gauche"}
        Mouvement_Turnright_List     = {"Turn right","Tourner a droite"}
        Mouvement_IncreaseSpeed_List = {"Increase speed","Augmenter la vitesse"}
        Mouvement_DecreaseSpeed_List = {"Decrease speed","Diminuer la vitesse"}
        Mouvement_Foward             = Mouvement_Foward_List[current_language]
        Mouvement_Backward           = Mouvement_Backward_List[current_language]
        Mouvement_Left               = Mouvement_Left_List[current_language]
        Mouvement_Right              = Mouvement_Right_List[current_language]
        Mouvement_TrunLeft           = Mouvement_TrunLeft_List[current_language]
        Mouvement_TurnRight          = Mouvement_Turnright_List[current_language]
        Mouvement_IncreaseSpeed      = Mouvement_IncreaseSpeed_List[current_language]
        Mouvement_DecreaseSpeed      = Mouvement_DecreaseSpeed_List[current_language]
    -- Noclip
        Menu_Noclip_list        = {"Noclip","Noclip"}
        Menu_Noclip             = Menu_Noclip_list[current_language]
        Menu_Noclip_Speed_list  = {"  Noclip Speed","  Vitesse du noclip"}
        Menu_Noclip_Speed       = Menu_Noclip_Speed_list[current_language]
        Menu_Noclip_Toggle_list = {"Toggle","Activer/Désactiver"}
        Menu_Noclip_Toggle      = Menu_Noclip_Toggle_list[current_language]
    -- Numberplates / Speedometer
        -- Speedometer
            Menu_Numberplates_list                = {"Numberplates / Speedometer","Compteur de vitesse / Plaques"}
            Menu_Numberplates                     = Menu_Numberplates_list[current_language]
            Menu_Speedometer_Bindings_list        = {"Speedometer","Compteur de vitesse"}
            Menu_Speedometer_Bindings             = Menu_Speedometer_Bindings_list[current_language]
            Menu_Numberplates_Speed_list          = {"  Speed: ","  Vitesse:"}
            Menu_Numberplates_Speed               = Menu_Numberplates_Speed_list[current_language]
            Menu_Numberplates_NotInVehicle_list   = {"Not in vehicle","Pas dans un vehicule"}
            Menu_Numberplates_NotInVehicle        = Menu_Numberplates_NotInVehicle_list[current_language]
            Menu_Numberplates_InvalidVehicle_list = {"Invalid vehicle","Vehicule invalide"}
            Menu_Numberplates_InvalidVehicle      = Menu_Numberplates_InvalidVehicle_list[current_language]
        -- Numberplates
            Numberplate_Custom_Manage_list    = {"Manage custom plates","Gerer les plaques customs"}
            Numberplate_Custom_Manage         = Numberplate_Custom_Manage_list[current_language]
            Numberplate_Custom_Delete_list    = {"Delete","Suprimer"}
            Numberplate_Custom_Delete         = Numberplate_Custom_Delete_list[current_language]
            Numberplate_Custom_Apply_list     = {"Apply","Appliquer"}
            Numberplate_Custom_Apply          = Numberplate_Custom_Apply_list[current_language]
            Numberplate_Custom_Choose_list    = {"Choose this plate as default","Mettre cette plaque en default"}
            Numberplate_Custom_Choose         = Numberplate_Custom_Choose_list[current_language]
            Numberplate_Custom_Preview_list   = {"________________↓ Preview ↓_________________","________________↓ Apercu ↓_________________"}
            Numberplate_Custom_Preview        = Numberplate_Custom_Preview_list[current_language]
            Numberplate_Custom_Character_list = {"Character n°","Charactere n°"}
            Numberplate_Custom_Character      = Numberplate_Custom_Character_list[current_language]
            Numberplate_Custom_SavePlate_list = {"Save","Sauvegarder"}
            Numberplate_Custom_SavePlate      = Numberplate_Custom_SavePlate_list[current_language]
            Numberplate_Custom_Toggle_list    = {"Activate custom plates","Activer les plaques customs"}
            Numberplate_Custom_Toggle         = Numberplate_Custom_Toggle_list[current_language]
    -- Other
        Menu_NoScratch_list           = {"No scratch","Pas d'égratinure"}
        Menu_NoScratch                = Menu_NoScratch_list[current_language]
        Menu_EnhancedOnline_list      = {"_________Enhanced online services________","_______Services en ligne augmenté______"}
        Menu_EnhancedOnline           = Menu_EnhancedOnline_list[current_language]
        Menu_RemovedCars_Toggle_list  = {"Activate removed cars","Activer les voitures enlever"}
        Menu_RemovedCars_Toggle       = Menu_RemovedCars_Toggle_list[current_language]
        Menu_Nightclub_Popular_list   = {"Make nightclub popular","Maxer la popularité de la boite de nuit"}
        Menu_Nightclub_Popular        = Menu_Nightclub_Popular_list[current_language]
        Menu_Challenge_list           = {"N° of challengs for carmeet prize","N° de challenges pour le salon auto"}
        Menu_Challenge                = Menu_Challenge_list[current_language]
        Menu_Report_Menu_list         = {"Report stats","Statistique de signalement"}
        Menu_Report_Menu              = Menu_Report_Menu_list[current_language]
        Menu_Readonly_list            = {"__________________Read only________________","_______________Lecture seule_______________"}
        Menu_Readonly                 = Menu_Readonly_list[current_language]
        Manu_TransactionError_list = {"Remove transaction error","Enlever l'erreur de transaction"}
        Manu_TransactionError      = Manu_TransactionError_list[current_language]
        -- Stat List
            Report_List = {}
            Report_List_01  = {"Griefing","Griefing"}
            Report_List_02  = {"Exploits","Abus"}
            Report_List_03  = {"Bug exploits","Abus de bug"}
            Report_List_04  = {"Text chat: Annoying me","Chat texte: M'agace"}
            Report_List_05  = {"Text chat: Using hate speech","Chat texte: Discrimination"}
            Report_List_06  = {"Voice chat: Annoying me","Chat vocal: M'agace"}
            Report_List_07  = {"Voice chat: Using hate speech","Chat vocal: Discrimination"}
            Report_List_08  = {"Offensive language","Language offensif"}
            Report_List_09  = {"Offensive tagplate","Nom offensif"}
            Report_List_10  = {"Offensive content","Contenu offensif"}
            Report_List_11  = {"Bad crew name","Mauvais nom de crew"}
            Report_List_12  = {"Bad crew motto","Mauvais motto de crew"}
            Report_List_13  = {"Bad crew status","Mauvais status de crew"}
            Report_List_14  = {"Bad crew emblem","Mauvais embleme de crew"}
            Report_List_15  = {"Friendly","Bonne ambiance"}
            Report_List_16  = {"Helpful","Serviable"}
            Report_List[01] = Report_List_01[current_language]
            Report_List[02] = Report_List_02[current_language]
            Report_List[03] = Report_List_03[current_language]
            Report_List[04] = Report_List_04[current_language]
            Report_List[05] = Report_List_05[current_language]
            Report_List[06] = Report_List_06[current_language]
            Report_List[07] = Report_List_07[current_language]
            Report_List[08] = Report_List_08[current_language]
            Report_List[09] = Report_List_09[current_language]
            Report_List[10] = Report_List_10[current_language]
            Report_List[11] = Report_List_11[current_language]
            Report_List[12] = Report_List_12[current_language]
            Report_List[13] = Report_List_13[current_language]
            Report_List[14] = Report_List_14[current_language]
            Report_List[15] = Report_List_15[current_language]
            Report_List[16] = Report_List_16[current_language]
-- Unlocks/Tunable
