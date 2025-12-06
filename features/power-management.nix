{ mylib, lib, ... }: 
with mylib; with lib;
let

in
{ 
  imports = [
    (mkModule { 
      path = [ "features" ]; 
      name = "power-management"; 
      options = {};
      commonConfig = {
        dotfiles.modules.tlp.enable = true;
      };
      homeConfig = {}; 
      nixosConfig = {
        # Thanks to: DocBrown101
        # Configs from: https://discourse.nixos.org/t/what-is-the-best-option-for-power-management/63406/2
        powerManagement.powertop.enable = true; # enable powertop auto tuning on startup.

        services.system76-scheduler.settings.cfsProfiles.enable = true; # Better scheduling for CPU cycles - thanks System76!!!
        services.thermald.enable = true; # Enable thermald, the temperature management daemon. (only necessary if on Intel CPUs)
      };
    })
  ];
}
