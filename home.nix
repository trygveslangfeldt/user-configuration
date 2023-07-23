{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "trilla";
  home.homeDirectory = "/home/trilla";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.vim

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/trilla/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash.enable = true;
  programs.bash.shellAliases = {
    ls = "ls -a --color=auto";
    ll = "ls -l";
  };

  programs.dircolors = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      ".7z" = "01;91";
      ".aac" = "00;96";
      ".ace" = "01;91";
      ".alz" = "01;91";
      ".arc" = "01;91";
      ".arj" = "01;91";
      ".asf" = "01;95";
      ".au" = "00;96";
      ".avi" = "01;95";
      ".bmp" = "01;95";
      ".bz2" = "01;91";
      ".bz" = "01;91";
      ".cab" = "01;91";
      ".cgm" = "01;95";
      ".cpio" = "01;91";
      ".deb" = "01;91";
      ".dl" = "01;95";
      ".dwm" = "01;91";
      ".dz" = "01;91";
      ".ear" = "01;91";
      ".emf" = "01;95";
      ".esd" = "01;91";
      ".flac" = "00;96";
      ".flc" = "01;95";
      ".fli" = "01;95";
      ".flv" = "01;95";
      ".gif" = "01;95";
      ".gl" = "01;95";
      ".gz" = "01;91";
      ".jar" = "01;91";
      ".jpeg" = "01;95";
      ".jpg" = "01;95";
      ".lha" = "01;91";
      ".lrz" = "01;91";
      ".lz" = "01;91";
      ".lz4" = "01;91";
      ".lzh" = "01;91";
      ".lzma" = "01;91";
      ".lzo" = "01;91";
      ".m2v" = "01;95";
      ".m4a" = "00;96";
      ".m4v" = "01;95";
      ".mid" = "00;96";
      ".midi" = "00;96";
      ".mjpeg" = "01;95";
      ".mjpg" = "01;95";
      ".mka" = "00;96";
      ".mkv" = "01;95";
      ".mng" = "01;95";
      ".mov" = "01;95";
      ".mp3" = "00;96";
      ".mp4" = "01;95";
      ".mp4v" = "01;95";
      ".mpc" = "00;96";
      ".mpeg" = "01;95";
      ".mpg" = "01;95";
      ".nuv" = "01;95";
      ".oga" = "00;96";
      ".ogg" = "00;96";
      ".ogm" = "01;95";
      ".ogv" = "01;95";
      ".ogx" = "01;95";
      ".opus" = "00;96";
      ".pbm" = "01;95";
      ".pcx" = "01;95";
      ".pgm" = "01;95";
      ".png" = "01;95";
      ".ppm" = "01;95";
      ".qt" = "01;95";
      ".ra" = "00;96";
      ".rar" = "01;91";
      ".rm" = "01;95";
      ".rmvb" = "01;95";
      ".rpm" = "01;91";
      ".rz" = "01;91";
      ".sar" = "01;91";
      ".spx" = "00;96";
      ".svg" = "01;95";
      ".svgz" = "01;95";
      ".swm" = "01;91";
      ".t7z" = "01;91";
      ".tar" = "01;91";
      ".taz" = "01;91";
      ".tbz" = "01;91";
      ".tbz2" = "01;91";
      ".tga" = "01;95";
      ".tgz" = "01;91";
      ".tif" = "01;95";
      ".tiff" = "01;95";
      ".tlz" = "01;91";
      ".txz" = "01;91";
      ".tz" = "01;91";
      ".tzo" = "01;91";
      ".tzst" = "01;91";
      ".vob" = "01;95";
      ".war" = "01;91";
      ".wav" = "00;96";
      ".webm" = "01;95";
      ".wim" = "01;91";
      ".wmv" = "01;95";
      ".xbm" = "01;95";
      ".xcf" = "01;95";
      ".xpm" = "01;95";
      ".xspf" = "00;96";
      ".xwd" = "01;95";
      ".xz" = "01;91";
      ".yuv" = "01;95";
      ".z" = "01;91";
      ".zip" = "01;91";
      ".zoo" = "01;91";
      ".zst" = "01;91";
      BLK = "40;93;01";
      CAP = "30;41";
      CHR = "40;93;01";
      DIR = "01;94";
      DOR = "01;95";
      EXEC = "01;92";
      LNK = "01;96";
      MHL = "00";
      MISSING = "00";
      ORPHAN = "40;91;01";
      OTHER_WRITABLE = "34;42";
      PIPE = "40;93";
      RESET = "0";
      SETGID = "30;43";
      STICKY = "01;95";
      STICKY_OTHER_WRITABLE = "37;44";
      SETUID = "37;41";
      TW = "30;42";
    };
  };
}
