{ mylib, lib, config, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule {
      enable = true; 
      path = [ "modules" ]; 
      name = "zoxide"; 
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
        programs.zoxide = {
          enable = true;
          enableNushellIntegration = config.programs.nushell.enable;
          enableZshIntegration = config.programs.zsh.enable;
          enableBashIntegration = config.programs.bash.enable;
          options = [ "--cmd" "cd" ];
        };
      };
    })
  ];
}
