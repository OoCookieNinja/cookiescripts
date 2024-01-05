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
    settings.GlobalTester = false
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
        You             = {"You","Toi"}
        Empty_text      = {"Empty","Vide"}
        None_text       = {"None","Aucun"}
        Set             = {"Set →","Appliquer →"}
        Notset          = {"Not set","Non appliqué"}
        Selected_text   = {"Selected","Sélectioné"}
        Unselected_text = {"Unselected","Non selectioné"}
        Notinheist      = {"Not in heist","Pas dans le braquage"}
        Manual_text     = {"________________↓ Manual ↓________________","________________↓ Manuel ↓________________"}
        Separator_text  = {"__________________________________________","__________________________________________"}
        You_text        = You[current_language]
        Empty_text      = Empty_text[current_language]
        None_text       = None_text[current_language]
        Set_text        = Set[current_language]
        Notset_text     = Notset[current_language]
        Selected_text   = Selected_text[current_language]
        Unselected_text = Unselected_text[current_language]
        Notinheist_text = Notinheist[current_language]
        Manual_text     = Manual_text[current_language]
        Separator_text  = Separator_text[current_language]
    -- Cuts
        Cut_Player_List = {}
        Cut_Player_List[1] = {"Player 1 → ","Joueur 1  → "}
        Cut_Player_List[2] = {"Player 2 → ","Joueur 2  → "}
        Cut_Player_List[3] = {"Player 3 → ","Joueur 3  → "}
        Cut_Player_List[4] = {"Player 4 → ","Joueur 4  → "}
        Cut_Player_List[1] = Cut_Player_List[1][current_language]
        Cut_Player_List[2] = Cut_Player_List[2][current_language]
        Cut_Player_List[3] = Cut_Player_List[3][current_language]
        Cut_Player_List[4] = Cut_Player_List[4][current_language]
        Cut_Setter         = {}
        Cut_Setter[2]      = {"100% for everyone","100% pour tout le monde"}
        Cut_Setter[1]      = Selected_text
        Cut_Setter[2]      = Cut_Setter[2][current_language]
        Cut_Player         = {"______________↓ Player cuts ↓_______________","___________↓ Pourcentage joueur ↓___________"}
        Cut_Player         = Cut_Player[current_language]
        Cut_Crew           = {"_______________↓ Crew cuts ↓________________","___________↓ Pourcentage equipe ↓___________"}
        Cut_Crew           = Cut_Crew[current_language]
        Cut_Crew2          = {"Apply during heist (Only you)","Appliquer pendant braquage (Seul toi)"}
        Cut_Crew2          = Cut_Crew2[current_language]
        Cut_Crew3          = Separator_text
    -- Mode
        Heist_difficulty_list = {}
        Heist_difficulty_list[1] = {"Normal","Normal"}
        Heist_difficulty_list[2] = {"Hard","Dur"}
        Heist_difficulty_list[1] = Heist_difficulty_list[1][current_language]
        Heist_difficulty_list[2] = Heist_difficulty_list[2][current_language]
    -- Other
        Extars_Submenu = {"During heist","Pendant braquage"}
        Extars_Submenu = Extars_Submenu[current_language]
----



-- B_Casino.lua
Casino_Submenu = {"Casino","Casino"}
Casino_Submenu = Casino_Submenu[current_language]
-- Lists and Variables
    -- Casino_Setup_Missions_List_1
        Casino_Setup_Missions_List_1    = {}
        Casino_Setup_Missions_List_1[0] = {"Vault content →","Contenu du coffre →"}
        Casino_Setup_Missions_List_1[1] = {"Vault keycard →","Carte du coffre →"}
        Casino_Setup_Missions_List_1[2] = {"Weapons collected →","Armes collectés →"}
        Casino_Setup_Missions_List_1[3] = {"Vehicles collected →","Vehicules collectés →"}
        Casino_Setup_Missions_List_1[4] = {"Hacking device →","Appareil de piratage →"}
        Casino_Setup_Missions_List_1[5] = {"Nano drone →","Nano drone →"}
        Casino_Setup_Missions_List_1[6] = {"Vault laser →","Laser pour coffre →"}
        Casino_Setup_Missions_List_1[7] = {"Vault drills →","Perceuse pour coffre →"}
        Casino_Setup_Missions_List_1[8] = {"Vault explosives →","Explosif pour Coffre →"}
        Casino_Setup_Missions_List_1[9] = {"Breaching charges →","Charges explosives →"}
        Casino_Setup_Missions_List_1[0] = Casino_Setup_Missions_List_1[0][current_language]
        Casino_Setup_Missions_List_1[1] = Casino_Setup_Missions_List_1[1][current_language]
        Casino_Setup_Missions_List_1[2] = Casino_Setup_Missions_List_1[2][current_language]
        Casino_Setup_Missions_List_1[3] = Casino_Setup_Missions_List_1[3][current_language]
        Casino_Setup_Missions_List_1[4] = Casino_Setup_Missions_List_1[4][current_language]
        Casino_Setup_Missions_List_1[5] = Casino_Setup_Missions_List_1[5][current_language]
        Casino_Setup_Missions_List_1[6] = Casino_Setup_Missions_List_1[6][current_language]
        Casino_Setup_Missions_List_1[7] = Casino_Setup_Missions_List_1[7][current_language]
        Casino_Setup_Missions_List_1[8] = Casino_Setup_Missions_List_1[8][current_language]
        Casino_Setup_Missions_List_1[9] = Casino_Setup_Missions_List_1[9][current_language]
    -- Casino_Setup_Missions_List_0
        Casino_Setup_Missions_List_0     = {}
        Casino_Setup_Missions_List_0[1]  = {"Patrol routes         ","Routes de patrouille"}
        Casino_Setup_Missions_List_0[2]  = {"Duggan shipments      ","Chargemnts Dugans"}
        Casino_Setup_Missions_List_0[3]  = {"Infiltration suit     ","Tenues d'infiltrations"}
        Casino_Setup_Missions_List_0[4]  = {"Power drills          ","Perceuses"}
        Casino_Setup_Missions_List_0[5]  = {"EMP device            ","Appareil IEM"}
        Casino_Setup_Missions_List_0[6]  = {"Gunman decoy          ","Leure"}
        Casino_Setup_Missions_List_0[7]  = {"Clean vehicle         ","Vehicules propres"}
        Casino_Setup_Missions_List_0[8]  = {"Bugstars van          ","Van Bugstars"}
        Casino_Setup_Missions_List_0[9]  = {"Plant trash           ","Planter les poubelles"}
        Casino_Setup_Missions_List_0[10] = {"Maintainance gear     ","Outilages de maintenance"}
        Casino_Setup_Missions_List_0[11] = {"Maintainance van      ","Van de maintenance"}
        Casino_Setup_Missions_List_0[12] = {"Grouppe Sechs van     ","Van de Grouppe"}
        Casino_Setup_Missions_List_0[13] = {"Grouppe Sechs gear    ","Outilages de Grouppe"}
        Casino_Setup_Missions_List_0[14] = {"[!]Yung ancestors car ","Voiture de Yung"}
        Casino_Setup_Missions_List_0[15] = {"[!]Yung ancestors gear","Tenues de Yung"}
        Casino_Setup_Missions_List_0[16] = {"Noose gear            ","Déguisement du NOOSE"}
        Casino_Setup_Missions_List_0[17] = {"Fire fighter gear     ","Déguisement des pompiers"}
        Casino_Setup_Missions_List_0[19] = {"Boring machine        ","Machine de perçage"}
        Casino_Setup_Missions_List_0[20] = {"Reinforced armor      ","Armure réinforcé"}
        Casino_Setup_Missions_List_0[1]  = Casino_Setup_Missions_List_0[1][current_language]
        Casino_Setup_Missions_List_0[2]  = Casino_Setup_Missions_List_0[2][current_language]
        Casino_Setup_Missions_List_0[3]  = Casino_Setup_Missions_List_0[3][current_language]
        Casino_Setup_Missions_List_0[4]  = Casino_Setup_Missions_List_0[4][current_language]
        Casino_Setup_Missions_List_0[5]  = Casino_Setup_Missions_List_0[5][current_language]
        Casino_Setup_Missions_List_0[6]  = Casino_Setup_Missions_List_0[6][current_language]
        Casino_Setup_Missions_List_0[7]  = Casino_Setup_Missions_List_0[7][current_language]
        Casino_Setup_Missions_List_0[8]  = Casino_Setup_Missions_List_0[8][current_language]
        Casino_Setup_Missions_List_0[9]  = Casino_Setup_Missions_List_0[9][current_language]
        Casino_Setup_Missions_List_0[10] = Casino_Setup_Missions_List_0[10][current_language]
        Casino_Setup_Missions_List_0[11] = Casino_Setup_Missions_List_0[11][current_language]
        Casino_Setup_Missions_List_0[12] = Casino_Setup_Missions_List_0[12][current_language]
        Casino_Setup_Missions_List_0[13] = Casino_Setup_Missions_List_0[13][current_language]
        Casino_Setup_Missions_List_0[14] = Casino_Setup_Missions_List_0[14][current_language]
        Casino_Setup_Missions_List_0[15] = Casino_Setup_Missions_List_0[15][current_language]
        Casino_Setup_Missions_List_0[16] = Casino_Setup_Missions_List_0[16][current_language]
        Casino_Setup_Missions_List_0[17] = Casino_Setup_Missions_List_0[17][current_language]
        Casino_Setup_Missions_List_0[19] = Casino_Setup_Missions_List_0[19][current_language]
        Casino_Setup_Missions_List_0[20] = Casino_Setup_Missions_List_0[20][current_language]
    -- Casino_Approch_List
        Casino_Approch_List    = {}
        Casino_Approch_List[1]  = {"Silent n Sneaky","Furtive"}
        Casino_Approch_List[2]  = {"Silent n Sneaky-HARD","Furtive-HARD"}
        Casino_Approch_List[3]  = {"The Big CON","Rusée"}
        Casino_Approch_List[4]  = {"The Big CON-HARD","Rusée-HARD"}
        Casino_Approch_List[5]  = {"Aggressive","En force"}
        Casino_Approch_List[6]  = {"Aggressive-HARD","En force-HARD"}
        Casino_Approch_List[1]  = Casino_Approch_List[1][current_language]
        Casino_Approch_List[2]  = Casino_Approch_List[2][current_language]
        Casino_Approch_List[3]  = Casino_Approch_List[3][current_language]
        Casino_Approch_List[4]  = Casino_Approch_List[4][current_language]
        Casino_Approch_List[5]  = Casino_Approch_List[5][current_language]
        Casino_Approch_List[6]  = Casino_Approch_List[6][current_language]
        Casino_Approch_List[-1] = Unselected_text
    -- Casino_Target_List
        Casino_Target_List   = {}
        Casino_Target_List[0] = {"Cash","Argent"}
        Casino_Target_List[1] = {"Gold","Or"}
        Casino_Target_List[2] = {"Artwork","Peintures"}
        Casino_Target_List[3] = {"Diamonds","Diamands"}
        Casino_Target_List[0] = Casino_Target_List[0][current_language]
        Casino_Target_List[1] = Casino_Target_List[1][current_language]
        Casino_Target_List[2] = Casino_Target_List[2][current_language]
        Casino_Target_List[3] = Casino_Target_List[3][current_language]
        
    -- Misc
        Casino_Hacker_List    = {}
        Casino_Hacker_List[0] = Unselected_text
        Casino_Mask_List      = {}
        Casino_Mask_List[0]   = Unselected_text

