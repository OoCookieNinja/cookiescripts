require("scripts/globals")
require("scripts/A_language")
local success, settings = pcall(json.loadfile, Settings_JSON_Filename)
-- 01
-- 02
-- 03
-- 04
-- 05
-- 06
-- 07
-- 08
-- 09

--------- Functions ---------

local function get_Delay()
	delay, increase = 0, 0.01
	globals.set_int(Shapeshift_Trigger, 1)
	while(true) do
		delay = delay + increase
		sleep(increase)
		if globals.get_int(Shapeshift_Trigger) == 0 then
			return delay + increase
		end
	end
end
local function set_model_hash(h)
	delay = get_Delay()
	count = 0
	while h ~= 0 do
		myped = player.get_player_ped()
		if not myped or myped:get_model_hash() == h or count == 10 then
			return
		end
		globals.set_int(Shapeshift_Trigger, 1)
		if h then
			globals.set_int(Shapeshift_Hash,h)
		end
		sleep(delay)
		globals.set_int(Shapeshift_Trigger,0)
		globals.set_int(Shapeshift_Hash,0)
		sleep(0.1)
		count = count + 1
	end
end

--------- Lists and Variables ---------

local Multipayer_Character_index = settings.Gender
local Animals_index = 1
local Cosplay_index = 1
local Birds_index = 1
local Sea_Animals_index = 1
local Story_Female_Character_index = 1
local Story_Male_Character_index = 1
local Female_Character_index = 1
local Male_Character_index = 1
local Female_Cutscene_index = 1
local Male_Cutscene_index = 1
local Gang_Female_Character_index = 1
local Gang_Male_Character_index = 1
local Law_Inforcer_index = 1

--------- Character List ---------

--- ✓ Multipayer Character
    local Multiplayer_name = {}
        Multiplayer_name_01 = {"MP Male","MP Homme"}
        Multiplayer_name_02 = {"MP Female","MP Femme"}
        Multiplayer_name[01]      = Multiplayer_name_01[current_language]
        Multiplayer_name[02]      = Multiplayer_name_02[current_language]
    local Multiplayer_hash = {}
        Multiplayer_hash[01]      = "mp_m_freemode_01"
        Multiplayer_hash[02]      = "mp_f_freemode_01"
--- ✓ Animals
    local Animal_name = {}
        Animal_name_01 = {"Boar","Sanglier"}
        Animal_name_02 = {"Cat","Chat"}
        Animal_name_03 = {"Chimp","Chimpanzé"}
        Animal_name_04 = {"Chop","Chop"}
        Animal_name_05 = {"Chop 2","Chop 2"}
        Animal_name_06 = {"Cow","Vache"}
        Animal_name_07 = {"Coyote","Coyote"}
        Animal_name_08 = {"Deer","Biche"}
        Animal_name_09 = {"Husky","husky"}
        Animal_name_10 = {"Mountain Lion","Couguar"}
        Animal_name_11 = {"Panther","Panthére"}
        Animal_name_12 = {"Pig","Cochon"}
        Animal_name_13 = {"Poodle","Poodle"}
        Animal_name_14 = {"Pug","Bulldog"}
        Animal_name_15 = {"Rabiit","Lapin"}
        Animal_name_16 = {"Rat","Rat"}
        Animal_name_17 = {"Retriever","Retriever"}
        Animal_name_18 = {"Rottweiler","Rottweiler"}
        Animal_name_19 = {"Shepherd","Shepard"}
        Animal_name_20 = {"Rhesus","Rhesus"}
        Animal_name_21 = {"Westy","Westie"}
        Animal_name[01]      = Animal_name_01[current_language]
        Animal_name[02]      = Animal_name_02[current_language]
        Animal_name[03]      = Animal_name_03[current_language]
        Animal_name[04]      = Animal_name_04[current_language]
        Animal_name[05]      = Animal_name_05[current_language]
        Animal_name[06]      = Animal_name_06[current_language]
        Animal_name[07]      = Animal_name_07[current_language]
        Animal_name[08]      = Animal_name_08[current_language]
        Animal_name[09]      = Animal_name_09[current_language]
        Animal_name[10]      = Animal_name_10[current_language]
        Animal_name[11]      = Animal_name_11[current_language]
        Animal_name[12]      = Animal_name_12[current_language]
        Animal_name[13]      = Animal_name_13[current_language]
        Animal_name[14]      = Animal_name_14[current_language]
        Animal_name[15]      = Animal_name_15[current_language]
        Animal_name[16]      = Animal_name_16[current_language]
        Animal_name[17]      = Animal_name_17[current_language]
        Animal_name[18]      = Animal_name_18[current_language]
        Animal_name[19]      = Animal_name_19[current_language]
        Animal_name[20]      = Animal_name_20[current_language]
        Animal_name[21]      = Animal_name_21[current_language]
    local Animal_hash = {}
        Animal_hash[01]      = "a_c_boar"
        Animal_hash[02]      = "a_c_cat_01"
        Animal_hash[03]      = "a_c_chimp"
        Animal_hash[04]      = "a_c_chop"
        Animal_hash[05]      = "a_c_chop_02"
        Animal_hash[06]      = "a_c_cow"
        Animal_hash[07]      = "a_c_coyote"
        Animal_hash[08]      = "a_c_deer"
        Animal_hash[09]      = "a_c_husky"
        Animal_hash[10]      = "a_c_mtlion"
        Animal_hash[11]      = "a_c_panther"
        Animal_hash[12]      = "a_c_pig"
        Animal_hash[13]      = "a_c_poodle"
        Animal_hash[14]      = "a_c_pug"
        Animal_hash[15]      = "a_c_rabbit_01"
        Animal_hash[16]      = "a_c_rat"
        Animal_hash[17]      = "a_c_retriever"
        Animal_hash[18]      = "a_c_rottweiler"
        Animal_hash[19]      = "a_c_shepherd"
        Animal_hash[20]      = "a_c_rhesus"
        Animal_hash[21]      = "a_c_westy"
--- ✓ Cosplay
    local Cosplay_name = {}
        Cosplay_name_01 = {"Clown","Clown"}
        Cosplay_name_02 = {"Impotent Rage","Impotent Rage"}
        Cosplay_name_03 = {"Jesus","Jesus"}
        Cosplay_name_04 = {"Movie Alien","Alien"}
        Cosplay_name_05 = {"Astronaut","Astronaute"}
        Cosplay_name_06 = {"Pogo","Pogo"}
        Cosplay_name_07 = {"Priest","Prétre"}
        Cosplay_name_08 = {"RsRanger","RsRanger"}
        Cosplay_name_09 = {"Zombie","Zombie"}
        Cosplay_name_10 = {"Johnny Klebitz","Johnny Klebitz"}
        Cosplay_name_11 = {"Mime","Mime"}
        Cosplay_name_12 = {"Orleans","Orléans"}
        Cosplay_name_13 = {"Juggernaut","Juggernaut"}
        Cosplay_name_14 = {"Cropse","Corps"}
        Cosplay_name[01]      = Cosplay_name_01[current_language]
        Cosplay_name[02]      = Cosplay_name_02[current_language]
        Cosplay_name[03]      = Cosplay_name_03[current_language]
        Cosplay_name[04]      = Cosplay_name_04[current_language]
        Cosplay_name[05]      = Cosplay_name_05[current_language]
        Cosplay_name[06]      = Cosplay_name_06[current_language]
        Cosplay_name[07]      = Cosplay_name_07[current_language]
        Cosplay_name[08]      = Cosplay_name_08[current_language]
        Cosplay_name[09]      = Cosplay_name_09[current_language]
        Cosplay_name[10]      = Cosplay_name_10[current_language]
        Cosplay_name[11]      = Cosplay_name_11[current_language]
        Cosplay_name[12]      = Cosplay_name_12[current_language]
        Cosplay_name[13]      = Cosplay_name_13[current_language]
        Cosplay_name[14]      = Cosplay_name_14[current_language]
    local Cosplay_hash = {}
        Cosplay_hash[01]      = "s_m_y_clown_01"
        Cosplay_hash[02]      = "u_m_y_imporage"
        Cosplay_hash[03]      = "u_m_m_jesus_01"
        Cosplay_hash[04]      = "s_m_m_movalien_01"
        Cosplay_hash[05]      = "s_m_m_movspace_01"
        Cosplay_hash[06]      = "u_m_y_pogo_01"
        Cosplay_hash[07]      = "ig_priest"
        Cosplay_hash[08]      = "u_m_y_rsranger_01"
        Cosplay_hash[09]      = "u_m_y_zombie_01"
        Cosplay_hash[10]      = "ig_johnnyklebitz"
        Cosplay_hash[11]      = "s_m_y_mime"
        Cosplay_hash[12]      = "ig_orleans"
        Cosplay_hash[13]      = "u_m_y_juggernaut_01"
        Cosplay_hash[14]      = "u_m_y_corpse_01"
--- ✓ Birds
    local Birds_name = {}
        Birds_name_01 = {"Chicken Hawk","Poulet"}
        Birds_name_02 = {"Comorant-swan like","Camarant"}
        Birds_name_03 = {"Crow","Corbeau"}
        Birds_name_04 = {"Hen","Poule"}
        Birds_name_05 = {"Pigeon","Pigeon"}
        Birds_name_06 = {"Seagull","Mouette"}
        Birds_name[01]      = Birds_name_01[current_language]
        Birds_name[02]      = Birds_name_02[current_language]
        Birds_name[03]      = Birds_name_03[current_language]
        Birds_name[04]      = Birds_name_04[current_language]
        Birds_name[05]      = Birds_name_05[current_language]
        Birds_name[06]      = Birds_name_06[current_language]
    local Birds_hash = {}
        Birds_hash[01]      = "a_c_chickenhawk"
        Birds_hash[02]      = "a_c_cormorant"
        Birds_hash[03]      = "a_c_crow"
        Birds_hash[04]      = "a_c_hen"
        Birds_hash[05]      = "a_c_pigeon"
        Birds_hash[06]      = "a_c_seagull"
--- ✓ Sea Animals
    local Sea_Animals_name = {}
        Sea_Animals_name_01 = {"Dolphin","Dauphin"}
        Sea_Animals_name_02 = {"Fish","Poisson"}
        Sea_Animals_name_03 = {"Grey Whale","Baleine Grise"}
        Sea_Animals_name_04 = {"Humpback","Baleine"}
        Sea_Animals_name_05 = {"HammerHead Shark","Requin Marteau"}
        Sea_Animals_name_06 = {"Killer Whale","Baleine Tueuse"}
        Sea_Animals_name_07 = {"Sting Ray","Raie"}
        Sea_Animals_name_08 = {"Tiger Shark","Requin Tigre"}
        Sea_Animals_name[01]      = Sea_Animals_name_01[current_language]
        Sea_Animals_name[02]      = Sea_Animals_name_02[current_language]
        Sea_Animals_name[03]      = Sea_Animals_name_03[current_language]
        Sea_Animals_name[04]      = Sea_Animals_name_04[current_language]
        Sea_Animals_name[05]      = Sea_Animals_name_05[current_language]
        Sea_Animals_name[06]      = Sea_Animals_name_06[current_language]
        Sea_Animals_name[07]      = Sea_Animals_name_07[current_language]
        Sea_Animals_name[08]      = Sea_Animals_name_08[current_language]
    local Sea_Animals_hash = {}
        Sea_Animals_hash[01]      = "a_c_dolphin"
        Sea_Animals_hash[02]      = "a_c_fish"
        Sea_Animals_hash[03]      = "a_c_whalegrey"
        Sea_Animals_hash[04]      = "a_c_humpback"
        Sea_Animals_hash[05]      = "a_c_sharkhammer"
        Sea_Animals_hash[06]      = "a_c_killerwhale"
        Sea_Animals_hash[07]      = "a_c_stingray"
        Sea_Animals_hash[08]      = "a_c_sharktiger"
--- ✓ Story Female Character
    local Story_Female_Character_name = {}
        Story_Female_Character_name_01 = {"Agatha","Agatha"}
        Story_Female_Character_name_02 = {"Amanda Townley","Amanda Townley"}
        Story_Female_Character_name_03 = {"Denise","Denise"}
        Story_Female_Character_name_04 = {"Denise Friend CS","Ami De Denise"}
        Story_Female_Character_name_05 = {"Georgina Cheng","Georgina Cheng"}
        Story_Female_Character_name_06 = {"Imani","Imani"}
        Story_Female_Character_name_07 = {"Maryann","Maryann"}
        Story_Female_Character_name_08 = {"Mimi","Mimi"}
        Story_Female_Character_name_09 = {"Mrs Phillips","Mme Phillips"}
        Story_Female_Character_name_10 = {"Paige","Paige"}
        Story_Female_Character_name_11 = {"Prologue Hostage Femme","Prologue Hôtage Femme"}
        Story_Female_Character_name_12 = {"Sessanta","Sessanta"}
        Story_Female_Character_name_13 = {"Tanisha","Tanisha"}
        Story_Female_Character_name_14 = {"Tonya","Tonya"}
        Story_Female_Character_name_15 = {"TracyDisanto","TracyDisanto"}
        Story_Female_Character_name[01]      = Story_Female_Character_name_01[current_language]
        Story_Female_Character_name[02]      = Story_Female_Character_name_02[current_language]
        Story_Female_Character_name[03]      = Story_Female_Character_name_03[current_language]
        Story_Female_Character_name[04]      = Story_Female_Character_name_04[current_language]
        Story_Female_Character_name[05]      = Story_Female_Character_name_05[current_language]
        Story_Female_Character_name[06]      = Story_Female_Character_name_06[current_language]
        Story_Female_Character_name[07]      = Story_Female_Character_name_07[current_language]
        Story_Female_Character_name[08]      = Story_Female_Character_name_08[current_language]
        Story_Female_Character_name[09]      = Story_Female_Character_name_09[current_language]
        Story_Female_Character_name[10]      = Story_Female_Character_name_10[current_language]
        Story_Female_Character_name[11]      = Story_Female_Character_name_11[current_language]
        Story_Female_Character_name[12]      = Story_Female_Character_name_12[current_language]
        Story_Female_Character_name[13]      = Story_Female_Character_name_13[current_language]
        Story_Female_Character_name[14]      = Story_Female_Character_name_14[current_language]
        Story_Female_Character_name[15]      = Story_Female_Character_name_15[current_language]
    local Story_Female_Character_hash = {}
        Story_Female_Character_hash[01]      = "ig_agatha"
        Story_Female_Character_hash[02]      = "ig_amandatownley"
        Story_Female_Character_hash[03]      = "ig_denise"
        Story_Female_Character_hash[04]      = "csb_denise_friend"
        Story_Female_Character_hash[05]      = "ig_georginacheng"
        Story_Female_Character_hash[06]      = "ig_imani"
        Story_Female_Character_hash[07]      = "ig_maryann"
        Story_Female_Character_hash[08]      = "ig_mimi"
        Story_Female_Character_hash[09]      = "ig_mrsphillips"
        Story_Female_Character_hash[10]      = "ig_paige"
        Story_Female_Character_hash[11]      = "a_f_m_prolhost_01"
        Story_Female_Character_hash[12]      = "ig_sessanta"
        Story_Female_Character_hash[13]      = "ig_tanisha"
        Story_Female_Character_hash[14]      = "ig_tonya"
        Story_Female_Character_hash[15]      = "ig_tracydisanto"
