{ lib, config, pkgs, ... }:

with lib;
let 
  cfg = config.programs.home.gcp;
in
{
  options.programs.home.gcp = {
    enable = mkEnableOption "Whether to enable the Google Cloud SDK.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      google-cloud-sdk
    ];
  };
}
