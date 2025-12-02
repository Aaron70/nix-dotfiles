{ config, lib, pkgs, inputs, ... }:

with lib;
let
  cfg = config.programs.nixos.niri; 
in
{
  options.programs.nixos.niri = {
    enable = mkEnableOption "Whether to enable Niri Window Manager";
  };

  config = mkIf (config.profile.withGUI && cfg.enable) {
    programs.niri = {
      enable = true;
    };
  };
}
