{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {}; 
  homeConfig = { ... }: {
    home.packages = with pkgs; [ nodejs ];
    programs.bun.enable = true;
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "javascript"; inherit nixosConfig homeConfig options; })]; }
