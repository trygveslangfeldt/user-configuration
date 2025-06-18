{ nixpkgs, home-manager, darwin, ... }:
let
  username="trygve.sigurdsson.langfeldt";

in {
  cpp = darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import ./cpp.nix;
      }
    ];
    specialArgs = {
      inherit username;
    };
  };
  web = darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import ./web.nix;
      }
    ];
    specialArgs = {
      inherit username;
    };
  };
}
