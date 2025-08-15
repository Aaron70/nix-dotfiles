{ lib, config, ... }:

with lib;
let
  cfg = config.programs.home.ghostty;
  hasZsh = config.programs.home ? zhs && config.programs.home.zsh.enable;
in
{
  options.programs.home.ghostty = {
    enable = mkEnableOption "Whether to enable the Ghostty terminal.";
  };

  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = hasZsh;
    };
  };
}
