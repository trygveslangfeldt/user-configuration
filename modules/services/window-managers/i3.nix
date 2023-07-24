{ config, lib, pkgs, ... }:

with lib;

let
  mod = "Mod4";
  alt = "Mod1";
  i3 = {
    ws1 = "1:chromium";
    ws2 = "2:console";
    ws3 = "3:gvim";
    ws4 = "4:gvim";
    ws5 = "5:console";
    ws6 = "6:message";
    ws7 = "7:chromium";
    ws8 = "8:console";
    ws9 = "9:ssh";
    ws10 = "10:email";
    ws11 = "11:share";
    ws12 = "12:share";
    mon1 = "eDP-1";
  };
in {
  imports = [
    ./../../programs/conky/conky.nix
  ];

  home.packages = [
    pkgs.rofi
    pkgs.scrot
    pkgs.i3lock
    pkgs.i3status
  ];

  xsession = {
    windowManager.i3 = {
      enable = true;
      config = {
        modifier = mod;
        floating = {
          modifier = alt;
        };
        fonts = {
          names = [ "Liberation Mono" ];
          size = 11.0;
        };
        window = {
          border = 3;
        };
        floating = {
          border = 3;
          criteria = [
            { "class" = "app"; }
            { "class" = "Wine"; }
            { "class" = "QtQmlViewer"; }
          ];
        };
        # assings = {
          # "${i3.ws6}" = [
            # { class = "^TelegramDesktop$"; }
            # { class = "^Slack$"; }
            # { class = "^Discord$"; }
          # ];
          # "${i3.ws9}" = [
            # { class = "^Pavucontrol$"; }
          # ];
        # };
        keybindings = {
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";
          "${mod}+t" = "exec i3-sensible-terminal";
          "${mod}+c" = "kill";
          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+r" = "restart";

          "${mod}+Insert" = "mode \"system\"";

          "${mod}+r" = "exec --no-startup-id ${pkgs.rofi}/bin/rofi -show run -terminal i3-sensible-terminal";
          "${mod}+p" = "exec --no-startup-id ${pkgs.rofi}/bin/rofi -show window -terminal i3-sensible-terminal";
          "${mod}+s" = "exec --no-startup-id ${pkgs.rofi}/bin/rofi -show ssh -terminal i3-sensible-terminal";
          "--release Print" = "exec ${pkgs.scrot} '%d.%m.%Y-%H:%M:%S.png' -e 'mkdir -p ~/screenshots && mv $f ~/screenshots'";
          "--release Shift+Print" = "exec ${pkgs.scrot} -s '%d.%m.%Y-%H:%M:%S.png' -e 'mkdir -p ~/screenshots && mv $f ~/screenshots'";
          "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume 0 +5%";
          "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume 0 -5%";
          "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute 0 toggle";
          "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute 1 toggle";

          "${mod}+Shift+i" = "move scratchpad";
          "${mod}+i" = "scratchpad show";
          "${mod}+Shift+f" = "scratchpad show, fullscreen";

          "${mod}+x" = "[urgent=latest] focus";
          "${alt}+Tab" = "focus output right";
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
  "${alt}+Shift+Tab" = "focus output left"; "${mod}+Shift+h" = "move left";

          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          "${mod}+f" = "fullscreen";
          "${mod}+${alt}+h" = "split h";
          "${mod}+${alt}+v" = "split v";
          "${mod}+${alt}+s" = "layout stacking";
          "${mod}+${alt}+t" = "layout tabbed";
          "${mod}+${alt}+o" = "layout toggle split";

          "Ctrl+b" = "workspace back_and_forth";
          "Ctrl+F1" = "workspace ${i3.ws1}, move worksapce to output ${i3.mon1}";
          "Ctrl+F2" = "workspace ${i3.ws2}, move worksapce to output ${i3.mon1}";
          "Ctrl+F3" = "workspace ${i3.ws3}, move worksapce to output ${i3.mon1}";
          "Ctrl+F4" = "workspace ${i3.ws4}, move worksapce to output ${i3.mon1}";
          "Ctrl+F5" = "workspace ${i3.ws5}, move worksapce to output ${i3.mon1}";
          "Ctrl+F6" = "workspace ${i3.ws6}, move worksapce to output ${i3.mon1}";
          "Ctrl+F7" = "workspace ${i3.ws7}, move worksapce to output ${i3.mon1}";
          "Ctrl+F8" = "workspace ${i3.ws8}, move worksapce to output ${i3.mon1}";
          "Ctrl+F9" = "workspace ${i3.ws9}, move worksapce to output ${i3.mon1}";
          "Ctrl+F10" = "workspace ${i3.ws10}, move worksapce to output ${i3.mon1}";
          "Ctrl+F11" = "workspace ${i3.ws11}, move worksapce to output ${i3.mon1}";
          "Ctrl+F12" = "workspace ${i3.ws12}, move worksapce to output ${i3.mon1}";

          "${mod}+F1" = "move container to workspace ${i3.ws1}";
          "${mod}+F2" = "move container to workspace ${i3.ws2}";
          "${mod}+F3" = "move container to workspace ${i3.ws3}";
          "${mod}+F4" = "move container to workspace ${i3.ws4}";
          "${mod}+F5" = "move container to workspace ${i3.ws5}";
          "${mod}+F6" = "move container to workspace ${i3.ws6}";
          "${mod}+F7" = "move container to workspace ${i3.ws7}";
          "${mod}+F8" = "move container to workspace ${i3.ws8}";
          "${mod}+F9" = "move container to workspace ${i3.ws9}";
          "${mod}+F10" = "move container to workspace ${i3.ws10}";
          "${mod}+F11" = "move container to workspace ${i3.ws11}";
          "${mod}+F12" = "move container to workspace ${i3.ws12}";

          "${mod}+Ctrl+F1" = "move container to workspace ${i3.ws1}, workspace ${i3.ws1}";
          "${mod}+Ctrl+F2" = "move container to workspace ${i3.ws2}, workspace ${i3.ws2}";
          "${mod}+Ctrl+F3" = "move container to workspace ${i3.ws3}, workspace ${i3.ws3}";
          "${mod}+Ctrl+F4" = "move container to workspace ${i3.ws4}, workspace ${i3.ws4}";
          "${mod}+Ctrl+F5" = "move container to workspace ${i3.ws5}, workspace ${i3.ws5}";
          "${mod}+Ctrl+F6" = "move container to workspace ${i3.ws6}, workspace ${i3.ws6}";
          "${mod}+Ctrl+F7" = "move container to workspace ${i3.ws7}, workspace ${i3.ws7}";
          "${mod}+Ctrl+F8" = "move container to workspace ${i3.ws8}, workspace ${i3.ws8}";
          "${mod}+Ctrl+F9" = "move container to workspace ${i3.ws9}, workspace ${i3.ws9}";
          "${mod}+Ctrl+F10" = "move container to workspace ${i3.ws10}, workspace ${i3.ws10}";
          "${mod}+Ctrl+F11" = "move container to workspace ${i3.ws11}, workspace ${i3.ws11}";
          "${mod}+Ctrl+F12" = "move container to workspace ${i3.ws12}, workspace ${i3.ws12}";
        };
        modes = {
          resize = {};
          system = {
            "l" = "exec --no-startup-id i3lock lock, mode \"default\"";
            "e" = "exec --no-startup-id i3-msg exit, mode \"default\"";
            "s" = "exec --no-startup-id i3lock lock && systemctl suspend, mode \"default\"";
            "h" = "exec --no-startup-id i3lock lock && systemctl hibernate, mode \"default\"";
            "r" = "exec --no-startup-id systemctl reboot, mode \"default\"";
            "Shift+s" = "exec --no-startup-id systemctl poweroff, mode \"default\"";
            "Return" = "mode \"default\"";
            "Escape" = "mode \"default\"";
          };
        };
        workspaceOutputAssign = lib.mkOptionDefault [
          {
            workspace = "${i3.ws1}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws2}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws3}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws4}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws5}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws6}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws7}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws8}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws9}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws10}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws11}";
            output = "${i3.mon1}";
          }
          {
            workspace = "${i3.ws12}";
            output = "${i3.mon1}";
          }
        ];

        bars = [
          {
            fonts = {
              names = [ "Liberation Mono" ];
              size = 11.0;
            };
            statusCommand = "conky-bar";
            mode = "dock";
            hiddenState = "show";
            trayOutput = "${i3.mon1}";
            workspaceButtons = true;
            position = "top";
            colors = {
              background = "#000000";
              statusline = "#ffffff";
              separator = "#666666";
              focusedWorkspace = {
                border = "#4c7899";
                background = "#285577";
                text = "#ffffff";
              };
              activeWorkspace = {
                border = "#333333";
                background = "#5f676a";
                text = "#ffffff";
              };
              inactiveWorkspace = {
                border = "#333333";
                background = "#222222";
                text = "#888888";
              };
              urgentWorkspace = {
                border = "#2f343a";
                background = "#900000";
                text = "#ffffff";
              };
              bindingMode = {
                border = "#2f343a";
                background = "#900000";
                text = "#ffffff";
              };
            };
          }
        ];
      };
    };
  };
}
