{ lib, config, ... }:

let
  cfg = config.nixosServices.docker;
in
  with lib;
{
  options.nixosServices.docker = {
    enable = mkEnableOption "Whether to enable Docker";
  };


  config = mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
    };
  };
}
