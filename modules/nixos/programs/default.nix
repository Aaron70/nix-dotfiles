{ myLib, pkgs, ... }:

{
  imports = myLib.importAll ./. "default.nix";

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  nixosPrograms = { 
    windowManagers.hyprland.enable = true;
  };
}
