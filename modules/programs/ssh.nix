{ config, pkgs, profile, ... }:

{
  home.packages = [
    pkgs.openssh
  ];

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/${profile.ssh}";
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
