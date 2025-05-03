{ inputs }:

{
  mkSystem = path: inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { };
    modules = let
        values = import path + "/values.nix";
        username = values.users.default.username;
      in [ 
      (path + "/configuration.nix")
      inputs.home-manager.nixosModules.home-manager 
      {
        home-manager.userGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import path + "/home.nix";
      }
    ];
  };

  mkHome = homeConfig: inputs.home-manager.lib.homeManagerConfiguration {
    extraSpecialArgs = { };
    modules = [ homeConfig ];
  };



  mkSystemFor = host: inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.home-manager.nixosModules.home-manager
      ../hosts/${host}/configuration.nix
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;

          extraSpecialArgs = {
            inherit inputs;
            outputs = inputs.self.outputs;
          };
          users = {
            aaronv = {...}: {
              imports = [
                ../hosts/${host}/home.nix
              ];
            };
          };
        };
      }
    ];
  };
}
