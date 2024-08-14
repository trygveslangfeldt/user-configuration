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
    openssl
    rustc
    sqlitebrowser
  ];

  imports = [
    ../../programs/ccache.nix
  ];
}
