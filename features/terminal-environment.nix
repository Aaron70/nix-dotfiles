{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  config = { ... }: {};
in
{ imports = [(mkModule { path = [ "features" ]; name = "terminal-environment"; inherit config options; })]; }
