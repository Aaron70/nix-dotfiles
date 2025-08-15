{ inputs }:

let
  hostsPath = ../hosts;
  profilesPath = ../profiles;

  homeManager = { 
    specialArgs = { };
    modules = [ 
      inputs.nvf.homeManagerModules.default
      inputs.zen-browser.homeModules.beta
    ]; 
  };
in
{
  mkNixosFor = profile: host: system: inputs.nixpkgs.lib.nixosSystem {
    system = system;
    specialArgs = inputs // { inherit homeManager; };
    modules = [
      # NixOS Modules
      inputs.stylix.nixosModules.stylix
      inputs.home-manager.nixosModules.home-manager 

      # Common configurations
      {
        nixpkgs.overlays = with inputs; [];
        programs.home-manager.enable = true;
        home-manager = {
          backupFileExtension = "bck";
          useGlobalPkgs = true;
          useUserPackages = true;
        };
      }

      # Files to override configurations for specific hosts
      # Usually, all except hardware-configuration.nix are empty 
      ./${hostsPath}/${host}/hardware-configuration.nix
      ./${hostsPath}/${host}/configuration.nix
      ./${hostsPath}/${host}/home.nix

      # Files with the profile configurations (programs, services, etc...) 
      # Usually, contains most of the configuration.
      # Useful to have separated configuration profiles like each one running different
      # window managers, editors or simply different configuration like for gaming or development
      ./${profilesPath}/${profile}/values.nix
      ./${profilesPath}/${profile}/home.nix
      ./${profilesPath}/${profile}/nixos.nix
    ];
  }; 


  mkHomeFor = profile: host: system: inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs;
    extraSpecialArgs = homeManager.specialArgs // { pkgs = inputs.nixpkgs; };
    modules = [ 
      { nixpkgs.overlays = with inputs; [ ]; }
      inputs.stylix.homeModules.stylix # It can't go in the homeManager.modules because is already added in the nixosModules


      # Files to override configurations for specific hosts
      # Usually, all except hardware-configuration.nix are empty 
      ./${hostsPath}/${host}/home.nix

      # Files with the profile configurations (programs, services, etc...) 
      # Usually, contains most of the configuration.
      # Useful to have separated configuration profiles like each one running different
      # window managers, editors or simply different configuration like for gaming or development
      ./${profilesPath}/${profile}/values.nix
      ./${profilesPath}/${profile}/home.nix

    ] ++ homeManager.modules;
  }; 

  mkDarwinFor = {}; 
}
