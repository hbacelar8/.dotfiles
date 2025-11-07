-- Pull in the Wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- Set theme (Rosé Pine)
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main

-- Apply the config choices
config.colors = theme.colors()
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.font = wezterm.font("IosevkaTerm Nerd Font Propo", { weight = "Bold" })
config.font_size = 11.0
config.enable_wayland = false

config.keys = {
	-- Pane splitting
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Pane navigation
	{
		key = "h",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- Style tabs
function tab_title(tab_info)
	local title = tab_info.tab_title

	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end

	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)

	if tab.is_active then
		return {
			{ Background = { Color = "#ea9a97" } },
			{ Text = " " .. title .. " " },
		}
	end

	return title
end)

-- Return the configuration to Wezterm
return config
