{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.google-chrome
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "google-chrome"
  ];
}
