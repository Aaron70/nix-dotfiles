{ nixpkgs, home-manager, stylix, nvf, ... }:

let
  myLib = import ./mylib.nix;
in
{
  mkNixosFor = profile: host: system: nixpkgs.lib.nixosSystem {
    specialArgs = { inherit myLib; };
    modules =  [ 
      home-manager.nixosModules.home-manager
      stylix.nixosModules.stylix 
      { nixpkgs.overlays = [ ]; }
      ({ config, ... }: {
        config = {
          home-manager = {
            backupFileExtension = "bck";
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit myLib; };
            users."${config.profile.user.username}" = {...}: {
              imports = [ 
                nvf.homeManagerModules.default
                ../profiles/${profile}/home.nix
                ../hosts/${host}/home.nix 

                ../features/home
                ../modules/home
              ];
            };
          };
        };
      })

      ../features/nixos
      ../modules/nixos

      ../hosts/${host}/configuration.nix
      ../hosts/${host}/hardware-configuration.nix

      ../profiles/${profile}/nixos.nix
    ];
  };
}
