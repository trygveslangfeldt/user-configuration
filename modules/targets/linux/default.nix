{ nixpkgs, nixgl, home-manager, ... }:
let
  pkgs = import nixpkgs {
    system = "x86_64-linux";
    overlays = [ nixgl.overlay ];
  };
  username = "trygve";
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

  baarch = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [ ./home.nix ];
    extraSpecialArgs = {
      username = "${username}";
      configuration = "baarch";
      isLaptop = true;
      displays = [ "eDP-1" "DP-1-8" "DP-1-6-8"];
    };
  };



  laptopWork = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [ ./home.nix ];
    extraSpecialArgs = {
      username = "${username}";
      configuration = "laptopWork";
      isLaptop = true;
      displays = [ "DP-2" "DP-3"];
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
