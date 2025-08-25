{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.nixos.steam; 
in
{
  options.programs.nixos.steam = {
    enable = mkEnableOption "Whether to enable Steam.";
  };

  config = mkIf (config.profile.withGUI && cfg.enable) {
    programs.steam = {
      enable = true; 
      gamescopeSession.enable = true;
    };

    environment.systemPackages = with pkgs; [
      mangohud
      protonup
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
    };

    programs.gamemode.enable = true;
  };
}
