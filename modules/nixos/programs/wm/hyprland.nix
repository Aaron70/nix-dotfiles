{ config, lib, pkgs, inputs, ... }:

with lib;
let
  cfg = config.programs.nixos.hyprland; 
in
{
  options.programs.nixos.hyprland = {
    enable = mkEnableOption "Whether to enable Hyprland Window Manager";
  };

  config = mkIf (config.profile.withGUI && cfg.enable) {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = [
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    ];
  };
}
