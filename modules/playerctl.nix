{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "playerctl"; 
      options = {};
      commonConfig = {};
      nixosConfig = {}; 
      homeConfig = {
        home.packages = with pkgs; [ playerctl ];
      };
    })
  ];
}
