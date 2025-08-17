{ config, ... }:

let
  profile = config.profile;
in
{
  imports = [ ./properties.nix ];

  features.nixos.development.enable = profile.variables.development;

  features.nixos.boot.enable = true;
  features.nixos.boot.configurationLimit = 7;

  programs.nixos.hyprland.enable = true;
}
