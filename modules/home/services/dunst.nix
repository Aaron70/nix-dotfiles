{ lib, config, ... }:

let
  cfg = config.homeServices.dunst;
in
  with lib;
{
  options.homeServices.dunst = {
    enable = mkEnableOption "Whether to enable Dunst";
  };

  config = mkIf cfg.enable {
    services.dunst.enable = true;
  };
}