-- Casino Setup
    Casino_Setup_Submenu      = {"Casino setup","Préparation pour le casino"}
    Casino_Setup_Submenu      = Casino_Setup_Submenu[current_language]
    Casino_Setup_Mode         = {"Go to finale →","Aller au braquage →"}
    Casino_Setup_Mode         = Casino_Setup_Mode[current_language]
    Casino_Setup_Targetchoise = {"Choose target →","Choisir la cible →"}
    Casino_Setup_Targetchoise = Casino_Setup_Targetchoise[current_language]
-- Casino Approach
    Casino_Approach_Setmode = {"Set mode →","Mettre le mode →"}
    Casino_Approach_Setmode = Casino_Approach_Setmode[current_language]
    Casino_Approach_Choise  = {"Approach →","Approche →"}
    Casino_Approach_Choice  = Casino_Approach_Choise[current_language]
    -- Casino Approach Settings
        Casino_Approach_Settings_Silentnsneaky           = {"Silent and Sneaky settings","Paramétre: Furtive"}
        Casino_Approach_Settings_Silentnsneaky           = Casino_Approach_Settings_Silentnsneaky[current_language]
        Casino_Approach_Settings_Thebigcon               = {"The big con settings","Paramétre: Rusée"}
        Casino_Approach_Settings_Thebigcon               = Casino_Approach_Settings_Thebigcon[current_language]
        Casino_Approach_Settings_Thebigcon_entrydesguise = {"↓ Entry disguise ↓","↓ Deguisement d'entrée ↓"}
        Casino_Approach_Settings_Thebigcon_entrydesguise = Casino_Approach_Settings_Thebigcon_entrydesguise[current_language]
        Casino_Approach_Settings_Thebigcon_exitdesguise  = {"↓ Exit disguise ↓","↓ Deguisement de sortie ↓"}
        Casino_Approach_Settings_Thebigcon_exitdesguise  = Casino_Approach_Settings_Thebigcon_exitdesguise[current_language]
        Casino_Approach_Settings_Aggresive               = {"Aggresive settings","Paramétre: En force"}
        Casino_Approach_Settings_Aggresive               = Casino_Approach_Settings_Aggresive[current_language]
        Casino_Approach_Settings_Submenu                 = {"Approach settings","Paramétre d'approche"}
        Casino_Approach_Settings_Submenu                 = Casino_Approach_Settings_Submenu[current_language]
-- Support Crew
    -- Hacker
        Casino_Crew_Hacker      = {"Choose hacker →","Choisir hacker →"}
        Casino_Crew_Hacker      = Casino_Crew_Hacker[current_language]
        Casino_Crew_Hacker_Only = {"Hacker","Hacker"}
        Casino_Crew_Hacker_Only = Casino_Crew_Hacker_Only[current_language]
    -- Gunman
        Casino_Crew_Gunman_Submenu       = {"Gunman and weapon","Armurier et armes"}
        Casino_Crew_Gunman_Submenu       = Casino_Crew_Gunman_Submenu[current_language]
        Casino_Crew_Gunman_Only          = {"Gunman","Armurier"}
        Casino_Crew_Gunman_Only          = Casino_Crew_Gunman_Only[current_language]
        Casino_Crew_Gunman_Choise        = {"Choose one","Choisis-en un"}
        Casino_Crew_Gunman_Choise        = Casino_Crew_Gunman_Choise[current_language]
        Casino_Crew_Gunman_MicroSMG      = {"Micro SMG","Pistolet mitrailleur"}
        Casino_Crew_Gunman_MicroSMG      = Casino_Crew_Gunman_MicroSMG[current_language]
        Casino_Crew_Gunman_Machinepistol = {"Machine pistol","Pistolet performant"}
        Casino_Crew_Gunman_Machinepistol = Casino_Crew_Gunman_Machinepistol[current_language]
        Casino_Crew_Gunman_Shotgun       = {"Shotgun","Fusil a pompe"}
        Casino_Crew_Gunman_Shotgun       = Casino_Crew_Gunman_Shotgun[current_language]
        Casino_Crew_Gunman_Rifle         = {"Rifle","Fusil d'assualt"}
        Casino_Crew_Gunman_Rifle         = Casino_Crew_Gunman_Rifle[current_language]
        Casino_Crew_Gunman_ShotgunMKII   = {"MkII shotgun","Fusil a pompe MkII"}
        Casino_Crew_Gunman_ShotgunMKII   = Casino_Crew_Gunman_ShotgunMKII[current_language]
        Casino_Crew_Gunman_RifleMKII     = {"MKII rifle","Fusil d'assault MkII"}
        Casino_Crew_Gunman_RifleMKII     = Casino_Crew_Gunman_RifleMKII[current_language]
    -- Driver
        Casino_Crew_Driver_Submenu = {"Driver and car","Conducteur et voiture"}
        Casino_Crew_Driver_Submenu = Casino_Crew_Driver_Submenu[current_language]
        Casino_Crew_Driver_Only    = {"Driver","Conducteur"}
        Casino_Crew_Driver_Only    = Casino_Crew_Driver_Only[current_language]
        Casino_Crew_Driver_Choise  = {"Choose one (with wanted vehicle)","Choisir un (avec le vehicule)"}
        Casino_Crew_Driver_Choise  = Casino_Crew_Driver_Choise[current_language]
        Casino_Crew_Driver_Bikes   = {" (Bikes)"," (Motos)"}
        Casino_Crew_Driver_Bikes   = Casino_Crew_Driver_Bikes[current_language]
    -- Masks
        Casino_Crew_Mask = {"Choose mask →","Choisir un masque →"}
        Casino_Crew_Mask = Casino_Crew_Mask[current_language]
-- Common Missions
        Casino_Setup_Common_Submenu   = {"Common missions","Missions communes"}
        Casino_Setup_Common_Submenu   = Casino_Setup_Common_Submenu[current_language]
        Casino_Setup_Common_Passlevel = {"Security pass level →","Niveau des pass de secutite →"}
        Casino_Setup_Common_Passlevel = Casino_Setup_Common_Passlevel[current_language]
        Casino_Setup_Common_Shipment  = {"   Shipment destroyed","   Quantité détruit"}
        Casino_Setup_Common_Shipment  = Casino_Setup_Common_Shipment[current_language]
-- Casino Cut
    Casino_Cut_Submenu = {"Casino cut","Pourcentage pour le casino"}
    Casino_Cut_Submenu = Casino_Cut_Submenu[current_language]
