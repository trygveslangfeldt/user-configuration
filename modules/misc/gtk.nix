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
        pkgs.libcanberra-gtk3
      ];
      sessionVariables = {
        GTK_THEME = "${config.gtk.theme.name}";
        GTK_PATH = "${pkgs.libcanberra-gtk3}/lib/gtk-3.0\${GTK_PATH:+:\$GTK_PATH}";
      };
    };
  };

}
