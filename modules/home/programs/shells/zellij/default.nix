{ config, lib,  ... }@inputs:

let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.zellij;
in
  with lib;
{ 
  options.homePrograms.shells.zellij = {
    enable = mkEnableOption "Whether to enable Zellij";
  };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
    };
    xdg.configFile."zellij/config.kdl".text = import ./config.nix inputs; 
    # xdg.configFile."zellij/layouts/default.kdl".text = import ./layout.nix;
  };
}
