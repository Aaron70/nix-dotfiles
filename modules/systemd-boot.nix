{ mylib, lib, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "systemd-boot"; 
      options = {
        configurationLimit = mkOption {
          type = types.number;
          description = "The limit of generations to show";
          default = 7;
        };
      };
      commonConfig = {};
      nixosConfig = { cfg, ... }: {
        boot.loader.systemd-boot = {
          enable = mkDefault true;
          configurationLimit = mkDefault cfg.configurationLimit;
        };
        boot.loader.efi.canTouchEfiVariables = true;
      };
      homeConfig = {};
    })
  ];
}
