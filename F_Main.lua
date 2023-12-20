require("scripts/A_language")
local Main_menu = menu.add_submenu(Menu_Submenu)
local Unlocks_menu = menu.add_submenu(Unlock_Tunable_Menu)
local Settings_menu = menu.add_submenu(Settings_Submenu)

-- Variable
local units_selection = settings.Numberplates.unit
local units_text_short = {"km/h", "m/s", "mi/h", "ft/s"}
local units_text_numberplate = {"kmh", "mps", "mph", "fps"}
local units_value = {3.6, 1, 2.2369362921, 3.280839895}
local numberplate_enabled = settings.Numberplates.enabled
local numberplate_custom_enabled = settings.Numberplates.custom.enabled
local Plate_Submenus = {}
local Character_Plate_List = {}
for i = 1,8 do
	Character_Plate_List[i] = "Plate"
end
local Menu_Keybindings = {}
	Menu_Keybindings[1] = config.Menu.KeyBindings.MenuToggle
	Menu_Keybindings[2] = config.Menu.KeyBindings.SelectKey
	Menu_Keybindings[3] = config.Menu.KeyBindings.BackKey
	Menu_Keybindings[4] = config.Menu.KeyBindings.UpKey
	Menu_Keybindings[5] = config.Menu.KeyBindings.DownKey
	Menu_Keybindings[6] = config.Menu.KeyBindings.RightKey
	Menu_Keybindings[7] = config.Menu.KeyBindings.LeftKey
local Plate_text = ""
local Vehicle_List_Adress = {}
local Disabled_veh = {}
local Removed_cars = settings.RemovedCars
local No_Scratch_Enabled = false
local up_hotkey
local down_hotkey
local forward_hotkey
local backward_hotkey
local turnleft_hotkey
local turnright_hotkey
local increasespeed_hotkey
local decreasespeed_hotkey
local Noclip_bind = {}
	Noclip_bind[1] = settings.Noclip.up
	Noclip_bind[2] = settings.Noclip.down
	Noclip_bind[3] = settings.Noclip.foward
	Noclip_bind[4] = settings.Noclip.backward
	Noclip_bind[5] = settings.Noclip.turnleft
	Noclip_bind[6] = settings.Noclip.turnright
	Noclip_bind[7] = settings.Noclip.increasespeed
	Noclip_bind[8] = settings.Noclip.decreasespeed
	Noclip_bind[9] = settings.Noclip.toggle
local default_ragdoll = localplayer:get_no_ragdoll()
local default_292     = localplayer:get_config_flag(292)
local enable = false
local speed = 2
local cars_data = {}
local multiplier_percent = 100
local boost_activate = true
local enable_transaction_error = false
local refill_key = settings.RefillKey
local rainbow,random,strobelight = true, false, false
local uniform = true
local mul  = 5
local affect_traffic = false
local colorStyle = 1
local Original_Color = {999,999,999,999,999,999}
local uniformtoggle = false
local is_dead = false
local color_custom
local Orignial_Plate = "________"
if not localplayer then myplayer = nil else myplayer = localplayer end
if not myplayer:is_in_vehicle() then vehicle = nil else vehicle = myplayer:get_current_vehicle() end
local Rainbow_Activated = false

-- Function
local function up()
	if not enable then return end
	local newpos = localplayer:get_position() + vector3(0,0,speed)

	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos)
	else
		vehicle=localplayer:get_current_vehicle()
		vehicle:set_position(newpos)
	end
end
local function down()
	if not enable then return end
	local newpos = localplayer:get_position() + vector3(0,0,speed * -1)

	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos)
	else
		vehicle=localplayer:get_current_vehicle()
		vehicle:set_position(newpos)
	end
end
local function forward()
	if not enable then return end
	local dir = localplayer:get_heading()
	local newpos = localplayer:get_position() + (dir * speed)

	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos)
	else
		vehicle=localplayer:get_current_vehicle()
		vehicle:set_position(newpos)
	end
end
local function backward()
	if not enable then return end
	local dir = localplayer:get_heading()
	local newpos = localplayer:get_position() + (dir * speed * -1)

	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos)
	else
		vehicle=localplayer:get_current_vehicle()
		vehicle:set_position(newpos)
	end
end
local function turnleft()
	if not enable then return end
	local dir = localplayer:get_rotation()

	if not localplayer:is_in_vehicle() then
		localplayer:set_rotation(dir + vector3(0.25,0,0))
	else
		vehicle=localplayer:get_current_vehicle()
		vehicle:set_rotation(dir + vector3(0.25,0,0))
	end
end
local function turnright()
	if not enable then return end
	local dir = localplayer:get_rotation()

	if not localplayer:is_in_vehicle() then
		localplayer:set_rotation(dir + vector3(0.25 * -1,0,0))
	else
		vehicle=localplayer:get_current_vehicle()
		vehicle:set_rotation(dir + vector3(0.25 * -1,0,0))
	end
end
local function increasespeed()
	if speed > 0 then 
		speed = speed + 1
	end
end
local function decreasespeed()
	if speed > 1 then 
		speed = speed - 1
	end
end
local function get_vehicle_speed(veh)
	if not veh then return 0 end
	local velocity = veh:get_velocity()
	return math.sqrt(velocity.x ^ 2 + velocity.y ^ 2 + velocity.z ^ 2)
end
local function Get_Disabled_vehs()
    local tested_list
    local tested_list_1
    local tested_list_2
    local tested_list_3
    local list_count = 1
    for i = 1, #Vehicle_List_Adress-1 do
        tested_list = Vehicle_List_Adress[i]
        tested_list_1 = tested_list[1]
        tested_list_2 = tested_list[2]
        tested_list_3 = tested_list[3]
        for j = 0, (tested_list_2 - tested_list_1)/tested_list_3 do
            if globals.get_bool(tested_list_1 + j*tested_list_3) == false then
                Disabled_veh[list_count] = tested_list_1 + j*tested_list_3
                list_count = list_count+1
            end
        end
    end
