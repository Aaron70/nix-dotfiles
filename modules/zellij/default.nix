{ mylib, lib, config, pkgs, ... }@inputs: 
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
        xdg.configFile."zellij/config.kdl".text = import ./config.nix inputs;
        programs.zellij = {
          enable = true;

          enableFishIntegration = config.programs.fish.enable;
          enableBashIntegration = config.programs.bash.enable;
          enableZshIntegration = !config.dotfiles.modules.tmux.enable && config.programs.zsh.enable;

          attachExistingSession = false;
        };
      };
    })
  ];
}
