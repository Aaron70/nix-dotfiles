{ lib, config, ... }:

let
  cfg = config.homeServices.dunst;
in
  with lib;
{
  options.homeServices.dunst = {
    enable = mkEnableOption "Weather to enable Dunst";
  };

  config = mkIf cfg.enable {
    services.dunst.enable = true;
  };
}
