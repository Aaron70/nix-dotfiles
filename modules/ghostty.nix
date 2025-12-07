{ mylib, lib, config, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule {
      enable = config.dotfiles.profile.terminal.name == "ghostty"; 
      path = [ "modules" ]; 
      name = "ghostty"; 
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
        programs.ghostty = {
          enable = true;
          enableZshIntegration = config.programs.zsh.enable;
          installVimSyntax = true;
          systemd.enable = true;
          settings = {
            command = config.dotfiles.profile.shell.name;
            confirm-close-surface = false;
          };
        };
      };
    })
  ];
}
