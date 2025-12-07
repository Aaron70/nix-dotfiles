{ mylib, lib, ... }: 
with mylib; with lib;
let
in
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "gdm"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        services.displayManager.gdm.enable = true;
      };
      homeConfig = {};

    })
  ];
}
