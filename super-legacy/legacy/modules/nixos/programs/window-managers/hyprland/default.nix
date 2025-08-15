{ config, lib, inputs, pkgs, ... }:

let
  wmCfg = config.nixosPrograms.windowManagers; 
  cfg = wmCfg.hyprland;
in
  with lib;
{
  options.nixosPrograms.windowManagers.hyprland = {
    enable = mkEnableOption "Whether to enable Hyprland Window Manager";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };


    environment.systemPackages = [
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    ];
  };
}
