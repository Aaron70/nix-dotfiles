{ pkgs, ... }: 

{
  services.blueman.enable = true; # GUI

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
}
