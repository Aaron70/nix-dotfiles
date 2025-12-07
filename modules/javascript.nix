{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "javascript"; 
      options = {};
      commonConfig = {};
      nixosConfig = {}; 
      homeConfig = {
        home.packages = with pkgs; [ nodejs ];
        programs.bun.enable = true;
      };
    })
  ];
}
