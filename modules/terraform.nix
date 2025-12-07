{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "terraform"; 
      options = {};
      commonConfig = {};
      nixosConfig = {}; 
      homeConfig = {
        home.packages = with pkgs; [
          terraform
        ];
      };
    })
  ];
}
