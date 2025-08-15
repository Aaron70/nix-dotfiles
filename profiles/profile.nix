{ lib, ... }:

with lib;
{
  config = mkIf config.profile.enable {
    profile.user.fullname = mkDefault "Aaron Vargas";
    profile.user.username = mkDefault "aaronv";
  };

  options.profile = {
    enable = mkEnableOption "Whether to enable the profile.";

    user = mkOption {
      description = "The main user of the profile.";
      type = types.submodule {
        options = {
          fullname = mkOption { type = types.str; description = "The fullname of the user. Displayed in the session manager."; };
          username = mkOption { type = types.str; description = "The alias of the user. Used in most of the configurations."; };
          email = mkOption { type = types.str; description = "Email to login the user in different programs."; };
        };
      };
    };

  }; 
}
