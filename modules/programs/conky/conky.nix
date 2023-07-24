{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.conky
    (pkgs.writeShellScriptBin "conky-bar" ''
      echo '{"version":1}'
      echo '['
      echo '[],'

      exec conky -c ${config.home.homeDirectory}/.conkyrc
    '')
  ];

  home.file = {
    ".conkyrc".source = ./conkyrc;
  };
}
