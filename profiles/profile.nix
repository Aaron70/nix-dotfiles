{ lib, config, ... }:

with lib;
let
  packageType = types.submodule {
    description = "Holds the information of a package like the name, path and command to run it";
    options = {
      display = mkOption { 
        description = "The display name of the package. Not necessarily the name of the command. E.g: Neovim.";
        type = types.str; 
        default = name;
      };
      name = mkOption { 
        description = "The name of the command used to execute the package. E.g: nvim.";
        type = types.str; 
      };
      path = mkOption { 
        description = "The nix path to where the package is stored.";
        type = types.str;
      };
    };
  };
in
{
  config = mkIf config.profile.enable {
    profile.user.fullname = mkDefault "Aaron Vargas";
    profile.user.username = mkDefault "aaronv";

    profile.version = "24.11";
  };

  options.profile = {
    enable = mkEnableOption "Whether to enable the profile.";

    withGUI = mkEnableOption "Whether to enable programs, services or configurations that required GUI.";

    version = mkOption {
      description = "The version of the Nix channels.";
      type = types.str;
    };

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

    terminal = mkOption { 
      description = "The default terminal.";
      type = packageType;
    }; 
  }; 
}
