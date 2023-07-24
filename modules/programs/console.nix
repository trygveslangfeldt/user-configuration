{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
  };

  home.sessionVariables = {
    TERMINAL = "alacritty";
  };
}
