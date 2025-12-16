{ mylib, lib, pkgs, ... }: 
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
      nixosConfig = {
        environment.systemPackages =  with pkgs; [
          (heroic.override {
            extraPkgs = pkgs: [
              pkgs.gamescope
            ];
          })
        ];
      };
    })
  ];
}
