{ config, pkgs, ... }:

{
  config = {
    gtk = {
      enable = true;
      theme = {
        package = pkgs.gnome.gnome-themes-extra;
        name = "Adwaita:dark";
      };
      font = {
        name = "DejaVy Sans";
        size = 11;
      };
    };

    home = {
      packages = [
        pkgs.libcanberra
      ];
      sessionVariables = {
        GTK_THEME = "${config.gtk.theme.name}";
      };
    };
  };

}
