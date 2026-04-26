local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font = wezterm.font_with_fallback({
  "Hack Nerd Font",
  "BlexMono Nerd Font",
})
config.font_size = 16.0
config.use_ime = true
config.window_background_opacity = 0.7
config.macos_window_background_blur = 20

----------------------------------------------------
-- Tab
----------------------------------------------------
-- Hide title bar
config.window_decorations = "RESIZE"
-- Show tab bar
config.show_tabs_in_tab_bar = true
-- Always show tab bar
config.hide_tab_bar_if_only_one_tab = false
-- Setting to false disables tab bar transparency
-- config.use_fancy_tab_bar = false

-- Transparent tab bar
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

-- Match tab bar to background color
config.window_background_gradient = {
  colors = { "#000000" },
}

-- Hide new tab button
config.show_new_tab_button_in_tab_bar = false

-- Hide tab borders
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}

-- Powerline-style slanted tab edges
local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)

wezterm.on("format-tab-title", function(tab, tabs, panes, conf, hover, max_width)
  local edge_background = "none"
  local background = "#4E4E4E"
  local foreground = "#1C1B19"

  if tab.is_active then
    background = "#FBB829"
    foreground = "#1C1B19"
  elseif hover then
    background = "#FF8700"
    foreground = "#1C1B19"
  end

  local edge_foreground = background
  local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width - 2) .. " "

  return {
    { Attribute = { Intensity = "Bold" } },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
    { Attribute = { Intensity = "Normal" } },
  }
end)

return config
