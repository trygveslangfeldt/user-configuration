{ nixpkgs, home-manager, darwin, ... }:
let
  username="trygvelangfeldt";

in {
  laptop = darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import ./home.nix;
        home-manager.extraSpecialArgs = {
          configuration = "laptop";
        };
      }
    ];
    specialArgs = {
      inherit username;
    };
  };
}
