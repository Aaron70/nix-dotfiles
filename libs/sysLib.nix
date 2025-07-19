{ inputs }:

let
  myLib = import ./myLib.nix;

  homeManager = { 
    specialArgs = { inherit myLib; };
    modules = [ 
      inputs.nvf.homeManagerModules.default
      inputs.zen-browser.homeModules.beta
    ]; 
  };
in {
  mkSystemFor = host: inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit host inputs myLib homeManager; };
      modules =  [ 
        {
          nixpkgs.overlays = with inputs; [
          ];
        }
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.home-manager 
        ../hosts/configuration.nix
      ];
    };

  mkHomeFor = host: system: inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs;
      extraSpecialArgs = homeManager.specialArgs // { inherit host; pkgs = inputs.nixpkgs; };
      modules = [ 
        {
          nixpkgs.overlays = with inputs; [
          ];
        }
        ../hosts/home.nix 
        inputs.stylix.homeModules.stylix 
      ] ++ homeManager.modules;
    };
}


