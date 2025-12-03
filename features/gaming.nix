{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  commonConfig = {
    dotfiles.modules.video-graphics.enable = true;
    dotfiles.modules.steam.enable = true;
  };
  homeConfig = commonConfig;
  nixosConfig = commonConfig;
in
{ imports = [(mkModule { path = [ "features" ]; name = "gaming"; inherit nixosConfig homeConfig options; })]; }
