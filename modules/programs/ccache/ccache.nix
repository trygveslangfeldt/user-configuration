{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ccache
  ];

  xdg.configFile = {
    "ccache/ccache.conf".source = ./ccache.conf;
  };
}
