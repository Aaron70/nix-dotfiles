{ config, lib, pkgs, ... }:

let
  wmCfg = config.homePrograms.windowManagers; 
  cfg = wmCfg.sway;
in
  with lib;
{
  options.homePrograms.windowManagers.sway = {
    enable = mkEnableOption "Weather to enable Sway Window Manager";
  };

  config = mkIf cfg.enable {
    xdg.configFile."sway/config".text = builtins.readFile ./config;
    services.gnome-keyring.enable = true;
    wayland.windowManager.sway = {
      enable = true;
      package = pkgs.swayfx;
      wrapperFeatures.gtk = true;
      # config = rec {
      #   modifier = "Mod1";
      #   # Use kitty as default terminal
      #   terminal = config.homePrograms.terminals.default; 
      #   startup = [
      #     # Launch Firefox on start
      #     {command = "firefox";}
      #   ];
      # };
    };
  };
}
