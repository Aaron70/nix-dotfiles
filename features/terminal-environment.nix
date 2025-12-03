{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  homeConfig = { ... }: {};
  nixosConfig = { ... }: {};
in
{ imports = [(mkModule { path = [ "features" ]; name = "terminal-environment"; inherit nixosConfig homeConfig options; })]; }
