{ nixpkgs, ... }@inputs:

let
  myLib = import ./mylib.nix;
in
{
  mkNixosFor = profile: host: system: nixpkgs.lib.nixosSystem {
    specialArgs = { inherit myLib inputs; };
    modules =  [ 
      inputs.home-manager.nixosModules.home-manager
      inputs.stylix.nixosModules.stylix 
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
                inputs.zen-browser.homeModules.beta
                inputs.nvf.homeManagerModules.default
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
