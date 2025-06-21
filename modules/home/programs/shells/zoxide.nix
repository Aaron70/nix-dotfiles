{ lib, config, ... }:

let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.zoxide;
in
  with lib;
{
  options.homePrograms.shells.zoxide = {
    enable = mkEnableOption "Whether to enable Zoxide";
  };


  config = mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableNushellIntegration = shellsCfg.nushell.enable;
      enableZshIntegration = shellsCfg.zsh.enable;
      options = [ "--cmd" "cd" ];
    };
  };
}
