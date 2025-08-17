{ config, lib, ... }:

with lib;
let
  profile = config.profile;
in
{
  imports = [ ./properties.nix ];

  features.home.development.enable = profile.variables.development;

  programs.home.zen.enable = true;

  programs.home.ghostty.enable = mkForce false; # In darwin is marked as broken

  services.home.stylix.enable = profile.variables.stylix;
  programs.home.oh-my-posh.variant = "stylix";
  programs.home.tmux.variant = "stylix";
}
