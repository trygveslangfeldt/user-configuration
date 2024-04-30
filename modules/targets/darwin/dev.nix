{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ctags
    cmake
    ninja
    unzip
    pkg-config
    clang-tools_16
    cargo
    rustc
  ];

  imports = [
    ../../programs/ccache.nix
  ];
}
