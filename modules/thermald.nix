{ mylib, lib, ... }: 
with mylib; with lib;
let
in
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "thermald"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        # Helps to proactively prevent overheating
        services.thermald.enable = true;
      };
      homeConfig = {};
    })
  ];
}
