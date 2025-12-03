{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {
    virtualisation.docker = {
      enable = true;
      autoPrune = {
        enable = true;
      };
    };
  };
  homeConfig = { ... }: {
    programs.lazydocker =  {
      enable = true;
    };
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "docker"; inherit nixosConfig homeConfig options; })]; }