-- Casino Extras
    Casino_Extras_Keypad      = {"Complete keypad","Completer le clavier numérique"}
    Casino_Extras_Keypad      = Casino_Extras_Keypad[current_language]
    Casino_Extras_Fingerprint = {"Complete fingerprint","Completer l'empreinte"}
    Casino_Extras_Fingerprint = Casino_Extras_Fingerprint[current_language]
    Casino_Extras_DrillVault  = {"Drill vault door","Forer le coffre"}
    Casino_Extras_DrillVault  = Casino_Extras_DrillVault[current_language]
----



-- C_Cayo.lua
Cayo_Submenu = {"Cayo perico","Cayo perico"}
Cayo_Submenu = Cayo_Submenu[current_language]
-- Lists and Variables
    -- Global Cayo
        Cayo_NearMaindock  = {"Near Main dock","A coté du Dock Principal"}
        Cayo_Maindock      = {"Main dock","Dock Principal"}
        Cayo_InnerMaindock = {"Inner Main dock","Dock Principal interieur"}
        Cayo_Farmland      = {"Farmland","Champs"}
        Cayo_Northdock     = {"North dock","Dock nord"}
        Cayo_Airstrip      = {"Airstip","Piste d'atterisage"}
        Cayo_Lighthouse    = {"Lighthouse","Phare"}
        Cayo_NearMaindock  = Cayo_NearMaindock[current_language]
        Cayo_Maindock      = Cayo_Maindock[current_language]
        Cayo_InnerMaindock = Cayo_InnerMaindock[current_language]
        Cayo_Farmland      = Cayo_Farmland[current_language]
        Cayo_Northdock     = Cayo_Northdock[current_language]
        Cayo_Airstrip      = Cayo_Airstrip[current_language]
        Cayo_Lighthouse    = Cayo_Lighthouse[current_language]
    -- Mission List & POI
        Cayo_Missions_List = {}
        Cayo_Missions_List[00] = {"Gather Intel*","Rassemlez des infos"}
        Cayo_Missions_List[01] = {"Kosatka Submarine →","Sousmarin Kosatka →"}
        Cayo_Missions_List[02] = {"RO-86 Alkonost →","RO-86 Alkonost →"}
        Cayo_Missions_List[03] = {"Velum 5-Seater →","Velum 5-places →"}
        Cayo_Missions_List[04] = {"Stealth Annihilator →","Annihilator Furtif →"}
        Cayo_Missions_List[05] = {"Kurtz Patrol Boat →","Bateau de patrouille →"}
        Cayo_Missions_List[06] = {"Longifin Boat →","Bateau Longfin →"}
        Cayo_Missions_List[07] = {"Pilot (Alkonost,Annihilator) →","Pilote (Alkonost,Annihilator) →"}
        Cayo_Missions_List[08] = {"Demolition Charges →","Charges de démolition →"}
        Cayo_Missions_List[09] = {"Cutting Torch* →","Torche pour Découper* →"}
        Cayo_Missions_List[10] = {"Plasma Cutter* →","Découpeur plasma* →"}
        Cayo_Missions_List[11] = {"Fingerprint Cloner* →","Cloneur d'empreinte* →"}
        Cayo_Missions_List[12] = {"Approach Weapon* →","Amres pour Approche* →"}
        Cayo_Missions_List[13] = {"Weapons Disruption →","Armes perturb&"}
        Cayo_Missions_List[14] = {"Armor Disruption →","Armure perturbé"}
        Cayo_Missions_List[15] = {"Air Support Disruption →","Suppot Aérien perturbé"}
        Cayo_Missions_List[00] = Cayo_Missions_List[00][current_language]
        Cayo_Missions_List[01] = Cayo_Missions_List[01][current_language]
        Cayo_Missions_List[02] = Cayo_Missions_List[02][current_language]
        Cayo_Missions_List[03] = Cayo_Missions_List[03][current_language]
        Cayo_Missions_List[04] = Cayo_Missions_List[04][current_language]
        Cayo_Missions_List[05] = Cayo_Missions_List[05][current_language]
        Cayo_Missions_List[06] = Cayo_Missions_List[06][current_language]
        Cayo_Missions_List[07] = Cayo_Missions_List[07][current_language]
        Cayo_Missions_List[08] = Cayo_Missions_List[08][current_language]
        Cayo_Missions_List[09] = Cayo_Missions_List[09][current_language]
        Cayo_Missions_List[10] = Cayo_Missions_List[10][current_language]
        Cayo_Missions_List[11] = Cayo_Missions_List[11][current_language]
        Cayo_Missions_List[12] = Cayo_Missions_List[12][current_language]
        Cayo_Missions_List[13] = Cayo_Missions_List[13][current_language]
        Cayo_Missions_List[14] = Cayo_Missions_List[14][current_language]
        Cayo_Missions_List[15] = Cayo_Missions_List[15][current_language]
    -- Loots
        Cayo_set_loot_compound_table_list    = {}
        Cayo_Choose_Target              = {}
        Cayo_set_loot_outside_table_list     = {}
        Cayo_set_loot_compound_table_list[1] = {"Gold","Or"}
        Cayo_set_loot_compound_table_list[2] = {"Cash","Argent"}
        Cayo_set_loot_outside_table_list[1]  = {"Coke","Cocaïne"}
        Cayo_set_loot_outside_table_list[2]  = {"Cash","Argent"}
        Cayo_set_loot_outside_table_list[3]  = {"Weed","Weed"}
        Cayo_Choose_Target[0]                = {"Sinsimito Tequila","Sinsimito Tequila"}
        Cayo_Choose_Target[1]                = {"Ruby Necklace","Colier de ruby"}
        Cayo_Choose_Target[2]                = {"Bearer Bonds","Les bons au porteur"}
        Cayo_Choose_Target[3]                = {"Pink Diamond","Diamant rose"}
        Cayo_Choose_Target[5]                = {"Panther Statue","Statue de la panthére"}
        Cayo_set_loot_compound_table_list[0] = Empty_text
        Cayo_set_loot_compound_table_list[1] = Cayo_set_loot_compound_table_list[1][current_language]
        Cayo_set_loot_compound_table_list[2] = Cayo_set_loot_compound_table_list[2][current_language]
        Cayo_set_loot_outside_table_list[0]  = Empty_text
        Cayo_set_loot_outside_table_list[1]  = Cayo_set_loot_outside_table_list[1][current_language]
        Cayo_set_loot_outside_table_list[2]  = Cayo_set_loot_outside_table_list[2][current_language]
        Cayo_set_loot_outside_table_list[3]  = Cayo_set_loot_outside_table_list[3][current_language]
        Cayo_Choose_Target[-1]               = Notset_text
        Cayo_Choose_Target[0]                = Cayo_Choose_Target[0][current_language]
        Cayo_Choose_Target[1]                = Cayo_Choose_Target[1][current_language]
        Cayo_Choose_Target[2]                = Cayo_Choose_Target[2][current_language]
        Cayo_Choose_Target[3]                = Cayo_Choose_Target[3][current_language]
        Cayo_Choose_Target[5]                = Cayo_Choose_Target[5][current_language]
    -- Cayo_Loot_point
        Cayo_Setloot_Table1    = {"Table 1     →","Table 1     →"}
        Cayo_Setloot_Table2    = {"Table 2     →","Table 2     →"}
        Cayo_Setloot_Table3    = {"Table 3     →","Table 3     →"}
        Cayo_Setloot_Table1    = Cayo_Setloot_Table1[current_language]
        Cayo_Setloot_Table2    = Cayo_Setloot_Table2[current_language]
        Cayo_Setloot_Table3    = Cayo_Setloot_Table3[current_language]
        Cayo_Setloot_Painting1 = {"Painting   →","Tableau    →"}
        Cayo_Setloot_Painting2 = {"Painting 2 →","Tableau 2  →"}
        Cayo_Setloot_Painting1 = Cayo_Setloot_Painting1[current_language]
        Cayo_Setloot_Painting2 = Cayo_Setloot_Painting2[current_language]
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
        Cayo_Point_of_interest_List[7]  = {"WatchTower Near Compound","Tour de garde a coté de la cour"}
        Cayo_Point_of_interest_List[12] = {"   Weapon Suppressor","   Silcencieux"}
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
        Cayo_Point_of_interest_List[7]  = Cayo_Point_of_interest_List[7][current_language]
        Cayo_Point_of_interest_List[11] = Cayo_Farmland
        Cayo_Point_of_interest_List[12] = Cayo_Point_of_interest_List[12][current_language]
        Cayo_Point_of_interest_List[13] = Cayo_Point_of_interest_List[13][current_language]
        Cayo_Point_of_interest_List[14] = Cayo_Point_of_interest_List[14][current_language]
        Cayo_Point_of_interest_List[15] = Cayo_Point_of_interest_List[15][current_language]
    -- Cayo_Interest_point
        Cayo_Interest_point    = {}
        Cayo_Interest_point[5] = {"Outside Compoud","Hors de la cour"}
        Cayo_Interest_point[0] = None_text
        Cayo_Interest_point[1] = Cayo_Airstrip
        Cayo_Interest_point[2] = Cayo_Northdock
        Cayo_Interest_point[3] = Cayo_NearMaindock
        Cayo_Interest_point[4] = Cayo_Maindock
        Cayo_Interest_point[5] = Cayo_Interest_point[5][current_language]

    -- Weapons
        Cayo_Choose_Weapon    = {}
        Cayo_Choose_Weapon[1] = {"Aggressor","Aggreseur"}
        Cayo_Choose_Weapon[2] = {"Conspirator","Conspirateur"}
        Cayo_Choose_Weapon[3] = {"Crackshot","Fine Gâchette"}
        Cayo_Choose_Weapon[4] = {"Saboteur","Saboteur"}
        Cayo_Choose_Weapon[5] = {"Marksman","Tireur d'élite"}
        Cayo_Choose_Weapon[0] = Notset_text
        Cayo_Choose_Weapon[1] = Cayo_Choose_Weapon[1][current_language]
        Cayo_Choose_Weapon[2] = Cayo_Choose_Weapon[2][current_language]
        Cayo_Choose_Weapon[3] = Cayo_Choose_Weapon[3][current_language]
        Cayo_Choose_Weapon[4] = Cayo_Choose_Weapon[4][current_language]
        Cayo_Choose_Weapon[5] = Cayo_Choose_Weapon[5][current_language]