end
local function Switch_Veh_Unlock_State()
    for i = 1,#Disabled_veh do
        globals.set_bool(Disabled_veh[i], Removed_cars)
    end
end
Get_Disabled_vehs()
Switch_Veh_Unlock_State()
local function refillInventory()
	stats.set_int(mpx().."NO_BOUGHT_YUM_SNACKS", 30)
	stats.set_int(mpx().."NO_BOUGHT_HEALTH_SNACKS", 15)
	stats.set_int(mpx().."NO_BOUGHT_EPIC_SNACKS", 5)
	stats.set_int(mpx().."NUMBER_OF_ORANGE_BOUGHT", 10)
	stats.set_int(mpx().."NUMBER_OF_BOURGE_BOUGHT", 10)
	stats.set_int(mpx().."NUMBER_OF_CHAMP_BOUGHT", 5)
	stats.set_int(mpx().."CIGARETTES_BOUGHT", 20)
	for i = 1,5 do
		stats.set_int(mpx().."MP_CHAR_ARMOUR_".. i .."_COUNT", 10)
	end
	stats.set_int(mpx().."BREATHING_APPAR_BOUGHT", 20)
	if stats.get_int(mpx().."SR_INCREASE_THROW_CAP") then 
		if localplayer:get_weapon_by_hash(joaat("slot_stickybomb")) then localplayer:get_weapon_by_hash(joaat("slot_stickybomb")):set_current_ammo(30) end
		if localplayer:get_weapon_by_hash(joaat("slot_smokegrenade")) then localplayer:get_weapon_by_hash(joaat("slot_smokegrenade")):set_current_ammo(30) end
		if localplayer:get_weapon_by_hash(joaat("slot_grenade")) then localplayer:get_weapon_by_hash(joaat("slot_grenade")):set_current_ammo(30) end
		if localplayer:get_weapon_by_hash(joaat("slot_molotov")) then localplayer:get_weapon_by_hash(joaat("slot_molotov")):set_current_ammo(30) end
		if localplayer:get_weapon_by_hash(joaat("slot_proxmine")) then localplayer:get_weapon_by_hash(joaat("slot_proxmine")):set_current_ammo(10) end
		if localplayer:get_weapon_by_hash(joaat("slot_pipebomb")) then localplayer:get_weapon_by_hash(joaat("slot_pipebomb")):set_current_ammo(15) end
	end
end
local function NoClip(e)
	if not localplayer then return end
	if e then 
		localplayer:set_freeze_momentum(true) 
		localplayer:set_no_ragdoll(true)
		localplayer:set_config_flag(292,true)
		up_hotkey = menu.register_hotkey(Noclip_bind[1], up)
		down_hotkey = menu.register_hotkey(Noclip_bind[2], down)
		forward_hotkey = menu.register_hotkey(Noclip_bind[3], forward)
		backward_hotkey = menu.register_hotkey(Noclip_bind[4], backward)
		turnleft_hotkey = menu.register_hotkey(Noclip_bind[5], turnleft)
		turnright_hotkey = menu.register_hotkey(Noclip_bind[6], turnright)
		increasespeed_hotkey = menu.register_hotkey(Noclip_bind[7], increasespeed)
		decreasespeed_hotkey = menu.register_hotkey(Noclip_bind[8], decreasespeed)
	else
		localplayer:set_freeze_momentum(false)
		localplayer:set_no_ragdoll(default_ragdoll)
		localplayer:set_config_flag(292,default_292)
		menu.remove_hotkey(up_hotkey)
		menu.remove_hotkey(down_hotkey)
		menu.remove_hotkey(forward_hotkey)
		menu.remove_hotkey(backward_hotkey)
		menu.remove_hotkey(turnleft_hotkey)
		menu.remove_hotkey(turnright_hotkey)
		menu.remove_hotkey(increasespeed_hotkey)
		menu.remove_hotkey(decreasespeed_hotkey)
	end
end
local function Custom_Plates()
	Custom_Plates_Manager:clear()
	if settings.Numberplates.custom.platelist ~= nil then
		for i = 1,#settings.Numberplates.custom.platelist do
			if i == settings.Numberplates.custom.platedefault then
				plt = "*"
			else
				plt = "_"
			end
			Plate_Submenus[i] = Custom_Plates_Manager:add_submenu(settings.Numberplates.custom.platelist[i] .. plt)
			Text("_________________" .. settings.Numberplates.custom.platelist[i] .. plt .. "_______________",Plate_Submenus[i])
			-- Choose by default
			if plt == "_" then
				Plate_Submenus[i]:add_action(Numberplate_Custom_Choose,function() settings.Numberplates.custom.platedefault = i Save_settings() end)
			end
			-- Apply
			if localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
				veh = localplayer:get_current_vehicle()
				Plate_Submenus[i]:add_action(Numberplate_Custom_Apply,function() veh:set_number_plate_text(settings.Numberplates.custom.platelist[i]) end)
			end
			-- Delete
			Plate_Submenus[i]:add_action(Numberplate_Custom_Delete,
			function()
				if #settings.Numberplates.custom.platelist ~= 1 then
					for j = i,#settings.Numberplates.custom.platelist-1 do
						settings.Numberplates.custom.platelist[j] = settings.Numberplates.custom.platelist[j+1]
					end
				else
					settings.Numberplates.custom.platelist = {}
				end
				Save_settings()
			end)
		end
	end
end
function randomColor(color_red, color_green, color_blue)
	slp = 0.5
	if affect_traffic then slp = 0.03 end
	sleep(slp / mul)
	return math.random(0,255), math.random(0,255), math.random(0,255)
