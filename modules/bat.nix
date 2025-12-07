{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{
  imports = [ 
    (mkModule {
      name = "modules";
      path = [ "bat" ];
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = {
        home.packages = with pkgs; [ bat ];
        home.shellAliases = {
          cat = "bat";
        };
      };
    })
  ];
}
