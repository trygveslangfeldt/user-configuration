{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.firefox
  ];

  imports = [
    #./google-chrome.nix
  ];
}
