{config, pkgs, ...}:
{
  home.packages = with pkgs; [
    ctags
    cmake
    go
    ninja
    nodejs
    corepack
    zulu
    yarn
    watchman
    unzip
    pkg-config
    clang-tools_16
    sqlitebrowser
    cargo
    jq
    openssl
    rustc
    flutter
    sqlitebrowser
  ];

  imports = [
    ../../programs/ccache.nix
  ];
}
