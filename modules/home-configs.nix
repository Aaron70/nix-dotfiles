{ mylib, lib, pkgs, ... }: 

with mylib; with lib;
{
  imports = [ 
    (mkModule {
      name = "common";
      path = [ "home" ];
      options = {};
      homeConfig = { dotfilesCfg, ... }: {
        home.username = dotfilesCfg.profile.user.username;
        home.homeDirectory = "/home/${dotfilesCfg.profile.user.username}";

        home.packages = with pkgs; [
          spotify
          bat
          #Fonts 
          nerd-fonts.jetbrains-mono
          openmoji-color
          gcc
          playerctl
        ];

        home.shellAliases = {
          cat = "bat";
        };

        nixpkgs.config.allowUnfree = true;
        nixpkgs.config.allowBroken = true;

        programs.home-manager.enable = true;
        home.stateVersion = dotfilesCfg.profile.version;
      };
    })
  ];
}
