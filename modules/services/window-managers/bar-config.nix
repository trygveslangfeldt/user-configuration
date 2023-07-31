{ config, pkgs, displays, ... }:
let
  bar = {
    fonts = {
      names = [ "Liberation Mono" ];
      size = 11.0;
    };
    statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${config.home.homeDirectory}/.config/i3status-rust/config-custom.toml";
    command = "${pkgs.i3}/bin/i3bar";
    mode = "dock";
    hiddenState = "show";
    trayOutput = "";
    workspaceButtons = true;
    position = "top";
    colors = {
      background = "#000000";
      statusline = "#ffffff";
      separator = "#666666";
      focusedWorkspace = {
        border = "#4c7899";
        background = "#285577";
        text = "#ffffff";
      };
      activeWorkspace = {
        border = "#333333";
        background = "#5f676a";
        text = "#ffffff";
      };
      inactiveWorkspace = {
        border = "#333333";
        background = "#222222";
        text = "#888888";
      };
      urgentWorkspace = {
        border = "#2f343a";
        background = "#900000";
        text = "#ffffff";
      };
      bindingMode = {
        border = "#2f343a";
        background = "#900000";
        text = "#ffffff";
      };
    };
  };
in
  builtins.genList (i: bar // {
    trayOutput = builtins.elemAt displays i;
  }) (builtins.length displays)
