{ lib, config, ... }:

let
  cfg = config.services.nixos.docker;
in
  with lib;
{
  options.services.nixos.docker = {
    enable = mkEnableOption "Whether to enable Docker";
  };


  config = mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
    };
  };
}
