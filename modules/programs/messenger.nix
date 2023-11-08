{ config, pkgs, ... }:
let

in {
  home.packages = [
    pkgs.slack
    # pkgs.telegram-desktop
    pkgs.discord
  ];
}
