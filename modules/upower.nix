{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {
    services.upower = {
      enable = true;
    };
  };
  homeConfig = { ... }: {}; 
in
{ imports = [(mkModule { enable = true; path = [ "modules" ]; name = "upower"; inherit nixosConfig homeConfig options; })]; }