end 
function strobeLight(color_red, color_green, color_blue)
	local slp = 0.8
	if affect_traffic then slp = 0.02 end
	if color_red == 255 then
		color_red, color_green, color_blue = 0, 0, 0
	else
		color_red, color_green, color_blue = 255, 255, 255
	end
	if not uniform and uniformtoggle then
		uniformtoggle = not uniformtoggle
	else 
		sleep(slp / mul)
		uniformtoggle = true
	end
	return color_red, color_green, color_blue
end 
function nextRainbowColor(color_red, color_green, color_blue)
	if (color_red > 0 and color_blue == 0 and color_green == 0 and not (color_red >= 255)) then
		color_red = color_red + 1 * mul
	elseif (color_red > 0 and color_blue == 0) then
		color_red = color_red - 1 * mul
		color_green = color_green + 1 * mul
	elseif (color_green > 0 and color_red == 0) then
		color_green = color_green - 1 * mul
		color_blue = color_blue + 1 * mul
	elseif (color_blue > 0 and color_green == 0) then
		color_red = color_red + 1 * mul
		color_blue = color_blue - 1 * mul
	else
		color_red = color_red + 1 * mul
        color_green = color_green - 1 * mul
        color_blue = color_blue - 1 * mul
	end
	
    -- Clamp the color values to the range of 0-255
    color_red = math.max(0, math.min(255, color_red))
    color_green = math.max(0, math.min(255, color_green))
    color_blue = math.max(0, math.min(255, color_blue))
	
	return color_red, color_green, color_blue
end 
local function toggleColorFunction(colorFunc)
	local rainbow_list_thingy = {false,false,true,false,false}
	rainbow = rainbow_list_thingy[4-colorFunc]
	strobelight = rainbow_list_thingy[5-colorFunc]
	random = rainbow_list_thingy[6-colorFunc]
end
local function boostVehicle(vehicle_data, hash, vehicle, boost)
	if boost then --boost mode
		accel = vehicle_data[1] * (17 * (multiplier_percent / 100))
		brake_force = vehicle_data[2] * (23 * (multiplier_percent / 100))
		gravity = 19.7
		handbrake_force = vehicle_data[4] * (14 * (multiplier_percent / 100))
		initial_drive_force = vehicle_data[5] * (690 * (multiplier_percent / 100))   --nice
		traction_min = 6 + (2 * (multiplier_percent / 100))   --very high traction. Used without roll_centre modification, the car will constantly flip
		traction_max = vehicle_data[7] + (2 * (multiplier_percent / 100))
		traction_bias_front = 0.420
		up_shift = 10000  --huge shift values, causing cars to get stuck in gear and accelerate rapidly
		down_shift = 10000
		max_flat_vel = 10000
		collision_dmg_multiplier = 0
		engine_dmg_multiplier = 0
		if multiplier_percent >= 100 then
			--Dont increase the following roll_centre variables more than 100%. Makes things flip.
			multiplier_percent = 100
		end
		roll_centre_front = vehicle_data[15] + (0.300 * (multiplier_percent / 100)) --these two stop the car from rolling even at high speeds, it rolls inwards instead
		roll_centre_rear = vehicle_data[16] + (0.300 * (multiplier_percent	/ 100))
		drive_bias = 0.5   --all wheel drive
		traction_loss_mult = 1
		initial_drag_coeff = 1  --no drag forces
	else --restore mode
		accel = vehicle_data[1]
		brake_force = vehicle_data[2]
		gravity = vehicle_data[3]
		handbrake_force = vehicle_data[4]
		initial_drive_force = vehicle_data[5]
		traction_min = vehicle_data[6]
		traction_max = vehicle_data[7]
		traction_bias_front = vehicle_data[8]
		up_shift = vehicle_data[9]
		down_shift = vehicle_data[10]
		max_flat_vel = vehicle_data[11]
		--mass_offset = vehicle_data[12]
		collision_dmg_multiplier = vehicle_data[13]
		engine_dmg_multiplier = vehicle_data[14]
		roll_centre_front = vehicle_data[15]
		roll_centre_rear = vehicle_data[16]
		drive_bias = vehicle_data[17]
		traction_loss_mult = vehicle_data[18]
		initial_drag_coeff = vehicle_data[19]
	end
	
	vehicle:set_acceleration(accel)
	vehicle:set_brake_force(brake_force)
	vehicle:set_gravity(gravity)
	vehicle:set_handbrake_force(handbrake_force)
	vehicle:set_initial_drive_force(initial_drive_force)
	vehicle:set_traction_curve_min(traction_min)
	vehicle:set_traction_curve_max(traction_max)
	vehicle:set_traction_bias_front(traction_bias_front)
	vehicle:set_up_shift(up_shift)
	vehicle:set_down_shift(down_shift)
	vehicle:set_initial_drive_max_flat_velocity(max_flat_vel)
	vehicle:set_roll_centre_height_front(roll_centre_front)
	vehicle:set_roll_centre_height_rear(roll_centre_rear)
	vehicle:set_drive_bias_front(drive_bias)
	vehicle:set_collision_damage_multiplier(collision_dmg_multiplier)
	vehicle:set_engine_damage_multiplier(engine_dmg_multiplier)
	vehicle:set_traction_loss_multiplier(traction_loss_mult)
	vehicle:set_initial_drag_coeff(initial_drag_coeff)
	vehicle:set_max_speed(10000)
end
local function reloadVehicle(vehicle)
	if not vehicle then return end
	--Check if car has been found in the table, then restore, otherwise exit
	restore = cars_data[vehicle:get_model_hash()]
	if restore then
		boostVehicle(restore, vehicle:get_model_hash(), vehicle, false)
	end
