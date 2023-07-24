{ config, pkgs, ... }:

{
  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.bash.shellAliases = {
    ls = "ls -a --color=auto";
    ll = "ls -l";
  };
  programs.dircolors.enableBashIntegration = true;
}
