{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {
    environment.systemPackages = with pkgs; [
      godot
    ];
  };
  homeConfig = { ... }: {};
in
{ imports = [(mkModule { path = [ "modules" ]; name = "godot"; inherit nixosConfig homeConfig options; })]; }
