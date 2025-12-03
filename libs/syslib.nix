{ nixpkgs, extraNixosModules, extraHomeModules, ... }@inputs:

let 
  mylib = import ./mylib.nix inputs;
  homeManagerFor = flake: host: profile: {
    specialArgs = { inherit mylib inputs; flakeName = flake; isNixos = false; isHomeManager = true; };
    modules =  [ 
      { nixpkgs.overlays = [ ]; }
      ../features
      ../modules
      ../hosts/${host}/home.nix
      ../profiles/${profile}.nix
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

        ../features
        ../modules

        ../hosts/${host}/nixos.nix
        ../hosts/${host}/hardware-configuration.nix

        ../profiles/${profile}.nix

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
