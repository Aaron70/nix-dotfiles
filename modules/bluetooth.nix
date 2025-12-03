{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {
    services.blueman.enable = true;

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
  homeConfig = { ... }: {};
in
{ imports = [(mkModule { path = [ "modules" ]; name = "bluetooth"; inherit nixosConfig homeConfig options; })]; }
