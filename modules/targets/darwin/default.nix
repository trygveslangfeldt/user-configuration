{ nixpkgs, home-manager, darwin, ... }:
let
  username="trygve.sigurdsson.langfeldt";

in {
  work = darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import ./cpp.nix;
        home-manager.extraSpecialArgs = {
          profile= {
            ssh = "gh-rm";
            userName = "Trygve Sigurdsson Langfeldt";
            userEmail = "trygve.sigurdsson.langfeldt@remarkable.no";
          };
        };
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
        home-manager.extraSpecialArgs = {
          profile= {
            ssh = "cabincrew";
            userName = "Trygve Sigurdsson Langfeldt";
            userEmail = "trygvelangfeldt@outlook.com";
          };
        };
      }
    ];
    specialArgs = {
      inherit username;
    };
  };
}
