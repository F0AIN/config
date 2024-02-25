local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder();
end

config.color_scheme = 'Dracula (Official)'

-- font
config.font_size = 14.0
config.font = wezterm.font_with_fallback({
  -- プログラミング用フォント
  { family = 'Monaspace Xenon' },
  -- 日本語等幅フォント
  { family = 'FirgeNerd Console' },
})
-- リガチャ無効
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- UI
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'

config.default_prog = { "/bin/zsh", "-l", "-c", "zellij attach -c 'work'" }

return config
