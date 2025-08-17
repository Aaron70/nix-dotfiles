{ lib, config, ... }: 

with lib;
let 
  cfg = config.features.nixos.development;
in
{
  options.features.nixos.development = {
    enable = mkEnableOption "Whether to enable common programs, services or configurations related to Softawre Development.";
  };


  config = mkIf cfg.enable {
    services.nixos.docker.enable = true;
  };
}
