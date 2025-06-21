{ lib, config, ... }:

let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.eza;
in
  with lib;
{
  options.homePrograms.shells.eza = {
    enable = mkOption {
      type = types.bool;
      # TODO: When add more supported shells, you must added here: 
      # Example: enable = shellsCfg.nushell.enable || shellsCfg.zsh.enable;
      default = shellsCfg.nushell.enable || shellsCfg.zsh.enable;
      description= "Whether to enable eza";
    };
  };

  
  config = mkIf cfg.enable {
    programs.eza = {
      enable = true;
      icons = "auto";
      git = true;


      enableBashIntegration = false;
      enableZshIntegration = shellsCfg.zsh.enable;
      enableNushellIntegration = shellsCfg.nushell.enable;
    };
  };
}
