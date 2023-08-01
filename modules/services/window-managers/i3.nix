{ config, lib, pkgs, displays, ... }:

with lib;

let
  mod = "Mod4";
  alt = "Mod1";
  mode_system = "System (l) lock, (e) exit, (s) suspend, (h) hibernate, (r) reboot, (S) Shutdown";
  workspaces = import ./workspace-config.nix {
    inherit lib;
    displays = displays;
  };

  bars = import ./bar-config.nix {
    inherit config;
    inherit pkgs;
    displays = displays;
  };

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
in {
  imports = [
    ./../../programs/rofi.nix
    ./../../programs/i3status-rust.nix
    ./../../programs/variety/variety.nix
  ];

  home.packages = [
    pkgs.scrot
    pkgs.xxkb
    pkgs.feh

    # exec command for lightdm /usr/share/xsessions/nix-i3.desktop
    # empty because lightdm source .xprofile which starts i3
    (pkgs.writeShellScriptBin "i3-session-target" ''
    '')
  ];

  xsession = {
    enable = true;
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
          titlebar = false;
          border = 3;
        };
        floating = {
          titlebar = false;
          border = 3;
          criteria = [
            { "class" = "app"; }
            { "class" = "Wine"; }
            { "class" = "QtQmlViewer"; }
          ];
        };
        gaps = {
          inner = 6;

          smartBorders = "on";
          smartGaps = true;

          outer = 2;
        };
        assigns = {
          "${ws6}" = [
            { class = "^TelegramDesktop$"; }
            { class = "^Slack$"; }
            { class = "^Discord$"; }
          ];
          "${ws9}" = [
            { class = "^Pavucontrol$"; }
          ];
        };
        keybindings = {
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";
          "${mod}+t" = "exec i3-sensible-terminal";
          "${mod}+c" = "kill";
          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+r" = "restart";

          "${mod}+Insert" = "mode \"${mode_system}\"";

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
          "Ctrl+F1" = "workspace ${ws1}";
          "Ctrl+F2" = "workspace ${ws2}";
          "Ctrl+F3" = "workspace ${ws3}";
          "Ctrl+F4" = "workspace ${ws4}";
          "Ctrl+F5" = "workspace ${ws5}";
          "Ctrl+F6" = "workspace ${ws6}";
          "Ctrl+F7" = "workspace ${ws7}";
          "Ctrl+F8" = "workspace ${ws8}";
          "Ctrl+F9" = "workspace ${ws9}";
          "Ctrl+F10" = "workspace ${ws10}";
          "Ctrl+F11" = "workspace ${ws11}";
          "Ctrl+F12" = "workspace ${ws12}";

          "${mod}+F1" = "move container to workspace ${ws1}";
          "${mod}+F2" = "move container to workspace ${ws2}";
          "${mod}+F3" = "move container to workspace ${ws3}";
          "${mod}+F4" = "move container to workspace ${ws4}";
          "${mod}+F5" = "move container to workspace ${ws5}";
          "${mod}+F6" = "move container to workspace ${ws6}";
          "${mod}+F7" = "move container to workspace ${ws7}";
          "${mod}+F8" = "move container to workspace ${ws8}";
          "${mod}+F9" = "move container to workspace ${ws9}";
          "${mod}+F10" = "move container to workspace ${ws10}";
          "${mod}+F11" = "move container to workspace ${ws11}";
          "${mod}+F12" = "move container to workspace ${ws12}";

          "${mod}+Ctrl+F1" = "move container to workspace ${ws1}, workspace ${ws1}";
          "${mod}+Ctrl+F2" = "move container to workspace ${ws2}, workspace ${ws2}";
          "${mod}+Ctrl+F3" = "move container to workspace ${ws3}, workspace ${ws3}";
          "${mod}+Ctrl+F4" = "move container to workspace ${ws4}, workspace ${ws4}";
          "${mod}+Ctrl+F5" = "move container to workspace ${ws5}, workspace ${ws5}";
          "${mod}+Ctrl+F6" = "move container to workspace ${ws6}, workspace ${ws6}";
          "${mod}+Ctrl+F7" = "move container to workspace ${ws7}, workspace ${ws7}";
          "${mod}+Ctrl+F8" = "move container to workspace ${ws8}, workspace ${ws8}";
          "${mod}+Ctrl+F9" = "move container to workspace ${ws9}, workspace ${ws9}";
          "${mod}+Ctrl+F10" = "move container to workspace ${ws10}, workspace ${ws10}";
          "${mod}+Ctrl+F11" = "move container to workspace ${ws11}, workspace ${ws11}";
          "${mod}+Ctrl+F12" = "move container to workspace ${ws12}, workspace ${ws12}";
        };
        modes = {
          resize = {};
          "${mode_system}" = {
            "l" = "exec --no-startup-id i3lock lock, mode \"default\"";
            "e" = "exec --no-startup-id ${pkgs.i3}/bin/i3-msg exit, mode \"default\"";
            "s" = "exec --no-startup-id i3lock lock && systemctl suspend, mode \"default\"";
            "h" = "exec --no-startup-id i3lock lock && systemctl hibernate, mode \"default\"";
            "r" = "exec --no-startup-id systemctl reboot, mode \"default\"";
            "Shift+s" = "exec --no-startup-id systemctl poweroff, mode \"default\"";
            "Return" = "mode \"default\"";
            "Escape" = "mode \"default\"";
          };
        };

        workspaceOutputAssign = lib.mkOptionDefault workspaces;

        bars = bars;

        startup = [
          { command = "xxkb"; notification = false; }
          { command = "xset b off"; notification = false; }
          { command = "sleep 10s && ${pkgs.variety}/bin/variety --next"; notification = false; }
          { command = "xfce4-power-manager"; notification = false; }
          { command = "xfce4-power-manager-setting"; notification = false; }
        ];
      };
    };
  };
}
