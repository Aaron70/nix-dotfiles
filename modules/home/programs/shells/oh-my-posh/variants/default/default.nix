{ lib, config, ... }:

let
  cfg = config.programs.home.oh-my-posh;
  colors = {
    base0A = "FFFFFF";
    base0F = "FFFFFF";
    base0E = "FFFFFF";
  };
in
  with lib;
{

  config = mkIf (cfg.enable && cfg.variant == "default") {
    programs.oh-my-posh = {
      enable = true;

      settings = with builtins; fromJSON (unsafeDiscardStringContext (import ./config.nix { inherit colors; }));

      enableBashIntegration = config.programs.bash.enable;
      enableZshIntegration = config.programs.zsh.enable;
      enableNushellIntegration = config.programs.nushell.enable;
    };
  };
}
