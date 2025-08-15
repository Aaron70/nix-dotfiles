{config, lib, ...}: 

with lib;
let
  cfg = config.modules.nixos.homeManager;
in
{
  options.modules.nixos.homeManager = {
    enable = mkEnableOption "Whether to enable homeManager module.";
    username = mkOption {
      type = types.str;
      description = "The name of the user to import the modules to.";
      default = config.profile.user.username;
    };
    profileName = mkOption {
      type = types.str;
      description = "The name of the profile to use.";
    };
    hostName = mkOption {
      type = types.str;
      description = "The name of the host to use.";
    };
  };

  config = mkIf cfg.enable {
    home-manager = {
      backupFileExtension = "bck";
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { };
      users."${cfg.username}" = {...}: {
        imports = [ 
          ../../profiles/${cfg.profileName}/home.nix
          ../../hosts/${cfg.hostName}/home.nix 
        ];
      };
    };
  };
}
