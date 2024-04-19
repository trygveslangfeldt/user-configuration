{ config, pkgs, configuration, ... }:
let

in {
  home.packages = [
    (pkgs.writeShellScriptBin "home-manager-switch" ''
      darwin-rebuild switch \
        --flake ~/code/github/user-configuration#${configuration} "@"
    '')
    (pkgs.writeShellScriptBin "home-manager-build" ''
      darwin-rebuild build \
        --flake ~/code/github/user-configuration#${configuration} "@"
    '')
  ];

  imports = [
    ../common.nix
    ./dev.nix
    ../../programs/zsh.nix
    ../../programs/alacritty-tmux.nix
    ../../programs/vim/neovim.nix
    ../../programs/messenger.nix
  ];
}
