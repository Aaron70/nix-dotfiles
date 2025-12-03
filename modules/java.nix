{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {}; 
  homeConfig = { ... }: {
    programs.java.enable = true;
    programs.gradle.enable = true;
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "java"; inherit nixosConfig homeConfig options; })]; }
