{ lib, config, ... }:

let
  cfg = config.programs.home.zen;
in
  with lib;
{
  options.programs.home.zen = {
    enable = mkEnableOption "Whether to enable Zen Browser";
  };

  config = mkIf (cfg.enable && config.profile.withGUI) {
    programs.zen-browser = {
      enable = true;
      policies = {
        DisableAppUpdate = false;
        DisableTelemetry = true;
      };
    };
  };
}
