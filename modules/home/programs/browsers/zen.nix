{ lib, config, ... }:

let
  cfg = config.homePrograms.browsers.zen;
in
  with lib;
{
  options.homePrograms.browsers.zen = {
    enable = mkEnableOption "Weather to enable Zen Browser";
  };

  config = mkIf cfg.enable {
    programs.zen-browser = {
      enable = true;
      policies = {
        DisableAppUpdate = true;
        DisableTelemetry = true;
      };
    };
  };
}
