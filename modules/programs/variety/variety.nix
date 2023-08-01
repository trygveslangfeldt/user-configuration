{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.variety
  ];

  home.file = {
    "variety.conf".source = ./variety.conf;
  };
}
