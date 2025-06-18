{ config, pkgs, configuration, ... }:
let

in {
  home.packages = [
    (pkgs.writeShellScriptBin "home-manager-switch" ''
      sudo darwin-rebuild switch \
        --flake ~/code/github/user-configuration#${configuration} "$@"
    '')
    (pkgs.writeShellScriptBin "home-manager-build" ''
      sudo darwin-rebuild build \
        --flake ~/code/github/user-configuration#${configuration} "$@"
    '')
  ];
  home = {
    sessionVariables = {
      QT_LOGGING_CONF = ''${config.home.homeDirectory}/.qtlog'';
    };
  };
  imports = [
    ../common.nix
    ../../programs/zsh.nix
    ../../programs/wezterm/wezterm.nix
    ../../programs/vim/neovim.nix
  ];
}
