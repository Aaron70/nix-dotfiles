{ mylib, lib, config, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule {
      enable = config.dotfiles.profile.shell.name == "zsh";  
      path = [ "modules" ]; 
      name = "zsh"; 
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
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
    })
  ];
}