end
function carBoost()
	if localplayer ~= nil and localplayer:is_in_vehicle() then 
		current = localplayer:get_current_vehicle()
		if current == nil then return end

		current:set_boost_enabled(false)
		sleep(0.1)
		if current:get_gravity() ~= 19.7 and boost_activate and not current:get_boost_enabled() and current:get_acceleration() > 0 and current:get_acceleration() < 1 then
			
			::retry::
			--Save car data to map if its not in there already
			if not cars_data[current:get_model_hash()] then
				cars_data[current:get_model_hash()] = {
					current:get_acceleration(),						--1
					current:get_brake_force(),						--2
					current:get_gravity(),							--3
					current:get_handbrake_force(),					--4
					current:get_initial_drive_force(),				--5
					current:get_traction_curve_min(),				--6
					current:get_traction_curve_max(),				--7
					current:get_traction_bias_front(),				--8
					current:get_up_shift(),							--9
					current:get_down_shift(),						--10
					current:get_initial_drive_max_flat_velocity(),	--11
					current:get_centre_of_mass_offset(),			--12
					current:get_collision_damage_multiplier(),		--13
					current:get_engine_damage_multiplier(),			--14
					current:get_roll_centre_height_front(),			--15	
					current:get_roll_centre_height_rear(),			--16
					current:get_drive_bias_front(),					--17
					current:get_traction_loss_multiplier(),			--18
					current:get_initial_drag_coeff(),				--19
					}
			end
			
			--boost car if data has been read successfully
			boostVehicle(cars_data[current:get_model_hash()], current:get_model_hash(), current, true)
			
			--Check if the boost worked, else reload the vehicle object again and try once more
			--This is usually necessary when changing to a new car of the same type, or when the old one gets destroyed and called back
			if current:get_gravity() ~= 19.7 then
				cars_data[current:get_model_hash()] = nil
				goto retry
			end
		else
			reloadVehicle(current)
		end
	end
end
local function changeVehicleColor(vehicle, colorFunc)
	local red, green, blue = vehicle:get_custom_primary_colour()
	local red2, green2, blue2 = vehicle:get_custom_secondary_colour()
	red, green, blue = colorFunc(red, green, blue)
	vehicle:set_custom_primary_colour(red, green, blue)
	if uniform then
		vehicle:set_custom_secondary_colour(red, green, blue)
	else
		red2, green2, blue2 = colorFunc(red2, green2, blue2)
		--Make sure we actually produce non-uniform colors
		if math.abs(red2 - red ) < 20 and math.abs(blue2 - blue) < 20 and math.abs(green2 - green) < 20 then
			red2, blue2, green2 = 255, 0, 0
		end
		vehicle:set_custom_secondary_colour(red2, green2, blue2)
	end
end
------------------


local Bindings_menu = Settings_menu:add_submenu(Settings_Binds_Menu)

local Noclip_Bindings = Bindings_menu:add_submenu(Menu_Noclip)
Noclip_Bindings:add_array_item(Menu_Noclip_Toggle,KeyCode,
	function()
		return settings.Noclip.toggle
	end,
	function(key)
		settings.Noclip.toggle = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_Foward,KeyCode,
	function()
		return settings.Noclip.foward
	end,
	function(key)
		settings.Noclip.foward = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_Backward,KeyCode,
	function()
		return settings.Noclip.backward
	end,
	function(key)
		settings.Noclip.backward = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_TurnRight,KeyCode,
	function()
		return settings.Noclip.turnright
	end,
	function(key)
		settings.Noclip.turnright = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_TrunLeft,KeyCode,
	function()
		return settings.Noclip.turnleft
	end,
	function(key)
		settings.Noclip.turnleft = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_IncreaseSpeed,KeyCode,
	function()
		return settings.Noclip.increasespeed
	end,
	function(key)
		settings.Noclip.increasespeed = key
		Save_settings(Settings_JSON_Filename,settings)
	end)
Noclip_Bindings:add_array_item(Mouvement_DecreaseSpeed,KeyCode,
	function()
		return settings.Noclip.decreasespeed
	end,
	function(key)
		settings.Noclip.decreasespeed = key
		Save_settings(Settings_JSON_Filename,settings)
	end
)

local Menu_Bindings = Bindings_menu:add_submenu(Menu_Bindings)
Menu_Bindings:add_array_item(Menu_Bindings_Toggle,KeyCode,
	function()
		return Menu_Keybindings[1]	
	end,
	function(k)
		Menu_Keybindings[1] = KeyCode[k]
		config.Menu.KeyBindings.MenuToggle = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Select,KeyCode,
	function()
		return Menu_Keybindings[2]	
	end,
	function(k)
		Menu_Keybindings[2] = KeyCode[k]
		config.Menu.KeyBindings.SelectKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Back  ,KeyCode,
	function()
		return Menu_Keybindings[3]	
	end,
	function(k)
		Menu_Keybindings[3] = KeyCode[k]
		config.Menu.KeyBindings.BackKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Up    ,KeyCode,
	function()
		return Menu_Keybindings[4]	
	end,
	function(k)
		Menu_Keybindings[4] = KeyCode[k]
		config.Menu.KeyBindings.UpKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Down  ,KeyCode,
	function()
		return Menu_Keybindings[5]	
	end,
	function(k)
		Menu_Keybindings[5] = KeyCode[k]
		config.Menu.KeyBindings.DownKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Right ,KeyCode,
	function()
		return Menu_Keybindings[6]	
	end,
	function(k)
		Menu_Keybindings[6] = KeyCode[k]
		config.Menu.KeyBindings.RightKey = KeyCode[k]
		Save_settings("config.json",config)
	end)
Menu_Bindings:add_array_item(Menu_Bindings_Left  ,KeyCode,
	function()
		return Menu_Keybindings[7]	
	end,
	function(k)
		Menu_Keybindings[7] = KeyCode[k]
		config.Menu.KeyBindings.LeftKey = KeyCode[k]
		Save_settings("config.json",config)
	end
)

Bindings_menu:add_array_item(Boost_Key,KeyCode,
	function()
		return settings.BoostButton.key
	end,
	function(key)
		settings.BoostButton.key = key
		Save_settings(Settings_JSON_Filename,settings)
	end
)