--- ✓ Story Male Character
    local Story_Male_Character_name = {}
        Story_Male_Character_name_01 = {"Agent 14","Agent 14"}
        Story_Male_Character_name_02 = {"Dr. Dre","Dr. Dre"}
        Story_Male_Character_name_03 = {"Avi Schwartzman","Avi Schwartzman"}
        Story_Male_Character_name_04 = {"Avon","Avon"}
        Story_Male_Character_name_05 = {"Barry","Barry"}
        Story_Male_Character_name_06 = {"Billionaire","Milliardaire"}
        Story_Male_Character_name_07 = {"Brad","Brad"}
        Story_Male_Character_name_08 = {"Dave Norton","Dave Norton"}
        Story_Male_Character_name_09 = {"Devin","Devin"}
        Story_Male_Character_name_10 = {"Devin (Security)","Devin (Sécurité)"}
        Story_Male_Character_name_11 = {"Dom","Dom"}
        Story_Male_Character_name_12 = {"Dr Friedlander","Dr Friedlander"}
        Story_Male_Character_name_13 = {"Ed Toh","Ed Toh"}
        Story_Male_Character_name_14 = {"English Dave","English Dave"}
        Story_Male_Character_name_15 = {"English Dave 2","English Dave 2"}
        Story_Male_Character_name_16 = {"Fabien","Fabien"}
        Story_Male_Character_name_17 = {"Floyd","Floyd"}
        Story_Male_Character_name_18 = {"Gustavo","Gustavo"}
        Story_Male_Character_name_19 = {"Franklin","Franklin"}
        Story_Male_Character_name_20 = {"Franklin (New)","Franklin (Nouveau)"}
        Story_Male_Character_name_21 = {"Hacker","Hacker"}
        Story_Male_Character_name_22 = {"Hao","Hao"}
        Story_Male_Character_name_23 = {"Jay Norris","Jay Norris"}
        Story_Male_Character_name_24 = {"Jimmy Disanto","Jimmy Disanto"}
        Story_Male_Character_name_25 = {"Jimmy Disanto 2","Jimmy Disanto 2"}
        Story_Male_Character_name_26 = {"Lamar Davis","Lamar Davis"}
        Story_Male_Character_name_27 = {"Lazlow","Lazlow"}
        Story_Male_Character_name_28 = {"Lazlow 2","Lazlow 2"}
        Story_Male_Character_name_29 = {"Lester Crest 1","Lester Crest 1"}
        Story_Male_Character_name_30 = {"Lester Crest 2","Lester Crest 2"}
        Story_Male_Character_name_31 = {"Lester Crest 3","Lester Crest 3"}
        Story_Male_Character_name_32 = {"Life Invader 01","Life Invader 01"}
        Story_Male_Character_name_33 = {"Life Invader 02","Life Invader 02"}
        Story_Male_Character_name_34 = {"Life Invader 03","Life Invader 03"}
        Story_Male_Character_name_35 = {"Lildee","Lildee"}
        Story_Male_Character_name_36 = {"Martin Madrazo (Cutscene)","Martin Madrazo (Cinématique)"}
        Story_Male_Character_name_37 = {"Miguel Madrazo","Miguel Madrazo"}
        Story_Male_Character_name_38 = {"Michael Townley","Michael Townley"}
        Story_Male_Character_name_39 = {"Moodyman","Moodyman"}
        Story_Male_Character_name_40 = {"Mr K","Mr K"}
        Story_Male_Character_name_41 = {"NervousRon","NervousRon"}
        Story_Male_Character_name_42 = {"Nigel","Nigel"}
        Story_Male_Character_name_43 = {"Niko","Niko"}
        Story_Male_Character_name_44 = {"Rashkovsky","Rashkovsky"}
        Story_Male_Character_name_45 = {"Pavel","Pavel"}
        Story_Male_Character_name_46 = {"Prologue Driver","Prologue Conducteur"}
        Story_Male_Character_name_47 = {"Prologue Hostage 01","Prologue Hôtage 01"}
        Story_Male_Character_name_48 = {"Prologue Mourn","Prologue Prétre"}
        Story_Male_Character_name_49 = {"Prologue Security 01","Prologue Securité 01"}
        Story_Male_Character_name_50 = {"Prologue Security 01 (Cutscene)","Prologue Securité 01 (Cinématique)"}
        Story_Male_Character_name_51 = {"Prologue Security 02","Prologue Securité 02"}
        Story_Male_Character_name_52 = {"Prologue Hostage 02","Prologue Hôtage 02"}
        Story_Male_Character_name_53 = {"Siemon Yetarian","Siemon Yetarian"}
        Story_Male_Character_name_54 = {"Sol","Sol"}
        Story_Male_Character_name_55 = {"Solomon","Solomon"}
        Story_Male_Character_name_56 = {"Steve Hain","Steve Hain"}
        Story_Male_Character_name_57 = {"Stretch","Stretch"}
        Story_Male_Character_name_58 = {"Tao Cheng","Tao Cheng"}
        Story_Male_Character_name_59 = {"Tao Cheng 2","Tao Cheng 2"}
        Story_Male_Character_name_60 = {"Taos Translator","Taos Traducteur"}
        Story_Male_Character_name_61 = {"Taos Translator 2","Taos Traducteur 2"}
        Story_Male_Character_name_62 = {"Tom","Tom"}
        Story_Male_Character_name_63 = {"Tony Prince","Tony Prince"}
        Story_Male_Character_name_64 = {"Trevor","Trevor"}
        Story_Male_Character_name_65 = {"Vincent","Vincent"}
        Story_Male_Character_name_66 = {"Vincent 2","Vincent 2"}
        Story_Male_Character_name_67 = {"Vincent 3","Vincent 3"}
        Story_Male_Character_name_68 = {"Wade","Wade"}
        Story_Male_Character_name[01]      = Story_Male_Character_name_01[current_language]
        Story_Male_Character_name[02]      = Story_Male_Character_name_02[current_language]
        Story_Male_Character_name[03]      = Story_Male_Character_name_03[current_language]
        Story_Male_Character_name[04]      = Story_Male_Character_name_04[current_language]
        Story_Male_Character_name[05]      = Story_Male_Character_name_05[current_language]
        Story_Male_Character_name[06]      = Story_Male_Character_name_06[current_language]
        Story_Male_Character_name[07]      = Story_Male_Character_name_07[current_language]
        Story_Male_Character_name[08]      = Story_Male_Character_name_08[current_language]
        Story_Male_Character_name[09]      = Story_Male_Character_name_09[current_language]
        Story_Male_Character_name[10]      = Story_Male_Character_name_10[current_language]
        Story_Male_Character_name[11]      = Story_Male_Character_name_11[current_language]
        Story_Male_Character_name[12]      = Story_Male_Character_name_12[current_language]
        Story_Male_Character_name[13]      = Story_Male_Character_name_13[current_language]
        Story_Male_Character_name[14]      = Story_Male_Character_name_14[current_language]
        Story_Male_Character_name[15]      = Story_Male_Character_name_15[current_language]
        Story_Male_Character_name[16]      = Story_Male_Character_name_16[current_language]
        Story_Male_Character_name[17]      = Story_Male_Character_name_17[current_language]
        Story_Male_Character_name[18]      = Story_Male_Character_name_18[current_language]
        Story_Male_Character_name[19]      = Story_Male_Character_name_19[current_language]
        Story_Male_Character_name[20]      = Story_Male_Character_name_20[current_language]
        Story_Male_Character_name[21]      = Story_Male_Character_name_21[current_language]
        Story_Male_Character_name[22]      = Story_Male_Character_name_22[current_language]
        Story_Male_Character_name[23]      = Story_Male_Character_name_23[current_language]
        Story_Male_Character_name[24]      = Story_Male_Character_name_24[current_language]
        Story_Male_Character_name[25]      = Story_Male_Character_name_25[current_language]
        Story_Male_Character_name[26]      = Story_Male_Character_name_26[current_language]
        Story_Male_Character_name[27]      = Story_Male_Character_name_27[current_language]
        Story_Male_Character_name[28]      = Story_Male_Character_name_28[current_language]
        Story_Male_Character_name[29]      = Story_Male_Character_name_29[current_language]
        Story_Male_Character_name[30]      = Story_Male_Character_name_30[current_language]
        Story_Male_Character_name[31]      = Story_Male_Character_name_31[current_language]
        Story_Male_Character_name[32]      = Story_Male_Character_name_32[current_language]
        Story_Male_Character_name[33]      = Story_Male_Character_name_33[current_language]
        Story_Male_Character_name[34]      = Story_Male_Character_name_34[current_language]
        Story_Male_Character_name[35]      = Story_Male_Character_name_35[current_language]
        Story_Male_Character_name[36]      = Story_Male_Character_name_36[current_language]
        Story_Male_Character_name[37]      = Story_Male_Character_name_37[current_language]
        Story_Male_Character_name[38]      = Story_Male_Character_name_38[current_language]
        Story_Male_Character_name[39]      = Story_Male_Character_name_39[current_language]
        Story_Male_Character_name[40]      = Story_Male_Character_name_40[current_language]
        Story_Male_Character_name[41]      = Story_Male_Character_name_41[current_language]
        Story_Male_Character_name[42]      = Story_Male_Character_name_42[current_language]
        Story_Male_Character_name[43]      = Story_Male_Character_name_43[current_language]
        Story_Male_Character_name[44]      = Story_Male_Character_name_44[current_language]
        Story_Male_Character_name[45]      = Story_Male_Character_name_45[current_language]
        Story_Male_Character_name[46]      = Story_Male_Character_name_46[current_language]
        Story_Male_Character_name[47]      = Story_Male_Character_name_47[current_language]
        Story_Male_Character_name[48]      = Story_Male_Character_name_48[current_language]
        Story_Male_Character_name[49]      = Story_Male_Character_name_49[current_language]
        Story_Male_Character_name[50]      = Story_Male_Character_name_50[current_language]
        Story_Male_Character_name[51]      = Story_Male_Character_name_51[current_language]
        Story_Male_Character_name[52]      = Story_Male_Character_name_52[current_language]
        Story_Male_Character_name[53]      = Story_Male_Character_name_53[current_language]
        Story_Male_Character_name[54]      = Story_Male_Character_name_54[current_language]
        Story_Male_Character_name[55]      = Story_Male_Character_name_55[current_language]
        Story_Male_Character_name[56]      = Story_Male_Character_name_56[current_language]
        Story_Male_Character_name[57]      = Story_Male_Character_name_57[current_language]
        Story_Male_Character_name[58]      = Story_Male_Character_name_58[current_language]
        Story_Male_Character_name[59]      = Story_Male_Character_name_59[current_language]
        Story_Male_Character_name[60]      = Story_Male_Character_name_60[current_language]
        Story_Male_Character_name[61]      = Story_Male_Character_name_61[current_language]
        Story_Male_Character_name[62]      = Story_Male_Character_name_62[current_language]
        Story_Male_Character_name[63]      = Story_Male_Character_name_63[current_language]
        Story_Male_Character_name[64]      = Story_Male_Character_name_64[current_language]
        Story_Male_Character_name[65]      = Story_Male_Character_name_65[current_language]
        Story_Male_Character_name[66]      = Story_Male_Character_name_66[current_language]
        Story_Male_Character_name[67]      = Story_Male_Character_name_67[current_language]
        Story_Male_Character_name[68]      = Story_Male_Character_name_68[current_language]
    local Story_Male_Character_hash = {}
        Story_Male_Character_hash[01]      = "ig_mp_agent14"
        Story_Male_Character_hash[02]      = "ig_ary"
        Story_Male_Character_hash[03]      = "ig_avischwartzman_02"
        Story_Male_Character_hash[04]      = "ig_avon"
        Story_Male_Character_hash[05]      = "ig_barry"
        Story_Male_Character_hash[06]      = "ig_billionaire"
        Story_Male_Character_hash[07]      = "ig_brad"
        Story_Male_Character_hash[08]      = "ig_davenorton"
        Story_Male_Character_hash[09]      = "ig_devin"
        Story_Male_Character_hash[10]      = "s_m_y_devinsec_01"
        Story_Male_Character_hash[11]      = "ig_dom"
        Story_Male_Character_hash[12]      = "ig_drfriedlander"
        Story_Male_Character_hash[13]      = "u_m_m_edtoh"
        Story_Male_Character_hash[14]      = "ig_englishdave"
        Story_Male_Character_hash[15]      = "ig_englishdave_02"
        Story_Male_Character_hash[16]      = "ig_fabien"
        Story_Male_Character_hash[17]      = "ig_floyd"
        Story_Male_Character_hash[18]      = "ig_floyd"
        Story_Male_Character_hash[19]      = "player_one"
        Story_Male_Character_hash[20]      = "p_franklin_02"
        Story_Male_Character_hash[21]      = "hc_hacker"
        Story_Male_Character_hash[22]      = "ig_hao"
        Story_Male_Character_hash[23]      = "ig_jay_norris"
        Story_Male_Character_hash[24]      = "ig_jimmydisanto"
        Story_Male_Character_hash[25]      = "ig_jimmydisanto2"
        Story_Male_Character_hash[26]      = "ig_lamardavis"
        Story_Male_Character_hash[27]      = "ig_lazlow"
        Story_Male_Character_hash[28]      = "ig_lazlow_2"
        Story_Male_Character_hash[29]      = "ig_lestercrest"
        Story_Male_Character_hash[30]      = "ig_lestercrest_2"
        Story_Male_Character_hash[31]      = "ig_lestercrest_3"
        Story_Male_Character_hash[32]      = "ig_lifeinvad_01"
        Story_Male_Character_hash[33]      = "s_m_m_lifeinvad_01"
        Story_Male_Character_hash[34]      = "ig_lifeinvad_02"
        Story_Male_Character_hash[35]      = "ig_lildee"
        Story_Male_Character_hash[36]      = "cs_martinmadrazo"
        Story_Male_Character_hash[37]      = "ig_miguelmadrazo"
        Story_Male_Character_hash[38]      = "player_zero"
        Story_Male_Character_hash[39]      = "ig_moodyman_02"
        Story_Male_Character_hash[40]      = "ig_mrk"
        Story_Male_Character_hash[41]      = "ig_nervousron"
        Story_Male_Character_hash[42]      = "ig_nigel"
        Story_Male_Character_hash[43]      = "mp_m_niko_01"
        Story_Male_Character_hash[44]      = "ig_rashcosvki"
        Story_Male_Character_hash[45]      = "ig_helmsmanpavel"
        Story_Male_Character_hash[46]      = "u_m_y_proldriver_01"
        Story_Male_Character_hash[47]      = "a_m_m_prolhost_01"
        Story_Male_Character_hash[48]      = "u_m_m_promourn_01"
        Story_Male_Character_hash[49]      = "u_m_m_prolsec_01"
        Story_Male_Character_hash[50]      = "csb_prolsec"
        Story_Male_Character_hash[51]      = "ig_prolsec_02"
        Story_Male_Character_hash[52]      = "a_m_m_prolhost_01"
        Story_Male_Character_hash[53]      = "u_f_o_prolhost_01"
        Story_Male_Character_hash[54]      = "ig_siemonyetarian"
        Story_Male_Character_hash[55]      = "ig_sol"
        Story_Male_Character_hash[56]      = "ig_solomon"
        Story_Male_Character_hash[57]      = "ig_stevehains"
        Story_Male_Character_hash[58]      = "ig_stretch"
        Story_Male_Character_hash[59]      = "ig_taocheng"
        Story_Male_Character_hash[60]      = "ig_taocheng2"
        Story_Male_Character_hash[61]      = "ig_taostranslator"
        Story_Male_Character_hash[62]      = "ig_taostranslator2"
        Story_Male_Character_hash[63]      = "ig_tomcasino"
        Story_Male_Character_hash[64]      = "ig_tonyprince"
        Story_Male_Character_hash[65]      = "player_two"
        Story_Male_Character_hash[65]      = "ig_vincent"
        Story_Male_Character_hash[66]      = "ig_vincent_2"
        Story_Male_Character_hash[67]      = "ig_vincent_3"
        Story_Male_Character_hash[68]      = "ig_wade"
