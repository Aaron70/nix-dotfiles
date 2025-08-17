{ config, lib, ... }:

let
  cfg = config.programs.home.lazydocker;
in
  with lib;
{
  options.programs.home.lazydocker = {
    enable = mkEnableOption "Whether to enable lazydocker";
  };

  config = mkIf cfg.enable {
    programs.lazydocker =  {
      enable = true;
    };
  };
}
