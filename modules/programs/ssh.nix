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
      "rm" = {
        user = "root";
        hostname = "10.11.99.1";
        extraOptions = {
          UserKnownHostsFile= "/dev/null";
        };
      };
    };
  };

  services.ssh-agent.enable = pkgs.stdenv.isLinux;
}
