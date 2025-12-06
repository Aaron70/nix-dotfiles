{ mylib, lib, ... }: 
with mylib; with lib;
let
  in
{ 
  imports = [
    (mkModule { 
      path = [ "features" ]; 
      name = "gaming"; 
      options = {};
      commonConfig = {
        dotfiles.modules.video-graphics.enable = true;
        dotfiles.modules.steam.enable = true;
      };
      homeConfig = {};
      nixosConfig = {};
    })
  ];
}
