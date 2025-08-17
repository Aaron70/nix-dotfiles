{ lib, config, ... }:

with lib;
let
  cfg = config.services.home.stylix;
in
{
  options.services.home.stylix = {
    enable = mkEnableOption "Whether to enable stylix.";
  };

  config = mkIf cfg.enable {
    stylix = {
      targets = {
        waybar.enable = false;
      };
    };
  };
}