Bindings_menu:add_array_item(Refill_Key,KeyCode,
	function()
		return settings.RefillKey
	end,
	function(k)
		settings.RefillKey = k
		Save_settings(Settings_JSON_Filename,settings)
	end
)


Text(Settings_Reload,Settings_menu)
Settings_menu:add_array_item(Settings_Language, Menu_Languages,
    function()
		for i = 0,#Menu_Languages do
			if settings.Language == Menu_Languages[i] then
				return i
			end
		end
    end,
    function(l)
        settings.Language = Menu_Languages[l]
        Save_settings(Settings_JSON_Filename,settings)
    end)
--

local Numberplates_Settings = Settings_menu:add_submenu(Menu_Numberplates)
Numberplates_Settings:add_toggle(Settings_Numberplates_enable,
    function()
        return settings.Numberplates.enabled
    end,
    function(n)
        settings.Numberplates.enabled = n
		settings.Numberplates.custom.enabled = not n
        Save_settings(Settings_JSON_Filename,settings)
    end)

Numberplates_Settings:add_array_item(Settings_Numberplates_unit,units_text,
    function()
        return settings.Numberplates.unit
    end,
    function(u)
        settings.Numberplates.unit = u
        Save_settings(Settings_JSON_Filename,settings)
    end)
Numberplates_Settings:add_toggle(Custom_Numberplates,
    function()
        return settings.Numberplates.custom.enabled
    end,
    function(n)
        settings.Numberplates.custom.enabled = n
        settings.Numberplates.enabled = not n
        Save_settings(Settings_JSON_Filename,settings)
    end
)

Settings_menu:add_array_item(Shapeshift_Gender,Gender,
	function()
		return settings.Gender
	end,
	function(gen)
		settings.Gender = gen
		Save_settings(Settings_JSON_Filename,settings)
	end
)

Settings_menu:add_toggle(Removed_Cars_Default,
	function()
		return settings.RemovedCars
	end,
	function(rc)
		settings.RemovedCars = rc
		Save_settings(Settings_JSON_Filename,settings)
	end
)

Settings_menu:add_toggle(Settings_Boost_Default,
	function()
		return settings.BoostButton.enable
	end,
	function(bb)
		settings.BoostButton.enable = bb
		Save_settings(Settings_JSON_Filename,settings)
	end
)

Settings_menu:add_toggle("Global Tester",
	function()
		return settings.GlobalTester
	end,
	function(gt)
		settings.GlobalTester = gt
		Save_settings(Settings_JSON_Filename,settings)
	end
)



Main_menu:add_toggle(Manu_TransactionError,
	function()
		return enable_transaction_error
	end,
	function()
		enable_transaction_error = not enable_transaction_error
	end
)

local toggle_hotkey = menu.register_hotkey(Noclip_bind[9],
    function()
    	enable = not enable 
    	NoClip(enable)
    end)

Main_menu:add_toggle(Menu_Noclip,
    function()
	    return enable
    end,
    function()
	    enable = not enable 
	    NoClip(enable)
    end)
 
Main_menu:add_int_range(Menu_Noclip_Speed, 1, 1, 10,
    function()
    	return speed
    end,
    function(i)
        speed = i
    end)
--

local Numberplates_Menu = Main_menu:add_submenu(Menu_Numberplates)
Numberplates_Menu:add_toggle(Menu_Speedometer_Bindings,
    function()
    	return numberplate_enabled
    end,
    function(value)
		numberplate_enabled = value
		numberplate_custom_enabled = not value
    end)

Numberplates_Menu:add_bare_item("Speed",
    function()
    	if not localplayer:is_in_vehicle() then
            return Menu_Numberplates_Speed.." "..Menu_Numberplates_NotInVehicle
        end
    	local veh = localplayer:get_current_vehicle()
    	if not veh then
            return Menu_Numberplates_Speed.." "..Menu_Numberplates_InvalidVehicle
        end
    	local speed = round(get_vehicle_speed(veh) * units_value[units_selection], 1)
    	return Menu_Numberplates_Speed.." "..speed .. " " .. units_text_short[units_selection]
    end,
    null,
    null,
    null)
Numberplates_Menu:add_toggle(Numberplate_Custom_Toggle,
	function()
		return numberplate_custom_enabled
	end,
	function(value)
		numberplate_custom_enabled = value
		numberplate_enabled = not value
	end)
--

Text(Separator_text,Numberplates_Menu)

Custom_Plates_Manager = Numberplates_Menu:add_submenu(Numberplate_Custom_Manage,Custom_Plates)
for i = 1,8 do
	Numberplates_Menu:add_array_item(Numberplate_Custom_Character..i,Plate_Character,
		function()
			if localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
				local veh = localplayer:get_current_vehicle()
				local not_found = true
				for j = 1,#Plate_Character do
					if string.sub(veh:get_number_plate_text(),i,i) == Plate_Character[j] then
						Character_Plate_List[i] = j
						not_found = false
					end
				end
				if not_found == true then Character_Plate_List[i] = 37 end
			else
				if Character_Plate_List[i] == "Plate" then
					Character_Plate_List[i] = 1
				end
			end
			return Character_Plate_List[i]
		end,
		function(k)
			if localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
				local veh = localplayer:get_current_vehicle()
				local plate = veh:get_number_plate_text()
				plate = string.sub(plate,0,i-1)..""..Plate_Character[k]..""..string.sub(plate,i+1)
				test = plate
				veh:set_number_plate_text(plate)
			else
				Character_Plate_List[i] = k
			end
		end)
end
Text(Numberplate_Custom_Preview,Numberplates_Menu)
Numberplates_Menu:add_bare_item("",
	function()
		if localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
			local veh = localplayer:get_current_vehicle()
			return veh:get_number_plate_text()
		else
			Plate_text = ""
			for i = 1,8 do
				Plate_text = Plate_text .. Plate_Character[Character_Plate_List[i]]
			end
			return Plate_text
		end
	end,
	null,
	null,
	null)
