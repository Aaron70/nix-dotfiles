{ mylib, lib, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "bluetooth"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
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
      homeConfig = {};
    })
  ];
}
