{ lib, config, ... }:

with lib;
let
  profile = config.profile;
  cfg = config.programs.home.ghostty;
in
{
  options.programs.home.ghostty = {
    enable = mkEnableOption "Whether to enable the Ghostty terminal.";
  };

  config = mkIf (profile.withGUI && (cfg.enable || profile.terminal.name == "ghostty")) {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = config.programs.zsh.enable;

      settings = {
        command = config.profile.shell.name;
      };
    };
  };
}
