{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "gcp"; 
      options = {};
      commonConfig = {};
      nixosConfig = {}; 
      homeConfig = {
        home.packages = with pkgs; [
          google-cloud-sdk
        ];
      };
    })
  ];
}
