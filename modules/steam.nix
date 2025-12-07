{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
in
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "steam"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        programs.steam = {
          enable = true; 
          gamescopeSession.enable = true;
        };

        environment.systemPackages = with pkgs; [
          mangohud
          protonup-ng
        ];

        environment.sessionVariables = {
          STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
        };

        programs.gamemode.enable = true;
      };
      homeConfig = {};

    })
  ];
}
