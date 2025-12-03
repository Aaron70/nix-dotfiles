{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {}; 
  homeConfig = { ... }: {
    home.packages = with pkgs; [
      terraform
    ];
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "terraform"; inherit nixosConfig homeConfig options; })]; }
