{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {}; 
  homeConfig = { ... }: {
    home.packages = with pkgs; [
      google-cloud-sdk
    ];
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "gcp"; inherit nixosConfig homeConfig options; })]; }
