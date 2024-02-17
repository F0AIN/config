local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder();
end

config.color_scheme = 'Dracula (Official)'
config.font_size = 14.0
config.font = wezterm.font_with_fallback({
  { family = 'Monaspace Xenon' },
  { family = 'PlemolJP Console NF', harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }},
  { family = 'PlemolJP Console NF', assume_emoji_presentation=true },
})

config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'

config.default_prog = { "/bin/zsh", "-l", "-c", "zellij attach -c 'work'" }

return config
