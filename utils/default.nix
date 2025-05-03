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
}
