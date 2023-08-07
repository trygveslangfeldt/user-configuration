{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.openssh
  ];

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "gitlab.com" = {
        identityFile = "~/.ssh/gitlab.com";
      };
      "github.com" = {
        identityFile = "~/.ssh/github.com";
      };
    };
  };

  services.ssh-agent.enable = true;
}
