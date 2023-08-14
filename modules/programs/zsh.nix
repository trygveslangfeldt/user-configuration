{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ls = "ls -a --color=auto";
        ll = "ls -l";
      };
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        # theme = "philips";
        plugins = [
          "gitfast"
        ];
      };
      initExtra = ''
        unset PAGER
        unset LESS
      '';
    };
    dircolors = {
      enableZshIntegration = true;
    };
  };
}
