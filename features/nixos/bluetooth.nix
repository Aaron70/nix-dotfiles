{ lib, config, ... }: 

with lib;
let
  cfg = config.features.nixos.bluetooth;
in
{
  options.features.nixos.bluetooth = {
    enable = mkEnableOption "Whether to enable bluetooth.";
  };

  config = mkIf cfg.enable {
    services.blueman.enable = config.profile.withGUI;

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
  };
}
