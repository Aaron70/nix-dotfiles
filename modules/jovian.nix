{ mylib, lib, config, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "jovian"; 
      options = {};
      commonConfig = {};
      nixosConfig = {
        jovian = {
          # devices.gpd-win-max-2.enable = true;
          
          steam = {
            enable = true;
            autoStart = false;  # Start Steam in Big Picture mode at boot
            user = config.dotfiles.profile.user.username;
            desktopSession = "gamescope";
          };
        };
      };
      homeConfig = { };
    })
  ];
}
