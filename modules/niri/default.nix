{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "niri"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        programs.niri.enable = true;
        environment.systemPackages = [
          pkgs.xwayland-satellite
        ];
      };
      homeConfig = { ... }@inputs: { 
        xdg.configFile."niri/config.kdl".text = import ./config.nix inputs;
        home.packages = [
         pkgs.fuzzel # Default program to search for applications. Similar to wofi.
        ];
      };
    })
  ];
}