-- Cayo Setup
    -- Auto
        Cayo_Seup_Instant   = {"Instant Setup","Préparation Instant"}
        Cayo_Seup_Instant   = Cayo_Seup_Instant[current_language]
        Cayo_Setup_Hardmode = {"Set heist into hard mode","Mettre le mode dur"}
        Cayo_Setup_Hardmode = Cayo_Setup_Hardmode[current_language]
        Cayo_Setup_Maxing   = {"Max for (yourCut)→","Max pour (ta part)→"}
        Cayo_Setup_Maxing   = Cayo_Setup_Maxing[current_language]
    -- Manual
        Cayo_Setup_Target           = {"Primary Target →","Cible Principale →"}
        Cayo_Setup_Target           = Cayo_Setup_Target[current_language]
        Cayo_Setup_ChooseWeapon     = {"Choose Weapon* →","Choisir Armes* →"}
        Cayo_Setup_ChooseWeapon     = Cayo_Setup_ChooseWeapon[current_language]
        Cayo_Setup_Approach_Submenu = {"Approach Vehicle*","Vehicule d'approche* →"}
        Cayo_Setup_Approach_Submenu = Cayo_Setup_Approach_Submenu[current_language]
        Cayo_Setup_Approach_Choose  = {"__________Choose at least one_________","___________Choisir Au moins un__________"}
        Cayo_Setup_Approach_Choose  = Cayo_Setup_Approach_Choose[current_language]
        Refresh_Kosatka_Board       = {"Restart kosatka board","Redémarer le table du kosatka"}
        Refresh_Kosatka_Board       = Refresh_Kosatka_Board[current_language]
    -- Disruption
        Cayo_Setup_MissionAndWeapons_Submenu             = {"Disruption And Weapons*","Armes et Pértubation"}
        Cayo_Setup_MissionAndWeapons_Submenu             = Cayo_Setup_MissionAndWeapons_Submenu[current_language]
        Cayo_Setup_MissionAndWeapons_ChooseWeapon        = {"Choose Weapon →","Choisir Arme →"}
        Cayo_Setup_MissionAndWeapons_ChooseWeapon        = Cayo_Setup_MissionAndWeapons_ChooseWeapon[current_language]
        Cayo_Setup_MissionAndWeapons_PercetangeDestroyed = {"   Quantity Destroyed","   Quantité Détruite"}
        Cayo_Setup_MissionAndWeapons_PercetangeDestroyed = Cayo_Setup_MissionAndWeapons_PercetangeDestroyed[current_language]
        Cayo_Setup_Submenu                               = {"Cayo Setup","Preparation de Cayo"}
        Cayo_Setup_Submenu                               = Cayo_Setup_Submenu[current_language]
    -- POI Stuff
        Cayo_Point_of_interest_submenu              = {"Points of interests","Points d'interet"}
        Cayo_Point_of_interest_grappling_submenu    = {"Put Grappling Eq in/near...","Grapin dans/a coté de..."}
        Cayo_Point_of_interest_guardclothes_submenu = {"Put Guard Clothes in/near...","Déguisement de guarde dans/a coté de..."}
        Cayo_Point_of_interest_boltcutters_submenu  = {"Bolt Cutters in/near...","Coupe-Grille dans/a coté de..."}
        Cayo_Point_of_interest_submenu              = Cayo_Point_of_interest_submenu[current_language]
        Cayo_Point_of_interest_grappling_submenu    = Cayo_Point_of_interest_grappling_submenu[current_language]
        Cayo_Point_of_interest_guardclothes_submenu = Cayo_Point_of_interest_guardclothes_submenu[current_language]
        Cayo_Point_of_interest_boltcutters_submenu  = Cayo_Point_of_interest_boltcutters_submenu[current_language]
        Cayo_Point_of_interest_supplytruck          = {"Supply truck in","Camion ravitailleur dans"}
        Cayo_Point_of_interest_scopeout             = {"ScopeOut POIs","Repérer les POIs"}
        Cayo_Point_of_interest_supplytruck          = Cayo_Point_of_interest_supplytruck[current_language]
        Cayo_Point_of_interest_scopeout             = Cayo_Point_of_interest_scopeout[current_language]
-- Cayo Set Loot
    Cayo_Setloot_Submenu = {"Set loot","Définir le loot"}
    Cayo_Setloot_Submenu = Cayo_Setloot_Submenu[current_language]
    -- IN
        Cayo_Setloot_Compound_in  = {"_________↓ Inside Compound ↓_________","_________↓ L'interieur de la cour ↓_________"}
        Cayo_Setloot_Compound_in  = Cayo_Setloot_Compound_in[current_language]
        Cayo_Setloot_Room1        = {"Room 1 (North)","Piéce 1 (Nord)"}
        Cayo_Setloot_Room2        = {"Room 2 (Center)","Piéce 2 (Centre)"}
        Cayo_Setloot_Room3        = {"Room 3 (South)","Piéce 3 (Sud)"}
        Cayo_Setloot_Basement     = {"Basement","Sous-Sol"}
        Cayo_Setloot_Office       = {"Rubio's office","Bureau de Rubio"}
        Cayo_Setloot_Room1        = Cayo_Setloot_Room1[current_language]
        Cayo_Setloot_Room2        = Cayo_Setloot_Room2[current_language]
        Cayo_Setloot_Room3        = Cayo_Setloot_Room3[current_language]
        Cayo_Setloot_Basement     = Cayo_Setloot_Basement[current_language]
        Cayo_Setloot_Office       = Cayo_Setloot_Office[current_language]
    -- OUT
        Cayo_Setloot_Compound_out  = {"_________↓ Outside Compound ↓_________","_________↓ L'extérieur de la cour ↓_________"}
        Cayo_Setloot_Compound_out  = Cayo_Setloot_Compound_out[current_language]
        Cayo_Setloot_Shed          = {"↓ Shed ↓","↓ Barraque ↓"}
        Cayo_Setloot_Shed2         = {"↓ Shed 2 ↓","↓ Barraque 2 ↓"}
        Cayo_Setloot_Lockup        = {"↓ Lock up ↓","↓ Porte Vérouillée ↓"}
        Cayo_Setloot_HangarTop     = {"↓ Hangar Bottom ↓","↓ Bas du Hangar ↓"}
        Cayo_Setloot_HangarBottom  = {"↓ Hangar Top ↓","↓ Haut du Hangar ↓"}
        Cayo_Setloot_Warehouse     = {"↓ Warehouse ↓","↓ L'entrepôt ↓"}
        Cayo_Setloot_Shed          = Cayo_Setloot_Shed[current_language]
        Cayo_Setloot_Shed2         = Cayo_Setloot_Shed2[current_language]
        Cayo_Setloot_Lockup        = Cayo_Setloot_Lockup[current_language]
        Cayo_Setloot_HangarTop     = Cayo_Setloot_HangarTop[current_language]
        Cayo_Setloot_HangarBottom  = Cayo_Setloot_HangarBottom[current_language]
        Cayo_Setloot_Warehouse     = Cayo_Setloot_Warehouse[current_language]
-- Cayo Cut
    Cayo_Cut_Submenu = {"Cayo Cut","Pourcentage pour Cayo"}
    Cayo_Cut_Submenu = Cayo_Cut_Submenu[current_language]
    Cayo_Cut_Pavel   = {"Remove Pavel's cut","Enlever La part dePavel"}
    Cayo_Cut_Pavel   = Cayo_Cut_Pavel[current_language]
    Cayo_Fencing_Fee = {"Remove Fencing's fee","Enlever les Frais du porteur"}
    Cayo_Fencing_Fee = Cayo_Fencing_Fee[current_language]
