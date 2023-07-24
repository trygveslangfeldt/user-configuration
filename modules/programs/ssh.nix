{ config, pkgs, ... }:

{
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
}