--

Numberplates_Menu:add_action(Numberplate_Custom_SavePlate,
	function()
		local current_plate_tosave = ""
		if localplayer:is_in_vehicle() and localplayer:get_current_vehicle() ~= nil then
			local veh = localplayer:get_current_vehicle()
			current_plate_tosave = veh:get_number_plate_text()
		else
			Plate_text = ""
			for i = 1,8 do
				Plate_text = Plate_text .. Plate_Character[Character_Plate_List[i]]
			end
			current_plate_tosave = Plate_text
		end
		if settings.Numberplates.custom.platelist == nil then
			settings.Numberplates.custom.platelist = {current_plate_tosave}
			Save_settings()
		else
			if Is_IN(current_plate_tosave, settings.Numberplates.custom.platelist) then
				return
			else
				settings.Numberplates.custom.platelist[#settings.Numberplates.custom.platelist+1] = current_plate_tosave
				Save_settings()
			end
		end
	end
)



function On_Vehicle_Changed(oldVehicle, newVehicle)
	if localplayer then myplayer = localplayer end
	vehicle = newVehicle
	if oldVehicle then vehicle_old = oldVehicle end

	if numberplate_enabled and not numberplate_custom_enabled and oldVehicle ~= nil then
		oldVehicle:set_number_plate_text(Orignial_Plate)
	end

	if No_Scratch_Enabled and myplayer:is_in_vehicle() and myplayer:get_current_vehicle() ~= nil then
		vehicle:set_can_be_visibly_damaged(false)
		vehicle:set_window_collisions_disabled(true)
	end

	super_ruiner()
end
Main_menu:add_toggle(Menu_NoScratch,
	function()
		return No_Scratch_Enabled
	end,
	function()
		No_Scratch_Enabled = not No_Scratch_Enabled
		On_Vehicle_Changed()
	end)
Main_menu:add_toggle(Menu_Disable_AutoStop,
	function()
		if localplayer == nil then
			return nil
		end
		return localplayer:get_config_flag(241)
	end,
	function(value)
		localplayer:set_config_flag(241, value)
	end)
Main_menu:add_action(Menu_LSC_Reset, function() 
	stats.set_int("MPPLY_VEHICLE_SELL_TIME", 0)
	stats.set_int("MPPLY_NUM_CARS_SOLD_TODAY", 0)
	end)
menu.register_callback("OnVehicleChanged",On_Vehicle_Changed)

-----------------------------------------------
-- Rainbow Car and Boost Script by Quad_Plex -- Modified
-----------------------------------------------

local Honk_Boost_menu = Main_menu:add_submenu(Boost_Menu)
menu.register_hotkey(settings.BoostButton.key, carBoost)
Honk_Boost_menu:add_toggle(Boost_Toggle,function() return boost_activate end,function(b) boost_activate = b end)
Honk_Boost_menu:add_int_range(Boost_Strength, 5, 0, 690, function() return multiplier_percent end, function(value) multiplier_percent = value end)

local Rainbow_Cars = Main_menu:add_submenu(Rainbow_Menu)
Rainbow_Cars:add_toggle(Rainbow_Toggle,function() return Rainbow_Activated end, function(a) Rainbow_Activated = a end)
Rainbow_Cars:add_array_item(Rainbow_Style, colorStyles, function() return colorStyle end, function(value) colorStyle = value toggleColorFunction(value) end)
Rainbow_Cars:add_toggle(Rainbow_Uniform, function() return uniform end, function(value) uniform = value end)
Rainbow_Cars:add_toggle(Rainbow_Traffic, function() return affect_traffic end, function(value) affect_traffic = value end)
Rainbow_Cars:add_int_range(Rainbow_Mul, 1, 1, 69, function() return mul end, function(value) mul = value end)

-----------------------------------------------


local Online_Stats_menu = Unlocks_menu:add_submenu(Stats_Menu)
Online_Stats_menu:add_int_range(Stats_Stamina , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_stam")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_stam", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Strength, 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_strn")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_strn", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Lung    , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_lung")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_lung", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Driving , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_driv")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_driv", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Flying  , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_fly")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_fly", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Shooting, 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_sho")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_sho", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Stealth , 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_stl")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_stl", value)
	end)
 
Online_Stats_menu:add_int_range(Stats_Mechanic, 1, 0, 100,
	function()
		return stats.get_int(mpx().."script_increase_mech")
	end,
	function(value)
		stats.set_int(mpx().."script_increase_mech", value)
	end)
--

local Achivement_menu = Unlocks_menu:add_submenu(Achivement_Menu) 
	Text("Choose what for achievement you are missing", Achivement_menu) 
	for i = 1,#Achivement_List do
		Achivement_menu:add_action(Achivement_List[i], function() globals.set_int(Achivement_Global, i) end)
	end
--

