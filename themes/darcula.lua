-- place the file in /custom/themes/<theme-name>.lua
-- for example: custom/themes/siduck.lua

local M = {}

M.base_30 = {
   -- 30 colors based on base_16
  white = "#d3dbe3",
  darker_black = "#1F2428",
  black = "#24292E", --  nvim bg
  black2 = "#2e3338",
  one_bg = "#33383d",
  one_bg2 = "#383d42", -- StatusBar (filename)
  one_bg3 = "#42474c",
  grey = "#4c5156", -- Line numbers (shouldn't be base01?)
  grey_fg = "#565b60", -- Why this affects comments?
  grey_fg2 = "#60656a",
  light_grey = "#6a6f74",
  red = "#ff7f8d", -- StatusBar (username)
  baby_pink = "#ffa198",
  pink = "#ec6cb9",
  line = "#33383d", -- for lines like vertsplit
  green = "#56d364", -- StatusBar (file percentage)
  vibrant_green = "#85e89d",
  nord_blue = "#58a6ff", -- Mode indicator
  blue = "#79c0ff",
  yellow = "#ffdf5d",
  sun = "#ffea7f",
  purple = "#d2a8ff",
  dark_purple = "#bc8cff",
  teal = "#39c5cf",
  orange = "#ffab70",
  cyan = "#56d4dd",
  statusline_bg = "#2b3035",
  lightbg = "#383d42",
  pmenu_bg = "#58a6ff", -- Command bar suggestions
  folder_bg = "#58a6ff",
}

M.base_16 = {
  -- base16 colors
  -- base00 = "#2b2b2b", -- background
  -- base01 = "#323232", -- line cursor
  -- base02 = "#323232", -- statusline
  -- base03 = "#606366", -- line numbers
  -- base04 = "#a4a3a3", -- selected line number
  -- base05 = "#a9b7c6", -- foreground
  -- base06 = "#ffc66d", -- function bright yellow
  -- base07 = "#ffffff",
  -- base08 = "#4eade5", -- cyan
  -- base09 = "#689757", -- blue
  -- base0A = "#bbb529", -- yellow
  -- base0B = "#6a8759", -- string green
  -- base0C = "#629755", -- comment green
  -- base0D = "#9876aa", -- purple
  -- base0E = "#cc7832", -- orange
  -- base0F = "#808080", -- gray

  base00 = "#282a36", -- Default bg
  base01 = "#edeff1", -- Lighter bg (status bar, line number, folding mks)
  base02 = "#e1e3e5", -- Selection bg
  base03 = "#808080", -- Comments, invisibles, line hl
  base04 = "#c7c9cb", -- Dark fg (status bars)
  base05 = "#BBBBBB", -- Default fg (caret, delimiters, Operators)
  base06 = "#2e3338", -- Light fg (not often used)
  base07 = "#24292e", -- Light bg (not often used)
  base08 = "#A9B7C6", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = "#6897BB", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = "#B5B6E3", -- Classes, Markup Bold, Search Text Background
  base0B = "#6A8759", -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = "#CC7832", -- Support, regex, escape chars
  base0D = "#FFC66D", -- Function, methods, headings
  base0E = "#CC7832", -- Keywords
  base0F = "#044289", -- Deprecated, open/close embedded tags
}

M.type = "dark" -- light / dark

return M

