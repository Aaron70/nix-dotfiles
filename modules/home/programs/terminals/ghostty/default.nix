{ lib, config, ... }:

with lib;
let
  profile = config.profile;
  cfg = config.programs.home.ghostty;
  hasZsh = config.programs.home ? zhs && config.programs.home.zsh.enable;
in
{
  options.programs.home.ghostty = {
    enable = mkEnableOption "Whether to enable the Ghostty terminal.";
  };

  config = mkIf (profile.withGUI && (cfg.enable || profile.terminal.name == "ghostty")) {
    programs.home.ghostty.enable = true;
    programs.ghostty = {
      enable = true;
      enableZshIntegration = hasZsh;
    };
  };
}
