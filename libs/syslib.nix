{ nixpkgs, ... }@inputs:

let
  myLib = import ./mylib.nix;
  homeManagerFor =  profile: host: {
    modules = [ 
      inputs.zen-browser.homeModules.beta
      inputs.nvf.homeManagerModules.default
      ../profiles/${profile}/home.nix
      ../hosts/${host}/home.nix 

      ../features/home
      ../modules/home
    ];
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
      ({ config, ... }: {
        config = {
          home-manager = {
            backupFileExtension = "bck";
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit myLib; };
            users."${config.profile.user.username}" = {...}: {
              imports = homeManager.modules;
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
}
