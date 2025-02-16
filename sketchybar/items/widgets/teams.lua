local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local teams = sbar.add("item", "widgets.teams", {
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


teams:subscribe({"routine", "system_woke"}, function()
  sbar.exec('lsappinfo info -only StatusLabel "Microsoft Teams"', function(teams_info)
    local label = "?"
    local msgcount = 0

    local found, _, msgs = teams_info:find("\"label\"=\"([^\"]*)\"")
    if found then
      msgcount = tonumber(msgs)
    end

    local color = colors.green
    local bgcolor = colors.bg1
    if msgcount > 0 then
      color = colors.white
      bgcolor = colors.red
    end

    teams:set({
      icon = {
        string = ":microsoft_teams:",
        color = color
      },
      label = { string = msgcount },
      background = { color = bgcolor},
    })

  end)
end)

sbar.add("bracket", "widgets.teams.bracket", { teams.name }, {
  background = { color = colors.bg1 }
})

sbar.add("item", "widgets.teams.padding", {
  position = "right",
  width = settings.group_paddings
})
