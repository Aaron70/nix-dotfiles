{ inputs }:

{
  mkSystemFor = host: inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { };
    modules = let
        values = import ../hosts/${host}/values.nix;
        username = values.users.default.username;
      in [ 
      inputs.home-manager.nixosModules.home-manager 
      ../hosts/${host}/configuration.nix
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs;
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

  mkHome = homeConfig: inputs.home-manager.lib.homeManagerConfiguration {
    extraSpecialArgs = { };
    modules = [ homeConfig ];
  };
}
