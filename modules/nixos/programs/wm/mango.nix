{ config, lib, pkgs, inputs, ... }:

with lib;
let
  cfg = config.programs.nixos.mango; 
in
{
  options.programs.nixos.mango = {
    enable = mkEnableOption "Whether to enable Mango Window Manager";
  };

  config = mkIf (config.profile.withGUI && cfg.enable) {
    programs.mango = {
      enable = true;
    };
  };
}
