{ config, pkgs, ... }:

{

  home.packages = [
    pkgs.meld
  ];

  programs.git = {
    enable = true;
    aliases = {
      meld = "difftool -y -t meld";
    };
  };
}
