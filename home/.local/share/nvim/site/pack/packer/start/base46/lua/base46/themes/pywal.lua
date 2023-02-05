local M = {}

-- Convert a hex color code to red, green, and blue values
function hex_to_rgb(hex)
  hex = hex:gsub("#","")
  return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
end

-- Brighten a hex color code by a specified amount
function brighten_color(hex, amount)
  local r, g, b = hex_to_rgb(hex)
  r = math.min(255, math.max(0, r + amount))
  g = math.min(255, math.max(0, g + amount))
  b = math.min(255, math.max(0, b + amount))
  return string.format("#%02x%02x%02x", r, g, b)
end
-- BTW this is from ChatGPT because some stackoverflow answers has some problems

M.base_30 = {
  white = "#fff3ff",
  darker_black = brighten_color('0d0c0f', -6),
  black = "#0d0c0f", --  nvim bg
  black2 = brighten_color('0d0c0f', 6),
  one_bg = brighten_color('0d0c0f', 10), -- real bg of onedark
  one_bg2 = brighten_color('0d0c0f', 19),
  one_bg3 = brighten_color('0d0c0f', 27),
  grey = brighten_color('0d0c0f', 40),
  grey_fg = brighten_color('0d0c0f', 10),
  grey_fg2 = brighten_color('0d0c0f', 20),
  light_grey = brighten_color('0d0c0f', 28),
  red = "#8A7689",
  baby_pink = brighten_color('#8A7689', 15),
  pink = "#6e5e6d",
  line = brighten_color('0d0c0f', 15), -- for lines like vertsplit
  green = "#c3c8ff",
  vibrant_green = "#B2B4E8",
  nord_blue = "#78a5ff",
  blue = "#6B84B6",
  yellow = "#ACA2BF",
  sun = brighten_color('0d0c0f', 8),
  purple = "#adb5ff",
  dark_purple = "#989CDE",
  teal = "#c3c8ff",
  orange = "#d8bbff",
  cyan = "#71bcff",
  statusline_bg = brighten_color('0d0c0f', 4),
  lightbg = brighten_color('0d0c0f', 13),
  pmenu_bg = "#c388c1",
  folder_bg = "#6B84B6",
}

M.base_16 = {
  base00 = "#0d0c0f",
  base01 = brighten_color('0d0c0f', 10),
  base02 = brighten_color('0d0c0f', 20),
  base03 = brighten_color('0d0c0f', 30),
  base04 = brighten_color('0d0c0f', 40),
  base05 = "#6e5e6d",
  base06 = "#dfd3e7",
  base07 = "#fff3ff",
  base08 = "#8A7689",
  base09 = "#d8bbff",
  base0A = "#ACA2BF",
  base0B = "#B2B4E8",
  base0C = "#6e5e6d",
  base0D = "#6895E2",
  base0E = "#989CDE",
  base0F = "#c388c1",
}

vim.opt.bg = "dark"

M = require("base46").override_theme(M, "wpgtk")

return M
