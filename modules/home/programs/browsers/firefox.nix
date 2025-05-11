{ lib, config, ... }:

let
  cfg = config.homePrograms.browsers.firefox;
in
  with lib;
{
  options.homePrograms.browsers.firefox = {
    enable = mkEnableOption "Weather to enable Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
