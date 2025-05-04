{ config, lib, pkgs, inputs, ... }:

let
  wmCfg = config.nixosPrograms.windowManagers; 
  cfg = wmCfg.hyprland;
in
  with lib;
{
  options.nixosPrograms.windowManagers.hyprland = {
    enable = mkEnableOption "Weather to enable Hyprland";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;

      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
