{ mylib, lib, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "java"; 
      options = {};
      commonConfig = {};
      nixosConfig = {}; 
      homeConfig = {
        programs.java.enable = true;
        programs.gradle.enable = true;
      };
    })
  ];
}