-- Cayo Extras
    Cayo_Extras_Sewer       = {"Cut Sewer Fence","Couper la grille des égôuts"}
    Cayo_Extras_Sewer       = Cayo_Extras_Sewer[current_language]
    Cayo_Extras_Fingerprint = {"Clone Fingerprint","Cloner l'empreinte"}
    Cayo_Extras_Fingerprint = Cayo_Extras_Fingerprint[current_language]
    Cayo_Extras_Cutglass    = {"Cut Glass","Couper le verre"}
    Cayo_Extras_Cutglass    = Cayo_Extras_Cutglass[current_language]
    Cayo_Extras_Bag         = {"Bag Cap →","Capacité du sac →"}
    Cayo_Extras_Bag         = Cayo_Extras_Bag[current_language]
----



-- D_Doomsday&Appartement.lua
-- Doomsday
    Doomsday_Menu      = {"Doomsday","Fin du monde"}
    Doomsday_Menu            = Doomsday_Menu[current_language]
    -- Lists and Variables
        Doomsday_Heist_Prep_List = {}
        Doomsday_Heist_Prep_List[00] = {"Paramedic Equipment","Equipement médical"}
        Doomsday_Heist_Prep_List[01] = {"Deluxos","Deluxos"}
        Doomsday_Heist_Prep_List[02] = {"Akula","Akula"}
        Doomsday_Heist_Prep_List[03] = {"Key cards","Cartes d'accés"}
        Doomsday_Heist_Prep_List[04] = {"ULP Intel","Information d'ULP"}
        Doomsday_Heist_Prep_List[05] = {"Riot control van","Fourgon anit-émeute"}
        Doomsday_Heist_Prep_List[06] = {"Stormbergs","Strombergs"}
        Doomsday_Heist_Prep_List[07] = {"Torpedo ECH",""}
        Doomsday_Heist_Prep_List[08] = {"Marked cash","Argent marqué"}
        Doomsday_Heist_Prep_List[09] = {"Recon","Reconnaissance"}
        Doomsday_Heist_Prep_List[10] = {"Chernobog","Chernobog"}
        Doomsday_Heist_Prep_List[11] = {"Flight path","Chemin de vol"}
        Doomsday_Heist_Prep_List[12] = {"Test site intel","Information sur le site de test"}
        Doomsday_Heist_Prep_List[13] = {"Onboard computer","Ordinateur de bord"}
        Doomsday_Heist_Prep_List[00] = Doomsday_Heist_Prep_List[00][current_language]
        Doomsday_Heist_Prep_List[01] = Doomsday_Heist_Prep_List[01][current_language]
        Doomsday_Heist_Prep_List[02] = Doomsday_Heist_Prep_List[02][current_language]
        Doomsday_Heist_Prep_List[03] = Doomsday_Heist_Prep_List[03][current_language]
        Doomsday_Heist_Prep_List[04] = Doomsday_Heist_Prep_List[04][current_language]
        Doomsday_Heist_Prep_List[05] = Doomsday_Heist_Prep_List[05][current_language]
        Doomsday_Heist_Prep_List[06] = Doomsday_Heist_Prep_List[06][current_language]
        Doomsday_Heist_Prep_List[07] = Doomsday_Heist_Prep_List[07][current_language]
        Doomsday_Heist_Prep_List[08] = Doomsday_Heist_Prep_List[08][current_language]
        Doomsday_Heist_Prep_List[09] = Doomsday_Heist_Prep_List[09][current_language]
        Doomsday_Heist_Prep_List[10] = Doomsday_Heist_Prep_List[10][current_language]
        Doomsday_Heist_Prep_List[11] = Doomsday_Heist_Prep_List[11][current_language]
        Doomsday_Heist_Prep_List[12] = Doomsday_Heist_Prep_List[12][current_language]
        Doomsday_Heist_Prep_List[13] = Doomsday_Heist_Prep_List[13][current_language]
        Doomsday_Heist_Missions_List = {}
        Doomsday_Heist_Missions_List[00] = {"Dead Courier","Courier"}
        Doomsday_Heist_Missions_List[01] = {"Signal Intercept","Interception du signal"}
        Doomsday_Heist_Missions_List[02] = {"ServerFarm","Data-center"}
        Doomsday_Heist_Missions_List[04] = {"Avenger","Avenger"}
        Doomsday_Heist_Missions_List[05] = {"Rescue ULP","Sauver ULP"}
        Doomsday_Heist_Missions_List[06] = {"Salvage Hard Drives","Recupérer les disque durs"}
        Doomsday_Heist_Missions_List[07] = {"Submarine Recon","Reconnaissance du sousmarin"}
        Doomsday_Heist_Missions_List[09] = {"Rescue Agent 14","Sauver Agent 14"}
        Doomsday_Heist_Missions_List[10] = {"Rescue ULP","Sauver ULP"}
        Doomsday_Heist_Missions_List[11] = {"Barrage","Barrage"}
        Doomsday_Heist_Missions_List[12] = {"Khanjali","Khanjali"}
        Doomsday_Heist_Missions_List[13] = {"Air Defences","Défense aérienne"}
        Doomsday_Heist_Missions_List[00] = Doomsday_Heist_Missions_List[00][current_language]
        Doomsday_Heist_Missions_List[01] = Doomsday_Heist_Missions_List[01][current_language]
        Doomsday_Heist_Missions_List[02] = Doomsday_Heist_Missions_List[02][current_language]
        Doomsday_Heist_Missions_List[04] = Doomsday_Heist_Missions_List[04][current_language]
        Doomsday_Heist_Missions_List[05] = Doomsday_Heist_Missions_List[05][current_language]
        Doomsday_Heist_Missions_List[06] = Doomsday_Heist_Missions_List[06][current_language]
        Doomsday_Heist_Missions_List[07] = Doomsday_Heist_Missions_List[07][current_language]
        Doomsday_Heist_Missions_List[09] = Doomsday_Heist_Missions_List[09][current_language]
        Doomsday_Heist_Missions_List[10] = Doomsday_Heist_Missions_List[10][current_language]
        Doomsday_Heist_Missions_List[11] = Doomsday_Heist_Missions_List[11][current_language]
        Doomsday_Heist_Missions_List[12] = Doomsday_Heist_Missions_List[12][current_language]
        Doomsday_Heist_Missions_List[13] = Doomsday_Heist_Missions_List[13][current_language]
        Doomsday_Heist_List = {}
        Doomsday_Heist_List[01] = {"Data Breaches","Bréche de donées"}
        Doomsday_Heist_List[02] = {"Bogdan Problem","Codename: Bogdan"}
        Doomsday_Heist_List[03] = {"Doomsday Scenario","Scénario de la fin du monde"}
        Doomsday_Heist_List[01] = Doomsday_Heist_List[01][current_language]
        Doomsday_Heist_List[02] = Doomsday_Heist_List[02][current_language]
        Doomsday_Heist_List[03] = Doomsday_Heist_List[03][current_language]
        Doomsday_Missions_Status = {}
        Doomsday_Missions_Status[00] = {"Incomplete","Incompléte"}
        Doomsday_Missions_Status[01] = {"Completed","Faite"}
        Doomsday_Missions_Status[02] = {"Stolen","Volée"}
        Doomsday_Missions_Status[03] = {"Skipped","Pasée"}
        Doomsday_Missions_Status[00] = Doomsday_Missions_Status[00][current_language]
        Doomsday_Missions_Status[01] = Doomsday_Missions_Status[01][current_language]
        Doomsday_Missions_Status[02] = Doomsday_Missions_Status[02][current_language]
        Doomsday_Missions_Status[03] = Doomsday_Missions_Status[03][current_language]
    -- Doomsday Setup
        Doomsday_Setup_Submenu = {"Doomsday setup","Préparation de fin du monde"}
        Doomsday_Setup_Submenu = Doomsday_Setup_Submenu[current_language]
        Doomsday_Set_Act       = {"Set dommsday act","Définir l'acte"}
        Doomsday_Set_Act       = Doomsday_Set_Act[current_language]
        Doomsday_Instant_Setup = {"Setup doomsday","Préparer fin du monde"}
        Doomsday_Instant_Setup = Doomsday_Instant_Setup[current_language]
        Doomsday_Act_Name      = {"Act","Acte"}
        Doomsday_Act_Name      = Doomsday_Act_Name[current_language]
        Doomsday_Prep          = {"Prep → ","Prép → "}
        Doomsday_Prep          = Doomsday_Prep[current_language]
        Doomsday_Setup         = {"      Status of ","     Status de "}
        Doomsday_Setup         = Doomsday_Setup[current_language]
    -- Doomsday Cuts
        Doomsday_Cuts_Submenu  = {"Doomsday cuts","Pourcentage pour fin du monde"}
        Doomsday_Cuts_Submenu  = Doomsday_Cuts_Submenu[current_language]
