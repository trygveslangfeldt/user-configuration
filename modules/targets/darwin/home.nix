{ config, pkgs, configuration, ... }:
let

in {
  home.packages = [
    (pkgs.writeShellScriptBin "home-manager-switch" ''
      darwin-rebuild switch \
        --flake ~/code/github/user-configuration#${configuration} "$@"
    '')
    (pkgs.writeShellScriptBin "home-manager-build" ''
      darwin-rebuild build \
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
    ./dev.nix
    ../../programs/zsh.nix
    ../../programs/wezterm/wezterm.nix
    ../../programs/alacritty-tmux.nix
    ../../programs/vim/neovim.nix
    ../../programs/messenger.nix
  ];
}
