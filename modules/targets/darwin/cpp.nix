{ config, pkgs, ... }:
let

in {
  home.packages = with pkgs; [
    ctags
    cmake
    ninja
    unzip
    pkg-config
    clang-tools_16
    cargo
    jira-cli-go
    openssl
    rustc
    sqlitebrowser
  ];
  home = {
    sessionVariables = {
      QT_LOGGING_CONF = ''${config.home.homeDirectory}/.qtlog'';
    };
  };
  imports = [
    ../../programs/ccache.nix
    ./base.nix
  ];
}
