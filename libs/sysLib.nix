{ inputs, pkgs }:

let
  myLib = import ./myLib.nix;

  homeManager = { 
    specialArgs = { inherit myLib;  };
    modules = [ 
      # inputs.stylix.homeModules.stylix
      inputs.nvf.homeManagerModules.default
      inputs.zen-browser.homeModules.beta
    ]; 
  };
in {
  mkSystemFor = host: inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit host inputs myLib homeManager; };
      modules =  [ 
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.home-manager 
        ../hosts/configuration.nix
      ];
    };

  mkHomeFor = host: system: inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = homeManager.specialArgs // { inherit host; };
      modules = [ ../hosts/home.nix ] ++ homeManager.modules;
    };
}


