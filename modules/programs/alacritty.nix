{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.alacritty
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
    TERMINAL = "alacritty";
  };
}
