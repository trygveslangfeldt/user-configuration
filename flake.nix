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
      username = "trilla";

      linuxConfigs = import ./modules/targets/linux {
        inherit nixpkgs;
        inherit nixgl;
        inherit home-manager;
        inherit username;
      };
    in {
      homeConfigurations = linuxConfigs;
    };
}
