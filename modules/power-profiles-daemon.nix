{ mylib, lib, ... }: 
with mylib; with lib;
let
in
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "power-profiles-daemon"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        # A common tool used to save power on laptops is tlp, which has sensible defaults for most laptops.
        services.power-profiles-daemon.enable = true;
      };
      homeConfig = {};

    })
  ];
}
