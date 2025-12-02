{ nixpkgs, extraNixosModules, extraHomeModules, ... }@inputs:

let 
  mylib = import ./mylib.nix inputs;
  homeManagerFor = host: profile: {
    specialArgs = { inherit mylib inputs; isNixos = false; isHomeManager = true; };
    modules =  [ 
      { nixpkgs.overlays = [ ]; }
      ../modules
      ../hosts/${host}/home.nix
      ../profiles/${profile}.nix
    ] ++ extraHomeModules;
  };

in
{
  mkNixosFor = host: profile:
    let
      homeManager = homeManagerFor host profile;
    in
    nixpkgs.lib.nixosSystem {
      specialArgs = { inherit mylib inputs; isNixos = true; isHomeManager = false; };
      modules =  [ 
        { nixpkgs.overlays = [ ]; }
        inputs.home-manager.nixosModules.home-manager

        ({ config,  ... }: {
          config = {
            home-manager = {
              backupFileExtension = "bck";
              # useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = homeManager.specialArgs;
              users."${config.dotfiles.profile.user.username}" = {...}: {
                imports = homeManager.modules;
              };
            };
          };
        })

        ../modules

        ../hosts/${host}/nixos.nix
        ../hosts/${host}/hardware-configuration.nix

        ../profiles/${profile}.nix

      ] ++ extraNixosModules;
    };

  mkHomeManagerFor = host: profile: system:
    let
      homeManager = homeManagerFor host profile;
    in
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs { inherit system; };
      specialArgs = homeManager.specialArgs;
      modules =  homeManager.modules;
    };
}
