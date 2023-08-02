{
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:guibou/nixGL";
  };

  outputs = { nixpkgs, home-manager, nixgl, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ nixgl.overlay ];
      };
    in {
      homeConfigurations.laptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];
	      extraSpecialArgs = {
          username = "msvetkin";
          configuration = "laptop";
          isLaptop = true;
          displays = [ "eDP-1" ];
        };
      };

      homeConfigurations.desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];
	      extraSpecialArgs = {
          username = "trilla";
          configuration = "desktop";
          isLaptop = false;
          displays = [ "HDMI-0" "DP-0" ];
        };
      };
    };
}
