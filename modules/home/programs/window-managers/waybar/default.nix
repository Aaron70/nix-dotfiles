{ config, lib, ... }:

let
  cfg = config.homePrograms.windowManagers.waybar;
in
  with lib;
{
  options.homePrograms.windowManagers.waybar = {
    enable = mkEnableOption "Whether to enable waybar";
  };

  config = mkIf cfg.enable {
    xdg.configFile."waybar/config.jsonc".text = readFile ./config.jsonc; 
    xdg.configFile."waybar/style.css".text = readFile ./style.css;
    programs.waybar = {
      enable = true;
    };
  };
}
