{ config, pkgs, ... }:

{
  config = {
    gtk = {
      enable = true;
      theme = {
        package = pkgs.gnome.gnome-themes-extra;
        name = "Adwaita:dark";
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
