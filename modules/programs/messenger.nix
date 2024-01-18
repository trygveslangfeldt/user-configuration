{ config, pkgs, ... }:
let

in {
  home.packages = [
    pkgs.slack
  ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "slack"
  ];

}