--- ✓ Female Character
    local Female_Character_name = {}
        Female_Character_name_01  = {"Autoshop","Garage"}
        Female_Character_name_02  = {"Abigail","Abigail"}
        Female_Character_name_03  = {"Ashley","Ashley"}
        Female_Character_name_04  = {"Female Air Hostess","Hotesse de l'air"}
        Female_Character_name_05  = {"Female Bartender","Barwoman"}
        Female_Character_name_06  = {"Female Bay Watch","Maître Nageuse"}
        Female_Character_name_07  = {"Beach 01"}
        Female_Character_name_08  = {"Beach 02"}
        Female_Character_name_09  = {"Beach 02"}
        Female_Character_name_10  = {"Beachbar staff"}
        Female_Character_name_11  = {"Beth","Beth"}
        Female_Character_name_12  = {"Benny's Employee","Enployé de Benny"}
        Female_Character_name_13  = {"Beverly Hills 01","Beverly Hills 01"}
        Female_Character_name_14  = {"Beverly Hills 02","Beverly Hills 02"}
        Female_Character_name_15  = {"Beverly Hills 03","Beverly Hills 03"}
        Female_Character_name_16  = {"Beverly hills 04","Beverly hills 04"}
        Female_Character_name_17  = {"Beverly Hills 05","Beverly Hills 05"}
        Female_Character_name_18  = {"Beverly Hills 06","Beverly Hills 06"}
        Female_Character_name_19  = {"Beverly Hills 07","Beverly Hills 07"}
        Female_Character_name_20  = {"Biker Chic","Motarde"}
        Female_Character_name_21  = {"Boat Staff","Staff de bateau"}
        Female_Character_name_22  = {"Body Builder","Body Builder"}
        Female_Character_name_23  = {"Bride","Mariée"}
        Female_Character_name_24  = {"Business 01","Business 01"}
        Female_Character_name_25  = {"Business 02","Business 02"}
        Female_Character_name_26  = {"Business 02","Business 02"}
        Female_Character_name_27  = {"Business 03","Business 03"}
        Female_Character_name_28  = {"Business 04","Business 04"}
        Female_Character_name_29  = {"Carol","Carolle"}
        Female_Character_name_30  = {"Car Design","Designeur de voiture"}
        Female_Character_name_31  = {"Car Club","Club de voiture"}
        Female_Character_name_32  = {"Casino Cash","Caissiére Casino"}
        Female_Character_name_33  = {"Casino Shop","Vendeuse Casino"}
        Female_Character_name_34  = {"Club Casino","Club Casino"}
        Female_Character_name_35  = {"Club Bar","Club Bar"}
        Female_Character_name_36  = {"Club Bar 2","Club Bar 2"}
        Female_Character_name_37  = {"Club Bar MP","Club MP"}
        Female_Character_name_38  = {"Club custom 01","Club Custom 01"}
        Female_Character_name_39  = {"Club custom 02","Club Custom 02"}
        Female_Character_name_40  = {"Club custom 03","Club Custom 03"}
        Female_Character_name_41  = {"Club custom 04","Club Custom 04"}
        Female_Character_name_42  = {"Jane (Common)","Jane (Communne)"}
        Female_Character_name_43  = {"Cocaine","Cocaïne"}
        Female_Character_name_44  = {"Corpse 01","Coprs 01"}
        Female_Character_name_45  = {"Corpse 02","Coprs 02"}
        Female_Character_name_46  = {"Corpse 03","Coprs 03"}
        Female_Character_name_47  = {"Counterfeit","Contrefaçon"}
        Female_Character_name_48  = {"Dance Burl","Danceuse"}
        Female_Character_name_49  = {"Dance Leather","Danceuse (Cuir)"}
        Female_Character_name_50  = {"Dance Rave","Danceuse Déchantée"}
        Female_Character_name_51  = {"Debbie","Debbie"}
        Female_Character_name_52  = {"Dead hooker","Prostituée Morte"}
        Female_Character_name_53  = {"Drowned","Noyée"}
        Female_Character_name_54  = {"East Sans Andreas 01","San Andreas Est 01"}
        Female_Character_name_55  = {"East Sans Andreas 01","San Andreas Est 01"}
        Female_Character_name_56  = {"East Sans Andreas 02","San Andreas Est 02"}
        Female_Character_name_57  = {"East Sans Andreas 02","San Andreas Est 02"}
        Female_Character_name_58  = {"East Sans Andreas 03","San Andreas Est 03"}
        Female_Character_name_59  = {"Eileen","Eileen"}
        Female_Character_name_60  = {"Exececutive 01","Cheffe 01"}
        Female_Character_name_61  = {"Exececutive 02","Cheffe 02"}
        Female_Character_name_62  = {"Epsilon","Epsilon"}
        Female_Character_name_63  = {"Factory","Usine"}
        Female_Character_name_64  = {"Fat Bla","Femme Ronde"}
        Female_Character_name_65  = {"Fat Cult","Culte des rondes"}
        Female_Character_name_66  = {"Fat White","Femme Blanche ronde"}
        Female_Character_name_67  = {"Barber","Barbiére"}
        Female_Character_name_68  = {"Fitness 01","Fitness 01"}
        Female_Character_name_69  = {"Fitness 02","Fitness 02"}
        Female_Character_name_70  = {"Forgery","Forgeuse"}
        Female_Character_name_71  = {"General Hot","General Chaude"}
        Female_Character_name_72  = {"General Street","General Rue"}
        Female_Character_name_73  = {"General Caspat","General Caspat"}
        Female_Character_name_74  = {"Golfer","Glofeuse"}
        Female_Character_name_75  = {"Gurk","Gurk"}
        Female_Character_name_76  = {"Helicopter Staff","Staff (Helicoptére)"}
        Female_Character_name_77  = {"Hiker","Randoneuse"}
        Female_Character_name_78  = {"Hippie","Hippie"}
        Female_Character_name_79  = {"Hipster 01","Hipster 01"}
        Female_Character_name_80  = {"Hipster 02","Hipster 02"}
        Female_Character_name_81  = {"Hipster 03","Hipster 03"}
        Female_Character_name_82  = {"Hipster 04","Hipster 04"}
        Female_Character_name_83  = {"Hooker 01","Prostituée 01"}
        Female_Character_name_84  = {"Hooker 02","Prostituée 02"}
        Female_Character_name_85  = {"Hooker 03","Prostituée 03"}
        Female_Character_name_86  = {"Hot Posh","Posh Chaude"}
        Female_Character_name_87  = {"Import Export","Import Export"}
        Female_Character_name_88  = {"Indian 01","Indienne 01"}
        Female_Character_name_89  = {"Indian 02","Indienne 02"}
        Female_Character_name_90  = {"Jacky","Jacky"}
        Female_Character_name_91  = {"Janet","Janet"}
        Female_Character_name_92  = {"Jewel Assistant 01","Assistante Joillerie 01"}
        Female_Character_name_93  = {"Jewel Assistant 02","Assistante Joillerie 02"}
        Female_Character_name_94  = {"Juggalo","Jugallo"}
        Female_Character_name_95  = {"Karen Daniels","Karen Daniels"}
        Female_Character_name_96  = {"Kaylee","Kaylee"}
        Female_Character_name_97  = {"Kerry Mcintosh","Kerry Mcintosh"}
        Female_Character_name_98  = {"Kerry Mcintosh 2","Kerry Mcintosh 2"}
        Female_Character_name_99  = {"K Town 01","Ville K 01"}
        Female_Character_name_100 = {"K Town 02","Ville K 02"}
        Female_Character_name_101 = {"K Town 03","Ville K 03"}
        Female_Character_name_102 = {"Lauren","Lauren"}
        Female_Character_name_103 = {"Maid","Femme de ménage"}
        Female_Character_name_104 = {"Magenta","Magenta"}
        Female_Character_name_105 = {"Maid 02","Femme de ménage 02"}
        Female_Character_name_106 = {"Marnie","Marnie"}
        Female_Character_name_107 = {"Maude","Maude"}
        Female_Character_name_108 = {"Meth","Méth"}
        Female_Character_name_109 = {"Michelle","Michelle"}
        Female_Character_name_110 = {"Migrant","Migrant"}
        Female_Character_name_111 = {"Mistress","Maitresse"}
        Female_Character_name_112 = {"Miranda 01","Miranda 01"}
        Female_Character_name_113 = {"Miranda 02","Miranda 02"}
        Female_Character_name_114 = {"Misty","Misty"}
        Female_Character_name_115 = {"Molly","Molly"}
        Female_Character_name_116 = {"Movie Star","Star"}
        Female_Character_name_117 = {"Movie Premere","Premiére de cinéma"}
        Female_Character_name_118 = {"Mrs Thornhill","Mme Thornhill"}
        Female_Character_name_119 = {"Natalia","Natalia"}
        Female_Character_name_120 = {"Patricia 01","Patricia 01"}
        Female_Character_name_121 = {"Patricia 02","Patricia 02"}
        Female_Character_name_122 = {"Poppy Mich 01","Poppy Mich 01"}
        Female_Character_name_123 = {"Poppy Mich 02","Poppy Mich 02"}
        Female_Character_name_124 = {"Princess","Princesse"}
        Female_Character_name_125 = {"Prologue Mourn","Veuve Prologue"}
        Female_Character_name_126 = {"Retail Staff","Staff Commerce"}
        Female_Character_name_127 = {"Runner","Coureuse"}
        Female_Character_name_128 = {"Rural Meth","Méth de Rue"}
        Female_Character_name_129 = {"Salton 01","Salton 01"}
        Female_Character_name_130 = {"Salton 02","Salton 02"}
        Female_Character_name_131 = {"Screen Writer","Ecrivaine"}
        Female_Character_name_132 = {"Scrubs","Laveuse"}
        Female_Character_name_133 = {"SC Dressy","Dresseur"}
        Female_Character_name_134 = {"Shop High","Vendeuse de Vétement Haut"}
        Female_Character_name_135 = {"Shop Low","Vendeuse de Vétement bas"}
        Female_Character_name_136 = {"Shop Mid","Vendeuse de Vétement Moyen"}
        Female_Character_name_137 = {"Skater","Skateuse"}
        Female_Character_name_138 = {"Ski","Skieuse"}
        Female_Character_name_139 = {"Smart caspat","Caspat Intéligente"}
        Female_Character_name_140 = {"South Cent 01","Centrale Sud 01"}
        Female_Character_name_141 = {"South Cent 02","Centrale Sud 02"}
        Female_Character_name_142 = {"South Cent 03","Centrale Sud 03"}
        Female_Character_name_143 = {"South Cent 04","Centrale Sud 04"}
        Female_Character_name_144 = {"South Cent 05","Centrale Sud 05"}
        Female_Character_name_145 = {"South Cent 06","Centrale Sud 06"}
        Female_Character_name_146 = {"South Cent 07","Centrale Sud 07"}
        Female_Character_name_147 = {"South Cent 08","Centrale Sud 08"}
        Female_Character_name_148 = {"Spy Actress","Actrice Espion"}
        Female_Character_name_149 = {"Stripper 01","Striptiseuse 01"}
        Female_Character_name_150 = {"Stripper 02","Striptiseuse 02"}
        Female_Character_name_151 = {"Stripper Lite","Prostituée 01 (Lite)"}
        Female_Character_name_152 = {"Stripper Lite","Prostituée 02 (Lite)"}
        Female_Character_name_153 = {"StudioAssistant"}
        Female_Character_name_154 = {"Studio Party 01","Partie Studio 01"}
        Female_Character_name_155 = {"Studio Party 02","Partie Studio 02"}
        Female_Character_name_156 = {"Sweat Shop 01","Vendeuse 01"}
        Female_Character_name_157 = {"Sweat Shop 02","Vendeuse 02"}
        Female_Character_name_158 = {"Talina","Talina"}
        Female_Character_name_159 = {"Taylor","Taylor"}
        Female_Character_name_160 = {"Tennis","Tennis"}
        Female_Character_name_161 = {"Topless","Torse Nu"}
        Female_Character_name_162 = {"Tourist 01","Touriste 01"}
        Female_Character_name_163 = {"Tourist 02","Touriste 02"}
        Female_Character_name_164 = {"Tourist 03","Touriste 03"}
        Female_Character_name_165 = {"Tramp 01","Clocharde 01"}
        Female_Character_name_166 = {"Tramp 02","Clocharde 02"}
        Female_Character_name_167 = {"Tran Vest 01","tran vest 01"}
        Female_Character_name_168 = {"Tran Vest 02","tran vest 02"}
        Female_Character_name_169 = {"Vinewood 01","Vinewood 01"}
        Female_Character_name_170 = {"Vinewood 02","Vinewood 02"}
        Female_Character_name_171 = {"Vinewood 03","Vinewood 03"}
        Female_Character_name_172 = {"Vinewood 04","Vinewood 04"}
        Female_Character_name_173 = {"Weed","Weed"}
        Female_Character_name_174 = {"Wendy","Wendy"}
        Female_Character_name_175 = {"Yoga","Yoga"}
        Female_Character_name[01 ]      = Female_Character_name_01[current_language]
        Female_Character_name[02 ]      = Female_Character_name_02[current_language]
        Female_Character_name[03 ]      = Female_Character_name_03[current_language]
        Female_Character_name[04 ]      = Female_Character_name_04[current_language]
        Female_Character_name[05 ]      = Female_Character_name_05[current_language]
        Female_Character_name[06 ]      = Female_Character_name_06[current_language]
        Female_Character_name[07 ]      = Female_Character_name_07[current_language]
        Female_Character_name[08 ]      = Female_Character_name_08[current_language]
        Female_Character_name[09 ]      = Female_Character_name_09[current_language]
        Female_Character_name[10 ]      = Female_Character_name_10[current_language]
        Female_Character_name[11 ]      = Female_Character_name_11[current_language]
        Female_Character_name[12 ]      = Female_Character_name_12[current_language]
        Female_Character_name[13 ]      = Female_Character_name_13[current_language]
        Female_Character_name[14 ]      = Female_Character_name_14[current_language]
        Female_Character_name[15 ]      = Female_Character_name_15[current_language]
        Female_Character_name[16 ]      = Female_Character_name_16[current_language]
        Female_Character_name[17 ]      = Female_Character_name_17[current_language]
        Female_Character_name[18 ]      = Female_Character_name_18[current_language]
        Female_Character_name[19 ]      = Female_Character_name_19[current_language]
        Female_Character_name[20 ]      = Female_Character_name_20[current_language]
        Female_Character_name[21 ]      = Female_Character_name_21[current_language]
        Female_Character_name[22 ]      = Female_Character_name_22[current_language]
        Female_Character_name[23 ]      = Female_Character_name_23[current_language]
        Female_Character_name[24 ]      = Female_Character_name_24[current_language]
        Female_Character_name[25 ]      = Female_Character_name_25[current_language]
        Female_Character_name[26 ]      = Female_Character_name_26[current_language]
        Female_Character_name[27 ]      = Female_Character_name_27[current_language]
        Female_Character_name[28 ]      = Female_Character_name_28[current_language]
        Female_Character_name[29 ]      = Female_Character_name_29[current_language]
        Female_Character_name[30 ]      = Female_Character_name_30[current_language]
        Female_Character_name[31 ]      = Female_Character_name_31[current_language]
        Female_Character_name[32 ]      = Female_Character_name_32[current_language]
        Female_Character_name[33 ]      = Female_Character_name_33[current_language]
        Female_Character_name[34 ]      = Female_Character_name_34[current_language]
        Female_Character_name[35 ]      = Female_Character_name_35[current_language]
        Female_Character_name[36 ]      = Female_Character_name_36[current_language]
        Female_Character_name[37 ]      = Female_Character_name_37[current_language]
        Female_Character_name[38 ]      = Female_Character_name_38[current_language]
        Female_Character_name[39 ]      = Female_Character_name_39[current_language]
        Female_Character_name[40 ]      = Female_Character_name_40[current_language]
        Female_Character_name[41 ]      = Female_Character_name_41[current_language]
        Female_Character_name[42 ]      = Female_Character_name_42[current_language]
        Female_Character_name[43 ]      = Female_Character_name_43[current_language]
        Female_Character_name[44 ]      = Female_Character_name_44[current_language]
        Female_Character_name[45 ]      = Female_Character_name_45[current_language]
        Female_Character_name[46 ]      = Female_Character_name_46[current_language]
        Female_Character_name[47 ]      = Female_Character_name_47[current_language]
        Female_Character_name[48 ]      = Female_Character_name_48[current_language]
        Female_Character_name[49 ]      = Female_Character_name_49[current_language]
        Female_Character_name[50 ]      = Female_Character_name_50[current_language]
        Female_Character_name[51 ]      = Female_Character_name_51[current_language]
        Female_Character_name[52 ]      = Female_Character_name_52[current_language]
        Female_Character_name[53 ]      = Female_Character_name_53[current_language]
        Female_Character_name[54 ]      = Female_Character_name_54[current_language]
        Female_Character_name[55 ]      = Female_Character_name_55[current_language]
        Female_Character_name[56 ]      = Female_Character_name_56[current_language]
        Female_Character_name[57 ]      = Female_Character_name_57[current_language]
        Female_Character_name[58 ]      = Female_Character_name_58[current_language]
        Female_Character_name[59 ]      = Female_Character_name_59[current_language]
        Female_Character_name[60 ]      = Female_Character_name_60[current_language]
        Female_Character_name[61 ]      = Female_Character_name_61[current_language]
        Female_Character_name[62 ]      = Female_Character_name_62[current_language]
        Female_Character_name[63 ]      = Female_Character_name_63[current_language]
        Female_Character_name[64 ]      = Female_Character_name_64[current_language]
        Female_Character_name[65 ]      = Female_Character_name_65[current_language]
        Female_Character_name[66 ]      = Female_Character_name_66[current_language]
        Female_Character_name[67 ]      = Female_Character_name_67[current_language]
        Female_Character_name[68 ]      = Female_Character_name_68[current_language]
        Female_Character_name[69 ]      = Female_Character_name_69[current_language]
        Female_Character_name[70 ]      = Female_Character_name_70[current_language]
        Female_Character_name[71 ]      = Female_Character_name_71[current_language]
        Female_Character_name[72 ]      = Female_Character_name_72[current_language]
        Female_Character_name[73 ]      = Female_Character_name_73[current_language]
        Female_Character_name[74 ]      = Female_Character_name_74[current_language]
        Female_Character_name[75 ]      = Female_Character_name_75[current_language]
        Female_Character_name[76 ]      = Female_Character_name_76[current_language]
        Female_Character_name[77 ]      = Female_Character_name_77[current_language]
        Female_Character_name[78 ]      = Female_Character_name_78[current_language]
        Female_Character_name[79 ]      = Female_Character_name_79[current_language]
        Female_Character_name[80 ]      = Female_Character_name_80[current_language]
        Female_Character_name[81 ]      = Female_Character_name_81[current_language]
        Female_Character_name[82 ]      = Female_Character_name_82[current_language]
        Female_Character_name[83 ]      = Female_Character_name_83[current_language]
        Female_Character_name[84 ]      = Female_Character_name_84[current_language]
        Female_Character_name[85 ]      = Female_Character_name_85[current_language]
        Female_Character_name[86 ]      = Female_Character_name_86[current_language]
        Female_Character_name[87 ]      = Female_Character_name_87[current_language]
        Female_Character_name[88 ]      = Female_Character_name_88[current_language]
        Female_Character_name[89 ]      = Female_Character_name_89[current_language]
        Female_Character_name[90 ]      = Female_Character_name_90[current_language]
        Female_Character_name[91 ]      = Female_Character_name_91[current_language]
        Female_Character_name[92 ]      = Female_Character_name_92[current_language]
        Female_Character_name[93 ]      = Female_Character_name_93[current_language]
        Female_Character_name[94 ]      = Female_Character_name_94[current_language]
        Female_Character_name[95 ]      = Female_Character_name_95[current_language]
        Female_Character_name[96 ]      = Female_Character_name_96[current_language]
        Female_Character_name[97 ]      = Female_Character_name_97[current_language]
        Female_Character_name[98 ]      = Female_Character_name_98[current_language]
        Female_Character_name[99 ]      = Female_Character_name_99[current_language]
        Female_Character_name[100]      = Female_Character_name_100[current_language]
        Female_Character_name[101]      = Female_Character_name_101[current_language]
        Female_Character_name[102]      = Female_Character_name_102[current_language]
        Female_Character_name[103]      = Female_Character_name_103[current_language]
        Female_Character_name[104]      = Female_Character_name_104[current_language]
        Female_Character_name[105]      = Female_Character_name_105[current_language]
        Female_Character_name[106]      = Female_Character_name_106[current_language]
        Female_Character_name[107]      = Female_Character_name_107[current_language]
        Female_Character_name[108]      = Female_Character_name_108[current_language]
        Female_Character_name[109]      = Female_Character_name_109[current_language]
        Female_Character_name[110]      = Female_Character_name_110[current_language]
        Female_Character_name[111]      = Female_Character_name_111[current_language]
        Female_Character_name[112]      = Female_Character_name_112[current_language]
        Female_Character_name[113]      = Female_Character_name_113[current_language]
        Female_Character_name[114]      = Female_Character_name_114[current_language]
        Female_Character_name[115]      = Female_Character_name_115[current_language]
        Female_Character_name[116]      = Female_Character_name_116[current_language]
        Female_Character_name[117]      = Female_Character_name_117[current_language]
        Female_Character_name[118]      = Female_Character_name_118[current_language]
        Female_Character_name[119]      = Female_Character_name_119[current_language]
        Female_Character_name[120]      = Female_Character_name_120[current_language]
        Female_Character_name[121]      = Female_Character_name_121[current_language]
        Female_Character_name[122]      = Female_Character_name_122[current_language]
        Female_Character_name[123]      = Female_Character_name_123[current_language]
        Female_Character_name[124]      = Female_Character_name_124[current_language]
        Female_Character_name[125]      = Female_Character_name_125[current_language]
        Female_Character_name[126]      = Female_Character_name_126[current_language]
        Female_Character_name[127]      = Female_Character_name_127[current_language]
        Female_Character_name[128]      = Female_Character_name_128[current_language]
        Female_Character_name[129]      = Female_Character_name_129[current_language]
        Female_Character_name[130]      = Female_Character_name_130[current_language]
        Female_Character_name[131]      = Female_Character_name_131[current_language]
        Female_Character_name[132]      = Female_Character_name_132[current_language]
        Female_Character_name[133]      = Female_Character_name_133[current_language]
        Female_Character_name[134]      = Female_Character_name_134[current_language]
        Female_Character_name[135]      = Female_Character_name_135[current_language]
        Female_Character_name[136]      = Female_Character_name_136[current_language]
        Female_Character_name[137]      = Female_Character_name_137[current_language]
        Female_Character_name[138]      = Female_Character_name_138[current_language]
        Female_Character_name[139]      = Female_Character_name_139[current_language]
        Female_Character_name[140]      = Female_Character_name_140[current_language]
        Female_Character_name[141]      = Female_Character_name_141[current_language]
        Female_Character_name[142]      = Female_Character_name_142[current_language]
        Female_Character_name[143]      = Female_Character_name_143[current_language]
        Female_Character_name[144]      = Female_Character_name_144[current_language]
        Female_Character_name[145]      = Female_Character_name_145[current_language]
        Female_Character_name[146]      = Female_Character_name_146[current_language]
        Female_Character_name[147]      = Female_Character_name_147[current_language]
        Female_Character_name[148]      = Female_Character_name_148[current_language]
        Female_Character_name[149]      = Female_Character_name_149[current_language]
        Female_Character_name[150]      = Female_Character_name_150[current_language]
        Female_Character_name[151]      = Female_Character_name_151[current_language]
        Female_Character_name[152]      = Female_Character_name_152[current_language]
        Female_Character_name[153]      = Female_Character_name_153[current_language]
        Female_Character_name[154]      = Female_Character_name_154[current_language]
        Female_Character_name[155]      = Female_Character_name_155[current_language]
        Female_Character_name[156]      = Female_Character_name_156[current_language]
        Female_Character_name[157]      = Female_Character_name_157[current_language]
        Female_Character_name[158]      = Female_Character_name_158[current_language]
        Female_Character_name[159]      = Female_Character_name_159[current_language]
        Female_Character_name[160]      = Female_Character_name_160[current_language]
        Female_Character_name[161]      = Female_Character_name_161[current_language]
        Female_Character_name[162]      = Female_Character_name_162[current_language]
        Female_Character_name[163]      = Female_Character_name_163[current_language]
        Female_Character_name[164]      = Female_Character_name_164[current_language]
        Female_Character_name[165]      = Female_Character_name_165[current_language]
        Female_Character_name[166]      = Female_Character_name_166[current_language]
        Female_Character_name[167]      = Female_Character_name_167[current_language]
        Female_Character_name[168]      = Female_Character_name_168[current_language]
        Female_Character_name[169]      = Female_Character_name_169[current_language]
        Female_Character_name[170]      = Female_Character_name_170[current_language]
        Female_Character_name[171]      = Female_Character_name_171[current_language]
        Female_Character_name[172]      = Female_Character_name_172[current_language]
        Female_Character_name[173]      = Female_Character_name_173[current_language]
        Female_Character_name[174]      = Female_Character_name_174[current_language]
        Female_Character_name[175]      = Female_Character_name_175[current_language]
    local Female_Character_hash = {}
        Female_Character_hash[01 ]      = "s_f_m_autoshop_01"
        Female_Character_hash[02 ]      = "ig_abigail"
        Female_Character_hash[03 ]      = "ig_ashley"
        Female_Character_hash[04 ]      = "s_f_y_airhostess_01"
        Female_Character_hash[05 ]      = "s_f_y_bartender_01"
        Female_Character_hash[06 ]      = "s_f_y_baywatch_01"
        Female_Character_hash[07 ]      = "a_f_m_beach_01"
        Female_Character_hash[08 ]      = "a_f_y_beach_01"
        Female_Character_hash[09 ]      = "a_f_y_beach_02"
        Female_Character_hash[10 ]      = "s_f_y_beachbarstaff_01"
        Female_Character_hash[11 ]      = "u_f_y_beth"
        Female_Character_hash[12 ]      = "mp_f_bennymech_01"
        Female_Character_hash[13 ]      = "a_f_m_bevhills_01"
        Female_Character_hash[14 ]      = "a_f_m_bevhills_02"
        Female_Character_hash[15 ]      = "a_f_y_bevhills_01"
        Female_Character_hash[16 ]      = "a_f_y_bevhills_02"
        Female_Character_hash[17 ]      = "a_f_y_bevhills_03"
        Female_Character_hash[18 ]      = "a_f_y_bevhills_04"
        Female_Character_hash[19 ]      = "a_f_y_bevhills_05"
        Female_Character_hash[20 ]      = "u_f_y_bikerchic"
        Female_Character_hash[21 ]      = "mp_f_boatstaff_01"
        Female_Character_hash[22 ]      = "a_f_m_bodybuild_01"
        Female_Character_hash[23 ]      = "ig_bride"
        Female_Character_hash[24 ]      = "a_f_y_business_01"
        Female_Character_hash[25 ]      = "a_f_m_business_02"
        Female_Character_hash[26 ]      = "a_f_y_business_02"
        Female_Character_hash[27 ]      = "a_f_y_business_03"
        Female_Character_hash[28 ]      = "a_f_y_business_04"
        Female_Character_hash[29 ]      = "u_f_o_carol"
        Female_Character_hash[30 ]      = "mp_f_cardesign_01"
        Female_Character_hash[31 ]      = "a_f_y_carclub_01"
        Female_Character_hash[32 ]      = "u_f_m_casinocash_01"
        Female_Character_hash[33 ]      = "u_f_m_casinoshop_01"
        Female_Character_hash[34 ]      = "s_f_y_casino_01"
        Female_Character_hash[35 ]      = "s_f_y_clubbar_01"
        Female_Character_hash[36 ]      = "s_f_y_clubbar_02"
        Female_Character_hash[37 ]      = "mp_f_chbar_01"
        Female_Character_hash[38 ]      = "a_f_y_clubcust_01"
        Female_Character_hash[39 ]      = "a_f_y_clubcust_02"
        Female_Character_hash[40 ]      = "a_f_y_clubcust_03"
        Female_Character_hash[41 ]      = "a_f_y_clubcust_04"
        Female_Character_hash[42 ]      = "u_f_y_comjane"
        Female_Character_hash[43 ]      = "mp_f_cocaine_01"
        Female_Character_hash[44 ]      = "u_f_m_corpse_01"
        Female_Character_hash[45 ]      = "u_f_y_corpse_01"
        Female_Character_hash[46 ]      = "u_f_y_corpse_02"
        Female_Character_hash[47 ]      = "mp_f_counterfeit_01"
        Female_Character_hash[48 ]      = "u_f_y_danceburl_01"
        Female_Character_hash[49 ]      = "u_f_y_dancelthr_01"
        Female_Character_hash[50 ]      = "u_f_y_dancerave_01"
        Female_Character_hash[51 ]      = "u_f_m_debbie_01"
        Female_Character_hash[52 ]      = "mp_f_deadhooker"
        Female_Character_hash[53 ]      = "u_f_m_drowned_01"
        Female_Character_hash[54 ]      = "a_f_m_eastsa_01"
        Female_Character_hash[55 ]      = "a_f_y_eastsa_01"
        Female_Character_hash[56 ]      = "a_f_m_eastsa_02"
        Female_Character_hash[57 ]      = "a_f_y_eastsa_02"
        Female_Character_hash[58 ]      = "a_f_y_eastsa_03"
        Female_Character_hash[59 ]      = "u_f_o_eileen"
        Female_Character_hash[60 ]      = "mp_f_execpa_01"
        Female_Character_hash[61 ]      = "mp_f_execpa_02"
        Female_Character_hash[62 ]      = "a_f_y_epsilon_01"
        Female_Character_hash[63 ]      = "s_f_y_factory_01"
        Female_Character_hash[64 ]      = "a_f_m_fatbla_01"
        Female_Character_hash[65 ]      = "a_f_m_fatcult_01"
        Female_Character_hash[66 ]      = "a_f_m_fatwhite_01"
        Female_Character_hash[67 ]      = "s_f_m_fembarber"
        Female_Character_hash[68 ]      = "a_f_y_fitness_01"
        Female_Character_hash[69 ]      = "a_f_y_fitness_02"
        Female_Character_hash[70 ]      = "mp_f_forgery_01"
        Female_Character_hash[71 ]      = "a_f_y_genhot_01"
        Female_Character_hash[72 ]      = "a_f_o_genstreet_01"
        Female_Character_hash[73 ]      = "a_f_y_gencaspat_01"
        Female_Character_hash[74 ]      = "a_f_y_golfer_01"
        Female_Character_hash[75 ]      = "cs_gurk"
        Female_Character_hash[76 ]      = "mp_f_helistaff_01"
        Female_Character_hash[77 ]      = "a_f_y_hiker_01"
        Female_Character_hash[78 ]      = "a_f_y_hippie_01"
        Female_Character_hash[79 ]      = "a_f_y_hipster_01"
        Female_Character_hash[80 ]      = "a_f_y_hipster_02"
        Female_Character_hash[81 ]      = "a_f_y_hipster_03"
        Female_Character_hash[82 ]      = "a_f_y_hipster_04"
        Female_Character_hash[83 ]      = "s_f_y_hooker_01"
        Female_Character_hash[84 ]      = "s_f_y_hooker_02"
        Female_Character_hash[85 ]      = "s_f_y_hooker_03"
        Female_Character_hash[86 ]      = "u_f_y_hotposh_01"
        Female_Character_hash[87 ]      = "g_f_importexport_01"
        Female_Character_hash[88 ]      = "a_f_o_indian_01"
        Female_Character_hash[89 ]      = "a_f_y_indian_01"
        Female_Character_hash[90 ]      = "ig_jackie"
        Female_Character_hash[91 ]      = "ig_janet"
        Female_Character_hash[92 ]      = "u_f_y_jewelass_01"
        Female_Character_hash[93 ]      = "ig_jewelass"
        Female_Character_hash[94 ]      = "a_f_y_juggalo_01"
        Female_Character_hash[95 ]      = "ig_karen_daniels"
        Female_Character_hash[96 ]      = "ig_kaylee"
        Female_Character_hash[97 ]      = "ig_kerrymcintosh"
        Female_Character_hash[98 ]      = "ig_kerrymcintosh_02"
        Female_Character_hash[99 ]      = "a_f_m_ktown_01"
        Female_Character_hash[100]      = "a_f_m_ktown_02"
        Female_Character_hash[101]      = "a_f_o_ktown_01"
        Female_Character_hash[102]      = "u_f_y_lauren"
        Female_Character_hash[103]      = "s_f_m_maid_01"
        Female_Character_hash[104]      = "ig_magenta"
        Female_Character_hash[105]      = "s_f_m_maid_01"
        Female_Character_hash[106]      = "ig_marnie"
        Female_Character_hash[107]      = "ig_maude"
        Female_Character_hash[108]      = "mp_f_meth_01"
        Female_Character_hash[109]      = "ig_michelle"
        Female_Character_hash[110]      = "s_f_y_migrant_01"
        Female_Character_hash[111]      = "u_f_y_mistress"
        Female_Character_hash[112]      = "u_f_m_miranda"
        Female_Character_hash[113]      = "u_f_m_miranda_02"
        Female_Character_hash[114]      = "mp_f_misty_01"
        Female_Character_hash[115]      = "ig_molly"
        Female_Character_hash[116]      = "u_f_o_moviestar"
        Female_Character_hash[117]      = "s_f_y_movprem_01"
        Female_Character_hash[118]      = "ig_mrs_thornhill"
        Female_Character_hash[119]      = "ig_natalia"
        Female_Character_hash[120]      = "ig_patricia"
        Female_Character_hash[121]      = "ig_patricia_02"
        Female_Character_hash[122]      = "u_f_y_poppymich"
        Female_Character_hash[123]      = "u_f_y_poppymich_02"
        Female_Character_hash[124]      = "u_f_y_princess"
        Female_Character_hash[125]      = "u_f_m_promourn_01"
        Female_Character_hash[126]      = "s_f_m_retailstaff_01"
        Female_Character_hash[127]      = "a_f_y_runner_01"
        Female_Character_hash[128]      = "a_f_y_rurmeth_01"
        Female_Character_hash[129]      = "a_f_m_salton_01"
        Female_Character_hash[130]      = "a_f_o_salton_01"
        Female_Character_hash[131]      = "ig_screen_writer"
        Female_Character_hash[132]      = "s_f_y_scrubs_01"
        Female_Character_hash[133]      = "a_f_y_scdressy_01"
        Female_Character_hash[134]      = "s_f_m_shop_high"
        Female_Character_hash[135]      = "s_f_y_shop_low"
        Female_Character_hash[136]      = "s_f_y_shop_mid"
        Female_Character_hash[137]      = "a_f_y_skater_01"
        Female_Character_hash[138]      = "a_f_m_skidrow_01"
        Female_Character_hash[139]      = "a_f_y_smartcaspat_01"
        Female_Character_hash[140]      = "a_f_m_soucent_01"
        Female_Character_hash[141]      = "a_f_m_soucent_02"
        Female_Character_hash[142]      = "a_f_o_soucent_01"
        Female_Character_hash[143]      = "a_f_y_soucent_01"
        Female_Character_hash[144]      = "a_f_o_soucent_02"
        Female_Character_hash[145]      = "a_f_y_soucent_02"
        Female_Character_hash[146]      = "a_f_y_soucent_03"
        Female_Character_hash[147]      = "a_f_m_soucentmc_01"
        Female_Character_hash[148]      = "u_f_y_spyactress"
        Female_Character_hash[149]      = "s_f_y_stripper_01"
        Female_Character_hash[150]      = "s_f_y_stripper_02"
        Female_Character_hash[151]      = "s_f_y_stripperlite"
        Female_Character_hash[152]      = "mp_f_stripperlite"
        Female_Character_hash[153]      = "s_f_m_studioassist_01"
        Female_Character_hash[154]      = "a_f_y_studioparty_01"
        Female_Character_hash[155]      = "a_f_y_studioparty_02"
        Female_Character_hash[156]      = "s_f_m_sweatshop_01"
        Female_Character_hash[157]      = "s_f_y_sweatshop_01"
        Female_Character_hash[158]      = "ig_talina"
        Female_Character_hash[159]      = "u_f_y_taylor"
        Female_Character_hash[160]      = "a_f_y_tennis_01"
        Female_Character_hash[161]      = "a_f_y_topless_01"
        Female_Character_hash[162]      = "a_f_m_tourist_01"
        Female_Character_hash[163]      = "a_f_y_tourist_01"
        Female_Character_hash[164]      = "a_f_y_tourist_02"
        Female_Character_hash[165]      = "a_f_m_trampbeac_01"
        Female_Character_hash[166]      = "a_f_m_tramp_01"
        Female_Character_hash[167]      = "a_m_m_tranvest_01"
        Female_Character_hash[168]      = "a_m_m_tranvest_02"
        Female_Character_hash[169]      = "a_f_y_vinewood_01"
        Female_Character_hash[170]      = "a_f_y_vinewood_02"
        Female_Character_hash[171]      = "a_f_y_vinewood_03"
        Female_Character_hash[172]      = "a_f_y_vinewood_04"
        Female_Character_hash[173]      = "mp_f_weed_01"
        Female_Character_hash[174]      = "ig_wendy"
        Female_Character_hash[175]      = "a_f_y_yoga_01"
