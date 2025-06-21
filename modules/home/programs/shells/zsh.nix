{ config, lib, ... }:

let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.zsh;
in
  with lib;
{
  options.homePrograms.shells.zsh = {
    enable = mkEnableOption "Whether to enable Zsh";
  };

  config = mkIf cfg.enable {
    programs.zsh =  {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
