{ nixpkgs, home-manager, ... }:

let
  myLib = import ./mylib.nix;
in
{
  mkNixosFor = profile: host: system: nixpkgs.lib.nixosSystem {
    specialArgs = { inherit myLib; };
    modules =  [ 
      home-manager.nixosModules.home-manager
      { nixpkgs.overlays = [ ]; }

      ../features/nixos
      ({ config, ... }: {
        config = {
          home-manager = {
            backupFileExtension = "bck";
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { };
            users."${config.profile.user.username}" = {...}: {
              imports = [ 
                ../profiles/${profile}/home.nix
                ../hosts/${host}/home.nix 
              ];
            };
          };
        };
      })

      ../hosts/${host}/configuration.nix
      ../hosts/${host}/hardware-configuration.nix

      ../profiles/${profile}/nixos.nix
    ];
  };
}