--- TO DO Male Character
    local Male_Character_name = {}
    --        "Agent"
    --        "Abner"
    --        "Acult01AMM"
    --        "Acult01AMO"
    --        "Acult01AMY"
    --        "Acult02AMO"
    --        "Acult02AMY"
    --        "AfriAmer01AMM"
    --        "AirWorkerSMY"
    --        "AlDiNapoli"
    --        "AmmuCity01SMY"
    --		"AmmuCountrySMM"
    --        "Andreas"
    --        "AntonB"
    --        "Autopsy01SMY"
    --        "AutoShop01SMM"
    --        "Autoshop02SMM"
    --        "Autoshop03SMM"
    --        "AviSchwartzman"
    --        "Azteca01GMY"
    --        "BabyD"
    --        "Bankman01"
    --        "Bankman"
    --		"Barman01SMY"
    --        "Baygor"
    --        "BayWatch01SMY"
    --        "Beach01AMM"
    --        "Beach01AMO"
    --        "Beach02AMO"
    --        "Beach01AMY"
    --        "Beach02AMM"
    --        "Beach02AMY"
    --        "Beach03AMY"
    --        "Beach04AMY"
    --        "BeachVesp01AMY"
    --		"Beachvesp02AMY"
    --        "Benny"
    --        "Benny2"
    --        "BestMen"
    --        "Beverly"
    --        "BevHills01AMM"
    --        "BevHills01AMY"
    --        "BevHills02AMM"
    --        "BevHills02AMY"
    --        "BikeHire01"
    --        "BoatStaff01M"
    --        "Bouncer01SMM"
    --		"Bouncer01SMM"
    --        "BreakDance01AMY"
    --        "Brucie2"
    --        "BurgerDrug"
    --        "BusBoy01SMY"
    --        "Busicas01AMY"
    --        "Business01AMM"
    --        "Business01AMY"
    --        "Business02AMY"
    --        "Business03AMY"
    --        "Busker01SMO"
    --		"CarClub"
    --        "CarClubCustomer"
    --        "CarClubCustomer2"
    --        "CarClubCustomer3"
    --        "CarClubCustomer4"
    --        "Car3Guy1"
    --        "Car3Guy2"
    --        "CCrew01SMM"
    --        "Chef01SMY"
    --        "Celeb1"
    --        "Chef2"
    --        "Chef"
    --		"ChemWork01GMM"
    --        "ChemSec01SMM"
    --        "Chip"
    --        "ChrisFormage"
    --        "Claude01"
    --        "Clay"
    --        "ClayPain"
    --        "Cletus"
    --        "CntryBar01SMM"
    --        "Construct01SMY"
    --        "Construct02SMY"
    --        "CrisFormage"
    --		"Cyclist01"
    --        "Cyclist01amy"
    --        "Dale"
    --        "Dealer01SMY"
    --        "Dean"
    --        "DHill01AMY"
    --        "DJBladamon"
    --        "DJBlamRupert"
    --        "DJBlamRyanh"
    --        "DJBlamRyan"
    --        "DJDixManager"
    --        "DJGeneric"
    --        "DJSolFotios"
    --		"DJSolJakob"
    --        "DJSolManager"
    --        "DJSolMike"
    --        "DJSolRobot"
    --        "DJtalaurelia"
    --        "DJtalignazio"
    --        "DJ1"
    --        "DJ2"
    --        "DJ3"
    --        "DJ4"
    --        "DJ5"
    --        "DJ11"
    --        "DJ22"
    --        "DJ33"
    --        "DoaMan"
    --        "DockWork01SMM"
    --		"DockWork01SMY"
    --        "Doctor01SMM"
    --        "Doorman01SMY"
    --        "DownTown01AMY"
    --        "Dreyfuss"
    --        "DrugDealer"
    --        "DWService01SMY"
    --        "DWService02SMY"
    --        "EastSA01AMM"
    --        "Eastsa01AMY"
    --        "EastSa02AMM"
    --		"EastSA02AMY"
    --        "EntourageA"
    --        "EntourageB"
    --        "Epsilon01AMY"
    --        "Epsilon02AMY"
    --        "Factory01SMY"
    --        "FamCA01GMY"
    --        "FamDD01"
    --        "FamDNF01GMY"
    --        "FamFor01GMY"
    --        "Farmer01AMM"
    --		"FatLatin01AMM"
    --        "FilmDirector"
    --        "FilmNoir"
    --        "FinGuru01"
    --        "Fireman01SMY"
    --        "G"
    --        "Gaffer01SMM"
    --        "GarbageSMY"
    --        "Gardener01SMM"
    --        "Gay01AMY"
    --        "Gay02AMY"
    --        "GenFat01AMM"
    --		"GenFat02AMM"
    --        "GenStreet01AMO"
    --        "GenStreet01AMY"
    --        "GenStreet02AMY"
    --        "GenTransportSMM"
    --        "GlenStank01"
    --        "Golfer01AMM"
    --        "Golfer01AMY"
    --        "GolferA"
    --        "GolferB"
    --        "Griff01"
    --		"Grip01SMY"
    --        "Groom"
    --        "Guido01"
    --        "GunVend01"
    --        "HairDress01SMM"
    --        "Hao"
    --        "Hao2"
    --        "HasJew01AMM"
    --        "HasJew01AMY"
    --        "Hiker01AMY"
    --        "HillBilly01AMM"
    --        "HillBilly02AMM"
    --        "Hippy01AMY"
    --		"Hippie01UMY"
    --        "Hipster01AMY"
    --        "Hipster02AMY"
    --        "Hipster03AMY"
    --        "HipsterRamp"
    --        "HCDriver"
    --        "Indian01AMM"
    --        "Indian01AMY"
    --        "JanitorSMM"
    --        "JetSki01AMY"
    --        "JewelSec01"
    --		"JewelThief"
    --        "JimmyBoston"
    --        "JimmyBoston2"
    --        "Jio"
    --        "Jio2"
    --        "JoeMinuteman"
    --        "Johnnyklebitz"
    --        "Josef"
    --        "Josh"
    --        "Juggalo"
    --        "Juanstrickler"
    --        "Justin"
    --        "KTown01AMM"
    --        "KTown01AMO"
    --		"KTown01AMY"
    --        "KTown02AMY"
    --        "Lacey_jones2"
    --        "Lathandy01SMM"
    --        "Latino01AMY"
    --        "LineCookSMM"
    --        "LSMetro01SMM"
    --        "MalC"
    --        "Malibu01AMM"
    --        "Mani"
    --        "Manuel"
    --        "Mariachi01SMM"
    --		"Markfost"
    --        "MethHead01AMY"
    --        "Migrant01SMM"
    --        "Milton"
    --        "Mjo"
    --        "Mjo2"
    --        "MovPrem01SMM"
    --        "MusclBeac01AMY"
    --        "MusclBeac02AMY"
    --        "Musician"
    --        "Paparazzi01AMM"
    --        "Paper"
    --		"Paramedic01SMM"
    --        "Party01"
    --        "PartyPromo"
    --        "PartyTarget"
    --        "PestCont01SMY"
    --        "PestContDriver"
    --        "PestContGunman"
    --        "Pilot"
    --        "Pilot01SMM"
    --        "Pilot01SMY"
    --        "Pilot02SMM"
    --		"Polynesian01AMM"
    --        "Polynesian01AMY"
    --        "Popov"
    --        "Postal01SMM"
    --        "Postal02SMM"
    --        "PrisMuscl01SMY"
    --        "Prisoner01"
    --        "Prisoner01SMY"
    --        "PrologueHost1"
    --        "RaceOrg"
    --        "RampGang"
    --		"RampHic"
    --        "Runner01AMY"
    --        "Runner02AMY"
    --        "RurMeth01AMM"
    --        "RussianDrunk"
    --        "Salton01AMM"
    --        "Salton01AMO"
    --        "Salton01AMY"
    --        "Salton02AMM"
    --        "Salton03AMM"
    --        "Salton04AMM"
    --		"ShopKeep01"
    --        "ShopMaskSMY"
    --        "Skater01AMM"
    --        "Skater01AMY"
    --        "Skater02AMY"
    --        "SkidRow01AMM"
    --        "SmartCaspatAMY"
    --        "SoCenLat01AMM"
    --        "SouCent01AMM"
    --        "SouCent01AMO"
    --        "SouCent01AMY"
    --		"SouCent02AMM"
    --        "SouCent02AMO"
    --        "SouCent02AMY"
    --        "SouCent03AMM"
    --        "SouCent03AMO"
    --        "SouCent03AMY"
    --        "SouCent04AMM"
    --        "SouCent04AMY"
    --        "Soundeng"
    --        "SpyActor"
    --        "StagGrm01AMO"
    --		"StBla01AMY"
    --        "Stbla02AMY"
    --        "StLat01AMY"
    --        "StLat02AMM"
    --        "StrPerf01SMM"
    --        "StrPreach01SMM"
    --        "StrPunk01GMY"
    --        "StrPunk02GMY"
    --        "StrVend01SMM"
    --        "StrVend01SMY"
    --        "StudioAssistant"
    --		"StudioParty1"
    --        "StudioParty2"
    --        "StudioProd"
    --        "StudioSoueng"
    --        "StWhi01AMY"
    --        "StWhi02AMY"
    --        "SunBathe01AMY"
    --        "Surfer01AMY"
    --        "TapHillBilly"
    --        "Tattoo01AMO"
    --        "Tattoo01SMM"
    --		"TattooCustomer"
    --        "Tennis01AMM"
    --        "TennisCoach"
    --        "Terry"
    --        "TomEpsilon"
    --        "Tourist01AMM"
    --        "Tramp01"
    --        "Tramp01AMM"
    --        "Tramp01AMO"
    --        "TrampBeac01AMM"
    --        "TrampBeac01UMO"
    --		"Trucker01SMM"
    --        "TylerDixon"
    --        "UPS01SMM"
    --        "UPS02SMM"
    --        "USCG01SMY"
    --        "Valet01SMY"
    --        "Vernon"
    --        "Vince"
    --        "VineWood01AMY"
    --        "VineWood02AMY"
    --        "Vinewood03AMY"
    --        "Vinewood04AMY"
    --		"Waiter01SMY"
    --        "Weed"
    --        "WeiCheng"
    --        "WillyFist"
    --        "WinClean01SMY"
    --        "XMech01SMY"
    --        "XMech02SMY"
    --        "XMechMP02SMY"
    --        "Yoga01AMY"
    --        "Zimbor"
    --        "Scientist01SMM"
    --        "acult"
    --        "acult2"
    --		"acult3"
    --        "acult4"
    --        "importexport"
    --        "casrn"
    --        "avery"
    --        "gustavo"
    --        "huang"
    --        "oldrich"
    --        "ortega"
    --        "prolsec2"
    --        "rampmex"
    --        "sacha"
    --        "sss"
    --        "talcc"
    --        "talmm"
    --        "thorton"
    --        "mexcntry"
    --		"mlcrisis"
    --        "prolhost"
    --        "TylerDix2"
    --        "tylerDix"
    --        "Zimbor"
    --        "Pros1"
    --        "HeadTrgt"
    --        "AvonGoon"
    --        "BogDanGoon"
    --        "Coke"
    --        "CounterF"
    --        "ForG"
    --        "Marston"
    --        "ExecPA"
    --        "waremech"
    --        "weapexp"
    --		"weapwork"
    --        "SecuroGuard"
    --        "drugprocess"
    --        "fieldworker"
    --        "lifeinvad"
    --        "casino"
    --        "clubbar"
    --        "devinsec"
    --        "mime"
    --        "waretech"
    --        "blane"
    --        "curtis"
    --        "promourn"
    --        "rivalpap"
    --        "streetart"
    --
    local Male_Character_hash = {}
    --		"caleb"
    --        "danceburl"
    --        "dancelthr"
    --        "dancerave"
    --        "fibmugger"
    --        "gabriel"
    --        "ushi"
    --        "croupthief"
    --        "smugmech"
    --        "tranvest"
    --        "tranvest2"
    --        "ig_agent"
    --        "u_m_y_abner"
    --        "a_m_m_acult_01"
    --        "a_m_o_acult_01"
    --        "a_m_y_acult_01"
    --        "a_m_o_acult_02"
    --        "a_m_y_acult_02"
    --        "a_m_m_afriamer_01"
    --        "s_m_y_airworker"
    --        "u_m_m_aldinapoli"
    --        "s_m_y_ammucity_01"
    --		"s_m_m_ammucountry"
    --        "ig_andreas"
    --        "u_m_y_antonb"
    --        "s_m_y_autopsy_01"
    --        "s_m_m_autoshop_01"
    --        "s_m_m_autoshop_02"
    --        "s_m_m_autoshop_03"
    --        "ig_money"
    --        "g_m_y_azteca_01"
    --		"u_m_y_babyd"
    --        "u_m_m_bankman"
    --        "ig_bankman"
    --        "s_m_y_barman_01"
    --        "u_m_y_baygor"
    --        "s_m_y_baywatch_01"
    --        "a_m_m_beach_02"
    --        "a_m_o_beach_01"
    --        "a_m_o_beach_02"
    --        "a_m_y_beach_01"
    --		"a_m_m_beach_02"
    --        "a_m_y_beach_02"
    --        "a_m_y_beach_03"
    --        "a_m_y_beach_04"
    --        "a_m_y_beachvesp_01"
    --        "a_m_y_beachvesp_02"
    --        "ig_benny"
    --        "ig_benny_02"
    --        "ig_bestmen"
    --        "ig_beverly"
    --		"a_m_m_bevhills_01"
    --        "a_m_y_bevhills_01"
    --        "a_m_m_bevhills_02"
    --        "a_m_y_bevhills_02"
    --        "u_m_m_bikehire_01"
    --        "mp_m_boatstaff_01"
    --        "s_m_m_bouncer_01"
    --        "s_m_m_bouncer_02"
    --		"a_m_y_breakdance_01"
    --        "ig_brucie2"
    --        "u_m_y_burgerdrug_01"
    --        "s_m_y_busboy_01"
    --        "a_m_y_busicas_01"
    --        "a_m_m_business_01"
    --        "a_m_y_business_01"
    --        "a_m_y_business_02"
    --		"a_m_y_business_03"
    --        "s_m_o_busker_01"
    --        "a_m_y_carclub_01"
    --        "a_m_y_clubcust_01"
    --        "a_m_y_clubcust_02"
    --        "a_m_y_clubcust_03"
    --        "a_m_y_clubcust_04"
    --        "ig_car3guy1"
    --        "ig_car3guy2"
    --		"s_m_m_ccrew_01"
    --        "s_m_y_chef_01"
    --        "ig_celeb_01"
    --        "ig_chef2"
    --        "ig_chef"
    --        "g_m_m_chemwork_01"
    --        "s_m_m_chemsec_01"
    --        "u_m_y_chip"
    --        "ig_chrisformage"
    --        "mp_m_claude_01"
    --        "ig_clay"
    --		"ig_claypain"
    --        "ig_cletus"
    --        "s_m_m_cntrybar_01"
    --        "s_m_y_construct_01"
    --        "s_m_y_construct_02"
    --        "ig_chrisformage"
    --        "u_m_y_cyclist_01"
    --        "a_m_y_cyclist_01"
    --        "ig_dale"
    --		"s_m_y_dealer_01"
    --        "u_m_o_dean"
    --        "a_m_y_dhill_01"
    --        "ig_djblamadon"
    --        "ig_djblamrupert"
    --        "ig_djblamryanh"
    --        "ig_djblamryans"
    --        "ig_djdixmanager"
    --        "ig_djgeneric_01"
    --		"ig_djsolfotios"
    --        "ig_djsoljakob"
    --        "ig_djsolmanager"
    --        "ig_djsolmike"
    --        "ig_djsolrobt"
    --        "ig_djtalaurelia"
    --        "ig_djtalignazio"
    --        "ig_isldj_00"
    --        "ig_isldj_01"
    --        "ig_isldj_02"
    --		"ig_isldj_03"
    --        "ig_isldj_04"
    --        "ig_isldj_04_d_01"
    --        "ig_isldj_04_d_02"
    --        "ig_isldj_04_e_01"
    --        "u_m_m_doa_01"
    --        "s_m_m_dockwork_01"
    --        "s_m_y_dockwork_01"
    --        "s_m_m_doctor_01"
    --		"s_m_y_doorman_01"
    --        "a_m_y_downtown_01"
    --        "ig_dreyfuss"
    --        "ig_drugdealer"
    --        "s_m_y_dwservice_01"
    --        "s_m_y_dwservice_02"
    --        "a_m_m_eastsa_01"
    --        "a_m_y_eastsa_01"
    --		"a_m_m_eastsa_02"
    --        "a_m_y_eastsa_02"
    --        "ig_entourage_a"
    --        "ig_entourage_b"
    --        "a_m_y_epsilon_01"
    --        "a_m_y_epsilon_02"
    --        "s_m_y_factory_01"
    --        "g_m_y_famca_01"
    --        "mp_m_famdd_01"
    --		"g_m_y_famdnf_01"
    --        "g_m_y_famfor_01"
    --        "a_m_m_farmer_01"
    --        "a_m_m_fatlatin_01"
    --        "u_m_m_filmdirector"
    --        "u_m_o_filmnoir"
    --        "u_m_o_finguru_01"
    --        "s_m_y_fireman_01"
    --        "ig_g"
    --		"s_m_m_gaffer_01"
    --        "s_m_y_garbage"
    --        "s_m_m_gardener_01"
    --        "a_m_y_gay_01"
    --        "a_m_y_gay_02"
    --        "a_m_m_genfat_01"
    --        "a_m_m_genfat_02"
    --        "a_m_o_genstreet_01"
    --        "a_m_y_genstreet_01"
    --		"a_m_y_genstreet_02"
    --        "s_m_m_gentransport"
    --        "u_m_m_glenstank_01"
    --        "a_m_m_golfer_01"
    --        "a_m_y_golfer_01"
    --        "ig_golfer_a"
    --        "ig_golfer_b"
    --        "u_m_m_griff_01"
    --        "s_m_y_grip_01"
    --		"ig_groom"
    --        "u_m_y_guido_01"
    --        "u_m_y_gunvend_01"
    --        "s_m_m_hairdress_01"
    --        "ig_hao"
    --        "ig_hao_02"
    --        "a_m_m_hasjew_01"
    --        "a_m_y_hasjew_01"
    --        "a_m_y_hiker_01"
    --        "a_m_m_hillbilly_01"
    --		"a_m_m_hillbilly_02"
    --        "a_m_y_hippy_01"
    --        "u_m_y_hippie_01"
    --        "a_m_y_hipster_01"
    --        "a_m_y_hipster_02"
    --        "a_m_y_hipster_03"
    --        "ig_ramp_hipster"
    --        "hc_driver"
    --        "a_m_m_indian_01"
    --		"a_m_y_indian_01"
    --        "s_m_m_janitor"
    --        "a_m_y_jetski_01"
    --        "u_m_m_jewelsec_01"
    --        "u_m_m_jewelthief"
    --        "ig_jimmyboston"
    --        "ig_jimmyboston_02"
    --        "ig_jio"
    --        "ig_jio_02"
    --		"ig_joeminuteman"
    --        "ig_johnnyklebitz"
    --        "ig_josef"
    --        "ig_josh"
    --        "a_m_y_juggalo_01"
    --        "ig_juanstrickler"
    --        "u_m_y_justin"
    --        "a_m_m_ktown_01"
    --        "a_m_o_ktown_01"
    --        "a_m_y_ktown_01"
    --		"a_m_y_ktown_02"
    --        "ig_lacey_jones_02"
    --        "s_m_m_lathandy_01"
    --        "a_m_y_latino_01"
    --        "s_m_m_linecook"
    --        "s_m_m_lsmetro_01"
    --        "ig_malc"
    --        "a_m_m_malibu_01"
    --        "u_m_y_mani"
    --        "ig_manuel"
    --		"s_m_m_mariachi_01"
    --        "u_m_m_markfost"
    --        "mp_m_meth_01"
    --        "s_m_m_migrant_01"
    --        "ig_milton"
    --        "ig_mjo"
    --        "ig_mjo_02"
    --        "s_m_m_movprem_01"
    --        "a_m_y_musclbeac_01"
    --		"a_m_y_musclbeac_02"
    --        "ig_musician_00"
    --        "a_m_m_paparazzi_01"
    --        "ig_paper"
    --        "s_m_m_paramedic_01"
    --        "u_m_y_party_01"
    --        "ig_party_promo"
    --        "u_m_m_partytarget"
    --		"s_m_y_pestcont_01"
    --        "u_m_y_proldriver_01"
    --        "hc_gunman"
    --        "ig_pilot"
    --        "s_m_m_pilot_01"
    --        "s_m_y_pilot_01"
    --        "s_m_m_pilot_02"
    --        "a_m_m_polynesian_01"
    --        "a_m_y_polynesian_01"
    --		"ig_popov"
    --        "s_m_m_postal_01"
    --        "s_m_m_postal_02"
    --        "s_m_y_prismuscl_01"
    --        "u_m_y_prisoner_01"
    --        "s_m_y_prisoner_01"
    --        "u_f_o_prolhost_01"
    --        "s_m_m_raceorg_01"
    --        "ig_ramp_gang"
    --		"ig_ramp_hic"
    --        "a_m_y_runner_01"
    --        "a_m_y_runner_02"
    --        "a_m_m_rurmeth_01"
    --        "ig_russiandrunk"
    --        "a_m_m_salton_01"
    --        "a_m_o_salton_01"
    --        "a_m_y_salton_01"
    --        "a_m_m_salton_02"
    --		"a_m_m_salton_03"
    --        "a_m_m_salton_04"
    --        "mp_m_shopkeep_01"
    --        "s_m_y_shop_mask"
    --        "a_m_m_skater_01"
    --        "a_m_y_skater_01"
    --        "a_m_y_skater_02"
    --        "a_m_m_skidrow_01"
    --		"a_m_y_smartcaspat_01"
    --        "a_m_m_socenlat_01"
    --        "a_m_m_soucent_01"
    --        "a_m_o_soucent_01"
    --        "a_m_y_soucent_01"
    --        "a_m_m_soucent_02"
    --        "a_m_o_soucent_02"
    --        "a_m_y_soucent_02"
    --		"a_m_m_soucent_03"
    --        "a_m_o_soucent_03"
    --        "a_m_y_soucent_03"
    --        "a_m_m_soucent_04"
    --        "a_m_y_soucent_04"
    --        "ig_soundeng_00"
    --        "u_m_m_spyactor"
    --        "u_m_y_staggrm_01"
    --		"a_m_y_stbla_01"
    --        "a_m_y_stbla_02"
    --        "a_m_y_stlat_01"
    --        "a_m_m_stlat_02"
    --        "s_m_m_strperf_01"
    --        "s_m_m_strpreach_01"
    --        "g_m_y_strpunk_01"
    --        "g_m_y_strpunk_02"
    --		"s_m_m_strvend_01"
    --        "s_m_y_strvend_01"
    --        "s_m_m_studioassist_02"
    --        "a_m_m_studioparty_01"
    --        "a_m_y_studioparty_01"
    --        "s_m_m_studioprod_01"
    --        "s_m_m_studiosoueng_02"
    --		"a_m_y_stwhi_01"
    --        "a_m_y_stwhi_02"
    --        "a_m_y_sunbathe_01"
    --        "a_m_y_surfer_01"
    --        "u_m_o_taphillbilly"
    --        "u_m_y_tattoo_01"
    --        "s_m_m_tattoo_01"
    --        "a_m_y_tattoocust_01"
    --		"a_m_m_tennis_01"
    --        "ig_tenniscoach"
    --        "ig_terry"
    --        "ig_tomepsilon"
    --        "a_m_m_tourist_01"
    --        "a_m_m_tramp_01"
    --        "a_m_m_tramp_01"
    --        "a_m_o_tramp_01"
    --        "a_m_m_trampbeac_01"
    --		"u_m_o_tramp_01"
    --        "s_m_m_trucker_01"
    --        "ig_dix"
    --        "s_m_m_ups_01"
    --        "s_m_m_ups_02"
    --        "s_m_y_uscg_01"
    --        "s_m_y_valet_01"
    --        "ig_vernon"
    --        "u_m_m_vince"
    --        "a_m_y_vinewood_01"
    --		"a_m_y_vinewood_02"
    --        "a_m_y_vinewood_03"
    --        "a_m_y_vinewood_04"
    --        "s_m_y_waiter_01"
    --        "mp_m_weed_01"
    --        "ig_chengsr"
    --        "u_m_m_willyfist"
    --        "s_m_y_winclean_01"
    --        "s_m_y_xmech_01"
    --		"s_m_y_xmech_02"
    --        "s_m_y_xmech_02_mp"
    --        "a_m_y_yoga_01"
    --        "ig_zimbor"
    --        "s_m_m_scientist_01"
    --        "a_m_o_acult_01"
    --        "a_m_o_acult_02"
    --        "a_m_y_acult_01"
    --        "a_m_y_acult_02"
    --		"g_m_importexport_01"
    --        "g_m_m_casrn_01"
    --        "ig_avery"
    --        "ig_gustavo"
    --        "ig_huang"
    --        "ig_oldrichguy"
    --        "ig_ortega"
    --        "ig_prolsec_02"
    --        "ig_ramp_mex"
    --        "ig_sacha"
    --        "ig_sss"
    --		"ig_talcc"
    --        "ig_talmm"
    --        "ig_thornton"
    --        "a_m_m_mexcntry_01"
    --        "a_m_m_mlcrisis_01"
    --        "a_m_m_prolhost_01"
    --        "ig_tylerdix_02"
    --        "ig_tylerdix"
    --        "ig_zimbor"
    --        "mp_g_m_pros_01"
    --		"mp_headtargets"
    --        "mp_m_avongoon"
    --        "mp_m_bogdangoon"
    --        "mp_m_cocaine_01"
    --        "mp_m_counterfeit_01"
    --        "mp_m_forgery_01"
    --        "mp_m_marston_01"
    --        "mp_m_execpa_01"
    --        "mp_m_waremech_01"
    --		"mp_m_weapexp_01"
    --        "mp_m_weapwork_01"
    --        "mp_m_securoguard_01"
    --        "s_m_m_drugprocess_01"
    --        "s_m_m_fieldworker_01"
    --        "s_m_m_lifeinvad_01"
    --        "s_m_y_casino_01"
    --        "s_m_y_clubbar_01"
    --		"s_m_y_devinsec_01"
    --        "s_m_y_mime"
    --        "s_m_y_waretech_01"
    --        "u_m_m_blane"
    --        "u_m_m_curtis"
    --        "u_m_m_promourn_01"
    --        "u_m_m_rivalpap"
    --        "u_m_m_streetart_01"
    --        "u_m_y_caleb"
    --		"u_m_y_danceburl_01"
    --        "u_m_y_dancelthr_01"
    --        "u_m_y_dancerave_01"
    --        "u_m_y_fibmugger_01"
    --        "u_m_y_gabriel"
    --        "u_m_y_ushi"
    --        "u_m_y_croupthief_01"
    --        "u_m_y_smugmech_01"
    --		"a_m_m_tranvest_01"
    --        "a_m_m_tranvest_02"
