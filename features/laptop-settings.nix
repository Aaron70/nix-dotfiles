{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "features" ]; 
      name = "laptop-settings"; 
      options = {};
      commonConfig = {
        dotfiles.features.power-management.enable = true;
      };
      homeConfig = {};
      nixosConfig = {
        environment.systemPackages = with pkgs; [
          brightnessctl
        ];
        services.logind.settings.Login = {
          HandleLidSwitch = "suspend-then-hibernate";
          HandleLidSwitchExternalPower = "lock";
          HandleLidSwitchDocked = "ignore";
        };
        # one of "ignore", "poweroff", "reboot", "halt", "kexec", "suspend", "hibernate", "hybrid-sleep", "suspend-then-hibernate", "lock"
      };
    })
  ];
}
