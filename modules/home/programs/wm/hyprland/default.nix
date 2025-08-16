{ lib, config, ... }:

with lib;
{
  imports = [ ./variants ];    

  config = mkIf config.programs.home.hyprland.enable {
    programs.home.hyprland.hyprpaper.enable = true;
  };

  options.programs.home.hyprland = {
    enable = mkEnableOption "Whether to enable the Hyprland.";
    hyprpaper.enable = mkEnableOption "Whether to enable the Hyprpaper."; # TODO: Make hyprpaper a module with an enable option
    variant = mkOption {
      description = "The name of the variant to use its configuration.";
      type = types.str;
      default = "default";
    };
  };
}
