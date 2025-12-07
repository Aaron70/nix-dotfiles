{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "xdg-portal"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        xdg.portal = {
          enable = true;
          xdgOpenUsePortal = true;
          extraPortals = [pkgs.xdg-desktop-portal-gtk];
          configPackages = [pkgs.xdg-desktop-portal-gtk];
          config.common.default = "gtk";
        };  
      };
      homeConfig = {};
    })
  ];
}
