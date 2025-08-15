{ lib, config, ... }:

with lib;
let 
  profile = config.profile;
  cfg = config.programs.home.zsh;
in
{
  options.programs.home.zsh = {
    enable = mkEnableOption "Whether to enable the Zsh terminal.";
  };

  config = mkIf (cfg.enable || profile.shell.name == "zsh") {
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

        start-session
      '';

      oh-my-zsh = {
        enable = true;
      };
    };
  };
}
