{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule {
      enable = true; 
      path = [ "modules" ]; 
      name = "stylix"; 
      options = {};
      commonConfig = {
        stylix = {
          enable = true;
          autoEnable = true;
          polarity = "dark";
          # image = ../../home/programs/window-managers/hyprland/config/wallpapers/wallhaven.jpg;
          base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
          # targets = { waybar.enable = false; };
        };
      };
      nixosConfig = {};
      homeConfig = {}; 
    })
  ];
}
