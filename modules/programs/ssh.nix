{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.openssh
  ];

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "gh-rm" = {
        identityFile = "~/.ssh/gh-rm";
      };
      "gh-cc" = {
        identityFile = "gh-cc";
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