--- ✓ Cutscene Female Character
    local Cutscene_Female_Character_name = {}
        Cutscene_Female_Character_name_01 = {"Abigail","Abigail"}
        Cutscene_Female_Character_name_02 = {"Agatha","Agatha"}
        Cutscene_Female_Character_name_03 = {"Amanda Townlee","Amanda Townlee"}
        Cutscene_Female_Character_name_04 = {"Anita","Anita"}
        Cutscene_Female_Character_name_05 = {"Ashley","Ashley"}
        Cutscene_Female_Character_name_06 = {"Bride","Mariée"}
        Cutscene_Female_Character_name_07 = {"Bryony","Bryoni"}
        Cutscene_Female_Character_name_08 = {"Debra","Debra"}
        Cutscene_Female_Character_name_09 = {"Denise","Denise"}
		Cutscene_Female_Character_name_10 = {"Georgina","Geogina"}
        Cutscene_Female_Character_name_11 = {"Guadalope","Guadalope"}
        Cutscene_Female_Character_name_12 = {"Gurk","Gurk"}
        Cutscene_Female_Character_name_13 = {"Imani","Imani"}
        Cutscene_Female_Character_name_14 = {"Mimi","Mimi"}
        Cutscene_Female_Character_name_15 = {"Sessanta","Sessenta"}
        Cutscene_Female_Character_name_16 = {"Jewel Assistant 01","Assistante Joillerie 01"}
        Cutscene_Female_Character_name_17 = {"Jewel Assistant 02","Assistante Joillerie 02"}
        Cutscene_Female_Character_name_18 = {"Janet","Janet"}
		Cutscene_Female_Character_name_19 = {"Karen Daniels","Karen Daniels"}
        Cutscene_Female_Character_name_20 = {"Marnie","Marnie"}
        Cutscene_Female_Character_name_21 = {"Maryann","Maryann"}
        Cutscene_Female_Character_name_22 = {"Maude","Maude"}
        Cutscene_Female_Character_name_23 = {"Michelle","Michelle"}
        Cutscene_Female_Character_name_24 = {"Molly","Molly"}
        Cutscene_Female_Character_name_25 = {"Movie premere","Premiére de Film"}
        Cutscene_Female_Character_name_26 = {"Mrs Thornhill","Mme Thornhill"}
		Cutscene_Female_Character_name_27 = {"Mrs Phillips","Mme Phillips"}
        Cutscene_Female_Character_name_28 = {"Mrs R","Mme R"}
        Cutscene_Female_Character_name_29 = {"Natalia","Natalia"}
        Cutscene_Female_Character_name_30 = {"Paige","Paige"}
        Cutscene_Female_Character_name_31 = {"Patricia 01","Patricia 01"}
        Cutscene_Female_Character_name_32 = {"Patricia 02","Patricia 02"}
        Cutscene_Female_Character_name_33 = {"Screen Writer","Ecrivaine"}
        Cutscene_Female_Character_name_34 = {"Stripper 01","Striptiseuse 01"}
		Cutscene_Female_Character_name_35 = {"Stripper 02","Striptiseuse 02"}
        Cutscene_Female_Character_name_36 = {"Tanisha","Tanisha"}
        Cutscene_Female_Character_name_37 = {"Tonya","Tonya"}
        Cutscene_Female_Character_name_38 = {"Tracy Disanto","Tracy Disanto"}
        Cutscene_Female_Character_name_39 = {"Wendy","Wendy"}
        Cutscene_Female_Character_name[01] = Cutscene_Female_Character_name_01[current_language]
        Cutscene_Female_Character_name[02] = Cutscene_Female_Character_name_02[current_language]
        Cutscene_Female_Character_name[03] = Cutscene_Female_Character_name_03[current_language]
        Cutscene_Female_Character_name[04] = Cutscene_Female_Character_name_04[current_language]
        Cutscene_Female_Character_name[05] = Cutscene_Female_Character_name_05[current_language]
        Cutscene_Female_Character_name[06] = Cutscene_Female_Character_name_06[current_language]
        Cutscene_Female_Character_name[07] = Cutscene_Female_Character_name_07[current_language]
        Cutscene_Female_Character_name[08] = Cutscene_Female_Character_name_08[current_language]
        Cutscene_Female_Character_name[09] = Cutscene_Female_Character_name_09[current_language]
        Cutscene_Female_Character_name[10] = Cutscene_Female_Character_name_10[current_language]
        Cutscene_Female_Character_name[11] = Cutscene_Female_Character_name_11[current_language]
        Cutscene_Female_Character_name[12] = Cutscene_Female_Character_name_12[current_language]
        Cutscene_Female_Character_name[13] = Cutscene_Female_Character_name_13[current_language]
        Cutscene_Female_Character_name[14] = Cutscene_Female_Character_name_14[current_language]
        Cutscene_Female_Character_name[15] = Cutscene_Female_Character_name_15[current_language]
        Cutscene_Female_Character_name[16] = Cutscene_Female_Character_name_16[current_language]
        Cutscene_Female_Character_name[17] = Cutscene_Female_Character_name_17[current_language]
        Cutscene_Female_Character_name[18] = Cutscene_Female_Character_name_18[current_language]
        Cutscene_Female_Character_name[19] = Cutscene_Female_Character_name_19[current_language]
        Cutscene_Female_Character_name[20] = Cutscene_Female_Character_name_20[current_language]
        Cutscene_Female_Character_name[21] = Cutscene_Female_Character_name_21[current_language]
        Cutscene_Female_Character_name[22] = Cutscene_Female_Character_name_22[current_language]
        Cutscene_Female_Character_name[23] = Cutscene_Female_Character_name_23[current_language]
        Cutscene_Female_Character_name[24] = Cutscene_Female_Character_name_24[current_language]
        Cutscene_Female_Character_name[25] = Cutscene_Female_Character_name_25[current_language]
        Cutscene_Female_Character_name[26] = Cutscene_Female_Character_name_26[current_language]
        Cutscene_Female_Character_name[27] = Cutscene_Female_Character_name_27[current_language]
        Cutscene_Female_Character_name[28] = Cutscene_Female_Character_name_28[current_language]
        Cutscene_Female_Character_name[29] = Cutscene_Female_Character_name_29[current_language]
        Cutscene_Female_Character_name[30] = Cutscene_Female_Character_name_30[current_language]
        Cutscene_Female_Character_name[31] = Cutscene_Female_Character_name_31[current_language]
        Cutscene_Female_Character_name[32] = Cutscene_Female_Character_name_32[current_language]
        Cutscene_Female_Character_name[33] = Cutscene_Female_Character_name_33[current_language]
        Cutscene_Female_Character_name[34] = Cutscene_Female_Character_name_34[current_language]
        Cutscene_Female_Character_name[35] = Cutscene_Female_Character_name_35[current_language]
        Cutscene_Female_Character_name[36] = Cutscene_Female_Character_name_36[current_language]
        Cutscene_Female_Character_name[37] = Cutscene_Female_Character_name_37[current_language]
        Cutscene_Female_Character_name[38] = Cutscene_Female_Character_name_38[current_language]
        Cutscene_Female_Character_name[39] = Cutscene_Female_Character_name_39[current_language]
    local Cutscene_Female_Character_hash = {}
        Cutscene_Female_Character_hash[01] = "csb_abigail"
        Cutscene_Female_Character_hash[02] = "csb_agatha"
        Cutscene_Female_Character_hash[03] = "cs_amandatownley"
        Cutscene_Female_Character_hash[04] = "csb_anita"
		Cutscene_Female_Character_hash[05] = "cs_ashley"
        Cutscene_Female_Character_hash[06] = "csb_bryony"
        Cutscene_Female_Character_hash[07] = "csb_bride"
        Cutscene_Female_Character_hash[08] = "cs_debra"
        Cutscene_Female_Character_hash[09] = "cs_denise"
        Cutscene_Female_Character_hash[10] = "csb_georginacheng"
        Cutscene_Female_Character_hash[11] = "cs_guadalope"
        Cutscene_Female_Character_hash[12] = "cs_gurk"
        Cutscene_Female_Character_hash[13] = "csb_imani "
        Cutscene_Female_Character_hash[14] = "csb_mimi"
        Cutscene_Female_Character_hash[15] = "csb_sessanta"
        Cutscene_Female_Character_hash[16] = "cs_jewelass_01"
		Cutscene_Female_Character_hash[17] = "cs_jewelass"
        Cutscene_Female_Character_hash[18] = "cs_janet"
        Cutscene_Female_Character_hash[19] = "cs_karen_daniels"
        Cutscene_Female_Character_hash[20] = "cs_marnie"
        Cutscene_Female_Character_hash[21] = "cs_maryann"
        Cutscene_Female_Character_hash[22] = "csb_maude"
        Cutscene_Female_Character_hash[23] = "cs_michelle"
        Cutscene_Female_Character_hash[24] = "cs_molly"
        Cutscene_Female_Character_hash[25] = "cs_movpremf_01"
        Cutscene_Female_Character_hash[26] = "cs_mrs_thornhill"
        Cutscene_Female_Character_hash[27] = "cs_mrsphillips"
		Cutscene_Female_Character_hash[28] = "csb_mrs_r"
        Cutscene_Female_Character_hash[29] = "cs_natalia"
        Cutscene_Female_Character_hash[30] = "csb_paige"
        Cutscene_Female_Character_hash[31] = "cs_patricia"
        Cutscene_Female_Character_hash[32] = "cs_patricia_02"
        Cutscene_Female_Character_hash[33] = "csb_screen_writer"
        Cutscene_Female_Character_hash[34] = "csb_stripper_01"
        Cutscene_Female_Character_hash[35] = "csb_stripper_02"
        Cutscene_Female_Character_hash[36] = "cs_tanisha"
        Cutscene_Female_Character_hash[37] = "csb_tonya"
		Cutscene_Female_Character_hash[38] = "cs_tracydisanto"
        Cutscene_Female_Character_hash[39] = "csb_wendy"
