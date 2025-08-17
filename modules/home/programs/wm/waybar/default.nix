{ lib, config, ... }:

with lib;
{
  imports = [ ./variants ];    

  options.programs.home.waybar = {
    enable = mkEnableOption "Whether to enable the Waybar.";
    variant = mkOption {
      description = "The name of the variant to use its configuration.";
      type = types.str;
      default = "default";
    };
  };
}
