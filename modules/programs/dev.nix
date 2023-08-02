{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    binutils
    ctags
    cmake
    clang-tools
    ninja
    gdb
    gnumake
    go
    (hiPrio pkgs.gcc13)
    (lowPrio pkgs.clang_16)
    pkg-config
    patchelf
    virtualenv
    python3
    rustup
    valgrind
    zip
    unzip
  ];
}
