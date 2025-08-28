{ config, lib, inputs, pkgs, ... }:

let
  cfg = config.programs.home.ags;
in
  with lib;
{
  options.programs.home.ags = {
    enable = mkEnableOption "Whether to enable ags program to create desktop shells.";
  };

  config = mkIf cfg.enable {
    home.packages = [inputs.astal.packages.${pkgs.system}.default];
    programs.ags = {
      enable = true;

      # symlink to ~/.config/ags
      # configDir = ../ags;

      # additional packages and executables to add to gjs's runtime
      extraPackages = with pkgs; [
        inputs.astal.packages.${pkgs.system}.battery
      ];
    };
  };
}
