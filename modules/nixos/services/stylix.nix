{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.services.nixos.stylix;
in
{
  options.services.nixos.stylix = {
    enable = mkEnableOption "Whether to enable the stylix service.";
  };

  config = mkIf cfg.enable {
    stylix = {
        enable = true;
        autoEnable = true;
        polarity = "dark";
        # image = ../../home/programs/window-managers/hyprland/config/wallpapers/wallhaven.jpg;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
        # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
    };
  };
}
