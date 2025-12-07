{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "cursor-theme"; 
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
        home.packages = with pkgs; [ rose-pine-cursor ];
        home.pointerCursor = {
          gtk.enable = true;
          x11.enable = true;
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePine-Linux";
          size = 25;
        };
      };
    })
  ];
}
