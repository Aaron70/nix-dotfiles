{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{
  imports = [ 
    (mkModule {
      name = "common";
      path = [ "home" ];
      options = {};
      commonConfig = {};
      nixosConfig = {};
      homeConfig = { dotfilesCfg, ... }: {
        home.username = dotfilesCfg.profile.user.username;
        home.homeDirectory = "/home/${dotfilesCfg.profile.user.username}";

        nixpkgs.config.allowUnfree = true;
        nixpkgs.config.allowBroken = true;

        home.packages = with pkgs; [
          # Fonts 
          nerd-fonts.jetbrains-mono
          openmoji-color
          # Packages
          gcc
        ];

        programs.home-manager.enable = true;
        home.stateVersion = dotfilesCfg.profile.version;
      };
    })
  ];
}
