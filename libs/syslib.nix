{ nixpkgs, ... }@inputs:

let
  myLib = import ./mylib.nix;
  homeManagerFor =  profile: host: rec {
    modules = [ 
      inputs.zen-browser.homeModules.beta
      inputs.nvf.homeManagerModules.default
      ../profiles/${profile}/home.nix
      ../hosts/${host}/home.nix 

      ../features/home
      ../modules/home
    ];

    configModule = ({ config, ... }: {
      config = {
        home-manager = {
          backupFileExtension = "bck";
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit myLib; };
          users."${config.profile.user.username}" = {...}: {
            imports = modules;
          };
        };
      };
    });
  };
in
{
  mkNixosFor = profile: host: 
    let 
      homeManager = homeManagerFor profile host;
    in 
    nixpkgs.lib.nixosSystem {
      specialArgs = { inherit myLib inputs; };
      modules =  [ 
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix 
        { nixpkgs.overlays = [ ]; }
        homeManager.configModule

        ../features/nixos
        ../modules/nixos

        ../hosts/${host}/configuration.nix
        ../hosts/${host}/hardware-configuration.nix

        ../profiles/${profile}/nixos.nix
      ];
    };

  mkHomeFor = profile: host: system: 
    let 
      homeManager = homeManagerFor profile host;
    in
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs { inherit system; };
      extraSpecialArgs = { inherit myLib; };
      modules = [ 
        { nixpkgs.overlays = [ ]; }
        inputs.stylix.homeModules.stylix 
      ] ++ homeManager.modules;
    };

  mkDarwinFor = profile: host: system: 
    let 
      homeManager = homeManagerFor profile host;
    in 
    inputs.nix-darwin.lib.darwinSystem {
      system = system;
      specialArgs = { inherit myLib inputs; };
      modules = [ 
        inputs.home-manager.darwinModules.home-manager
        inputs.stylix.darwinModules.stylix
        homeManager.configModule

        ../hosts/${host}/configuration.nix
        ../profiles/${profile}/darwin.nix
      ];
    };
}
