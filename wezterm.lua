local wezterm = require 'wezterm'

local config = {}

config.native_macos_fullscreen_mode = true
config.use_fancy_tab_bar = true
config.keys = {{
    key = 'd',
    mods = 'SUPER',
    action = wezterm.action.SplitHorizontal {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = 'd',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.SplitVertical {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = "Enter",
    mods = "SUPER|SHIFT",
    action = "TogglePaneZoomState"
}, {
    key = "LeftArrow",
    mods = "OPT|SUPER",
    action = wezterm.action {
        ActivatePaneDirection = "Left"
    }
}, {
    key = "RightArrow",
    mods = "OPT|SUPER",
    action = wezterm.action {
        ActivatePaneDirection = "Right"
    }
}, {
    key = "UpArrow",
    mods = "OPT|SUPER",
    action = wezterm.action {
        ActivatePaneDirection = "Up"
    }
}, {
    key = "DownArrow",
    mods = "OPT|SUPER",
    action = wezterm.action {
        ActivatePaneDirection = "Down"
    }
}, {
    key = 'w',
    mods = 'SUPER',
    action = wezterm.action.CloseCurrentPane {
        confirm = true
    }
}, {
    key = 'f',
    mods = 'SUPER|CTRL',
    action = wezterm.action.ToggleFullScreen
}, {
    key = "LeftArrow",
    mods = "OPT",
    action = wezterm.action {
        SendString = "\x1bb"
    }
}, {
    key = "RightArrow",
    mods = "OPT",
    action = wezterm.action {
        SendString = "\x1bf"
    }
}}

return config
