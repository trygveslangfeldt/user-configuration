{ config, pkgs, ... }:
let
  vimCommon = import ./common.nix {
    inherit pkgs;
  };
in {
  programs.neovim = vimCommon // {
    vimAlias = true;
    extraConfig = vimCommon.extraConfig + ''
      let g:neovide_cursor_animation_length = 0
      let g:neovide_cursor_trail_size = 0
    '';
  };

  home.packages = [
    pkgs.neovide
  ];

  programs.zsh.shellAliases = {
    gvim = "${pkgs.neovide}/bin/neovide";
  };
}
