---@param color number
---@param alpha number
---@return number
local function with_alpha(color, alpha)
  if alpha > 1.0 or alpha < 0.0 then
    return color
  end
  return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
end

---Primitive colors from
---https://github.com/rebelot/kanagawa.nvim/tree/master?tab=readme-ov-file#color-palette
local primitives = {
  black = 0xFF000000,
  white = 0xFFFFFFFF,

  fuji_white = 0xFFDCD7BA,
  old_white = 0xFFC8C093,
  light_blue = 0xFFA3D4D5,
  crystal_blue = 0xFF7E9CD8,
  spring_violet_2 = 0xFF9CABCA,
  ronin_yellow = 0xFFFF9E3B,

  transparent = 0x00000000,
}
return {
  black = 0xff181819,
  white = 0xffe2e2e3,
  red = 0xfffc5d7c,
  green = 0xff9ed072,
  blue = 0xff76cce0,
  yellow = 0xffe7c664,
  orange = 0xfff39660,
  magenta = 0xffb39df3,
  grey = 0xff7f8490,
  transparent = 0x00000000,

  bar = {
    bg = 0xf02c2e34,
    border = 0xff2c2e34,
  },
  popup = {
    bg = 0xc02c2e34,
    border = 0xff7f8490
  },
  bg1 = 0xff363944,
  bg2 = 0xff414550,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,

  primitive = primitives,

  workspaces = {
    icon = with_alpha(primitives.white, 0.4),
    icon_focused = primitives.white,

    label = with_alpha(primitives.white, 0.8),
    label_focused = primitives.white,

    item_background = primitives.transparent,
    item_background_focused = with_alpha(primitives.white, 0.1),
  },
}
