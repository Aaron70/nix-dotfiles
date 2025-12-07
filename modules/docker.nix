{ mylib, lib, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "docker"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        virtualisation.docker = {
          enable = true;
          autoPrune = {
            enable = true;
          };
        };
      };
      homeConfig = {
        programs.lazydocker =  {
          enable = true;
        };
      };
    })
  ];
}