--- ✓ Cutscene Male Character
    local Cutscene_Male_Character_name = {}
        Cutscene_Male_Character_name_01  = {"Agent 14","Agent 14"}
        Cutscene_Male_Character_name_02  = {"Agent","Agent"}
        Cutscene_Male_Character_name_03  = {"Alan","Alan"}
        Cutscene_Male_Character_name_04  = {"Ary 01","Ary 01"}
        Cutscene_Male_Character_name_05  = {"Ary 02","Ary 02"}
        Cutscene_Male_Character_name_06  = {"Avery","Avery"}
        Cutscene_Male_Character_name_07  = {"Avon","Avon"}
        Cutscene_Male_Character_name_08  = {"Andreas","Andreas"}
        Cutscene_Male_Character_name_09  = {"Anton","Anton"}
		Cutscene_Male_Character_name_10  = {"Avi Schwartzman01","Avi Schwartzman01"}
        Cutscene_Male_Character_name_11  = {"Avi Schwartzman02","Avi Schwartzman02"}
        Cutscene_Male_Character_name_12  = {"Ballas Leader","Leader des Ballas"}
        Cutscene_Male_Character_name_13  = {"Ballas OG","Ballas OG"}
        Cutscene_Male_Character_name_14  = {"Bankman","Bankman"}
        Cutscene_Male_Character_name_15  = {"Barry","Barry"}
        Cutscene_Male_Character_name_16  = {"Beverly","Beverly"}
        Cutscene_Male_Character_name_17  = {"Billonaire","Milliardaire"}
		Cutscene_Male_Character_name_18  = {"Brad Cadaver","Brad Cadaver"}
        Cutscene_Male_Character_name_19  = {"Brad","Brad"}
        Cutscene_Male_Character_name_20  = {"Burger Drug","Drogue dans le Burger"}
        Cutscene_Male_Character_name_21  = {"Bogdan","Bogdan"}
        Cutscene_Male_Character_name_22  = {"Brucie","Brucie"}
        Cutscene_Male_Character_name_23  = {"Car Guy 01","Car Guy 01"}
        Cutscene_Male_Character_name_24  = {"Car Guy 02","Car Guy 02"}
        Cutscene_Male_Character_name_25  = {"Car Buyer","Acheteur"}
		Cutscene_Male_Character_name_26  = {"Casey","Casey"}
        Cutscene_Male_Character_name_27  = {"Celeb","Celeb"}
        Cutscene_Male_Character_name_28  = {"Chef 01","Chef 01"}
        Cutscene_Male_Character_name_29  = {"Chef 02","Chef 02"}
        Cutscene_Male_Character_name_30  = {"Chinese Goon","Crétins Chinois"}
        Cutscene_Male_Character_name_31  = {"Clay","Clay"}
        Cutscene_Male_Character_name_32  = {"Cletus","Cletus"}
        Cutscene_Male_Character_name_33  = {"Club 01","Club 01"}
        Cutscene_Male_Character_name_34  = {"Club 02","Club 02"}
		Cutscene_Male_Character_name_35  = {"Club 03","Club 03"}
        Cutscene_Male_Character_name_36  = {"Club 04","Club 04"}
        Cutscene_Male_Character_name_37  = {"Cris Formage","Cris Formage"}
        Cutscene_Male_Character_name_38  = {"Customer","Client"}
        Cutscene_Male_Character_name_39  = {"Cop","Policier"}
        Cutscene_Male_Character_name_40  = {"Dale","Dale"}
        Cutscene_Male_Character_name_41  = {"Dave Norton","Dave Norton"}
        Cutscene_Male_Character_name_42  = {"Devin","Devin"}
        Cutscene_Male_Character_name_43  = {"Tyler Dixon","Tyler Dixon"}
		Cutscene_Male_Character_name_44  = {"DJ Blamadon","DJ Blamadon"}
        Cutscene_Male_Character_name_45  = {"DJ 01","DJ 01"}
        Cutscene_Male_Character_name_46  = {"DJ 02","DJ 02"}
        Cutscene_Male_Character_name_47  = {"DJ 03","DJ 03"}
        Cutscene_Male_Character_name_48  = {"DJ 04","DJ 04"}
        Cutscene_Male_Character_name_49  = {"DJ 05","DJ 05"}
        Cutscene_Male_Character_name_50  = {"Dom","Dom"}
        Cutscene_Male_Character_name_51  = {"Dreyfuss","Dreyfuss"}
        Cutscene_Male_Character_name_52  = {"Dr Friedlander","Dr Friedlander"}
        Cutscene_Male_Character_name_53  = {"Drug Dealer","Drug Dealer"}
        Cutscene_Male_Character_name_54  = {"English Dave 01","Dave l'anglais 01"}
        Cutscene_Male_Character_name_55  = {"English Dave 02","Dave l'anglais 02"}
		Cutscene_Male_Character_name_56  = {"Fabien","Fabien"}
        Cutscene_Male_Character_name_57  = {"FIB","FIB"}
        Cutscene_Male_Character_name_58  = {"Floyd","Floyd"}
        Cutscene_Male_Character_name_59  = {"Fos Rep","Fos Rep"}
        Cutscene_Male_Character_name_60  = {"G","G"}
        Cutscene_Male_Character_name_61  = {"Golfer A","Golfeur A"}
        Cutscene_Male_Character_name_62  = {"Golfer B","Golfeur B"}
        Cutscene_Male_Character_name_63  = {"Gustavo","Gustavo"}
        Cutscene_Male_Character_name_64  = {"Groom","Groom"}
        Cutscene_Male_Character_name_65  = {"Grove Street Dealer","Dealer de Grove Street"}
		Cutscene_Male_Character_name_66  = {"Hao 01","Hao 01"}
        Cutscene_Male_Character_name_67  = {"Hao 02","Hao 02"}
        Cutscene_Male_Character_name_68  = {"Huang","Huang"}
        Cutscene_Male_Character_name_69  = {"Hugh","Hugh"}
        Cutscene_Male_Character_name_70  = {"Hunter","Chasseur"}
        Cutscene_Male_Character_name_71  = {"Imran","Imran"}
        Cutscene_Male_Character_name_72  = {"Jack Howitzer","Jack Howitzer"}
        Cutscene_Male_Character_name_73  = {"Janitor","Concierge"}
        Cutscene_Male_Character_name_74  = {"Jimmy Boston","Jimmy Boston"}
		Cutscene_Male_Character_name_75  = {"Jimmy Disanto 01","Jimmy Disanto 01"}
        Cutscene_Male_Character_name_76  = {"Jimmy Disanto 02","Jimmy Disanto 02"}
        Cutscene_Male_Character_name_77  = {"Jio","Jio"}
        Cutscene_Male_Character_name_78  = {"Joe Minuteman","Joe Minuteman"}
        Cutscene_Male_Character_name_79  = {"Johnny Klebitz","Johnny Klebitz"}
        Cutscene_Male_Character_name_80  = {"Johnny Guns","Johnny Guns"}
        Cutscene_Male_Character_name_81  = {"Josef","Josef"}
        Cutscene_Male_Character_name_82  = {"Josh","Josh"}
		Cutscene_Male_Character_name_83  = {"Juan","Juan"}
        Cutscene_Male_Character_name_84  = {"Lamar Davis 01","Lamar Davis 01"}
        Cutscene_Male_Character_name_85  = {"Lamar Davis 02","Lamar Davis 02"}
        Cutscene_Male_Character_name_86  = {"Lazlow 01","Lazlow 01"}
        Cutscene_Male_Character_name_87  = {"Lazlow 02","Lazlow 02"}
        Cutscene_Male_Character_name_88  = {"Lester Crest 01","Lester Crest 01"}
        Cutscene_Male_Character_name_89  = {"Lester Crest 02","Lester Crest 02"}
        Cutscene_Male_Character_name_90  = {"Lester Crest 03","Lester Crest 03"}
		Cutscene_Male_Character_name_91  = {"Life Invader","Life Invader"}
        Cutscene_Male_Character_name_92  = {"Magenta","Magenta"}
        Cutscene_Male_Character_name_93  = {"Marine","Marine"}
        Cutscene_Male_Character_name_94  = {"Merryweather","Merryweather"}
        Cutscene_Male_Character_name_95  = {"Manuel","Manuel"}
        Cutscene_Male_Character_name_96  = {"Martin Madrazo","Martin Madrazo"}
        Cutscene_Male_Character_name_97  = {"Miguel","Miguel"}
        Cutscene_Male_Character_name_98  = {"Milton","Milton"}
        Cutscene_Male_Character_name_99  = {"Mjo","Mjo"}
		Cutscene_Male_Character_name_100 = {"Mjo","Mjo"}
        Cutscene_Male_Character_name_101 = {"Moody man","Moody man"}
        Cutscene_Male_Character_name_102 = {"Movie Premere","Premiére de Film"}
        Cutscene_Male_Character_name_103 = {"Mr K","Mr K"}
        Cutscene_Male_Character_name_104 = {"Musician","Musician"}
        Cutscene_Male_Character_name_105 = {"Nervous Ron","Nervous Ron"}
        Cutscene_Male_Character_name_106 = {"Nigel","Nigel"}
        Cutscene_Male_Character_name_107 = {"Old Man 01","Old Man 01"}
		Cutscene_Male_Character_name_108 = {"Old Man 02","Old Man 02"}
        Cutscene_Male_Character_name_109 = {"Omega","Omega"}
        Cutscene_Male_Character_name_110 = {"Orleans","Orleans"}
        Cutscene_Male_Character_name_111 = {"Ortega","Ortega"}
        Cutscene_Male_Character_name_112 = {"Oscar","Oscar"}
        Cutscene_Male_Character_name_113 = {"Paper","Paper"}
        Cutscene_Male_Character_name_114 = {"Party Promo","Party Promo"}
        Cutscene_Male_Character_name_115 = {"Pavel","Pavel"}
        Cutscene_Male_Character_name_116 = {"Popov","Popov"}
		Cutscene_Male_Character_name_117 = {"Porn Dudes","Porn Dudes"}
        Cutscene_Male_Character_name_118 = {"Priest","Priest"}
        Cutscene_Male_Character_name_119 = {"ProlDriver","ProlDriver"}
        Cutscene_Male_Character_name_120 = {"Prologue Security 01","Sécurité du Prologue 01"}
        Cutscene_Male_Character_name_121 = {"Prologue Security 02","Sécurité du Prologue 02"}
        Cutscene_Male_Character_name_122 = {"Ramp Gang","Ramp Gang"}
        Cutscene_Male_Character_name_123 = {"Ramp Hic","Ramp Hic"}
		Cutscene_Male_Character_name_124 = {"Ramp Hipster","Ramp Hipster"}
        Cutscene_Male_Character_name_125 = {"Ramp Mex","Ramp Mex"}
        Cutscene_Male_Character_name_126 = {"Rashkovsky","Rashkovsky"}
        Cutscene_Male_Character_name_127 = {"Req Officer","Req Officer"}
        Cutscene_Male_Character_name_128 = {"Rocco Pelosi","Rocco Pelosi"}
        Cutscene_Male_Character_name_129 = {"Russian Drunk","Russian Drunk"}
        Cutscene_Male_Character_name_130 = {"Security","Security"}
		Cutscene_Male_Character_name_131 = {"Screen Writer","Ecrivain"}
        Cutscene_Male_Character_name_132 = {"Siemon Yetarian","Siemon Yetarian"}
        Cutscene_Male_Character_name_133 = {"Sol","Sol"}
        Cutscene_Male_Character_name_134 = {"Solomon","Solomon"}
        Cutscene_Male_Character_name_135 = {"Soundeng","Soundeng"}
        Cutscene_Male_Character_name_136 = {"SSS","SSS"}
        Cutscene_Male_Character_name_137 = {"Steve Hains","Steve Hains"}
        Cutscene_Male_Character_name_138 = {"Stretch","Stretch"}
		Cutscene_Male_Character_name_139 = {"Tao Cheng","Tao Cheng"}
        Cutscene_Male_Character_name_140 = {"Talcc","Talcc"}
        Cutscene_Male_Character_name_141 = {"Talm","Talm"}
        Cutscene_Male_Character_name_142 = {"Thorton","Thorton"}
        Cutscene_Male_Character_name_143 = {"Tao Cheng","Tao Cheng"}
        Cutscene_Male_Character_name_144 = {"Taos Translator 01","Traducteur de Tao 01"}
        Cutscene_Male_Character_name_145 = {"Taos Translator 02","Traducteur de Tao 02"}
        Cutscene_Male_Character_name_146 = {"Tennis Coach","Coach de Tennis"}
		Cutscene_Male_Character_name_147 = {"Terry","Terry"}
        Cutscene_Male_Character_name_148 = {"Tom","Tom"}
        Cutscene_Male_Character_name_149 = {"Tom Casino","Tom Casino"}
        Cutscene_Male_Character_name_150 = {"Tom Epsilon","Tom Epsilon"}
        Cutscene_Male_Character_name_151 = {"Tony Prince","Tony Prince"}
        Cutscene_Male_Character_name_152 = {"Reporter","Journaliste"}
        Cutscene_Male_Character_name_153 = {"Traffic Warden","Gérant de traffic"}
        Cutscene_Male_Character_name_154 = {"Undercover Cop","Policier Sous Couverture"}
		Cutscene_Male_Character_name_155 = {"Vagos Leader","Leader des Vagos"}
        Cutscene_Male_Character_name_156 = {"Vagos Speak","Orateur des Vagos"}
        Cutscene_Male_Character_name_157 = {"Vernon","Vernon"}
        Cutscene_Male_Character_name_158 = {"VinCent 01","VinCent 01"}
        Cutscene_Male_Character_name_159 = {"VinCent 02","VinCent 02"}
        Cutscene_Male_Character_name_160 = {"Wade","Wade"}
        Cutscene_Male_Character_name_161 = {"Wei Cheng","Wei Cheng"}
        Cutscene_Male_Character_name_162 = {"Zimbor","Zimbor"}
        Cutscene_Male_Character_name_163 = {"Jio","Jio"}
        Cutscene_Male_Character_name[01 ] = Cutscene_Male_Character_name_01 [current_language]
        Cutscene_Male_Character_name[02 ] = Cutscene_Male_Character_name_02 [current_language]
        Cutscene_Male_Character_name[03 ] = Cutscene_Male_Character_name_03 [current_language]
        Cutscene_Male_Character_name[04 ] = Cutscene_Male_Character_name_04 [current_language]
        Cutscene_Male_Character_name[05 ] = Cutscene_Male_Character_name_05 [current_language]
        Cutscene_Male_Character_name[06 ] = Cutscene_Male_Character_name_06 [current_language]
        Cutscene_Male_Character_name[07 ] = Cutscene_Male_Character_name_07 [current_language]
        Cutscene_Male_Character_name[08 ] = Cutscene_Male_Character_name_08 [current_language]
        Cutscene_Male_Character_name[09 ] = Cutscene_Male_Character_name_09 [current_language]
        Cutscene_Male_Character_name[10 ] = Cutscene_Male_Character_name_10 [current_language]
        Cutscene_Male_Character_name[11 ] = Cutscene_Male_Character_name_11 [current_language]
        Cutscene_Male_Character_name[12 ] = Cutscene_Male_Character_name_12 [current_language]
        Cutscene_Male_Character_name[13 ] = Cutscene_Male_Character_name_13 [current_language]
        Cutscene_Male_Character_name[14 ] = Cutscene_Male_Character_name_14 [current_language]
        Cutscene_Male_Character_name[15 ] = Cutscene_Male_Character_name_15 [current_language]
        Cutscene_Male_Character_name[16 ] = Cutscene_Male_Character_name_16 [current_language]
        Cutscene_Male_Character_name[17 ] = Cutscene_Male_Character_name_17 [current_language]
        Cutscene_Male_Character_name[18 ] = Cutscene_Male_Character_name_18 [current_language]
        Cutscene_Male_Character_name[19 ] = Cutscene_Male_Character_name_19 [current_language]
        Cutscene_Male_Character_name[20 ] = Cutscene_Male_Character_name_20 [current_language]
        Cutscene_Male_Character_name[21 ] = Cutscene_Male_Character_name_21 [current_language]
        Cutscene_Male_Character_name[22 ] = Cutscene_Male_Character_name_22 [current_language]
        Cutscene_Male_Character_name[23 ] = Cutscene_Male_Character_name_23 [current_language]
        Cutscene_Male_Character_name[24 ] = Cutscene_Male_Character_name_24 [current_language]
        Cutscene_Male_Character_name[25 ] = Cutscene_Male_Character_name_25 [current_language]
        Cutscene_Male_Character_name[26 ] = Cutscene_Male_Character_name_26 [current_language]
        Cutscene_Male_Character_name[27 ] = Cutscene_Male_Character_name_27 [current_language]
        Cutscene_Male_Character_name[28 ] = Cutscene_Male_Character_name_28 [current_language]
        Cutscene_Male_Character_name[29 ] = Cutscene_Male_Character_name_29 [current_language]
        Cutscene_Male_Character_name[30 ] = Cutscene_Male_Character_name_30 [current_language]
        Cutscene_Male_Character_name[31 ] = Cutscene_Male_Character_name_31 [current_language]
        Cutscene_Male_Character_name[32 ] = Cutscene_Male_Character_name_32 [current_language]
        Cutscene_Male_Character_name[33 ] = Cutscene_Male_Character_name_33 [current_language]
        Cutscene_Male_Character_name[34 ] = Cutscene_Male_Character_name_34 [current_language]
        Cutscene_Male_Character_name[35 ] = Cutscene_Male_Character_name_35 [current_language]
        Cutscene_Male_Character_name[36 ] = Cutscene_Male_Character_name_36 [current_language]
        Cutscene_Male_Character_name[37 ] = Cutscene_Male_Character_name_37 [current_language]
        Cutscene_Male_Character_name[38 ] = Cutscene_Male_Character_name_38 [current_language]
        Cutscene_Male_Character_name[39 ] = Cutscene_Male_Character_name_39 [current_language]
        Cutscene_Male_Character_name[40 ] = Cutscene_Male_Character_name_40 [current_language]
        Cutscene_Male_Character_name[41 ] = Cutscene_Male_Character_name_41 [current_language]
        Cutscene_Male_Character_name[42 ] = Cutscene_Male_Character_name_42 [current_language]
        Cutscene_Male_Character_name[43 ] = Cutscene_Male_Character_name_43 [current_language]
        Cutscene_Male_Character_name[44 ] = Cutscene_Male_Character_name_44 [current_language]
        Cutscene_Male_Character_name[45 ] = Cutscene_Male_Character_name_45 [current_language]
        Cutscene_Male_Character_name[46 ] = Cutscene_Male_Character_name_46 [current_language]
        Cutscene_Male_Character_name[47 ] = Cutscene_Male_Character_name_47 [current_language]
        Cutscene_Male_Character_name[48 ] = Cutscene_Male_Character_name_48 [current_language]
        Cutscene_Male_Character_name[49 ] = Cutscene_Male_Character_name_49 [current_language]
        Cutscene_Male_Character_name[50 ] = Cutscene_Male_Character_name_50 [current_language]
        Cutscene_Male_Character_name[51 ] = Cutscene_Male_Character_name_51 [current_language]
        Cutscene_Male_Character_name[52 ] = Cutscene_Male_Character_name_52 [current_language]
        Cutscene_Male_Character_name[53 ] = Cutscene_Male_Character_name_53 [current_language]
        Cutscene_Male_Character_name[54 ] = Cutscene_Male_Character_name_54 [current_language]
        Cutscene_Male_Character_name[55 ] = Cutscene_Male_Character_name_55 [current_language]
        Cutscene_Male_Character_name[56 ] = Cutscene_Male_Character_name_56 [current_language]
        Cutscene_Male_Character_name[57 ] = Cutscene_Male_Character_name_57 [current_language]
        Cutscene_Male_Character_name[58 ] = Cutscene_Male_Character_name_58 [current_language]
        Cutscene_Male_Character_name[59 ] = Cutscene_Male_Character_name_59 [current_language]
        Cutscene_Male_Character_name[60 ] = Cutscene_Male_Character_name_60 [current_language]
        Cutscene_Male_Character_name[61 ] = Cutscene_Male_Character_name_61 [current_language]
        Cutscene_Male_Character_name[62 ] = Cutscene_Male_Character_name_62 [current_language]
        Cutscene_Male_Character_name[63 ] = Cutscene_Male_Character_name_63 [current_language]
        Cutscene_Male_Character_name[64 ] = Cutscene_Male_Character_name_64 [current_language]
        Cutscene_Male_Character_name[65 ] = Cutscene_Male_Character_name_65 [current_language]
        Cutscene_Male_Character_name[66 ] = Cutscene_Male_Character_name_66 [current_language]
        Cutscene_Male_Character_name[67 ] = Cutscene_Male_Character_name_67 [current_language]
        Cutscene_Male_Character_name[68 ] = Cutscene_Male_Character_name_68 [current_language]
        Cutscene_Male_Character_name[69 ] = Cutscene_Male_Character_name_69 [current_language]
        Cutscene_Male_Character_name[70 ] = Cutscene_Male_Character_name_70 [current_language]
        Cutscene_Male_Character_name[71 ] = Cutscene_Male_Character_name_71 [current_language]
        Cutscene_Male_Character_name[72 ] = Cutscene_Male_Character_name_72 [current_language]
        Cutscene_Male_Character_name[73 ] = Cutscene_Male_Character_name_73 [current_language]
        Cutscene_Male_Character_name[74 ] = Cutscene_Male_Character_name_74 [current_language]
        Cutscene_Male_Character_name[75 ] = Cutscene_Male_Character_name_75 [current_language]
        Cutscene_Male_Character_name[76 ] = Cutscene_Male_Character_name_76 [current_language]
        Cutscene_Male_Character_name[77 ] = Cutscene_Male_Character_name_77 [current_language]
        Cutscene_Male_Character_name[78 ] = Cutscene_Male_Character_name_78 [current_language]
        Cutscene_Male_Character_name[79 ] = Cutscene_Male_Character_name_79 [current_language]
        Cutscene_Male_Character_name[80 ] = Cutscene_Male_Character_name_80 [current_language]
        Cutscene_Male_Character_name[81 ] = Cutscene_Male_Character_name_81 [current_language]
        Cutscene_Male_Character_name[82 ] = Cutscene_Male_Character_name_82 [current_language]
        Cutscene_Male_Character_name[83 ] = Cutscene_Male_Character_name_83 [current_language]
        Cutscene_Male_Character_name[84 ] = Cutscene_Male_Character_name_84 [current_language]
        Cutscene_Male_Character_name[85 ] = Cutscene_Male_Character_name_85 [current_language]
        Cutscene_Male_Character_name[86 ] = Cutscene_Male_Character_name_86 [current_language]
        Cutscene_Male_Character_name[87 ] = Cutscene_Male_Character_name_87 [current_language]
        Cutscene_Male_Character_name[88 ] = Cutscene_Male_Character_name_88 [current_language]
        Cutscene_Male_Character_name[89 ] = Cutscene_Male_Character_name_89 [current_language]
        Cutscene_Male_Character_name[90 ] = Cutscene_Male_Character_name_90 [current_language]
        Cutscene_Male_Character_name[91 ] = Cutscene_Male_Character_name_91 [current_language]
        Cutscene_Male_Character_name[92 ] = Cutscene_Male_Character_name_92 [current_language]
        Cutscene_Male_Character_name[93 ] = Cutscene_Male_Character_name_93 [current_language]
        Cutscene_Male_Character_name[94 ] = Cutscene_Male_Character_name_94 [current_language]
        Cutscene_Male_Character_name[95 ] = Cutscene_Male_Character_name_95 [current_language]
        Cutscene_Male_Character_name[96 ] = Cutscene_Male_Character_name_96 [current_language]
        Cutscene_Male_Character_name[97 ] = Cutscene_Male_Character_name_97 [current_language]
        Cutscene_Male_Character_name[98 ] = Cutscene_Male_Character_name_98 [current_language]
        Cutscene_Male_Character_name[99 ] = Cutscene_Male_Character_name_99 [current_language]
        Cutscene_Male_Character_name[100] = Cutscene_Male_Character_name_100[current_language]
        Cutscene_Male_Character_name[101] = Cutscene_Male_Character_name_101[current_language]
        Cutscene_Male_Character_name[102] = Cutscene_Male_Character_name_102[current_language]
        Cutscene_Male_Character_name[103] = Cutscene_Male_Character_name_103[current_language]
        Cutscene_Male_Character_name[104] = Cutscene_Male_Character_name_104[current_language]
        Cutscene_Male_Character_name[105] = Cutscene_Male_Character_name_105[current_language]
        Cutscene_Male_Character_name[106] = Cutscene_Male_Character_name_106[current_language]
        Cutscene_Male_Character_name[107] = Cutscene_Male_Character_name_107[current_language]
        Cutscene_Male_Character_name[108] = Cutscene_Male_Character_name_108[current_language]
        Cutscene_Male_Character_name[109] = Cutscene_Male_Character_name_109[current_language]
        Cutscene_Male_Character_name[110] = Cutscene_Male_Character_name_110[current_language]
        Cutscene_Male_Character_name[111] = Cutscene_Male_Character_name_111[current_language]
        Cutscene_Male_Character_name[112] = Cutscene_Male_Character_name_112[current_language]
        Cutscene_Male_Character_name[113] = Cutscene_Male_Character_name_113[current_language]
        Cutscene_Male_Character_name[114] = Cutscene_Male_Character_name_114[current_language]
        Cutscene_Male_Character_name[115] = Cutscene_Male_Character_name_115[current_language]
        Cutscene_Male_Character_name[116] = Cutscene_Male_Character_name_116[current_language]
        Cutscene_Male_Character_name[117] = Cutscene_Male_Character_name_117[current_language]
        Cutscene_Male_Character_name[118] = Cutscene_Male_Character_name_118[current_language]
        Cutscene_Male_Character_name[119] = Cutscene_Male_Character_name_119[current_language]
        Cutscene_Male_Character_name[120] = Cutscene_Male_Character_name_120[current_language]
        Cutscene_Male_Character_name[121] = Cutscene_Male_Character_name_121[current_language]
        Cutscene_Male_Character_name[122] = Cutscene_Male_Character_name_122[current_language]
        Cutscene_Male_Character_name[123] = Cutscene_Male_Character_name_123[current_language]
        Cutscene_Male_Character_name[124] = Cutscene_Male_Character_name_124[current_language]
        Cutscene_Male_Character_name[125] = Cutscene_Male_Character_name_125[current_language]
        Cutscene_Male_Character_name[126] = Cutscene_Male_Character_name_126[current_language]
        Cutscene_Male_Character_name[127] = Cutscene_Male_Character_name_127[current_language]
        Cutscene_Male_Character_name[128] = Cutscene_Male_Character_name_128[current_language]
        Cutscene_Male_Character_name[129] = Cutscene_Male_Character_name_129[current_language]
        Cutscene_Male_Character_name[130] = Cutscene_Male_Character_name_130[current_language]
        Cutscene_Male_Character_name[131] = Cutscene_Male_Character_name_131[current_language]
        Cutscene_Male_Character_name[132] = Cutscene_Male_Character_name_132[current_language]
        Cutscene_Male_Character_name[133] = Cutscene_Male_Character_name_133[current_language]
        Cutscene_Male_Character_name[134] = Cutscene_Male_Character_name_134[current_language]
        Cutscene_Male_Character_name[135] = Cutscene_Male_Character_name_135[current_language]
        Cutscene_Male_Character_name[136] = Cutscene_Male_Character_name_136[current_language]
        Cutscene_Male_Character_name[137] = Cutscene_Male_Character_name_137[current_language]
        Cutscene_Male_Character_name[138] = Cutscene_Male_Character_name_138[current_language]
        Cutscene_Male_Character_name[139] = Cutscene_Male_Character_name_139[current_language]
        Cutscene_Male_Character_name[140] = Cutscene_Male_Character_name_140[current_language]
        Cutscene_Male_Character_name[141] = Cutscene_Male_Character_name_141[current_language]
        Cutscene_Male_Character_name[142] = Cutscene_Male_Character_name_142[current_language]
        Cutscene_Male_Character_name[143] = Cutscene_Male_Character_name_143[current_language]
        Cutscene_Male_Character_name[144] = Cutscene_Male_Character_name_144[current_language]
        Cutscene_Male_Character_name[145] = Cutscene_Male_Character_name_145[current_language]
        Cutscene_Male_Character_name[146] = Cutscene_Male_Character_name_146[current_language]
        Cutscene_Male_Character_name[147] = Cutscene_Male_Character_name_147[current_language]
        Cutscene_Male_Character_name[148] = Cutscene_Male_Character_name_148[current_language]
        Cutscene_Male_Character_name[149] = Cutscene_Male_Character_name_149[current_language]
        Cutscene_Male_Character_name[150] = Cutscene_Male_Character_name_150[current_language]
        Cutscene_Male_Character_name[151] = Cutscene_Male_Character_name_151[current_language]
        Cutscene_Male_Character_name[152] = Cutscene_Male_Character_name_152[current_language]
        Cutscene_Male_Character_name[153] = Cutscene_Male_Character_name_153[current_language]
        Cutscene_Male_Character_name[154] = Cutscene_Male_Character_name_154[current_language]
        Cutscene_Male_Character_name[155] = Cutscene_Male_Character_name_155[current_language]
        Cutscene_Male_Character_name[156] = Cutscene_Male_Character_name_156[current_language]
        Cutscene_Male_Character_name[157] = Cutscene_Male_Character_name_157[current_language]
        Cutscene_Male_Character_name[158] = Cutscene_Male_Character_name_158[current_language]
        Cutscene_Male_Character_name[159] = Cutscene_Male_Character_name_159[current_language]
        Cutscene_Male_Character_name[160] = Cutscene_Male_Character_name_160[current_language]
        Cutscene_Male_Character_name[161] = Cutscene_Male_Character_name_161[current_language]
        Cutscene_Male_Character_name[162] = Cutscene_Male_Character_name_162[current_language]
        Cutscene_Male_Character_name[163] = Cutscene_Male_Character_name_163[current_language]

    local Cutscene_Male_Character_hash ={}
		Cutscene_Male_Character_hash[01 ] = "csb_mp_agent14"
        Cutscene_Male_Character_hash[02 ] = "csb_agent"
        Cutscene_Male_Character_hash[03 ] = "csb_alan"
        Cutscene_Male_Character_hash[04 ] = "csb_ary"
        Cutscene_Male_Character_hash[05 ] = "csb_ary_02"
        Cutscene_Male_Character_hash[06 ] = "csb_avery"
        Cutscene_Male_Character_hash[07 ] = "csb_avon"
        Cutscene_Male_Character_hash[08 ] = "cs_andreas"
        Cutscene_Male_Character_hash[09 ] = "csb_anton"
        Cutscene_Male_Character_hash[10 ] = "csb_money"
        Cutscene_Male_Character_hash[11 ] = "csb_avischwartzman_02"
		Cutscene_Male_Character_hash[12 ] = "csb_ballas_leader"
        Cutscene_Male_Character_hash[13 ] = "csb_ballasog"
        Cutscene_Male_Character_hash[14 ] = "cs_bankman"
        Cutscene_Male_Character_hash[15 ] = "cs_barry"
        Cutscene_Male_Character_hash[16 ] = "cs_beverly"
        Cutscene_Male_Character_hash[17 ] = "csb_billionaire"
        Cutscene_Male_Character_hash[18 ] = "cs_bradcadaver"
        Cutscene_Male_Character_hash[19 ] = "cs_brad"
        Cutscene_Male_Character_hash[20 ] = "csb_burgerdrug"
        Cutscene_Male_Character_hash[21 ] = "csb_bogdan"
        Cutscene_Male_Character_hash[22 ] = "csb_brucie2"
		Cutscene_Male_Character_hash[23 ] = "csb_car3guy1"
        Cutscene_Male_Character_hash[24 ] = "csb_car3guy2"
        Cutscene_Male_Character_hash[25 ] = "cs_carbuyer"
        Cutscene_Male_Character_hash[26 ] = "cs_casey"
        Cutscene_Male_Character_hash[27 ] = "csb_celeb_01"
        Cutscene_Male_Character_hash[28 ] = "csb_chef"
        Cutscene_Male_Character_hash[29 ] = "csb_chef2"
        Cutscene_Male_Character_hash[30 ] = "csb_chin_goon"
        Cutscene_Male_Character_hash[31 ] = "cs_clay"
        Cutscene_Male_Character_hash[32 ] = "csb_cletus"
        Cutscene_Male_Character_hash[33 ] = "a_m_y_gencaspat_01"
		Cutscene_Male_Character_hash[34 ] = "a_m_y_gencaspat_02"
        Cutscene_Male_Character_hash[35 ] = "a_m_y_gencaspat_03"
        Cutscene_Male_Character_hash[36 ] = "a_m_y_gencaspat_04"
        Cutscene_Male_Character_hash[37 ] = "cs_chrisformage"
        Cutscene_Male_Character_hash[38 ] = "csb_customer"
        Cutscene_Male_Character_hash[39 ] = "csb_cop"
        Cutscene_Male_Character_hash[40 ] = "cs_dale"
        Cutscene_Male_Character_hash[41 ] = "cs_davenorton"
        Cutscene_Male_Character_hash[42 ] = "cs_devin"
        Cutscene_Male_Character_hash[43 ] = "csb_dix"
		Cutscene_Male_Character_hash[44 ] = "csb_djblamadon"
        Cutscene_Male_Character_hash[45 ] = "csb_isldj_00"
        Cutscene_Male_Character_hash[46 ] = "csb_isldj_01"
        Cutscene_Male_Character_hash[47 ] = "csb_isldj_02"
        Cutscene_Male_Character_hash[48 ] = "csb_isldj_03"
        Cutscene_Male_Character_hash[49 ] = "csb_isldj_04"
        Cutscene_Male_Character_hash[50 ] = "cs_dom"
        Cutscene_Male_Character_hash[51 ] = "cs_dreyfuss"
        Cutscene_Male_Character_hash[52 ] = "cs_drfriedlander"
        Cutscene_Male_Character_hash[53 ] = "csb_drugdealer"
		Cutscene_Male_Character_hash[54 ] = "csb_englishdave"
        Cutscene_Male_Character_hash[55 ] = "csb_englishdave_02"
        Cutscene_Male_Character_hash[56 ] = "cs_fabien"
        Cutscene_Male_Character_hash[57 ] = "cs_fbisuit_01"
        Cutscene_Male_Character_hash[58 ] = "cs_floyd"
        Cutscene_Male_Character_hash[59 ] = "csb_fos_rep"
        Cutscene_Male_Character_hash[60 ] = "csb_g"
        Cutscene_Male_Character_hash[61 ] = "csb_golfer_a"
        Cutscene_Male_Character_hash[62 ] = "csb_golfer_b"
        Cutscene_Male_Character_hash[63 ] = "csb_gustavo"
        Cutscene_Male_Character_hash[64 ] = "csb_groom"
		Cutscene_Male_Character_hash[65 ] = "csb_grove_str_dlr"
        Cutscene_Male_Character_hash[66 ] = "csb_hao"
        Cutscene_Male_Character_hash[67 ] = "csb_hao_02"
        Cutscene_Male_Character_hash[68 ] = "csb_huang"
        Cutscene_Male_Character_hash[69 ] = "csb_hugh"
        Cutscene_Male_Character_hash[70 ] = "cs_hunter"
        Cutscene_Male_Character_hash[71 ] = "csb_imran"
        Cutscene_Male_Character_hash[72 ] = "csb_jackhowitzer"
        Cutscene_Male_Character_hash[73 ] = "csb_janitor"
        Cutscene_Male_Character_hash[74 ] = "cs_jimmyboston"
        Cutscene_Male_Character_hash[75 ] = "cs_jimmydisanto"
		Cutscene_Male_Character_hash[76 ] = "cs_jimmydisanto2"
        Cutscene_Male_Character_hash[77 ] = "csb_jio_02"
        Cutscene_Male_Character_hash[78 ] = "cs_joeminuteman"
        Cutscene_Male_Character_hash[79 ] = "cs_johnnyklebitz"
        Cutscene_Male_Character_hash[80 ] = "csb_johnny_guns"
        Cutscene_Male_Character_hash[81 ] = "cs_josef"
        Cutscene_Male_Character_hash[82 ] = "cs_josh"
        Cutscene_Male_Character_hash[83 ] = "csb_juanstrickler"
        Cutscene_Male_Character_hash[84 ] = "cs_lamardavis"
        Cutscene_Male_Character_hash[85 ] = "cs_lamardavis_02"
		Cutscene_Male_Character_hash[86 ] = "cs_lazlow"
        Cutscene_Male_Character_hash[87 ] = "cs_lazlow_2"
        Cutscene_Male_Character_hash[88 ] = "cs_lestercrest"
        Cutscene_Male_Character_hash[89 ] = "cs_lestercrest_2"
        Cutscene_Male_Character_hash[90 ] = "cs_lestercrest_3"
        Cutscene_Male_Character_hash[91 ] = "cs_lifeinvad_01"
        Cutscene_Male_Character_hash[92 ] = "cs_magenta"
        Cutscene_Male_Character_hash[93 ] = "csb_ramp_marine"
        Cutscene_Male_Character_hash[94 ] = "csb_mweather"
        Cutscene_Male_Character_hash[95 ] = "cs_manuel"
		Cutscene_Male_Character_hash[96 ] = "csb_martinmadrazo"
        Cutscene_Male_Character_hash[97 ] = "csb_miguelmadrazo"
        Cutscene_Male_Character_hash[98 ] = "cs_milton"
        Cutscene_Male_Character_hash[99 ] = "csb_mjo"
        Cutscene_Male_Character_hash[100] = "csb_mjo_02"
        Cutscene_Male_Character_hash[101] = "csb_moodyman_02"
        Cutscene_Male_Character_hash[102] = "cs_movpremmale"
        Cutscene_Male_Character_hash[103] = "cs_mrk"
        Cutscene_Male_Character_hash[104] = "csb_musician_00"
        Cutscene_Male_Character_hash[105] = "cs_nervousron"
		Cutscene_Male_Character_hash[106] = "cs_nigel"
        Cutscene_Male_Character_hash[107] = "cs_old_man1a"
        Cutscene_Male_Character_hash[108] = "cs_old_man2"
        Cutscene_Male_Character_hash[109] = "cs_omega"
        Cutscene_Male_Character_hash[110] = "cs_orleans"
        Cutscene_Male_Character_hash[111] = "csb_ortega"
        Cutscene_Male_Character_hash[112] = "csb_oscar"
        Cutscene_Male_Character_hash[113] = "cs_paper"
        Cutscene_Male_Character_hash[114] = "csb_party_promo"
        Cutscene_Male_Character_hash[115] = "csb_helmsmanpavel"
        Cutscene_Male_Character_hash[116] = "csb_popov"
		Cutscene_Male_Character_hash[117] = "csb_porndudes"
        Cutscene_Male_Character_hash[118] = "cs_priest"
        Cutscene_Male_Character_hash[119] = "csb_prologuedriver"
        Cutscene_Male_Character_hash[120] = "csb_prolsec"
        Cutscene_Male_Character_hash[121] = "cs_prolsec_02"
        Cutscene_Male_Character_hash[122] = "csb_ramp_gang"
        Cutscene_Male_Character_hash[123] = "csb_ramp_hic"
        Cutscene_Male_Character_hash[124] = "csb_ramp_hipster"
        Cutscene_Male_Character_hash[125] = "csb_ramp_mex"
        Cutscene_Male_Character_hash[126] = "csb_rashcosvki"
		Cutscene_Male_Character_hash[127] = "csb_req_officer"
        Cutscene_Male_Character_hash[128] = "csb_roccopelosi"
        Cutscene_Male_Character_hash[129] = "cs_russiandrunk"
        Cutscene_Male_Character_hash[130] = "csb_security_a"
        Cutscene_Male_Character_hash[131] = "csb_screen_writer"
        Cutscene_Male_Character_hash[132] = "cs_siemonyetarian"
        Cutscene_Male_Character_hash[133] = "csb_sol"
        Cutscene_Male_Character_hash[134] = "cs_solomon"
        Cutscene_Male_Character_hash[135] = "csb_soundeng_00"
        Cutscene_Male_Character_hash[136] = "csb_sss"
		Cutscene_Male_Character_hash[137] = "cs_stevehains"
        Cutscene_Male_Character_hash[138] = "cs_stretch"
        Cutscene_Male_Character_hash[139] = "cs_taocheng"
        Cutscene_Male_Character_hash[140] = "csb_talcc"
        Cutscene_Male_Character_hash[141] = "csb_talmm"
        Cutscene_Male_Character_hash[142] = "csb_thornton"
        Cutscene_Male_Character_hash[143] = "cs_taocheng2"
        Cutscene_Male_Character_hash[144] = "cs_taostranslator"
        Cutscene_Male_Character_hash[145] = "cs_taostranslator2"
        Cutscene_Male_Character_hash[146] = "cs_tenniscoach"
		Cutscene_Male_Character_hash[147] = "cs_terry"
        Cutscene_Male_Character_hash[148] = "cs_tom"
        Cutscene_Male_Character_hash[149] = "csb_tomcasino"
        Cutscene_Male_Character_hash[150] = "cs_tomepsilon"
        Cutscene_Male_Character_hash[151] = "csb_tonyprince"
        Cutscene_Male_Character_hash[152] = "csb_reporter"
        Cutscene_Male_Character_hash[153] = "csb_trafficwarden"
        Cutscene_Male_Character_hash[154] = "csb_undercover"
        Cutscene_Male_Character_hash[155] = "csb_vagos_leader"
        Cutscene_Male_Character_hash[156] = "csb_vagspeak"
		Cutscene_Male_Character_hash[157] = "csb_vernon"
        Cutscene_Male_Character_hash[158] = "csb_vincent"
        Cutscene_Male_Character_hash[159] = "csb_vincent_2"
        Cutscene_Male_Character_hash[160] = "cs_wade"
        Cutscene_Male_Character_hash[161] = "cs_chengsr"
        Cutscene_Male_Character_hash[162] = "cs_zimbor"
        Cutscene_Male_Character_hash[163] = "csb_jio"
