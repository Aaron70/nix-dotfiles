{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {
    services.gvfs.enable = true;
  };
  homeConfig = { ... }: { 
    home.packages = with pkgs; [
       spotify
    ];
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "spotify"; inherit nixosConfig homeConfig options; })]; }
