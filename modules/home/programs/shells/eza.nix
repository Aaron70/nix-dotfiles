{ lib, config, ... }:

with lib;
let
  cfg = config.programs.home.eza;
in
{

  options.programs.home.eza = {
    enable = mkOption {
      description = "Whether to enable the eza program.";
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    programs.eza = {
      enable = true;
      icons = "auto";
      git = config.programs.home.git.integrations;


      enableBashIntegration = config.programs.bash.enable;
      enableZshIntegration = config.programs.zsh.enable;
      enableNushellIntegration = config.programs.nushell.enable;
    };
  };
}
