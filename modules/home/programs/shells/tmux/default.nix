{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.programs.home.tmux;
in
{
  imports = [ ./variants ];    

  options.programs.home.tmux = {
    enable = mkEnableOption "Whether to enable the tmux.";
    variant = mkOption {
      description = "The name of the variant to use its configuration.";
      type = types.str;
      default = "default";
    };
    extraSearchPaths = mkOption {
      description = "The list of paths to add to the tmux-sessionizer script.";
      type = types.str;
      default = "";
    };
  };

  config = mkIf cfg.enable  {
    home.packages = [
      (pkgs.writeShellScriptBin "tmux-sessionizer" (lib.readFile ./tmux-sessionizer.sh))
      (pkgs.writeShellScriptBin "start-session" (lib.readFile ./start-session.sh))
    ];
    xdg.configFile."tmux-sessionizer/tmux-sessionizer.conf".text = import ./tmux-sessionizer.nix { inherit config; };
  };
}
