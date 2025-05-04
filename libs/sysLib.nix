{ inputs, pkgs }:

let
  myLib = import ./myLib.nix;
  homeModules = [ 
    inputs.nvf.homeManagerModules.default
  ];
in {
  mkSystemFor = host: let
      values = import ../hosts/${host}/values.nix;
      username = values.users.default.username;
    in inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit values; };
      modules =  [ 
        inputs.home-manager.nixosModules.home-manager 
        ../hosts/${host}/configuration.nix
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs values myLib;
            };
            users."${username}" = {...}: {
              imports = [ ../hosts/${host}/home.nix ] ++ homeModules;
            };
          };
        }
      ];
    };

  mkHomeFor = host: system:  let
      values = import ../hosts/${host}/values.nix;
    in inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs values myLib;  };
      modules = [ ../hosts/${host}/home.nix ] ++ homeModules;
    };
}


