{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.variety
  ];

  xdg.configFile = {
    "variety/variety.conf".source = ./variety.conf;
  };
}
