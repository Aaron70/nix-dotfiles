{ myLib, pkgs, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
      # image = ../../home/programs/window-managers/hyprland/config/wallpapers/wallhaven.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
  };

  nixosPrograms = { 
    windowManagers.hyprland.enable = true;
  };
}
