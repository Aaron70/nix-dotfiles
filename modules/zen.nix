{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {};
  homeConfig = { ... }: {
    programs.zen-browser = {
      enable = true;
      policies = {
        DisableAppUpdate = false;
        DisableTelemetry = true;
      };
    };
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "zen"; inherit nixosConfig homeConfig options; })]; }
