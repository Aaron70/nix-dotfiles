{ lib, config, ... }:

let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.zoxide;
in
  with lib;
{
  options.homePrograms.shells.zoxide = {
    enable = mkEnableOption "Weather to enable Zoxide";
  };


  config = mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableNushellIntegration = shellsCfg.nushell.enable;
      options = [ "--cmd" "cd" ];
    };
  };
}
