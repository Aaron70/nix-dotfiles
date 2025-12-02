{ lib, config, ... }:

let
  cfg = config.programs.home.niri;
in
  with lib;
{
  options.programs.home.niri = {
    enable = mkEnableOption "Whether to enable Niri";
  };
                                                                                                
  config = mkIf cfg.enable { 
   programs = {
      niri = {
        enable = true;
        config = lib.readFile ./config2.kdl;
      };
    };
  };
}
