{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "spotify"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        services.gvfs.enable = true;
      };
      homeConfig = { 
        home.packages = with pkgs; [
           spotify
        ];
      };
    })
  ];
}
