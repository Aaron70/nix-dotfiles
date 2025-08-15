{ lib, config, ... }:

with lib;
{
  options.features.boot = {
    enable = mkEnableOption "Whether to enable boot configurations.";
    configurationLimit = mkOption {
      type = types.int;
      description = "The maximum number of boot entries to be shown.";
      default = 7;
    };
  };

  config = mkIf config.features.boot.enable {
    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = 7;
    };
    boot.loader.efi.canTouchEfiVariables = true;  
  };
}
