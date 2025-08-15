{ config, lib, ... }:

let
  devCfg = config.homePrograms.development; 
  cfg = devCfg.lazydocker;
in
  with lib;
{
  options.homePrograms.development.lazydocker = {
    enable = mkEnableOption "Whether to enable lazydocker";
  };

  config = mkIf cfg.enable {
    programs.lazydocker =  {
      enable = true;
    };
  };
}
