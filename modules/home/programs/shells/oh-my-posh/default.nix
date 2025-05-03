{ lib, config, ... }:

let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.oh-my-posh;
in
  with lib;
{
  options.homePrograms.shells.oh-my-posh = {
    enable = mkOption {
      type = types.bool;
      # TODO: When add more supported shells, you must added here: 
      # Example: enable = shellsCfg.nushell.enable || shellsCfg.zsh.enable;
      default = shellsCfg.nushell.enable;
      description= "Weather to enable OhMyPosh";
    };
  };

  
  config = mkIf cfg.enable {
    programs.oh-my-posh = {
      enable = true;

      settings = with builtins; fromJSON (unsafeDiscardStringContext (readFile ./config.json));

      # TODO: Enable this when you add the other shells 
      enableBashIntegration = false;
      enableZshIntegration = false;
      enableNushellIntegration = shellsCfg.nushell.enable;
    };
  };
}
