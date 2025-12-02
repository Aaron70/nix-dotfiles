{ mylib, lib, config, ... }: 
with mylib; with lib;
let
  options = {};
  homeConfig = { config, ... }: {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = config.programs.zsh.enable;
      installVimSyntax = true;

      settings = {
        command = config.dotfiles.profile.shell.name;
      };
    };
  };
in
{ imports = [(mkModule { enable = true; path = [ "modules" ]; name = "ghostty"; inherit homeConfig options; })]; }
