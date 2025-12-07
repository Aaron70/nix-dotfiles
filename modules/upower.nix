{ mylib, lib, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule {
      enable = true; 
      path = [ "modules" ]; 
      name = "upower"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        services.upower = {
          enable = true;
        };
      };
      homeConfig = {}; 
    })
  ];
}
