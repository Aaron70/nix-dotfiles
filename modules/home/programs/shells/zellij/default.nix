{ config, lib, ... }:

let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.zellij;
in
  with lib;
{ 
  options.homePrograms.shells.zellij = {
    enable = mkEnableOption "Weather to enable Zellij";
  };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
    };
    xdg.configFile."zellij/config.kdl".text = builtins.readFile ./config.kdl;
  };
}
