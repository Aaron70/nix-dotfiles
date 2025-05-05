{ config, lib, pkgs, ... }:

let
  wmCfg = config.homePrograms.windowManagers; 
  cfg = wmCfg.i3;
in
  with lib;
{
  options.homePrograms.windowManagers.i3 = {
    enable = mkEnableOption "Weather to enable Sway Window Manager";
  };

  config = mkIf cfg.enable {
    xdg.configFile."i3/config".text = builtins.readFile ./config;
    services.gnome-keyring.enable = true;
    xsession.windowManager.i3 = {
      enable = true;
    };

    xdg.configFile."picom/picom.conf".text = builtins.readFile ./picom.conf;
    services.picom.enable = true;
  };
}
