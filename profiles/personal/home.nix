{ ... }:

{
  imports = [ ./properties.nix ];

  features.home.development.enable = true;

  programs.home.zen.enable = true;

  programs.home.hyprland.enable = true;
  programs.home.waybar.enable = true;
}
