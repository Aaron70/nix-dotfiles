{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
  };
  homeConfig = { ... }: {};
in
{ imports = [(mkModule { path = [ "modules" ]; name = "gdm"; inherit nixosConfig homeConfig options; })]; }
