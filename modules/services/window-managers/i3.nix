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
  workspaceForChats = (builtins.elemAt workspaces 6).workspace;
  workspaceForAudio = (builtins.elemAt workspaces 10).workspace;

  bars = import ./bar-config.nix {
    inherit config;
    inherit pkgs;
    displays = displays;
  };

in {
  imports = [
    ./../../programs/autorandr.nix
    ./../../programs/rofi.nix
    ./../../programs/i3status-rust.nix
    ./../../programs/variety/variety.nix
  ];

  home.packages = [
    pkgs.scrot
    pkgs.xxkb
    pkgs.feh
    pkgs.arandr

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
          "${workspaceForChats}" = [
            { class = "^TelegramDesktop$"; }
            { class = "^Slack$"; }
            { class = "^Discord$"; }
          ];
          "${workspaceForAudio}" = [
            { class = "^Pavucontrol$"; }
          ];
        };
        keybindings = import ./keybindings.nix {
          inherit mod alt pkgs workspaces mode_system;
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
