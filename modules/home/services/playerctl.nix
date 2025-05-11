{ lib, config, ... }:

let
  cfg = config.homeServices.playerctl;
in
  with lib;
{
  options.homeServices.playerctl = {
    enable = mkEnableOption "Weather to enable Playerctl";
  };

  config = mkIf cfg.enable {
    services.playerctld.enable = true;
  };
}
