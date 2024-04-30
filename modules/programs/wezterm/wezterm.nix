{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wezterm
  ];

  programs.wezterm = {
    enable = true;
  };
  xdg.configFile = {
    "wezterm/wezterm.lua".source = ./wezterm.lua;
  };

  home.sessionVariables = {
    #TERMINAL = "wezterm";
  };
}
