{ inputs, pkgs }:

let
  myLib = import ./myLib.nix;
  nixosSpecialArgs = homeSpecialArgs;
  homeSpecialArgs = {inherit inputs myLib; };
  homeModules = [ 
    inputs.nvf.homeManagerModules.default
    inputs.zen-browser.homeModules.beta
  ];
in {
  mkSystemFor = host: let
      values = import ../hosts/${host}/values.nix;
      username = values.users.default.username;
    in inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit values; } // nixosSpecialArgs;
      modules =  [ 
        inputs.home-manager.nixosModules.home-manager 
        ../hosts/${host}/configuration.nix
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit values; } // homeSpecialArgs;
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
      extraSpecialArgs = { inherit values;  } // homeSpecialArgs;
      modules = [ ../hosts/${host}/home.nix ] ++ homeModules;
    };
}


