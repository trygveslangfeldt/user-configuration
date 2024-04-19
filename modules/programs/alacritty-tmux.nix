{ config, pkgs, lib, ... }:
let
  tmuxConf = pkgs.writeText "tmux.conf" ''
      # Key bindings and other configurations
      bind -n M-h select-window -t :-
      bind -n M-l select-window -t :+
      bind -n M-n new-window
    '';
in
{
  home.packages = [
    pkgs.alacritty
    pkgs.tmux
  ];

  #home.file.".tmux.conf".source = tmuxConf;

  programs.tmux = {
    enable = true;
    clock24 = false;
    extraConfig = ''
    # Use Alt-h and Alt-l for moving left and right between windows
    bind -n M-h select-window -t :-
    bind -n M-l select-window -t :+
    bind -n M-n new-window
  '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Liberation Mono";
        };
        size = 18;
      };

      window = {
        startup_mode = "SimpleFullScreen";
      };

      keyboard.bindings = [
        { key = "Escape"; mods = "Alt"; action = "ToggleViMode"; }
        { key = "P"; mods ="Alt"; action = "Paste"; }

        { key = "F"; mods ="Alt"; action = "ToggleSimpleFullscreen"; }
        { key = "N"; mods = "Alt"; action = "CreateNewTab"; }
        { key = "L"; mods = "Alt"; action = "SelectNextTab"; }
        { key = "H"; mods = "Alt"; action = "SelectPreviousTab"; }

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
