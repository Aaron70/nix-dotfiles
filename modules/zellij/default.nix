{ mylib, lib, config, pkgs, ... }: 
with mylib; with lib;
let
  colors = if (config.lib ? stylix) then config.lib.stylix.colors else { base00 = "FFFFFF"; };
in
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "zellij"; 
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
        programs.zellij = {
          enable = true;

          enableFishIntegration = config.programs.fish.enable;
          enableBashIntegration = config.programs.bash.enable;
          enableZshIntegration = config.programs.zsh.enable;

          attachExistingSession = true;
        };
      };
    })
  ];
}
