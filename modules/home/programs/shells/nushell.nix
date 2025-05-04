{ config, lib, ... }:

let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.nushell;
in
  with lib;
{
  options.homePrograms.shells.nushell = {
    enable = mkEnableOption "Weather to enable NuShell";
  };

  config = mkIf cfg.enable {
    programs.nushell =  {
      enable = true;

      configFile.text = ''
        $env.config.buffer_editor = "${config.homePrograms.editors.defaultEditor}"
        $env.config.show_banner = false
      '';
    };
  };
}
