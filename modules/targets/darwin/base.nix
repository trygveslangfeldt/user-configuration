{ config, pkgs, configuration, ... }:
let

in {
  home.packages = [
    (pkgs.writeShellScriptBin "switch-profile" ''
      sudo darwin-rebuild switch \
        --flake ~/code/github/user-configuration#$@
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
