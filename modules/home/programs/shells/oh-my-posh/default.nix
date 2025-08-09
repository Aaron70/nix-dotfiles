{ lib, config, ... }:

let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.oh-my-posh;
  colors = config.lib.stylix.colors;
in
  with lib;
{
  options.homePrograms.shells.oh-my-posh = {
    enable = mkOption {
      type = types.bool;
      # TODO: When add more supported shells, you must added here: 
      # Example: enable = shellsCfg.nushell.enable || shellsCfg.zsh.enable;
      default = shellsCfg.nushell.enable || shellsCfg.zsh.enable;
      description= "Whether to enable OhMyPosh";
    };
  };

  
  config = mkIf cfg.enable {
    programs.oh-my-posh = {
      enable = true;

      settings = with builtins; fromJSON (unsafeDiscardStringContext (import ./config.nix { inherit colors; }));

      # TODO: Enable this when you add the other shells 
      enableBashIntegration = false;
      enableZshIntegration = shellsCfg.zsh.enable;
      enableNushellIntegration = shellsCfg.nushell.enable;
    };
  };
}
