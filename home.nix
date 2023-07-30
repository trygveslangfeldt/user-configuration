{ config, pkgs, username, ... }:
let
  currentFilePath = builtins.currentSystem;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

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
    pkgs.coreutils
    pkgs.which
    pkgs.strace
    pkgs.liberation_ttf
    pkgs.dejavu_fonts
    pkgs.ripgrep
    pkgs.bat

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "home-manager-switch" ''
      home-manager switch \
        --flake ~/code/github/user-configuration#${config.home.username}
    '')
    (pkgs.writeShellScriptBin "home-manager-build" ''
      home-manager build \
        --flake ~/code/github/user-configuration#${config.home.username}
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".screenrc".source = dotfiles/screenrc;
    ".xxkbrc".source = dotfiles/xxkbrc;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/trilla/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    NO_AT_BRIDGE = 1;
  };

  home.keyboard = {
    layout = "us,ru";
    # layout = "us,ru,no";
    options = [ "grp:toggle" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  xdg.enable = true;

  imports = [
    ./modules/programs/bash.nix
    ./modules/programs/browser.nix
    ./modules/programs/console.nix
    ./modules/programs/dev.nix
    ./modules/programs/vim.nix
    ./modules/programs/git.nix
    ./modules/programs/ssh.nix
    ./modules/programs/dircolors.nix
    ./modules/services/window-managers/i3.nix
    ./modules/services/picom.nix
  ];
}