Unlocks_menu:add_action(Unlocks_Daily,
	function()
		stats.set_int("MP" .. mpx() .. "_COMPLETEDAILYOBJ", 100)
		stats.set_int("MP" .. mpx() .. "_COMPLETEDAILYOBJTOTAL", 100)
		stats.set_int("MP" .. mpx() .. "_TOTALDAYCOMPLETED", 100)
		stats.set_int("MP" .. mpx() .. "_TOTALWEEKCOMPLETED", 400)
		stats.set_int("MP" .. mpx() .. "_TOTALMONTHCOMPLETED", 1800)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEDAYCOMPLETED", 30)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEWEEKCOMPLETED", 4)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEMONTHCOMPLETE", 1)
		stats.set_int("MP" .. mpx() .. "_COMPLETEDAILYOBJSA", 100)
		stats.set_int("MP" .. mpx() .. "_COMPLETEDAILYOBJTOTALSA", 100)
		stats.set_int("MP" .. mpx() .. "_TOTALDAYCOMPLETEDSA", 100)
		stats.set_int("MP" .. mpx() .. "_TOTALWEEKCOMPLETEDSA", 400)
		stats.set_int("MP" .. mpx() .. "_TOTALMONTHCOMPLETEDSA", 1800)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEDAYCOMPLETEDSA", 30)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEWEEKCOMPLETEDSA", 4)
		stats.set_int("MP" .. mpx() .. "_CONSECUTIVEMONTHCOMPLETESA", 1)
		stats.set_int("MP" .. mpx() .. "_AWD_DAILYOBJCOMPLETEDSA", 100)
		stats.set_int("MP" .. mpx() .. "_AWD_DAILYOBJCOMPLETED", 100)
		stats.set_bool("MP" .. mpx() .. "_AWD_DAILYOBJMONTHBONUS", true)
		stats.set_bool("MP" .. mpx() .. "_AWD_DAILYOBJWEEKBONUS", true)
		stats.set_bool("MP" .. mpx() .. "_AWD_DAILYOBJWEEKBONUSSA", true)
		stats.set_bool("MP" .. mpx() .. "_AWD_DAILYOBJMONTHBONUSSA", true)
	end)
Unlocks_menu:add_action(Unlocks_Parachute,
	function()
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 20)
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 21)
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 22)
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 23)
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 24)
		stats.set_bool_masked("MP" .. mpx() .. "_TUNERPSTAT_BOOL1", true, 25)
	end)

Unlocks_menu:add_action(Unlocks_Unicorn,
	function()
		stats.set_int("MP" .. mpx() .. '_LAP_DANCED_BOUGHT', 0)
		stats.set_int("MP" .. mpx() .. '_LAP_DANCED_BOUGHT', 5)
		stats.set_int("MP" .. mpx() .. '_LAP_DANCED_BOUGHT', 10)
		stats.set_int("MP" .. mpx() .. '_LAP_DANCED_BOUGHT', 15)
		stats.set_int("MP" .. mpx() .. '_LAP_DANCED_BOUGHT', 25)
		stats.set_int("MP" .. mpx() .. '_PROSTITUTES_FREQUENTED', 1000)
	end)

Unlocks_menu:add_action(Unlocks_taxi,
	function()
		stats.set_int("MP"..mpx() .. "_AWD_TAXIDRIVER", 50)
		stats.set_masked_int("MP"..mpx() .. "_DLC22022PSTAT_INT536", 10, 16, 8)
	end)
Unlocks_menu:add_action(Unlocks_tatoos,
	function()
		stats.set_int(mpx().."TATTOO_FM_CURRENT_32", -1)
		for i = 0, 47 do
			stats.set_int(mpx().."TATTOO_FM_UNLOCKS_" .. i, -1)
		end
	end)
Unlocks_menu:add_action(Unlocks_flight,
	function()
		stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 100)
		for i = 0, 9 do
			stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_" .. i , -1)
			stats.set_int(mpx().."PILOT_SCHOOL_MEDAL_" .. i, -1)
			stats.set_bool(mpx().."PILOT_ASPASSEDLESSON_" .. i, true)
		end
	end)
Unlocks_menu:add_action(Unlocks_shooting,
	function()
		stats.set_int(mpx().."SR_HIGHSCORE_1", 690)
		stats.set_int(mpx().."SR_HIGHSCORE_2", 1860)
		stats.set_int(mpx().."SR_HIGHSCORE_3", 2690)
		stats.set_int(mpx().."SR_HIGHSCORE_4", 2660)
		stats.set_int(mpx().."SR_HIGHSCORE_5", 2650)
		stats.set_int(mpx().."SR_HIGHSCORE_6", 450)
		stats.set_int(mpx().."SR_TARGETS_HIT", 269)
		stats.set_int(mpx().."SR_WEAPON_BIT_SET", -1)
		stats.set_bool(mpx().."SR_TIER_1_REWARD", true)
		stats.set_bool(mpx().."SR_TIER_3_REWARD", true)
		stats.set_bool(mpx().."SR_INCREASE_THROW_CAP", true)
	end)
--
Text(Menu_EnhancedOnline,Main_menu)



-- Exeptions
Vehicle_List_Adress[00] = {Global_Offset+33352, Global_Offset+33358}
-- Vehicle_List_Adress[i] = {start, end, step}

	-- From spenz
		Vehicle_List_Adress[01] = {Global_Offset+35167, Global_Offset+35443, 2}
		Vehicle_List_Adress[02] = {Global_Offset+29883, Global_Offset+29889, 1}
		Vehicle_List_Adress[03] = {Global_Offset+29534, Global_Offset+29541, 1}
		Vehicle_List_Adress[04] = {Global_Offset+24353, Global_Offset+24375, 1}
		Vehicle_List_Adress[05] = {Global_Offset+24262, Global_Offset+24277, 1}
		Vehicle_List_Adress[06] = {Global_Offset+23041, Global_Offset+23068, 1}
		Vehicle_List_Adress[07] = {Global_Offset+22073, Global_Offset+22092, 1}
		Vehicle_List_Adress[08] = {Global_Offset+21274, Global_Offset+21279, 1}
		Vehicle_List_Adress[09] = {Global_Offset+17654, Global_Offset+17675, 1}
		Vehicle_List_Adress[10] = {Global_Offset+14908, Global_Offset+14916, 1}
	-- From PHIDIAS
		Vehicle_List_Adress[11] = {Global_Offset+34212, Global_Offset+34227, 1}
		Vehicle_List_Adress[12] = {Global_Offset+33341, Global_Offset+33359, 1}
		Vehicle_List_Adress[13] = {Global_Offset+32099, Global_Offset+32113, 1}
		Vehicle_List_Adress[14] = {Global_Offset+31216, Global_Offset+31232, 1}
		Vehicle_List_Adress[15] = {Global_Offset+30348, Global_Offset+30364, 1}
		Vehicle_List_Adress[16] = {Global_Offset+28863, Global_Offset+28863, 3}
		Vehicle_List_Adress[17] = {Global_Offset+28820, Global_Offset+28840, 1}
		Vehicle_List_Adress[18] = {Global_Offset+26956, Global_Offset+26957, 1}
		Vehicle_List_Adress[19] = {Global_Offset+25980, Global_Offset+26000, 1}
		Vehicle_List_Adress[20] = {Global_Offset+25969, Global_Offset+25975, 1}
		Vehicle_List_Adress[21] = {Global_Offset+20392, Global_Offset+20395, 1}
		Vehicle_List_Adress[22] = {Global_Offset+19311, Global_Offset+19335, 1}
		Vehicle_List_Adress[23] = {Global_Offset+17482, Global_Offset+17500, 1}
