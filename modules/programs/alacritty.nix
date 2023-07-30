{ config, pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "nix-alacritty" ''
      nix run --impure github:guibou/nixGL -- ${pkgs.alacritty}/bin/alacritty
    '')
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Liberation Mono";
        };
        size = 11;
      };

      # Colors (Modified Gruvbox dark)
      # colors = {
        # # Default colors
        # primary = {
          # # hard contrast: background = '#1d2021'
          # background = "#1e272b";
          # # soft contrast: background = '#32302f'
          # foreground = "#ead49b";
        # };

        # # Normal colors
        # normal = {
          # black = "#282828";
          # red = "#cc241d";
          # green = "#98971a";
          # yellow = "#d79921";
          # blue = "#458588";
          # magenta = "#b16286";
          # cyan = "#689d6a";
          # white = "#a89984";

        # };
        # # Bright colors
        # bright = {
          # black = "#928374";
          # red = "#fb4934";
          # green = "#b8bb26";
          # yellow = "#fabd2f";
          # blue = "#83a598";
          # magenta = "#d3869b";
          # cyan = "#8ec07c";
          # white = "#ebdbb2";
        # };
      # };

      # cursor = {
        # vi_mode_style = "Underline";
      # };

      key_bindings = [
        { key = "T"; mods = "Control|Shift"; action = "SpawnNewInstance"; }
        { key = "Escape"; mods = "Alt"; action = "ToggleViMode"; }
        { key = "H"; mode = "Vi"; action = "Left"; }
        { key = "J"; mode = "Vi"; action = "Down"; }
        { key = "K"; mode = "Vi"; action = "Up"; }
        { key = "L"; mode = "Vi"; action = "Right"; }
      ];

      env = {
        # Better color support in some apps
        TERM = "xterm-256color";
      };

    };
  };

  home.sessionVariables = {
    TERMINAL = "nix-alacritty";
  };
}
