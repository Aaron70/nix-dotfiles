{...}: {}
# { lib, config, ... }:
#
# with lib;
# let
#   cfg = config.programs.home.stylix;
# in
# {
#   options.programs.home.stylix = {
#     enable = mkEnableOption "Whether to enable stylix.";
#   };
#
#   config = mkIf cfg.enable {
#     stylix = {
#       targets = {
#         # waybar.enable = false;
#       };
#     };
#   };
# }
