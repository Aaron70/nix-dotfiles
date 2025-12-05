{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  commonConfig = {
    dotfiles.modules.thermald.enable = true;
    dotfiles.modules.power-profiles-daemon.enable = true;
  };
  homeConfig = commonConfig;
  nixosConfig = commonConfig;
in
{ imports = [(mkModule { path = [ "features" ]; name = "laptop-settings"; inherit nixosConfig homeConfig options; })]; }
