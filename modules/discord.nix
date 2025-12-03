{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {};
  homeConfig = { ... }: {
    programs.discord.enable = true;
  };
in
{ imports = [(mkModule { path = [ "modules" ]; name = "discord"; inherit nixosConfig homeConfig options; })]; }
