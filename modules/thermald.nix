{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {
    # Helps to proactively prevent overheating
    services.thermald.enable = true;
  };
  homeConfig = { ... }: {};
in
{ imports = [(mkModule { path = [ "modules" ]; name = "thermald"; inherit nixosConfig homeConfig options; })]; }
