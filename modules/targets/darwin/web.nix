{ config, pkgs, ... }:
let

in {
  home.packages = with pkgs; [
    corepack
    nodejs
  ];
  home = {
  };
  imports = [
    ./base.nix
  ];
}
