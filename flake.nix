{
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:guibou/nixGL";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixgl, darwin, ... }:
    let
      username = "trilla";

      linuxConfigs = import ./modules/targets/linux {
        inherit nixpkgs;
        inherit nixgl;
        inherit home-manager;
        inherit username;
      };
      darwinConfigs = import modules/targets/darwin {
        inherit nixpkgs;
        inherit home-manager;
        inherit darwin;
        inherit username;
      };
    in {
      homeConfigurations = linuxConfigs;
      darwinConfigurations = darwinConfigs;
    };
  }
