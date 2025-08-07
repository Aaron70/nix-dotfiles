{ ... }:
{
  imports = [ 
    ./hardware-configuration.nix
    ../bluetooth.nix
  ];

  # ====================|Bootloader|====================
  boot.loader.systemd-boot = {
    enable = true;
    # Custom entry for windows in the boot menu
    # windows."Windows" = {
    #   efiDeviceHandle = "FS0";
    #   title = "Windows 11";
    #   sortKey = "0_windows";
    # };
    configurationLimit = 7;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  # ====================|Bootloader|====================



  source-persisted-configs.enable = true; 
}
