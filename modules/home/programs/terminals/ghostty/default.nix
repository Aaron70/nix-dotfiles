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

  config = mkIf (profile.withGUI && cfg.enable) {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = config.programs.zsh.enable;
      installVimSyntax = true;

      settings = {
        command = config.profile.shell.name;
      };
    };
  };
}
