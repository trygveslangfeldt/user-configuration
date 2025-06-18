{ config, pkgs, configuration, ... }:

{
  home.stateVersion = "24.05";

  home.packages = [
    pkgs.which
    pkgs.ripgrep
    pkgs.bat
    pkgs.hostname
    pkgs.font-awesome
    # FIX: Replace the old nerdfonts override with the new individual packages
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.jetbrains-mono
  ];

  # IMPORTANT: This line is required for fonts to work in GUI apps on macOS.
  #home.fonts.fontDir.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xdg.enable = true;

  imports = [
    ../programs/git.nix
    ../programs/ssh.nix
    ../programs/dircolors.nix
    ../programs/fzf.nix
  ];
}
