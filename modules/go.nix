{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {}; 
  homeConfig = { ... }: {
    programs.go.enable = true;

    home.packages = [
      pkgs.goperf
    ];

    home.sessionVariables = {
      PATH = "~/go/bin:$PATH";
      CGO_ENABLED = 1;
    };
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "go"; inherit nixosConfig homeConfig options; })]; }
