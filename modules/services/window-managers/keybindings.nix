# keybindings.nix

{ mod, alt, pkgs,mode_system , workspaces, ... }:

let
  dynamicKeybindings = builtins.listToAttrs (builtins.genList (i: {
    name = "Ctrl+F" +  toString (i + 1);
    value = "workspace " + (builtins.elemAt workspaces i).workspace;
  }) (builtins.length workspaces)) //

  builtins.listToAttrs (builtins.genList (i: {
    name = "${mod}+F" +  toString (i + 1);
    value = "move container to workspace " + (builtins.elemAt workspaces i).workspace;
  }) (builtins.length workspaces)) //

  builtins.listToAttrs (builtins.genList (i: {
    name = "${mod}+Ctrl+F" +  toString (i + 1);
    value = "move container to workspace" + (builtins.elemAt workspaces i).workspace + ", workspace " + (builtins.elemAt workspaces i).workspace;
  }) (builtins.length workspaces));

in
{
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

} // dynamicKeybindings # Integrating the dynamic keybindings into the main configuration
