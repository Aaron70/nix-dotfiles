{ config, lib, ... }:

let
  cfg = config.homePrograms.wofi;
in
  with lib;
{
  options.homePrograms.wofi = {
    enable = mkEnableOption "Weather to enable wofi";
  };

  config = mkIf cfg.enable {
    programs.wofi.enable = true;
  }; 
}
