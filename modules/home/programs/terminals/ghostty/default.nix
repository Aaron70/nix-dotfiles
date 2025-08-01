{ lib, config, ... }:

let
  terminalsCfg = config.homePrograms.terminals; 
  cfg = terminalsCfg.ghostty;
in
  with lib;
{
  options.homePrograms.terminals.ghostty = {
    enable = mkEnableOption "Whether to enable Ghostty";
  };

  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
    };
  };
}