-- Appartement
    Appartements_Submenu = {"Appartement","Appartements"}
    Appartements_Submenu = Appartements_Submenu[current_language]
    -- Lists and Variables
        Appartements_Fleeca_Preps      = {}
        Appartements_Prison_Preps      = {}
        Appartements_Humane_Preps      = {}
        Appartements_SeriesA_Preps     = {}
        Appartements_Pacific_Preps     = {}
        ---- Fleeca
            Appartements_Fleeca_Preps[1]   = {"Scope out","Repérage"}
            Appartements_Fleeca_Preps[2]   = {"Kuruma","Kuruma"}
            Appartements_Fleeca_Preps[1]   = Appartements_Fleeca_Preps[1][current_language]
            Appartements_Fleeca_Preps[2]   = Appartements_Fleeca_Preps[2][current_language]
        ---- Prison Break
            Appartements_Prison_Preps[1]   = {"Plane","Avion"}
            Appartements_Prison_Preps[2]   = {"Bus","Bus"}
            Appartements_Prison_Preps[3]   = {"Station","Staion"}
            Appartements_Prison_Preps[4]   = {"Wet work","Sale boulot"}
            Appartements_Prison_Preps[1]   = Appartements_Prison_Preps[1][current_language]
            Appartements_Prison_Preps[2]   = Appartements_Prison_Preps[2][current_language]
            Appartements_Prison_Preps[3]   = Appartements_Prison_Preps[3][current_language]
            Appartements_Prison_Preps[4]   = Appartements_Prison_Preps[4][current_language]
        ---- Humane labs
            Appartements_Humane_Preps[1]   = {"Key codes","Codes d'accées"}
            Appartements_Humane_Preps[2]   = {"Insurgents","Insurgents"}
            Appartements_Humane_Preps[3]   = {"EMP","IEM"}
            Appartements_Humane_Preps[4]   = {"Valkyrie","Valkyrie"}
            Appartements_Humane_Preps[5]   = {"Deliver EMP","Livrer l'IEM"}
            Appartements_Humane_Preps[1]   = Appartements_Humane_Preps[1][current_language]
            Appartements_Humane_Preps[2]   = Appartements_Humane_Preps[2][current_language]
            Appartements_Humane_Preps[3]   = Appartements_Humane_Preps[3][current_language]
            Appartements_Humane_Preps[4]   = Appartements_Humane_Preps[4][current_language]
            Appartements_Humane_Preps[5]   = Appartements_Humane_Preps[5][current_language]
        ---- Series A
            Appartements_SeriesA_Preps[1]  = {"Coke","Cocaîne"}
            Appartements_SeriesA_Preps[2]  = {"Trash truck","Poubelle"}
            Appartements_SeriesA_Preps[3]  = {"Bikers","Motards"}
            Appartements_SeriesA_Preps[4]  = {"Weed","Weed"}
            Appartements_SeriesA_Preps[5]  = {"Steal meth","Voler de la méth"}
            Appartements_SeriesA_Preps[1]  = Appartements_SeriesA_Preps[1][current_language]
            Appartements_SeriesA_Preps[2]  = Appartements_SeriesA_Preps[2][current_language]
            Appartements_SeriesA_Preps[3]  = Appartements_SeriesA_Preps[3][current_language]
            Appartements_SeriesA_Preps[4]  = Appartements_SeriesA_Preps[4][current_language]
            Appartements_SeriesA_Preps[5]  = Appartements_SeriesA_Preps[5][current_language]
        ---- Pacific Standard
            Appartements_SeriesA_Preps[1]  = {"Vans","Vans"}
            Appartements_SeriesA_Preps[2]  = {"Signal","Signal"}
            Appartements_SeriesA_Preps[3]  = {"Hack","Hack"}
            Appartements_SeriesA_Preps[4]  = {"Convoy","Convoi"}
            Appartements_SeriesA_Preps[5]  = {"Bikes","Motos"}
            Appartements_Pacific_Preps[1]  = Appartements_SeriesA_Preps[1][current_language]
            Appartements_Pacific_Preps[2]  = Appartements_SeriesA_Preps[2][current_language]
            Appartements_Pacific_Preps[3]  = Appartements_SeriesA_Preps[3][current_language]
            Appartements_Pacific_Preps[4]  = Appartements_SeriesA_Preps[4][current_language]
            Appartements_Pacific_Preps[5]  = Appartements_SeriesA_Preps[5][current_language]
    -- Setup
        Appartements_Setup_Submenu = {"Appartements Setup","Préparation pour appartements"}
        Appartements_Setup_Submenu = Appartements_Setup_Submenu[current_language]
    -- Cuts
        Appartements_Cut_Submenu = {"Appartements Cuts","Pourcentage des appartements"}
        Appartements_Cut_Submenu = Appartements_Cut_Submenu[current_language]
----



-- E_Shapeshift.lua
Shapeshift_Submenu = {"Shapeshift","Changeur d'apparence"}
Shapeshift_Submenu = Shapeshift_Submenu[current_language]
-- Options
    Multiplayer_Option               = {"Turn Back Into →","Retourner en →"}
    Animal_Option                    = {"Animals →","Animaux →"}
    Cosplay_Option                   = {"Cosplay →","Cosplay →"}
    Birds_Option                     = {"Birds →","Oiseaux →"}
    Sea_Animals_Option               = {"Sea creature →","Animaux marins →"}
    Story_Female_Character_Option    = {"Story Female →","Histoire femme →"}
    Story_Male_Character_Option      = {"Story Male →","Histoire homme →"}
    Female_Character_Option          = {"Female Ped →","Femme →"}
    Male_Character_Option            = {"Male Ped →","Homme →"}
    Cutscene_Female_Character_Option = {"Cutscene Female →","Femme (Cinématique) →"}
    Cutscene_Male_Character_Option   = {"Cutscene Male →","Homme (Cinématique) →"}
    Gang_Female_Character_Option     = {"Gang Female →","Gang femme →"}
    Gang_Male_Character_Option       = {"Gang Male →","Gang homme →"}
    Law_Enforcer_Option              = {"Law enforcers →","Policier →"}
    Multiplayer_Option               = Multiplayer_Option[current_language]
    Animal_Option                    = Animal_Option[current_language]
    Cosplay_Option                   = Cosplay_Option[current_language]
    Birds_Option                     = Birds_Option[current_language]
    Sea_Animals_Option               = Sea_Animals_Option[current_language]
    Story_Female_Character_Option    = Story_Female_Character_Option[current_language]
    Story_Male_Character_Option      = Story_Male_Character_Option[current_language]
    Female_Character_Option          = Female_Character_Option[current_language]
    Male_Character_Option            = Male_Character_Option[current_language]
    Cutscene_Female_Character_Option = Cutscene_Female_Character_Option[current_language]
    Cutscene_Male_Character_Option   = Cutscene_Male_Character_Option[current_language]
    Gang_Female_Character_Option     = Gang_Female_Character_Option[current_language]
    Gang_Male_Character_Option       = Gang_Male_Character_Option[current_language]
    Law_Enforcer_Option              = Law_Enforcer_Option[current_language]
----



