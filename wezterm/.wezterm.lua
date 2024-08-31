-- Pull in the Wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- Apply the config choices
config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.font = wezterm.font("JetBrains Mono")
config.font_size = 10.0
config.enable_wayland = false

config.keys = {
	{
		key = "Z",
		mods = "CTRL",
		action = wezterm.action.TogglePaneZoomState,
	},
}

-- Return the configuration to Wezterm
return config
