{ mylib, lib, config, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {};
  homeConfig = { ... }: {
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

        ${if config.programs.tmux.enable then "start-session" else ""}
      '';

      oh-my-zsh = {
        enable = true;
      };
    };
  };
in
{ imports = [(mkModule { enable = config.dotfiles.profile.shell.name == "zsh"; path = [ "modules" ]; name = "zsh"; inherit nixosConfig homeConfig options; })]; }
