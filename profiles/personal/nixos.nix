{ config, ... }:

let
  profile = config.profile;
in
{
  imports = [ ./properties.nix ];

  features.nixos.gaming.enable = true;

  features.nixos.development.enable = profile.variables.development;

  features.nixos.bluetooth.enable = true;
  features.nixos.boot.enable = true;
  features.nixos.boot.configurationLimit = 7;

  programs.nixos.godot.enable = true;

  programs.nixos.hyprland.enable = true;

  services.nixos.spotify.enable = profile.variables.spotify;

  services.nixos.stylix.enable = profile.variables.stylix;
}
