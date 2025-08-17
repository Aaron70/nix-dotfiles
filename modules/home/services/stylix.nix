{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.services.home.stylix;
in
{
  options.services.home.stylix = {
    enable = mkEnableOption "Whether to enable stylix.";
  };

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
      # image = ../../home/programs/window-managers/hyprland/config/wallpapers/wallhaven.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

      targets = { waybar.enable = false; };
    };
  };
}
