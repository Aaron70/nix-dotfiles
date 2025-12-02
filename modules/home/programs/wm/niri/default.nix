{ lib, config, pkgs, ... }:

let
  cfg = config.programs.home.niri;
in
  with lib;
{
  options.programs.home.niri = {
    enable = mkEnableOption "Whether to enable Niri Window Manager";
  };

  config = mkIf cfg.enable { 
   xdg.configFile."niri/config.kdl".text = lib.readFile ./config.kdl;
   home.packages = [
    pkgs.fuzzel
   ];
  };
}
