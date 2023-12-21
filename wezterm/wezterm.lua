local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder();
end

config.color_scheme = "Dracula (Official)"
config.font_size = 14.0
config.font = wezterm.font {
  family = "JetBrains Mono",
  harfbuzz_features = { "catl=0", "clig=0", "liga=0" }
}

config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

config.default_prog = { "/bin/zsh", "-l", "-c", "zellij" }

return config