--- ✓ Gang Female Character
    local Gang_Female_Character_name = {}
        Gang_Female_Character_name_01 = {"Ballas","Ballas"}
        Gang_Female_Character_name_02 = {"Down Town 01","Centre Ville 01"}
        Gang_Female_Character_name_03 = {"Down Town 02","Centre Ville 02"}
        Gang_Female_Character_name_04 = {"Families","Famille"}
        Gang_Female_Character_name_05 = {"Lost","Lost"}
        Gang_Female_Character_name_06 = {"Vagos","Vagos"}
        Gang_Female_Character_name[01] = Gang_Female_Character_name_01[current_language]
        Gang_Female_Character_name[02] = Gang_Female_Character_name_02[current_language]
        Gang_Female_Character_name[03] = Gang_Female_Character_name_03[current_language]
        Gang_Female_Character_name[04] = Gang_Female_Character_name_04[current_language]
        Gang_Female_Character_name[05] = Gang_Female_Character_name_05[current_language]
        Gang_Female_Character_name[06] = Gang_Female_Character_name_06[current_language]

    local Gang_Female_Character_hash = {}
        Gang_Female_Character_hash[01] = "g_f_y_ballas_01"
        Gang_Female_Character_hash[02] = "a_f_m_downtown_01"
        Gang_Female_Character_hash[03] = "a_m_y_downtown_01"
        Gang_Female_Character_hash[04] = "g_f_y_families_01"
        Gang_Female_Character_hash[05] = "g_f_y_lost_01"
        Gang_Female_Character_hash[06] = "g_f_y_vagos_01"
--- ✓ Gang Male Character
    local Gang_Male_Character_name = {}
        Gang_Male_Character_name_01 = {"Arm Boss","Boss des Arms"}
        Gang_Male_Character_name_02 = {"Arm Goon 01","Crétins Arms 01"}
        Gang_Male_Character_name_03 = {"Arm Goon 02","Crétins Arms 02"}
        Gang_Male_Character_name_04 = {"Arm Lieutnant","Lieutnant Arm"}
        Gang_Male_Character_name_05 = {"Armoured 01","Armée 01"}
        Gang_Male_Character_name_06 = {"Armoured 02","Armée 02"}
        Gang_Male_Character_name_07 = {"Armoured 03","Armée 03"}
        Gang_Male_Character_name_08 = {"Army Mech","Mech de L'armée"}
        Gang_Male_Character_name_09 = {"Ballas East","Ballas Est"}
		Gang_Male_Character_name_10 = {"Ballas Leader","Leader des Ballas"}
        Gang_Male_Character_name_11 = {"Ballas Origin","Ballas d'origine"}
        Gang_Male_Character_name_12 = {"Ballas OG","OG Ballas"}
        Gang_Male_Character_name_13 = {"Ballas Sout","Espion Ballas"}
        Gang_Male_Character_name_14 = {"Cartel guards 01","Guarde du cartel 01"}
        Gang_Male_Character_name_15 = {"Cartel guards 02","Guarde du cartel 02"}
        Gang_Male_Character_name_16 = {"Chinese Boss","Boss Chinois"}
        Gang_Male_Character_name_17 = {"Chinese Cold","Chinois Froid"}
        Gang_Male_Character_name_18 = {"Chinese Goon 01","Créetins Chinois 01"}
        Gang_Male_Character_name_19 = {"Chinese Goon 02","Créetins Chinois 02"}
        Gang_Male_Character_name_20 = {"Goons","Crétins"}
		Gang_Male_Character_name_21 = {"Hunter","Chasseur"}
        Gang_Male_Character_name_22 = {"Korean 01","Koréen 01"}
        Gang_Male_Character_name_23 = {"Korean 02","Koréen 02"}
        Gang_Male_Character_name_24 = {"Korean Lieutnant","Lieutnant Koréen"}
        Gang_Male_Character_name_25 = {"Korean Boss","Boss Koréens"}
        Gang_Male_Character_name_26 = {"Lost 01","Lost 01"}
        Gang_Male_Character_name_27 = {"Lost 02","Lost 02"}
        Gang_Male_Character_name_28 = {"Lost 03","Lost 03"}
        Gang_Male_Character_name_29 = {"Meth Head","Addicte de Meth"}
        Gang_Male_Character_name_30 = {"Mex Boss 01","Boss des Mex 01"}
        Gang_Male_Character_name_31 = {"Mex Boss 02","Boss des Mex 02"}
        Gang_Male_Character_name_32 = {"Mex Centry","Mex Centry"}
		Gang_Male_Character_name_33 = {"Mex Gangster","Gangster des Mex"}
        Gang_Male_Character_name_34 = {"Mex Goon 01","Crétins des Mex"}
        Gang_Male_Character_name_35 = {"Mex Goon 02","Crétins des Mex"}
        Gang_Male_Character_name_36 = {"Mex Goon 03","Crétins des Mex"}
        Gang_Male_Character_name_37 = {"Mex Labor","Main d'oeuvre des Mex"}
        Gang_Male_Character_name_38 = {"Mex Thug","Thug des Mex"}
        Gang_Male_Character_name_39 = {"Military Bum","Clochard Militaire"}
        Gang_Male_Character_name_40 = {"Motox 01","Motox 01"}
        Gang_Male_Character_name_41 = {"Motox 02","Motox 02"}
        Gang_Male_Character_name_42 = {"OG Boss","OG Boss"}
        Gang_Male_Character_name_43 = {"Old Man 01","Vieux Monsieur 01"}
		Gang_Male_Character_name_44 = {"Old Man 02","Vieux Monsieur 02"}
        Gang_Male_Character_name_45 = {"Omega","Omega"}
        Gang_Male_Character_name_46 = {"Oneil","Oneil"}
        Gang_Male_Character_name_47 = {"Polo Goon 01","Crétins des Polo 01"}
        Gang_Male_Character_name_48 = {"Polo Goon 02","Crétins des Polo 02"}
        Gang_Male_Character_name_49 = {"Prisoners","Prisonier"}
        Gang_Male_Character_name_50 = {"Rival Paparazzi","paparazzi"}
        Gang_Male_Character_name_51 = {"Road Cyclist","Cycliste"}
        Gang_Male_Character_name_52 = {"Robber","Voleur"}
        Gang_Male_Character_name_53 = {"Rocco Pelosi","Rocco Pelosi"}
        Gang_Male_Character_name_54 = {"Salva Boss","Boss des Salva"}
        Gang_Male_Character_name_55 = {"Salva Goon 01","Crétins des Salva 01"}
		Gang_Male_Character_name_56 = {"Salva Goon 02","Crétins des Salva 02"}
        Gang_Male_Character_name_57 = {"Salva Goon 03","Crétins des Salva 03"}
        Gang_Male_Character_name_58 = {"Salva Bike","Biker des Salva"}
        Gang_Male_Character_name_59 = {"Slasher","Slasher"}
        Gang_Male_Character_name_60 = {"Vagos Leader","Leaders des Vagos"}
        Gang_Male_Character_name_61 = {"Vagos Fun","Vagos Marrant"}
        Gang_Male_Character_name_62 = {"Vagos Speak","Orateur des Vagos"}
        Gang_Male_Character_name_63 = {"Vin Douche","Vin Douche"}
        Gang_Male_Character_name[01] = Gang_Male_Character_name_01[current_language]
        Gang_Male_Character_name[02] = Gang_Male_Character_name_02[current_language]
        Gang_Male_Character_name[03] = Gang_Male_Character_name_03[current_language]
        Gang_Male_Character_name[04] = Gang_Male_Character_name_04[current_language]
        Gang_Male_Character_name[05] = Gang_Male_Character_name_05[current_language]
        Gang_Male_Character_name[06] = Gang_Male_Character_name_06[current_language]
        Gang_Male_Character_name[07] = Gang_Male_Character_name_07[current_language]
        Gang_Male_Character_name[08] = Gang_Male_Character_name_08[current_language]
        Gang_Male_Character_name[09] = Gang_Male_Character_name_09[current_language]
        Gang_Male_Character_name[10] = Gang_Male_Character_name_10[current_language]
        Gang_Male_Character_name[11] = Gang_Male_Character_name_11[current_language]
        Gang_Male_Character_name[12] = Gang_Male_Character_name_12[current_language]
        Gang_Male_Character_name[13] = Gang_Male_Character_name_13[current_language]
        Gang_Male_Character_name[14] = Gang_Male_Character_name_14[current_language]
        Gang_Male_Character_name[15] = Gang_Male_Character_name_15[current_language]
        Gang_Male_Character_name[16] = Gang_Male_Character_name_16[current_language]
        Gang_Male_Character_name[17] = Gang_Male_Character_name_17[current_language]
        Gang_Male_Character_name[18] = Gang_Male_Character_name_18[current_language]
        Gang_Male_Character_name[19] = Gang_Male_Character_name_19[current_language]
        Gang_Male_Character_name[20] = Gang_Male_Character_name_20[current_language]
        Gang_Male_Character_name[21] = Gang_Male_Character_name_21[current_language]
        Gang_Male_Character_name[22] = Gang_Male_Character_name_22[current_language]
        Gang_Male_Character_name[23] = Gang_Male_Character_name_23[current_language]
        Gang_Male_Character_name[24] = Gang_Male_Character_name_24[current_language]
        Gang_Male_Character_name[25] = Gang_Male_Character_name_25[current_language]
        Gang_Male_Character_name[26] = Gang_Male_Character_name_26[current_language]
        Gang_Male_Character_name[27] = Gang_Male_Character_name_27[current_language]
        Gang_Male_Character_name[28] = Gang_Male_Character_name_28[current_language]
        Gang_Male_Character_name[29] = Gang_Male_Character_name_29[current_language]
        Gang_Male_Character_name[30] = Gang_Male_Character_name_30[current_language]
        Gang_Male_Character_name[31] = Gang_Male_Character_name_31[current_language]
        Gang_Male_Character_name[32] = Gang_Male_Character_name_32[current_language]
        Gang_Male_Character_name[33] = Gang_Male_Character_name_33[current_language]
        Gang_Male_Character_name[34] = Gang_Male_Character_name_34[current_language]
        Gang_Male_Character_name[35] = Gang_Male_Character_name_35[current_language]
        Gang_Male_Character_name[36] = Gang_Male_Character_name_36[current_language]
        Gang_Male_Character_name[37] = Gang_Male_Character_name_37[current_language]
        Gang_Male_Character_name[38] = Gang_Male_Character_name_38[current_language]
        Gang_Male_Character_name[39] = Gang_Male_Character_name_39[current_language]
        Gang_Male_Character_name[40] = Gang_Male_Character_name_40[current_language]
        Gang_Male_Character_name[41] = Gang_Male_Character_name_41[current_language]
        Gang_Male_Character_name[42] = Gang_Male_Character_name_42[current_language]
        Gang_Male_Character_name[43] = Gang_Male_Character_name_43[current_language]
        Gang_Male_Character_name[44] = Gang_Male_Character_name_44[current_language]
        Gang_Male_Character_name[45] = Gang_Male_Character_name_45[current_language]
        Gang_Male_Character_name[46] = Gang_Male_Character_name_46[current_language]
        Gang_Male_Character_name[47] = Gang_Male_Character_name_47[current_language]
        Gang_Male_Character_name[48] = Gang_Male_Character_name_48[current_language]
        Gang_Male_Character_name[49] = Gang_Male_Character_name_49[current_language]
        Gang_Male_Character_name[50] = Gang_Male_Character_name_50[current_language]
        Gang_Male_Character_name[51] = Gang_Male_Character_name_51[current_language]
        Gang_Male_Character_name[52] = Gang_Male_Character_name_52[current_language]
        Gang_Male_Character_name[53] = Gang_Male_Character_name_53[current_language]
        Gang_Male_Character_name[54] = Gang_Male_Character_name_54[current_language]
        Gang_Male_Character_name[55] = Gang_Male_Character_name_55[current_language]
        Gang_Male_Character_name[56] = Gang_Male_Character_name_56[current_language]
        Gang_Male_Character_name[57] = Gang_Male_Character_name_57[current_language]
        Gang_Male_Character_name[58] = Gang_Male_Character_name_58[current_language]
        Gang_Male_Character_name[59] = Gang_Male_Character_name_59[current_language]
        Gang_Male_Character_name[60] = Gang_Male_Character_name_60[current_language]
        Gang_Male_Character_name[61] = Gang_Male_Character_name_61[current_language]
        Gang_Male_Character_name[62] = Gang_Male_Character_name_62[current_language]
        Gang_Male_Character_name[63] = Gang_Male_Character_name_63[current_language]
        
    local Gang_Male_Character_hash = {}
        Gang_Male_Character_hash[01] = "g_m_m_armboss_01"
        Gang_Male_Character_hash[02] = "g_m_m_armgoon_01"
        Gang_Male_Character_hash[03] = "g_m_y_armgoon_02"
        Gang_Male_Character_hash[04] = "g_m_m_armlieut_01"
        Gang_Male_Character_hash[05] = "mp_s_m_armoured_01"
        Gang_Male_Character_hash[06] = "s_m_m_armoured_01"
        Gang_Male_Character_hash[07] = "s_m_m_armoured_02"
        Gang_Male_Character_hash[08] = "s_m_y_armymech_01"
        Gang_Male_Character_hash[09] = "g_m_y_ballaeast_01"
        Gang_Male_Character_hash[10] = "ig_ballas_leader"
        Gang_Male_Character_hash[11] = "g_m_y_ballaorig_01"
        Gang_Male_Character_hash[12] = "ig_ballasog"
        Gang_Male_Character_hash[13] = "g_m_y_ballasout_01"
        Gang_Male_Character_hash[14] = "g_m_m_cartelguards_01"
        Gang_Male_Character_hash[15] = "g_m_m_cartelguards_02"
        Gang_Male_Character_hash[16] = "g_m_m_chiboss_01"
        Gang_Male_Character_hash[17] = "g_m_m_chicold_01"
        Gang_Male_Character_hash[18] = "g_m_m_chigoon_01"
        Gang_Male_Character_hash[19] = "g_m_m_chigoon_02"
        Gang_Male_Character_hash[20] = "g_m_m_goons_01"
        Gang_Male_Character_hash[21] = "ig_hunter"
        Gang_Male_Character_hash[22] = "g_m_y_korean_01"
        Gang_Male_Character_hash[23] = "g_m_y_korean_02"
        Gang_Male_Character_hash[24] = "g_m_y_korlieut_01"
        Gang_Male_Character_hash[25] = "g_m_m_korboss_01"
        Gang_Male_Character_hash[26] = "g_m_y_lost_01"
        Gang_Male_Character_hash[27] = "g_m_y_lost_02"
        Gang_Male_Character_hash[28] = "g_m_y_lost_03"
        Gang_Male_Character_hash[29] = "a_m_y_methhead_01"
        Gang_Male_Character_hash[30] = "g_m_m_mexboss_01"
        Gang_Male_Character_hash[31] = "g_m_m_mexboss_02"
        Gang_Male_Character_hash[32] = "a_m_m_mexcntry_01"
        Gang_Male_Character_hash[33] = "g_m_y_mexgang_01"
        Gang_Male_Character_hash[34] = "g_m_y_mexgoon_01"
        Gang_Male_Character_hash[35] = "g_m_y_mexgoon_02"
        Gang_Male_Character_hash[36] = "g_m_y_mexgoon_03"
        Gang_Male_Character_hash[37] = "a_m_m_mexlabor_01"
        Gang_Male_Character_hash[38] = "a_m_y_mexthug_01"
        Gang_Male_Character_hash[39] = "u_m_y_militarybum"
        Gang_Male_Character_hash[40] = "a_m_y_motox_01"
        Gang_Male_Character_hash[41] = "a_m_y_motox_02"
        Gang_Male_Character_hash[42] = "a_m_m_og_boss_01"
        Gang_Male_Character_hash[43] = "ig_old_man1a"
        Gang_Male_Character_hash[44] = "ig_old_man2"
        Gang_Male_Character_hash[45] = "ig_omega"
        Gang_Male_Character_hash[46] = "ig_oneil"
        Gang_Male_Character_hash[47] = "g_m_y_pologoon_01"
        Gang_Male_Character_hash[48] = "g_m_y_pologoon_02"
        Gang_Male_Character_hash[49] = "g_m_m_prisoners_01"
        Gang_Male_Character_hash[50] = "u_m_y_paparazzi"
        Gang_Male_Character_hash[51] = "a_m_y_roadcyc_01"
        Gang_Male_Character_hash[52] = "s_m_y_robber_01"
        Gang_Male_Character_hash[53] = "ig_roccopelosi"
        Gang_Male_Character_hash[54] = "g_m_y_salvaboss_01"
        Gang_Male_Character_hash[55] = "g_m_y_salvagoon_01"
        Gang_Male_Character_hash[56] = "g_m_y_salvagoon_02"
        Gang_Male_Character_hash[57] = "g_m_y_salvagoon_03"
        Gang_Male_Character_hash[58] = "u_m_y_sbike"
        Gang_Male_Character_hash[59] = "g_m_m_slasher_01"
        Gang_Male_Character_hash[60] = "ig_vagos_leader"
        Gang_Male_Character_hash[61] = "mp_m_g_vagfun_01"
        Gang_Male_Character_hash[62] = "ig_vagspeak"
        Gang_Male_Character_hash[63] = "a_m_y_vindouche_01"
