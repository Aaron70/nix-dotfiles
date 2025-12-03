{ mylib, lib, config, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {};
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
{ imports = [(mkModule { enable = config.dotfiles.profile.terminal.name == "ghostty"; path = [ "modules" ]; name = "ghostty"; inherit nixosConfig homeConfig options; })]; }
