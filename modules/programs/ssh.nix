{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.openssh
  ];

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname= "github.com";
        identityFile = "~/.ssh/github.com";
      };
      "github-hrisnes" = {
        hostname= "github.com";
        identityFile = "~/.ssh/hrisnes";
      };
      "github-cabincrew" = {
        hostname= "github.com";
        identityFile = "~/.ssh/cabincrew";
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
