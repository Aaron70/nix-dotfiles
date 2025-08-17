{ config, lib, ... }:

with lib;
let
  cfg = config.programs.home.waybar;
  colors = {
    base00 = "FFFFFF";
    base01 = "FFFFFF";
    base02 = "FFFFFF";
    base05 = "FFFFFF";
    base08 = "FFFFFF";
    base0A = "FFFFFF";
    base0B = "FFFFFF";
    base0C = "FFFFFF";
    base0D = "FFFFFF";
    base0E = "FFFFFF";
    base0F = "FFFFFF";
  };
in
  with lib;
{
  options.homePrograms.windowManagers.waybar = {
    enable = mkEnableOption "Whether to enable waybar";
  };

  config = mkIf (config.profile.withGUI && cfg.enable && cfg.variant == "default") {
    xdg.configFile."waybar/config.jsonc".text = import ./config.nix { inherit colors; }; 
    xdg.configFile."waybar/style.css".text = import ./style.nix { inherit colors; };
    programs.waybar = {
      enable = true;
    };
  };
}
