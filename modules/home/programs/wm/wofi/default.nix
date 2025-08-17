{ config, lib, pkgs, ... }:

let
  cfg = config.programs.home.wofi;
in
  with lib;
{
  options.programs.home.wofi = {
    enable = mkEnableOption "Whether to enable wofi";
  };

  config = mkIf (config.profile.withGUI && cfg.enable) {
    xdg.configFile."wofi/conf".text = readFile ./config;
    xdg.configFile."wofi/powermenu.css".text = readFile ./powermenu.css;
    xdg.configFile."wofi/style.css".text = readFile ./style.css;

    home.packages = [
      (pkgs.writeShellScriptBin "multimedia-menu" (readFile ./scripts/multimedia-menu.sh))
      (pkgs.writeShellScriptBin "power-menu" (readFile ./scripts/power-menu.sh))
    ];

    programs.wofi.enable = true;
  }; 
}
