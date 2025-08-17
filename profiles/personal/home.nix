{ config, ... }:

let
  profile = config.profile;
in
{
  imports = [ ./properties.nix ];

  features.home.development.enable = profile.variables.development;

  programs.home.zen.enable = true;

  programs.home.hyprland.enable = true;
  programs.home.waybar.enable = true;
  programs.home.wofi.enable = true;
}
