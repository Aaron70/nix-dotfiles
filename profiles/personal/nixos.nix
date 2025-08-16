{ ... }:

{
  imports = [ ./properties.nix ];


  features.nixos.boot.enable = true;
  features.nixos.boot.configurationLimit = 7;

  programs.nixos.hyprland.enable = true;
}
