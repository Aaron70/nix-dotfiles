{ lib, config, ... }:

with lib;
let 
  cfg = config.features.nixos.boot;
in
{
  options.features.nixos.boot = {
    enable = mkEnableOption "Whether to enable boot configurations.";
    configurationLimit = mkOption {
      type = types.int;
      description = "The maximum number of boot entries to be shown.";
      default = 7;
    };
  };

  config = mkIf cfg.enable {
    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = cfg.configurationLimit;
    };
    boot.loader.efi.canTouchEfiVariables = true;  
  };
}
