{ lib, config, ... }:

let
  terminalsCfg = config.homePrograms.terminals; 
  cfg = terminalsCfg.kitty;
in
  with lib;
{
  options.homePrograms.terminals.kitty = {
    enable = mkEnableOption "Whether to enable Kitty";
  };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
    };
  };
}
