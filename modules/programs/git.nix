{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.meld
  ];

  # xdg.systemDirs.data = [
    # "\${XDG_DATA_DIRS}:${pkgs.git}/share/git/contrib/completion:"
  # ];

  programs.git = {
    enable = true;
    aliases = {
      meld = "difftool -y -t meld";
    };
    difftastic = {
      enable = true;
      background = "dark";
    };
    lfs.enable = true;
  };
}
