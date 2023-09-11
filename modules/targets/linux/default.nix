{ nixpkgs, nixgl, home-manager, username, ... }:
let
  pkgs = import nixpkgs {
    system = "x86_64-linux";
    overlays = [ nixgl.overlay ];
  };
in
{
  laptop = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [ ./home.nix ];
    extraSpecialArgs = {
      username = "${username}";
      configuration = "laptop";
      isLaptop = true;
      displays = [ "eDP-1" ];
    };
  };
  
  laptopWithMonitors = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [ ./home.nix ];
    extraSpecialArgs = {
      username = "${username}";
      configuration = "laptopWithMonitors";
      isLaptop = true;
      displays = [ "eDP-1" "DP-3-2" "DP-3-3"];
    };
  };

  desktop = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [ ./home.nix ];
    extraSpecialArgs = {
      username = "${username}";
      configuration = "desktop";
      isLaptop = false;
      displays = [ "HDMI-0" "DP-0" ];
    };
  };
}
