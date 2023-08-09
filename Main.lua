require("scripts/AA_language")
local success, settings = pcall(json.loadfile, "CookieScript.json")

local Settings_menu = menu.add_submenu("Settings")
Settings_menu:add_array_item(Settings_Menu_Language, Menu_Languages,
    function()
        return settings.Language
    end,
    function(l)
        settings.Language = Menu_Languages[l]
        json.savefile("CookieScript.json", settings)
    end
)
