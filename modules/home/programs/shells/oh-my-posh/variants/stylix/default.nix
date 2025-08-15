{ ... }:

{}
# { lib, config, ... }:
#
# let
#   cfg = config.programs.home.oh-my-posh;
#   colors = config.lib.stylix.colors;
# in
#   with lib;
# {
#
#   config = mkIf (cfg.enable && cfg.variant == "stylix") {
#
#     assertions = [
#       {
#         assertions = config.services.nixos ? stylix && config.services.nixos.stylix.enable;
#         message = "This oh-my-posh variant requires stylix to be enabled.";
#       }
#     ];
#
#     programs.oh-my-posh = {
#       enable = true;
#
#       settings = with builtins; fromJSON (unsafeDiscardStringContext (import ./config.nix { inherit colors; }));
#
#       enableBashIntegration = config.programs.bash.enable;
#       enableZshIntegration = config.programs.zsh.enable;
#       enableNushellIntegration = config.programs.nushell.enable;
#     };
#   };
# }
