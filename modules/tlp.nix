{ mylib, lib, ... }: 
with mylib; with lib;
let
in
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "tlp"; 
      options = {
        MaxChargeTreshold = mkOption {
          type = types.number;
          default = 85;
          description = "The upper bound threshold to charge the battery";
        };
        MinChargeTreshold = mkOption {
          type = types.number;
          default = 75;
          description = "The lower bound threshold to charge the battery";
        };
      };
      commonConfig = {};
      nixosConfig = { cfg, ... }: {
        services.power-profiles-daemon.enable = false; # Disable GNOMEs power management
        services.tlp = {
          enable = true; # Enable TLP (better than gnomes internal power manager)
          settings = {
            CPU_BOOST_ON_AC = 1;
            CPU_BOOST_ON_BAT = 1;
            CPU_HWP_DYN_BOOST_ON_AC = 1;
            CPU_HWP_DYN_BOOST_ON_BAT = 1;
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
            CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
            PLATFORM_PROFILE_ON_AC = "performance";
            PLATFORM_PROFILE_ON_BAT = "balanced";
            START_CHARGE_THRESH_BAT0 = cfg.MinChargeTreshold;
            STOP_CHARGE_THRESH_BAT0 = cfg.MaxChargeTreshold;
          };
        };
      };
      homeConfig = {};
    })
  ];
}
