{ lib, config, ... }:

let
  cfg = config.programs.home.zoxide;
in
  with lib;
{
  options.programs.home.zoxide = {
    enable = mkOption {
      description = "Whether to enable the zoxide program.";
      type = types.bool;
      default = true;
    };
  };


  config = mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableNushellIntegration = config.programs.home.nushell.enable;
      enableZshIntegration = config.programs.home.zsh.enable;
      enableBashIntegration = config.programs.home.bash.enable;
      options = [ "--cmd" "cd" ];
    };
  };
}
