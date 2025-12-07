{ nixpkgs, extraNixosModules, extraHomeModules, ... }@inputs:

let 
  mylib = import ./mylib.nix inputs;
  homeManagerFor = flake: host: profile: {
    specialArgs = { inherit mylib inputs; flakeName = flake; isNixos = false; isHomeManager = true; };
    modules =  [ 
      { nixpkgs.overlays = [ ]; }
      ../profiles/${profile}.nix

      ../features
      ../modules

      ../hosts/${host}/configuration.nix
    ] ++ extraHomeModules;
  };

in
{
  mkNixosFor = flake: host: profile:
    let
      homeManager = homeManagerFor flake host profile;
    in
    nixpkgs.lib.nixosSystem {
      specialArgs = { inherit mylib inputs; flakeName = flake; isNixos = true; isHomeManager = false; };
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
        ../profiles/${profile}.nix

        ../features
        ../modules

        ../hosts/${host}/configuration.nix
        ../hosts/${host}/hardware-configuration.nix
      ] ++ extraNixosModules;
    };

  mkHomeManagerFor = flake: host: profile: system:
    let
      homeManager = homeManagerFor flake host profile;
    in
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs { stdenv.hostPlatform.system = system; };
      specialArgs = homeManager.specialArgs;
      modules =  [
        inputs.stylix.homeModules.stylix
      ] ++ homeManager.modules;
    };
}