-----

Main_menu:add_toggle(Menu_RemovedCars_Toggle,
    function()
        return Removed_cars
    end,
    function(k)
        Removed_cars = k
        Switch_Veh_Unlock_State()
    end
)

Main_menu:add_action(Refill_Key,function() refillInventory() end)
Main_menu:add_action(Menu_Nightclub_Popular, function() stats.set_int(mpx().."club_popularity", 1000) end)
Main_menu:add_action(Menu_Challenge,
	function()
		stats.set_bool(mpx().."CARMEET_PV_CHLLGE_CMPLT", true)
		stats.set_bool(mpx().."CARMEET_PV_CLMED", false)
	end)

menu.register_hotkey(refill_key, refillInventory)


local function Report()
	ReportsStats_submenu:clear()
	Text(Menu_Readonly,ReportsStats_submenu)
	Text(stats.get_int("MPPLY_GRIEFING")           .." ← "..Report_List[01], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_EXPLOITS")           .." ← "..Report_List[02], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_GAME_EXPLOITS")      .." ← "..Report_List[03], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_TC_ANNOYINGME")      .." ← "..Report_List[04], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_TC_HATE")            .." ← "..Report_List[05], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_VC_ANNOYINGME")      .." ← "..Report_List[06], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_VC_HATE")            .." ← "..Report_List[07], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_OFFENSIVE_LANGUAGE") .." ← "..Report_List[08], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_OFFENSIVE_TAGPLATE") .." ← "..Report_List[09], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_OFFENSIVE_UGC")      .." ← "..Report_List[10], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_BAD_CREW_NAME")      .." ← "..Report_List[11], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_BAD_CREW_MOTTO")     .." ← "..Report_List[12], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_BAD_CREW_STATUS")    .." ← "..Report_List[13], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_BAD_CREW_EMBLEM")    .." ← "..Report_List[14], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_FRIENDLY")           .." ← "..Report_List[15], ReportsStats_submenu)
	Text(stats.get_int("MPPLY_HELPFUL")            .." ← "..Report_List[16], ReportsStats_submenu)
end
ReportsStats_submenu=Main_menu:add_submenu(Menu_Report_Menu,Report)

-- Th3 L0oP

function OnScriptsLoaded()
	while true do
		if Rainbow_Activated then
			if myplayer and myplayer:is_in_vehicle() then
				On_Vehicle_Changed(nil, myplayer:get_current_vehicle())
				if vehicle ~= nil then
					if Is_IN(999,Original_Color) then
						Original_Color[1],Original_Color[2],Original_Color[3] = vehicle:get_custom_primary_colour()
						Original_Color[4],Original_Color[5],Original_Color[6] = vehicle:get_custom_secondary_colour()
					end

					local function applyColor(colorFunc)
						if affect_traffic then
							for veh in replayinterface.get_vehicles() do
								changeVehicleColor(veh, colorFunc)
							end
						elseif vehicle then
							changeVehicleColor(vehicle, colorFunc)
						end

						sleep(0.04)

						if not myplayer:is_in_vehicle() and not affect_traffic then
							return false
						end
						return true
					end

					if rainbow and applyColor(nextRainbowColor) then
					elseif strobelight and applyColor(strobeLight) then
					elseif random and applyColor(randomColor) then
					end
				end
			end
		end
		if not Rainbow_Activated then
			if myplayer and myplayer:is_in_vehicle() and not Is_IN(999,Original_Color) then
				vehicle:set_custom_primary_colour(Original_Color[1],Original_Color[2],Original_Color[3])
				vehicle:set_custom_secondary_colour(Original_Color[4],Original_Color[5],Original_Color[6])
				Original_Color = {999,999,999,999,999,999}
			end
		end

		if enable_transaction_error then
			globals.set_int(Is_TransactionError_NotificationShown_1 ,0)
			globals.set_int(Is_TransactionError_NotificationShown_2 ,0)
			globals.set_int(TransactionError_BannerShown ,0)
		end

		if numberplate_enabled or numberplate_custom_enabled then
			if vehicle ~= nil then
				if Orignial_Plate == "________" then
					Orignial_Plate = vehicle:get_number_plate_text()
				end

				local speed = round(get_vehicle_speed(vehicle) * units_value[units_selection], 0)

				if numberplate_enabled and not numberplate_custom_enabled and speed ~= nil then
					if speed >= round(7*units_value[units_selection]) then
						vehicle:set_number_plate_text((speed < 10 and "   " or speed < 100 and "  " or speed < 1000 and " " or "") .. speed .. " " .. units_text_numberplate[units_selection])
					else
						vehicle:set_number_plate_text(Orignial_Plate)
						Orignial_Plate = "________"
					end
				elseif numberplate_custom_enabled and not numberplate_enabled and settings.Numberplates.custom.platedefault ~= 0 then
					if Sup3r_2000 then
						vehicle:set_number_plate_text("K 2000")
					else
						vehicle:set_number_plate_text(settings.Numberplates.custom.platelist[settings.Numberplates.custom.platedefault])
					end
				end
			end
		end

		sleep(0.1)
	end
end

menu.register_callback('OnScriptsLoaded', OnScriptsLoaded)