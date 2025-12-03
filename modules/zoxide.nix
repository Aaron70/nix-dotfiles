{ mylib, lib, config, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {};
  homeConfig = { ... }: {
    programs.zoxide = {
      enable = true;
      enableNushellIntegration = config.programs.nushell.enable;
      enableZshIntegration = config.programs.zsh.enable;
      enableBashIntegration = config.programs.bash.enable;
      options = [ "--cmd" "cd" ];
    };
  };
in
{ imports = [(mkModule { enable = true; path = [ "modules" ]; name = "zoxide"; inherit nixosConfig homeConfig options; })]; }
