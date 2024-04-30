local wezterm = require 'wezterm';
wezterm.add_to_config_reload_watch_list(wezterm.config_dir)

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.audible_bell = "Disabled"

config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font 'Liberation Mono'
config.font_size = 16
config.color_scheme = 'Material Darker (base16)'

config.keys = {
    { key = 'Escape', mods = 'ALT', action = wezterm.action.ActivateCopyMode },
   -- Move focus between panes using Vim keys
    {key="h", mods="CMD", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="j", mods="CMD", action=wezterm.action{ActivatePaneDirection="Down"}},
    {key="k", mods="CMD", action=wezterm.action{ActivatePaneDirection="Up"}},
    {key="l", mods="CMD", action=wezterm.action{ActivatePaneDirection="Right"}},

    -- Split panes horizontally and vertically
    {key="h", mods="CMD|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="v", mods="CMD|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},

    -- Close current pane
    {key="x", mods="CMD", action=wezterm.action{CloseCurrentPane={confirm=true}}},

    -- Create a new window
    -- {key="n", mods="CMD|SHIFT", action=wezterm.action{SpawnTab={}}},

    -- Resize panes
    {key="h", mods="CMD|ALT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
    {key="j", mods="CMD|ALT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
    {key="k", mods="CMD|ALT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
    {key="l", mods="CMD|ALT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
}

--for i = 1, 8 do
--  -- CTRL+ALT + number to activate that tab
--  table.insert(config.keys, {
--    key = tostring(i),
--    mods = 'ALT',
--    action = wezterm.action.ActivateTab(i - 1),
--  })
--end


return config