-- F_Main.lua
Menu_Submenu     = {"Main menu","Menu principal"}
Menu_Submenu     = Menu_Submenu[current_language]
Settings_Submenu = {"Settings","Paramétre"}
Settings_Submenu = Settings_Submenu[current_language]
-- List and Variables
    units_text    = {}
    units_text[1] = {"kilometres per hour","Kilométres par heures"}
    units_text[2] = {"metres per second","métres par secondes"}
    units_text[3] = {"miles per hour","miles par heures"}
    units_text[4] = {"feet per second","pieds par secondes"}
    units_text[1] = units_text[1][current_language]
    units_text[2] = units_text[2][current_language]
    units_text[3] = units_text[3][current_language]
    units_text[4] = units_text[4][current_language]
    Gender        = {}
    Gender[1]     = {"Male","Homme"}
    Gender[2]     = {"Female","Femme"}
    Gender[1]     = Gender[1][current_language]
    Gender[2]     = Gender[2][current_language]
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
        Achivement_List[01] = Achivement_List[01][current_language]
        Achivement_List[02] = Achivement_List[02][current_language]
        Achivement_List[03] = Achivement_List[03][current_language]
        Achivement_List[04] = Achivement_List[04][current_language]
        Achivement_List[05] = Achivement_List[05][current_language]
        Achivement_List[06] = Achivement_List[06][current_language]
        Achivement_List[07] = Achivement_List[07][current_language]
        Achivement_List[08] = Achivement_List[08][current_language]
        Achivement_List[09] = Achivement_List[09][current_language]
        Achivement_List[10] = Achivement_List[10][current_language]
        Achivement_List[11] = Achivement_List[11][current_language]
        Achivement_List[12] = Achivement_List[12][current_language]
        Achivement_List[13] = Achivement_List[13][current_language]
        Achivement_List[14] = Achivement_List[14][current_language]
        Achivement_List[15] = Achivement_List[15][current_language]
        Achivement_List[16] = Achivement_List[16][current_language]
        Achivement_List[17] = Achivement_List[17][current_language]
        Achivement_List[18] = Achivement_List[18][current_language]
        Achivement_List[19] = Achivement_List[19][current_language]
        Achivement_List[20] = Achivement_List[20][current_language]
        Achivement_List[21] = Achivement_List[21][current_language]
        Achivement_List[22] = Achivement_List[22][current_language]
        Achivement_List[23] = Achivement_List[23][current_language]
        Achivement_List[24] = Achivement_List[24][current_language]
        Achivement_List[25] = Achivement_List[25][current_language]
        Achivement_List[26] = Achivement_List[26][current_language]
        Achivement_List[27] = Achivement_List[27][current_language]
        Achivement_List[28] = Achivement_List[28][current_language]
        Achivement_List[29] = Achivement_List[29][current_language]
        Achivement_List[30] = Achivement_List[30][current_language]
        Achivement_List[31] = Achivement_List[31][current_language]
        Achivement_List[32] = Achivement_List[32][current_language]
        Achivement_List[33] = Achivement_List[33][current_language]
        Achivement_List[34] = Achivement_List[34][current_language]
        Achivement_List[35] = Achivement_List[35][current_language]
        Achivement_List[36] = Achivement_List[36][current_language]
        Achivement_List[37] = Achivement_List[37][current_language]
        Achivement_List[38] = Achivement_List[38][current_language]
        Achivement_List[39] = Achivement_List[39][current_language]
        Achivement_List[40] = Achivement_List[40][current_language]
        Achivement_List[41] = Achivement_List[41][current_language]
        Achivement_List[42] = Achivement_List[42][current_language]
        Achivement_List[43] = Achivement_List[43][current_language]
        Achivement_List[44] = Achivement_List[44][current_language]
        Achivement_List[45] = Achivement_List[45][current_language]
        Achivement_List[46] = Achivement_List[46][current_language]
        Achivement_List[47] = Achivement_List[47][current_language]
        Achivement_List[48] = Achivement_List[48][current_language]
        Achivement_List[49] = Achivement_List[49][current_language]
        Achivement_List[50] = Achivement_List[50][current_language]
        Achivement_List[51] = Achivement_List[51][current_language]
        Achivement_List[52] = Achivement_List[52][current_language]
        Achivement_List[53] = Achivement_List[53][current_language]
        Achivement_List[54] = Achivement_List[54][current_language]
        Achivement_List[55] = Achivement_List[55][current_language]
        Achivement_List[56] = Achivement_List[56][current_language]
        Achivement_List[57] = Achivement_List[57][current_language]
        Achivement_List[58] = Achivement_List[58][current_language]
        Achivement_List[59] = Achivement_List[59][current_language]
        Achivement_List[60] = Achivement_List[60][current_language]
        Achivement_List[61] = Achivement_List[61][current_language]
        Achivement_List[62] = Achivement_List[62][current_language]
        Achivement_List[63] = Achivement_List[63][current_language]
        Achivement_List[64] = Achivement_List[64][current_language]
        Achivement_List[65] = Achivement_List[65][current_language]
        Achivement_List[66] = Achivement_List[66][current_language]
        Achivement_List[67] = Achivement_List[67][current_language]
        Achivement_List[68] = Achivement_List[68][current_language]
        Achivement_List[69] = Achivement_List[69][current_language]
        Achivement_List[70] = Achivement_List[70][current_language]
        Achivement_List[71] = Achivement_List[71][current_language]
        Achivement_List[72] = Achivement_List[72][current_language]
        Achivement_List[73] = Achivement_List[73][current_language]
        Achivement_List[74] = Achivement_List[74][current_language]
        Achivement_List[75] = Achivement_List[75][current_language]
        Achivement_List[76] = Achivement_List[76][current_language]
        Achivement_List[77] = Achivement_List[77][current_language]
-- Settings
    Settings_Menu_Language = {"Language","Langue"}
    Settings_Language      = Settings_Menu_Language[current_language]
    Settings_Reload        = {"Reload Menu after changes","Recharger le menu aprés changements"}
    Settings_Reload        = Settings_Reload[current_language]
    Settings_Binds_Menu    = {"See/Modify bindings","Voir/Modifier les raccourcis"}
    Settings_Binds_Menu    = Settings_Binds_Menu[current_language]
    Shapeshift_Gender      = {"Default gender for character","Genre du personnage par default"}
    Shapeshift_Gender      = Shapeshift_Gender[current_language]
    Removed_Cars_Default   = {"Activate removed cars by default?","Activer les voitures enlever par default"}
    Removed_Cars_Default   = Removed_Cars_Default[current_language]
    Boost_Key              = {"Boost key","Bouton de Boost"}
    Boost_Key              = Boost_Key[current_language]
    Settings_Boost_Default = {"Enable boost button by default?","Activer le Bouton de Boost"}
    Settings_Boost_Default = Settings_Boost_Default[current_language]
    Refill_Key             = {"Refill Inventory","Remplir l'inventaire"}
    Refill_Key             = Refill_Key[current_language]
    -- Numberplates
        Settings_Numberplates_enable = {"Show speedometer on numberplates","Activer la vitesse sur les plaques"}
        Settings_Numberplates_enable = Settings_Numberplates_enable[current_language]
        Settings_Numberplates_unit   = {"Speedometer unit","Unité de vitesse"}
        Settings_Numberplates_unit   = Settings_Numberplates_unit[current_language]
        Settings_Numberplates_Binds  = {"Quick setup","Assignement rapide"}
        Settings_Numberplates_Binds  = Settings_Numberplates_Binds[current_language]
        Custom_Numberplates          = {"Custom numberplates by default?","Plasques customs par default?"}
        Custom_Numberplates          = Custom_Numberplates[current_language]
    -- Menu thigies
        Menu_Bindings        = {"Menu","Menu"}
        Menu_Bindings        = Menu_Bindings[current_language]
        Menu_Bindings_Toggle = {"Show/Hide","Montrer/Cahcer"}
        Menu_Bindings_Select = {"Select"   ,"Selectioner"}
        Menu_Bindings_Back   = {"Back"     ,"Retour"}
        Menu_Bindings_Up     = {"Up"       ,"Haut"}
        Menu_Bindings_Down   = {"Down"     ,"Bas"}
        Menu_Bindings_Right  = {"Right"    ,"Droite"}
        Menu_Bindings_Left   = {"Left"     ,"Gauche"}
        Menu_Bindings_Toggle = Menu_Bindings_Toggle[current_language]
        Menu_Bindings_Select = Menu_Bindings_Select[current_language]
        Menu_Bindings_Back   = Menu_Bindings_Back[current_language]
        Menu_Bindings_Up     = Menu_Bindings_Up[current_language]
        Menu_Bindings_Down   = Menu_Bindings_Down[current_language]
        Menu_Bindings_Right  = Menu_Bindings_Right[current_language]
        Menu_Bindings_Left   = Menu_Bindings_Left[current_language]
