{ mylib, lib, config, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule {
      enable = true; 
      path = [ "modules" ]; 
      name = "eza"; 
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
        programs.eza = {
          enable = true;
          icons = "auto";
          git = config.dotfiles.modules.git.integrations;
          enableBashIntegration = config.programs.bash.enable;
          enableZshIntegration = config.programs.zsh.enable;
          enableNushellIntegration = config.programs.nushell.enable;
        };
      };
    })
  ];
}
