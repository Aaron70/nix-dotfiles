{ config, ... }:

let
  profile = config.profile;
in
{
  imports = [ ./properties.nix ];

  features.home.development.enable = profile.variables.development;
  programs.home.ags.enable = true;

  programs.home.zen.enable = true;

  programs.home.hyprland.enable = true;
  programs.home.waybar.enable = true;
  programs.home.wofi.enable = true;

  services.home.stylix.enable = profile.variables.stylix;
  programs.home.oh-my-posh.variant = "stylix";
  programs.home.tmux.variant = "stylix";
  programs.home.tmux.extraSearchPaths = "~/personal/dev:3";

  home.sessionVariables = {
    CD_FZF_EXTRA_PATHS="${config.home.homeDirectory}/personal:5";
  };
}
