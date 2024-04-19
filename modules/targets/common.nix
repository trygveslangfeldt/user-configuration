{ config, pkgs, configuration, ... }:
let

in
{
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.which
    pkgs.dejavu_fonts
    pkgs.liberation_ttf
    pkgs.font-awesome
    pkgs.ripgrep
    pkgs.bat
    pkgs.hostname
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  xdg.enable = true;

  imports = [
    ../programs/shell.nix
    ../programs/git.nix
    ../programs/ssh.nix
    ../programs/dircolors.nix
    ../programs/fzf.nix
  ];
}
