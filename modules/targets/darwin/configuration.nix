{ pkgs, username, ... }:

{
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  nix.enable = false;
  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users."${username}".home = "/Users/${username}";

  # FIX 1: The Touch ID option was renamed in the new nix-darwin version.
  security.pam.services.sudo_local.touchIdAuth = true;

  # FIX 2: Explicitly set the primary user, which is now required for Homebrew.
  # We can just reuse the `username` variable that is passed into this file.
  system.primaryUser = username;

  homebrew = {
    enable = true;
    brews = [
      "openjdk@17"
      "openjdk@11"
    ];
    casks = [
      "amethyst"
    ];
  };
}