-- Main menu
    -- Movement
        Mouvement_Foward        = {"Fowards","Avancer"}
        Mouvement_Backward      = {"Backwards","Desactiver"}
        Mouvement_Left          = {"Left","Gauche"}
        Mouvement_Right         = {"Right","Droite"}
        Mouvement_TrunLeft      = {"Turn left","Tourner a gauche"}
        Mouvement_Turnright     = {"Turn right","Tourner a droite"}
        Mouvement_IncreaseSpeed = {"Increase speed","Augmenter la vitesse"}
        Mouvement_DecreaseSpeed = {"Decrease speed","Diminuer la vitesse"}
        Mouvement_Foward        = Mouvement_Foward[current_language]
        Mouvement_Backward      = Mouvement_Backward[current_language]
        Mouvement_Left          = Mouvement_Left[current_language]
        Mouvement_Right         = Mouvement_Right[current_language]
        Mouvement_TrunLeft      = Mouvement_TrunLeft[current_language]
        Mouvement_TurnRight     = Mouvement_Turnright[current_language]
        Mouvement_IncreaseSpeed = Mouvement_IncreaseSpeed[current_language]
        Mouvement_DecreaseSpeed = Mouvement_DecreaseSpeed[current_language]
    -- Noclip
        Menu_Noclip        = {"Noclip","Noclip"}
        Menu_Noclip        = Menu_Noclip[current_language]
        Menu_Noclip_Speed  = {"  Noclip Speed","  Vitesse du noclip"}
        Menu_Noclip_Speed  = Menu_Noclip_Speed[current_language]
        Menu_Noclip_Toggle = {"Toggle","Activer/Désactiver"}
        Menu_Noclip_Toggle = Menu_Noclip_Toggle[current_language]
    -- Numberplates / Speedometer
        -- Speedometer
            Menu_Numberplates                = {"Numberplates / Speedometer","Compteur de vitesse / Plaques"}
            Menu_Numberplates                = Menu_Numberplates[current_language]
            Menu_Speedometer_Bindings        = {"Speedometer","Compteur de vitesse"}
            Menu_Speedometer_Bindings        = Menu_Speedometer_Bindings[current_language]
            Menu_Numberplates_Speed          = {"  Speed: ","  Vitesse:"}
            Menu_Numberplates_Speed          = Menu_Numberplates_Speed[current_language]
            Menu_Numberplates_NotInVehicle   = {"Not in vehicle","Pas dans un vehicule"}
            Menu_Numberplates_NotInVehicle   = Menu_Numberplates_NotInVehicle[current_language]
            Menu_Numberplates_InvalidVehicle = {"Invalid vehicle","Vehicule invalide"}
            Menu_Numberplates_InvalidVehicle = Menu_Numberplates_InvalidVehicle[current_language]
        -- Numberplates
            Numberplate_Custom_Manage    = {"Manage custom plates","Gerer les plaques customs"}
            Numberplate_Custom_Manage    = Numberplate_Custom_Manage[current_language]
            Numberplate_Custom_Delete    = {"Delete","Suprimer"}
            Numberplate_Custom_Delete    = Numberplate_Custom_Delete[current_language]
            Numberplate_Custom_Apply     = {"Apply","Appliquer"}
            Numberplate_Custom_Apply     = Numberplate_Custom_Apply[current_language]
            Numberplate_Custom_Choose    = {"Choose this plate as default","Mettre cette plaque en default"}
            Numberplate_Custom_Choose    = Numberplate_Custom_Choose[current_language]
            Numberplate_Custom_Preview   = {"________________↓ Preview ↓_________________","________________↓ Apercu ↓_________________"}
            Numberplate_Custom_Preview   = Numberplate_Custom_Preview[current_language]
            Numberplate_Custom_Character = {"Character n°","Charactere n°"}
            Numberplate_Custom_Character = Numberplate_Custom_Character[current_language]
            Numberplate_Custom_SavePlate = {"Save","Sauvegarder"}
            Numberplate_Custom_SavePlate = Numberplate_Custom_SavePlate[current_language]
            Numberplate_Custom_Toggle    = {"Activate custom plates","Activer les plaques customs"}
            Numberplate_Custom_Toggle    = Numberplate_Custom_Toggle[current_language]
    -- Other's cool ppl script (modified)
        colorStyles    = {}
        colorStyles[1] = {"Rainbow","Arc-en-ciel"}
        colorStyles[2] = {"Strobelight","Clignotement"}
        colorStyles[3] = {"Random","Aléatiore"}
        colorStyles[1] = colorStyles[1][current_language]
        colorStyles[2] = colorStyles[2][current_language]
        colorStyles[3] = colorStyles[3][current_language]
        -- Boost Go Brrrrr
            Boost_Menu     = {"Boost menu","Boost de voiture (NOS)"}
            Boost_Menu     = Boost_Menu[current_language]
            Boost_Toggle   = {"Boost on press ?","Booster avec touche"}
            Boost_Toggle   = Boost_Toggle[current_language]
            Boost_Strength = {"Car Boost strength","Force du Boost"}
            Boost_Strength = Boost_Strength[current_language]
        -- Gay Car
            Rainbow_Menu    = {"Rainbow menu (You Only)","Couleur Voiture Custom (Seul Toi)"}
            Rainbow_Menu    = Rainbow_Menu[current_language]
            Rainbow_Toggle  = {"Activate Rainbow Car","Activer les effets"}
            Rainbow_Toggle  = Rainbow_Toggle[current_language]
            Rainbow_Style   = {"Style →","Style →"}
            Rainbow_Style   = Rainbow_Style[current_language]
            Rainbow_Uniform = {"Uniform color","Couleur uniforme"}
            Rainbow_Uniform = Rainbow_Uniform[current_language]
            Rainbow_Traffic = {"Affect traffic","Affecter le traffic"}
            Rainbow_Traffic = Rainbow_Traffic[current_language]
            Rainbow_Mul     = {"Rainbow Speed Multiplier","Multiplicateur de vitesse"}
            Rainbow_Mul     = Rainbow_Mul[current_language]
    -- Other
        Menu_NoScratch          = {"No scratch","Pas d'égratinure"}
        Menu_NoScratch          = Menu_NoScratch[current_language]
        Menu_Disable_AutoStop   = {"Disable engine auto stop","Désactivez l'arret auto du moteur"}
        Menu_Disable_AutoStop   = Menu_Disable_AutoStop[current_language]
        Menu_LSC_Reset          = {"Reset LSC vehicle sell limit","Reinitialisez la limite de vente pour LSC"}
        Menu_LSC_Reset          = Menu_LSC_Reset[current_language]
        Menu_EnhancedOnline     = {"_________Enhanced online services________","_______Services en ligne augmenté______"}
        Menu_EnhancedOnline     = Menu_EnhancedOnline[current_language]
        Menu_RemovedCars_Toggle = {"Activate removed cars","Activer les voitures enlever"}
        Menu_RemovedCars_Toggle = Menu_RemovedCars_Toggle[current_language]
        Menu_Nightclub_Popular  = {"Make nightclub popular","Maxer la popularité de la boite de nuit"}
        Menu_Nightclub_Popular  = Menu_Nightclub_Popular[current_language]
        Menu_Challenge          = {"N° of challengs for carmeet prize","N° de challenges pour le salon auto"}
        Menu_Challenge          = Menu_Challenge[current_language]
        Menu_Report_Menu        = {"Report stats","Statistique de signalement"}
        Menu_Report_Menu        = Menu_Report_Menu[current_language]
        Menu_Readonly           = {"__________________Read only________________","_______________Lecture seule_______________"}
        Menu_Readonly           = Menu_Readonly[current_language]
        Manu_TransactionError   = {"Remove transaction error","Enlever l'erreur de transaction"}
        Manu_TransactionError   = Manu_TransactionError[current_language]
        -- Stat List / Unlocks / Tunable
            Unlock_Tunable_Menu = {"Unlocks/Tunable menu","Menu de débloquage"}
            Unlock_Tunable_Menu = Unlock_Tunable_Menu[current_language]
            Achivement_Menu     = {"Achievements","Succés"}
            Achivement_Menu     = Achivement_Menu[current_language]
            -- Unlocks
                Unlocks_Daily     = {"Unlock Daily Objectives Awards","Débloquer les recompenses des objectifs"}
                Unlocks_Daily     = Unlocks_Daily[current_language]
                Unlocks_Parachute = {"Unlock Rare Parachutes","Débloquer les parachutes"}
                Unlocks_Parachute = Unlocks_Parachute[current_language]
                Unlocks_Unicorn   = {"Unlock Vanilla Unicorn","Débloquer Vanilla Unicorn"}
                Unlocks_Unicorn   = Unlocks_Unicorn[current_language]
                Unlocks_taxi      = {"Unlock Taxi Liverys","Débloquer les patterns taxis"}
                Unlocks_taxi      = Unlocks_taxi[current_language]
                Unlocks_tatoos    = {"Unlock All Tattoos","Débloquer les tatoos"}
                Unlocks_tatoos    = Unlocks_tatoos[current_language]
                Unlocks_flight    = {"Unlock Flight School Gold Medals","Débloquer les médailles de l'école"}
                Unlocks_flight    = Unlocks_flight[current_language]
                Unlocks_shooting  = {"Unlock Shooting Range Rewards","Débloquer les recompenses de Amunation"}
                Unlocks_shooting  = Unlocks_shooting[current_language]
            -- Stats
                Stats_Menu     = {"Online Character Stats","Performance du Personage Online"}
                Stats_Menu     = Stats_Menu[current_language]
                Stats_Stamina  = {"Stamina"      ,"Stamina"}
                Stats_Strength = {"Strength"     ,"Force"}
                Stats_Lung     = {"Lung capacity","Respiration"}
                Stats_Driving  = {"Driving"      ,"Conduite"}
                Stats_Flying   = {"Flying"       ,"Vol"}
                Stats_Shooting = {"Shooting"     ,"Tir"}
                Stats_Stealth  = {"Stealth"      ,"Discretion"}
                Stats_Mechanic = {"Mechanic"     ,"Méchanique"}
                Stats_Stamina  = Stats_Stamina[current_language]
                Stats_Strength = Stats_Strength[current_language]
                Stats_Lung     = Stats_Lung[current_language]
                Stats_Driving  = Stats_Driving[current_language]
                Stats_Flying   = Stats_Flying[current_language]
                Stats_Shooting = Stats_Shooting[current_language]
                Stats_Stealth  = Stats_Stealth[current_language]
                Stats_Mechanic = Stats_Mechanic[current_language]
            -- Report
                Report_List = {}
                Report_List[01] = {"Griefing","Griefing"}
                Report_List[02] = {"Exploits","Abus"}
                Report_List[03] = {"Bug exploits","Abus de bug"}
                Report_List[04] = {"Text chat: Annoying me","Chat texte: M'agace"}
                Report_List[05] = {"Text chat: Using hate speech","Chat texte: Discrimination"}
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
                Report_List[01] = Report_List[01][current_language]
                Report_List[02] = Report_List[02][current_language]
                Report_List[03] = Report_List[03][current_language]
                Report_List[04] = Report_List[04][current_language]
                Report_List[05] = Report_List[05][current_language]
                Report_List[06] = Report_List[06][current_language]
                Report_List[07] = Report_List[07][current_language]
                Report_List[08] = Report_List[08][current_language]
                Report_List[09] = Report_List[09][current_language]
                Report_List[10] = Report_List[10][current_language]
                Report_List[11] = Report_List[11][current_language]
                Report_List[12] = Report_List[12][current_language]
                Report_List[13] = Report_List[13][current_language]
                Report_List[14] = Report_List[14][current_language]
                Report_List[15] = Report_List[15][current_language]
                Report_List[16] = Report_List[16][current_language]
--