{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ctags
    # cmake
    clang-tools_16
    ninja
    gdb
    gnumake
    # python3
    zip
    unzip
  ];

  imports = [
    ./ccache.nix
  ];
}
