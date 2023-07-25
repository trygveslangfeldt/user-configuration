{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.bash-completion
  ];

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ls = "ls -a --color=auto";
        ll = "ls -l";
      };
      bashrcExtra = ''
        PS1='\[\e[1;92m\]\u\[\e[1;93m\]@\[\e[1;95m\]\h \[\e[1;94m\]\w \[\e[1;92m\]\$\[\e[0m\] '
      '';
    };
    dircolors = {
      enableBashIntegration = true;
    };
  };
}
