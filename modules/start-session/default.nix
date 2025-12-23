{ mylib, lib, pkgs, config, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      enable = config.programs.tmux.enable || config.programs.zellij.enable; 
      path = [ "modules" ]; 
      name = "start-session"; 
      options = {};
      commonConfig = {};
      nixosConfig = {}; 
      homeConfig = {
        home.packages = with pkgs; [
          (writeShellScriptBin "start-session" (lib.readFile ./scripts/start-session.sh))
        ];
      };
    })
  ];
}
