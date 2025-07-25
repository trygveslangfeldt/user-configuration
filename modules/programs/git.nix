{ config, pkgs, profile, ... }:

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
      s = "status";
      co = "checkout";
    };
    difftastic = {
      enable = true;
      background = "dark";
    };
    lfs.enable = true;
    userName = profile.userName;
    userEmail = profile.userEmail;
  };
}
