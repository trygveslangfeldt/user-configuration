{ config, pkgs, ... }:
let

in {
  home.packages = with pkgs; [
  ];
  home = {
  };
  imports = [
    ./base.nix
  ];
}
