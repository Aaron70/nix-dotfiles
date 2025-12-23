{ mylib, lib, ... }: 

with mylib; with lib;
{
  imports = [ 
    (mkModule {
      enable = true;
      name = "garbage-collector";
      options = {};
      commonConfig = {
        nix.gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 15d";
          persistent = true;
        };
        nix.settings.auto-optimise-store = true;
      };
      homeConfig = {};
      nixosConfig = {};
    })
  ];
}
