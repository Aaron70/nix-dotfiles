{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {
    programs.niri.enable = true;
    environment.systemPackages = [
      pkgs.xwayland-satellite
    ];
  };
  homeConfig = { ... }: { 
    xdg.configFile."niri/config.kdl".text = lib.readFile ./config.kdl;
    home.packages = [
     pkgs.fuzzel # Default program to search for applications. Similar to wofi.
    ];
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "niri"; inherit nixosConfig homeConfig options; })]; }
