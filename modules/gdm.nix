{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {
    services.displayManager.gdm.enable = true;
  };
  homeConfig = { ... }: {};
in
{ imports = [(mkModule { path = [ "modules" ]; name = "gdm"; inherit nixosConfig homeConfig options; })]; }
