{ lib, config, ... }:

let
  cfg = config.services.nixos.spotify;
in
  with lib;
{
  options.services.nixos.spotify = {
    enable = mkEnableOption "Whether to enable Spotify service for art download. Used by the seashell widget.";
  };

  config = mkIf cfg.enable {
    services.gvfs.enable = true;
  };
}
