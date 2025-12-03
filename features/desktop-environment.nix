{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  commonConfig = {
    dotfiles.modules.gdm.enable = true;
    dotfiles.modules.niri.enable = true;
  };
  homeConfig = commonConfig;
  nixosConfig = commonConfig;
in
{ imports = [(mkModule { path = [ "features" ]; name = "desktop-environment"; inherit nixosConfig homeConfig options; })]; }
