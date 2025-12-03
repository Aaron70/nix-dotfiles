{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  commonConfig = {
    stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
      # image = ../../home/programs/window-managers/hyprland/config/wallpapers/wallhaven.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
      # targets = { waybar.enable = false; };
      targets = {
        zen-browser.profileNames = [ "aaronv" ];
      };
    };
  };
  nixosConfig = commonConfig;
  homeConfig = commonConfig; 
in
{ imports = [(mkModule { enable = true; path = [ "modules" ]; name = "stylix"; inherit nixosConfig homeConfig options; })]; }
