local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local outlook = sbar.add("item", "widgets.outlook", {
  position = "right",
  icon = {
    font = {
      family = "sketchybar-app-font",
      size = 16.0,
      style = "Normal",
    }
  },
  label = { 
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 16.0,
    },
  },
  update_freq = 5
})


outlook:subscribe({"routine", "system_woke"}, function()
  sbar.exec('lsappinfo info -only StatusLabel "Microsoft Outlook"', function(outlook_info)
    local label = "?"
    local msgcount = 0

    local found, _, msgs = outlook_info:find("\"label\"=\"([^\"]*)\"")
    if found and (msgs ~= '' and msgs ~= nil) then
      msgcount = tonumber(msgs)
    end

    local color = colors.green
    local bgcolor = colors.bg1
    if msgcount > 0 then
      color = colors.white
      bgcolor = colors.red
    end

    outlook:set({
      icon = {
        string = ":microsoft_outlook:",
        color = color
      },
      label = { string = msgcount },
      background = { color = bgcolor},
    })
  end)
end)


outlook:subscribe("mouse.clicked", function(env)
  sbar.exec("open -a 'Microsoft Outlook'")
end)


sbar.add("bracket", "widgets.outlook.bracket", { outlook.name }, {
  background = { color = colors.bg1 }
})

sbar.add("item", "widgets.outlook.padding", {
  position = "right",
  width = settings.group_paddings
})
