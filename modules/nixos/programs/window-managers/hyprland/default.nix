{ config, lib, ... }:

let
  wmCfg = config.nixosPrograms.windowManagers; 
  cfg = wmCfg.hyprland;
in
  with lib;
{
  options.nixosPrograms.windowManagers.hyprland = {
    enable = mkEnableOption "Weather to enable Hyprland Window Manager";
  };

  config = mkIf cfg.enable {
    programs.hyprland.enable = true;
  };
}
