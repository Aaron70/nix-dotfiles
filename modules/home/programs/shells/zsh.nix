{ config, lib, pkgs, ... }:

let
  shellsCfg = config.homePrograms.shells; 
  cfg = shellsCfg.zsh;
  inherit (config.lib.stylix) colors;
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

      syntaxHighlighting = {
        enable = true;

        highlighters = [ "main" ];
        styles = {
          unknown-token="fg=#F26A6A";
        };
      };

      initContent = ''
        # auto-suggestions
        bindkey '^Y' autosuggest-accept
      '';

      oh-my-zsh = {
        enable = true;
      };
    };
  };
}