--- ✓ Law inforcer
    local Law_Enforcer_name = {}
        Law_Enforcer_name_01 = {"Female Sheriff","Sherif Femme"}
        Law_Enforcer_name_02 = {"Male Sheriff","Sherif Homme"}
        Law_Enforcer_name_03 = {"BlackOps 01","BlackOps 01"}
        Law_Enforcer_name_04 = {"BlackOps 02","BlackOps 02"}
        Law_Enforcer_name_05 = {"BlackOps 03","BlackOps 03"}
        Law_Enforcer_name_06 = {"Casey","Casey"}
        Law_Enforcer_name_07 = {"CIA Sececurity","Sécurité (IAA)"}
        Law_Enforcer_name_08 = {"Male Cop","Policier Homme"}
        Law_Enforcer_name_09 = {"Female Cop","Policier Femme"}
        Law_Enforcer_name_10 = {"Cop (Cutscene)","Policier (Cinématique)"}
        Law_Enforcer_name_11 = {"FBI Suit","FIB"}
        Law_Enforcer_name_12 = {"Female Agent","Aent Femme"}
        Law_Enforcer_name_13 = {"FIB Architect","Architecte (FIB)"}
        Law_Enforcer_name_14 = {"FIB Mugger","Gangster (FIB)"}
        Law_Enforcer_name_15 = {"FIB Office 01","Fonctionnaire (FIB) 01"}
        Law_Enforcer_name_16 = {"FIB Office 02","Fonctionnaire (FIB) 02"}
        Law_Enforcer_name_17 = {"FIB Security 01","Securité (FIB)"}
        Law_Enforcer_name_18 = {"FIB Security 02","Securité (FIB)"}
        Law_Enforcer_name_19 = {"High Security 01","Haute Sécurité 01"}
        Law_Enforcer_name_20 = {"High Security 02","Haute Sécurité 02"}
        Law_Enforcer_name_21 = {"High Security 03","Haute Sécurité 03"}
        Law_Enforcer_name_22 = {"High Security 04","Haute Sécurité 04"}
        Law_Enforcer_name_23 = {"High Security 05","Haute Sécurité 05"}
        Law_Enforcer_name_24 = {"Highway Cop","Policier (Autoroute)"}
        Law_Enforcer_name_25 = {"Marine 01","Marine 01"}
        Law_Enforcer_name_26 = {"Marine 01","Marine 02"}
        Law_Enforcer_name_27 = {"Marine 02","Marine 03"}
        Law_Enforcer_name_28 = {"Marine 02","Marine 04"}
        Law_Enforcer_name_29 = {"Marine 03","Marine 05"}
        Law_Enforcer_name_30 = {"MerryWeather (Cutscene)","MerryWeather (Cinématique)"}
        Law_Enforcer_name_31 = {"Pros 01","Pro 01"}
        Law_Enforcer_name_32 = {"Prison Guard 01","Guardien de prison 01"}
        Law_Enforcer_name_33 = {"Female Ranger","Ranger Femme"}
        Law_Enforcer_name_34 = {"Male Ranger","Ranger Homme"}
        Law_Enforcer_name_35 = {"Req Officer","Officier (Req)"}
        Law_Enforcer_name_36 = {"Security 01","Sécurité 01"}
        Law_Enforcer_name_37 = {"Security 02","Sécurité 02"}
        Law_Enforcer_name_38 = {"Snow Cop","Policier (Neige)"}
        Law_Enforcer_name_39 = {"SWAT","BAC"}
        Law_Enforcer_name_40 = {"Undercover Cop (Cutscene)","Policier Sous Couverture"}
        Law_Enforcer_name_41 = {"Traffic Warden","Gerant de traffic"}
        Law_Enforcer_name_42 = {"Ex-Army","Ancient Militaire"}
        Law_Enforcer_name_43 = {"FIB Security","Sécurité (FIB)"}
        Law_Enforcer_name_44 = {"Armoured 01","Armure 01"}
        Law_Enforcer_name_45 = {"Armoured 02","Armure 02"}
        Law_Enforcer_name_46 = {"Armoured 03","Armure 03"}
        Law_Enforcer_name_47 = {"Army Mech","MEch de l'armée"}
        Law_Enforcer_name_48 = {"West Security 01","Sécurité De l'ouest"}
        Law_Enforcer_name_49 = {"West Security 02","Sécurité De l'ouest"}
        Law_Enforcer_name[01]      = Law_Enforcer_name_01[current_language]
        Law_Enforcer_name[02]      = Law_Enforcer_name_02[current_language]
        Law_Enforcer_name[03]      = Law_Enforcer_name_03[current_language]
        Law_Enforcer_name[04]      = Law_Enforcer_name_04[current_language]
        Law_Enforcer_name[05]      = Law_Enforcer_name_05[current_language]
        Law_Enforcer_name[06]      = Law_Enforcer_name_06[current_language]
        Law_Enforcer_name[07]      = Law_Enforcer_name_07[current_language]
        Law_Enforcer_name[08]      = Law_Enforcer_name_08[current_language]
        Law_Enforcer_name[09]      = Law_Enforcer_name_09[current_language]
        Law_Enforcer_name[10]      = Law_Enforcer_name_10[current_language]
        Law_Enforcer_name[11]      = Law_Enforcer_name_11[current_language]
        Law_Enforcer_name[12]      = Law_Enforcer_name_12[current_language]
        Law_Enforcer_name[13]      = Law_Enforcer_name_13[current_language]
        Law_Enforcer_name[14]      = Law_Enforcer_name_14[current_language]
        Law_Enforcer_name[15]      = Law_Enforcer_name_15[current_language]
        Law_Enforcer_name[16]      = Law_Enforcer_name_16[current_language]
        Law_Enforcer_name[17]      = Law_Enforcer_name_17[current_language]
        Law_Enforcer_name[18]      = Law_Enforcer_name_18[current_language]
        Law_Enforcer_name[19]      = Law_Enforcer_name_19[current_language]
        Law_Enforcer_name[20]      = Law_Enforcer_name_20[current_language]
        Law_Enforcer_name[21]      = Law_Enforcer_name_21[current_language]
        Law_Enforcer_name[22]      = Law_Enforcer_name_22[current_language]
        Law_Enforcer_name[23]      = Law_Enforcer_name_23[current_language]
        Law_Enforcer_name[24]      = Law_Enforcer_name_24[current_language]
        Law_Enforcer_name[25]      = Law_Enforcer_name_25[current_language]
        Law_Enforcer_name[26]      = Law_Enforcer_name_26[current_language]
        Law_Enforcer_name[27]      = Law_Enforcer_name_27[current_language]
        Law_Enforcer_name[28]      = Law_Enforcer_name_28[current_language]
        Law_Enforcer_name[29]      = Law_Enforcer_name_29[current_language]
        Law_Enforcer_name[30]      = Law_Enforcer_name_30[current_language]
        Law_Enforcer_name[31]      = Law_Enforcer_name_31[current_language]
        Law_Enforcer_name[32]      = Law_Enforcer_name_32[current_language]
        Law_Enforcer_name[33]      = Law_Enforcer_name_33[current_language]
        Law_Enforcer_name[34]      = Law_Enforcer_name_34[current_language]
        Law_Enforcer_name[35]      = Law_Enforcer_name_35[current_language]
        Law_Enforcer_name[36]      = Law_Enforcer_name_36[current_language]
        Law_Enforcer_name[37]      = Law_Enforcer_name_37[current_language]
        Law_Enforcer_name[38]      = Law_Enforcer_name_38[current_language]
        Law_Enforcer_name[39]      = Law_Enforcer_name_39[current_language]
        Law_Enforcer_name[40]      = Law_Enforcer_name_40[current_language]
        Law_Enforcer_name[41]      = Law_Enforcer_name_41[current_language]
        Law_Enforcer_name[42]      = Law_Enforcer_name_42[current_language]
        Law_Enforcer_name[43]      = Law_Enforcer_name_43[current_language]
        Law_Enforcer_name[44]      = Law_Enforcer_name_44[current_language]
        Law_Enforcer_name[45]      = Law_Enforcer_name_45[current_language]
        Law_Enforcer_name[46]      = Law_Enforcer_name_46[current_language]
        Law_Enforcer_name[47]      = Law_Enforcer_name_47[current_language]
        Law_Enforcer_name[48]      = Law_Enforcer_name_48[current_language]
        Law_Enforcer_name[49]      = Law_Enforcer_name_49[current_language]
    local Law_Enforcer_hash = {}
        Law_Enforcer_hash[01]      = "s_f_y_sheriff_01"
        Law_Enforcer_hash[02]      = "s_m_y_sheriff_01"
        Law_Enforcer_hash[03]      = "s_m_y_blackops_01"
        Law_Enforcer_hash[04]      = "s_m_y_blackops_02"
        Law_Enforcer_hash[05]      = "s_m_y_blackops_03"
        Law_Enforcer_hash[06]      = "ig_casey"
        Law_Enforcer_hash[07]      = "s_m_m_ciasec_01"
        Law_Enforcer_hash[08]      = "s_m_y_cop_01"
        Law_Enforcer_hash[09]      = "s_f_y_cop_01"
        Law_Enforcer_hash[10]      = "csb_cop"
        Law_Enforcer_hash[11]      = "ig_fbisuit_01"
        Law_Enforcer_hash[12]      = "a_f_y_femaleagent"
        Law_Enforcer_hash[13]      = "u_m_m_fibarchitect"
        Law_Enforcer_hash[14]      = "u_m_y_fibmugger_01"
        Law_Enforcer_hash[15]      = "s_m_m_fiboffice_01"
        Law_Enforcer_hash[16]      = "s_m_m_fiboffice_02"
        Law_Enforcer_hash[17]      = "mp_m_fibsec_01"
        Law_Enforcer_hash[18]      = "s_m_m_fibsec_01"
        Law_Enforcer_hash[19]      = "s_m_m_hiShapeshift_Hashec_01"
        Law_Enforcer_hash[20]      = "s_m_m_hiShapeshift_Hashec_02"
        Law_Enforcer_hash[21]      = "s_m_m_hiShapeshift_Hashec_03"
        Law_Enforcer_hash[22]      = "s_m_m_hiShapeshift_Hashec_04"
        Law_Enforcer_hash[23]      = "s_m_m_hiShapeshift_Hashec_05"
        Law_Enforcer_hash[24]      = "s_m_y_hwaycop_01"
        Law_Enforcer_hash[25]      = "s_m_m_marine_01"
        Law_Enforcer_hash[26]      = "s_m_y_marine_01"
        Law_Enforcer_hash[27]      = "s_m_m_marine_02"
        Law_Enforcer_hash[28]      = "s_m_y_marine_02"
        Law_Enforcer_hash[29]      = "s_m_y_marine_03"
        Law_Enforcer_hash[30]      = "csb_mweather"
        Law_Enforcer_hash[31]      = "mp_g_m_pros_01"
        Law_Enforcer_hash[32]      = "s_m_m_prisguard_01"
        Law_Enforcer_hash[33]      = "s_f_y_ranger_01"
        Law_Enforcer_hash[34]      = "s_m_y_ranger_01"
        Law_Enforcer_hash[35]      = "ig_req_officer"
        Law_Enforcer_hash[36]      = "ig_security_a"
        Law_Enforcer_hash[37]      = "s_m_m_security_01"
        Law_Enforcer_hash[38]      = "s_m_m_snowcop_01"
        Law_Enforcer_hash[39]      = "s_m_y_swat_01"
        Law_Enforcer_hash[40]      = "csb_undercover"
        Law_Enforcer_hash[41]      = "ig_trafficwarden"
        Law_Enforcer_hash[42]      = "mp_m_exarmy_01"
        Law_Enforcer_hash[44]      = "mp_s_m_armoured_01"
        Law_Enforcer_hash[45]      = "s_m_m_armoured_01"
        Law_Enforcer_hash[46]      = "s_m_m_armoured_02"
        Law_Enforcer_hash[47]      = "s_m_y_armymech_01"
        Law_Enforcer_hash[48]      = "s_m_y_westsec_01"
        Law_Enforcer_hash[49]      = "s_m_y_westsec_02"
--

local Shapeshift_Menu = menu.add_submenu("Shapeshift")

Shapeshift_Menu:add_array_item("Turn Back Into →"  , Multiplayer_name	            ,function() return Multipayer_Character_index	end, function(n) Multipayer_Character_index    =n set_model_hash(joaat(Multiplayer_hash[n]               )) localplayer:set_godmode(false) end)
Shapeshift_Menu:add_array_item("Animals →"		   , Animal_name	                ,function() return Animals_index                end, function(n) Animals_index                 =n set_model_hash(joaat(Animal_hash[n]                    )) localplayer:set_godmode(true)  end)
Shapeshift_Menu:add_array_item("Cosplay →"		   , Cosplay_name	                ,function() return Cosplay_index                end, function(n) Cosplay_index                 =n set_model_hash(joaat(Cosplay_hash[n]                   )) localplayer:set_godmode(true)  end)
Shapeshift_Menu:add_array_item("Birds →"		   , Birds_name	                    ,function() return Birds_index                  end, function(n) Birds_index                   =n set_model_hash(joaat(Birds_hash[n]                     ))								   end)
Shapeshift_Menu:add_array_item("Sea creature →"    , Sea_Animals_name	            ,function() return Sea_Animals_index            end, function(n) Sea_Animals_index	           =n set_model_hash(joaat(Sea_Animals_hash[n]               ))								   end)
Shapeshift_Menu:add_array_item("Story Female →"    , Story_Female_Character_name    ,function() return Story_Female_Character_index end, function(n) Story_Female_Character_index  =n set_model_hash(joaat(Story_Female_Character_hash[n]    ))								   end)
Shapeshift_Menu:add_array_item("Story Male →"	   , Story_Male_Character_name      ,function() return Story_Male_Character_index   end, function(n) Story_Male_Character_index    =n set_model_hash(joaat(Story_Male_Character_hash[n]      ))								   end)
Shapeshift_Menu:add_array_item("Female Ped →"	   , Female_Character_name          ,function() return Female_Character_index       end, function(n) Female_Character_index	       =n set_model_hash(joaat(Female_Character_hash[n]          ))								   end)
-- Shapeshift_Menu:add_array_item("Male Ped →"	       , Male_Character_name            ,function() return Male_Character_index         end, function(n) Male_Character_index	       =n set_model_hash(joaat(Male_Character_hash[n]            ))								   end)
Shapeshift_Menu:add_array_item("Cutscene Female →" , Cutscene_Female_Character_name ,function() return Female_Cutscene_index        end, function(n) Female_Cutscene_index	       =n set_model_hash(joaat(Cutscene_Female_Character_hash[n] ))								   end)
Shapeshift_Menu:add_array_item("Cutscene Male →"   , Cutscene_Male_Character_name   ,function() return Male_Cutscene_index          end, function(n) Male_Cutscene_index	       =n set_model_hash(joaat(Cutscene_Male_Character_hash[n]   ))								   end)
Shapeshift_Menu:add_array_item("Gang Female →"     , Gang_Female_Character_name     ,function() return Gang_Female_Character_index  end, function(n) Gang_Female_Character_index   =n set_model_hash(joaat(Gang_Female_Character_hash[n]     ))								   end)
Shapeshift_Menu:add_array_item("Gang Male →"       , Gang_Male_Character_name       ,function() return Gang_Male_Character_index    end, function(n) Gang_Male_Character_index	   =n set_model_hash(joaat(Gang_Male_Character_hash[n]       ))								   end)
Shapeshift_Menu:add_array_item("Law enforcers →"   , Law_Enforcer_name	            ,function() return Law_Inforcer_index           end, function(n) Law_Inforcer_index	           =n set_model_hash(joaat(Law_Enforcer_hash[n]              ))								   end)