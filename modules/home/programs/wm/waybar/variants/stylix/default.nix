{ config, lib, ... }:

with lib;
let
  cfg = config.programs.home.waybar;
  colors = config.lib.stylix.colors;
in
  with lib;
{
  options.homePrograms.windowManagers.waybar = {
    enable = mkEnableOption "Whether to enable waybar";
  };

  config = mkIf (config.profile.withGUI && cfg.enable && cfg.variant == "stylix") {
    xdg.configFile."waybar/config.jsonc".text = import ./config.nix { inherit colors; }; 
    xdg.configFile."waybar/style.css".text = import ./style.nix { inherit colors; };
    programs.waybar = {
      enable = true;
    };
  };
}
