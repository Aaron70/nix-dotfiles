{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  commonConfig = {
    dotfiles.features.terminal-environment.enable = true;
  };
  homeConfig = commonConfig;
  nixosConfig = commonConfig;
in
{ imports = [(mkModule { path = [ "features" ]; name = "development"; inherit nixosConfig homeConfig options; })]; }
