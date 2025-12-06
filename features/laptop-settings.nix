{ mylib, lib, ... }: 
with mylib; with lib;
let
  options = {};
  commonConfig = {
    dotfiles.features.power-management.enable = true;
  };
  homeConfig = commonConfig;
  nixosConfig = commonConfig // {
    services.logind.settings.Login = {
      HandleLidSwitch = "suspend-then-hibernate";
      HandleLidSwitchExternalPower = "lock";
      HandleLidSwitchDocked = "ignore";
    };
    
    # one of "ignore", "poweroff", "reboot", "halt", "kexec", "suspend", "hibernate", "hybrid-sleep", "suspend-then-hibernate", "lock"
  };
in
{ imports = [(mkModule { path = [ "features" ]; name = "laptop-settings"; inherit nixosConfig homeConfig options; })]; }
