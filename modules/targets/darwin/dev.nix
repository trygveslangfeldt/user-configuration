{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ctags
    cmake
    ninja
    unzip
    pkg-config
    clang-tools_16
  ];

  imports = [
    ./ccache.nix
  ];
}
